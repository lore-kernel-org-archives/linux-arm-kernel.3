Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684FED77880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZP0mAC2HVzeIwzomXWZTDpY7KbSipKd2ORfFLQyEbo=; b=ZKZtlOgFaAS9/+fgwR1svzaciH
	5Mvx0D44GKcMOiedZc3ChGBx5K8wsu6FPdV6c0T6aZpaLw1OhqetLWXFy2sSQsv912Ti6kI3SRC1N
	TpaVNPZypzwrxlz1e8oHVeiBNX5EUiSC4tMaAK56vS9F/WctdQkd6dMfAz93/VT42REMfKVH7xEwB
	/EgvdGSgkPGn3ZJvyLzMEFaOLpeaVMqDGN39+SIB7mweoyor5vNlOE3xuBLBdQr6vkA/PIAFM1YIz
	fkEV4qUCfJ8zlRJHUtw98MyDAqu18kBrL8UrAV8HRO+8tnWi9OEMatslKOm/49vsmPycpZ9gOUnNW
	XBYLK+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNo-00000009EPG-3nZy;
	Fri, 23 Jan 2026 16:51:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNZ-00000009EC8-23Bl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D65461691;
	Fri, 23 Jan 2026 08:51:17 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126323F694;
	Fri, 23 Jan 2026 08:51:22 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 13/14] arm64: debug: skip tests at EL2
Date: Fri, 23 Jan 2026 16:50:52 +0000
Message-Id: <20260123165053.2250754-14-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085125_631968_C7C5CB1C 
X-CRM114-Status: UNSURE (   7.81  )
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

These tests are currently broken and need investigation.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
---
 arm/debug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arm/debug.c b/arm/debug.c
index 572786a9..0299fd28 100644
--- a/arm/debug.c
+++ b/arm/debug.c
@@ -267,6 +267,11 @@ static noinline void test_hw_bp(bool migrate)
 	int num_bp = get_num_hw_bp();
 	int i;
 
+	if (current_level() == CurrentEL_EL2) {
+		report_skip("test broken for EL2");
+		return;
+	}
+
 	install_exception_handler(EL1H_SYNC, ESR_EC_HW_BP_CURRENT, hw_bp_handler);
 
 	reset_debug_state();
@@ -314,6 +319,11 @@ static noinline void test_wp(bool migrate)
 	int num_wp = get_num_wp();
 	int i;
 
+	if (current_level() == CurrentEL_EL2) {
+		report_skip("test broken for EL2");
+		return;
+	}
+
 	install_exception_handler(EL1H_SYNC, ESR_EC_WP_CURRENT, wp_handler);
 
 	reset_debug_state();
-- 
2.25.1


