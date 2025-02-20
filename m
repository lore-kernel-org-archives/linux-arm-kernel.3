Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D8AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh4eTXTu+c11RkR0T9DFkG9ZleZyfYRGduufAwusFKE=; b=HTQlAVxi7Ud9EPlUPN3etfWYpI
	Pmu/c9XI8yM5B1+YD/5JJnQHuPaFbjirnjFpC1uPaqsR6+ytPjO4WTaCz9dCIvWLz8mpq948oI2Zz
	d68Q1hmDfb0b6NiO0dZTgldmfZtZ4n6AvWo6fL62U8qHHwrFmeMQf4oyg3FJni8er/0ffAcJYfY3J
	xvvpc4mqH9e10e2vJys5JoWvA5VuZZRHlZ4CdipzIksR4dPD+lon/U4cNHTafxr4kxV5oyIzEhzOv
	uZJo9f80uXK9ayYSwhS1KRINNzmv8ukeeMc341D8ZCMRouQlfLIEmOvCF2l6wLRBCm40jBOA6YBoK
	6UHtyAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9jl-00000001xUm-3ibm;
	Thu, 20 Feb 2025 16:49:21 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9gn-00000001wWz-3yvg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:46:19 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5fce5eee2beso718133eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1740069976; x=1740674776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rh4eTXTu+c11RkR0T9DFkG9ZleZyfYRGduufAwusFKE=;
        b=PrY1qjKRK0a2rTaRrnzes69+PTENnLYevU/QfJcYxAD8bSyvwbQ1ZGWyUeJ+9EbCsu
         /I/B3H2lmN63aGaqUqegjrXLPpRMdBW2OvtpazZQCHSVje6U6dKmnT/NbVmRVh8mWep4
         MCa//fv4VABdGp2hGRGPmEx8AICmlpMlK3EGFnmyBb9kFSa4XuV8uA5XDEedaogKVTC+
         Zqawg/C04EePUhIpKlqSRS5F2uDXg6yyC3K4UGpI/NbV5meR01t5iuACCBkfbAaXIpnu
         Y52mI3F3pf4Ku78Y2jlcDPHpodqbg/l3yiBFew189yMyOAgEG5viz0Gyo/h1C+TzvjhU
         eoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069976; x=1740674776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh4eTXTu+c11RkR0T9DFkG9ZleZyfYRGduufAwusFKE=;
        b=bNz3fgn7/dANKn3ACRxuhGjd6BsaNtvO1rBaUDu/nXLODWu2blRK3MPfni0PgOF/ow
         Z2ylnwrANbKudELYhKlFVEY/RQaAlzLNjZOnH6TvtofDPSanMSorafrhLkZJjCEuuBkE
         2YdUisESKD+bBsX+fcWHl41jdRHU1bSeHaFnft87X/ZjN9cFQSfpZmZx3/bWpdHWSaPq
         RiwG4jPXLB+ESoQyfFAv/W+pjFt+Kvw93Q1hCjFYD6oS1SZQfH05YKmq22mNCvhpNp4S
         P3pAawiR/sxerE7agV7Doe/O3C4OM/E4vEquiVNl1U5OD2O0s7YKe82Yvmv0kXEv90H2
         K3+g==
X-Forwarded-Encrypted: i=1; AJvYcCXZqUi9sCRreiHJ9YF3VmE4uSFNTc4pRyVQz7wl+L29DWslEV+gw1lOG5bL8+g649DXzaR/AEG5HgM+8Xf/4oKE@lists.infradead.org
X-Gm-Message-State: AOJu0YzKIYuYoSSOrbLIlQI+62vZ/gftylayt8hWRyKEG9GSw85LJhxO
	sRtr5b8Eu7uiJHMAdkhThafWjBnZ0PpNR/mkLALsEGUipq6HSvrtoIb1FlP6fcDHaUVe9lIImdv
	S
X-Gm-Gg: ASbGncta2ligo/biodMtOAt2RYZGWYzi+vaJrtBhX0oKuzcZo6QFVweJ1z3JSGqEjUX
	yRrE+oONw0aTifPX6kRkKi9IZFoi4u/4vonhcd+R3KW1UT4hcLHLEiW7uroIfAepI2NLUStJwxV
	pUEpUv2P/Ed/YsuBUUws7iwS76Sc2wra34iz++Kpn66QWJV06ZV0s9A4ANc62OKbAlNLoQyI3Xk
	2qwVEJ5NPGEmqHYIhhGRl8uVhbpUbPchdpIBxdMHekMnzbfWmRx5rXRYtYk4O+Gdi0kinc3IYAe
	xl/2yYojsTw=
X-Google-Smtp-Source: AGHT+IG+EYLLqM6THWYE8hAauMhRAcU2Nk6bktOc2WtjLtNwvqYq1DbYMyEayXYWgyo4XXN/dzNAHg==
X-Received: by 2002:a05:6e02:12e8:b0:3d0:26a5:b2c with SMTP id e9e14a558f8ab-3d2c01cbd32mr32793245ab.8.1740069966144;
        Thu, 20 Feb 2025 08:46:06 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ee9f935135sm1841325173.42.2025.02.20.08.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:46:04 -0800 (PST)
Message-ID: <d178e65f-0168-4046-b516-1304db75820d@kernel.dk>
Date: Thu, 20 Feb 2025 09:46:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250218: arm64 LTP pids kernel panic loop_free_idle_workers
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-block <linux-block@vger.kernel.org>, Cgroups
 <cgroups@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Roman Gushchin <roman.gushchin@linux.dev>, Arnd Bergmann <arnd@arndb.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYuVngeOP_t063LbiJ+8yf-f+5tRt-A3-Hj=_X9XmZ108w@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CA+G9fYuVngeOP_t063LbiJ+8yf-f+5tRt-A3-Hj=_X9XmZ108w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_084618_247324_2C404E92 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On 2/20/25 9:13 AM, Naresh Kamboju wrote:
> Regression on qemu-arm64 the kernel panic noticed while running the
> LTP controllers pids.sh test cases on Linux next 20250218 and started
> from the next-20250214
> 
> Test regression: arm64 LTP pids kernel panic loop_free_idle_workers
> 
> Started noticing from next-20250214.
> Good: next-20250213
> Bad: next-20250213..next-20250218
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Should already be fixed in the current tree.

-- 
Jens Axboe


