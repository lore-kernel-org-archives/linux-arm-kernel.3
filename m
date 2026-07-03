Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBE6C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PicZCkwsklXN0ONboTGqm4ynP8f37fEnTaMMPeq9K/A=; b=I/hOVMEeaVIicbWYS6vgO1yFik
	m2bz8IhxlW01Qqj30a+j2ljpwWwqsWt1gVVc271DW/tyy9AwgvfV3zF8FenLTadg3zxqEh3rKt/Oq
	z/Rnbg2ib5k6JFdIQJjWZ6opeHzSb9/d7e1VHpieQh4u6JET5UbcP1pbpQOCKedELiU9l5jPW0M9p
	AfHNWDuLIAyU8GQ0cpxxfdROASRfqpCb2NBOOB61flp3gItrPZHJOCs1MZlRUak1vD4mqKgKqLHQx
	hSyYK0l6LHrAI62+H1wsfYI8josU9+SEBfm+N/JF1SpccBFqyS2kkYTA1VEATMHXwMdOgGvipK4nC
	QL9oO3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdyl-000000075uO-0n2p;
	Fri, 03 Jul 2026 13:30:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdye-000000075lR-1uQd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:30:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 868DBC49F5F;
	Fri,  3 Jul 2026 13:30:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B600760300;
	Fri,  3 Jul 2026 13:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 507CD104C95A6;
	Fri,  3 Jul 2026 15:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PicZCkwsklXN0ONboTGqm4ynP8f37fEnTaMMPeq9K/A=;
	b=cLU/0VDlQmsFHLwP9z53WZpW1FIHFoSql5sKKxv1wOwEqpskQjm7bjmc23mfY7vqTU3zZl
	ZYfBnxigCeZO7V0sPkF6/yVqeiA/pSrE3irTBBnFGCI8tOFxQMytKsBt2z9BBJL7Ifc3oJ
	RjWKL+9fCNRvF3lRnqW13uBZKMtGx+J16R9JSzDskJUoy56HXjNuINffWi8jvbsOxbAnFm
	7rgLt/yGuAuTZjJY4y/IVpYAScqo6F0HQAfMyHpUms8ih4OxrdNJ0l0IZVMvXMy+dkqsEL
	r1/LOrPIauOOhEfCDu7v/orZ/V2udBbctPYtian33WQVPqa6BzNoz53+uzH1DA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:15 +0200
Subject: [PATCH 07/12] soc: fsl: qe: Handle spurious interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-7-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
In-Reply-To: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=865;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=GK/kK8XvyJnCOp6vz8jBjn9EMBNybdfgy5x95pP3Kus=;
 b=VDBcjajqYHWq3dKjYVCVZd0ZABbny6CisoyUEYgZT1kOEyitshUxNq4S0WMOz6TD8veyDwpI3
 d45jQJ9sQDnAUaiA3GwthcRzuBb4+L9lBtxm0OOz+ITlgpCReL9kh0S
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_063044_697764_E20EC7AC 
X-CRM114-Status: UNSURE (   9.06  )
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
index 27b62f4e3afb..c8b73b0aa233 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -77,9 +77,15 @@ static void qepic_cascade(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	event = in_be32(data->reg + CEPIER);
+	if (!event) {
+		handle_bad_irq(desc);
+		goto out;
+	}
+
 	for_each_set_bit(bit, &event, 32)
 		generic_handle_domain_irq(data->host, 32 - bit);
 
+out:
 	chained_irq_exit(chip, desc);
 }
 

-- 
2.55.0


