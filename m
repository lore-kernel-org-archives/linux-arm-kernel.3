Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D22EDEBEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrVCaQvW0iEI3otUrXDkdYdjfZQ36uxHWa4/LArwCVM=; b=OQPs8EXb3c983K1hg+HdNfRl/v
	ryYiTMbyxrWGA3jG36pkX125+Og9KPZGsH/Nm2I+6NNLQiFOZt53/nznbW+3/lX/40lQj3tVLMZkd
	SVBoaXtm4llwTknA4zX30WpUjlyQirxuySemNyKqhBdadi1iS0AgfDWWV5y6C3ejHO4e1LqNfedcg
	uAu0gsmMpJzyYMUcv2ZgfwDrbHsywA1QDrjmaskHl5mjWqNfjUuDbol61tDYdTqUZrPBAHJEFySce
	GvNj6sJq8LGsaQFDJKEdZIl7bjhOc+W9vwjxCvI0ywTb5TvSSJEuByOM55JU03EDxSRYDpIgojzjO
	sJ+yxt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVul-0000000Frow-0NFL;
	Tue, 03 Mar 2026 20:00:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVui-0000000FrlH-2KZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:00:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso53926185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 12:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772568014; x=1773172814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LrVCaQvW0iEI3otUrXDkdYdjfZQ36uxHWa4/LArwCVM=;
        b=MBJ3V9gjx9TbrQtzdbCS5Jc43FmzQS6HT6EzIA1H5PYi7wOQsBc+np8zzhW3Oj3ily
         mvYXWQvhdtV1vNaF/sboc126mVgGItKa4+gzFkaEGn1v60BQwp96PBZ2X2PsJH2yHGMW
         SXLzOEl6iq133PjIaJBtZZoDW9pBDuxrnkAGIKdRnOoEC3aaswKCjP+UjPOmQxzbnxfc
         ee3UmJXKaCyUnSnoiCffbo+Jm5Po+M+o/QvDvMyJIW2QrmhG1NBpysfo7cLPjUrs3aYg
         wg/GeZPmA1dY5UvdFS2CY+mxMymvlO91HTV1X+7tpZS/V0w2QQ0KpsF4owy5aB8DTfvf
         +Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772568014; x=1773172814;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrVCaQvW0iEI3otUrXDkdYdjfZQ36uxHWa4/LArwCVM=;
        b=I7uAe8Svsu46e5G0lGRku5zgXga+Q/CP5+GttFgvpoAmDf+r/pDNlfwE1gy6dYe5Gw
         JWlWTfIxue1TDTKa0YuBBJtaRfZY0I/baCOG8b14HXc4bsLOGU2Teb/c1oNbXFh+wr8p
         5nv2H07/rE3P3u+R7SL6FujZQxbQl6T2Y3vQAcOWgABI2/kTuyPJ7tVhGYJ4FzNChAaG
         6iAroO9bndOR6nIGJaeanj0b6yPSAI6LQG3V9AoaVjHVFbHjkmOcPY6zMb7qU5NFfAi7
         lVBgbBxWPVPFKd9mHZ1KSkEJXl+vwVwrWWtJRPTltboK6bbsfCTAyoiFoYXguyzKK2rh
         Vekg==
X-Forwarded-Encrypted: i=1; AJvYcCXjXJdiREYtSQ4I3pH76hzj6qYcvmLrC+eFxT4qulSvj4Jl1NlFQzV2JP/tLoOvr2W+tHHj/1E+SHLLDJGcdECE@lists.infradead.org
X-Gm-Message-State: AOJu0YzrT+UngWCVQh6WIjoEw+3vAchksKB3pgEMw8H15SCBOiSS91Ej
	W52mIVPAtsbtm3nTkwvCddMk9UW9UXoFXr5OA5QPf1LG72LhcqfcILAH
X-Gm-Gg: ATEYQzxBaIT8dm4GeQvcu1tYeQj9l2TKnZXZgQCVn84aQcM0q8tRdsOBChcHliwwtoi
	jU0YoioMvlzLMm9DsCXSPtgAw2qi2+2waxYx3a52uorW6EzSjMQmOsePdc2DMPqNjbYrnDrFehy
	HzJZHrzY3T1/Vi5e76jl0tExJCYkN3/Q6nm7Mnh89CWNaxzaQLXImcaJphbNv7BeyBU6OzFFeNo
	3SU5yvPNsxsI1hc5yX6Q8XxzUZ0mIGkKHRrWSblYEE5ej2Nrox4WJB6rIr9uzClFe5/0HUN7mM2
	p9gNd9wH/1eInl99HQGNX4oWDvYtOZcX35cNiYKH16sg01bq+kJVNY15RXHg9XcWl4XTnKzLLOl
	RN9eX35NiPPcCoX2mtkOnUlnLahOt6mU6ekhjinVRwHCULsnm18+251OspcTybLhric1Dt9cZ7M
	ojEMXZSSoh6QgRBwlMob6x9H63E6VAcE0lKaEYG3mf1d/CP6+Mdpc2gQ==
X-Received: by 2002:a05:600c:3b22:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-483c9bff7b0mr280384695e9.22.1772568013945;
        Tue, 03 Mar 2026 12:00:13 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a91b1sm21667245e9.12.2026.03.03.12.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:00:13 -0800 (PST)
Message-ID: <69a73dcd.7b0a0220.1ac46b.9bfc@mx.google.com>
X-Google-Original-Message-ID: <aac9yrt6MhSXBSbO@Ansuel-XPS.>
Date: Tue, 3 Mar 2026 21:00:10 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: airoha: en7581: add crypto offload
 support
References: <20260303193923.85242-1-olek2@wp.pl>
 <20260303193923.85242-2-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303193923.85242-2-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_120016_684861_BB5A2B2C 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, Mar 03, 2026 at 08:39:18PM +0100, Aleksander Jan Bajkowski wrote:
> Add support for the built-in cryptographic accelerator. This accelerator
> supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
> It also supports full IPSEC, SRTP and TLS offload.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/arm64/boot/dts/airoha/en7581.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index ff6908a76e8e..4931b704235a 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -300,6 +300,18 @@ rng@1faa1000 {
>  			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		crypto@1e004000 {
> +			compatible = "airoha,en7581-eip93",
> +				"inside-secure,safexcel-eip93ies";
> +			reg = <0x0 0x1fb70000 0x0 0x1000>;
> +
> +			clocks = <&scuclk EN7523_CLK_CRYPTO>;
> +
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			resets = <&scuclk EN7581_CRYPTO_RST>;

I guess you can drop the extra new line between clocks interrupts and resets.

Does the driver supports these property tho? For example the clock is just
enabled or tweaked to a specific frequency? Same question for resets.

> +		};
> +
>  		system-controller@1fbf0200 {
>  			compatible = "airoha,en7581-gpio-sysctl", "syscon",
>  				     "simple-mfd";
> -- 
> 2.47.3
> 

-- 
	Ansuel

