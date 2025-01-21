Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BA7C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=; b=TuJW1mnhUCa4bsGuKJfZ9vRFpE
	agMkLoi03DGgUC1U+5gsoSmRfKR4VFDzUZhTlr6dlc2aXsLzm34m14SiiKPAu+fMAvWSoY+e2yPmO
	mDPEWM2QU+qDIAYqaVKSU2QoH7aD/D4sE4sOcc5Xm5tXuPFnvJTZBwSHR2hEkCZB3hj1RARWiyzVA
	tD/+PiTN3sBcDYiT/fbfFFcoaeqXXA1+YDI7INddYxTXiLLg+4I4eda1O1f7hvrfVl+bvb82pmTdr
	zY2CuzBLYS2EZvrcb2iVKpENnbVYgWPBBEqsaWob8RE5qFjn0bxjGILT2vf0F9ZgMO+AQIp4fE0d/
	8YRXuzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taArg-00000007SM0-3CVL;
	Tue, 21 Jan 2025 09:48:08 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAqP-00000007SC6-0Xe8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:46:50 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e53c9035003so8351384276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737452807; x=1738057607; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=;
        b=ivvCBlroX381SHtW+7GJTB5jI+HlLeue0QbC8nhEUTQU6g6OrFNQeYBmADj/Baw1cU
         uD5XPn3Y07jzzp2tLUKWTfryHBgUHu3+id6D3hl7nw73aMkYTI28HMJMmlalcSvPHKQl
         mXcS0G+QB8UcdQMxvk86EqurrjzC8DKvVNllBOHNhPMfLEgwUnBgraeIGWV/t8yjWyrY
         co+TWbnibTwbH4vjwzG9EW9kEjsdGX+W5jjjVWPUKaL5GA6DyDX3bCa+S8vw0/QwjIoZ
         9LQ6Nl356I3GsZ0HTAcXqMlXlGAUvsv6Er6uMkfw4P6yzOGsILrhenRrpVbZ9ddhaoj+
         V+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737452807; x=1738057607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCznPro7DzazvTiUhQrmITM+It7rrjrCA9i0Q4NMQd0=;
        b=JzKAZDHHlv8yjbO6AlxKBg8nccN2VIHKGB/3nRFfjzJ6+TFUlxAqmSh94ni104sMzO
         mrY6inEGvxzUhES6j9iJl/9dEyYzxKsk2qc1AgE/yewwh7oDogFxx0bi0zL2S1xJfhRd
         rLe803onFjoB3ixKz92wweyba4dVWf6YdpJ4V6lF3PAJhzvRtbFgY14hd/mE21iJOT6o
         guqf3vlDSr9fVQMukkjKDK0gsXbVaEMS/OTe5Vja7HQpF8Ij5fQzXae8K7lWCaEy3TvO
         aJBj5+SGwQ5omOf3Jex/jaQzFXoWPKeeBz+NHQ22xDuajQuy/t0I0RAsCWe4/h+FDgXS
         DLtw==
X-Forwarded-Encrypted: i=1; AJvYcCW/1VxMZfhKzJ0HbIzRw0jLgYWNKy1SHzXvmDOTw3FeUsSONkVyPK3/FjOeqK/BMwIIlo6UYm0y4ryF5y1iNXEN@lists.infradead.org
X-Gm-Message-State: AOJu0YyKmZfWVsQO57yxz386l3qlledaUleBEgq/j8AVNYoM2OBR1oKD
	Ek4pW2ARUz8yt7PdHq7azbbNe4FbwZx3cp0B+wxqVeweim2DTvxGZ2fmhqJUoqK9QEeGB65rKUo
	axN3Z0uYKxWnTIOS0GhHvGBkjJSvVQcMnYgK0Fg==
X-Gm-Gg: ASbGnculN/NSGIbN4FOfjzPTGEznn2Kx8nCHFJ95H5XiVDCEBGsRlCTnJ6hT6Q5uH5H
	DnOaV1o6aJsjjX4sRkblaKK2jWWpcclSseC+KMaA0iICrNhnLeEA=
X-Google-Smtp-Source: AGHT+IE4NvWjhVwcZefMFMPsNF1/yZL/+GizgE7O5W0l1UUq/sk+Rp9xLLX7buviHENqfSARwR8NAFZJ6rRHBgoskwA=
X-Received: by 2002:a05:690c:7344:b0:6ef:5ab8:2c53 with SMTP id
 00721157ae682-6f6eb68695cmr133051747b3.19.1737452807535; Tue, 21 Jan 2025
 01:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20250120153817.11807-1-ansuelsmth@gmail.com>
In-Reply-To: <20250120153817.11807-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Jan 2025 10:46:11 +0100
X-Gm-Features: AbW1kvZ21pVNkI7qM7rGH-9wFnhv5SdIw9t28_ewxvHO8LS13hlMrra20J6gTIc
Message-ID: <CAPDyKFpBtnsEfMg73UHdXzZvSNHaL8H4N1h6-2wAMnFWNTM75w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: airoha: Fix compilation error with Clang-20 and
 Thumb2 mode
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev, 
	Sudeep Holla <sudeep.holla@arm.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_014649_201917_DB5DB6FB 
X-CRM114-Status: GOOD (  17.32  )
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

On Mon, 20 Jan 2025 at 16:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> hooks are inserted via the -pg switch.
>
> This is a known issue and similar driver workaround this with a Makefile
> ifdef. Exact workaround are applied in
> drivers/firmware/arm_scmi/transports/Makefile and other similar driver.
>
> Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/mediatek/Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
> index 0f6edce9239b..18ba92e3c418 100644
> --- a/drivers/pmdomain/mediatek/Makefile
> +++ b/drivers/pmdomain/mediatek/Makefile
> @@ -2,3 +2,10 @@
>  obj-$(CONFIG_MTK_SCPSYS)               += mtk-scpsys.o
>  obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS)    += mtk-pm-domains.o
>  obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN)     += airoha-cpu-pmdomain.o
> +
> +ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
> +# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
> +# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
> +# hooks are inserted via the -pg switch.
> +CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
> +endif
> --
> 2.47.1
>

