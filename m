Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1C8CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEbp/+j7qZJ1gKj1A8GOOUN2/87E98yqaMje9Zy3rK0=; b=NQnv0UHymXTiymEb0UycRlwwMY
	5gzto8EpTK4RJzc9Kp+g0m1YSQpJjfr6+FsNn2pyvU2kKiTX1760JVQNl9o3Be51ccfeClJkKJ2dj
	Kr/uNQ0XHrFcccT1AAWh8MxvCE9pcOZnS/BAPNdiMtg3G1CDnMs5Qr/Vdspt6eOcXwT4rFI6Rw05m
	QJ8CDiG+0DivriZ2mHdE/Ji58N/Qzx6ZnlHLTu6BoduMERIKobymNFbEP/yIGPNT+g9UNZUI2p6UC
	x5JsjLb6DUcNc5751Ho8iI3utVRRF4i/v/aFEg1aHsCvXkjLiloz7c7HGND7y40aF4CQDAApZ3y/l
	VcG1EUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhpA-00000001zAh-2Mgg;
	Mon, 08 Sep 2025 19:46:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemW-00000000lOb-1qf1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C46544A0A;
	Mon,  8 Sep 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4D7C4CEF9;
	Mon,  8 Sep 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349112;
	bh=34uZqtOIifxx7Qodt8KhbqZ4rpIhHdbh4fyeIBhH5VI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fb5GFOK+rgyb5ds0tm+g9TuE1oDCmwFV0CBYo9vFZmd8YHy+ziAnur9Fc0uODcq70
	 VlsYxCDDb6mG7ZJxKyMMK3rmARq3vK8/t017NkWGz51+sLNQ/tbyU1cZ4785d0cgdP
	 dZJ2pic9pufNEpJhKg12mQYKuizvSp5N70lC7u6F7zwwmk+7/chpac0c4Q4iB9ouFf
	 fAZvTLW0SJVGcXe71JKHtBEW6DOnA3pl/7/I2HGwajKbthlS49V1Bgn6glOP3n9UeB
	 2kYD1UZd2Hv941e5oe83PqpGPd8Hgyj9JXy0671n1EKGxoVaGclkrNLTeDJVMcYKUF
	 cOgOpex6toBMA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemU-00000004NTm-1jcW;
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
Subject: [PATCH 18/25] perf: arm_pmu: Request specific affinities for percpu NMI/IRQ
Date: Mon,  8 Sep 2025 17:31:20 +0100
Message-Id: <20250908163127.2462948-19-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250908_093152_509331_295EE2FA 
X-CRM114-Status: GOOD (  13.48  )
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

Let the PMU driver request both NMI and normal IRQs with an affinity
mask matching the PMU affinity.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_pmu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 044c9c6296997..0d64e929d9bf0 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -679,13 +679,14 @@ int armpmu_request_irq(struct arm_pmu * __percpu *armpmu, int irq, int cpu)
 		}
 	} else if (armpmu_count_irq_users(cpu, irq) == 0) {
 		err = request_percpu_nmi(irq, handler, "arm-pmu",
-					 NULL,
-					 &cpu_armpmu);
+					 per_cpu(pmu_affinity, cpu),
+					 armpmu);
 
 		/* If cannot get an NMI, get a normal interrupt */
 		if (err) {
-			err = request_percpu_irq(irq, handler, "arm-pmu",
-						 &cpu_armpmu);
+			err = request_percpu_irq_affinity(irq, handler, "arm-pmu",
+							  per_cpu(pmu_affinity, cpu),
+							  armpmu);
 			irq_ops = &percpu_pmuirq_ops;
 		} else {
 			has_nmi = true;
-- 
2.39.2


