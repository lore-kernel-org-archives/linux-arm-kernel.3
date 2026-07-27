Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D7C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkUC8oxtTLVbG9gefAI5aqzXAWxEmZasbXVvS7KqWuE=; b=Oumy5WsQacKaEqyPAIw5KMI/k8
	6OZUJc1C03wVY3P04zolOjcmRJnyC0JVYo1yUmLfNN9N7p03pKDtjwddB+kr8ytN1mjPA1IQZKkop
	+w9SkJdGQrydwY7/lHKg98JVZiVZ4xNMjb8xpsccSIULcySua+lA/QSu/kpANHooGunzS63U4CPcp
	kjQiT3BtcBBMBGIlsxgNL5u1jqQTRZlbQnKZYez3mnFeO8If5MxIWlVm1HVzY70iEgGdG4nth0NuM
	cRU0CsDiqx1fwK8MVzREJBHUlrk8k3QTeYj3IZtXwvfBuslFgmiAYWFJ2AGhcEavKLY+Koh2V/szt
	W/ll6Sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ1s-00000003eJ8-0Xtf;
	Mon, 27 Jul 2026 18:26:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ1i-00000003e8W-1IiY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 18:26:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so14785415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 11:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176768; x=1785781568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkUC8oxtTLVbG9gefAI5aqzXAWxEmZasbXVvS7KqWuE=;
        b=CKHMK6BNEE03mmziwmK9D8RaT0jb0DXf14pojjzAxE8nBf1p9G8N8SvPugEwcFY+yq
         Krw1Q1FT3/mRharDC7+wZ6F2TNfXcW6bPc75iPOqtRTkhPKfbgXcFglz+KRaYaLe8SxK
         QijiEndd+SaHK0a1yvSrgfX1XC8waQbKrUPmwKxAswj3Y+jd9cYcB4e2r2i5MiITzfQF
         lfFxfWhNxQ6cxZ/o2fU0WiVnDFJyvhFoKZsGsFvcxASJMn2yDRHXt70IMwZ7CaikDNcE
         SRLgzOj8jIB/fzlJ0wLbluDAiqnLsoCdsISDcy2dffvwxqwmsT/5q24KOZ/h60CgPl+Y
         iWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176768; x=1785781568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkUC8oxtTLVbG9gefAI5aqzXAWxEmZasbXVvS7KqWuE=;
        b=WGG2LY4Tl/+7NK+tY3GGBHs7h8K1exhEWmbpjyxGtIZuqBoMCwRhW+dPSrIjmiQEgW
         26A8ddBLfrhj3ADlK8/UtG+5MqhETgrFK7EdURCeMN3XR49bQ2HrCswyhVQW8SoclLyL
         zK91pfZoIHtc9GdNcdIasgEZdQDabFtP+gZ9gIT9bfxHpEPSOFeWntVyhJyEAAWxqkeO
         FX8l8C+CSIrw8+miBRPUbndYOclxJYuuUPxzWXUDTWL98mrln9TvKnLDFZWRcKf8TKz4
         W/XaJtW705a6VGmt7Ft8pMajhfNAMSuPVb8xaHl+n5Bxy5pshHuT0qcPn+a+AhAIsbGV
         Kt5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrqagTZKO/7yFmUOi9IRcZumFRj6D+paC0htpCd0TG1uSziAU92qa77eo99/W1Sijq5xmFrCZn8x3bLkidjonxt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+AgWqqRHn7PzkfH3Vp1YT5PDA/V/ZTwQk1bCtKzxYcT6rI91
	Y+lg4lbQ7IEMl2S0E8ToCRLQh12eLwGShW9UilkI2rghA5egyH0Vnx7P
