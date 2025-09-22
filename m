Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4B9CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbIR4NhvbbkMdSObT8eWuJchgCepXnZMjee6QWTdHsw=; b=eNbX97hYQpJbSeWpGmdjBU6Bc8
	g6Yjk1vdqQ4x/WlMYRYgWYczNBQ6ZdHLux0Tj2dfV7dy27bakKVsfYd4WVLDLk7N09WzIi6DUfAv/
	GETN/kRkoV/gxuLlebpOF5DmK4RGt+hq5FjoICXefobVNvT3a4arFUq/TIMwzZHTuknGA+8kgjWrJ
	qSLS2ahKlfKMnir/35aH/sD5s1pOVOGh1rjD+8jlrkQRbxPvhPlkakXBBCEBdbjumfDqNbUmpjOkY
	QmxrXzF18qUESShIw1RZK4qL9Jc/AH+8jmzRC0a4Un1VqIH+9jRb+rjsqOeISxNwdC8kUS5Fys5ud
	bWyoZ/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bux-00000009i6d-0Bmr;
	Mon, 22 Sep 2025 08:29:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0buk-00000009hkq-0GPM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BA1860234;
	Mon, 22 Sep 2025 08:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32208C116D0;
	Mon, 22 Sep 2025 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529729;
	bh=B9kVMS1KP6Byn0zyMEHaUwA2iK8UDNHnAZC4Pwhtp14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rSB5WA6/7jLOB0XbcgmJdzxVvAE40Ux/TSo9VYS/S331nBFQ44dVAMHk5+jCWVdlY
	 iOHFhQgcf1rKcm8JFJ7JiHZ1pOxyqqoyWZrGlv+HSeXNiFDD8O+r4bQblSHerLTEVO
	 QzJP3MtthyrOkjidwlzhGNV+JiM7o2RjYT+nMREcCebxN6ik+wJiAuYAbVKDH+NBrQ
	 PT7PuGxO3AOwF3I4PDfInFXrPNAl4xt92LHRNENNlqyZpwfGTdoIonkHoNYQUxygGu
	 y/nGLPNjAQ9MaYJj58jc8FHKn2XUF/8GtII1iTEpF94JYbBF8gqOJoaYRXdpFv+vmp
	 CljDh0vyBJn3Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0buh-00000008Kds-1itL;
	Mon, 22 Sep 2025 08:28:47 +0000
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
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v3 20/26] coresight: trbe: Request specific affinities for percpu IRQ
Date: Mon, 22 Sep 2025 09:28:27 +0100
Message-ID: <20250922082833.2038905-21-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922082833.2038905-1-maz@kernel.org>
References: <20250922082833.2038905-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
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
2.47.3


