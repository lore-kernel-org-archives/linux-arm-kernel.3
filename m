Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC44CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXGyUI5o+F1EHh9kXSuQQ/+t/U7f3/TfSrJgKB+I3Rw=; b=10xDxV/KbFhNlH4+BvC8b+pp0e
	1AAj16sw1+S+/J0FTCZEiTfLJquKoB+dapC7jUdt7ptHKoHLJWuPC8Y7GKwuxF500l1JTr32VTU9q
	nKKuoq7hJcDquIjCnE8LKaBo5FbwnOXlptHHK3yUEvd5BfHUgiCgzz30MnfamheNexQNXD+LhrbIe
	3R6Oe88T1qRVuC8St81li3pZpJ+QRSs1uwP8Dwm/6+UYKEMA8dmxHMeMKMwLLqsqiP8KseErBdQ/F
	dDt4er0/L/tzdJS3dfHtzDCEvnL1nTT3OIGvSK/5NY6F9Smxsyy6ey4Q7trdEfp7po/jIvla01PV4
	bJeRpXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhrr-0000000200e-1fSG;
	Mon, 08 Sep 2025 19:49:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemW-00000000lOa-3V64
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F4744A5A;
	Mon,  8 Sep 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEFAC113D0;
	Mon,  8 Sep 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349112;
	bh=fWLFQJQCjHkUmgzJrwoVr3TR8ormeAz7AFVrQDQpANU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4NCKVjt4aEI/Ymf/1sLgZyoe86T9ex/Kj9p4I6Z0B4AFpcvdcO6hM+A8rRNbH8EZ
	 RmoQcV6fK8rTsBiysO5qtvGmiFNmowwqmkxpW7dMavzQA2jEgm7/LIbRBYs4YpTTU0
	 fobJOXMy6OVoEgJ3HZTbA/Rxz/Tlhd7j3eoMVXcxg0hB/ZnXl9qa9DSvPU1czpJHrw
	 cd1DvYIIa88TqAb0PaEmdsd2tstM9MhINwHEWoitXAl1uQ6X/lLKnIc3yKw45Ak12o
	 Oxsa5aJfi8DKAQVBRe163FRCHh+0Hlh9O1zDOF5KHEs0E3QESaAfrHjC9YQhD7p0FL
	 sBVpFohL2ym6w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemU-00000004NTm-2rYr;
	Mon, 08 Sep 2025 16:31:50 +0000
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
Subject: [PATCH 19/25] perf: arm_spe_pmu: Request specific affinities for percpu IRQ
Date: Mon,  8 Sep 2025 17:31:21 +0100
Message-Id: <20250908163127.2462948-20-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093152_919608_B8B7821C 
X-CRM114-Status: GOOD (  14.53  )
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

Let the SPE driver request IRQs with an affinity mask matching
the SPE implementation affinity.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_spe_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index a1c86a1f21427..f8763f0771776 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1183,8 +1183,8 @@ static int arm_spe_pmu_dev_init(struct arm_spe_pmu *spe_pmu)
 		return -ENXIO;
 
 	/* Request our PPIs (note that the IRQ is still disabled) */
-	ret = request_percpu_irq(spe_pmu->irq, arm_spe_pmu_irq_handler, DRVNAME,
-				 spe_pmu->handle);
+	ret = request_percpu_irq_affinity(spe_pmu->irq, arm_spe_pmu_irq_handler,
+					  DRVNAME, mask, spe_pmu->handle);
 	if (ret)
 		return ret;
 
-- 
2.39.2


