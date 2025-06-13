Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050F2C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqIM8HZnplhZGKcbWU5pZbbMLNhFw2iwzIjxpnBgMKw=; b=vgjcDoduPGF/xH0ScyEFbLV1N5
	KWgsWu07OszPoow0HKcEmKi1QZ4ZeEKGPIPV7f6mTmXRbglhX98NyuK6KWyfb4ot7EFJv5F/9cthM
	8HiZ2p9AZIcpXc8hZV5RoL3ij+fjzGYN7+qyRsd2xeqJJ2Ef+S8bf3u9JnV9O0Jvf8X1RhHQuOpXU
	ljrnGIjNn4Jo2zOyq3rfAF+At0c+0guzIjCoUnc7H80WoBPeKY1kd8vd5+Hre7+MKYW+PQIPibMeO
	SOJcO9i/jGs5JlaHwTRJpqkL6YFu/vZrwSGH75VOM1UHqK9MGgkWjJ8xN8lscj3DIWLfaXIW8niBx
	ziU66e7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8wz-0000000HFDc-37Jw;
	Fri, 13 Jun 2025 18:16:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6a0-0000000GvM7-1DdA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:44:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so1914194a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829471; x=1750434271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqIM8HZnplhZGKcbWU5pZbbMLNhFw2iwzIjxpnBgMKw=;
        b=UT7dSamPtw5L+rqDOKOgQl2+0tB21Wzp6anWwkbJjUXyRrFsQZUaaoksSQdpSd4/g2
         +/UXfkiMQJQqJT3uCox4JTDuda/WfSNCeOjy+NNrls9Jk/DyM73i+Jkh1txbFoC0jUni
         uxhdK51HyGSTxnFRCC2uN0JtZPncAsyHYKGmDDV1m+azz5g2Jcpewia2lu1Volk/HsgO
         5INzC+hx87xasDkgMkRegl8f4R70z2WYRo7g/PcuNYV1sjl0IFF1BOr+nggOi3BSSDM5
         nT23tJupv+ypsB430BGiOgTR0l7IzBc3d3pHCNRZ4cTRuIB36wjic5hj9dx3AcZgU3e5
         CNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829471; x=1750434271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqIM8HZnplhZGKcbWU5pZbbMLNhFw2iwzIjxpnBgMKw=;
        b=sTMr28WmMHo0vrJdHqQHmoAL8xEdPb6akDHBgOpuMuJb1A3PMeIf6Mg7/MizlgGRYW
         a71gpVcPNjYayyveEN7qdf0M9MUU2TrWDTjXGUcBsJ8Yg05g8lz9SbtrQRdZBWNGX3X0
         0nbnCakzcrhYzYZZxjb03VWaKc2zcwKudxIYmlYZklzHQZFanTZiBeJf430/sencwwLC
         McKZcqjVV4wGPYgzkKWDRwPImUwwMcPynuwn2cGA+RYnGibQkCIA33RYaxq5+tIYpQ3x
         KGHmE5VN2mmXhOqiLITNAsq+B3S9rAb8im3IG5YLxGx06tQgmbPZXeSWoOgTmMpaFgEZ
         jyNg==
X-Forwarded-Encrypted: i=1; AJvYcCXrUYxE1Rupg7JJAHERKohJt+iKi51ZGfCfjO2FF28xIAM5AQTq2QJNmKIub8ZdhigJ/mPhX3Vqa2nDNOCLwLCr@lists.infradead.org
X-Gm-Message-State: AOJu0YxGasqhb0PA3C7KRGvOfEqagUzIFkAceLVhcfCOdS7sQCx4oJf3
	upn94ViENcK4yW/CFhwbegdD1/kTfZmX8ZiujvWRI0WutfKzC+oVYyOi
X-Gm-Gg: ASbGncvhabJbDJ5YAGk/82Ge0d31g1LqcOhzaXPJhUZNaQ9OiYzSx40/Nx+Ibu4vJXM
	hbYcNd5Fm0cqy5WTRWpuTq6JE/qLH2NOTjZEyBKw1ANDdRyOW6shmxllXdVnUN1jAhxH+dwSg0w
	Gg0TPa7liJ4KqEGz34rdutQIK9TqCU69skkQwwHTQP4iPDNOpJ2wm8bOtRdgknvbHLJ2q9TrWZD
	LwmjW5vcj7syIRSKi5WGrBAf4fImPrMSRYQ2BJr0Wd1sTWi7WLin10kxP5qGgH726/PvSZfuuBL
	NPF0G16sH/7xyxj2Tlopqoiz3fMnmQKFNOpA23MV9EwBXjuBbfL/GH1RZTkvNwT4h4X1igCrMs6
	48iylsynRd+3Z7oqKV631
X-Google-Smtp-Source: AGHT+IETWJC1IioWtKneuXgORMThHBGBuRQvos+ZKLhO3L/RBVH0UX1pCYDwIQm0SyCgDHjVsMUOBA==
X-Received: by 2002:a17:90b:350a:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-313f1d58ba9mr197515a91.20.1749829471051;
        Fri, 13 Jun 2025 08:44:31 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8fe6sm15767125ad.164.2025.06.13.08.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:44:30 -0700 (PDT)
Message-ID: <b99e93dd-6cee-4c9f-83a2-faf66828f6cd@gmail.com>
Date: Fri, 13 Jun 2025 23:44:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_084432_337139_A8D46F86 
X-CRM114-Status: GOOD (  11.43  )
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


Sven Peter 於 2025/6/13 清晨5:11 寫道:
> Enable drivers for hardware present on Apple Silicon machines.
> The power domain and interrupt driver should be built-it since these are
> critical for the system to boot, the rest can be build as modules.
>
> Previously, many of these drivers were accidentally configured as y
> such that this actually decreases the size of the kernel image:
>
> vmlinux 163628520 -> 163330632 (-297888)
> Image    48388608 ->  48384512 (-  4096)
>
> Signed-off-by: Sven Peter <sven@kernel.org>

[...]

I think you missed these drivers (all of which should be m):

BACKLIGHT_APPLE_DWI DRM_PANEL_SUMMIT DRM_ADP NVMEM_APPLE_SPMI

Nick Chan


