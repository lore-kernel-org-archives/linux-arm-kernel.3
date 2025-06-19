Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70382C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=; b=I7p+oD8hiZy2xTTkieyBKBj/7t
	BdMwUtFGFL1PEh3BvPzb6JMlNcJnHJIodEnUnqCOypYaLwroHy8wnouI/9G4nH5HlQNKvUzGP6rOL
	iWZqnaLz17INU2F8jURVyqX1Q1OtOdm3bmPts5GL2HHmW/AuP3FCAZOsxYkvKOm4yU465DTXY4+OU
	AF1gZfbpVJe0zyTU0vi+tqQE992jkEaUmOIFQSJ0DCjnMm3m/O0EKoEvYC8jMMMBQurUnarIil2N9
	yj6t4+4Cbe8hpcnIXEM+DSC1/dKEg4AfuPlyFNDWUf1F7kGIFxNIdBNHpt6AVOPMFij33XrqmcXo1
	9A2gqKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7yY-0000000C4HS-3C86;
	Thu, 19 Jun 2025 05:38:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7wJ-0000000C3sZ-3rtj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:35:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23526264386so4792885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750311353; x=1750916153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=vHEmrgYPEMXGnxpQ4zlIFtyk22EtcoHyPozzWxW5pBzhksChjYNd1J50u9wmAvvQOm
         Ge9eUmJT5QCCmU3pkBflLUrNzDbN5nIqqOfKLFy2lhzVJDZiyCzNv0uQnhm5ABnkaWMv
         S5y60Cdr4fnkdhEiSmXSCIicCyMiy2yAKzRHXb2v4eiWPWSo1dma1IDWS1HyVzDUObVh
         NSgMozeArBdIO2FF+ElKjTNkehojL5TXCesr7XIT4Ylm4s4mluhGY0qYCEIF0NC9OORj
         PruVmSox0wSUXoe2cR8/ZaMt1gT4PHTV+s0OBK8ArAoUZ+Pwi6a7eCRjibTX2dZuK4qV
         n5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311353; x=1750916153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=trZ/D50I23jDBKzti7dDFkT4oEqo0Z9h7QeXKnS1RZr6HMiqUbSPhD5uZkDAQ1bAXw
         QkHDgUa49E2ojzLnRyyA20kZSY5KtMrnBpnI5AsFIdX2PvZdbW7oe0SPtcDV/1+LCg9y
         X8VNISvsXga0lH7JDPqGLS8BBSrRGCMmADG7jMRjzeL7yfRBT+jPinXGG5hoZddQ1Pds
         +Hb/wDfCWX1jfc/DinGoZ0a0TsRujLCGmNFmCsF+94EEy7PjSi2kslrsF4rJWnTfu49I
         NIgB0hpWzOXCIHKdX1pDNv5/QPCgbBII9znIzGyxUuw2XfuYD65L+0G5qn4R/XJLb7MT
         fwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWay5ur+AKpeJp9FICXc3xyiVdOP6G64kFP57dSLkoRJRfgTyqJYEUBf4kIt1jph4ikh9ztsW5Mr3iH3JX2DkM2@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+WqIRlr6RPfnikp/6YFBTdxskDYOifi1qkX00jOykhSoeiU8
	8ZUA6fBDYrkJgy4XiGt1hBE6kuXWyxdOSyO/Ugdv9ci4pdk7IW53b1lKXat7Ch3tH3g=
X-Gm-Gg: ASbGncvJ/UDZmeGE7fZHefxtSH94Fjh5wytGdLh8Wi+4VpdTzVs1MKxPFWaROiiseRn
	To3+THAomjbFfjwFzpL3KV+28CkxKVoQVF7Q98Wuo7tz7VHOqjIrCy/CNGYOPiLgmulAsyc/+Ip
	kUEpKpBrpRWCE/R8TIpS6k1t7JG99uTHwtmpPpD67oZrMkVYbOnRaB0x9QumbP+4LCp76+01poQ
	T4hfkNUrVoWeC73AYAAJeJ7BH1ep6mX/V/tXbGvDeFG6JG20GFpS1lWIgwI9MKy+/MiQtYwIe2J
	i8Qfqpef7Ke1t1B+NRDEWGC+tU/jzAIEYiVeTXV6a2shrZ52soi2EaTpWWkNCmtVBKw7ZP29+w=
	=
X-Google-Smtp-Source: AGHT+IF1Brl2Ml/RhPp1ZISh/ybbgy1I/Aosv1oeoYbA3EE1IVQw9sjB8PhoTnTOzWYQtjW2ZHuZqQ==
X-Received: by 2002:a17:903:32c9:b0:235:a9b:21e7 with SMTP id d9443c01a7336-2366b3df793mr286985355ad.48.1750311353385;
        Wed, 18 Jun 2025 22:35:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0c9sm112008655ad.20.2025.06.18.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:35:52 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:05:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/11] cpufreq: apple: drop default ARCH_APPLE in Kconfig
Message-ID: <20250619053550.hogoo7ic5igvex3c@vireshk-i7>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_223555_966867_6004FBB6 
X-CRM114-Status: GOOD (  13.67  )
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

On 12-06-25, 21:11, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/cpufreq/Kconfig.arm | 1 -
>  1 file changed, 1 deletion(-)

Applied. Thanks.

-- 
viresh

