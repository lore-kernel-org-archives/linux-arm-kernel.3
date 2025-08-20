Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E4CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66HsZgg4Nd/JOfJ5SPjCYgfrHkvvxeR/4mEPU/7Lwag=; b=cx8yifQ2UC00Po+Pq2t+marErf
	yK5xezdsgNBXqMSVbPnGVoVhlmhtuS+Bf9589nij0gtrNj5py18ehZtDOc6mQKFJGyGLEKk2+9GbS
	gxJQTYO/nYwiSpt0SxFQq6pSEoblmoCjOeUhcMTCaGxQH5SEzCiRgAFfbjMMHOtg7CxgRvQjkFbKE
	xOzUVL0jqvbX6VIc3P5rN2Jn47FBSZHLkc96pxVig1FUc4nN2kOYkp28z6AOCxIaNgtWEw2LYlwZg
	Lawlhf6oI+XraEQn+gVoLZ97NpUP7e8H198GWTr73U3WSWSkl5Afp4A06vuPRpDS6PiOztZzNlCDL
	NX0YGpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorA6-0000000F4ul-2UYs;
	Wed, 20 Aug 2025 22:20:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomnz-0000000EZz9-1Olc;
	Wed, 20 Aug 2025 17:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755711657;
	bh=CXhcwvZlSopAbL/fzdt9Z5pqnhV9bGyubMCozha3/tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QLp6YNsVbhv+tfZ/N25WieK+Bp9PyQTTAE80dGT39VbbOAyU8qiiedyx5a4xfuRzY
	 cZpTHY3Zr+FvbCaDnCzrnYKajqesngTurxw/Nf5Ff3stYlTxzKmoRlPyLv1r5bbgjs
	 6tf+lkbxZsU73m893B5KZNFVnawWxuDGtb2VAb0CQYyoc8kfqK74J1FdWqkyJ/ouxG
	 ZQM1bGSqxj7MOD5dToSWxxnKQiEcUeplF5jbCCKzGuEev4HaEQlKz4SJl3qKNu0+ZM
	 E8d7Mz8rMLkbi4NBZi4r4zKtu0HnfmIs4cyB928umXiwB6/8ZlS7iMVH7gEUPVto6m
	 HJOk6eKUjWN/Q==
