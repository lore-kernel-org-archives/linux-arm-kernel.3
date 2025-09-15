Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE49ACAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5BthFOeWm772HXdZDOUjgm4ysCQ4I1yqxTxPWDyF5g=; b=uTTK4BAVsML/vWXYa1IcFsgcta
	A/xb55veWQDaAp2iZ0FAOokRh2g8MP02rlRr2KxX6yuPhH2N9DUyv9MM3HEfX1YFh/LGxQZplnuaP
	9E+o0NPEJ5um01frSDw6V/YhpIeEzSlRIXR4B9XqGUFTn/e6H1IOJ/BjOI3Y1ZW1PZevzMXzUG32/
	6re2eCmDKi+MDTlTAgQgF5bhpmCNfVBM1A/wtWbB2x7TEmDh1IdX2rqrQ3ZqGTZ18umsD4JkSxcki
	R1QQVciIq33CXUKD8m2ow9c/JHd0LC+0gTAuogrK/VQsTZAsAy+S+zaCYYDmS+4ix9q875HC4voBA
	oYGjzH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy52R-00000003KHY-1Lqg;
	Mon, 15 Sep 2025 08:58:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy51T-00000003IyU-2IOz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4631C443D8;
	Mon, 15 Sep 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261EDC4CEF9;
	Mon, 15 Sep 2025 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757926638;
	bh=Cd0M6Ctqz2mIs5KmsrNG7gPuEf0W9llFNTYE/JJTtFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDp0tfF6k68R8ROhzn5O52Xa2JXOkXJe0iGU44AyngmY9O4NJhu91UZvWywCLWgqe
	 MBbDYisBTdGB6+tfyzhYubwaR+ncKGJhpObY6LXNKLViCK6XYTl+6Y6u5C30rFBwD3
	 odeALTB/iFNRpYe/uQNdDUOiOG7SXyIUkO0Z1bGSVgQ2s5e7vkvV64VxG/gsHVVCu6
	 YYtGU2VhlYdSnnvarqXJ6B0l7L3613AKnHLUJR6TEFUt72D73pDntzCdZPK6VeIkCy
	 yb4P7bpqMGjg9wrdlMm5KU1U5ffP5EfhSMS1aK24oQOpu1rjuhDwEw2+mIzBHHxVun
	 Luijc+/ENQxkQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy51Q-00000006IHP-1REL;
	Mon, 15 Sep 2025 08:57:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>
Subject: [PATCH v2 20/25] coresight: trbe: Request specific affinities for percpu IRQ
Date: Mon, 15 Sep 2025 09:56:57 +0100
Message-Id: <20250915085702.519996-21-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915085702.519996-1-maz@kernel.org>
References: <20250915085702.519996-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015719_704196_E4428BFA 
X-CRM114-Status: GOOD (  13.72  )
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

Let the TRBE driver request IRQs with an affinity mask matching
the TRBE implementation affinity.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c512f8faa6012..4a84a6bc2e8fc 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1492,7 +1492,8 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
 	if (!drvdata->handle)
 		return -ENOMEM;
 
-	ret = request_percpu_irq(drvdata->irq, arm_trbe_irq_handler, DRVNAME, drvdata->handle);
+	ret = request_percpu_irq_affinity(drvdata->irq, arm_trbe_irq_handler, DRVNAME,
+					  affinity, drvdata->handle);
 	if (ret) {
 		free_percpu(drvdata->handle);
 		return ret;
-- 
2.39.2


