Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108EBC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VcY46/lM+qWcYEFMTW7FPs+z3KlTxuhM3tOU/CzhrA=; b=FpUumZ2RV08RCeUiNdtNOOuLaW
	DZVwm8tH9Dn3S8BYq9L9TiVD780MPV69VnpNnlTEhohxj7CMQ5ObK/goPA28QsVus9dhyHjq4LMU8
	a6odUYeu6dbX+E81rblMmGBtKlO00S4IQq3L1Gz+34ik7HcWoH9o47R4acFyEsD2ijGZP+QYjv9aL
	YfnGc7lOF39za/Kq6tIAKMupi1GUr8NnrAvPxLLNMI741vf1LxDynvuzdwzagBW80IFVzdZrUUIp8
	EgCW0JW+mayrXKgAt2+EpbCkcJ3egPMUWAPZGVniTieXSIyMQAivqmasKzRSq8NeQwQhi8/dsQVQo
	npsCLO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6tE-0000000CYGE-3W9h;
	Wed, 15 Jan 2025 17:09:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6rw-0000000CXjZ-2JYP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:07:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21bc1512a63so61914425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736960871; x=1737565671; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0VcY46/lM+qWcYEFMTW7FPs+z3KlTxuhM3tOU/CzhrA=;
        b=qVvJ2/VI8H3bGKew71zMXS7BRc8aGOS9hTcksQaaIGGp8UANK1Gx60XCECet1fpkOr
         cfrUJQHrKEFc++g+Ip0k5RdDDHQxC8AdmobLMlwlcKDbF5AChq8syO375QMA2mW09G9c
         1rBgrF89Kr813XY6hBWRV8nlcuGHnACKv7nBBNP6neoErKW1umVk2QQ+8P/Dd6CKnyZ4
         YNi7RA0S4XIbZxszpFLMpj1JwYi0tfwQPHFyLuR5++9L6bbNFPWCxZzYjvAQkQLDZNDp
         eDUsOcTtejuiuYWByr4a6LNNuSrA80sN4d70ZhTjk3wXQDCPnjpDQqMFspqiSzXbGmec
         nP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960871; x=1737565671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VcY46/lM+qWcYEFMTW7FPs+z3KlTxuhM3tOU/CzhrA=;
        b=QJxKi46g4NyP9TvVUrxriUe95rQXq+GmBkZbCrj7E+VV2ky5dRmE3KyxwZ0/l5QT14
         xfBZAH28aVXEWSos55QPWpyifLMwuRYyzW1TD/9hyVkXsH2Ed+eTSQazSnvBv5JbuGLQ
         U7Ly5B8zzgboj+VpcnqAb/Y5bJiwh+v0P6UtX/ZKokCx7+rEM3QW99ZkIq06a3AtImKS
         O5WEzzuuzc/ASCT53NmX7eg7mb4Nq72FtUUaYRCL0MVpQASYEfQSzk+kFAz9jqgItMwu
         AfV05COlVVGuV0p44GW7Gjge53YPJMozYewTIDt43ksbo3lS5w0FU8I/4J0Qj3XIcIdZ
         FQpA==
X-Forwarded-Encrypted: i=1; AJvYcCV8BsKKJ1y/9ZdCkB7OVK2Rt/WR7kfTHnb/ma7fG5x0luWpTeMW0vQRIaMT4Wcr1EgNRWn/9ekP9tOf9hEYa9rl@lists.infradead.org
X-Gm-Message-State: AOJu0YxzVqXdKbdZTc9R+A5B0q2515PD3eMJTDM96kGHccPWq8YIYYqk
	KeoA10RZjGv26LW7m+Zbl4CWhDB6+L8J/a11ja6B51VA/Gl3fXlYG3TiT7RSrn96Rwgfn9t1xHj
	s
X-Gm-Gg: ASbGncstXW/j85b6HepGNMdMZat5w8438t/Ztg8ltdc2YnKVyjAENEtqugNRqUbk8LQ
	O6VATspmAwj7C/UOUDlV733ZVTJAv2VES8DQYViURK/WKFznoPH8q95liVyxuaYknzV6KJt/BRc
	cgQvih+KL4Qx6RyH6vfmiGQZTWHhmtFYCBDn0Ge20qHVvFsHlfFl/WK36jObFRJpL2tZv+2sS5I
	h61c3HOaKhTlCZ9eCbThqlQGC3SPacBki49Y/ToGDx9SB2f81D8VfpLlPk=
X-Google-Smtp-Source: AGHT+IFBYy/MIoFqLhH1iu5kbk/VFg8m2zjUzFPIqHf2bvIqpubLtL+eann7wEvmNhmkk/lcjY6k3w==
X-Received: by 2002:a17:90b:4a50:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f548f2a154mr51216371a91.12.1736960871023;
        Wed, 15 Jan 2025 09:07:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5bd:9b69:c7c6:475a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2c2e71sm1616086a91.35.2025.01.15.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:07:50 -0800 (PST)
Date: Wed, 15 Jan 2025 10:07:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] remoteproc: Simplify few things: omap, keystone, st
Message-ID: <Z4frY5W0Nfx/iTfR@p14s>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_090752_592654_02234117 
X-CRM114-Status: GOOD (  12.83  )
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

On Sat, Jan 11, 2025 at 07:42:48PM +0100, Krzysztof Kozlowski wrote:
> Few code simplifications without functional impact.  Not tested on
> hardware.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: keystone: Simplify returning syscon PTR_ERR
>       remoteproc: omap: Simplify returning syscon PTR_ERR
>       remoteproc: st: Simplify with dev_err_probe
>       remoteproc: keystone: Use syscon_regmap_lookup_by_phandle_args
>       remoteproc: st: Use syscon_regmap_lookup_by_phandle_args
> 
>  drivers/remoteproc/keystone_remoteproc.c | 17 +++-------
>  drivers/remoteproc/omap_remoteproc.c     |  7 ++---
>  drivers/remoteproc/st_remoteproc.c       | 54 +++++++++++++-------------------
>  3 files changed, 28 insertions(+), 50 deletions(-)

I have applied this set.

Thanks,
Mathieu

> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250111-b4-syscon-phandle-args-remoteproc-06dfa873d1d1
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

