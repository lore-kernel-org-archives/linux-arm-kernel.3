Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48DFC561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 06:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfiH5V16AyO9stikNxuMC7UErEwVoICawUpn+9ckh+U=; b=oJcuKo5hOKqByhWVAALH/GwprX
	BJGduHPDxDifOY0mu8ZAF7ub05zCgby2+8PkZ/mHI8QUas9/d8faerI25SFOwBLWq44KcBQOU8qBW
	5xGYKcsNdElQU++KYOCcIQ5GV1rfe+neLXx79EU3rba6DtighiefgFm+t9S/xKev0kU+XuTvWb2XS
	d76dazfrseTX7VGZbiDwcbtVZWU3tFLFTxXxa5jdP5Q/JKsMpKn/L+6jAhtFfy2XUE4k19DFIXFq0
	oW2/bwd/Q3i+1ZXWfoJCCwRMH5iFI9oZdAler6iBS1hkpoebNHU9tNxPhJTLgS70gzZScqXMsWk58
	Z0cryjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHj-00000003KF4-4B2t;
	Wed, 05 Aug 2026 06:39:28 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVHg-00000003KCe-3qit;
	Wed, 05 Aug 2026 06:39:26 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 20C8113802B4;
	Wed,  5 Aug 2026 02:39:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 02:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785911964; x=
	1785915564; bh=vfiH5V16AyO9stikNxuMC7UErEwVoICawUpn+9ckh+U=; b=x
	GHIjzW64dhAFj6ymzNbH3OWvqTcA8prhz7x9Gbal7rbqmAwBHkhib9OInYqBUBfK
	blcX6XzN6SRfvY//Fsxzg5pfbNy5GzN1K+QINOHrc37/BqanKYq0ZuXMSj+XC9n7
	BlLtSoN94Io+1TssG3UKhpn61nwkfQoxIh7j/kRJHi8AvbUVRXTx1WwoKms0Zn8r
	zF+6ym89rc/4UoaAdIJcuGK+hoPsjaq5F9CLzo8Go13z41C4umq1Y7Blh6x87Xbp
	lVsKfPPmwnDQYUzYj/56ZdyTjaYd7yBkKfEYriEVgoqYS3hoDbNGP1/CRVA51s5W
	XYb0kuljX04dA4E+AIssg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785911964; x=1785915564; bh=v
	fiH5V16AyO9stikNxuMC7UErEwVoICawUpn+9ckh+U=; b=ar7HRLxXVl7z98KsG
	sQU9/lmBCveSjeAUSfDOQqXAGs/ragcEIAvL69912VVTOniEeo7jk4NuUtt3NJ3D
	qmqhMYaHXdbDhAariqOKmP6gz381F6zLT8n5sJ+5EhtXWFEd+QGE3qId6dQL0bA0
	HPnO0Duuow9L8SQDd7t/CiKEa+pCh8kRsC+FUBnQfNlsBh2Gl2KvsJ6R91Id6bVu
	E5qeL7hdiOaXpqL73ylJK8ZfS1p5kMJ5yNMZxU7OGr75rb6HbWaHLWhV7PXqAESf
	EzmliWPa4DRbgw7Ei5U+oKE4Qg/Lvobm/twSh2HkSgHA/lc4aWp35QLPH6jLmVRj
	540EQ==
X-ME-Sender: <xms:m9pyatpcR96OVkuSaB4C8JUZrzAEnl1wtGhnE5M8_PEJPyI8O18LLw>
    <xme:m9pyajms8DRPta0CCeXe7q543b204xxn6iaNi7ENQBswMEKLpT-Fkg81FO1rj0NgI
    TA_-t_ifMBPuAWBdrwT-GauvjsMjfDxsjTQAbR70xv9UchG_SgUhOg>
