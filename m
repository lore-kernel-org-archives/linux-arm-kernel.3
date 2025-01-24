Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63497C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZVGarXm8F3wmNaZlX6Uo9ZJAp39A7Hk9H8iGkJJROc=; b=fqd2rypNARUaZBa0pyPrIzHWFC
	fjiE0XaE7TCPQEhw4vMaGKBIKaelWdO8XCVhfjnAw5DJNoNMpM8iP9fLhf75Hdu9tw1pvOqX2ubRA
	I0cQvaGsex0RCB2hlSrVFx9WBgVZt+xeO8t6WKqkNLmMaVZF7u/KkISPvNLCP6HN5HghSuXZdBIOj
	FuCi/k84ysBeOwepdfHxOeCdd4ztc3n8gqHAc8lvza0LAXi8q3Lwn4i47QB+PWMO5iRwzNTIpRbBd
	QOZiHH7RzcRN2BnBkkrWy+6zY2WYLhqPVvmMfFryRWj8KzgokPF3uvVN5VMGpd+U1GryEm3L6NuzO
	LkmFFvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAL0-0000000Do7d-2s8V;
	Fri, 24 Jan 2025 03:26:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAJg-0000000Do0G-3yoE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:25:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so2429437a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689108; x=1738293908; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZVGarXm8F3wmNaZlX6Uo9ZJAp39A7Hk9H8iGkJJROc=;
        b=tT3k0YOpZGtpYNIKDJUjMAeR/g64mtoowHSPrklmv092MneLK1mF2Yl9MLi0TFNlbz
         Wmy2fLqWxG3SNbxCwyIaoL/5FzCbJ698F06aLXFp3x+dQL8UtRsJP01gT3+yYVj1tAfd
         Tex+ng99T5NascQd1cZ+O8QojxAqzIOrl2/i0Et+uYqtOh8YxIqE4c1KsAhMjX2X1K7u
         cxc8ndQy3bOJdyQs/7KrTCPoV4CiM+l6mb9FMVFdTne1rgfhPQhCT33IQyt+M6P6vQah
         j+q63eaU8zMhYex+j3T2n+dTdCajFu4LueZAslqpqQFOo/CIFPA87VAAFRqZO0F1Cseo
         X2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689108; x=1738293908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZVGarXm8F3wmNaZlX6Uo9ZJAp39A7Hk9H8iGkJJROc=;
        b=un4Lf3BsU5BjHiNaABfzVNZpRK0YOIhhQt0qzfbE6emHywSx4TAyGOmWyhyhAtDoc+
         4xZ+3gCKDX/gxjR2k4I5I5PjZiHQwJomx0C/OY+4WCOnHA4UsHLsi5evm5W7ChyxF99R
         8UuXm6diUX9Gb4G46Dl1ft9/O2WnIwVJB992xvJmON1MXJ4FVVqfB0xU2GzPbax5z51v
         ku+jYO/FOFZjTTCEJlOfoJ+TG4sYLRP3p5SW7yCaCSWMcIxGDcXzzzzNYtWjRRN1YHL0
         UsTGBL3iSJHFiUTyNgaylMJY7WwQawFxNoTkB2Ldypg3lEB6Kmdg4mDr6h7DJ5XJqxk3
         scVg==
X-Forwarded-Encrypted: i=1; AJvYcCXaDSfOpN0fr1FbagPftmjrzqsVIA/apqU/9e5VoUOsyHZsQfmFHzc6Y7dN+0/Iku6XF+Le5wqMJDfTFW0AWPCR@lists.infradead.org
X-Gm-Message-State: AOJu0YyKBXhvQ1SD/XjGH+pwUl//g7+voenq0fi3zJNZae3QyT7jl4O8
	AqRlUNlv8XZJzipDFmyvdem29XqREaf5xl3TJazAfnaz13Mzd6SvL0tE8oW+ua8=
X-Gm-Gg: ASbGncug+KW9ZkmvX3Bd+WSN6JO/0NskJ6NXn88IdYL7aTHbG+OsSRZpdkC77KBIwXc
	6UDjIgCY10kLmCd/sW6TZ97333fLweMSPPAh115m3RArkoINhrSJo3q2peL7YUdU9bLGB1MsdfQ
	NwRp+pvTbH6d9Z+jzH13eACt3Hip++51x5/zmWW7fbM+ynHfe+W8I3jiTfVx+ZMNYmIVwh9GDBd
	cihjwkOySXYb1WuPoi3hJBU2tcA+gBM3OMZjnVUOJBEb44m1Pr/Bku5GfvrmQdtdwCR8OU7xR7b
	AJ4Uw0k=
X-Google-Smtp-Source: AGHT+IH3EOFfjRy2pHQZCow+ihTX4jvDoolzW8UTSKno/rqcqAGRzh/TvGK8xVaNUiDNlVEdvHjT3Q==
X-Received: by 2002:a17:90b:258b:b0:2ee:f80c:688d with SMTP id 98e67ed59e1d1-2f782d4f168mr39207230a91.25.1737689107809;
        Thu, 23 Jan 2025 19:25:07 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa6acd0sm596795a91.28.2025.01.23.19.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:25:07 -0800 (PST)
Date: Fri, 24 Jan 2025 08:55:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] cpufreq: s3c64xx: Fix compilation warning
Message-ID: <20250124032502.nj25mu5mko36qjaq@vireshk-i7>
References: <236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org>
 <CAJZ5v0gz2WLtwJca5oAgZ23C+UmX18k9fvCbzRAEV6zZL4jiiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gz2WLtwJca5oAgZ23C+UmX18k9fvCbzRAEV6zZL4jiiQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_192509_003166_31B1A551 
X-CRM114-Status: GOOD (  13.42  )
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

On 23-01-25, 20:48, Rafael J. Wysocki wrote:
> On Wed, Jan 22, 2025 at 7:06 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > The driver generates following warning when regulator support isn't
> > enabled in the kernel. Fix it.
> >
> >    drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
> > >> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' set but not used [-Wunused-but-set-variable]
> >       55 |         unsigned int old_freq, new_freq;
> >          |                      ^~~~~~~~
> > >> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set but not used [-Wunused-but-set-variable]
> >       54 |         struct s3c64xx_dvfs *dvfs;
> >          |                              ^~~~
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@intel.com/
> > Cc: <stable@vger.kernel.org> # v5.4+
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V2: Move s3c64xx_dvfs_table too inside ifdef.
> 
> Applied as 6.14-rc material.

Thanks.

-- 
viresh

