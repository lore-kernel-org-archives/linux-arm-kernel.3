Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E6AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqVZpS1mMaiLHStCX0I5k62rBcrBowKTfedoAC9Jqi8=; b=nqy0yIWaR5QRJxavhEuyHSo4ev
	BxXk7ZtyE2X9uers+ru0GeKvhpEHOLE7mh8XWCRWj8+UEQDS5sb6x5ChKSVBZ9y8PuFYQ13lpTs8U
	c1+Xwb20xi/0P19Qq3wB9gHVnxPNnXaSNdHiZ8ybzgAfG6tuEiM20fQHezl4JWBqGPX7+Rn+WIgYP
	Q8mPnZrpkWu/gp4tOz4GV6x5SpMITu4bkPXRzoJ5SIa8I8lv4T074opzqBA7/iyQffv98jS3Jdggx
	xDUg/6vy9f0cAZBMSdBu2vqD3V4LiSpilPQXxOJ9pS33Lm/hy6OHXmG0VHwbNFm+DntPN1/UJduMG
	gzmE/kJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP07s-0000000794o-0ifi;
	Tue, 10 Jun 2025 14:38:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAM-00000006mJO-3kQc;
	Tue, 10 Jun 2025 12:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QqVZpS1mMaiLHStCX0I5k62rBcrBowKTfedoAC9Jqi8=; b=k30k4PvcydRtInz2n4TsQ+3LA8
	3mT8IYjrFwJK9qO0FBc8td9KSkifM1blRfPwmZDdAu5I9/Slma418BD3C3Ex97NTYSldYrhOWU5sV
	g/6qUS4QC75ND4njqOgE487RODhg+bcMNZ2//vz5Xg6eIb1TGVvjMJiA1JbKPuQlZ0mXN35JGXgqd
	O84R7n1kMYHB8s5s6l7KdEcIwxbpmJYfyDvfrHXAySJenCAuOYumJKsIOL1aBi5lVK2tbkLW79b/4
	XOcj6RSrrIKNzEYQCSPAJEQdp/8BuAgo33eqJfHQYaXS9uDBBgs5+oAO8LPWILHnqkYNLr9vry+CW
	8YNbXoJA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAK-00000001oSb-36O2;
	Tue, 10 Jun 2025 12:33:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749558781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HrjOY+W4cCFSA4awnGSsWMRbUlfFTRDGjy2p1mQPrSds9KrrZhN5lY+6MlSiapWb2lXKaOS7RPTKNlEgUYpU2hkHCModV1LgaYLhH/zBrTgJZCpAphfKlIESGl8hGuYVafeXMaEvFmfpzgpyGdkiwON4W9CRJy3FxTyUOgsEzPs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749558781; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QqVZpS1mMaiLHStCX0I5k62rBcrBowKTfedoAC9Jqi8=; 
	b=mEpGxBwjKuM6BaAYvobE29OzAZb+xj/0U0w5ItRcdWmSUAJBo5Hlf2T9wcEiAl5LhV2qQIsWL7IXBP/Z8GR7wMFyxE2GQaDQTFr6Lsf5GayNwVM2dRKr1ZSAmqlWiWroztWLoyhu3i3wwiLbCnkt8fHC17wV58GCIAx6KvLHOkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749558781;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QqVZpS1mMaiLHStCX0I5k62rBcrBowKTfedoAC9Jqi8=;
	b=Slr9JpiJJaDvMY65kIqzX3axOhy2mgQHbHNCluirvJ24edjS/dPyDLWPkmCvKLGj
	1ECvuvmxgkrRC5Mx+uTi3Hy1Jzn96iRSFvmt2zcO06GSzIVADoly9XCp4BzvvDLFA79
	Ckz1j6ETrYFWlo5NobiLVesCejouTuoAt84dEkO0=
Received: by mx.zohomail.com with SMTPS id 1749558779319784.571732238441;
	Tue, 10 Jun 2025 05:32:59 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 10 Jun 2025 14:32:39 +0200
Subject: [PATCH v6 3/7] thermal: rockchip: Support RK3576 SoC in the
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rk3576-tsadc-upstream-v6-3-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
To: Alexey Charkov <alchark@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Ye Zhang <ye.zhang@rock-chips.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133321_172608_9A391157 
X-CRM114-Status: GOOD (  10.38  )
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

From: Ye Zhang <ye.zhang@rock-chips.com>

The RK3576 SoC has six TS-ADC channels: TOP, BIG_CORE, LITTLE_CORE,
DDR, NPU and GPU.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
[ported to mainline, reworded commit message]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/thermal/rockchip_thermal.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 40c7d234c3ef99f69dd8db4d8c47f9d493c0583d..89e3180667e2a8f0ef5542b0db4d9e19a21a24d3 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1284,6 +1284,28 @@ static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
 	},
 };
 
+static const struct rockchip_tsadc_chip rk3576_tsadc_data = {
+	/* top, big_core, little_core, ddr, npu, gpu */
+	.chn_offset = 0,
+	.chn_num = 6, /* six channels for tsadc */
+	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
+	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
+	.tshut_temp = 95000,
+	.initialize = rk_tsadcv8_initialize,
+	.irq_ack = rk_tsadcv4_irq_ack,
+	.control = rk_tsadcv4_control,
+	.get_temp = rk_tsadcv4_get_temp,
+	.set_alarm_temp = rk_tsadcv3_alarm_temp,
+	.set_tshut_temp = rk_tsadcv3_tshut_temp,
+	.set_tshut_mode = rk_tsadcv4_tshut_mode,
+	.table = {
+		.id = rk3588_code_table,
+		.length = ARRAY_SIZE(rk3588_code_table),
+		.data_mask = TSADCV4_DATA_MASK,
+		.mode = ADC_INCREMENT,
+	},
+};
+
 static const struct rockchip_tsadc_chip rk3588_tsadc_data = {
 	/* top, big_core0, big_core1, little_core, center, gpu, npu */
 	.chn_offset = 0,
@@ -1342,6 +1364,10 @@ static const struct of_device_id of_rockchip_thermal_match[] = {
 		.compatible = "rockchip,rk3568-tsadc",
 		.data = (void *)&rk3568_tsadc_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-tsadc",
+		.data = (void *)&rk3576_tsadc_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-tsadc",
 		.data = (void *)&rk3588_tsadc_data,

-- 
2.49.0


