Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BE8F436B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqX8mavnBNkgyap63RnjubBar/UFOY4VCctk2eUAZ6g=; b=z5Z67JM+DQVE3DxiVs922xPq0N
	HeTu5KmAtTp68j2/fxDLRF8jh6E6s6geYEAzofsLGM4M9Txksfm1Koeink/vHKTpkxj+UTbC90ZgZ
	odxRVkBgLliMwz5ZVzxglfuHKnvdGDY0RIzRisG77AzSCLFpEG4OUQJSP1HMOmUXBVSTkP5PqPARA
	FNvVCAZg+hSSYjLQVNRYvBJBeYjTuHJK9BiH5YdICts/x6qoL39ODZUSwgdSdN4GSPs0b11phsNOF
	nvE+2H9E0QnGWjtEjiBtucoD2fadXQ0oaSpFZFAONGw4uc2YVbz2O9TIsy5EpAxV7Vk19il351xiI
	3L4CdQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkra-00000004Bkm-3Rt5;
	Fri, 17 Apr 2026 15:12:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrY-00000004Bhr-3KXS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:12:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ba51e69988aso16062066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438727; x=1777043527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqX8mavnBNkgyap63RnjubBar/UFOY4VCctk2eUAZ6g=;
        b=eWiB1F/k1h9zkuei47ow/wx1jqn1kBWAnmsL4TlvM7PyROo73fvcbiw+4EhP+Ohd3q
         saiM7T2+tfKlFsNsGHACyHwbglzgzB9yUic0C2a7yxPNR2jOLm0dgF3vGE57hGXk6wLy
         ENJhUGwpRl4EuQqxML06wWxPMUAKLUvMyEqTVKVCnJoDEQ9w3594lLDOPfSeMDrr4fHG
         s/Hhdl+6MVPeLi2d2EiiOLP7J+fAcfYmLBfnNZ09TolIwqQ71CZi9yphxJALsGbHYdj6
         axwjIWpQ+Zl57lbnGcl6UUUfUUyun/QJj+FvyR5g7WU9u2JYNJHSpYUP43d2CXR9xqD3
         OhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438727; x=1777043527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VqX8mavnBNkgyap63RnjubBar/UFOY4VCctk2eUAZ6g=;
        b=f9yMZqJ/KJ4Qf/3X6jNLB5uMi2wSyU8w7vrwdZ02Sjf7Wr8WhiFYOv5qg+vxcA0V3J
         HjJ3yx7qq7o7EXxvANeYuEYzSTtzGYCz0laqec5SjEAnGBo6gHvRNb6rACi338vr+F3x
         96O/A3banYZRT0LexibTdLwDNQiFNUC7zzy1s8YyNzEi+TwFcBK1wvL3Pj961a0by6M+
         eI+RDM4L629PhvoYhjIyCqDfgfb8vC/UiaxUrcdKYOSHaNQF97QxTTZ+BqOn5R4g8uhu
         R9asbqv95RdHLeILZXGKgI0LABOqXClNQBfqmvkJUJiprTBYiqT6aqwU6mt4rKCtxKe2
         fYrg==
X-Forwarded-Encrypted: i=1; AFNElJ95Q7mO3fBDCSUe79v7gCjjMy5rxB5L09epr+8LfG2YbinWZ09UrOaWT0rgUJqUVZaUe6CvPfa8smqYF0xE523a@lists.infradead.org
X-Gm-Message-State: AOJu0YyKlSLciPoQSPvsunnmQjflc3K3txYE3GvlKEC6fvSa5GKVkPj4
	t3Y5hEdp65YTKNeFqecLf8VUizkMq7/kzkYUU4mUve3qLjHVwVi+eKaBmZ3I0YXHD+ML71NfXNd
	phA0l
X-Gm-Gg: AeBDiet08QY7Ebgx99g6CcUuo1uqteBH5tHf2w1bq5LpcERTPAjt7qRx7bJcEf2oliz
	KJ8A1fowPjFKG6NTT9X0xOwZhaBKCC3d0X/mggVca+OETrBFdhdccDrF4NbAYGH8bIA3KODFhGS
	fp6sxKhsracyqMNIEKV6YVeuq9D2y63Yky0rmr8ZxyyPIw9MwUn1xrupyYxqa8hm+36ITn8pd8Y
	Kz0lzoaBLe2y4/TNyLyUC5AXvx/vNnkJLtKJOPr90Q/43XPLwIPDCuoXHnKbFAtIE5FpN7SElm+
	4MomuhGLx9UrYKoTx13wn2M8HZW/zo1FAUUO57GnwciLCnDDe3uEG/3Qp6mp6aoq4HaAMhaxhgH
	/tg1EA57wfyuqn3He2OBQfVAGyC8DudWS4pN6xm9/m2AE30qQGYln8H3IV69kV6Lb7RLcUIhqbR
	rTOh7jaXUaHhOw98B2ZBros0hDjaauaVtXAO9Lw6YtdUoKaaESF2yJ8cYVj6+PUbsKfBqTpvyTa
	/cgB8z1TIoq/A0p5Nt3jKdFmoQ=
X-Received: by 2002:a17:907:3c8e:b0:b9c:b069:8abe with SMTP id a640c23a62f3a-ba418e853b7mr164954266b.12.1776438726689;
        Fri, 17 Apr 2026 08:12:06 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:46 +0400
Subject: [PATCH RFC 3/4] clk: rockchip: rk3576: allow dclk_vp1_src to
 propagate rate to parent PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-rk3576-dclk-v1-3-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=alchark@flipper.net;
 h=from:subject:message-id; bh=9E+GVCevJV58fhmm0CYyTjqLcW41sUgTRpTXQLHwLHc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t127xRniY258Vemr65Gvz625DB3Scj+eCYSeP5gs
 fcvv3b1joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ6aiEjQ3+bJOvdiLL/kZfbGnlnOLHPfHN8uXm/VpTI9PfMj8VenmJk2Fa/+au
 BLrPpiRN5S0p7vgYdNTL//2592W/rcMcA1r3zOQE=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_081208_855985_901A3C3F 
X-CRM114-Status: GOOD (  13.27  )
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

dclk_vp1_src feeds the display clock for Video Port 1. When parented to
the default GPLL (1188 MHz), the 8-bit divider cannot synthesize the
248.88 MHz pixel clock required for 2560x1440@60 which VP1 supports:
1188 / 5 = 237.6 MHz (-4.53% error). This exceeds DisplayPort's +/-0.5%
tolerance and causes black screens on strict sinks.

Add CLK_SET_RATE_PARENT so that when dclk_vp1_src is reparented to a
programmable PLL (e.g. VPLL via assigned-clock-parents), the CCF divider
can ask the PLL to retune. For example, VPLL at 1992 MHz / 8 = 249 MHz
(0.048% error).

This flag relies on reparenting the VP1 source clock to VPLL at DT level
to ensure no consumer calls clk_set_rate on dclk_vp1 while its parent is
set to the boot-time default of GPLL.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2557358e0b9d..28eb5a802e83 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1105,7 +1105,7 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 	COMPOSITE(DCLK_VP0_SRC, "dclk_vp0_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
 			RK3576_CLKSEL_CON(145), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 10, GFLAGS),
-	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
+	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 11, GFLAGS),
 	COMPOSITE(DCLK_VP2_SRC, "dclk_vp2_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,

-- 
2.52.0


