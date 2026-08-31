Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC22C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 04:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuzlYllSmAZP6yajMRsW2NaQ/7lmKof72TRcxeRmWS4=; b=qmmIEBRIMWGjaFWXVcClK7lBhn
	SRFIxItU/wYnuOO7fZ7u64md7PEiWTIlxCHk049jqxemtfQLUURYNTLE12zE4AIdmXw/GtWkyZ4Pe
	y16E54WOXE6K8GMWrqwlnu1Jh/x5fW8NVvRW56UnzalZ+VjhV+qwPiRV4L+IWfhScFfMj29tnPts4
	seGcJv+UbA9PZ+E/Ch3I5oNWUD05n9oonNPQOfOgu10RBKKx2sjMy9hGllcmZPj66RjQ484VfrLIZ
	JXXZ9w20Jj7xZ1MMU2umv1VARp+xqGxcQ3Mcq6mkHIy9Maa0eQXIUW3P8KeGHU9hV9Hs89B7Bjx0Z
	C/MDxHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tLI-00000008S8h-38gx;
	Mon, 31 Aug 2026 04:09:56 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tLD-00000008S4p-34jx;
	Mon, 31 Aug 2026 04:09:55 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6EAF87A0014;
	Mon, 31 Aug 2026 00:09:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 31 Aug 2026 00:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788149390; x=
	1788235790; bh=EuzlYllSmAZP6yajMRsW2NaQ/7lmKof72TRcxeRmWS4=; b=R
	puX0EQfi7AtJ2V4r3WiOqNyjdmLwvbsrOtuXRljXnKxqyhuP0G2Qe6hyNT+LWkfT
	10rVD9XwVTFrtN07lJpGfd3IRIlt/x96jkYMZ3eXUL3Dj4QBu15kIn4hLTegD8xE
	XgPj/k4IOrCV/hYCjUwCWpauiCMmUVe3KWH0pg7EA8MMCaYgiGzafihb48eRt8pN
	6ozgdFyhhvV9EhgVnQUUiC+W0LaAUkH8NEkIQSHOD1jyYZrvNEje/JQ06fs5le72
	Bw6nqSo1gWGk8AtEB6Og5bYjIPbGBX58n1DjO91MH5ZCjzyMAcxDo2KpDP/JHaGu
	BOVCcfbUZhu96tEfqL+0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788149390; x=1788235790; bh=E
	uzlYllSmAZP6yajMRsW2NaQ/7lmKof72TRcxeRmWS4=; b=CrAK4gPbj6j66pdIh
	XQEbFwWaRQQJiJYFMS4Ja9XR88LYTVJz7Q3KriJmIZmYCjEVZIcG8YUBU4X4PoHq
	YJ6Y5gr+lwcoCB4iBjwWYT/s5mQXSW4MFH3A3zKUS51SNe/kOXXTNZ3vMVbLIHgk
	We+RbYn424eWXGwGFZUDzaBLS305dHovaMwhPjKIniP6FBVrcK7plihjpdWGIiAz
	wTc2tuB83Yq4lVdnYKmUhhH7ib+kH0EUKV7wkrHBI4OM1TIvBc2Ba+tACV78z3VO
	cqczxcjsK3MH5gmlaXpaTH8jvl/fvYsPjUdHCeqWw5EgrrQLWYsW1bZEDB0nngWp
	cQkaw==
X-ME-Sender: <xms:jf6Uavr1MXqn8YZAIa6UHneOnHBJbxEajkKjkXEfT0mnq4jaHAoRIQ>
    <xme:jf6Uai-JGmr5nK_ZRn8NyhBd9zpnKvZEeJkCs-cI73oeoghx941MBLic9g2bCeMUd
    rWYOWvJvzSAsgtFCryiL4e_NQVY88OGVgJTxVYlNvSv1qycnNteMrLp>
X-ME-Received: <xmr:jf6UakMMsof-xMSdFmvGtKQbVQ-QSE9uzmSw9kR6Bk5O073Y1UoqkHG1gKo1aM5fxFt6EQs7cw>
X-ME-Proxy-Cause: dmFkZTFrmGdraA1wQ3u7fSC2szCs3dTKzi/Amki67rwemwxet7nxM0ToJ2yK8NWZy80VBj
    m9nFeJFSLUsMmp4v/avaroH3z5Dq6jG4k86bAf0y32LtQ7RQOAYU0EDi/Vek7cY9IfGAli
    KbguFiQRUm7Yej/X8Q7usb0aRYgmhdttAZZaV7gMFf/0gCkGbI0GMXhWHVbjxOciLjJdey
    nBHFTEwJHw6b/X1tteAoW5feajlR4udOAumKRJZOKSBxp0+HOuOhd3F7jLrJp4hskYXnWm
    Yfl8tng267MYxnNxKDOVFuoUTQiqdV/pQsZF1H5QJFaOThb9EnTKuskqcvPNlFdWCr/4ZG
    oWtZALAKNwaFh8GbgGOJ4tgmkNtHhsfG3F1DmtHBe82up1ge9mWg+CAi0zjl3RqkicmsXL
    8YHQ6+1hNi+42IwunpyqKiQqJBQlrMMy7Z5sKusOo4ogBtvKkNcYBPANqjfgtfKmlTWJDF
    jdXkxNFGqfIHMxcmVOUSPNXOn8T1X54Qj+q5IpX6HMSB4xL5O2yJYqg4/y/63dkvEtbsEc
    dBv28F/4IC9YltHiKet71xqBUZkPl9f910VteQahAQvMAm6pqjWo3RuNQEwWilkbKrPImj
    o/BjhGrbK6RhfiKB+p4RNCJFQlt0LN+DM7uHkaXT/n+2IEpJOG2uVsecdPGQ
X-ME-Proxy: <xmx:jf6UasnJpmmy1BjCE8SjIUYBn8M6-uRHYfjFjIPd8i2JqWpfPUAxqw>
    <xmx:jv6Uap8qjMybAUNUxqVMmfnGD3MyOhLBBp20NU6ClQJt1WRmqHOjbA>
    <xmx:jv6UalNXhOrPgVdkrhyhtoxK_c8eu4JeFnGjQVVOD4asjUCWlr5amA>
    <xmx:jv6UatHW9cReFQTNTGuK21ZuXOuM2RpyIrmQg21KPL_tEhp_MjswCg>
    <xmx:jv6Ualc0pMuDwbxMXx4R63frKfiOrPf_LRHEOd7EnA6SqJPN_MXV0QEx>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 00:09:43 -0400 (EDT)
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
	u.kleine-koenig@baylibre.com,
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
	Jiaxing Hu <gahing@gahingwoo.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v10 09/13] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Mon, 31 Aug 2026 16:08:00 +1200
Message-ID: <20260831040804.24111-10-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831040804.24111-1-gahing@gahingwoo.com>
References: <20260831040804.24111-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_210951_838264_8F4F79B6 
X-CRM114-Status: GOOD (  13.56  )
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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


