Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277E2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fS23uuCXhX5KBwhj1s1IBkURLfoPr5JSNb7BdIodlrI=; b=EtyeMU1QxWr+cQ1O4GZKagXTeB
	zBr3HJ9wvs05FyEitIrevdJSwW8ZFdU/pLIp7frTHH/IDQKq+aBOXxOlqO4x6Y8iRvKYZH8/3pB2f
	5eKSqznYdeeTkyy2lQPfLJ0htACOWk9W0bsxnVFfjdeR+qt43r/GRnYJZzqpx7go2qTJcQYORrvrz
	+cS5CFeLT+YADcmSTuOdmJHBSjdkrZ42Uyg/M+d5V/lJRvPwPYZaxF6le1FI8ApRakOjzutVZZmmC
	4pZeU53CzJVjk9ZmARNt2qhQ8cYYsqROgQOfHXWNu1w8cCpA3r/2QbYxPNJiqSURTNgqpi93K9iss
	z+DO841g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvev-000000063G6-2mxV;
	Mon, 17 Aug 2026 11:37:41 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvet-000000063Dr-2VUk;
	Mon, 17 Aug 2026 11:37:40 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id B68311380159;
	Mon, 17 Aug 2026 07:37:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 17 Aug 2026 07:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786966658; x=
	1786970258; bh=fS23uuCXhX5KBwhj1s1IBkURLfoPr5JSNb7BdIodlrI=; b=O
	09+0ERu41vWgOEp53K/yLnvKcPUy64StIQdZqCeltZyDXjtR9YX8VNqTgXAM71wY
	pf3P9JlJS+3TZF22XlNIh6R4ItosaI5PyOzP1ZXUEe+U/elai34Fvs4siXV4vUYa
	T4OeMH+d8hHhCwkob17ztrBseKAVAo4sevV9M4sErwwpiAR3ibaIeBXK6h3T/X1y
	1WNQSox/5/Kee7sNe3LktyToFyRtTVb7U2LrZR/WOBCzcGmkHErYNj6TP4803dyE
	OHoWbU/Db3+iX0FYhjOarulDk37JqsVTfv79x9jvcCuXsmWN/b/wHz6B61hMZlxi
	N/jOnpRlcDhf0A49vX4Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786966658; x=1786970258; bh=f
	S23uuCXhX5KBwhj1s1IBkURLfoPr5JSNb7BdIodlrI=; b=LwWg3G+VDKF83mi2a
	lLb37sFV1Vc1/fDwslIAM+BabC71dQYJaXEH/QFnPyd2JK8d2gEaVeXw7LuEziBp
	haIcI65+9TB95pyIsICNRbmo3qQzI0ih0/TkfduidMHB+GfZ4IFAEMQDmLRb4bM5
	PaRGh/5V+oygDtKuleZm3FtLYB0BGOXNDs+Bes45aDfZRgi0UPj+b5rHUtjIJ/e4
	ji1uM6V3PSft0sRypcPhalpQS5PU4Wd+hHNItfFJ+JsaX3D6abw6I/qiPyzKjSrY
	EQLq+5nllRBZTd9sJfbJyKeQvhVXUZp9JHOtREhb2nASj1Wfwz67dyc5utn9+ry+
	+xIpw==
X-ME-Sender: <xms:gvKCak7zjElg0J8z3Y5V2hO2mu6UX6uAocTu-8ox64z5N0GsNwkrHQ>
    <xme:gvKCaiDbJTxET1oh9G_ukNcYM5oEQiL_qMRbtAGHkgydytycze2mmvJtSC9DZYqfu
    EjVYbzY--yoafTD_CHSHAEA9IpqpdO7xnLT3THHscMqc-IjTHhxsUH2>
