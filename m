Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3146DC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=; b=zR8rZBM+rlRcXnAueHsJ7xY2GA
	PCPbpWsIzaU714t2lJ3+kaKrwexnTYrIWlnutWIc0DawgKzRYBq1hsAV4T+wFuFVE5V2dFbU3pfmT
	6YHVYg+u2aF91wk0JMnfgUFr43wZlqvHdbkvHJUJ/KgBqHKA93xSYYmL7FQqvmWWuLwbwvAMzxop5
	AAc1RCbSfH81lucqMjVJmG0hi3wFTyetU19fpFJeiU+3wTrP++bEhEEfOn+Rw8x+r/KGqlix5dM5c
	SCt8oFzUV05IlowxI1PA+Zwj2o6P/iklSo1PfeRM8P3xJ+yuBg2pakBguAxy/i96BQ3R2FGROkpai
	PnZJKkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql3v-0000000GNG2-0dG1;
	Mon, 03 Aug 2026 05:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql3s-0000000GNFs-2e03
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Aug 2026 05:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=; b=paXUchxsRcFoPJINqHFcP9+o3g
	SXxNYG8mxaM/N8tK0PHDrEg/8ijNBcHUHWLN6jjsPC3t7uhUhgknBo8vVGTD72B7izukWuFqmNzsH
	TyZycYCxetxPSVdLs7aIu0delUZD9wC8FTkZrUgXtPFeqNo8vGg9JUdOt1jiCvzNAC6QePxgrKtBJ
	go9gWoQryQR06SxaArVhe9tWxcgqPBQaPftvoek9mKbXACBpkbjnseWNY2zV1hr9SMZ2G+fpoSbwC
	Ob+JxOl1k3lpCQqxEqRZjj43f00UCXkQWCMddUT7YnuNIB4OF1lJ7jgxyML/nMWHqtylGa5ewSw8v
	u4uuLAsA==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wql1o-00000008hs4-3t6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:18:02 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso1038936a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734149; x=1786338949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=;
        b=MtVHBJG1sRxE0cqxJ8dEkQr/laDPNzi+S50n+qosLot5P9WzTj9wJegj1fq6lCQSqU
         wnP8iCZUyqfdZbP652RsmYQ202ENzXyN9CeqPt0DBPjZuaw1LPZcFP4wIK3T05OIuno6
         Qoc0VotLX0MRLVVPVNTXusnuRXvjTTtAgH7IEKsu1irTtQ3y59WTLGm0Zcv4TucZtpG8
         1DoNh1tGqifTyWw6Olkx66mPyJQz+e1Mf2Vplv5wL6jV7QVq9kvIjTjb7JEMJsvpaV7K
         O00zE6lpBFYqouX7V1ecKsJyvt3tY/fKMIFhNmyz5a1BFAr1xTAkGLQpPekpQjL6vN5h
         6aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734149; x=1786338949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OpRGWNf+wnvCcP1DS85gL+udlM+7o9ZcunosuNBCWA=;
        b=r4tQ9hd7UniqTZpgBew3nj4WM2l3bQ7o0Xu13qrVUVny8PnQ3VTkjFeTZVvSKFSawJ
         xo+NbJpgCkAp5r8EKeuiZ74r0GVEhiD9jv/p1S6iXEPAimfbT0GUN/JuANat+zLgwJJX
         rTAXt+sNfaxK0VmDIhYZfbKWdKC/73frzsqMvtRfdw4gViSvegR/10zvvsS4qbul/nps
         haUmO9ZLzWKstGgrURMTOtHs0lEz5Nx0iz5cWoPFGPD9m9KS+YmbQH1MIzF2ivn41Y5H
         luQcrywrPwLWiywsANitWg+pGyGcis1o49887tzlcnx+oGKpjvGSrgdTSNuGJrINmhrl
         TiMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTYTtNHdUmWYeUk2j0S4y6ymGlhLUxLncgdWPPT/1+kB7n7UkNy0hgFUzImeTj/4YYQyEQqBsOxYeNwSljw94S@lists.infradead.org
