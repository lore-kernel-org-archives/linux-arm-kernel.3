Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1CCCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PApkcFbTCnyRYxUfeFOnQfHUO+BQWYgzQ1hqLVaTxfY=; b=ms83hdKTEPAymvaU2uHTadgc4I
	Nc4JnlJzS/7o/PTI3V4ZmITalQI5rzTylf8YjhaVcA7rf4zjYRkmwZ1WMyRy7HD4bwFusJXtaJI/a
	6YYuL3/VArttfh3/YMcwzlqQYA9tNM6TLJE1Ru7t9wMVcLEpsAnsfEmXVFe+RN4dO+hi3IKqb1V0/
	mVmPSWXhMEqyrGGVsLH5jXm8bQJyJTvhDajL8yeN6lh8W6GIeG6SNcXTvcpwZYSlGQc/6lsyYApds
	441svUsNMVYGjQ9NISSK8xfxImJ95kCqQjlcENVNvfq1D/waBuO7GfhuJCT50GseCtIeG/mftFrHO
	rFQcUSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7XA-00000006pqm-2e2S;
	Tue, 23 Jun 2026 20:15:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7X7-00000006ppd-1iti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:15:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b9318997so1590785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245743; x=1782850543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PApkcFbTCnyRYxUfeFOnQfHUO+BQWYgzQ1hqLVaTxfY=;
        b=SCgSt63zEqECDmhFC46iu0SVJXjGMpRntiBSn9mOg+4yfw0dj3PKGolEmJpkRaL3d7
         ZhChx6l0IUa6nQafgPTzCoOrEGjOQiJZhAmgq1aQ5jDE9ps0wMHqk/ldeS0rJ6oTTdLV
         IdBf9/sn2XKI0aVJWlVznfVJDOPm1VLm3GDPE5Pgp1vrR953G9oJVddS4Vt01QPIH5N0
         3mtxz/8wkFkvxS0eqd7+JS7Ausq7L616CiiQq9Z/60PAlclp1gTMBCXBrYh+s5o2zCNk
         fHtpH4vadg3+N4YMq/hezQIip40Hk68KF7ZQT+dCirpAHrTydhVLyOUhdA+CZ7ZQ4R0j
         /Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245743; x=1782850543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PApkcFbTCnyRYxUfeFOnQfHUO+BQWYgzQ1hqLVaTxfY=;
        b=dCgfgCidNHNlaWnMC+LgI/fN25IKWgjPKl1MZ8XvcdZy5jAv6jaAeIkY0NZ5NEzkmJ
         AW8SuJiWyialxm/P8nU6kfcgIOAbDvXZkIL/RiZ9f40JEJryKQGJeEK6Eczz5eghueFX
         WpDtDMZbrvyTYC2veOND3FVDBCFt7rlJHeQXAlPoQRFc87VszZ4RQX2SH78MZaIoI7Tx
         Fh8qydltt9fzBK2+Rnz97PgKXfoAtytBc9MA6RSvYRqIePogs4yCD4RBkbfh79aoc3Wa
         WY0gJYFA8tumJIxJv92sylw/1HHEW0gdgb3uRHgcbbT7PPNhySJM1xrPvTCgwnBfYk6D
         ctAg==
X-Forwarded-Encrypted: i=1; AFNElJ9nxKmVcUAIi/RUZYTUjGsooW4du1WRe4CGhYBS4A5/kOlbF5fUy583t8wIF+mk90noUxPw7fd9MogjtzQcICxp@lists.infradead.org
X-Gm-Message-State: AOJu0YyVnGXsqTlMHOVOrNhTUxrpb5yHKtN8wAQz4txxN8NKUCL6ujnx
	MO56WbQi2VVI00hcsfrudRcojjA6nojhB/66D9/HojK3t7YsJQqDqUUA
