Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 01:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q3au5bmUxQOxRzXtBZeaF/N/DbzaLEIexfI0aIxChA=; b=Dr8ZnTXXYe6kjvO2sQFYmMRVZd
	kvUGApH3PFk30TqUmDnpD3SgSfU3tZxypgZW2Rqa9jOhzm/88oqFmXEvZwiy6nPEOlBC7Vb4b9yeX
	232NL6/ZmcgLKE5FRMEHIti0/EfRY7hEWlrKB+nA+f9cpbbvXVIg/wRbTYRJWjlrQs84CtDQKrev5
	cg1yZqClqHRMG4g8IyUMm9UP57+e3ToyDdc0iL3GY8YqB+bz95yt+Lyp49t6H+r9bHjye+wq4H2NW
	o1dSVMd0EAu9t0mJ9LSaeNZZOKFIX1Bqm0nZiBrKiANPNd+NvgxTGgc8OOm1gY64RkvK91JByiHjs
	4JKBiqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLXZ3-0000000Gds9-2mPb;
	Thu, 12 Dec 2024 01:00:25 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWDH-0000000GTxn-3Xor
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:33:52 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea9739647bso46578a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733960030; x=1734564830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q3au5bmUxQOxRzXtBZeaF/N/DbzaLEIexfI0aIxChA=;
        b=We4Pv33R/w29gndWGe55aArzS/ofvTYS1MkO6BPUls20OqqmGG11WoSIqPGyrHN5Ag
         RA7u1eUqmpfbSM3IdiaCHzgeV4yhKcQi0x6fCtd2B/DAgkOMMw0mznXV7vrwhzZAjMsf
         HxwgzZSpm4HgBtzh/emnUjcwu4tlM8kfxg2dIsX86kRNh2wwrYTlFbiYA+4s7G+LGY5K
         Uqc5w1HyM0L7V0xcSxqpsNkJFqq8zJpEnN/K5i35xiKsuyZK1WvEic3xvAD0NJOiuskp
         kpreDSuRhHOMZmqGuxcAovJJ1KqdkKBmwhivg5MEzIbqKyuV66VvAaBrtenZ9wBiDCuo
         ApoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960030; x=1734564830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q3au5bmUxQOxRzXtBZeaF/N/DbzaLEIexfI0aIxChA=;
        b=ZurTmydXHOLfQItAGr+k/1skMX9B0FiVU+HqwHBiuASFFYIwcjmk89/iRgSweL+iEC
         VqQqutumCoiS7fJW7R+jmyUQgBNu+bobB7KnchREpcc5U9zyNxfg2H/xGrwjh/o5dWOl
         YRz9ju+JhrVzpYmwsBGhSQlpC61XrMMd5CEbCrrtjJOQ35Zl8nABx7b85xxBYE8/kNeN
         4Xp5MJvVxBlUsVv1zbrvokiL96gG/pc3VshOG3xJQXU1qTylofXNWNose6agnhMT0STL
         4Szxlkd1/T43qT242uf3EtKItxTJUXWzVHIuppf4OhUJ1gYpsSS4+ZIayVgf6Yi56Bjg
         kQPg==
X-Forwarded-Encrypted: i=1; AJvYcCXLBGg9JmAojkXoFo/rRPUHFmgGVA8wDoeW5JcoFo84K1UpLswjUlUtctAXI3eznp7sEYJwPxaQnF883GRQXYjv@lists.infradead.org
X-Gm-Message-State: AOJu0YwZIhFEzkTlerH/pbj/8/mjhoR7kPe082KTFtEleYluV6hPKv8i
	ddz0cVaRVQ+9HI/3BrYZZpp2tYh1ym2pc00a82YA3Qby6vf0uM1bj5GBvG0NYw==
