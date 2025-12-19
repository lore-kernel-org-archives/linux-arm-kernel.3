Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD958D74951
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=; b=SUA+AWhA8M/PYBrCJ3yXDK2ZVc
	tH3+FALp9e29bjw8TtvOezuBG4NgVF4XGK1pC1gIFD2Wj3tG5Rq769OEwX9BVwS3zF2IXgZGTquSh
	uLRQ4pBy8tTDcLvRo8eHNg16m40YhNsSR/uY9EA9iWUdc7kr8c3TfNwcD+EmsumtD33DeDlxRXGw7
	AeUsa64i6SqrC5f+owHEBmrLfjJBKcE1qIXG0uxGex4ZfgGeaxrGVz0i16FxezyavQSTyaGr3U5Rg
	LDOXrkFwPK4EhKgDwI8X/lfBCAOBO+gi34Pwb9rDW3Hn9TQ01om3mNGtYSXEJ8oFG1Qrc5FXq297H
	z0HhNYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTL9-00000009ffm-3oEf;
	Fri, 19 Dec 2025 05:47:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTL7-00000009ffN-1udt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:47:46 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34a4078f669so1410458a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766123264; x=1766728064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=;
        b=WB+WGvwxXZgFJeIkUIyMlNaWNEKrNq8W8x96pC4Qt93AI4uLZnefVgd85hQEcpQ3Zz
         6tMycCbjSwb/VKOsEdNEAXab3NG8bhMeyLUARxg6PH6EobyN7KAAAZGaUDiT5wPFDME1
         bsJznNH6vhCTwsZwrBYgHmMRlW6rplqlM3zvcRIKK65znosZvZxktqs3e3OxntCZW/9F
         CVx0qWmNnjbRC+uCicf/ut0jzNkvr/2npr+6T9QSJBexYwSqJQZyyNImL7zgPpK0SW+Q
         o/GZPlBGddPplkwFYdELxokLuUGtR0m6Scatk7Kf/woi7GK3rILfMzVdOtW4+FN2Bg2J
         EX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766123264; x=1766728064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPO0eCOfjOBuPv078w1rY+GCMFEF0wn5Tdnt1BmaNcQ=;
        b=tzEvbV1bZzqN/Gu8OwXLAyjuKuYbKYMDY87dyJ6IVfLWCXhXGgwMC25hCVGYuIyNnk
         z+Zh5C409V3wnll6/2T4Qm+VYfAWCAJOY6XkDOLjIpF6BqbMsCABbF2cMF6fE97saxhN
         ZqPMnmc3aBBvG/w+qhEZ8jv5tcIm+Q8n0ptMlZiiN8yzKq91vn2TInS3ag1fn/T5Ff5G
         PrrecERd8SOvIxBSgN1l7/TgF/cBYi+trFOfuFsXriAMOnEAmIQ5qoz+8j7SSiPw8/m4
         9a+14XmuPBjReUlCA4ziSvCsteLJZyPu3ddiTiFo2nUzFViphAYPS+/jMk81M10GLh1b
         hJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbAAvkvHtxsJp3LKneygKXhZMpxKVFsCBDoxjEw562JHqIsARMMMfEQ26wkCENhYGT0V/o+qUeLS9xwfCd4gUu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz88DCIwwUjQDtsyLASHLnQioD+aPyhiOUkVPgWsMe4l6mXyumQ
	SZvZVUBuZLL9t295JM8r9oKG62sSvbK7ksTaWpL0AvPq6wfH/Vjh2X0B
X-Gm-Gg: AY/fxX7fW7mSYJ/tiUTTUBxWmPohCtV37piOPwc1HEzoZeB0LR5Gpd0ZiKyWAUxGrWZ
	sI0SFzOwTelPb+HgVW/35H5qaN3v+cIYiS8Gvo/08D4XV6fS8sBZxUWbS/eOgucsW+xPyrbERci
	I33kNReuyW4fmTDZNRGY/SPXab6N+27IPfwrzhSh6wfbCdS2ViQ7ZQNACdluY13RU2OzxmF6NhV
	Zjz8NBpJy7mueN5vgaITmOn/UE8bnmcUyp1tKZla49a88HllsArOx9SMKLMXjzUCBzwiGlFXJn+
	VdcXORrWH7vTslrZ7+dfZ5GC/PYhBxHtnwie0LfwA0m2ZUBuMOdahf24n37WIs4s65o1L/lbf/E
	cCytpeC90aTHJ84lX+G3TZf8FzdhM+uEDq2ah8QC461qtxUWbI8U+PaRZqa27be3ulI3qSH3yux
	Jrv8Yi+k7WEfIMDFrbgC+rT9WFBtg9GprhE3p+v+oRigtKcdf22S50QuRvy5/Bp9E=
X-Google-Smtp-Source: AGHT+IFVBwDVTaEx5xp3GqAkaC1oC6P66f5ES/MfkM7Xqee++lMNo0SereuLr6hl3BVB30yHpD8ptQ==
X-Received: by 2002:a05:701b:2615:b0:11e:354:32cb with SMTP id a92af1059eb24-12172300658mr1959588c88.49.1766123264305;
        Thu, 18 Dec 2025 21:47:44 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm4895244c88.15.2025.12.18.21.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:47:43 -0800 (PST)
Date: Thu, 18 Dec 2025 21:47:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/8] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <6bbjei3z3arl2t2alkyl6gzok3yanzbni63q5z53mbcabb3za5@2ot3tcfkld6g>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
 <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_214745_519635_F6CCD552 
X-CRM114-Status: GOOD (  13.35  )
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

On Mon, Dec 01, 2025 at 02:07:21PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> Further switch the mdelay calls on the reset path to fsleep (preferred
> in non-atomic contexts).
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thank you.

-- 
Dmitry

