Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D868FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcUZWE3ppguCfT0Ghk6RY8lNJANWnC8EbI6p5AXiKeg=; b=tNUcT5BVX4LpWKPy0dbzbmGoen
	T93pPcGSyNuZQef42qe0bnGjI/FPcmReadLe/ifz3h5ucT65HtzNkF4AZ/SgFFTxhXR0GV2IrKal3
	wqbM0rgxHOaAkD3OrtUXmD6OoyZr1zY6zkZVfprcS410MoPcUQmoAjsVEXaHyfmehwbJmTBCwnYyH
	neIxSmqPV7XhHXgRDqoOR6fb7KSYj0vJdMipH3Wzvex0zF8YyflWbe6iAiJoqsLl1+I2d2g3oYYSy
	rHeKwU1SQWbOH7NT4vUU2j1OeZQwy03pP43sHYcs7WZ/q1Ml9az9V9emGSLOMWs0VvAFQAtylykks
	VD0OhPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrl2-0000000G9Nj-2hse;
	Thu, 26 Dec 2024 17:34:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrhQ-0000000G8r3-3xwd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:31:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216401de828so74148485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234264; x=1735839064; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcUZWE3ppguCfT0Ghk6RY8lNJANWnC8EbI6p5AXiKeg=;
        b=XqBlI8icyNybVdvPRF8SXZFlCEVIckZSGoWKiM6Go430Pgs2uVZPEOP7wp9/LhSTRq
         sd6KYVONYSm0IHCJd3Cb7Mu0HjUiY3uKiWgFy/F3rDkG7mCKY4OGpDiX/Q+ykZE5OLtO
         JDRjOzVYcXweAt3/J/q+dglHq+x/MmRdlyiuvblS0X8uRGPhuuuoRgrFSeBSoVFgnzhU
         ayxsmeHmFYqBYrNAVYd2u7cPRvXORE9g1WsUIZW5DN04keHOcn9lcMUxQdARp/lS+s8m
         3KLtvXU21KZlN+CvggvDW3n5UYqQCNLI5h7zpIvNi88AFK6lflmPoCxMa7TzefdDsLke
         yXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234264; x=1735839064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcUZWE3ppguCfT0Ghk6RY8lNJANWnC8EbI6p5AXiKeg=;
        b=BNHVchcw+SjstUz+KcwhgsnOyRMcd/Ldv5gXrVCekFKaaMBc8ytuMm7cRyr3ZDb264
         XV969JxmKzrHBI+9XsSHuEFQ8Nnhwq9oL6BGkjxd+QGB7Ww4l9KpBwiyohzbKKVFvLHO
         VVDSYTkC9rM33X7XQKFdqQQZIOcWscSgLzfg7SESQCEyQsctZ+SX2uRyFtUMk/Mbi3RF
         VSE/l73OImBzetWGVLcNQD9F2dxo0voZ/j/nuqzEpZ0udRlJlEUlNLoI4tsMDloBcmhC
         5A57oe53B7GIoQkGdMf2/r9s1p9wDcULOfJWYP7/s298Qp6COTjlPEz9Z5MIByQGKdgd
         Ahcg==
X-Forwarded-Encrypted: i=1; AJvYcCWjYCN1Nd7UwlJYJk30MPh+yWRQqA4Z/UL2kCvlUdOyH5HBdtVmU+Qusklqba5Kz64K7QpN6lHdUublgSxG7s+x@lists.infradead.org
X-Gm-Message-State: AOJu0YyPyBYwI4tkRJYGddbr/VL/U+3oWtqSWLOjrwrzwx8GJEktbhoV
	y/Xsd/Caq8gBGIvCg7PHc/ttmB73pYU2Emq9B3gr2isiPow79GFUEJbN/NizTg==
X-Gm-Gg: ASbGncvJNLpB+NEccRLZfvz36/w5Zmry0qEJEO/7SytO/gcECDFz1tHG4spBUjkgCH3
	6vBCi98NXWcJPlld3EAQ1ewK8XJsyIerFjZAYWZswgJq/urBnbIUGlQwUj9qCMjGx9f1Z40P+R7
	hHERvKcvayBGs7l2jVlhvyFBxQ7gaKZH12B+gz1KAnlNQpMLnheYk3CvgyIx6uH06F6Placxtvq
	2j1NF5T1Gn+btAyXXyVqnEOPDaBoeeovNFhh+4SHuOQpSOcHezsrJtFHbmC7JAuZB5p8rb5DUiY
	sE1xfGkpvzd6EZslzcXHi7PB
X-Google-Smtp-Source: AGHT+IHAfn46MsITOFrPVZJ4vXZEH6EHEc/IQOmoCmQiapMunnWTNeZzpppaV467WwIqrvzfz6A1dA==
X-Received: by 2002:a05:6a00:414a:b0:725:96b1:d217 with SMTP id d2e1a72fcca58-72abdd7e0e5mr28935333b3a.9.1735234264082;
        Thu, 26 Dec 2024 09:31:04 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbf6sm13136269b3a.111.2024.12.26.09.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:31:03 -0800 (PST)
Date: Thu, 26 Dec 2024 09:31:00 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/7] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
Message-ID: <Z22S1PPAQ4NKdrrY@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093104_987598_7AF92859 
X-CRM114-Status: GOOD (  15.55  )
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

On 12/06/2024, André Draszik wrote:
> This code's intention is to configure lane0 and lane2 tunings, but for
> lane2 there is a typo and it ends up tuning something else.
> 
> Fix the typo, as it doesn't appear to make sense to apply different
> tunings for lane0 vs lane2.
> 
> The same typo appears to exist in the bootloader, hence we restore the
> original value in the typo'd registers as well. This can be removed
> once / if the bootloader is updated.
> 
> Note that this is incorrect in the downstream driver as well - the
> values had been copied from there.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>

