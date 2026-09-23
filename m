Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF29C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=; b=RhUDD+EC/Tht2tG0T677cRZVd7
	ziCt1VFBPPTBJKWYm7yYWA4N+cvvJOWoogRNGAWUGk2TRzGknTki0rz8hQSDcrRDs/a2L7bUUIxfB
	QWi981XQxufcVT9VN2fuKr8oABOwDCbCIGVRLdeKUWxnhdWSw0TWs4rvafWPq1G07Kss7i8eK7LiZ
	tli4xhYyG5UGb59lupyT/cI/l8mOJ0a4JFgBA04SiXPQTWMgTE2NCgqDJX5tWTaXSQVaaIrmpwa15
	G676QxuejqB/EXmQj97fh+m8aIV2aGAdfzmM1/FzLSb+BffFIgnLxIHo2G74tupt1ItYGbjCoM4TA
	FTKjOvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OF8-00000008a41-3GTY;
	Wed, 23 Sep 2026 14:46:42 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OF5-00000008a3O-2w0W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:46:41 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8686f46e4adso715193b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174798; x=1790779598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=;
        b=ScYzsNOHKtYHACnyWCm+MwEsgVZZtV0xR0qzCmIulc3hIKQ9CBJS8BQSXsdQbxbtMr
         EPhG+9w5ROR1IWZZ+HQ606asroBbVOofKT1pW7RO0nKuvsF9NaoBSVr6MC/r9ddMYe5C
         6Bywe2bfRMGthu5IHYUvSR+tSO5IAcoVv8f/hdbLYeNGREryo+/AFqivpM9xHOaacdLP
         uBNVKYrfZxAm0BwJoODLeXEMLqSAbCXFZo6JwywfU7J3WlN4rVXx+aaxz/l6WawysXg6
         93X8ZEHgTsXJu4dnXPpjIHOGfXv6Up3xJ1bdP/Bny890axy8PZGUDaEWWOfoDN/yrHsQ
         /ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174798; x=1790779598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=;
        b=1lwsP6fj+VjsbgvWj61EZpYFdm8HT1PmPN7Me3Cs9aL5XwCpJQ8Z6/pY1zAbp9WL8G
         j4FRUhNwIEMR2Ga2CSIWjhp9MZH1Tla31/C2vaYO41a5+3C+dzjAnV2CCWeOzgGMtLal
         NMORvVOjJvUWXHuA+RnSzUGddozIkx/0om8//wC2eK68tTRWrFsBhkjqz0oQhWaq3ejV
         GuUCUU9K6EJ81G54sGMzDxrZCe+8+7cocjaJJ0PevuHY5M5G/DqQXJs0b4VoIOWl139L
         +wna/P7kJwb4kB/ul0yy/XvxyYuuwvzfdfHmsyOrytEyQENjoFVzdYnN+vfnAQOnOWgw
         Wb+w==
X-Forwarded-Encrypted: i=1; AKwUvBypgjyGcvSyrUjRn+2Qz8nQdWsfo08Yl5DZNMX+hbs3B6GwPzOwH6oTfB1+DNltrs+fin1FFE+qZ7VHf7M0nwlk@lists.infradead.org
X-Gm-Message-State: AFuF++nEXSdj60gvX6bIkGIKyHQOOGwe3BHKtG1BPDofn2mxuRcSscWI
	OPeDsGEQbGE6JRsJf+CTlSpduSmTsAz3Od1kujK25zTw5GzDt/I/xb5n
X-Gm-Gg: AYBFou1a4FMVhzUMn7C4MC/oP34qVe/0f0ZLDKkLaJelxRcZXsYOKUMsFPhb13xlB4x
	Jta7QW92HtsTe7/RqS4s2LLn1aLNKxO2ilD3OBPvaPAuuqHCbdEkhS7TKwAYtk8wMy/9Fg5aa8W
	VfYj2Ti9BSLcyrL6AE0K5fdFXQ5KpKs5D1pCofBbw7AKgHaiEqUxQnBCQBcuTcWNqwbfkn7x7BM
	4pXaQRl99YjWPgQlXxleBf+G4z/MvfYrlZAOMVRfCZlFMBirDqHxJlibMrRxISFBtFVBfnvZZvT
	ZyxiibkeRHkjBNkXs02crDS1EEk3vqQxCKfkpiDJDAZRllT6eN37YDFQ0z9EZx3Ve0NOAsfMVlk
	6WIEe71iC1gfyntW21b/ucUNnz9NBxGTge8tIC4N9RIB2oR3gFEWLe2rlh61P2SqQWHSxWHu0Bx
	97dFd0HTQbR8IQhuLz2Q+d8WDw8XE41jaS57X1umX7cgSQT1S7we55xR0xnq/wm9VnUjVfLM3rj
	6hK8Wx7wUBC