Received: from jupiter.universe (dyndsl-091-248-213-114.ewe-ip-backbone.de [91.248.213.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 016B017E12FF;
	Wed, 20 Aug 2025 19:40:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A4BD8480041; Wed, 20 Aug 2025 19:40:56 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 20 Aug 2025 19:40:47 +0200
Subject: [PATCH v2 1/3] thermal: rockchip: unify struct rockchip_tsadc_chip
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-thermal-rockchip-grf-warning-v2-1-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7215; i=sre@kernel.org;
 h=from:subject:message-id; bh=CXhcwvZlSopAbL/fzdt9Z5pqnhV9bGyubMCozha3/tk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGimCKgHMa7MUGksYzbMAXCgjqNcDH/x+phfq
 flZ+YuS9XSWQ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJopgioAAoJENju1/PI
 O/qaTe4QAJyLFIErw0hULWNuAzcMfVyHGfNvHkyPeZLYmoNOKRKJiTFMIF2U4FRsxbK2av08daT
 A0OtTykG9BYRAZMAoSFO1DNY7MdeGQ68D1l/ILiWFRXHG9qOjudrZCDWyt+8HzFukj30Z5CDxwl
 ZfpY5+EH9yXVIhhDMutG1RyRZnwjjgd95Y1LsKbVvpDvn86dM6wrwBP+DrE24qgtEL3XQkrrQBO
 SLfmSzTKnXKOwjPBetV3t6gN+MXcIFO74yJ8/iHYwpUwTf59ljczcy1mTT4kiAlLI3dZgmQ6Vvm
 ajcAd7bAYMiNkr72GnYD8PLrz9snpNvxCJLb7HS7UA/+8ONxcZtge0+E0QsuHz176xgmzdkoE7d
 362labJ3YeSJdL9uhZUo9l2zA6fZU7QvDKzrxTIFvFyp/+vlAgbXRoFmVSfa3mg63HBEp7sq7Vf
 +jDe3XvlCQlOPrD0t/mv4DlnWAwLSr+pa26sYzLhPrsoAGMO3LBn3AzQXSf8m9QGVZS4CBQtK6N
 spEBWvLQUfgkR8cqat1fon/3ET/Q+K5DHJshvShJxFNWRfVi3zQoemwc4QFrMt2EHShV8HHZ5AO
 GMHX1nWXjvtpWm2qCnabosr0BtV0BDPxvL6DymkxrHGbszVHbNoXPK2ELaK/oPtJRdFPYV/G7cA
 ajXSK7xc2tdbiCqng3nw1Og==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_104059_551001_EA7F25BD 
X-CRM114-Status: GOOD (  10.93  )
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

Unify all chip descriptions to the version without any empty
lines.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/thermal/rockchip_thermal.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 3beff9b6fac3abe8948b56132b618ff1bed57217..7b18a705dfade6fa7318b28c2b57544a4446c1cc 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1098,10 +1098,8 @@ static const struct rockchip_tsadc_chip px30_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* 2 channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv4_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1109,7 +1107,6 @@ static const struct rockchip_tsadc_chip px30_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3328_code_table,
 		.length = ARRAY_SIZE(rk3328_code_table),
@@ -1122,11 +1119,9 @@ static const struct rockchip_tsadc_chip rv1108_tsadc_data = {
 	/* cpu */
 	.chn_offset = 0,
 	.chn_num = 1, /* one channel for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv2_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1134,7 +1129,6 @@ static const struct rockchip_tsadc_chip rv1108_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rv1108_table,
 		.length = ARRAY_SIZE(rv1108_table),
@@ -1147,11 +1141,9 @@ static const struct rockchip_tsadc_chip rk3228_tsadc_data = {
 	/* cpu */
 	.chn_offset = 0,
 	.chn_num = 1, /* one channel for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv2_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1159,7 +1151,6 @@ static const struct rockchip_tsadc_chip rk3228_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3228_code_table,
 		.length = ARRAY_SIZE(rk3228_code_table),
@@ -1172,11 +1163,9 @@ static const struct rockchip_tsadc_chip rk3288_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 1,
 	.chn_num = 2, /* two channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv2_initialize,
 	.irq_ack = rk_tsadcv2_irq_ack,
 	.control = rk_tsadcv2_control,
@@ -1184,7 +1173,6 @@ static const struct rockchip_tsadc_chip rk3288_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3288_code_table,
 		.length = ARRAY_SIZE(rk3288_code_table),
@@ -1197,10 +1185,8 @@ static const struct rockchip_tsadc_chip rk3328_tsadc_data = {
 	/* cpu */
 	.chn_offset = 0,
 	.chn_num = 1, /* one channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv2_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1208,7 +1194,6 @@ static const struct rockchip_tsadc_chip rk3328_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3328_code_table,
 		.length = ARRAY_SIZE(rk3328_code_table),
@@ -1221,11 +1206,9 @@ static const struct rockchip_tsadc_chip rk3366_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv3_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1233,7 +1216,6 @@ static const struct rockchip_tsadc_chip rk3366_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3228_code_table,
 		.length = ARRAY_SIZE(rk3228_code_table),
@@ -1246,11 +1228,9 @@ static const struct rockchip_tsadc_chip rk3368_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv2_initialize,
 	.irq_ack = rk_tsadcv2_irq_ack,
 	.control = rk_tsadcv2_control,
@@ -1258,7 +1238,6 @@ static const struct rockchip_tsadc_chip rk3368_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3368_code_table,
 		.length = ARRAY_SIZE(rk3368_code_table),
@@ -1271,11 +1250,9 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv3_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1283,7 +1260,6 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3399_code_table,
 		.length = ARRAY_SIZE(rk3399_code_table),
@@ -1296,11 +1272,9 @@ static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
 	.chn_num = 2, /* two channels for tsadc */
-
 	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
 	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
 	.tshut_temp = 95000,
-
 	.initialize = rk_tsadcv7_initialize,
 	.irq_ack = rk_tsadcv3_irq_ack,
 	.control = rk_tsadcv3_control,
@@ -1308,7 +1282,6 @@ static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
 	.set_alarm_temp = rk_tsadcv2_alarm_temp,
 	.set_tshut_temp = rk_tsadcv2_tshut_temp,
 	.set_tshut_mode = rk_tsadcv2_tshut_mode,
-
 	.table = {
 		.id = rk3568_code_table,
 		.length = ARRAY_SIZE(rk3568_code_table),

-- 
2.50.1


