Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8237AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=; b=kzO0YMALm334ojHx7Qu3RcUL+s
	oCeIOhEqWLNh1PNkfhnSN/HK+r48l1sT7f9s0I8B4CMLAHC7aT5y3d9e6IJ5jnI5F1eAi2w2Apjtv
	JVRORK3vWsLuB2Tj0saPwLxdXT8cx/P4JcbZjTWwHKIzlNjAZupC1S/RIOiS9hkRSlw8SHNAZUIsX
	5t2vWRR6MbWWRGEYIAHVY+MfJH+v5gf1d/WWLnaMsQub5Ywj0uagYdpZK2q22SJ2RRHJ0qM5rAX03
	d1nCw6WTnzBpJKeNwxaL7HO/MdRD17cghhqvjzbwglBkQ6WqGGfgIdoHNyLMDK6YHjTr1RF8WCuK7
	lITZmpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTUZ-000000057i4-3iSm;
	Sun, 19 Jul 2026 15:31:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTUW-000000057hd-448V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:31:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10306475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784475103; x=1785079903; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=;
        b=Ts+McCe9+GuBhFpIKp8h/D9z4bCiFxZ1GgGWjswGInN5Gwa0jDPxg0QuZoWD4qJAY8
         xwT/zGA5M3ulaMYZamE0HVNp8qBUja5boAHNbNemp3WFjSiTlGPa+caB7X224SoZFQMH
         KDOwU663inoH6/15r4/bIhAUARD4cj5jJRP8naeYTGkSpaMsurKyxipuVTZrxEXTXTby
         b0G3VLEvzsWMBzlb8tvt3sXPoMiybGkRlYKYVtJIpcCygzK4b9ir8AKUVJvR9Colk0jw
         961gRe+FdBa73MFfCOByifHzjN6vpQFo4hwAN4BjfrSMpFM/dz0QNdcG+Ftku4Qr7qZT
         bVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784475103; x=1785079903;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAIvFoHSot582y5nPwOQ/4JfZFN3JPm5c7b4D+Z0OhU=;
        b=Um3BgsBd6DW/CzutpGmm5+TcQT4W88Kw9jXyllVBJHkH5ig/jWeYeg1uYpsF9zwtJI
         2vvQPHtLFSqAMmH5KHgbsg8pNkHfO31uS9KLXicrmFZ1ymZ/ibbXy89wtn2sVkgwm2Hp
         C7mgh+NHMs3U16MhrBaoPd7hr/kEX9K7+pMrzYCLqf/iVl5b1aT/ztbK0jbptJh+waIw
         Q3+smn8lJaze0d6f3upVSxf+YaARRzZbZRNl6u+RPon0sqoZRc0H65p0rA+LhTtcndCs
         9DYThlhd+sakvJPt6al2pcJh6wzJpXdp0413b+59vtCArGQbZOK/Qqs++nF0y8oGaz5T
         Sn1A==
X-Forwarded-Encrypted: i=1; AHgh+RpCnMgQzPkots91moaysCXt9LZxbXbTgad5ZNiGj6a8bCdWs2JLhLith7H/1gcOGEqGvt7Ngzk+dXerjXuRoC2f@lists.infradead.org
X-Gm-Message-State: AOJu0YwnNeBUEZV4bMHYtjXMZxvtm8p5AT5Rngzfy8qv7UViuazYzrcl
	EhARkpHVvGBqY55OkmJouwbTH667Ac8uTpsncgPMxnkHR4Nv64VeHd0DButzxvfEgxM=
X-Gm-Gg: AfdE7cmOCxmW3jkIIplhd3jZ26JhkvI4DIMAZSJ4ouHD38BJF4jAGSU28cYA1Wgp5Zt
	Em8v3wiI1mM9HFQrWyjbzkQ5OGNY0qLRuhWI1I5E6+OWKhFbLwlim1H7AXuAZ8Iq758+sxhfCSi
	hihbiNqmE65SNRWqFrWK+T0joXFIM4/0SmApA8j0A3DOcTYWNe+noxZ8kI0qDnyE9t1Ns0chCdE
	BtUS7hBN8z9dHJCGgZL0pQK2BG7NcWbZIeAscOxLpiabPDibQtV4wv7UkJ+k2U7sMyxpWBnxJ5D
	vDi/4hHFerhH/4SK7d2W2xMv13WS3M+SVG7cXAGoOLeocEpuck9DHPWnxF6AL3lyWJB/AwAd/nW
	uUFoF/fpVxoAefZ2WtwXr60oRzkDnQLNNggH8eLp1QIWJsWfoeVUGMLMbPjqmzajPQ4nrucNYxl
	Ozo5+IEnUJiJpA3N4veHOFxJb2wqb/bpgL8hAg