X-Gm-Gg: AR+sD13cqO9zqnZhEuBaXNuq9xJTeEXYogNO3L//eH+HbX/ZOmmugHUPKRWim863J8r
	bN4h7LZ9cZI8AM6q8W8WVDstSMDciMTYLEfYFGLjAvHchICqPnkHPQKqE8p0k6DfGKruagANaXS
	6drSHLIKqj7PGXKAP5P3vrTnbxK6bamQVqfyUNYNLssK5vfLMHtBgJMVmmxC3TPdmUTDsGNwHK1
	kN5upNnRPn5FWppwj88K2qQds0KlJ7yAxcbOEt0Oqss53aBq4q4ewBfuiTy0tv/qx6sSTYMljH0
	93gDcNvaPCP3FlZShiaP0yasFCAl+He1lIX1K1SGmkoujeTRdcfSYic2XirjbONYqnh+N6OyNPP
	4iM5wxAu2bFBt4LzPXvBpQKFuxYDoNLkNcyemKa8Ncuj7nlVsIJTcd3IXpd7hRg28Lwb18cmADy
	JjcLhKmX8R5048
X-Received: by 2002:a05:600c:310f:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-496c4f8ddd9mr3174805e9.9.1785176767755;
        Mon, 27 Jul 2026 11:26:07 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:26:07 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:24 +0300
Subject: [PATCH v8 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-9-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=19059;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=d6LWrivThhNNHzM4/MZP5HO5o0Sxe30ssuQEn9SpdXQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6jFbW5t6QqitbvCyTPUUGdvLuzKbnTebcY
 u3k5e98vBaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKNvw/8DPgpReHJLx2hMADXo/XwQRJWyWiEdm8
 R7DZo/E0j2GHIiYU8xSDISRBbDH9PIv80bVCeYpVy4E05B9Csbo6sBXrH3hS4GZmKMHvtDI0TSy
 vTpu0VQhZU2/Q0ZehNatGhon+Fcy7bymm7rwwsVPn4873Viza5WKitNoD1DMvxI+Cg1yiKkYHLz
 mLHvUy+EFm1CIjzLIJpVCbau8tQSbDAxFQTGMqJdKJ5VpY3953RhNDhxC1Sk5Y8b5A/mv8IZXQk
 WcCHxbTzpNZlWCqOugvQXq7X0bTQDSa2amGPK2Xvn2t3xa1Daufu5fcX82b04nAKZDGJsuDar2S
 ccCNWVDPICCDAQp0b47OSNH5MNTUTRFpRE65mfCgWst34iW+3vkltDyIk1HM7QHZ4Q4OR8dCnTZ
 SjkTtiO92WAntGJoxNYI21LTFl9qGhjMg8zJD4EEvUv0l91dgbMLDwR8hZsxc+M5apH5UotwXQr
 vedWURR4hk9WUXmkiKQfTGZje914v5Ya6WON1pC9UfH0jq9AJ52saWyq85Bgpt5zUlHnjZwk3Rn
 DpqD3ofwm/NTKp9KGUxVtLiv7owhD3EEHYc93PkXeBzBiqRhqocs6m/I0vRc+ZnZO763NkhEI1F
 x8CbSaCVqTnQXX6OEvtSEMcRED+8hpa0azliVdrJO75s/wMlYZAI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_112610_399357_847E5FF9 
X-CRM114-Status: GOOD (  30.72  )
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

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 8:
Add another distribution gate register: 0x118 gates off matrix-generated
divisions of mpll, dpll and gpll. It nicely fits the top->matrix forward
picture.

AXI 6.5 MHz is not an mpll child. I must have done something wrong when
originally testing this

Add explanations about additional ARM architected timer controls.

Add gates for unknown LTE hardware at offset 0x60. They are not exported
in the bindings because the actual name of the consumer isn't clear -
but if dpll is unprepared and feeds a bypass 26 MHz signal, this device
starts spamming IRQs (although the 0x118 and top+0x140 gates also
prevent this usually)

Double-check pclk and wclk of all devices. The SDIO and EDCP clocks were
flipped in previous submissions.

Version 7:
Reduced the input clocks a lot. Most MPLL subdivisions are children of
the same gate in top, so put the fixed factor clocks here.

Added a few more clocks: DDR_CTRL, AXI bus, ARM architected timer.
They are needed to tell CCF to keep the top gates enabled and marked
critical because they aren't consumed by a DT node.

The AXI bus is determined by a voting system. I've set up the driver to
write to the ballot register ZTE's kernel uses and enable voting. This
should make life easier with the LTE rproc blob later.

Version 5:
Make it an MFD child device, remove aux device
Fix zx297529 -> zx297520 typos
Fix AHB_wclk -> ahb_wclk. That was a leftover of my old composite structs
Add SRAM0 and GSM_CFG clocks
---
 drivers/clk/zte/clk-zx297520v3.c | 338 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 338 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 4444c2eb1382..9299449097b4 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -542,6 +542,340 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
 	.num_gates = ARRAY_SIZE(zx297520v3_top_gates),
 };
 
