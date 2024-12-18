Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56573E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 04:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anbuEbZW8yvbXFC35C2SRwfKrlOPlxSRe3Xsz2o+b10=; b=PU9JnYMepteL6FT7icIkn/9vSK
	1Y0N/YdGFsGXb2V9dGFjLQ5XEonpcCa/A6l92Xer8Ksp+cFc58dRFvw10cHpCz+a3YTGg8nREUEYE
	plC9CPij7/nXff9rlriuv4D3W5+waKWhp6dHQxwGvulGLz2gOIQL6sI+uYEJk7DNY7NY9LE2BDK8J
	UBnygCvuZVFEKKUWSRjUOMa7ddQuAewIySJvVsUu2RmDrk4wH4549jJpGI8hjx8tU4ppAPKwHMUIC
	Lo6Spi1rx0WYHthAXbhxBMaGYpKXvQja7Vc+dS+wxVlcFTktaafLYBpfQZ7xQvrsBmCpqYvUgj+b9
	+JTsQZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlQN-0000000FXG1-0Qe0;
	Wed, 18 Dec 2024 04:12:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNlPH-0000000FX7T-2E3I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 04:11:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725c86bbae7so5183765b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 20:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734495090; x=1735099890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=anbuEbZW8yvbXFC35C2SRwfKrlOPlxSRe3Xsz2o+b10=;
        b=GeLK6xKaDvQgo3bOPPzrs6eduJhVZ3yfP1SxucJCHCuSIvvNctLevNjlmb+Mm0+181
         AB7M9Qp0Hx/d/NtegLCt2FbQu1RoGcHprkTiW63ZfzKX3/ucaTh+zhVW0GBX9LaTc/0U
         DUPrCESoiBQA6NPZbojriBRoSKFUFD4DwZt7+dyhp5xoX3B5cXQIzGSJohAO12MJWKkJ
         krMRdeg3sNocDF6I3duMAetviPMc7Acrk6ffFD1O65BAmm1czviF+4iueMsiDohON7Ir
         5gFjYVCbGSYJI/2BPbLOeHeP8R7BplLyR4Sqm/uY4HINI47GXtdadSzLXBRCJcTmUzWo
         TJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734495090; x=1735099890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anbuEbZW8yvbXFC35C2SRwfKrlOPlxSRe3Xsz2o+b10=;
        b=R4aR42txk3KQLstSnJ/Fh5xMqE0RGco+cDjSOPr+s0masw65hmDHYd7YybMtC8tbwB
         bytUozWj3GRx1SI/w08YdhPZjdjGQZ/3K7VyLEf+23pCCSPMZhrrpxCI1hoIBjzuULNH
         2FhALrf316Vd78HAPuU5rUX5n0XdsH01An1hsfB9iWpyzFNvJHsaN94lZU+Q9jTQnPWV
         z+hFy8GsfOs0jgIFh5+QJI0xR4W94/KH8WyC8cg+FQQIAF2D5B7eHLBpa6GOWPNC+dV8
         G6mmv8rRst/jsDQrbKwmGhrS+VRaT4LHr1wkfcJa9cen2LwYxFF17aIxkyUHQzzwfVpf
         tUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTddxtl6F+rBGplPcrxI9sHfrGrJkSYXUUWnyeQE+NNQL6mrxGGU535JaX2JcKD97DICFY9JQ2fcxQYk0zThYS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5DoeL4/CsvjvP4OHcFECnbDdC/RAmALEIf8e9LeVK6Jenq2+
	adEQOOnvS0sEuRL1Wh3gMhfufOS47jZVeWaLiENboLbHN95OZM/fTU2yRegQ/GF8dRAd7/squ5d
	o
X-Gm-Gg: ASbGnctjPx4lJyk9Y6U9lIRVw4A6ttuC2JqbtyaE8r2z6kuReVTDWrwlryy+EN/++gn
	CAvDAOxo7+XMz6dbLxeP3frunu+p4VDlnXb+BPVpLYcXqdAQpUGE4Wq+soDvgnuRQigWBa8skKg
	sV0610lpl9GbbL0CZDFZD9WVDa6nQUxB+1bsbF7JPQam4F8eAp60v9nfRUWDgycR+g8ad699w4Z
	a+gq99WrcWcttUJjO0N6m2e6pvHoGPTEsqTzX8SI9LOFJv93Z93TmI9CXE=
X-Google-Smtp-Source: AGHT+IG4sPsc/N7IOp43iXXeKOWo6JJJXd9zgTWOHLq4CFq7GSx+SKJhvF92c9uFAmfB0bNzPUQSSg==
X-Received: by 2002:a05:6a00:2191:b0:725:e5a7:fdac with SMTP id d2e1a72fcca58-72a8d2eedb6mr2614606b3a.26.1734495090289;
        Tue, 17 Dec 2024 20:11:30 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72a9d3e94f2sm76959b3a.199.2024.12.17.20.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 20:11:29 -0800 (PST)
Date: Wed, 18 Dec 2024 09:41:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20241218041127.khdwo3hzmywcwuh5@vireshk-i7>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
 <Z2CmcelSy89NULtz@arm.com>
 <20241217042726.isllh5bulpnwql7i@vireshk-i7>
 <Z2Haw_o8gF-Ce1gx@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2Haw_o8gF-Ce1gx@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_201131_630606_E5B33140 
X-CRM114-Status: GOOD (  18.39  )
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

On 17-12-24, 21:10, Beata Michalska wrote:
> On Tue, Dec 17, 2024 at 09:57:26AM +0530, Viresh Kumar wrote:
> > On 16-12-24, 23:15, Beata Michalska wrote:
> > > My bad as I must have misinterpreted that message. Although I am not entirely
> > > sure why this might be unacceptable as it is not such uncommon approach to use
> > > signed int space to cover both: expected positive value as well as potential
> > > error code case failure.
> > 
> > This part is fine. The problem is with handling frequency here. Signed int can
> > capture up to 2 GHz of freq, where as unsigned int can capture up to 4 GHz and
> > so we would really like to keep it at 4 GHz..
> Right, though the arch_freq_get_on_cpu operates on kHz values.

Hmm.. Missed that.

If you still want to keep it, make that change in a separate patch and
the new sysfs entry in a different one, so related people can easily
review.

-- 
viresh

