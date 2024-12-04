Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5226FE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 03:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1EbTaJONCC4UxWr9Do6ym6s17dMBNgiZQqtVLBSMas=; b=Q654vcPd4eUFBgr5tRpOKbEUaR
	TbteBGrgrcUpqoB7+jIYJ2E5lEuZyuwD/sUNOoBGFTIdi3K/r9h96MzW7QCTlxUvwDGltPMEkVagY
	3InoG3c8QFM/ghwod1y5qqOHy7E6Z/eQ5X0Y3qfWiOx1TKRz6d78fxLSmZm6DA0/MmeXJpNZ/7WdW
	/5zMeIaFqma2+jxFlG8qOyRelS2tBPMLSSOVUdXs4Bs/5bB2InzH8ikgsduSSGfgdD/u203rV60Cg
	92C4SJXaK26fgz8o6hmt34+6RodP0XLy1JCSJXi/9Ihlqo88BJIm7DTsbUG1pAKIm4o40AyFJ1DJT
	FKvMK4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgDZ-0000000BOlN-1knI;
	Wed, 04 Dec 2024 03:38:25 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIgCY-0000000BOiE-1ckp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 03:37:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-724e14b90cfso6298377b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 19:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733283441; x=1733888241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1EbTaJONCC4UxWr9Do6ym6s17dMBNgiZQqtVLBSMas=;
        b=wp1oiJNOus4Do7HaOsMs+k8a2W/ZRyUdYCza1XuUI/bJDOBqeY4Zegl+UwISxWCEZS
         jn+zwSaRZOJqCvRslLTP8je8jTOTlFA/MPJv4Mbt76YsHFXJxHrSuA1oVHJHLEE0W5he
         +OnSjvHKmnPHzeaiuc72rtVYAxT0SHVbPy5iNfdeYXUmSRDAyNICGXl6a40gLHZcK7km
         P2WQvosvZsk9Qv9yQsEnAqUQPYUuJ/LerPpCGiT7XnCJZ204Z5VLgSb4Duy2wFRTBOBH
         zxtr4ERE4WLcvvIFaNh//XYA6KfJuIXw2BvhqakrA9PfymE5/HHuSwt5rj6udzYhmkyF
         jQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733283441; x=1733888241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1EbTaJONCC4UxWr9Do6ym6s17dMBNgiZQqtVLBSMas=;
        b=jBD2nMNww26ewJiYzOjuDh94M3SrzfyudtM0qraEfOsPbPdojr4KiQq0EbkX7UkJ23
         JbjQYqm+5Ud3T5wCYeA9G23uz6hXlShrlfeG+NZXwFK/buIsMKAV8HD/YV8HwyFEqd+R
         4iYBX+0lfyg86on8xtKEKO40Vw4ZaOX4mnJ2cpZ12tFG8dRay9vEJlKkAOkVNNSklk24
         d4NT5gQC/DLg4LOJeFy8NrOuU0QEbv/8KVBcbtrTQRwOC+K44TRaFfivy/g8/Ufqvgjh
         LrT1a3HwbSB0SOz6bgYZSflc/EQ8pUcZ/XQZh0kSz9cQJoqc5amWl44c7ef7flBBMLnt
         65CA==
X-Forwarded-Encrypted: i=1; AJvYcCVMld/FYerSmMg2V0j1XaE5xiXa6CO1NNgeZ1Ram3QROmXBy6yN5rEeRCbA+O95XrlFkgxHT6eldz/dfuUz24/3@lists.infradead.org
X-Gm-Message-State: AOJu0YxtpbvZVN3JEFoRGPl3DWj3IiXnbJLodfZyQ0HbZjCZSriDIc6Y
	wCu8LLM7zidD0u3uaRO94le7uhePAgFwsZVCCm/HN6aUfibDjInfOIyqsXMCoMs=
X-Gm-Gg: ASbGnctRmqfKv4F+8w8j8ZNnlJRVGFBd2Vj0o/41oyU0+82m5uhZSOqD4DPgzA3hELF
	jJZUdMftM9fDNTdpu0KBmp+p7ev0z/wlz6zeOMuOCg4rmEHf9A17VAQ8HTz6wW40CKfe+rkh6YG
	t/bZDeDbnCeqsFt/Fk7paO/exmE903xZd4m2chRVT6XaICwjnTCLesOqHMOzyS4SVmqwpcgt1n9
	WTVPNu47CbXihpQkC0bNIkbt0uhQQo8mObMj8sZ9aluMUCcFJ8e
X-Google-Smtp-Source: AGHT+IFXmIlXRzom3LjevUtmLAA7oE7u/5XJYi4THo7kTNIKMaiJhELqE4B6Y4ifEaHbF1jFv2F1Bw==
X-Received: by 2002:a17:902:ec87:b0:212:63db:bb15 with SMTP id d9443c01a7336-215bd16f521mr78217995ad.38.1733283440999;
        Tue, 03 Dec 2024 19:37:20 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521904caasm102256815ad.60.2024.12.03.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:37:20 -0800 (PST)
Date: Wed, 4 Dec 2024 09:07:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: RTC_DRV_SPEAR should not default to y when
 compile-testing
Message-ID: <20241204033715.xzojqni2byocnt5m@vireshk-i7>
References: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_193722_479726_78E458C0 
X-CRM114-Status: GOOD (  16.23  )
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

On 03-12-24, 17:25, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/rtc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index a60bcc791a4803b7..0bbbf778ecfa3e4c 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1316,7 +1316,7 @@ config RTC_DRV_SC27XX
>  config RTC_DRV_SPEAR
>  	tristate "SPEAR ST RTC"
>  	depends on PLAT_SPEAR || COMPILE_TEST
> -	default y
> +	default PLAT_SPEAR
>  	help
>  	 If you say Y here you will get support for the RTC found on
>  	 spear

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

