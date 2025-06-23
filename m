Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4905DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 05:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQwgugPucFRFD249QbpKhz291C8PnULHkQRIiUmqth0=; b=k6FhFot9LT8rLMKVzrY5GgCvxI
	BpINeuyfObeBVaEG2iRy2ApMEDsV5q01+hHdHjsGQKcpMliP8kAlTuxvrUehl2/EmOg0e6/9Dyjoj
	frG1YG1en3oEIt+tV/pn/xA2zRzCKw3NGL4x2FrgKwXButVZcehgwm4JHII2/eoGs/kBwtuWwB+98
	yaWLtXV3kVEW2oxT5eqti/lDlS9Vkwo766F/vIkNZT4GX59f+eRseX48s27WayGtDKMHVpGzUfZga
	WQv1RqkLhhDKBKVH4Gm43xes8jKiuRPhIxzuIj1boT7EPhA0eyKHzQjedxRSeTFdgTnBqkyGOLZL1
	8sILP1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZgv-00000001cPk-2YyN;
	Mon, 23 Jun 2025 05:26:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZee-00000001cII-1MwW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 05:23:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-235ea292956so38518455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Jun 2025 22:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750656219; x=1751261019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQwgugPucFRFD249QbpKhz291C8PnULHkQRIiUmqth0=;
        b=iLEPtfVrtYRQcQ1xog0Y9jjR4246HfpbERNSeOwo/VCN+Dl0D7bnh7YfjfVIgLOSzF
         Q4FGRHnOg62JeoUgTKIjQ20/Ja5Ct8vM1MH6V1mnPADUHnZRcM3BvQ4YBp+e3byU7YX7
         MifwUvJ2/muIKmxAKsyGkJZJ/ghYKWJjKkXf9P3CS+IXSwpL4CiXUrIMMdofB3pmFXOH
         6iQO8rcBM3PvNdXr0wvSiVF6E73ljItMGNP49lLsqTClE5P3dWUdbotCEgipazXJGy0G
         5MTyWCdt+k+QnZfT+sKFW+B4TbvHTOklzlRc6sN8bonJCCm6fHSW2oNwpkdKOCa+7CXk
         P3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656219; x=1751261019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQwgugPucFRFD249QbpKhz291C8PnULHkQRIiUmqth0=;
        b=uwu0jr3mnuzyvG/qpze8Z5MhEEHgcPNhTDcaCneVbSmehX/+EBDSSLswvXt/4aDzQc
         Pd5uVoHQy390Hnbaz+PBGgEaa1g10ZxsrXQuIL244Wvzb6B+Sk4uK2bLsAQUB7UsKc0v
         SkwvojVUYxls14B+GQgwFV8NNtNEoxBJ57CkURiKDoVz1LgDfUca4MNUwJQdCcO8+SVw
         hbLtWwLd5lMITZHNtXl6oqc27Td8+lD+axH21DR80hqFCs0yDt4IfT+yUkWyd3p8Rxp2
         z+aT/iTZRxZ4quYPRK+Oi5ZIY+sMN3a3h7sP/84J48JAYZXZMyNxFA+8YmeCX/xnzLo6
         IBAw==
X-Forwarded-Encrypted: i=1; AJvYcCW5bBWAJp+7ShyMT0gZsWXxxTZm4azDMSyKKYxgbUp0O95ZhLzPEKXCaCEocj6z+JDY9VUSRN2chUbno0kAhEPS@lists.infradead.org
X-Gm-Message-State: AOJu0YyMGXPQG8wlFuZ/gKDz8gkRXsnZB6DmVkcvLdlPk+N9ig7h9TLw
	RqFo8h1horztjcPc12CmsiLxu5V8FfnjiyJ28eLRwY8Q5Vq9rEAH4p7ADeCLq7vjCF0=
X-Gm-Gg: ASbGnctCs0mLGqCVy5Dl4aNwMlCRjy573vO/ntu0PAnVdFgw3qSx9yWeUZ1ChTetSY3
	U+fG7WpAH+eaMFciC2nXuAansH1ZM69/Mf9AEPzA8zdGGGmZ/tQyjoOFpbj9vj+pdFwSjcWJZ4t
	NOtL9p2sTkg3xGltVVD6MlwkO0lU9sriNzOmsdwttfREcYw8o0c16oWMG+5dcJoXwuIG9WTHF/Z
	E4CO+iKLeZ6z5KwhX5p5tgVW1yZdpq3SRVFZlwU123Th322q9B3eu05YrOZURD1TU7pmnQCGIA0
	1wc321Zm7DnNY+v6Umbv7OOkD5FmQZpxerKFdIQ9NgDUmHf0A/0eRazDydfLK6k=
X-Google-Smtp-Source: AGHT+IEH9c5WyKk0QMC2mHqfjueodPhOXf2kHZH/3FnWS532QpnCQvmpx+97zKTnLNJSNxf0AWaT2A==
X-Received: by 2002:a17:903:2285:b0:235:eb71:a386 with SMTP id d9443c01a7336-237d9b8e9d5mr159749225ad.50.1750656219135;
        Sun, 22 Jun 2025 22:23:39 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d873e6f1sm73016605ad.247.2025.06.22.22.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:23:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:53:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jacky Bai <ping.bai@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: armada-8k: make both cpu masks static
Message-ID: <20250623052336.d7lllm64yfyjfqu7@vireshk-i7>
References: <20250620111459.3366195-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620111459.3366195-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222340_376851_64857ADD 
X-CRM114-Status: GOOD (  15.22  )
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

On 20-06-25, 13:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> An earlier patch marked one of the two CPU masks as 'static' to reduce stack
> usage, but if CONFIG_NR_CPUS is large enough, the function still produces
> a warning for compile testing:
> 
> drivers/cpufreq/armada-8k-cpufreq.c: In function 'armada_8k_cpufreq_init':
> drivers/cpufreq/armada-8k-cpufreq.c:203:1: error: the frame size of 1416 bytes is larger than 1408 bytes [-Werror=frame-larger-than=]
> 
> Normally this should be done using alloc_cpumask_var(), but since the
> driver already has a static mask and the probe function is not called
> concurrently, use the same trick for both.
> 
> Fixes: 1ffec650d07f ("cpufreq: armada-8k: Avoid excessive stack usage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/cpufreq/armada-8k-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh

