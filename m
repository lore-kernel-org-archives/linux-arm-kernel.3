Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F240FC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNtSulrcCSblkD0zfddb8JAGFbCKZWTczcGLRiEHaKU=; b=QWLQQ3CVN8jHvVsgRgjB8iBtVY
	JwgOl9Pv2UoCJ/He/Fx4XuODG3x3rtOLdSjVP1g+ABSKFmR0/gmgZM3n6P5W//u+Fi8wePOG7Cam5
	Q+vi84eBoKmWzr3EnG28Cq9VQkCchmv50ZUDTy02s6bqANfoSTA6xbxbpkPi7hScXuMcVnGx+mDY3
	biTGVm54Skcx4fRdNOjN7c20gWYcXeMrD+HCP5vaP0Zv52cyt05pF4f3t0/I68XV9iwysPcc36DZR
	gEVlBaMOp1zcG23/NcmBOCavNB0HNzNPPsatYTH8Za0IdplDSE2cQZAJkBQYo0tLTT0X/Igb4VyQ9
	vjUWxCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Bu-00000003fKT-2Mno;
	Mon, 14 Sep 2026 12:53:46 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Bs-00000003fJi-3CJO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:53:45 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7acdc816so2196685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 05:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390422; x=1789995222; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNtSulrcCSblkD0zfddb8JAGFbCKZWTczcGLRiEHaKU=;
        b=Llx6/L30dPh2dM7wnqeW4MICeVf5GSHrQ7Govy9KnwierXFN3TwgaDqVHY1g3BcxgY
         B+0YXBeb3W76GBdz8m8+p1hle3tUkSN3XHC2s9usBouRF2WDo9iXvImgZmn6kzyWM8nF
         wztZgewxex9j0xuj9jWqhmQ4eTMLcguCNnmyTDO2BgoqXovuCyE8zs2xbVa8HGRTNL2k
         RuZFpdWcbGb/r/F3eXq4UFQRX84wRooZkTSdMoFLR2f9WOMLvCmEO1V+ilP81ROr+Uv8
         Vww+gviWsD1C3L7IEbxBS/PZYXJtnHS+3HV5fxmvm8ARTwOtjRnRrvlH1Uxd0OzBcMjv
         jXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390422; x=1789995222;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNtSulrcCSblkD0zfddb8JAGFbCKZWTczcGLRiEHaKU=;
        b=N6zFkGSIbkZFUXdWWZsFmP/5hDALduMkmiuAhjkztLauZDplqIOf3sTJQ7PyCx2Cqz
         Ja4Jkkze49TvPPtkBeJPnsdcMw1KcTuoW2YGFQrt5wS3EJUGSMqYQZarqrizfYqIw+jh
         MVinMNCZpI0qYNGg2C3kJMoWz5M+iwWcdM3PjESf7RfK+XmjQ0ymRz5hMYpARpvCibCX
         zfKMqsMjRJzLaXcLQezhy7HECLZ/UF6wdAl8IQaYOytGq/XeAMwnbJwWjigBLT2w+zy/
         fsyFXDh3WXs5vj0d/NBOZT6RFBhtCoJ5F59e5Oa+7HsV+Adprt3DuaIHP1IhAYMQyUxF
         eGug==
X-Forwarded-Encrypted: i=1; AKwUvBz0wnXYg4kIEZvvzAudrfbKfx/AcmCyQfZLuVrm0Md2P2vIA31/uOU9BR+HW7bRCcPvR4eBI+1d5JP8nvZ7VGez@lists.infradead.org
X-Gm-Message-State: AFuF++ngUE8jcjijBJebdGupxSvhtyCBF9LU1z7XCY2vQT0Vso/cG34j
	dzkcknJmj7rFX3X6PrSbL2D0uon4I9+3Mv38BOgYckLvjI1j6VpKDRcg
X-Gm-Gg: AYBFou2eLgNwKDFvx5fqHIN/z0+FkPs5IfEwlATgYTQlNuHhFl58HMZcycqOlqL0ioA
	pVXRk5slt4x87+is5jXfliGi0/fVAEq2k0FkgjCvwcKDtNFzsU822FfOm7ooepg04+2wz77yJSg
	QZMCnaP1ajrKGSN4V932Yx5dG3gCipEHyVNX00j48SjjhfEouVene67DwghXp1dxXVDZRJjC/Ch
	+h9QmxptaxCse1hdepKmJWMAuVQBzdfyK3qC+hAcZMNRA6O1G1clLSBmTVa+zErD8CHxn65JNzB
	fjl+8SqAwZdRHV5OPx6VqKpN2ZkRaC9ElDpDPhRhH0EfVK/kG2YreYyK5IGYWB/TEICgu5y0jzI
	CDl2mgl99p4RaSDMeOKdfiGMEBA1AKI/a/ly7T9L5wuSQkL5xJJc0MrKlu+IE4P0PXpRXZvbYHI
	tTfYuhLTmO65hkmUMmgH7cL1eM5IWw0k66WcIA9J9wuRL8jVnL9YYfB1rHNpVFKQsqFYFyALvWP
	u3Ec9NaO0kMNjz4i4pPm8QQWic1XgIoo/lLV1rfgstgZobUnUdv8k6WmoXUjV/U8pfT5n+8Uoe6
	XmQGEAJZ+yDEO0QYOcTVDWfyg3/uuyhz8yVrPrZ6iSu9Nn7P/MH4XL9pKbV7a7kPu491GLq3adf
	yU6aPVjq/B8eZv7O7WSG9lN/zFmnT+iuChzGnPTl8HArOpYysfKhcSTotSCpNrmQofykZQyXN8k
	eMN1Nq
X-Received: by 2002:a05:600d:8490:10b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49e7cf551e6mr4118455e9.14.1789390422542;
        Mon, 14 Sep 2026 05:53:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62231360sm218704995e9.4.2026.09.14.05.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:53:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:53:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Eugen Hristev <ehristev@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: at91-sama5d2: disable autosuspend on remove
Message-ID: <20260914145339.00002f0b@gmail.com>
In-Reply-To: <20260914113422.1689331-1-lgs201920130244@gmail.com>
References: <20260914113422.1689331-1-lgs201920130244@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_055344_824897_07CD3C8B 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, 14 Sep 2026 19:34:22 +0800
Guangshuo Li <lgs201920130244@gmail.com> wrote:

> at91_adc_probe() enables runtime PM autosuspend with
> pm_runtime_use_autosuspend(). The probe error path correctly undoes
> this setting with pm_runtime_dont_use_autosuspend(), but the normal
> remove path only disables runtime PM.
> 
> The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> set therefore leaves the runtime PM state incompletely cleaned up after
> the driver is unbound.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 75d7556ac0e4 ("iio: adc: at91-sama5d2_adc: add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
> index e8a5285bb6d4..e68632e628c7 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2487,6 +2487,7 @@ static void at91_adc_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(st->dev);
>  	pm_runtime_set_suspended(st->dev);
> +	pm_runtime_dont_use_autosuspend(st->dev);
>  	clk_disable_unprepare(st->per_clk);
>  
>  	regulator_disable(st->vref);

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