X-Gm-Gg: ASbGnctzZFPaR4IRRoz3oza7wvJa3xTRTlYRunpZKrU7JhD40QG1Bxrdt+wjiv0RUAP
	Cs+dMSVc7ogFj7Zg5T614mHv+uJKXtXNkDmrL87fIxHcIl2OfR56bs7Bgd2DJBWIQ0pLVFT/L5V
	z9vbr3J6ejiQDeIzIiglbys33QxvqpNs8jYQVPPrkMLxqhywUECmacuAFIMs+8iMJWdRZkRLlaA
	FH82NKqCY5A4B1eB6DmkoBfky9gEIJNvRLvOzPRFJ/WVBwKWnKRjMkui4X/lCBvrpX82spzisNH
	oG1rEJ8zJermbgyxw090Faja
X-Google-Smtp-Source: AGHT+IG8aD1Qqh3kEUiTPGH96yIdNZ1vUy+wc0P4hxRimnY8FEv8+p/pdrOK7wiPfxZc2chXSialWA==
X-Received: by 2002:a17:90b:3c45:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-2f139257803mr2750010a91.5.1733960029821;
        Wed, 11 Dec 2024 15:33:49 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef7ad1293fsm9023217a91.34.2024.12.11.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:33:49 -0800 (PST)
Date: Wed, 11 Dec 2024 15:33:46 -0800
From: William McVicker <willmcvicker@google.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@android.com
Subject: Re: [PATCH 3/3] mfd: syscon: Allow syscon nodes without a "syscon"
 compatible
Message-ID: <Z1ohWoq1jEFgR17P@google.com>
References: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
 <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_153351_887104_D30B5873 
X-CRM114-Status: GOOD (  33.53  )
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

Hi Rob,

Thanks for working on this!

On 12/11/2024, Rob Herring (Arm) wrote:
> of_syscon_register_regmap() was added for nodes which need a custom
> regmap setup. It's not really correct for those nodes to claim they are
> compatible with "syscon" as the default handling likely doesn't work in
> those cases. If device_node_get_regmap() happens to be called first,
> then of_syscon_register() will be called and an incorrect regmap will be
> created (barring some other error). That may lead to unknown results in
> the worst case. In the best case, of_syscon_register_regmap() will fail
> with -EEXIST. This problem remains unless these cases drop "syscon" (an
> ABI issue) or we exclude them using their specific compatible. ATM,
> there is only one user: "google,gs101-pmu"
> 
> There are also cases of adding "syscon" compatible to existing nodes
> after the fact in order to register the syscon. That presents a
> potential DT ABI problem. Instead, if there's a kernel change needing a
> syscon for a node, then it should be possible to allow the kernel to
> register a syscon without a DT change. That's only possible by using
> of_syscon_register_regmap() currently, but in the future we may want to
> support a match list for cases which don't need a custom regmap.
> 
> With this change, the lookup functions will succeed for any node
> registered by of_syscon_register_regmap() regardless of whether the node
> compatible contains "syscon".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/mfd/syscon.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index bfb1f69fcff1..e6df2825c14d 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -171,8 +171,10 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
>  			break;
>  		}
>  
> -	if (!syscon)
> +	if (!syscon && of_device_is_compatible(np, "syscon"))
>  		syscon = of_syscon_register(np, check_res);
> +	else
> +		syscon = ERR_PTR(-EINVAL);

This else case actually breaks Pixel 6 (Tensor) since you are now returning
-EINVAL when the syscon is created by the exynos-pmu driver and present in the
list. Instead you should only return -EINVAL if the syscon doesn't exist and
the device node is not a compatible syscon device. If you still want to check
for `of_device_is_compatible(np, "syscon")` even when the syscon is found in
the list, that should be okay , but it's probably best to check that before
inserting the regmap in the list to begin with.

This worked for me on my Pixel 6 device:

	if (!syscon) {
		if (of_device_is_compatible(np, "syscon"))
			syscon = of_syscon_register(np, check_res);
		else
			syscon = ERR_PTR(-EINVAL);
	}

Thanks,
Will

