Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D2C44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 03:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReDEZNNVB6LR8TBo9n+GfIJ6P/foCnyQWElDcThh+I8=; b=4FlOLYVLK3yZY9BItLY1MWg5TQ
	gTO5X9YxK4SYnYV3tvrno15yJ5amTdXD1jQjB/YEXLNVqYEjJj1DtbViQyqy/yc06cfav5CCEoK/t
	D0O2XHzmWgEH8fHVo8GD2txiQxtg+f7noEkJDxOvk04HWCuTz2g2AQ36ZHvLdrpJXS3o1JofYESad
	TlWdtp2dBgxz1S4WRSiW9q2MTdRU+U0dJlXQ7zOJREpMg1/+UoMdVOCQE3yRKzSQ/LIAbhelnbgIr
	4+qbwdkqV0GfziObl0lqV3z+6NFwGMBbNEh44FRJSRG2LGB6QNeMF4E/wi1fTP9rv6i7HK7HMqJyA
	oY74uZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkvTg-00000003arp-2QdC;
	Sat, 18 Jul 2026 03:12:36 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkvTe-00000003apk-1QZZ;
	Sat, 18 Jul 2026 03:12:35 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 7E5011380327;
	Fri, 17 Jul 2026 23:12:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 17 Jul 2026 23:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784344353; x=
	1784347953; bh=ReDEZNNVB6LR8TBo9n+GfIJ6P/foCnyQWElDcThh+I8=; b=f
	13js8cMotlSvz6w3J13kdWOflPNn7kaiGIZsJaYhhH8b2FtCbEmNvvxygoDdrvET
	e7N6qZ23ubjHJCv2bqSyIYBhnA5v+mmk9yOLofAvxVQcZoDJ/FbFz6qvL5JVXL9e
	E27MXQ4fe1UmFbZ/soOlokURSLp7oRPDzdG5fShpOJCN6w9yediqtZXr5YO/oeZM
	Je9dTJ3pXexj5iTt6lS9hi94ASmE6tjluDu/3CTx0eszBR/EolYQSj5AWMRf5fW6
	+aGlN4BTORQ8y+TaUXUWHns/7fluKuGCmYp5Op5KEkNrLSDIgxJPVTZ8RPb712p9
	72d+JQIOvP5H1NY5NB4GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784344353; x=1784347953; bh=R
	eDEZNNVB6LR8TBo9n+GfIJ6P/foCnyQWElDcThh+I8=; b=VETlfcUvMO2S0Z9Lj
	vfIZcjBnGpONs76AZEqg0fpDbGt8K8kWWr0T8Zd6C8cWe/0iJ8SJJveVj8HvvXpQ
	6OOySbAQgSFvYnTlpzrnvx1mgIeIdRZ2SFIh0jApJfZCHJ/qA0Zvq5cLCX3hmz3f
	j/fScdiANyseDva2SxJ/wIWHovDlkPsPcWB47WvsJqotdyt4qi7WVDDTe9diGMt7
	neS9s3xk2bjf2g7tv45u5cn4SWC+qWzkzYdRYupd/2Rak7aFrb1dESiAB7rccA8l
	n8L0RHg+Z0EGS+IiDeW3O7/hFM4xRkHK1nhbixv7YVNDSP2Q/4e/5h83uP+TIhoi
	4XKlA==
X-ME-Sender: <xms:Ie9aatx-c8-TQvSTi5nxs6tLczDgbWL8CPzKm5FzaY7eAYoo_q_oGQ>
    <xme:Ie9aatpfBZ1KQamgquxoBEpOZZC8bT7rsrKkGyMW1y5hvsddCfsdu3DcrI8zL0wUb
    lPMDOXlNTNkmnNmbpI7CUytiXTArAL-TnZdqeWMNk0plNnA6NfZ4Ww4>
