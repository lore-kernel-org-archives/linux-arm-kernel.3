Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAF7C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB1mvrB4ocViz/EnCVmYJRgcL16/T9Vo+kOUUbX1PCg=; b=PES11mm3RoyXY4MedPgQp04pKd
	fj5GoZaLAnlv6kfAmRL9BH9GjY08yV+zva3p9wJLVn8phEJX7lZDKq36NHDoTtdXOaf1f/kRHjZ6W
	/aHbNQ8YenC0/sseQh/AnfYWVqFT7u5clakYmfToeL7dS6V4oV297nZkbKYGNXDspzHHlj4MyTTzL
	qNCIZwNGbgfs87mvxLzm0HdohqJKIgkueFvPxc/HxCKkP17HQsF0YS9SWPFkfWLBNyuZUOQfKtNKr
	kSWsCY2na+Vvmh7IbhEKd7+TqasuBWfvHmXiYpSU3xVY8ABRcoVm/sn+d0lo4BWSjEfC931UGLYzN
	Dij5noUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPKE-0000000GqYd-0GKr;
	Wed, 08 Jul 2026 10:16:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPK2-0000000GqIm-3cVu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:16:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69F371A0EDC;
	Wed,  8 Jul 2026 10:16:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BDB560337;
	Wed,  8 Jul 2026 10:16:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8D6411BC3444;
	Wed,  8 Jul 2026 12:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JB1mvrB4ocViz/EnCVmYJRgcL16/T9Vo+kOUUbX1PCg=;
	b=fCCX0GF3r1atAKNjkeDxYhPkvTp4z6JKt4TZjsJOcQJyK5okRAK9IL6DWl6OKHJbPe2xI4
	84tSQxwVQE0Nf5tqjfdNq8qXiLKV5fkX+HHkF7rNDvbW+3hpAcbkL6tJSVa3VlFy9BaSuF
	NubOkb7KDVjiAOsP9OeJ7NzKKDiRj3CGwB3mtf2deObrTZJDUt9P8PAYJmAHZyGzMQJ5TZ
	uWb67cpLj/T0wd7PhSZ7bfr6J4Gk2NNqFLWH91Sb5MrEIEAkx4UtLoS16T/f/7rKe1ST9q
	C047imUXJysQgRdaY+mr0P3UJrKzPTV0BwKZ6k01XWPLPtQNx021H6kY3jR1uA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:20 +0200
Subject: [PATCH v2 07/10] soc: fsl: qe: Handle spurious interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-7-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=868;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=qbFN6lQM89HZuG6ugtMFVH17RNm7kdv+VUWhxlb5SqM=;
 b=CMymsLrV3UXKyTvV60x7YvEhpsjWIJ1kirNC7ZqeOCat6nLAC+rIa0j6VEaoXcz/jdt4F5K5y
 EQElAZoAj3fCtmTw31QAoskFB5cvotXopq6bGUSiCyqrNzHTNUfcKEn
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031607_116974_2509FEFC 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When no interrupt bits are set in the event register, call
handle_bad_irq() to account for the spurious interrupt before
exiting the cascade handler.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index bc8b68e5d1a9..29f4334db5a0 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -80,9 +80,15 @@ static void qepic_cascade(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	event = ioread32be(data->reg + CEPIER);
+	if (!event) {
+		handle_bad_irq(desc);
+		goto out;
+	}
+
 	for_each_set_bit(bit, &event, 32)
 		generic_handle_domain_irq(data->host, 31 - bit);
 
+out:
 	chained_irq_exit(chip, desc);
 }
 

-- 
2.55.0


