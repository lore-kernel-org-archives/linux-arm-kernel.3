Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92549C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 04:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=; b=3LayfBVHh/BjY1u4RUS3wCVuAP
	Pi7M5I+Tna6m8DRvanPgNP2BKNfECPpbLqTUMgaLAk0VdNQuHFBApUavqB0AHI4omel6uahsByw9d
	Qut7F2XNlvhQKPh8ya9XLEJK9kgY7sDA2dp9eOBwMz8++bw2848w28RaFBWYGku4CP3cxkL0eyFmN
	cLBNbI83b2GKCnm18ZWgSkyr2DmTQ6tOQ76T1beGaNB3JLrs7l4MUO/WvaZt1I25DRJT++MnhOBLY
	bfmGqCG1suPpwxSRNmmzm2ftQNgOZlXznoXeLfCSbkaVRAF9xakZXbaP+RJ6k+a/T9Xxl/9Hl8nJ3
	l62S9zpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2jk7-00000009Dna-0xeD;
	Thu, 10 Apr 2025 04:42:23 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2jiK-00000009DZX-15cU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 04:40:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b34a71a1so419071b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744260031; x=1744864831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=;
        b=cvo3aXLh7ER1msunKIuqcf6OeAOVnnn8nGJwvkNyH6E5ZSV+rvKVJ3v7DbVh3Bl0Ma
         B/bKw7OHxhiV/nGR0s1LOVBiOHZH3B2ZHK8UYlQjF/+dS3vrA/XXrABQ1U1UxRLkpZyT
         9flhn+eOYpiJ2x1vAZTJropPWt1uVTe6OOe1ZyaTFbUCr2hwvDnEZ4lKUOOdFYhayOxz
         MagKcglu2K/+9f44JAoTKwflDWpLYudeHBAV8zlVPiLDShckXWHgbAYdneDLl7tUTAAS
         KlTJFWYs0RZtUaFDN0W+VKINGErW3miPeZsAAyO/LlSh3ZSqf7/QpkcqgM+SZVfE8ZfS
         SkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260031; x=1744864831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=;
        b=MnFhCyDFMt/jWiXNkufUoJhJJoOGpII23FFcrkOvI1LmWXJtvE13n9jzwwce7mz4Yt
         urKVwe16sJsJK6jWHgQQrB1cJeTLgLWgqfGrbTbnaeE9GrEctAD2PWMbnfuPrpfFDrh7
         kAIJAZWXt3D0siRpxNVn/RviQzn+QsSHTfgSTtzPNC2kHZgXGRta3duHO23S+c2AqE5F
         0E4P+fceKO4xkIRDEROlH9QDArkCJChL8mzJKGRDAaGcw2TDvAc8KQS2mfZ4x+bJkx3U
         ftQm6sAfRIm8VLX1OH7v3RQGaevPngS1QJ6ZONtDFDQN95kEX/tlU27mhSveVUe1mjEG
         +Aog==
X-Forwarded-Encrypted: i=1; AJvYcCWryA3Pa11jyieM6H8YQASGVHVApd5LFuCEleSDmBV0SZusuRYZk8ltPC5u2X9CXgw8fumvWwpoV/SnuNKpWznE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh0/HHdyEOofp9Sb/TgCjER85jr9dx/AbSShTGqv+9yV0pPD39
	wcl7UrARiZ+1CVlB3PSI4JPWSKHi/NH+yInF+NJxf1dyie1e2NbVq2fChiRajFw=
X-Gm-Gg: ASbGnctjcIc8aq68Q+qefJbO7DVv/Hc5wHtzGs6rfqSDxIiqB5A3Ljt+pMVvZTN/Smv
	Sq821dcF+iK06f+T3ETabYBe3VJ9fOAh+dfeTUrrtW/0EqPyutmQeQFJ4pNyc0NySDLFaNsNYQV
	btLR/wsfrh2OxpVcGMY2MzEe1Tla1h4NL5wR5mpWRjcml9PSfx6az2G2gKrpQ7YyOLfHmCmPNBZ
	nwbxIE4mki8K59ePxzNZ0eoYwHn3OODDeXxb8BB+WCps4Q+WylVcLrsj19MQJ15laAUmY0Qax2L
	FrtvKmOW7A4xgP1dqc8V9PaRONxfWauOVCJlo897nQ==
X-Google-Smtp-Source: AGHT+IFgRbLrUZ9NDazqU3l/f+bQGBqmoIwoUvJFi0i9jATU+nvyQ6g9ESyfUs7smCpWRcGzZPw3Yg==
X-Received: by 2002:a05:6a00:178d:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-73bbee5477cmr2498194b3a.8.1744260031291;
        Wed, 09 Apr 2025 21:40:31 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e694efsm2272421b3a.164.2025.04.09.21.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:40:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:10:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
Message-ID: <20250410044028.ancslars65llmgck@vireshk-i7>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_214032_293841_0E9B2EA4 
X-CRM114-Status: GOOD (  10.07  )
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

On 08-04-25, 23:03, Henry Martin wrote:
> This series fixes potential NULL pointer dereferences in scmi_cpufreq_get_rate()
> and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.
> 
> Henry Martin (2):
>   cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
>   cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
> 
>  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
>  drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)

Applied. Thanks.

-- 
viresh

