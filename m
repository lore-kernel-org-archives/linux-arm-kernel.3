Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1320C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nGgQrHIvxE5u/t+uTXqnjxXC5oFqExc+UD/soosM+A=; b=LXWQPNv8IJUaNOv0VxRNZGVkvD
	igSqyEqkVCSQM8Gdd7+3+uPf3lqWiwy7+99EeJdu1fZofN3+yqR67K5LlhVSPI3xa6bCODWcL96KH
	t1Yej7FW4aBTD6Zw6tEza1Oki6ry4CDH1NVM6TQ3eeMbC50pPwYLKxhv1ez3i+0Q/o3TY0NbVBTG8
	QTsEvDrk9tx6VQfi9i2xCc7roQTcoEIAJxCvRlrDRbtgqOv5Ffv32ni2cxY7mrh+a8QIFFCA3KHPZ
	AiT2j+THl8vp8oNur8t75Fkr6h28lt9939ujTHBpxI6z/DI5E3Zka02t60Ygc604Z1RNKA0VuClwp
	bIlbC9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL02u-00000000nbb-1B2a;
	Fri, 30 May 2025 13:45:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzwl-00000000mbX-3ac8;
	Fri, 30 May 2025 13:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1748612323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m+WSjo+Zqh5eToFYu8giick7htO+p+Lxhm2o5GOi9950lvDydU3Y9Wm16JKv+kq9VNEG4xDgYDi8/yAEskxlq5YMVxsHUBUu3fpFnEDTergC7rCodYf4FtfgCW7wTfJKGMLOB6b6FAPlLWe8Fep05xxqDZBXEIAsQyE1Rt0dNkU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748612323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0nGgQrHIvxE5u/t+uTXqnjxXC5oFqExc+UD/soosM+A=; 
	b=ZnGopw/+HKzg6RYtSg3nOrw3IC+CsKx4K4+Cdy7MwvLlk0WNKnvpW/Nz4AzkNh7MZO2wuzkquYvgpDdCiq9dUvc88merOhMbVl7y5GLn+wTIYtFVwItSAdk9F4jDF6bzyh4XV9XEaH3F0DIZHr5AvTx7VO7ZRJZfGlfJ/rqZcV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748612323;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=0nGgQrHIvxE5u/t+uTXqnjxXC5oFqExc+UD/soosM+A=;
	b=PIsyC/KYzKKSuepcOkv6sQRAyjBhmoj7QNJIJ0nDxejKN+QRhS+8zs2KfOlaxW5I
	PsaNmAPSIXzfDbLZHJae77ff9CqGksFJBe98fLZSqAneIqJJzLVc7ffMDYlx/E0kltn
	P9KzJMG5dbDF4SlvXtbK3aiAEM6t4Aj00NzIUsuA=
Received: by mx.zohomail.com with SMTPS id 1748612321549996.3145139147584;
	Fri, 30 May 2025 06:38:41 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 30 May 2025 15:38:08 +0200
Subject: [PATCH 1/2] PM / devfreq: rockchip-dfi: double count on RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rk3588-dfi-improvements-v1-1-6e077c243a95@collabora.com>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
In-Reply-To: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_063855_984502_470148A5 
X-CRM114-Status: GOOD (  20.04  )
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

On RK3588 with LPDDR4X memory, the cycle count as returned by

  perf stat -a -e rockchip_ddr/cycles/ sleep 1

consistently reads half as much as what the actual DDR frequency is at.
For a LPDDR4X module running at 2112MHz, I get more like 1056059916
cycles per second, which is almost bang-on half what it should be. No,
I'm not mixing up megatransfers and megahertz.

Consulting the downstream driver, this appears to be because the RK3588
hardware specifically (and RK3528 as well, for future reference) needs a
multiplier of 2 to get to the correct frequency with everything but
LPDDR5.

The RK3588's actual memory bandwidth measurements in MB/s are correct
however, as confirmed with stress-ng --stream. This makes me think the
access counters are not affected in the same way. This tracks with the
vendor kernel not multiplying the access counts either.

Solve this by adding a new member to the dfi struct, which each SoC can
set to whatever they want, but defaults to 1 if left unset by the SoC
init functions. The event_get_count op can then use this multiplier if
the cycle count is requested.

The cycle multiplier is not used in rockchip_dfi_get_event because the
vendor driver doesn't use it there either, and we don't do other actual
bandwidth unit conversion stuff in there anyway.

Fixes: 481d97ba61e1 ("PM / devfreq: rockchip-dfi: add support for RK3588")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 0470d7c175f4f6bb3955e36c713f4c55538d1a87..54effb63519653d20b40eed88681330983399a77 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -116,6 +116,7 @@ struct rockchip_dfi {
 	int buswidth[DMC_MAX_CHANNELS];
 	int ddrmon_stride;
 	bool ddrmon_ctrl_single;
+	unsigned int count_multiplier;	/* number of data clocks per count */
 };
 
 static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
@@ -435,7 +436,7 @@ static u64 rockchip_ddr_perf_event_get_count(struct perf_event *event)
 
 	switch (event->attr.config) {
 	case PERF_EVENT_CYCLES:
-		count = total.c[0].clock_cycles;
+		count = total.c[0].clock_cycles * dfi->count_multiplier;
 		break;
 	case PERF_EVENT_READ_BYTES:
 		for (i = 0; i < dfi->max_channels; i++)
@@ -655,6 +656,9 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
 		break;
 	}
 
+	if (!dfi->count_multiplier)
+		dfi->count_multiplier = 1;
+
 	ret = perf_pmu_register(pmu, "rockchip_ddr", -1);
 	if (ret)
 		return ret;
@@ -751,6 +755,7 @@ static int rk3588_dfi_init(struct rockchip_dfi *dfi)
 	dfi->max_channels = 4;
 
 	dfi->ddrmon_stride = 0x4000;
+	dfi->count_multiplier = 2;
 
 	return 0;
 };

-- 
2.49.0