X-Received: by 2002:a05:6000:4b11:b0:476:7036:f854 with SMTP id ffacd0b85a97d-47f622f83ccmr11899817f8f.21.1784475102735;
        Sun, 19 Jul 2026 08:31:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm20420729f8f.25.2026.07.19.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:31:42 -0700 (PDT)
From: Aureal <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
Date: Sun, 19 Jul 2026 17:31:22 +0200
Message-ID: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_083145_061854_29BAD1A7 
X-CRM114-Status: GOOD (  19.47  )
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

From: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>

When a rate change on a ccu_div clock also switches its parent, the
clk core, in the absence of a .set_rate_and_parent op, programs the
parent first and the divider second.  If the new parent is faster than
the old one, the clock transiently runs at new_parent_rate/old_divider
between the two register writes, overshooting both the old and the
requested rate and potentially violating the consumer's maximum
allowed frequency.

This is not theoretical.  On the Allwinner A523/T527 the GPU clock is
a ccu_div muxing between pll-gpu and the fixed pll-periph0 outputs:
going from 600 MHz (pll-periph0-600M, M=1) down to 400 or 200 MHz
(both derived from pll-periph0-800M) makes the Mali G57 run at 800 MHz
for the window between the two writes, 33% above the vendor's maximum
operating point.  Observed and validated on an Orange Pi 4A (T527)
with a downstream GPU devfreq setup; mainline does not yet describe
GPU OPPs for this SoC, but any ccu_div consumer whose set_rate ends up
crossing parents is affected.

Implement .set_rate_and_parent with the same ordering rule as
clk_composite_set_rate_and_parent(): if keeping the current divider
while switching the mux would overshoot the requested rate, program
the divider first, otherwise switch the mux first.  The intermediate
rate then never exceeds both the old and the new rate.

Clocks using a prediv feature keep the historical mux-then-divider
order: the prediv helpers look the prediv up by the current parent,
which is ambiguous while both are changing.

Fixes: e9b93213103f ("clk: sunxi-ng: Add divider")
Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
Note: this touches the same area of ccu_div.c as patch 2/4 of the
pending series "clk: sun6i-rtc: Add support for Allwinner A733 SoC" v5
(<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>), which adds
ccu_rodiv_ops right after ccu_div_ops.  The conflict is trivial
(context only); happy to rebase on top of it if it lands first.

 drivers/clk/sunxi-ng/ccu_div.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb..9024bcd8c 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -130,6 +130,41 @@ static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
 	return ccu_mux_helper_set_parent(&cd->common, &cd->mux, index);
 }
 
+static int ccu_div_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate, u8 index)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+
+	/*
+	 * The predivider helpers look it up through the current parent,
+	 * which is ambiguous while both the parent and the divider are
+	 * changing, so keep the mux-then-divider order the core would
+	 * have used for those clocks.
+	 */
+	if (cd->common.features & (CCU_FEATURE_VARIABLE_PREDIV |
+				   CCU_FEATURE_FIXED_PREDIV |
+				   CCU_FEATURE_ALL_PREDIV)) {
+		ccu_div_set_parent(hw, index);
+		return ccu_div_set_rate(hw, rate, parent_rate);
+	}
+
+	/*
+	 * Same ordering rule as clk_composite_set_rate_and_parent(): if
+	 * switching the mux with the current divider would overshoot the
+	 * requested rate, program the divider first, so the intermediate
+	 * rate never exceeds both the old and the new rate.
+	 */
+	if (ccu_div_recalc_rate(hw, parent_rate) > rate) {
+		ccu_div_set_rate(hw, rate, parent_rate);
+		ccu_div_set_parent(hw, index);
+	} else {
+		ccu_div_set_parent(hw, index);
+		ccu_div_set_rate(hw, rate, parent_rate);
+	}
+
+	return 0;
+}
+
 const struct clk_ops ccu_div_ops = {
 	.disable	= ccu_div_disable,
 	.enable		= ccu_div_enable,
@@ -141,5 +176,6 @@ const struct clk_ops ccu_div_ops = {
 	.determine_rate	= ccu_div_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_div_set_rate,
+	.set_rate_and_parent = ccu_div_set_rate_and_parent,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.47.3


