Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2101061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhrLf69lwijmXhLU7sx2hxgwSuSk5Rjz6KB9T5JxPlM=; b=u/Vgax1DSTfVqN2sfgjP3gFt+A
	lX8aFmVDqBFC+MWcCh/DUBG5VGz9AF1kB+59dWhzSWxntW4P14B5HrfVcxUJ1VAbRFwqULcA3h97g
	conmz10MGp8yRRJlQ8fOGBXHm91glyCfkvSADNfrAl7AM6iLNujdUUhw6JpHX0EOB9K8qVdV7aTYg
	xe0ih+1aqi46zwugTRsv1lvHPfKzRMuYL//9ROZAo89q3Abcxyxws+R7gY1VuMcdUVFPY4ilbjVkI
	5Bu2i+VJPXIIavjM5+MX8W0nZrskQ+s2CAcRSyVP6flu//hxX//0Nkm+WNqH2h4piiGU8ABnsALf2
	GE/39G2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KY5-0000000Bvuo-42tm;
	Mon, 30 Mar 2026 21:53:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KXv-0000000Bvt3-0Dwa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:53:20 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1714540a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774907598; x=1775512398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhrLf69lwijmXhLU7sx2hxgwSuSk5Rjz6KB9T5JxPlM=;
        b=vjwqbv7UsJDzRTVMB9YDlYmM6V18d0eeI8F6NzmI65DohD4ExKnAUfOeenbnauQn3l
         iUHpYmyywIsjaf4+0LJokneG+VHMr7N9Vjnf1oBleiR27b53SSj3hWeuKVCFWBej962W
         qGz+xL3R2OUaZIViaZz/CCkifYAOkibqTMu1kkcd4tbvb8ONp6HzId8Rhf/pYufVp9Vp
         FeLeysSTfJbgYzzeZY0ZIFxk3IkbW5OflzQj2Q4WMRt+kqi9k+fEZoEM46VWxUlTSG/y
         HWNuscUm6+FL+zj6b7t6knVfWJ9I5kUOJVqb8nOofWJTNAA1IfYjorXZfCDBN/RXvaUL
         2n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907598; x=1775512398;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhrLf69lwijmXhLU7sx2hxgwSuSk5Rjz6KB9T5JxPlM=;
        b=LIERR0ZldlUMpnpiIj0CJ9kQtNhuRCoXq3Y+XrDlZhdI7tgb9f6A5YK/mQRophYRp1
         YA8GTaWcYivAwolYxHbE3J7xybWTv3WM4QjsLiNcZwAT5BBHbDczgie3HMwWJXr111vJ
         Wd6F6aJmBIsdluE09W7qiodpzqmCVHA6noYOPbb4boOXJIWHs0dl/VnfToCctVgI0Qil
         tdOs9W/RwnLUjM7PcDwO54WexrSBIj5V8iW7MxdXn2tOd0SNpBk1b3TMnrCUcxd6b6D3
         XZJEsc18Khnvb0B+Hu4zIXiSf5lYpiSx6P6zFsKL51aX3rRbJUAZJ9IFw3QabCDYVCjD
         rfYw==
X-Forwarded-Encrypted: i=1; AJvYcCV4kH0Xe/AqpTS57+2dQLMpXak0jKjmcfsiekMsitR5TZiXskfhh35sXOr4Z5DsisSBskj7M4/ckGDtBldnb0sa@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh6GfAeOl9o76Q2+GqQ1CKtj5Q1IMXSPWMH9VZFXF4B/74z+Z+
	ZYM7dxUwOsydzCjDm2Ug/EFO+pVAMd7MkezXA9B0ImM9geeGxfhpw2x78BrrIYuUCjs=
X-Gm-Gg: ATEYQzx0KT51xT0wl7QzsHrUey3DVQMHlIHsNvouShjEzqdGCL+6eaBISCVWSLXJq5Z
	XdC37GVonNnHfq/paNUazoy6Hw1uEWmv4hA7DJSDVMaX5YCMJvhDjeea8+kCjzhmzQTb8N3BtcV
	3oVCZgrYBAsDLb/7Ltra/DyQEtk8FMHAwMLaa4AKy1+B3Spj6+NliPkumE31AdaMkxRg0B9GiwN
	YXALSqlFr6ipSTM+oqdZH2ct1BaMjI6TH8XZjrC436nQ5MUCBnHRGHIeLsY8lfLt5tNDWtx9AzC
	VedFZd3Rh/MqDTwixFfOMd4MSIcwrB45UnHaZXilcf4QjUSYRDR7MMKcl7bAKr/0EoGkxClGB71
	FIg+l/Qn21eiQUJLukpsmsn6WOaSXntmlDvxN5uW53UOFA9u4cZJDiIw8aVipuG+LVy2OqbxtOZ
	kPqOOSsnmWqPeC+/STUs0=
X-Received: by 2002:a17:90b:4ac3:b0:35d:a557:e44 with SMTP id 98e67ed59e1d1-35da5572530mr6144809a91.6.1774907598192;
        Mon, 30 Mar 2026 14:53:18 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35da9ef1b70sm3940792a91.16.2026.03.30.14.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:53:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, Julian Braha <julianbraha@gmail.com>
Cc: daniel.lezcano@linaro.org, linux@armlinux.org.uk, arnd@arndb.de, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20260329183018.519560-1-julianbraha@gmail.com>
References: <20260329183018.519560-1-julianbraha@gmail.com>
Subject: Re: [PATCH] ARM: omap2: dead code cleanup in kconfig for
 ARCH_OMAP4
Message-Id: <177490759740.2030917.5758134874095517532.b4-ty@baylibre.com>
Date: Mon, 30 Mar 2026 14:53:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_145319_094007_B9E1F1F6 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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


On Sun, 29 Mar 2026 19:30:18 +0100, Julian Braha wrote:
> The same kconfig 'select OMAP_INTERCONNECT' appears twice for ARCH_OMAP4.
> I propose removing the second instance, as it is effectively dead code.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.

Applied, thanks!

[1/1] ARM: omap2: dead code cleanup in kconfig for ARCH_OMAP4
      commit: 9ceb17ccd15ea32f19c9066f5f1b340d8340bd0b

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