X-ME-Received: <xmr:Ie9aaoe5GZct_2JFDzcZnNEXJSkjeCIkOsJrQsuckw5DY83jFygAaIJ7-p-R82zB2Q8Mk7C0AME5yOO-6BY>
X-ME-Proxy-Cause: dmFkZTGiua8u0bNA9XH/1gRMOwAvIEaw+Xtz0KCuQKXabiOHwfxpZ5MZYByRWbR7Kp9nF6
    qSe4oUPMRhjVDuO3uTQXqNB9rW/YS03mixI6iwJykTNKzlTWPLWtINW2pRnzFmGD/jHaBH
    GW+Ck3GrggAvw64iMT6xDcUsunGB8iGvjpZn8uEGxdGVdwsgwFdZGN7ymS1icJndc4lt6e
    zFZUrbtWEQG8UIpC7Nj6JLcyz0vHsWVRB3V4EGPAQFYmiIaqKn/E4qxv/cGIWyj+pw9l6Q
    Qrz/KpDo+6BmEyRu9vKadFcnov/EnFsq7LCdBsST1Re0wCrcf9imh4FlvqjBTb6afFWNbI
    CWDWTqgOw5anCxAJQ2RRzTsQ8FyQFlAOMjKAk1O4IqUMRqnLXv2OD6G3Fv6e85qDfB0ZbF
    sIdOWBajTsziR7rZvXmNaBtj4QEY42I8c9LuNjFX6ElGDT938ucWOXXxQmwYhHRbt4LK14
    VxDq2e/FsrRxp1EZJsSbePv8BVlyJl33MEzRk7kCtypm8qti2NVi1VYHnGtBUKHkBg7kyM
    9NiNRh5aQhUBpJ7rUKBpzR605Sj3g/nvWHh2gyFoxQFVsT+T3bQZbWRZ3EmHsbdJCE292S
    hWNu/R6Pr1K5Qq+e5y9bmqhMfMdnWlcWIa0///qO2yJrTEqXdZxjkqWSv+FQ
X-ME-Proxy: <xmx:Ie9aarj56CpV29TFAI_Qy85Z0IX_qjCVtXNevIzyb7BGnJjmX7AMsQ>
    <xmx:Ie9aauKnXPbREXX_-2M_USNARksu0M2TFPoz7s4fjm5MVFWp1PpufQ>
    <xmx:Ie9aagovXI_vn7jQuiHJmEP1HKUnktL5ZkYrXQ7N7fgBlQhTaKuFxg>
    <xmx:Ie9aarqg4Cup2kkoMNCCxycW4P0xKwqfZk_eH07KbLea-rr11LtElw>
    <xmx:Ie9aatHVSKIPwhrLAua9ytNS53utZn_B1mSLRuA0BEy4X9nmc3eAfsdJ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 23:12:25 -0400 (EDT)
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
	ogabbay@kernel.org
Cc: chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v2 3/8] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Sat, 18 Jul 2026 15:11:41 +1200
Message-ID: <20260718031146.3368811-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718031146.3368811-1-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_201234_473794_0C34BE7E 
X-CRM114-Status: GOOD (  12.42  )
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

Some power domains contain hardware bus interfaces that require an
explicit assert/deassert edge on their reset line after the domain is
powered on.  The CRU preserves reset state across power cycles (stays
deasserted), so the hardware never sees the edge it needs unless the
driver pulses it explicitly.

Add an optional resets property to rockchip_pm_domain.  When present,
the resets are asserted and deasserted (with a 10 us hold) inside
rockchip_pd_power() after the idle bits are cleared and the delay_us
settling time has elapsed, but before any device in the domain resumes.
The resets are released in rockchip_pm_remove_one_domain().

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 1787f62ba..8ce0cc3de 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -18,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -102,6 +103,7 @@ struct rockchip_pm_domain {
 	struct clk_bulk_data *clks;
 	struct device_node *node;
 	struct regulator *supply;
+	struct reset_control *resets;
 };
 
 struct rockchip_pmu {
@@ -671,6 +673,12 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 		if (pd->info->delay_us)
 			udelay(pd->info->delay_us);
 
+		if (pd->resets) {
+			reset_control_assert(pd->resets);
+			udelay(10);
+			reset_control_deassert(pd->resets);
+		}
+
 		rockchip_pmu_restore_qos(pd);
 	}
 
@@ -840,6 +848,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
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
 
@@ -910,6 +926,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 	return error;
 }
 
@@ -928,6 +945,7 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
 
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_clks, pd->clks);
+	reset_control_put(pd->resets);
 
 	/* protect the zeroing of pm->num_clks */
 	mutex_lock(&pd->pmu->mutex);
-- 
2.43.0


