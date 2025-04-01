Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1E7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=; b=su/uVnCDDaas+9kMTSe+lJJul1
	JaBMNCxWmhmI621UIOuIUDrN0g+Bj52UovKKyWVixnbfQSOn0MxAzbe8cbgufDMhVIZUmuP6zC+nT
	zl3y+T8x7RMFOvZAWkGeAEmH4Qhr/3ROCcyzB/hjH39ygjmfKOQXr98/jjXOED2s5/MAv9cvc/DW+
	3nAsaxSwDO5RoJGFlpLVDBEzp1gAL/TbdIgS7rs5abAOnAVrgsa3F0c5ztoH708ut7xSDskVTvHrJ
	v7kaVtihS6WgMmVS6RRvYO8TNQpnJhktPpjVjaE1/QkHsih6MzIOTm2Ky+y4ExbrHXBjpLmcTUVne
	HHWdqsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzedf-00000003uIx-3Hnx;
	Tue, 01 Apr 2025 16:38:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzebB-00000003tpB-2TWm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:36:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so7464802a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525385; x=1744130185; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=;
        b=GmfDXbYKNWtj0DJNpENyevqMvExdYc3cHsEbOo2FodPFvjrcXGMPq1Y3S8DXXHL4Df
         EfBvoNxaiMg7F4tImQSG/Nw23xBCelr+rw9bYl3bg2FeiH4mEoNGvlu9cu+bFuvasQ96
         Y66/OdeQ9dCRwx0OvGqg+ucPmD6saM2UPbZZ+9cz8po4JpxVkSZijqMRAH/t0z2XbayP
         rx0cEjhAc/NWe152AQup2vHRZdn6nxyynOXOi9qswP2TzeoMdB/AFveFRQ1yXeg8ZgMj
         GlWkwNhU+gTsTV26GXWK1MskzeLuulFvu4T3+rerFO3iKVqUpluRXTWDQVox8Fqedb3M
         pICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525385; x=1744130185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PD/PgO3ncsJ3cZCJrRv/Qt4Ciw0gv+K6O/dnt5CkV8=;
        b=XHAzwfmwgtFY5fqbSEic6/3a/9EToenUJ3/6br0R3uT8kDE13+4z+zwhtl3UEXf6/k
         O5JBEN02/wK/Btun2+WUTrWoKYi2HF9LGKuwvREuuO7rAH+i5b1r2xmN5KG5Kb+N436Q
         QBCV0ZwUN2bxf0NvqMLl16QFcf29ClLKUaRH2wKFACPth/dsRJEuZsDG3dX1iL+j8MI7
         kiVGvV2hPuveuW2u43YvoVhWFIzJ3RD8dUp/4iqcJAxgQdQ9zDQ+MlYR8z7J51JkTa0W
         E3ys60e/D12qL2bponpAfiWp+7pdCbp9Y9OBZPh9KTHekpzf1oqx65WJkiwjIZKeYaO/
         ze7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQG/iBmUuFPhg7fiaciyOw7VsOu+do5Rkbjawv8uJYH1SY8OpK9WdycWpbNw+JlilGttVSOzzoMILy5jHv9qVG@lists.infradead.org
X-Gm-Message-State: AOJu0YzmXghCgqhVC1WF8wlU1h6RlRvY6yw07uzHQwCFrY8Ohtosfi6J
	lp6iOxbYFPViXbgtBQ3ZdUvIwovOKJIX1VMicA9cmtYy5LF4bSMEumGgmUkndw==
X-Gm-Gg: ASbGncvumDdLYjn3UURNjoMbuv4WgWZI453Usir4x/rULirhDTiCQsz2CDi7haEcpgZ
	kGC8Hd5wkmmxA6ir41JY2PcROdYZapHJwgV7bXjJGI0dI7qpd1QuN19wibxK9oDJShIJ1UA4eax
	khc5ZSLmUBlYSYI2hinuEvZ0gpnE2TZgLjtE1LG/dshfMGBxKO8Uh4ilQpaLd47WcGuZZu0CxG+
	aqJqbYHQt2GjQ/7jsd9NBN4I+gdEvr4lO5WFnSYejpHS02mWFH+yKqpLcaipGzWDWFxKe8T51/Y
	eKMUY+HNKCB2/0jIWcO3ePSZVVbzEAPzySOWFxG24gWLx4SsJZZhgb1pm9CUbAmWgV32w37LFRi
	/ZxBaiblM3/jpHJc=
X-Google-Smtp-Source: AGHT+IEzU+hLZLEqxJTjXsu2ERUIGdFfgSk9TWMvKqglUiejKKsOC4BUUb3g94o4jueNGuOJWVn+bg==
X-Received: by 2002:a17:90a:f950:b0:2fe:b8ba:62e1 with SMTP id 98e67ed59e1d1-30532147209mr20787773a91.28.1743525384529;
        Tue, 01 Apr 2025 09:36:24 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516fed6f4sm9502139a91.32.2025.04.01.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:36:23 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:36:19 -0700
From: William McVicker <willmcvicker@google.com>
To: John Stultz <jstultz@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Hosung Kim <hosung0.kim@samsung.com>
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
Message-ID: <Z-wWA-46L08V89qK@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-4-willmcvicker@google.com>
 <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_093625_626404_D8305312 
X-CRM114-Status: GOOD (  17.00  )
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

On 03/31/2025, John Stultz wrote:
> On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > From: Hosung Kim <hosung0.kim@samsung.com>
> >
> > The MCT local timers can be used as a per-cpu event timer. To prevent
> 
> Can be used, or are used?  If it's an option, is this change important
> in both cases?
> 
> > the timer interrupts from migrating to other CPUs, set the flag
> > IRQF_PERCPU.
> 
> Might be work expanding this a bit to clarify why the interrupts
> migrating to other cpus is undesired.

Let me dig into this further to figure out if the IP has a limitation where the
interrupts need to be handled by the CPU the timer was triggered on or if this
is just an optimization.

Any chance you know this @Youngmin?

Thanks,
Will

> 
> > Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> 
> thanks!
> -john