+/* For devices which have a working driver the work clock can be figured out by gating off registers
+ * in top+0x140. This is used for devices where I can't interpret the register contents yet.
+ */
+static const char matrix_unk[] = "matrix-osc26m";
+
+static const char * const cpu_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll",		/* 624 MHz */
+	"matrix-mpll-d2",	/* 312 MHz */
+	"matrix-mpll-d4",	/* 156 MHz */
+};
+
+/* Low confidence on the actual value, but at least I know it is bit 13 in top+0x140 */
+static const char * const zsp_sel[] = {
+	"matrix-osc26m",
+	"matrix-dpll",		/* 491.52 MHz */
+};
+
+/* We can't realistically change DDR speed while running an OS out of DDR (it reads garbage for a
+ * short while on transition), but we need to know if we have to keep gpll alive. 32 MB devices use
+ * 200 MHz, while 64/128 MB ones use 156 MHz.
+ */
+static const char * const ddr_ctrl_sel[] = {
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-gpll",		/* 200 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+};
+
+static const char * const sd0_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-gpll-d2",	/* 100 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+	"matrix-gpll-d2-d2",	/* 50 MHz */
+	"matrix-gpll-d2-d4",	/* 25 MHz */
+};
+
+static const char * const sd1_sel[] = {
+	"matrix-osc26m",
+	"matrix-gpll-d2",	/* 100 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+	"matrix-gpll-d2-d2",	/* 50 MHz */
+	"matrix-mpll-d16",	/* 39 MHz */
+	"matrix-gpll-d2-d4",	/* 25 MHz */
+};
+
+/* ZTE's kernel puts the high frequency first, but this is against the usual convention on this
+ * SoC. I don't have any device that has a raw NAND controller though.
+ */
+static const char * const nand_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+};
+
+static const char * const edcp_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-mpll-d5",	/* 124.8 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+};
+
+static const char * const tdm_sel[] = {
+	"matrix-osc26m",
+	"matrix-dpll-d4",	/* 122.88 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+};
+
+/* ZTE's firmware uses 0x128 as the PHY's vote and names 0x120 as "PS" and 0x124 as "AP" vote.
+ * However, their cpufreq driver ultimately uses the "PS" define and thus writes to 0x120, which can
+ * be observed in the running system.
+ */
+#define ZX297520V3_AXI_AP_VOTE 0x120
+static const char * const axi_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-mpll-d5",	/* 124.8 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+	"matrix-mpll-d12",	/* 52 MHz */
+	"matrix-mpll-d16",	/* 39 MHz */
+	"matrix-osc26m-d4",	/* 6.5 MHz */
+};
+
+static const struct zx_mux_desc zx297520v3_matrix_muxes[] = {
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "cpu-mux",        cpu_sel,          0x20,  0, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "zsp-mux",        zsp_sel,          0x30,  0, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "ddr-ctrl-mux",   ddr_ctrl_sel,     0x50,  0, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "sd0-mux",        sd0_sel,          0x50,  4, 3),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "sd1-mux",        sd1_sel,          0x50,  8, 3),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "nand-mux",       nand_sel,         0x50, 12, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "edcp-mux",       edcp_sel,         0x50, 16, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "tdm-mux",        tdm_sel,          0x50, 24, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "axi-mux", axi_sel, ZX297520V3_AXI_AP_VOTE, 0, 3),
+};
+
+static const struct zx_gate_desc zx297520v3_matrix_gates[] = {
+	/* Matrix subdivision gates: Almost every matrix-generated subdivision of the input PLLs
+	 * has a gate in 0x118. The original inputs from topcrm (mpll 624, mpll 124.8, gpll 200,
+	 * gpll 100, dpll 491.52) do not.
+	 *
+	 * I do not know of any user of dpll-d6 and do not know the divisor. An 81.92 MHz clock is
+	 * listed as a root clock without a consumer in ZTE's code. Most likely it is a possible
+	 * parent of the ZSP mux.
+	 */
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-mpll-d16",   "matrix-mpll-d16-pregate",
+	     0x118,  0, ZX297520V3_AXI_CANDIDATE),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-mpll-d12",   "matrix-mpll-d12-pregate",
+	     0x118,  1, ZX297520V3_AXI_CANDIDATE),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-mpll-d8",    "matrix-mpll-d8-pregate",
+	     0x118,  2, ZX297520V3_AXI_CANDIDATE),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-mpll-d6",    "matrix-mpll-d6-pregate",
+	     0x118,  3, ZX297520V3_AXI_CANDIDATE),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-mpll-d4",    "matrix-mpll-d4-pregate",
+	     0x118,  4, ZX297520V3_AXI_CANDIDATE),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-mpll-d2",    "matrix-mpll-d2-pregate",
+	     0x118,  5, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-dpll-d6",    "matrix-dpll-d6-pregate",
+	     0x118,  8, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-dpll-d4",    "matrix-dpll-d4-pregate",
+	     0x118,  9, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-gpll-d2-d4", "matrix-gpll-d2-d4-pregate",
+	     0x118, 12, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "matrix-gpll-d2-d2", "matrix-gpll-d2-d2-pregate",
+	     0x118, 13, 0),
+
+	/* This bit cuts off the clock signal to the ARM architected timer, which the kernel uses
+	 * as its main timer. It isn't critical per se - there are plenty of proprietary timers
+	 * available that could be used - but the arm arch timer binding does not accept a clock, so
+	 * this CCF driver won't know if the timer is in use.
+	 *
+	 * This clock is fed by the mux in topclk+0x140 - this critical clock here protects its
+	 * parent.
+	 *
+	 * Registers 0x148, 0x14c, 0x150, 0x154 allow setting and clearing the timer counter. To
+	 * set the timer, load a value into 0x148 (high 32 bits) and 0x14c (low 32 bits), then
+	 * toggle 0x150 to 1. 0x150 will automatically reset to 0. 0x154 sets the timer to some
+	 * "clear" value, but this value isn't 0.
+	 */
+	GATE(ZX297520V3_SYS_TIMER_WCLK,    "sys-timer-wclk", "matrix-osc26m", 0x144,  1,
+	     CLK_IS_CRITICAL),
+
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+0x28 and top+0x138. The clock (matrix+0x24) can be disabled
+	 * and enabled from the Cortex M0 and it will nicely stop and restart the A53, retaining
+	 * all state.
+	 */
+	GATE(ZX297520V3_CPU_WCLK,          "cpu-wclk",       "cpu-mux",        0x24,  1,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_CPU_PCLK,          "cpu-pclk",       clk_main[0],      0x24,  2,
+	     CLK_IS_CRITICAL),
+
+	/* There are a lot more controls in matrix+0x100. 13-16 appear to be 4 different AXI
+	 * channels for different priorities. Bit 19 appears to be the DDR PHY wclk.
+	 *
+	 * The important task is to keep gpll enabled if the bootloader selected a gpll-based rate
+	 * for RAM.
+	 */
+	GATE(ZX297520V3_DDR_CTRL_PCLK,     "ddr-ctrl-pclk",  clk_main[0],     0x100, 17,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_DDR_CTRL_WCLK,     "ddr-ctrl-wclk",  "ddr-ctrl-mux",  0x100, 18,
+	     CLK_IS_CRITICAL),
+
+	GATE(ZX297520V3_ZSP_WCLK,          "zsp-wclk",       "zsp-mux",        0x3c,  0, 0),
+
+	GATE(ZX297520V3_SD0_PCLK,          "sd0-pclk",       clk_main[0],      0x54, 12, 0),
+	GATE(ZX297520V3_SD0_WCLK,          "sd0-wclk",       "sd0-mux",        0x54, 13, 0),
+	GATE(ZX297520V3_SD0_CDET,          "sd0-cdet",       "clock-32k",      0x54, 14, 0),
+	GATE(ZX297520V3_SD1_PCLK,          "sd1-pclk",       clk_main[0],      0x54,  4, 0),
+	GATE(ZX297520V3_SD1_WCLK,          "sd1-wclk",       "sd1-mux",        0x54,  5, 0),
+	/* I don't know how the cdet clock works. Card detection in the way the dwc,mmc driver uses
+	 * it appears broken no matter this clock's setting.
+	 */
+	GATE(ZX297520V3_SD1_CDET,          "sd1-cdet",       "clock-32k",      0x54,  6, 0),
+
+	/* This is some "denali" NAND, not the qspi connected one */
+	GATE(ZX297520V3_NAND_WCLK,         "nand-wclk",      "nand-mux",       0x54, 20, 0),
+	GATE(ZX297520V3_NAND_PCLK,         "nand-pclk",      clk_main[0],      0x54, 21, 0),
+
+	/* There is a set of gates for an unknown device at matrix+0x60. It is some LTE related
+	 * device. If it is fed an incorrect clock, e.g. because dpll is not locked and outputs
+	 * 26 MHz, it will spam IRQs at SPI 68. This is likely a distress notification that some
+	 * internal PLL did not lock or similar
+	 *
+	 * ZTE's kernel has two defines for SPI 64: "LTE_TPU_INT_PS_INT" and "VOU_OSD_INT". The
+	 * latter is unlikely because VOU related clocks sit in matrix+0x168.
+	 *
+	 * Bit 9 in register 0x118 turns it off, providing a hint who the parent is.
+	 */
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "lte-tpu-wclk",   "matrix-dpll-d4", 0x60,  0, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "lte-tpu-pclk",   clk_main[0],      0x60,  2, 0),
+
+	GATE(ZX297520V3_EDCP_PCLK,         "edcp-pclk",      clk_main[0],      0x64,  1, 0),
+	GATE(ZX297520V3_EDCP_WCLK,         "edcp-wclk",      "edcp-mux",       0x64,  2, 0),
+
+	/* This seems to be another SPI-Like device. ZTE's firmware operates it and from testing
+	 * it looks like the matrix-osc26m gate in top+0x140 stops this device. This would be
+	 * consistent with the other SPI controllers too.
+	 */
+	GATE(ZX297520V3_SSC_WCLK,          "ssc-wclk",       "matrix-osc26m",  0x84,  1, 0),
+	GATE(ZX297520V3_SSC_PCLK,          "ssc-pclk",       clk_main[0],      0x84,  2, 0),
+
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. Probably there is
+	 * no wclk line at all and the two bits are just an artifact of generally having two bits
+	 * per device.
+	 */
+	GATE(ZX297520V3_PDCFG_WCLK,        "pdcfg-wclk",     matrix_unk,       0x88,  0,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PDCFG_PCLK,        "pdcfg-pclk",     clk_main[0],      0x88,  1,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_MBOX_PCLK,         "mbox-pclk",      clk_main[0],      0x88,  2, 0),
+	GATE(ZX297520V3_SRAM0_PCLK,        "sram0-pclk",     clk_main[0],      0x88,  4, 0),
+	GATE(ZX297520V3_GSM_CFG_PCLK,      "gsm-cfg-pclk",   clk_main[0],      0x88,  8, 0),
+
+	/* ZTE's driver has a statement to the effect of *(top->base+0x11c) = 5, with a comment
+	 * suggesting that this sets a 50 MHz clock. The clock code itself lists GMAC clocks in
+	 * matrix+0x110 and lists the parents of these clocks as 50 MHz gpll output, but
+	 * the downstream ZTE GMAC driver never enables the clocks. It turns out ZTE's code is
+	 * highly misleading.
+	 *
+	 * The GMAC's work clock is definitely not any gpll output because it keeps working fine
+	 * with gpll disabled. Gating off matrix-osc26m breaks GMAC, so it must be its parent.
+	 *
+	 * The GMAC Gates are left enabled by the boot loader and are required for the GMAC to work.
+	 *
+	 * As for the 50 MHz comment: See rmiiphy-wclk.
+	 */
+	GATE(ZX297520V3_GMAC_WCLK,         "gmac-wclk",      "matrix-osc26m", 0x110,  0, 0),
+	GATE(ZX297520V3_GMAC_PCLK,         "gmac-pclk",      clk_main[0],     0x110,  1, 0),
+	GATE(ZX297520V3_GMAC_AHB,          "gmac-ahb",       "ahb-wclk",      0x110,  2, 0),
+
+	/* Is there an AXI bus gate? The symptom of cutting off the AXI mux selection in top+0x140
+	 * is that matrixcrm becomes unreadable from m0 and A53 hangs. Inside matrix itself only 3
+	 * bits fit that bill: 0x8c bits 5, 6, 7. It seems a bit self-defeating to have a clock
+	 * gate that shuts off access to itself though. I expect a clock gate for the bus
+	 * somewhere, and the mux exists, so exposing one AXI clock in the bindings is the correct
+	 * thing to do. It also serves to tell the kernel to keep the mux's parent enabled.
+	 *
+	 * Register 0x8c has 12 settable bits (0xfff). Ultimately it doesn't matter much which
+	 * do-not-remove bit we don't remove. Other bits in this register behave like gates (e.g
+	 * bits 11:8 cut off USB temporarily), so I think we are looking in the right place.
+	 *
+	 * If an explanation for the remaining bits surfaces and they are further gates and/or
+	 * resets, add them to the bindings.
+	 */
+	GATE(ZX297520V3_AXI_WCLK,          "axi-wclk",       "axi-mux",        0x8c,  5,
+	     CLK_IS_CRITICAL),
+
+	GATE(ZX297520V3_DMA_PCLK,          "dma-pclk",       clk_main[0],      0x94,  3, 0),
+
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	GATE(ZX297520V3_VOU_WCLK,          "vou-wclk",       matrix_unk,      0x168,  0, 0),
+	GATE(ZX297520V3_VOU_PCLK,          "vou-pclk",       clk_main[0],     0x168,  1, 0),
+
+	/* LSP uplink clocks. The pclk is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The wclk speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26 MHz and 32 kHz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixclk and gets passed down. I2S has a mux in LSP, which can select the dpll-d4
+	 * clock.
+	 */
+	GATE(ZX297520V3_LSP_MPLL_D5_WCLK,  "lsp-mpll-d5",   "matrix-mpll-d5",  0x7c,  0, 0),
+	GATE(ZX297520V3_LSP_MPLL_D4_WCLK,  "lsp-mpll-d4",   "matrix-mpll-d4",  0x7c,  1, 0),
+	GATE(ZX297520V3_LSP_MPLL_D6_WCLK,  "lsp-mpll-d6",   "matrix-mpll-d6",  0x7c,  2, 0),
+	GATE(ZX297520V3_LSP_MPLL_D8_WCLK,  "lsp-mpll-d8",   "matrix-mpll-d8",  0x7c,  3, 0),
+	GATE(ZX297520V3_LSP_MPLL_D12_WCLK, "lsp-mpll-d12",  "matrix-mpll-d12", 0x7c,  4, 0),
+	GATE(ZX297520V3_LSP_OSC26M_WCLK,   "lsp-osc26m",    "matrix-osc26m",   0x7c,  5, 0),
+	GATE(ZX297520V3_LSP_OSC32K_WCLK,   "lsp-osc32k",    "clock-32k",       0x7c,  6, 0),
+	GATE(ZX297520V3_LSP_PCLK,          "lsp-pclk",      clk_main[0],       0x7c,  7, 0),
+	GATE(ZX297520V3_LSP_TDM_WCLK,      "lsp-tdm-wclk",  "tdm-mux",         0x7c,  8, 0),
+	GATE(ZX297520V3_LSP_DPLL_D4_WCLK,  "lsp-dpll-d4",   "matrix-dpll-d4",  0x7c,  9, 0),
+};
+
+static const char * const zx297520v3_matrix_inputs[] = {
+	"osc26m", "osc32k",
+	"mpll", "mpll-d5", "dpll", "gpll", "gpll-d2", "wclk-osc26m",
+};
+
+static const struct zx_fixed_divider_desc zx297520v3_matrix_fixed_divs[] = {
+	{"matrix-osc26m-d4",		"matrix-osc26m",	 4},
+	{"matrix-mpll-d2-pregate",	"matrix-mpll",		 2},
+	{"matrix-mpll-d4-pregate",	"matrix-mpll",		 4},
+	/* div 5: provided as a separate line from topcrm */
+	{"matrix-mpll-d6-pregate",	"matrix-mpll",		 6},
+	{"matrix-mpll-d8-pregate",	"matrix-mpll",		 8},
+	{"matrix-mpll-d12-pregate",	"matrix-mpll",		12},
+	{"matrix-mpll-d16-pregate",	"matrix-mpll",		16},
+
+	{"matrix-gpll-d2-d2-pregate",	"matrix-gpll-d2",	 2},
+	{"matrix-gpll-d2-d4-pregate",	"matrix-gpll-d2",	 4},
+
+	{"matrix-dpll-d6-pregate",	"matrix-dpll",		 6},
+	{"matrix-dpll-d4-pregate",	"matrix-dpll",		 4},
+};
+
+static int zx297520v3_matrix_init(struct regmap *map)
+{
+	u32 axi_val;
+	int res;
+
+	/* Read the global AXI speed selection, insert it into our ballot and enable voting */
+	res = regmap_read(map, 0x0, &axi_val);
+	if (res)
+		return res;
+
+	axi_val &= 0x7;
+	res = regmap_write(map, ZX297520V3_AXI_AP_VOTE, axi_val);
+	if (res)
+		return res;
+
+	return regmap_write(map, 0x12c, 1);
+}
+
+static const struct zx_clk_data zx297520v3_matrixclk_data = {
+	.init = zx297520v3_matrix_init,
+	.inputs = zx297520v3_matrix_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_matrix_inputs),
+	.fixed_divs = zx297520v3_matrix_fixed_divs,
+	.num_fixed_divs = ARRAY_SIZE(zx297520v3_matrix_fixed_divs),
+	.muxes = zx297520v3_matrix_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_matrix_muxes),
+	.gates = zx297520v3_matrix_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
+};
+
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -558,6 +892,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
 		.name = "zx297520v3-topclk",
 		.driver_data = (kernel_ulong_t)&zx297520v3_topclk_data,
 	},
+	{
+		.name = "zx297520v3-matrixclk",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixclk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, clk_zx297520v3_ids);

-- 
2.54.0


