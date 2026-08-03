Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B87DC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfiH5V16AyO9stikNxuMC7UErEwVoICawUpn+9ckh+U=; b=oFRmrQNgwKlh9MytRhV3+CglW9
	5Y9pELeOJbkKI6bQXQJJcfJjJTnxkibQKF7Y/8hOgsOw4lwz+gdVOArQrCkhMzQN4V/lDA7sSm4uD
	pkSZuAap1LCdu1Kz+qmwJrllGlIQy1i/JS1IAJVjOuFMFSjvMul8V/NSpfFnHRl6U7zU/0N0uNtej
	J4LeG8NqhlqeLF+VPqWQvWE+O/zVtCymFZkBm29jejv0NkvpPmDt+cubky0LNSM/AhEpHCFnb03pd
	eK98Jo6QFohw//aqDN5i6JaZWJk8psyAUaAJLDdgoJ6rY1HERIyjpNCn9ix8GeA0N2dgA5WcqxovX
	dKaCDbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpBW-0000000GiQQ-0HbG;
	Mon, 03 Aug 2026 09:42:14 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpBT-0000000GiP9-4ASE;
	Mon, 03 Aug 2026 09:42:13 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id 1FA5F138007E;
	Mon,  3 Aug 2026 05:42:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 03 Aug 2026 05:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785750131; x=
	1785753731; bh=vfiH5V16AyO9stikNxuMC7UErEwVoICawUpn+9ckh+U=; b=M
	ciCjb6Q3VntZWJBFZT4daNuBP3KseLRFsSHgcvXDNZfG5jYvJdPO9jHaoDFFEXP7
	8EEAoTQBi21bSeKWaYicmI5TVHY6JRlho02H0yuURY56agk3D138VJotNzp2Fepk
	wduxmmjxVNc+2pYSRJGXO/3pK53V40IY0rgDXozyUo2ASOVV35REt50q/kWmly6V
	XiIFbhPn4mUp68f+VdKEl+WXkNco9L0sZph6ZewnGsmVXR5kKMbja5Wu3ZskkT9J
	0XFlOnrk9h938VLzLR5dFl0St2CN/zM3WDag4zcc9PrrLZh5qWliK6IOQ0lxO18b
	9OlOmntwoE6w3DzpRt9Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785750131; x=1785753731; bh=v
	fiH5V16AyO9stikNxuMC7UErEwVoICawUpn+9ckh+U=; b=gBTserxC+XXloIhpS
	up+nD3ExNFFV+QUvHvfQ7ytrk3CCKO5sdYNT5Xm2lcXdhNIQC8/uFAQryKcvmm3K
	bqgSrwvPp26hKjWAhz2p1MKPJY1cNnPPS0pd48E+u9bagwlGMPEAO4z7hfpkKM53
	TtvCbhAuZ2jowk3gS876PJtgcXuofLwF+zgLJwDVbj+XgeQmC2zUIk2WZ5x/Nfyx
	lkzgbOmPtX4Cn7KW2OZrFdmghQ2IDbLgoX3ljXETmT387RWmgbe4hX8UEBCrbaF/
	e7XYTs99j6r2dfGdRItCb4u2gaDj/fLjnqOV+pHt1JsD4SWWuY4SrYn2UPJXtul1
	o221w==
X-ME-Sender: <xms:cmJwakk3rXbBOdD3utjG0WyN40835YjLBAHQ6CFgLamAXz_O7Qxjtg>
    <xme:cmJwaq62Ey0UG3-eBwMgVeFLBOResII_u3a5BWrdS8JFk9HbqDMrL3ljC7cnEseat
    T-YLbKWtdtiPXFoZiqCNzKVnQoTaRu996B5goVnXkKGgsf-sCS5uE8>
X-ME-Received: <xmr:cmJwaqU9tz39dh-JfZJPU7mH_IADvE2VWL-yAeZh1UE9m6OyVdypKVVJQCZUTdX00PuBkMt9ww>
X-ME-Proxy-Cause: dmFkZTFjY2LyPb/9LfXn4QCibSWxeeRWJF58tfvFoO1JpUYwl/f8fQT4gNNHDkwtzTG3mW
    QB9Z5E2ZaiRLdwTk7Bf1cP6j2q2LuyYXAyG5SuQy6DwnGU1S0GzExnzN4TJrhwhfA2voA2
    n2K0qQ7ZhvGfjI6tOvBvuW8sUUpow6OyrJ4H8Jm+8CF5bCgHVQ4I3VQwTEXeIHlOg0F+vh
    Iqy32CoHpA615dyPNJOIbTr8Kos0tW88p1VITCDcWhI1Pkk+5LOtOBwFm8TmwIOzW5PsEo
    tPufk9ICYRNR6HPn77DziTnrKAnrLZzqwRBloqTdNsqFLZVnL8NzKJLgMxCkSg4QeWk1lX
    ZCi92cTzOwqDdGNi9OjQjzmEHR/ibLFkRVAgedwPclg+uAcYVpexktu7i2Nyaj7OvyrSXt
    qmpz2CbtKoAmZkXQXWKY9DByt3JvdcU9gQuP/gT1Knf1RuwDnQmKtbFm0a+IvHbu8JB4/L
    VxcE5PBr6x90ohNH59xPiM5dKu0/BItIrVsjEMRLCmKudBTdOS5pkvH23YdtfCkXmo792c
    oJ0rFWsJcwx7UNMQDtFS2hli71Nmxd9isR9ya7U+kWUCpGSAlYn3tgKcEFcLAh6Sv85FIO
    Tdiv1mowuQB4hotyxK+13T+Zapc/BJbiU3f0xN7D9IbShoAD3u7nO4uqWJaQ
X-ME-Proxy: <xmx:cmJwam8xkpxIlomLZzLhU8oznL01ZKAr6ICldVnMypvKjIfdNapgSw>
    <xmx:cmJwavjTtlX0P4G5cQFFhyit9-KrhMT5O_5Lu2Qnas6-K1_B3ysbaw>
    <xmx:cmJwatXButdmtYdy9LAIz_T6SPD1vgVwA9lfhM7ulouX6zilsQodcA>
    <xmx:cmJwajvqNKY-3VZQzWACyqA2ctoQ_mMjhQuJ6wK6kmyDKTKVgbFy0w>
    <xmx:c2JwagezJk__qhSaMb2_K-3Wfm7h7pi58ouLMI9HmvIuMRMyIyOo3GD2>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 05:42:03 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org
Cc: royalnet026@gmail.com,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	krzk@kernel.org,
	will@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v4 3/6] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Mon,  3 Aug 2026 21:41:22 +1200
Message-ID: <20260803094125.3285895-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803094125.3285895-1-gahing@gahingwoo.com>
References: <20260803094125.3285895-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024212_142779_69C9408C 
X-CRM114-Status: GOOD (  13.54  )
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


