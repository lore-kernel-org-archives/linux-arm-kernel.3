Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0E8C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5ehuwu+R3IZPenGVdecVG/3J4bVeduLS34R82/gLXE=; b=AK2MeUtfEN1MPaYEDNQ07K9bFn
	2KlWE/hlVj17GdTdQ8rzs3xy2B8pE3gHsngC+gn+bNccHjC7qD2mla5jkSLgsEl9vR/9uEhTH5Bg4
	10VGoTW5kuy7CWdDzo8jtuzID+jvDjNenvvHlSISoulIa/rwl7pRT/4A3qKueQsLrJkQJbjJfkdrR
	t80pq/v/FU31S/UyCD18SLyDZxElU6kQXWPtmpW0+E9sv+ki+DpNN9FTOPNr9ApHlnXjPQmYlTSPo
	wQaSVJXXvEuj8zSdVLZI37qN2brUfdtXwCgb26QvJJw6Oxly3Q+rtblaS8Y1FtsyoFdjCPvCIfNxN
	gccjG76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrhN-000000053gN-1UEw;
	Thu, 06 Aug 2026 06:35:25 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrhK-000000053e6-1JJP;
	Thu, 06 Aug 2026 06:35:23 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 27EC513000EE;
	Thu,  6 Aug 2026 02:35:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 06 Aug 2026 02:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785998121; x=
	1786001721; bh=t5ehuwu+R3IZPenGVdecVG/3J4bVeduLS34R82/gLXE=; b=h
	6B4S54DEmnsTWv0PL6EAxWtuFVr4XnZw6vwMZyxfdAgdXwcM+Yy5XfXXZHH1FpG7
	XCwMGxaoZmuOsx13HGyrUBOe0UZinYj03xHMguoBDKkKWlRwEba6FrSLAh3HLSn1
	v2HaLuqaEe7MFPEQioEetuS42/tFznMZhw77zNCmWjFUI1WGIAbP18MBFr+NDDgc
	HB2dbTuCjbtG3ntDNbnDGjsKE0/HnxJCRlhqjsd9rvdLxViSwPbt0Wm0BdzZpY0z
	OSG7yu65PGTOAm3wtTVXOdLnHEXyhQ9NklABB3fDqx3nMTEVmu6FgER/p0MY8qtu
	3b8oRAdv6oJQ2FJ2mbhWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785998121; x=1786001721; bh=t
	5ehuwu+R3IZPenGVdecVG/3J4bVeduLS34R82/gLXE=; b=QXdrD7w1A3DX4irO2
	HaDOxTuy5YHbI/yQZ6pPBQFsjJyv9tdB5NsXAb4IIePejY9yDwm7KpstmsOi/VyE
	/YgA8pjETb3fltVJd/dG+FY22G08hhttzAUjNTq3vbVOf0nnCZfoW4XJV9MI2+B2
	t9343Buf16WL0D26WngIm6mC/2XKY6lsA+xb7J4gnqqkrjMg48iMbkMXBbvQwaF1
	BBap1tiMiIeit6ENJ6G2AxNDk4suV0HvgSJ3NzVsnZ8fSYZn4iyj5rcI6rSX48sU
	1hL4r7bPVFCoWFWD7/CcmkQNPFgLaUPDt2wW3pcm08yNl/B00aLkYWJsMVnyB/vX
	mVPBQ==
X-ME-Sender: <xms:KCt0akkr-DBy9bHH0TPprtmLwznHRk3OFHe4I-I1_U7CMW47qxPpAA>
    <xme:KCt0amlQJC6ioUj4Jf1VmY00sgVVv0kPjMnQv8QhXCjcYMXdp7vAnbn9EgJEDCPNv
    IwEnrOVushgzS_Tku7qlN5QDAItPRzlbyRQu2S73LKhUXy0gcOgyjqw>
X-ME-Received: <xmr:KCt0avgt3QfC5gCavSRDijWQMWSAtmVaELT1M2jfV3I4ANwoe1cBL_Uit3Rp17O1vuZZFaDZ2Q>
X-ME-Proxy-Cause: dmFkZTEh6EqLEron4P620rfA50oje5pogyeStsqRC64znWcm/DBV15Jp+RPu9rfpq1CYYb
    UFmLU5UCxdxDCYby+qIAZtXGI2PUlpFQNXwfYq4ttCgPHbGa62/TDDwxKwLB8tX7dfhqau
    EbUP3O00RQtnFbFjlgrSaMtfjvGvqyYuejLHQ8kaCQjYwTQGvwYjMVbSb1Jvpanl+FPpuM
    SqFyNQH/92jvSpo2kN70zd3lo4jOKuY6rGBanj09NT9Qpf7fxDVsJep1Tqo9Yuq62YMLgS
    +erfmDCU3gBbJvDrolUKAZwfNdHwfv2Y4EHW05E61S/1zu1MOw9sAC69rBYAvxBuvfJpKB
    sNgktNu3xw1nGoj22GO+W5T0Zb8CV2sxrjpp1wE3z55hR72lGdowyUxua6a5gOeMQPWFX1
    rhLvLAUvSzocQG+U+2+Ub3ixXuyTQVuV+6bKEyf9DgcUrsb5p6DAT3QodELnLoX0HVMwrO
    H3YJqFAkuf8kh7CNVI6UBYwhhFwE9wgAd1gGTPrwrFKgxYq/88cuKb0JntJZ5uvQqMT1+3
    FRK20EEFiCltgqE3GCusWLJW73x1g1FPsp/i8m9WbeVpaVRcZcPduuY0RcRa+pShIoEF8l
    9xoCD8hDThmoa17aNn0oGid8xP+hYOUzeshnWHi0N1E01mm3enTZnsAbR/9g
X-ME-Proxy: <xmx:KCt0aoETGH45_keAmp2hX8jf3UEXneob5wWRU-P2Ase-O1-3pQswqA>
    <xmx:KCt0aqYpIYTuAbaN0IwCN5FkTsse0B3ejo5KNClAJ0_qQVCP2hj4jQ>
    <xmx:KCt0arM8_mp3F90BTPnebF9ZBQMrkzJtTOMqDM_r3-5mpBA2nv0uQg>
    <xmx:KCt0al0pr0gInJrXgsElBGu-DENKQZt7AEImn99SlxhXMLDGX50Q_w>
    <xmx:KCt0an1y38ibLZ-0tLpn454tDsDhBRptQzAG2ke9BzU8dVv36N9Tbsw7>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 02:35:13 -0400 (EDT)
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
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v6 5/9] pmdomain/rockchip: cycle optional power-domain resets on power-on
Date: Thu,  6 Aug 2026 18:34:09 +1200
Message-ID: <20260806063413.350184-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806063413.350184-1-gahing@gahingwoo.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_233522_391299_FD9CABCA 
X-CRM114-Status: GOOD (  13.42  )
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
index e1857f878..4eebb5d99 100644
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
+		error = dev_err_probe(pmu->dev, PTR_ERR(pd->resets),
+				      "%pOFn: failed to get resets\n", node);
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


