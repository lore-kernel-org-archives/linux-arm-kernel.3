Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5B9D7237B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I23DJBulHpzqgAw0h9OUkWIRLOPUsnKkbol9Lbu8HEU=; b=B2vbjPKEoILJmh//Z6wMCRLHDm
	oNs02qJXl3WmxGnxhbUyglr2vhZtS5vDDlkgvNpuslNMhF7r6lJZiUg7PuhuIJwuIh3pZFBJUItWt
	Z5qr1Vh0qn6cqr6v+93ET1v0jPTgsdLj5dBkBzEU8I7l9vKhJuxANTQbsPL797lEyXvmuaf1iZbg+
	8yY7BukF930n3a51jTA9VGPpSK4PbehLeHeL9eIMtp5temcZHgYMotImfZ83KwxwYhHh0ZcQZDFW5
	4s5uqzDwiteevM1f48EzeRXtmQ2hGqaFdQU0YFMu0EAxWX/KJ9d4kBA0aGVROzD1eQHcB8bm2RqTl
	UBb8n76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTh-00000008rAI-1cBD;
	Fri, 23 Jan 2026 11:37:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFTc-00000008r8H-3PoF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:37:22 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I23DJBulHpzqgAw0h9OUkWIRLOPUsnKkbol9Lbu8HEU=;
	b=e9sCCxnqqjeoO4DxK090wj83SyzN4cbjLqFK2qtREIZJHFh0ahBUeABPtVMuGQx11wT1TB
	//SA/A7LlUYmtmEANfOTWL2hVsJjMyjUFaw0TzamdUagQn/LqUjOkaSQKealVDz9o9dSJ3
	oWKU8q11QrMToy2BR5jAifjqD3jdfl/kW34IKyoSe8Rf3mBXQYN+2xPnGsol4Z1xs1HkSb
	q+jqxX52G0BV5IoGS+pI+CNTkQEdrU2YLnEG7zVP8u/+BXJknqTBvy/koQMqOx/F8LKsoZ
	iyd9T+c3TU+Mw/9Ik3id+/BwGeEXOF4XjJFZjGDG/VZC51Slyzv5oxeQcwRAeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I23DJBulHpzqgAw0h9OUkWIRLOPUsnKkbol9Lbu8HEU=;
	b=e/FGfCGw4PQm3cyF+oX/zpaEurklrzAnx7eetDocbSXoSdtioeURqNrLhEHiLnmOqf63Fg
	eIFe7/TntY1CXLDA==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/21] perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
Date: Fri, 23 Jan 2026 12:37:02 +0100
Message-ID: <20260123113708.416727-17-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_033721_008071_A6EDFFD1 
X-CRM114-Status: GOOD (  11.52  )
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

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

The intention here was probably not allowing forced-threading.

Replace IRQF_ONESHOT with IRQF_NO_THREAD.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-cxl@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/perf/cxl_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/cxl_pmu.c b/drivers/perf/cxl_pmu.c
index d094030220bf2..68a54d97d2a8a 100644
--- a/drivers/perf/cxl_pmu.c
+++ b/drivers/perf/cxl_pmu.c
@@ -877,7 +877,7 @@ static int cxl_pmu_probe(struct device *dev)
 	if (!irq_name)
 		return -ENOMEM;
=20
-	rc =3D devm_request_irq(dev, irq, cxl_pmu_irq, IRQF_SHARED | IRQF_ONESHOT,
+	rc =3D devm_request_irq(dev, irq, cxl_pmu_irq, IRQF_SHARED | IRQF_NO_THRE=
AD,
 			      irq_name, info);
 	if (rc)
 		return rc;
--=20
2.51.0


