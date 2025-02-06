Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D89C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCdO692bHBghPfQRGV/NUxGlZvxVvv1uNkFJcvuit2M=; b=g+TWgf9kvo/zAgzLOnGjQ9BYCm
	46GFuZZTZGdjqgfCZDt55cO1l0lCG6ZOIM7UqUsfHsct/rDNn3ERrQSgpsqye1PxpBLMQFiy6P14q
	JkXjZguN++NBwheA379Ur6bRXNxF+hkDMrI6NJWJZA1WMqh041OQ55VrfnN+SfpwDTb/G7J837zwU
	Rw1I+o5dMwt6SXRiRdn74tonpcLtQXlQ+ipAY1/+1ZSJLCs3Nw73WKBP8aAU2xno4CtX1g2UcHbe6
	No0bTMBeDqAsrGnGPPvM4nLUEELk0op5r8QcgSh7OCmAvHZj0tDYVwzH3DYwWlhl1ZTkYW31936G7
	62bANomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7OA-00000007L3O-0SGH;
	Thu, 06 Feb 2025 19:18:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7Mm-00000007KvN-1iNC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:16:49 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fa0892f9bdso1678440a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 11:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738869407; x=1739474207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCdO692bHBghPfQRGV/NUxGlZvxVvv1uNkFJcvuit2M=;
        b=Cjin5iAXLpoGzhkoRnluk3kA13OidYqv0XAeb93qygvjEKjqYDZZgJNM3k71MpoG01
         4W7dh0r8gcvl9SSrgXuqVBMsy2ogHnqLDZgP8Mdo9vlozVqu0imEQijAZPJJQ13H4Ri4
         pUS1PWaPfpMMZuxx69YAHsSPfHJnVscJ8PENPnfwRQL2uIRp/rXevkhqGGyJ+8Elrb2h
         isFpopBcnwtpzQ3mTU2jPOddDttmHmqOW0jBQGrYB3y7pk+CzcMeIpKQHmYTcdEgS0OD
         4oz56pwc23bc3u8Z1KHSa1homrabAHqrdn2dEXfwnNQozA/HdC+gtH5GTim+tzSoxeQt
         TDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738869407; x=1739474207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCdO692bHBghPfQRGV/NUxGlZvxVvv1uNkFJcvuit2M=;
        b=ia3p8M4BJfD25Geq8Hy3z0RaUZSKAD3ZeL5CeMwcZL2a7gqd4Gp9cA5E4xLqbT/7nV
         dwZoZaBmSzE0/90AwdPpcQnhuSnx5ayzlBrXa48OTCHvyV824AhT+V4LvOuUY/md0bbs
         U2hierhO+/AT8LSxHdlxIbTUWiDol5Soi04qoftlZystWfzgmJH5u2+42drSqN9BRLKE
         1h+x+HV75qCT1GGCOuklBiL8a2dEfc02jdwZCsxuSjqWUJ5VAPqUG6kf6rxg7v3Or0TB
         RpaLowgQvTKub7ZSsSgQQKuc5xM1C5br2n2NAw0aEunHJ5SDXkv1Swr+XAJBrTdoR30v
         59Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUgnGBonJ9LJzJW5SBe5wJObOMyeQMtLbYYv5RoF4MmdKH7Ovfx0+huZ8j2+cUtoXQvkqhnPcw4T26IjPnIbjyK@lists.infradead.org
X-Gm-Message-State: AOJu0YyMypn7RMsNlYA/R5LwNNT4luGCcsv42PKbpY4shNwLYDj+Eiz5
	+Z1FQZl5JltHhfs8D9LtnKR8ACCztFBEn64d/SWUv+CTknEmF2TWjUVM5rUg
X-Gm-Gg: ASbGnctmI32pLbO5yUdvewoD7iVqdmdWQDjj2rvjkI6YmeMBwUvU44BeqUdbzhn0R9a
	UUC3WFL9bfPQCG/5/C/EeYB8qxf+fI624rZlsXVTmVDvkQAb1abQ+aynOVjkls3D9SaWV8BuxBW
	d2416tTOhbEFTJ3T5V8PwYHLctmefztZVEpc0QP88Imh3cR7nQa8tJS8gQ4+UvFEiQSczHXbvDM
	WyVvgpEqzyANuSYWlvP5jc5NKAjG4/NLpraOC3z/Dmp1+gpNj2XL7X1gRxrjmJ/jbqgiwokSMLU
	zPq/ZzQc9xT4vWI=
X-Google-Smtp-Source: AGHT+IGyBu8HGooogVECSDxGIUQ5Z40l4h+BQiOH7nR1Zf9Q9rLywn17YBVVdpSAMvv59KLxYaoxWQ==
X-Received: by 2002:a17:90b:38c3:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-2fa24064f31mr383637a91.14.1738869406961;
        Thu, 06 Feb 2025 11:16:46 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a1848asm1794373a91.12.2025.02.06.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:16:46 -0800 (PST)
Date: Thu, 6 Feb 2025 14:16:44 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Message-ID: <Z6UKnNyf9cDVSUPF@thinkpad>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
 <Z6MzExQFcIz9HlkN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6MzExQFcIz9HlkN@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_111648_448177_D0EAEA33 
X-CRM114-Status: GOOD (  14.72  )
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

On Wed, Feb 05, 2025 at 11:44:51AM +0200, Andy Shevchenko wrote:
> +Cc: Yury
> 
> On Wed, Feb 05, 2025 at 11:31:09AM +0200, Andy Shevchenko wrote:
> > Relatively recently bitmap APIs gain a few new calls which may help
> > to convert the GPIO Xilinx driver to use them and become shorter and
> > nicer. This mini-series does exactly that.
> > 
> > Changelog v2:
> > - fixed a regression in patch 2
> > 
> > Andy Shevchenko (2):
> >   gpio: xilinx: Use better bitmap APIs where appropriate
> >   gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
> 
> Yury, just FYI, after this series, if applied, the bitmap_remap() and
> bitmap_bitremap() may be moved to the NUMA only APIs. Or i.o.w. the
> commit cde3d0f81e67 ("bitmap: Make bitmap_remap() and bitmap_bitremap()
> available to users") may be reverted.

Thanks Andy, I'll keep an eye on it.

