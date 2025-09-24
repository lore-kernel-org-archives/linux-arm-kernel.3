Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798CDCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=; b=XQDOBP22y5bkA3AD8ngwA75+tH
	l89jCenmWmOgcL42nTEP52ZJBZOyIUr3sf7Rr1Rc0MVSmwtRCmSCdt/2dFOq69ALCysV0EyXelvK0
	9SSbNJmOAkVKKY7MVJRd5pPv+Z+D9AetyiBza9q1zx/CUKstihdWd2HDqF1gcHStTNzMJfFS2GGzP
	30JwjCx2uLsixdqh4g/+TjdJFkptMvAZVwuCgsJT3pXkOZXIBTTK1A1PNHaz9t0A2U7xc4/f7eanx
	mUDcu6XxyaUmbZLgJFLrYqw9n1K8Lc+kOSyf4Iw3z65FGIBhbXGcW+CaL3qxhYruaDke3Iuvgfnsq
	2LuGmP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UB5-00000002bOW-1NCB;
	Wed, 24 Sep 2025 18:25:19 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UB2-00000002bO7-3sUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 18:25:18 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77f605f22easo132236b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738316; x=1759343116; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=;
        b=A1mo2/J8YaotVIxdr+twvn88O1qOwYQh7foMMo17oG4zG2efiIaw+CJOlV0hwBOA4s
         NqLkRpMjaxzsJsziuWrlEtp9f+7jQLPFbJmrnXnhAmRjdtDMIvUmKMxoDoFntN4p5ay5
         4zPHE+ncsC1Cd0+h/xQJ2b4oRnVkg3kl/JoYkuYtKTcY19ecT9LVqWvnOigHWa+Yez9F
         LzgXyK5TR+AzZtRsAGhV8CXAXMqkspIZqxyFX3kGm29JnyKJ++PvkzD86crW8sPesCh/
         Qmcs6gzNT722H/PQVGUg9a3dl/aKVsXh0fChdKwaVuDB7Nl50YC5iqiMM3GslznQ1Hg9
         h7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738316; x=1759343116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=;
        b=siCC7s8uU14o9LXEANlZ+SYedt75UZ3j2t7QhfDa6qS4nUPzoBwxrPAub+DMD5la0T
         JQA4qXxZ6pGFmYA6mIvfEqSA9lHho0Qe480oZLWgrKmQfuvCOGwk3Ttv2C6RsvdjD5io
         T/kfiG/pJIbMyfxAZwz6tXx9oje7pJ6FwdJvUEiOKIx3ay0XyafoxyvR4T/bNJXXXQYT
         LhgOHZt+R2t+N7qN7zhLcCrebDci/J/XvR3q7BkP7Frkh5v/62GLkXkmAiP4F/Qn/z2J
         mKj47kr0/ibYOh6bMw6UShRGhc0bNb2ZmIgNV+jS3hf0z4F/9HCkiaP8UazhQBv9RKXV
         +C3w==
X-Forwarded-Encrypted: i=1; AJvYcCVc9JQM3wJpplT9BI3KgW8eBfqKfSQ9zjxFejckSoi7TNJ8BuvYiV6/33OSreXaqHaqv+VvP1LVWjBv7ysHwzE6@lists.infradead.org
X-Gm-Message-State: AOJu0YwttOxW+dDhDyyEDJl/p8QdjdE2I56o24+HogY6w/JCdvNNoIWm
	vEqw6pDdx+cm4pa2BvHFFQLfqc1+7kfKrbTUaRWSczPyqoQNgSzaYEXq
X-Gm-Gg: ASbGncu4v+XjoEVR2W9JCiSrRF6cOIpYa2pEqxN3Y9oX1fSdApTRuzcuzL5cciqQmW6
	cqPBWdLxeplKK1Pzsb5ABKKqNvWkav1L2d/aZCDMDQSCrxt0tV2YYn3797ksNu0M/NQ9anDg9nE
	DeVyy6sYCrockqRVjO9v8NI3+3d/CAFm+yNAbxV3IvNdq9f7oEMG4lrPKLWhIfp48O9PJT51vk1
	IYMvR2eKJ7g60T0L64FrhvQpRRM6oTOzZT9idN9bRT6ZxsLGnhoHvjgBOA4Ng8Edtv6dy8I3m8N
	34wOZDHX2g2eRdlmZVABmSskWV2M4LBp2G9fNGlvl3j5hWJFuW6W4PH4/6jpNE/XhwUbt2yL3fQ
	NnCYA0s2lsGIK0qj6N+wDkRWogY9KF7OGvw==
X-Google-Smtp-Source: AGHT+IEpqtHdu0dI46MtGn1c8K5pz/tU5t+99UVSknOsKwdK2FcxqnWLxMvVRgkYkwlIxwrVnQBnnA==
X-Received: by 2002:a05:6a20:918e:b0:24c:f8f:2b95 with SMTP id adf61e73a8af0-2e7d0ad11ddmr748774637.40.1758738315675;
        Wed, 24 Sep 2025 11:25:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5510fd4872sm16344912a12.32.2025.09.24.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:25:15 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:25:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_112516_967744_10776171 
X-CRM114-Status: GOOD (  23.91  )
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

Hi Bartosz,

On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
> 
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
> 
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
> 
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

How is this different from the existing gpio-backed regulator/supply?
IMO GPIOs are naturally exclusive-use resources (in cases when you need
to control them, not simply read their state), and when there is a need
to share them there are more appropriate abstractions that are built on
top of GPIOs...

Thanks.

-- 
Dmitry