X-Received: by 2002:a05:6a20:c90e:b0:3dd:a196:5396 with SMTP id adf61e73a8af0-3ddf8296889mr2890417637.56.1790174798050;
        Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2228a2sm1257186a12.4.2026.09.23.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:46:37 -0700 (PDT)
Date: Wed, 23 Sep 2026 07:46:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] hwmon: axiado-pwm-fan: Add missing documentation and
 MAINTAINERS entries
Message-ID: <8b761904-27e7-4e03-bc37-9fb048368b2b@roeck-us.net>
References: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_074639_747220_E23BE52A 
X-CRM114-Status: GOOD (  27.73  )
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

On Wed, Sep 23, 2026 at 02:58:41AM -0700, Petar Stepanovic wrote:
> The axiado-pwm-fan entry was added to the hwmon documentation index, but
> the corresponding Documentation/hwmon/axiado-pwm-fan.rst file is missing.
> 
> The MAINTAINERS entry also only lists the devicetree binding and is missing
> entries for the hwmon documentation and driver.
> 
> Add the missing documentation file and MAINTAINERS entries.
> 
> Fixes: 2d52742f408f ("hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@intel.com/
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sorry for that. The patch did not apply due to conflicts, and I had to
apply manually using patch. Doing so I forgot to include the missing
entries.

I'll fold this patch into the original patch introducing the driver.

Thanks,
Guenter

> ---
> This patch adds the missing Axiado PWM fan documentation file and updates
> the MAINTAINERS entry to include the documentation and driver source
> files.
> ---
>  Documentation/hwmon/axiado-pwm-fan.rst | 38 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                            |  2 ++
>  2 files changed, 40 insertions(+)
> 
> 
> ---
> base-commit: bf92ea2a46120fd0809f24d39ad3482d0f20876b
> change-id: 20260923-axiado-pwm-fan-doc-fix-new-d0e42bbb0cbc
> 
> Best regards,
> --  
> Petar Stepanovic <pstepanovic@axiado.com>
> 
> diff --git a/Documentation/hwmon/axiado-pwm-fan.rst b/Documentation/hwmon/axiado-pwm-fan.rst
> new file mode 100644
> index 000000000000..d110e170b0df
> --- /dev/null
> +++ b/Documentation/hwmon/axiado-pwm-fan.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver axiado-pwm-fan
> +============================
> +
> +Supported chips:
> +
> +  * Axiado AX3000
> +  * Axiado AX3005
> +
> +    Datasheet: Not publicly available
> +
> +Author:
> +
> +  * Petar Stepanovic <pstepanovic@axiado.com>
> +
> +Description
> +-----------
> +
> +The Axiado AX3000 and AX3005 PWM fan controllers measure the rotational
> +speed of one fan using a hardware tachometer block. Fan speed is controlled
> +through a PWM signal supplied by an external PWM controller.
> +
> +The number of tachometer pulses generated per fan revolution is configured
> +through the ``pulses-per-revolution`` devicetree property. If the property
> +is not specified, the driver uses two pulses per revolution.
> +
> +Sysfs attributes
> +----------------
> +
> +The driver provides the following standard hwmon attributes:
> +
> +=============== ====== =====================================================
> +fan1_input      RO     Fan speed in revolutions per minute (RPM).
> +
> +pwm1            RW     Relative PWM control value from 0 to 255. A value of
> +                       255 selects the maximum PWM duty cycle.
> +=============== ====== =====================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb3cc6c81bcf..5ad12c57ca5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4504,6 +4504,8 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
> +F:	Documentation/hwmon/axiado-pwm-fan.rst
> +F:	drivers/hwmon/axiado-pwm-fan.c
>  
>  AXIADO SPI DB DRIVER
>  M:	Vladimir Moravcevic <vmoravcevic@axiado.com>

