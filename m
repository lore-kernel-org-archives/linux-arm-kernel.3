Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B51C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOcxr0r4B6mG0penADxapnFXlT75rDmS0IOhLRToCPo=; b=K4u/1icYWtya3ziEcf8X0BPWe+
	DQrF34VjW+dsBj2f1H+1Wci2LA3iSPv2KS021wv+YbEA43In2wPsWouun3RW3xkuJx4EYiMaW9PH0
	ZyQoEilyqDbKS26/0TSoL2XcW3Htn+ENmyLoy0XaLXXGKTtohfJUMVR6+gDgZWZfDVZhibwg9ZzF9
	8YCzGBtxesCR2EJ6V9NiwBxiMBEZgKQCKH0AWIvl9siyGTXk/ZGIs4h4Gbp0bqUXFn0llISu+ocT/
	B8QUSB0GtoEzasW9DUi/GhTsXfneie1ehh299UE8o1EiamfVMPvqy/YebM1CCj+aYABl5lrH1CAz3
	77iPegkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbvw-0000000412U-3au9;
	Wed, 05 Aug 2026 13:45:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbvt-00000004115-3KO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:45:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15d47266baso119077266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1785937519; x=1786542319; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WOcxr0r4B6mG0penADxapnFXlT75rDmS0IOhLRToCPo=;
        b=rlSzr3WNkDshU+K94Bay9GcM6Dlv96iKuTfD8Laf+kS40Sv96vDICelLh8JXvYIT3y
         ZKLOH5bvOC4OtxDqVsw65+PcaSY8qovogBJIxbMwVEVprr/YnXawz7Aen0TKhbxKf/kq
         qFjvhhTteVyJGjMoBt/Gk5RjfA5Qvnmu4gRRLfOTPxS4eC1x7QHCmU38hPJX11O25RZa
         A3IU0qcsV5VDd/oRApwBKMZPURBZCsrCjCCw8h4yfVEFUngFAp8dzVld4Ylee6iSWmXG
         d0N8hcPfjcWD77Z3H/mayVv0ZTJkZv3WNLfcZGtE8w5Fe+JAkWO02zOKuQClQkFQ5Ob8
         L6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937519; x=1786542319;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WOcxr0r4B6mG0penADxapnFXlT75rDmS0IOhLRToCPo=;
        b=gKvBvXGEdzxBvhFKQw9v3JTZTwKPbGdGfmIqDxTWOupA86Im4Mt8bmYfXdBfAnPG0T
         aJrQTlDEagd3JDqB3yo+4dPqPHOepnHYdtBe6hgFD5/VMuAawnORYMYc8YWxSSNoexoU
         h7bcvjgWmhOs7Nqzb9wjxGBx+8G7Qz1Um/c+knaHGDhbx22pCXV66iX8xd8ToLul+Wwo
         9wYFU9jprbd+tkV9FXOf1Bz65l1tlycXT9CDvxWdzCsuTNRctJuaL79QPZ2sHpQggVHf
         Lyl3KiwkqzUY1ADfU+TUTiCLzbXFPaRZHM5i945LANCvC4MJxbR88rnZ+KBWU8jlMvEk
         ogjw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0IA2e80i4V6W+6i5MZl7TIbb+Oq0NCLJdj+S6Nh0HMPnvjRjnB8oWLUpemddCi/aFGC7XFW8Y4K5kevOwOycV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjwyz+r7ulX+dgAuWRejQuevcWkDW0G54fQczG6c8AvwJ2r6X5
	xNouKwfhV79CNe4X5ZOTtoZ1P9ZJ15LnBKNNtaQcjgMerSiJ9wQDVEnsPN9qxNVcfIc=
X-Gm-Gg: AR+sD107O1CJ/7kP145i0pL2G7yfSc8R2oxea05+5MLv8MY+3Vy04XmYPmxl+GyjsSW
	4jE0E3ehmrm1DNWmVeZ1RDabPcltEwF1GQ+ebBrZwIQLWzbcb80geIdPP8+ohEkvTViOP52PxHx
	4Eliy5lDRILHX8eL7YJbJ9nQUWHRAMheebKQu4Lauhi3hTxTLbYsJ3FfPMrtNVUfmOPpBPgZn+D
	1wShwmmvSLOheGiYNTbtD3xbTVty0B9vpzz1up5mhCGCEaWjOrAwnXqD3BpaX7hHGu1TTRPnC02
	nPZIyp6N0Ocog6YHyPvZg9k84P4Iq2mQwifK/CY0Ld+E8mLgHpw2fofGSUfduZe6vMAvrj17U0b
	rVJ71FQg7zBdFVMUl+Swrz9wsUCc5qhrF4nIODdJXvdb7Q6YOnjoB9/Iq1anPGqbtfCSen1Zh29
	TSbhm/svv6RCThtRTRmr734OL+h3pe2AEi/sABykeusQ/NI2t0TdQT6Pbp/pyS0GCZo8LYIkUBr
	RUudjW3UJ/6fdbBKwQio/G9ffOTQ/+Q0pTfqpUj6Q==