X-ME-Received: <xmr:gvKCavRYx4irBuQOwz_aniqt8jDSPJ7IOrowt7p4EPxL7qU2TjDJ4lTy7k9qFqHgEA8_cbU5cQ>
X-ME-Proxy-Cause: dmFkZTGn55Su7Hrpv3xQW8kiCeQLMMXe+EtNw8Ny5aOMmrmA/S52UxT8toGIRHunZ5TeC3
    8CUVPo0T3TI3v5+JSydbOrVRGOweYdzSDjgeJ2HQU+QnteRCG4RIWbk2YstaxI8PwPUpsI
    B5rlrRzzeplZJm8yeVSbv/dntMzH8U1W06Jzf6jYXremoRNGcl11nn7wHzWdkBjGJoGDz5
    K29ctzqiIeZqkCbp46aL398FJPW7bEBGCmrhb0F1vK6pVmU9zPAKi/cGOkmtwexgjxIL+q
    96O5UmLol4m5QizJ2A09pNn8WXCDa3t2pEd6bRFohA1nn7RuA+wCG078NSdyrM65XTwvLa
    CMzOwyBkB/LuercLJvzIOhg0nj8hMFfG8HhZQALsdnVvfuWWlAKB7MZndGV5R6yeneRbcJ
    P/MuWbXQIJ9riHF2KDoXUI/HMDzVTodWFaMPcvzNZ5mT9RbHtuAUBLf1tcH/r/oAr/p0tb
    iMZN4uQo3YX97bt6Ylvh96WUdKqsq6VAIi0pEDcyO6iM6HQ6vrJa64jCCh7Tlcvt/NUxwU
    FuzdXJLRZxyCaR/LfbaWiago4eLdR6vIELClPeDk0J/vUE2EM1NhmM37RVyEpN6SR7LaQb
    WGH4QX71JepC9ph2tayiciNtYvkxg701i92DIBaqd6/wSvRBZz8/YdxxF1KQ
X-ME-Proxy: <xmx:gvKCaiezGINOqlg4R_Tt8Wo_e2lTsn7CAIj73SdBGLerruFvkLZSWg>
    <xmx:gvKCaoQCbPk8sXg4Umj7vtiL99QFRjuA1EdUmWaJfVySoGhpBG6NRA>
    <xmx:gvKCau2fXmCzl9ODh5xwDj5N3u7I5PMwBYhdDlx4Lgw6_6szftd6bQ>
    <xmx:gvKCau5i4QTWqwIzbD--YRayCSMhs58e-2Gwnubt6K5kR1QygZZYLg>
    <xmx:gvKCaibA2ncga6FTIM1gyZk3FvibJreMVfiu995kjziHu_XA4uBiB3Fj>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 07:37:31 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v8 08/12] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Mon, 17 Aug 2026 23:35:59 +1200
Message-ID: <20260817113603.1436067-9-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113603.1436067-1-gahing@gahingwoo.com>
References: <20260817113603.1436067-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043739_711223_5D894CAF 
X-CRM114-Status: GOOD (  13.05  )
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

Some Rockchip domains come out of power-on with their bus interface in
an undefined state. On the RK3576 NPU this shows up as a hang on the
first register access after the domain is switched on, and pulsing the
domain's resets at this point clears it.

Take the domain node's resets if it has any, and pulse them between
releasing idle and restoring QoS. The resets are optional, so domains
that do not list any are unaffected.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 39988efd8..8f2fd8a83 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -19,6 +19,7 @@
 #include <linux/of_clk.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -103,6 +104,7 @@ struct rockchip_pm_domain {
 	struct clk_bulk_data *clks;
 	struct device_node *node;
 	struct regulator *supply;
+	struct reset_control *resets;
 };
 
 struct rockchip_pmu {
@@ -692,6 +694,13 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (pd->info->delay_us)
 			udelay(pd->info->delay_us);
 
+		/* Optional: some domains need their resets cycled after power-on. */
+		if (pd->resets) {
+			reset_control_assert(pd->resets);
+			usleep_range(10, 20);
+			reset_control_deassert(pd->resets);
+		}
+
 		rockchip_pmu_restore_qos(pd);
 	}
 
@@ -861,6 +870,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	if (error)
 		goto err_put_clocks;
 
+	pd->resets = of_reset_control_array_get_optional_exclusive(node);
+	if (IS_ERR(pd->resets)) {
+		error = dev_err_probe(pmu->dev, PTR_ERR(pd->resets),
+				      "%pOFn: failed to get resets\n", node);
+		pd->resets = NULL;
+		goto err_unprepare_clocks;
+	}
+
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
 
@@ -931,6 +948,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 	return error;
 }
 
@@ -949,6 +967,7 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 
 	/* protect the zeroing of pm->num_clks */
 	mutex_lock(&pd->pmu->mutex);
-- 
2.43.0