X-Gm-Gg: AfdE7ckhGfzOvXAIZ40IH+XviqpFuzdTsmCaqygMWPy4kVbvS5H8NkunJrxzhk1yFwL
	elNbhaREA4FD6ff/+4MhGaNZ/SZU7TfSPy3vVHNwFNlDetJI4X7y7CczkcQ6khgk2lm7l4RA239
	Ln6LnCCY/eUCsFuCF7aIXLRsFpjHGuL3kT24dG1PvdKwyM1e5yt2s3NBpB/FjiqNONE0OE+e7/j
	Blm8FZ3zWxfkHkc2RAJVmXHmM555eUMlHzbSlsCAvG8OBMVOHttOPeHN2Md8LA11oz8yTJv8iXq
	lySj7b0GqiKUxhQHZtBo+rSszCkpwZTjwSWcn7czu0uy7ik/zfjf+d6SclKDYDD3bpGaWeDriA0
	fflFP1Qh5xEFe6vWvUNBowYrghnidRnCjQ5xX9o3PzBbb6B6k4nNARxEw+J2JnWRH3EpOD7Jb3M
	LJGdUDsAvNXwuDqHRqDiaSuPU1TFZ9/0VHZs1yGzg5n+ywYVN36oCrY3Ry0KEB64LHBXy2mUCwf
	eex99Yx4pCK0FewGyXjWWUrtsvOBOIZ4Rhrvjhi7Uk=
X-Received: by 2002:a05:600c:820e:b0:491:7325:39c4 with SMTP id 5b1f17b1804b1-4926087f7f8mr1421665e9.34.1782245743299;
        Tue, 23 Jun 2026 13:15:43 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-a9b8-8b00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a9b8:8b00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4923fd1f886sm374378335e9.4.2026.06.23.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:15:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumentstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Tue, 23 Jun 2026 22:15:22 +0200
Message-ID: <20260623201522.1322463-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_131545_493388_CCC80711 
X-CRM114-Status: GOOD (  15.40  )
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

From: Martin Blumenstingl <martin.blumentstingl@googlemail.com>

The following out-of-bounds read has been observed by Christian on a
GXBB WeTek Hub:
==================================================================
BUG: KASAN: global-out-of-bounds in __clk_register+0x1b70/0x2418
Read of size 8 at addr ffffd66320cf88e0 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc5 #1 PREEMPT
Hardware name: WeTek Hub (DT)
Call trace:
 show_stack+0x14/0x20 (C)
 dump_stack_lvl+0x74/0x94
 print_report+0x164/0x4b0
 kasan_report+0x98/0xd8
 __asan_report_load8_noabort+0x1c/0x24
 __clk_register+0x1b70/0x2418
 devm_clk_hw_register+0x74/0x15c
 meson_clkc_init+0xd4/0x20c
 meson_clkc_syscon_probe+0x5c/0x94
 platform_probe+0xbc/0x17c
 really_probe+0x184/0x844
 __driver_probe_device+0x154/0x35c
 driver_probe_device+0x60/0x188
 __driver_attach+0x168/0x4a0
 bus_for_each_dev+0xec/0x180
 driver_attach+0x38/0x58
 bus_add_driver+0x238/0x4c0
 driver_register+0x150/0x388
 __platform_driver_register+0x54/0x7c
 gxbb_clkc_driver_init+0x18/0x20
 do_one_initcall+0xb8/0x340
 kernel_init_freeable+0x49c/0x52c
 kernel_init+0x24/0x148
 ret_from_fork+0x10/0x20

The buggy address belongs to the variable:
 gxbb_32k_clk_parents+0x60/0x400

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:

Memory state around the buggy address:
 ffffd66320cf8780: 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
 ffffd66320cf8800: 00 04 f9 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
>ffffd66320cf8880: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
                                                       ^
 ffffd66320cf8900: 00 01 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
 ffffd66320cf8980: 00 00 02 f9 f9 f9 f9 f9 00 00 02 f9 f9 f9 f9 f9
==================================================================

Commit 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock
parent") dropped a non-existing clock parent from the gxbb_32k_clk_sel
mux but didn't adjust the hard-coded num_parents field. Fix the actual
number of parents of that mux by using ARRAY_SIZE instead (avoiding
similar problems in future).

Fixes: 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock parent")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumentstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f9131d014ef4..d432e08d1777 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1394,7 +1394,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = gxbb_32k_clk_parents,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gxbb_32k_clk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.54.0