X-ME-Received: <xmr:m9pyaivKfUAdbOsu4R_gMDM15Mi3_QrXjwpi1sE0uXdtAqcCwsfQTL4R3IdRpyuJ0oPBsAVHAQ>
X-ME-Proxy-Cause: dmFkZTGweWZ3oVrdbXXe5zNbY/1qm1pdBIKLQOv4wqtwxzIaCfusFJaUYDgRMW01OwQqmB
    PNcsOh6d5VtSN0ib3zlEWexayeHywWIm1PgtBDTmi1jqIXlJ4epZiRyRlOvRuTP/H94+Wk
    lk56ToFXuoLAF80uX/ZVFpHBbYL9/inXConVeGj5fP4oIjygHxURzt/8P2LkmOCZkpV/Kj
    p0I4ZXMhB3Hn7OHdNdqEICLLcaUpxq7aYzGqf1zEXgoEoToiw/A8MuK/o9jyR6a8MALeRg
    Lewa3lXhOyvgeH3GuUZQ4nFdlSaJtvfszCwH+l3e0Qw7QgR2O5+vsW0n/AqGh0ClOQOjll
    EHJc5MkWcmsjjtkq7YQmd7areuff/kBNt74+OtOxzrzkn+sX+SYBvqcjC+L4N8/Y1KbgSN
    Q+RcYVISSUVlV/HZ81ViPh8jXaCTFNg1BxxDtCb9+3WIOnjkGKfW5C+GVmn7lXH5+fDeOY
    AF0umAy6A0XLsubNJ9TAcvRB6s4Go1oCyNgPFvgBmIHn1KKzZna5/79sNIZJEYfRsgIxX8
    +oRL55zhjBV72Aubc2Kjg84n9KeTUWlioR52K1zZDb0unLFfOJvGrYeObVhQtdcTdMb0KA
    DV96ubNc5m28K1AxSjzy7e3NsPRFCKrcABosZ1IoPyVhtDIEmqSYXmo/0z8A
X-ME-Proxy: <xmx:m9pyaifHsZSRBLKAq3JgLjpENpny877BaIHgrXxZLQ0Z4hdfHkj7KA>
    <xmx:m9pyakYoW0HCMGqnLESkmVXtePyZcKCMrmmmrJziewgltjeCJ77DLQ>
    <xmx:m9pyaq0b0I35RpB0Em6uuttMO-4HAjoYBM0iM0O2-ZieOiIz1PGRcg>
    <xmx:m9pyatpc5jP5YvIt55SX87xQfjDSRhAz0shdP5SVFhyeU_p8_rYzmQ>
    <xmx:nNpyapB1vV2phck_Kw-aZwPyQ3vfOIAUclOhxLhXCcDStVyg5Y3_Z8N3>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 02:39:18 -0400 (EDT)
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
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v5 v5 5/8] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Wed,  5 Aug 2026 18:38:23 +1200
Message-ID: <20260805063826.95682-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805063826.95682-1-gahing@gahingwoo.com>
References: <20260805063826.95682-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_233925_031116_73A71115 
X-CRM114-Status: GOOD (  13.76  )
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
first access after a cold power-on; the vendor kernel cycles the
domain's resets at this point and that clears it.

Take the domain node's resets if it has any, and pulse them between
releasing idle and restoring QoS. The resets are optional, so domains
that do not declare any behave exactly as before.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index e1857f878..82051f600 100644
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
@@ -688,6 +690,13 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (pd->info->delay_us)
 			udelay(pd->info->delay_us);
 
+		/* Optional: some domains need their resets cycled after power-on. */
+		if (pd->resets) {
+			reset_control_assert(pd->resets);
+			udelay(10);
+			reset_control_deassert(pd->resets);
+		}
+
 		rockchip_pmu_restore_qos(pd);
 	}
 
@@ -857,6 +866,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	if (error)
 		goto err_put_clocks;
 
+	pd->resets = of_reset_control_array_get_optional_exclusive(node);
+	if (IS_ERR(pd->resets)) {
+		error = PTR_ERR(pd->resets);
+		dev_err(pmu->dev, "%pOFn: failed to get resets: %d\n", node, error);
+		pd->resets = NULL;
+		goto err_unprepare_clocks;
+	}
+
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
 
@@ -927,6 +944,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 	return error;
 }
 
@@ -945,6 +963,7 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 
 	/* protect the zeroing of pm->num_clks */
 	mutex_lock(&pd->pmu->mutex);
-- 
2.43.0


