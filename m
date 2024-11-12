Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872B6D32D6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XblwL0PzEtz1p+RH+PZoSXPcYHiVL6RcENPZ9d+EWkY=; b=lBnjooKxF3DeBWDKbQDgodeXvz
	VwUZchGA0UhVnsHLhdZrH1AyBroRF50a4rIzFujUUrv8G8cbJKeGIrcfx9kgT4UgYLMuJcxASZ/QZ
	tYx2adjDOXxeU//Ij86W6XkF5jyhjL08otjEG4m+mypkpYLgZUtOllq/P3YkvwMPPuy0JqKBGyPla
	dt6M9n/bFqVFfcF79+Ezlmcobq+FcfecCwhYMTVnWF+fRsqY9hai4mkg8IP5IcqX8v406NeWlOGfi
	P4PYjFupFytyo95gkrQFXKMesjr9bKYdQxjE/A/1fmgGp9k6Yu3dxZYaU70dyDgzxJdeHEj7tmQtP
	LUAP1zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnE1-00000002pCA-04KE;
	Tue, 12 Nov 2024 09:30:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAn99-00000002oHY-30ex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:25:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso3449634f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731403514; x=1732008314; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XblwL0PzEtz1p+RH+PZoSXPcYHiVL6RcENPZ9d+EWkY=;
        b=shBDx4zbbY4EDguE+nja752kLUX+GLZ90ENn7Z18s4he+e+sbSRrWkYaR9neQW6G9R
         DiWv9kcoLceZht3Lk65wVQy6hph0E91fnpSgIRgt36mHJdYvxHZ3kOMrB+FGKEyLkLwJ
         GqKliZzOU2yqeOi12k/CGGjszykz+OS/rF7a6X5BhUoQldFL0nLjm8ZOhWF5dpHsTbEl
         tqWlw0xjU2AxN4u9Q8OECLgcDr6w1zezbo7+sHzBRQZnfn7Axv8Jr1Hhs+x9Ec/27OST
         Sg/rRovmtwpxNlUQNKX63FxiOTg8LOoO+fXhJV6x1WPi4xeffCF2sNYH4NwHvA15dBq0
         tz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403514; x=1732008314;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XblwL0PzEtz1p+RH+PZoSXPcYHiVL6RcENPZ9d+EWkY=;
        b=gCFj/pZgSd3ImE/6EJMsaTa0PElSQfecPXWetR1gdDBI2+wqBXLfWEWEDbKMUhvFdR
         eMsvQ81zmYnU5VuLzqnx6UwzrswOTT3YGPVsdyTtO62YLz94OuArkqztf8F3ujjyFr0c
         9z3laXPMb02sdCeHfmIhZGni4WzlZBAtHBgZh5hZOPXUp9FxPNeRknZCIE7G8CKaAIgw
         U+a3IFTC7yvjf9hAaSVx33EUcsZHiOoXv6Vt+PoUdPYOKMthh159snvrhy8OxjbGWSju
         MsQxpNDnAeKrWH3T0fcYF5dV+73ZtqqUDwhb9q6PSZ2cxbHYGAcW4mbCqI+nRcRLycZl
         JJUA==
X-Forwarded-Encrypted: i=1; AJvYcCUmPxf4Y77rk+nLmC3v53pfoCKbSEn+xphoo73WRxRRwoDR7eNXTLUU1u4HaDX9MKRDAHE1rM+x7LFrvzJOqxTP@lists.infradead.org
X-Gm-Message-State: AOJu0YywY3ue7CDdrssR7tRVEHGy5itk5/DL0mwI0anBnl53YBI6wNq1
	rQPiGTVM9y7BPN6kjOHQd9cJzfVamBzu1NS6oOrTjpp201re9iQ/nkH3v3dli5I=
X-Google-Smtp-Source: AGHT+IH4AWBMa8vfF0S/UtOUsgif9MEpVgNttYKPWrjNvh9pZpYY29xpo1rijWgHwhFk0PqGiPd7fw==
X-Received: by 2002:a5d:5f45:0:b0:37d:3f81:153e with SMTP id ffacd0b85a97d-381f186cbd5mr12768518f8f.14.1731403514167;
        Tue, 12 Nov 2024 01:25:14 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04b52sm14728353f8f.101.2024.11.12.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:25:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>,  Arnd
 Bergmann <arnd@arndb.de>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Chuan Liu <chuan.liu@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: fix Kconfig dependency on
 RESET_MESON_AUX
In-Reply-To: <20241111102932.3209861-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 11 Nov 2024 11:29:21 +0100")
References: <20241111102932.3209861-1-arnd@kernel.org>
Date: Tue, 12 Nov 2024 10:25:13 +0100
Message-ID: <1jmsi42492.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_012518_124785_026EBAE5 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon 11 Nov 2024 at 11:29, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> As in most cases, using 'imply' is wrong here and does not prevent
> build failures since that code may not be visible to a built-in
> clk driver:
>
> axg-audio.c:(.text+0x15c): undefined reference to `devm_meson_rst_aux_register'

The function registering the aux driver was in clock in some old version
(imply was ok at that point) and I forgot to change that when it moved to
reset.

Thanks for catching this
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Stephen, This fixes the PR you applied. I guess how to pick this up
depends on how you want to deal with the Fixes tag problem reported by
Stephen Rothwell.

>
> Replace the incorrt 'imply' with the necessary 'depends on'.
>
> Fixes: 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/clk/meson/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 7cb21fc223b0..febb5d7348ff 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
>  	select COMMON_CLK_MESON_SCLK_DIV
>  	select COMMON_CLK_MESON_CLKC_UTILS
>  	select REGMAP_MMIO
> -	imply RESET_MESON_AUX
> +	depends on RESET_MESON_AUX
>  	help
>  	  Support for the audio clock controller on AmLogic A113D devices,
>  	  aka axg, Say Y if you want audio subsystem to work.

-- 
Jerome