X-Gm-Message-State: AOJu0YwaZ2J0sfesF/2s2RxBS9kQ8L1jrIHAEE2x/oE31MIqpz/+Qyfm
	h5NseErE+rNVCbTqC2cERER2lqpmLA9zGXgKYQw9Zj7rSTTCVSnnPRLMunol2JXc
X-Gm-Gg: AR+sD11lOjNddDg+AZKpqIiWWyuW5egUBlcWkOIO6kUWwkDC87gOfO8KXoFfQlHT6FW
	b9MP/xj7+42xMpmKDgfMJTsZ26fbVKNcSxPI+4Sh0hr/5Wj15OBmfz4t1/aR7wsVlSk5o9NoTdN
	M5k1r90OyHmeZQzxXCrEr06EwD0CuTyaPqtGeBs71VIiBS/zwnJa2ULYvermWJlU2pkxp0tCTdO
	wB6B0qzuyQLtgbwfCMOA6pOIkcioZBOuoAuQV3j0FKnZy2kM2MvkrRIuU0CeA1xfzI/FgB5pROc
	gspe7aKreleSpD60rqnNFmgixBtcjGlWv2t0ROIvTeJOv2y8Pj8b3roZSad4XPWQw5jwoMoq8/u
	gJ0MtFqYLGSwAC3bTYlBI5VhF6GgQsaxjykcbM7CFfNfrxzKGk1UHVIOCr7giB4y85WWLK9HNwN
	CbgZnNnYmKQ2hdmSyjYod4I3B3XJa0NmSH7ePdav7kiRqrY1EoT0QH/rTQPg3bpOi86TvbLy6ec
	oaG6NMODtqcL6B+qJFM6mFX2OGN/x+MhJgYlJ5L1R4TqihC2UcPXW9giujqse5NPpytU3SAL8fU
	CqTn7cMVZZjgqneu8qM8de731O/ZrHUjUVCl6vWOsdtpTXYN0sE291ilRyuWIO9zHEp8ru/wDl1
	Pq09DuAvVe8hUaw1/
X-Received: by 2002:a05:6830:3592:b0:7e9:e488:3bce with SMTP id 46e09a7af769-7f196bab78dmr14968611a34.6.1785734148846;
        Sun, 02 Aug 2026 22:15:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:27 -0600
Subject: [PATCH 17/21] arm64: dts: allwinner: h616: add ACx00 EPHY
 resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-17-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_061607_963545_5997D390 
X-CRM114-Status: GOOD (  12.10  )
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

Expose logical SID cells for the AC200/AC300 EPHY calibration, the combined
companion-variant and AC300-calibration-range configuration, and the AC200
bandgap fields.

Also describe the PA10/PA11 I2C3 pin group used by the AC200 control
interface.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 6879f27c2b2b..2cedda6e87a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -252,6 +252,20 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@0 {
 				reg = <0x0 2>;
 			};
+
+			ephy_calibration: ethernet-phy-calibration@2c,0 {
+				reg = <0x2c 1>;
+				bits = <0 4>;
+			};
+
+			ephy_config: ethernet-phy-configuration@2c {
+				reg = <0x2c 2>;
+				bits = <8 2>;
+			};
+
+			ac200_bandgap: bandgap@30 {
+				reg = <0x30 2>;
+			};
 		};
 
 		timer0: timer@3009000 {
@@ -324,6 +338,13 @@ i2c0_pins: i2c0-pins {
 				function = "i2c0";
 			};
 
+			/omit-if-no-ref/
+			i2c3_pa_pins: i2c3-pa-pins {
+				pins = "PA10", "PA11";
+				function = "i2c3";
+				bias-pull-up;
+			};
+
 			i2c3_ph_pins: i2c3-ph-pins {
 				pins = "PH4", "PH5";
 				function = "i2c3";

-- 
2.53.0


