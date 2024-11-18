Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7D6D10F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 03:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iziczI7ZYYRzrx5DXDLTU2aWQXZX8V3J+sI1zP/uoWY=; b=B0HljpFWNrnyl31rjj+PiTc+Pm
	ZVq1nxiTT3B6clTregxGuIl0WFX5LGUrlcj5S/erqezzzWAli2BVY1aL8Kbc5n3gTpXL5eEuuHKza
	Vfnf+Haz6g/OctcuZzTy+tN1Fagl1HGKV9gSJg5wN+8MPDHQwTGb+CzxG/Z/KslYpJ/5SulxQRNpc
	cWPIkBHrtvSdo2Ot3eEYEi+U9ooXCB1gTWz1Y2z9MEQq14eMyWup0sZri5GKUF01ha+VQWKVd6hYT
	L9geRywnju3GzUSpjBEKyGVICyCWY7gbXv49cEugKUnQMmfNHygG1OwjfbfENP+wwOa7taJyQlxjX
	mh3aXDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsqe-00000008Gf4-0Uvs;
	Mon, 18 Nov 2024 03:54:48 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCspe-00000008GZ4-3ClV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 03:53:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so1147041a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Nov 2024 19:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731902025; x=1732506825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iziczI7ZYYRzrx5DXDLTU2aWQXZX8V3J+sI1zP/uoWY=;
        b=ZypyujB1kNIbKiuwl3wmivOGCfZoJPxsbW+XTRd4dSmtMunoQIZaI+sAw+YjCerUjJ
         NIp9YYtaD+dZy6Bv7Yo+DzFrWWwjJwxClPkIqTHvfb/kIDcep+ZhJkI9ilHS20OtsaWV
         vTY7ANd59xc8DliFoeHuWh7GaHpNicNPxDi4QQeq9tLpRINq8lHu+SXwwt/a6olkNmDG
         TpxZ9ftl4Bo8T1ALsDJust4+20QqZT6VoOLuPM6P2u65R5592wvIggrngQQOG7GtcnYr
         P5mkx3KJ9paFXE6/UQQdfKxmNQwCb8FCblPzlEnRpcTPR2AQJvxBgzQGV866xNgpw1sr
         dYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731902025; x=1732506825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iziczI7ZYYRzrx5DXDLTU2aWQXZX8V3J+sI1zP/uoWY=;
        b=XScOhnHVGrhWGiGF4J5OVPrO7NCpeTf98CC7ZDbpjAwcMsPnHHeMIJUL3rR83viJ+r
         q3rlYpl7fU43SXCciKP1pKLLdhgDjO1QkbRsTu6U37ZKa5e1hfZT4Xc4fJtPBL7LoMRC
         pUCTkDWAnclc7S5VA+lPENCviE+zzu4POf81dvKsdUAu2cKZz714teTBiL/47b/+jGuh
         b/SZ2bP8GPbxwtg3gzTUBG2cHf4/UqXVNoIqwWabMzU2cM6uZp0xivkXOrMbvG7f2zg+
         R+UR0wDeE9Rbi1QnxTgdm2xxAUJVEuj6JPSekxcwH4Vv9kBpLyyLJS87nNmLdf7RRkgA
         zsfw==
X-Forwarded-Encrypted: i=1; AJvYcCUOxN36eam7lndaeeXzx2bjb7r+z7HGGhkUUhE1ZLcXwZydl+jzdbyCRhLxsb3r6MQcPOx/873Y6W7q36xWMoeR@lists.infradead.org
X-Gm-Message-State: AOJu0YzlQWRR29FWDPXzpbP8Es40pQLT6w0Yqag6qyda1yZ1U2TYQIra
	G8mTBxY1UvIRfzG0wCkK5P05RMbriX/kGrXjLIZNIj2S6sqGLMy0QV5uYZB4i+A=
X-Google-Smtp-Source: AGHT+IGYl9W0UXIVLMASe6ljQEHSvMFAGPTR22VIIByVAeNekYNbpUP8Pv6DHUaufX/uZNV/YdmOCg==
X-Received: by 2002:a05:6a20:840d:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1dc90c05eafmr19652857637.46.1731902025266;
        Sun, 17 Nov 2024 19:53:45 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711e005sm5159648b3a.72.2024.11.17.19.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 19:53:44 -0800 (PST)
Date: Mon, 18 Nov 2024 09:23:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: spear13xx: Remove unused and undocumented
 "pl022,slave-tx-disable" property
Message-ID: <20241118035342.ej5pxzrn2lildyzk@vireshk-i7>
References: <20241115193835.3623725-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115193835.3623725-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_195346_825249_C04CFBE2 
X-CRM114-Status: GOOD (  13.96  )
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

On 15-11-24, 13:38, Rob Herring (Arm) wrote:
> Remove "pl022,slave-tx-disable" property which is both unused in the kernel
> and undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/st/spear1310-evb.dts | 2 --
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
> index 18191a87f07c..ad216571ba57 100644
> --- a/arch/arm/boot/dts/st/spear1310-evb.dts
> +++ b/arch/arm/boot/dts/st/spear1310-evb.dts
> @@ -353,7 +353,6 @@ stmpe610@0 {
>  					spi-max-frequency = <1000000>;
>  					spi-cpha;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;
> @@ -385,7 +384,6 @@ flash@1 {
>  					spi-cpol;
>  					spi-cpha;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0x2>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;
> diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
> index cea624fc745c..9b515b21a633 100644
> --- a/arch/arm/boot/dts/st/spear1340-evb.dts
> +++ b/arch/arm/boot/dts/st/spear1340-evb.dts
> @@ -446,7 +446,6 @@ flash@0 {
>  					spi-cpol;
>  					spi-cpha;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0x2>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;
> @@ -461,7 +460,6 @@ stmpe610@1 {
>  					spi-cpha;
>  					reg = <1>;
>  					pl022,interface = <0>;
> -					pl022,slave-tx-disable;
>  					pl022,com-mode = <0>;
>  					pl022,rx-level-trig = <0>;
>  					pl022,tx-level-trig = <0>;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

