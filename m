Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2A1D35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx9PaGhN8XCDO/Lj9TkDnHhjpxVfK1xRGoM2y5dZLgE=; b=AyLzRZNZ7DuaFZzVzPXpQLLY1s
	YOL1HRU8X6NUvWXZoM2LZBHZRCqENL5Xe9+xMbuPmeScNwqDRswW6GTPVdciuJlsPx7sIfjt+tB8y
	QCngtm8l2wMINdsON88Z/bD85So0DiNlndA0HaTe83gALXjAKMavuJsRM1wrMNPR87QAxdf9qz4zq
	yr57YXunYOFLUNw4YwyzUf2B1MoiRFvIjSoZpXv/BFeSX69OqJFz8XoPoJQi/SDx/wTFy4Q8sxH4Y
	K9gLWhzF9CI2FHQJJiS4RBTb5mLmjZ1ZqnZo2V4Bxt+EDTTBUlQ2GHl4pJxsFGKjnuiusTSq2Okpm
	1TAFFhLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2HQ-0000000FnAo-3g0Y;
	Wed, 28 Jan 2026 09:56:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2HN-0000000Fn7I-2DWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:56:07 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx9PaGhN8XCDO/Lj9TkDnHhjpxVfK1xRGoM2y5dZLgE=;
	b=eJdzLYiTOtn+behbDASDvueRmFhJUiXAo+sbMvKy9PSpe32UA3IbaBdr/H7TAKt4s3eWQJ
	1mkWb4hdMRlei4dr0axaMIynjo+I0gBnEqAV3TGy/cjBrUULLY2ZRS69zNNuKt3Jr1cfr3
	5Ra8A9w0R+jHBIi2z36oQQHU9VTdYbdV9E1c5XhvSUXnZh46O0dNAl1OeYF7t5dZUUqXjx
	5dnIq3GL2QQ9E6eDPJHKVuafdgH9AnA7qsVHvjNd0U1UwZanv13NHRToDMst/ExUJA3EYh
	21D+AMz6KZ60lTUfrrFi0b7s9ntEETBPWWmDI6ue5iSR07R92uOD45ycSrmY1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx9PaGhN8XCDO/Lj9TkDnHhjpxVfK1xRGoM2y5dZLgE=;
	b=qqmnRDX1e3Qb4lsgp8mVBqAc1EG132V9zjFZs7OsjSY4PWQweBYfL+HNzwKopevros2T4C
	UxBPiSEg/MDzVTBQ==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-cxl@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 14/20] perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
Date: Wed, 28 Jan 2026 10:55:34 +0100
Message-ID: <20260128095540.863589-15-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015605_711392_9EAF8351 
X-CRM114-Status: GOOD (  11.47  )
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-cxl@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
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


