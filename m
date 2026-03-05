Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27464EEF334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=; b=1/qx5JnJqWDCXl8JKeuPrBr1lp
	JyzZsEZJB7JI7Q47rkdzLCDqT3jOvBXH+t1ZMT1EQTwCw/86JyVphz5u08fEcU0PggzRfpy+AYoIN
	DTCZpi6N19CGqQwvpq0dwnwRlaJRa44X5QSKjJjX1gwylzaT+9fG1RVvQRJFxzHId0pw0f11x9r0a
	CaohJHAnxjKow4SFwrpzJPQ2y7QqA4/bLE/vfpCw6bAQ5VaH0j5pF250Vp3/lKg1kTWTYEMle0OAk
	qWWLsDZRgdNtIfWiGkSBvtE+lIx+fmrEhPfmFowfuaJ/g2/UDSFMQ6dg7n7EHRR9QPmVuTDVBFHfo
	hnLr6M9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4cQ-00000001GyW-3Zyl;
	Thu, 05 Mar 2026 09:03:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4cL-00000001Gxm-0mch
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:03:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48371bb515eso115929185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772701415; x=1773306215; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=;
        b=px+FeFRACG/gosituoEtcZqUmtKmL7KsRzrVYKIWoRIF1klSIh4yWtbQnm3xVMeBtW
         MwoV31gLX2HdRao6Y52/38l8h/OyYspDJJMAbwTUuSPWkPwKGxdGxBc/s3LCW3+lyW+s
         Ul+XH1Jmgsnn2wQSkJhehxZCfvsoiKIOhA2NhrX1m8D7k74/oQLFrm5jAhBdxCpnsl07
         2RUX1xcj6CTiWUdi7v1gfHqLJeFWh3gqH4lPtOHhug6q2d0HLTkAeznkDcIfBFKWSyk/
         daugJpSMJc06XhLWV5XYWdDb1ZEUAbLfbrNY7qEi0MsEtcBqScTwBPWGFdgvf/D6d3nX
         ZX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701415; x=1773306215;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WAQoJ+BsCX38jr9SNjCgtieBrTo3xV4mFgoDVHJVgRk=;
        b=XjWBHK7b9HEjSzMn1Bk/dj9DzFHx38Yg2elmH+ATAHa8X/sy2kM213hxW2l5oiITCB
         X3GbK85D4PQ1taHR7pMuqyjkd9SeblwRXbbgVHjC3ZXpTBrv6mmfLm/doNb5z8C6S99E
         CMTFYTpY5rLbfF4H/ES9j8JTrn17K6Y0fQisMDd9PaBUdL2LHPNRjQi/DbP7EC48dBQ1
         Tq2hAUt+MmCor1b/bKOv+sfqa10OxVY6bEYHbeDGi3AEdRf1QlfgbPjipDZeZxMrb4Sh
         01PLTtS34TGy3L73Iwys7lKa4um93Zqje1C4KBN78DOGTWSfoPx+FOD1dEUZMLzRRcH7
         Azwg==
X-Forwarded-Encrypted: i=1; AJvYcCVxGNtigtXcuW9XlBeZSmY+5DzdrXwblKVmQvwnxTwUrMsvYcx3fzgrJYLIqtoZmwh05OWxnWT+R7fxs5u6eCIb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ShfP4ievkd2Dbg+rYTcaqXS0zdbmd2lIlV805iAl9+vsYRW5
	Y67UpEUaYRF/55ZSSEbiEbtNhML6dtcVbsmwrQWvYMqbrFFm1883iGQ9h5mCmNLaQqE=
X-Gm-Gg: ATEYQzxic+z/3YkNu1kIpuT9eceLyGqNKn7AoOpRcJTePeojBIFmQThan9fSbhnVLvz
	QriqiGX2k5RDusm343Ec83ZUGVr+cXu9mLcZisNsT/nhklQ1eWbd3DRx9hCzs6asiyQKN1pddkv
	4OqvXLie0nH/viGmm5VueZLcGhBpCNhS45BqFctsuq+Cu3lK60JbPqc443aXcsuqt+4MMeR+mhL
	Astz/pk+EEXHsEi803qKD5pcr1FpAJlY/aZwU1saU7zXrOvAEWTabR3nEb5QzmZa27o3cb81nw2
	f4zAYfNg8r/1mCER+VdSooYuBxw7qkodsOiKzYS4RbQVEJiyYdFzRrF9/KxULuN7V4kRcUxuHSo
	ZmNhI2bGScACOTUscCDVnNEZN03SLFLnTuXmr5tphRsqUffZf3C1vfS3VPVPSk21N+ldT5Yr2vl
	TMedHQn2VUPeqO3zmtu8o6
X-Received: by 2002:a05:600c:1f85:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-4851989f765mr93346545e9.31.1772701415004;
        Thu, 05 Mar 2026 01:03:35 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:5595:8450:af3:bbe3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4851fad2812sm41178955e9.1.2026.03.05.01.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:03:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  robh+dt
 <robh+dt@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  devicetree
 <devicetree@vger.kernel.org>,  linux-clk <linux-clk@vger.kernel.org>,
  linux-amlogic <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  Ronald Claveau
 <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com> (Jian Hu's message
	of "Thu, 5 Mar 2026 15:43:26 +0800")
References: <20260305074328.639993-1-jian.hu@amlogic.com>
	<20260305074328.639993-3-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 05 Mar 2026 10:03:32 +0100
Message-ID: <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010337_245898_5597FE9D 
X-CRM114-Status: GOOD (  19.00  )
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

On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:

> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.

... but this changes the index of the clocks after this mpll3, and those
index are supposed to be stable if I'm not mistaken.

It is indeed more convenient to have the optional clocks at the end
as it avoids writing multiple <0> in DT when we do not have them.

At the very least, your commit description should say that this change
will not break any existing DT because these bindings are not used yet.

I leave it to the DT folks to say if the change is OK in such case.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> index 55bb73707d58..27cc1f331587 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> @@ -24,7 +24,7 @@ properties:
>      const: 1
>  
>    clocks:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - description: input oscillator
>        - description: input sys clk
> @@ -40,12 +40,13 @@ properties:
>        - description: input gp1 pll
>        - description: input mpll1
>        - description: input mpll2
> +      - description: input mpll3
>        - description: external input rmii oscillator (optional)
>        - description: input video pll0 (optional)
>        - description: external pad input for rtc (optional)
>  
>    clock-names:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - const: xtal
>        - const: sys
> @@ -61,6 +62,7 @@ properties:
>        - const: gp1
>        - const: mpll1
>        - const: mpll2
> +      - const: mpll3
>        - const: ext_rmii
>        - const: vid_pll0
>        - const: ext_rtc
> @@ -98,6 +100,7 @@ examples:
>                       <&gp1 1>,
>                       <&mpll 4>,
>                       <&mpll 6>;
> +                     <&mpll 8>;
>              clock-names = "xtal",
>                            "sys",
>                            "fix",
> @@ -112,5 +115,6 @@ examples:
>                            "gp1",
>                            "mpll1",
>                            "mpll2";
> +                          "mpll3";
>          };
>      };

-- 
Jerome

