Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076E0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZURaLbDo3dwoVqwyM02ToCv5MutkNZmPeTZy84rbNEQ=; b=rC25I6P1fQYWEn00ds6UeJVzyd
	34ulIj2mjRZCTvHF+PX0KsBTx+rrVhhQMajbW5bJczlZoLi0x08DSLUwGgRe1Nf84r8l0zMDVV7Va
	ZgUfBb13lvogu9147nLwVvkx2wfyKYNVhSSATFSq81M4D17Xzl/TZDBw2g/sW6Ke1ZWDB7hE19m9C
	XYWhF+pbWzmPvBMcmEhj3gaXomR3B7YnjTnbkwNt3xBz2hZmb60C83rZqGA6+YUcqjWOH76zBZuC3
	z7r8ZJcI/EbnDeDQMKEur45NVLITpHU9Xc8MAedYA8hOJfm4E58ESWS3BcAgBnnzK8ozfYmaWLnEj
	xyAiiLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJzL-0000000CCaD-00hU;
	Tue, 04 Nov 2025 16:34:31 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJzI-0000000CCYc-1Ey5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:34:29 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-63fbbad0ac3so1996705d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762274067; x=1762878867; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZURaLbDo3dwoVqwyM02ToCv5MutkNZmPeTZy84rbNEQ=;
        b=khG4qCfcZ35qoWFm3qAc5vtPK6EY8+LDQWJwjZl2RTt3shiX3NtctEek+vRzrecWvA
         ez2O1pUobBceg+1s9DP0UddGCDdX5oSLp1fk7pNV3cY/TNbJSM/FjM2JVgMxEhhkrfGX
         BahLgDoKf8vwq1CHFiglD6nu64Nh4hvIHUa+E+4ArBgNP+xQMC4uut5yWJzjBTzW8T1T
         SCsxRKTOY9yH/2P9ggPgy18P6Fzl6HD02gmihj2QsF/ux6iTZN9yU2sHPGue08I71+Xo
         bI0OwKNMa74JDH16Budy4ncJyOBy/0hisZgFH0Xxb+0M/cCBR2jkGl6CMd9aS3SlqO2I
         pEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274067; x=1762878867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZURaLbDo3dwoVqwyM02ToCv5MutkNZmPeTZy84rbNEQ=;
        b=luvhHUo8DfFN/WEutdqU9y0vFeG9FGiSbPvxMTDygMsJj5zdpIS5GTGazRK76aTw7f
         d6CEBysZnnF6fzbzU1VmJ4rdbvlmOfQVIKeGFSsRMybjdaYRgzUp2OZ/X3FD9PCmir8K
         adMWXTqYuC0GZsKdvLpmNFkT0kWnlt7QJq2jIQhqJzaBWKt2RDcuWfnLkqumMG5Awy4r
         MnmbvBN1ShIGB81oNqCXy198nJUkMM+bZ/tiU1pEL1wxzPo86o3jYJTpb+k0HQvC3Cgy
         aDq/LACG7bY4/GCfHXOi+fyiPsPLd0J65SJKaLEdA8B0pQDatPbbV/mUwZ1z+ojdJGXb
         1KEA==
X-Forwarded-Encrypted: i=1; AJvYcCW/peljDu5yPjK3Y0D2XqJnBtFQoK1mJeXaizRbi1eboLMB6/r6gqcAcGPX6b2C4so2czfVDGBg0lMYNV93AXKP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2H/WLOhf7ZhjRJ7/khS8b1x8f94YxJBXs+LtnopR7LsJ5swsK
	BOza7kDy/FT4Os+Oj+LzjTWHBZg6pTlgUc0iq8fisNtYpSnVA9BRm3GZ+DbgrRiHg11jxIKs5Z/
	i1IxnUaQTlrwEvFa7VhLcUllymd4zvcxtw8vi1ABeoA==
X-Gm-Gg: ASbGncuVH00xvmExpoZ3u67OuyFNhpnPSbKuQBa9LQGMpXUCJJN0MmqcmGN9yZzJRWJ
	PxswJjqYMxpzm/brJwII95J7eLHISp/WNMMBdF/ZmcI02ZzQUzoSL23C6sO3K3V3aqlslpKLh3d
	guUGsrryG1LiBGKcIy5fPnQQkyPZX0f2d4MoJLPktxQWMeerCa30AU94oD6ll4l63TnYD+x8sVW
	vPK3cHB0FFyNfkPUQmaODK3mrC79f230xjQdB1aOk+fA8BigWPWjeulASJnFA==
X-Google-Smtp-Source: AGHT+IGVTYPjRbvY2dc+1i1hVKSl6/mUpbt8rBD57n2a05T5582PeM1IiJduGFBi48QQYI8y525MVnCW3dK3LdtTGiE=
X-Received: by 2002:a05:690e:419b:b0:63f:c10e:6401 with SMTP id
 956f58d0204a3-63fd358fe2bmr57363d50.59.1762274067017; Tue, 04 Nov 2025
 08:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
In-Reply-To: <20251030-mfg-mailbox-dep-v1-1-8a8c591aff27@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Nov 2025 17:33:50 +0100
X-Gm-Features: AWmQ_blVz8oV6Q800iTY_FXK63-gujrHnWpwcZPlwshpI-BtZsgfevwVde_Zipk
Message-ID: <CAPDyKFrJdN_6FyyjMrfNCKwXt6kFPEPAxcuosdasoxtbJHk2GA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mtk-mfg: select MAILBOX in Kconfig
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_083428_346086_F9170E09 
X-CRM114-Status: GOOD (  21.63  )
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

On Thu, 30 Oct 2025 at 14:17, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The mtk-mfg pmdomain driver calls common mailbox framework functions. If
> the common mailbox framework is not selected in the kernel's
> configuration, the build runs into a linker error, as the symbols are
> absent.
>
> The hardware mailbox Kconfig system, MAILBOX, has no dependencies of its
> own. It's therefore safe to "select" it rather than use "depend on".
>
> Declare this "select" dependency in the Kconfig for the driver.
>
> Fixes: 1ff1f0db6aec ("pmdomain: mediatek: Add support for MFlexGraphics")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510301311.TcOCnZ1s-lkp@intel.com/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> I assume this can be squashed into the mtk-mfg driver addition commit of
> the maintainer that merged it.
> ---
>  drivers/pmdomain/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
> index b06aaa9690f0..8923e6516441 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -32,6 +32,7 @@ config MTK_MFG_PM_DOMAIN
>         depends on PM
>         depends on OF
>         depends on COMMON_CLK
> +       select MAILBOX
>         select PM_GENERIC_DOMAINS
>         imply MTK_GPUEB_MBOX
>         help
>
> ---
> base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
> change-id: 20251030-mfg-mailbox-dep-ec32ef510e6a
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>

