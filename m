Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F60EFCE4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 21:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=; b=RqUwXMTZWZ4l4OanTbOSSS0C9J
	Wdp12uF7fF81sFCjbkQb8xrueXjkquX3s3+pOpznASHy2B41CvJueFwFM6uTAYb3x+w5dGmOZfbi5
	G2qlRz91FUL+HSpFa8CGVJdl6+oMJx3ycdGpYQMbr02A5mRXLGPLSXYK/AZX1yFPf7O6E8Cdk8BrQ
	F4Y3ozeHXCDXBgG1T8nplCp9qBnzau2P4Y/gqWJyfr1m94sY84/6zu1zJkToEUcg4dEekQJ/k1kDE
	aW6mDtmTYJS1CN0gBsFx1X5mdIyzeKWs2dOeNeM391uJW6XiFRdTLe44SFXFrnLuZvkIQg4UM2tko
	Hi0R/1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuEm-00000000YGS-33GA;
	Wed, 04 Mar 2026 21:58:36 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuEk-00000000YFN-1oAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 21:58:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82418b0178cso4177190b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661513; x=1773266313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=OXgPhLEV5MmqjCJLZ7s2p7wuQWn8dJqRHO9wYvWbXwlZEQnfHYs+MwGVCvuKSfo0tj
         /PVaOj7phOk7Hyaer6/2+uPYP/opqR0w0Db8Y7pOUr5ZlLWiBFHJFbIJCG2w0pvsoEps
         oPEWRb/lDISYpNUyOg12NvWvFerTYldm5paa/a69RsCs2BQgEBKbn91CiX9vCqjhW5tR
         OYxv2eMNsT2Oi1ofgn5sC8m274j7nCZb5HQFSslL7kB05NrgoODLdm4sMIijdAY0L/zd
         oy11gcq2CaCyAjB8Vj5YvXjPmkqUlyV0dpzKr+tltizQ2s2/U45Vn2YkWP7VJOOwxSOM
         58rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661513; x=1773266313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=XBJO2zzrPsTF3VG4nW/gPUt90oPHOHkEb+db0gsTaAT4AKSi4W59mb7I7VufY7Qk21
         72DYm6Qu6XK94WTBWcNHyrDJB7lm4iPRSUlANGTgknDbWqDcbVU4AWQUXj+5HPXZxgfP
         fHyT3ltajIhOfTD7qfMsLt90C8NAjJuk3PZe0Bw5U4XJ8aOMG8naczoVXJ8ZKZWoDyx+
         2DohRyxuXCoeJX+R0j1fcFczVbYWf66gM9o1+5Lh3UVrSG6XPsYk56zvNEVWnUs/IS49
         VdtYfg83guzTXT3sfT5NOEdsN3AwNqdLAB0Opjp4gf+b9BsvHWPgW/imrTDE9iv1pv+Q
         rJrw==
X-Forwarded-Encrypted: i=1; AJvYcCWCMzE4+8ijTgYRL0HIf6GS5seRTM8R9aSPsXvtNqAKYPII1W9TslujvC3f7IyR0kZIjUAHaJ79BYKPY1Xh4rHj@lists.infradead.org
X-Gm-Message-State: AOJu0YxbB0jQIPvoDdOquZh1waxU70RUOxMWreIZRrscW/hCFnqT3shT
	dCtBaK0r0wLNBPdWysaa11p9LHxxbbTSX4NKbds71rNQGkl/bE5y3Xzl
X-Gm-Gg: ATEYQzxk78Rh1Bbde3LuXasllQHoazgpT8++mSYKgEt9EFBRjCYMqbxIls8nATjaRiV
	zo3HGstIornpf/WMrzrWRhSX7iJZ7f/yOyEVJXfpRLaE5kp0Qpy7W8VTJjmxk102GIHvOf4pKMj
	Duwtaly6xCic0kzDo247Fl2YW4UqfW7l7OSvrm9o7pfEfT4Tnr1XGsRRdyTAiD5TVLsVIRqXj8K
	gRFaJFiUG8mmDNK3ZXgbHCp+o9PccEhXLuJ69OoGpGtgRJDHYqBZc9Vzd1HTMT20S5F5LNaYi5z
	bdpUHJWRM2aOKDyO4v3/LDIOFmpd1lSvi3kihVz1gVMJpc9L2Tey/y/Icl+Ja6GsCUH6lDJnfLv
	NejOIdTZi78s84RU3grgwC24sRcEyRltdPMxzGQWKuNm2/uxg2+q5lvVyeo+ydKnqkMZ9hNZVma
	aKt7p3TortMCjtaLs1tnlD/ql5L8NIV/wOXo79
X-Received: by 2002:a05:6a00:4288:b0:827:3321:7a23 with SMTP id d2e1a72fcca58-82972b63764mr2746760b3a.24.1772661513098;
        Wed, 04 Mar 2026 13:58:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm110603b3a.43.2026.03.04.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:58:32 -0800 (PST)
Date: Wed, 4 Mar 2026 13:58:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Message-ID: <a1ce9ab4-49cc-46f7-8524-1cbc0e6333fa@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_135834_476848_43CC50D2 
X-CRM114-Status: GOOD (  11.29  )
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

On Wed, Mar 04, 2026 at 10:02:30AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