X-Received: by 2002:a17:907:1614:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c2039ef1567mr294580466b.21.1785937519280;
        Wed, 05 Aug 2026 06:45:19 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-41.alshamil.net.ae. [92.99.174.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a16577d59fsm1617670a12.10.2026.08.05.06.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:45:18 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 05 Aug 2026 17:45:09 +0400
Subject: [PATCH] clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-rk3576-spi-clk-v1-1-2f040d0d163b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IlZjYq4gLTUYdLVYyrQiSu
 xvb5Vv8f4JQYBJ4ZicE2ln4vSY88gzc1K0jIftkKFRRKas0hqXUpkLZGN1rwdJ4stYaM6gaUrQ
 FGvj4DZv2b/n2M7nPfYEYL9++TxRyAAAA
X-Change-ID: 20260805-rk3576-spi-clk-37de88877f09
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 YouMin Chen <cym@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3497; i=alchark@flipper.net;
 h=from:subject:message-id; bh=O1dK7PbUelw/4/J1OKfbGHie7DYKMuZjlf933Pye7bY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQV22XfvvmuqP1RUldnq1nfdpZ5hndVIz79f7PVW/4mp
 5fj5Tu1HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1BSaG/85lXT8ibTi0Dv9zX5KQtMzq3YsFcfwX5U2Dg68fNH+meYPhDxf74pk
 Xn+Sl1rTNlldp2/O8b9pH/avLzB/EXXBV3n0kjBcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_064521_891269_0BCD2E0A 
X-CRM114-Status: GOOD (  12.60  )
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

The TRM defines available source muxes for SPI0..SPI4 as
 - b00: clk_gpll_div6_src
 - b01: clk_gpll_div8_src
 - b10: clk_cpll_div10_src
 - b11: clk_xin_osc0_func

Which doesn't match what the current clock driver implements, making it
impossible to derive some SPI clock rates such as 37.125 MHz (which
requires clk_gpll_div8_src as the source mux).

Add a correct mux definition per TRM and point SPI0..SPI4 clocks at it.

Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Hitting the bug requires explicitly setting the clock parents for any
of the SPI controllers, which no mainline users do currently. This is
therefore a forward-looking correctness fix and probably doesn't
qualify for backporting to stable.
---
 drivers/clk/rockchip/clk-rk3576.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 63f229e73a45..2cdd667f4004 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -315,6 +315,7 @@ PNAME(mux_100m_24m_lclk0_p)		= { "clk_cpll_div10", "xin24m", "lclk_asrc_src_0" }
 PNAME(mux_100m_24m_lclk1_p)		= { "clk_cpll_div10", "xin24m", "lclk_asrc_src_1" };
 PNAME(mux_150m_100m_50m_24m_p)		= { "clk_gpll_div8", "clk_cpll_div10", "clk_cpll_div20", "xin24m" };
 PNAME(mux_200m_100m_50m_24m_p)		= { "clk_gpll_div6", "clk_cpll_div10", "clk_cpll_div20", "xin24m" };
+PNAME(mux_200m_150m_100m_24m_p)		= { "clk_gpll_div6", "clk_gpll_div8", "clk_cpll_div10", "xin24m" };
 PNAME(mux_400m_200m_100m_24m_p)		= { "clk_gpll_div3", "clk_gpll_div6", "clk_cpll_div10", "xin24m" };
 PNAME(mux_500m_250m_100m_24m_p)		= { "clk_cpll_div2", "clk_cpll_div4", "clk_cpll_div10", "xin24m" };
 PNAME(mux_600m_400m_300m_24m_p)		= { "clk_gpll_div2", "clk_gpll_div3", "clk_gpll_div4", "xin24m" };
@@ -706,19 +707,19 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(16), 0, GFLAGS),
 	GATE(PCLK_SPI4, "pclk_spi4", "pclk_bus_root", 0,
 			RK3576_CLKGATE_CON(16), 1, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI0, "clk_spi0", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI0, "clk_spi0", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(70), 13, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 2, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI1, "clk_spi1", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI1, "clk_spi1", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 0, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 3, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI2, "clk_spi2", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI2, "clk_spi2", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 2, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 4, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI3, "clk_spi3", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI3, "clk_spi3", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 4, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 5, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI4, "clk_spi4", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI4, "clk_spi4", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 6, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 6, GFLAGS),
 	GATE(PCLK_WDT0, "pclk_wdt0", "pclk_bus_root", 0,

---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-rk3576-spi-clk-37de88877f09

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


