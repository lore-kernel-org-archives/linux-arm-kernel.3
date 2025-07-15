Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E794CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=; b=OUmCkTdowu8jjDhKwwhYBJZhvb
	NaH2NaeI+b02iYY23DoEdrO/2ZupN/nbgYZa7TGyyeK16u9dTKkYkI75oWsvmhZkNw+LRYQmJhpnr
	/pu575ruSc9hNMNQflXNhdxwS6Ydq+RWnwty+aMrPpwx+8D3ApcRtVxa1428BLnnAnYAC0S23zKEs
	KgMDMutEqWSaiQbGccaGslgTBdh9cVkfAmjeCJ6FhsfQkMKCKlYtyF/jqjWDt57gxb/XJckLBphbD
	WTmLJa5nOcEB0kmVw2HwxoTpUqBi3rq6oO6LwAmIcVtmK4m9w2+agj4mCU7CEhkcCuYP4ZBXzFKOu
	ZacQ9vWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgtL-00000005QVq-10WK;
	Tue, 15 Jul 2025 14:44:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfad-00000005BdU-1mgB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:21:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3948128f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585658; x=1753190458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
        b=kO4pbOTOeKSAa9HGTw8RjdiXXhKLxzGplFG7dRWOSJX0Y8qXR4jTOrgLeBlimcCp71
         4tynIG6eu8s2Wd6WrcFQzFeM8a11KiwVVOfAQ51GFJzN1w1/7LZzBM4yRh+hxsUzsVvh
         8hdh8Cu780sA7UHkj7d40XCLSpJeeukCymkBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585658; x=1753190458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
        b=JxqLozjMiz3zbr9JHVAmWDwUhnuLb+eWl+kCT4Mw6f+xR2QkILp5ma5sNZhXkYH8lO
         lVqDhMQx7NUGqiMOjOk/GYxje6nOFyY/i6d4fLCuCPewPMzrbdYteRGUm/5/1ScccCkV
         P6y3xPo7MDNPoPqYdTgQpKArzjFYkV33R619qwuYrPhBgcsqpIWmMn+ol7D9XAgeuWsk
         7AM/Aeo/7B/pQQKjvJafELawiLaLJQt2B71V2yVEoqObwWfh9d5BLn96cxZME3YlQbdZ
         jUCsluO+uLfMC0CTwqieIWdfCU0QOOMuttLLxd30xWCJoe3yHsx+zzQj1B/S++bn64zO
         hjkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1PfFlMui3rIGtVZ+79ReP2MufM/2ZvE4gmdQcaCD3DdceUJBVe7waPE0YkmuEwz2LK6nXTS3+uRR2OziiC1Kh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6EP08J2BhCwV5f+lpbXdpBqEv9MHlseYSZE/YkaQw4ljHImBT
	mZcB3d6E00LQlGJJb7qrpdHU85m6PJaJf3zKhslHxUSo9zzLXNmjeNoHZSJ2/Lig6jE=
X-Gm-Gg: ASbGncsEh+NLy8xb0l+kb2IELYnXm20H7PruyDoVzfky6CiDNNHICU9LXsPFo8qMhtC
	wHP//tqCmOoCupNTMa3XvxYzA9fZy/TUHJOgcWJdYn+qbYOPYIdurqh3Fv26ew0AGOaD22E9a3F
	u7kPc6hhfCsvRYCCeWxnT7Lo98j48qdW3lmteIqU7l2Qsi1NJw18LBDhgTjkpUXEhWOPgoAjT9L
	MJS2Ew2m0ZBgFoYvKDaTVhDBQcmKh3zwqwunYj42oMumR0CwfpMDfhNTjOndWvGN1ECEAlOJoKc
	aKvYfjUTmZVNN6Yyqq7Com+2+HKpdg/65dmoGy/VV5zuH2JXFTU/1iArVbHPl+ePdMn6sMtHWxY
	jJ6sSjyzfzDClPCM9Ov9hpEPevZDWC5ndNg==
X-Google-Smtp-Source: AGHT+IGinrr6VlQ7VPBCrVc59xWEOcpuzjncDgPBrTWdeNMpcUJW8rPWbAvhsIGRi9zIwLALwbGYCg==
X-Received: by 2002:a5d:64e4:0:b0:3ab:27f9:e4f with SMTP id ffacd0b85a97d-3b5f2e1b872mr13361758f8f.35.1752585657761;
        Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562b54b439sm3676615e9.16.2025.07.15.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:20:55 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
	deller@gmx.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 05/15] fbcon: Add necessary include statements and
 forward declarations
Message-ID: <aHZVt86l-sXKQpMI@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062059_463531_28A4D69C 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue, Jul 15, 2025 at 02:24:42PM +0200, Thomas Zimmermann wrote:
> Make the header self contained for including.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/fbcon.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index 2382dec6d6ab..81f0e698acbf 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -1,6 +1,13 @@
>  #ifndef _LINUX_FBCON_H
>  #define _LINUX_FBCON_H
>  
> +#include <linux/compiler_types.h>
> +
> +struct fb_blit_caps;
> +struct fb_info;
> +struct fb_var_screeninfo;
> +struct fb_videomode;
> +
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE
>  void __init fb_console_init(void);
>  void __exit fb_console_exit(void);
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

