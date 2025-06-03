Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F1C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=; b=deLDd3zdsln5bTfUOqlSTZerTN
	CXdIg5V+AfLOk3odzYnPujK75L2L8L8CBqCPs5Y/CJfdL9HKym+6MU5Q82scVWQgZ1lPfIx3YHe2O
	WG4kIO21WGoCD6Omh4q3IwSqfr8AlSPz/HETnFA0SiVcQlQQPjzBSUnZ9O2GoEmOZAabrnSjYn9vv
	AidR6suCRCJ8x4jwLx6ce9Wg8Kca3tVOXePbfhnzq96irRpFtPXE1lfSMGzvTJX+sp13x9nwPqEKB
	YC/4JduPWoJ76rKWtcc6+pYSd+YjhaP5VMTmNJHWu05A+n9QSzWbI9GQGSaON4BFlRaT3sHMngN9f
	Nf1ejcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVum-0000000BXV1-1S0Q;
	Tue, 03 Jun 2025 17:59:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVr5-0000000BX9P-2xKw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:55:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2349f096605so73280035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973319; x=1749578119; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=AzXa7skDJi92VubPKu0GXKMJe4F0SYHEum9IcHbAkQ+K4d+Jd1tQoqdZhcefy8VrKa
         5UuKNJ4Ei1eo2edTZKfSUlldrCljm9Qy3R4zcnpSqDE3rjXMpbgurZSm63gmFtouf38V
         wzXHngRLbpmAvwaiI+SqgZIf+05XSQJQUrd6NtJYMkIzel+/QTfppQVSgKocdvmSC6/r
         zJ++wndOIaitST+k/NZV3cAIA5175R5y31Xdpiza8emRyugo7Ec2aQ3qMzv1SRAaI0N6
         LtLUWYgwgwFruVO25yFlMktsq3KCCXD8lforYz+3JjhIcLERkTtUD4o1e/PmH3a41xnl
         0Bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973319; x=1749578119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWUl9C985EL5CPivjVUp+r9x59BJAZUaKZ7PmzbsT0=;
        b=G3Ymd4wstIW/IXq4B5349b16rCY5KdhR4LICxh/I/ZASFJVfp126uj/Ubt2L2O13nx
         ft/ZsywqzBX6+FuAVjzXNge1+86m04cVuxT5avXP+1OqyO9dGrixtX248jLEMtME9MKg
         I5QrVhwYiIHVX3KT2uMjKQoU5GI2umahQKfQBNLFYWiIGvShnquPfuvo8ctZ4iqpe6MV
         qt7jJtafDGI2S/w5HC/TkxDw2YEX69uj+/7PwKH64/s7JCXlyVDHPmut2+1mO2t1Sk3Z
         5zRS/SVbjjlT/PhsXP7n6ZoRGDiY3aN5AJTZ9ExJc5jxbwAf/rzJxDKz9E+fRPKTT86M
         3ZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcdOTqyjOdw030olwpKfFos1a3goUXUqXZQb83Rh6ooIBfnFQqetlVfqilFDMu9czkdKklbyvQd3MRkTshLR96@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8YiTsasmiIme1AkfU9A6AReOR+DjCgvVPeYZBt0loK7TNZHe8
	E6jE7/1uLz0sn09xys+18nuXhoqHLDaElT3E3b4A86L+ZZEPYiWQ8jlXXbJyUgpXrg==
X-Gm-Gg: ASbGnctddaJ/8VawzN52pIf4tVfGF/xI/RaCo5KPQ+ayZ4xE6N0/O7RzkY+VlsKLKzo
	f2mPBNlorXkyeRCU68dENIEMoOn103rnAucP2WLcOXJOOjbNVZtPKILBjUhssim44xeFA08Wxf1
	mK1poQSQMXxZbIowsaam8MPLazrm0Zd7/ell0iwhdVJDUfoRs62rExp3fSg31j7R15Rva6yNu0D
	9zRAm2+BycPFw+S2he+jqSyM6zoJv/+PW25oiO2qkhuyJozlM6vD7to96VG8wQTxz95lDEoIeBn
	cpwheNkoSrLSkqvE5MtCpjr9FJdWvjsSzhscKJYeSsS4ZX/JzIHJW66zuojV9gpeNYtXMsxvMu9
	c+Ma9pNhcZLEbmOZfE9C1dxjuht8=
X-Google-Smtp-Source: AGHT+IEL8qWQXsZH17HCYlbbIw9UGPDhlEkxpYMP6+pX9reecYXFMezlkTqgJADRlqe4EFkksHLW1w==
X-Received: by 2002:a17:903:b50:b0:235:779:ede3 with SMTP id d9443c01a7336-2355f9ef557mr237428345ad.41.1748973318650;
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14bcfsm90207425ad.236.2025.06.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:55:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:55:14 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
Message-ID: <aD83ArjAx463xOx2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-4-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_105519_750081_7B1B8FE8 
X-CRM114-Status: GOOD (  20.91  )
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

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-sun5i.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
> index 6b48a9006444..f827d3f98f60 100644
> --- a/drivers/clocksource/timer-sun5i.c
> +++ b/drivers/clocksource/timer-sun5i.c
> @@ -185,6 +185,7 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
>  	cs->clksrc.read = sun5i_clksrc_read;
>  	cs->clksrc.mask = CLOCKSOURCE_MASK(32);
>  	cs->clksrc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	cs->clksrc.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&cs->clksrc, rate);
>  	if (ret) {
> @@ -214,6 +215,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
>  	ce->clkevt.rating = 340;
>  	ce->clkevt.irq = irq;
>  	ce->clkevt.cpumask = cpu_possible_mask;
> +	ce->clkevt.owner = THIS_MODULE;
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(base + TIMER_IRQ_EN_REG);
> -- 
> 2.43.0
> 

