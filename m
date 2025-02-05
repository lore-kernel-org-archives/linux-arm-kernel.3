Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F65EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 07:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=; b=IN5PEWreGEHLQidsxwLePKJO2a
	/Tpc54pmQnYTzeYvfrcJN4qIxWVardrDfJmWi3NcVhXcy94mkhj74rA9R+LIESy0tXPohFVXZRlRg
	m3IccIqsxvRvpZSTPJh6v7ZbYOD94aqt6yvmGTdpG+5Bt9sZOy+phwU+h+pziuxe+/ZvZ8C7GhZb3
	ZOL0XJUDTk+gRlDX8Xn/s6ZgGYjxDm9xn2HmtCOS/8zIRa5m336eTfMy497MuP911tEvxHtBORkts
	PP5Ck/jtaSu1/IbGsiIzCZMZ779Y5of0OWMTp+ggORBnTzfe7xrVxGJxi36wBzfId5FNjxLLYvqT5
	MYy4OUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZR5-00000002TWa-1dVG;
	Wed, 05 Feb 2025 07:02:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZPH-00000002TAb-2vMC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 07:01:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so1851843a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 23:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738738867; x=1739343667; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=;
        b=offyAg23RVZwUdEmA71XMjDmmcShP1Jfb5PKwiUpnxpbeAP0cKbwtfvsoACUej98O1
         RrGpPVmbS2W5HhEtHbQ6o2BIzN/oH+uQXbW6qnIr+vMpxkTHW8OFXL8Bt/DpxEyNEJ9x
         SYgd27wCRfkzRv/9oVojefP9UpsdJsjrrVZbXU9BMmpWQeBejH+8j1YBPLKCHlLCuCqW
         V6LurNRqADA79K/dub4cV9uSeRZnrnGDDxMPORXLFDbi9gj6R3gLDB+en5IiuJbbgaBH
         GSRmmqGumuGUmk4KwV3QdEPds+Yyt3fPyCFs6lnTnddQiznwek5aNuvserGpsRKZqjCj
         /lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738867; x=1739343667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=;
        b=MCHvo/zUJeeYrbf9dJrp/tlX7yZA94je/2EQHofgaIPq/SyW0mwVzqgeDduFa5Y3Kn
         1vTe7ZcNgpUzvpEvJQhv7ge8GENN4+6Jzc6Y48cbPb+jaSjyr4yLYKonF3u48dLWLEgR
         /UuNwEuMH209umzE02uYLyxrTpAfAl3WPTy7dLtpacWqdz5ACqhxx86P6AEt569TrbiP
         PEm44sHQrqClU075TOil/usIbGXMznFnWnWBbkSJwpo9SZwWjPyzJ8i5UoqaB+auW9mx
         kci0vOotOmncJzTMOkC3pstqmmiy4R8ty9lgSR3gWmVmmXXcwtEtN+jNDSN73Y0x8ANO
         XW2g==
X-Forwarded-Encrypted: i=1; AJvYcCX7Yg3U/pwK3A/xYUAoxigBNXu5tlz4tAt8koM3FLhOW3Sa8oBvQW8LZm4X6YAPuKorEuEs1qWuyE8gxfg3RAFP@lists.infradead.org
X-Gm-Message-State: AOJu0YycO0oWypXwgMM3CiqihZYVEppsXN+kt0F5x4+CrF6XiXhhqFWy
	wbuLPahAdKaAVObSqlPDM19LPmUxVg/2wDarKymORpNPnK68g8Y9Cj6G5jDQHUA=
X-Gm-Gg: ASbGncsOuN7ZEykqAyGKvUKxJifRfTcCQSeMFLmDER4VrpCh36uEaMCSFzMO3KDTltw
	BgA0FakGBdItG1IMspIaSYaKn9yr9AtOQ1/nVapH5eQJy74SvVMqMS23xQ8E8KazfpTxiAW5Q/T
	6n5iWpddhSgY0xs6db642Fzf/ed7XYJk8gUk0a60AwJYDFi7gvvMXAOLyQhg0XSly0PmE+4KLlQ
	fRXzJP2MPT1Mqv4K3tQ1RaURnLJ07RF8YlnXW8Aqe8cexeKNaEofig7lP74iJXg9xrENNGFKDUj
	5PJEku0w5C5018vLQg==
X-Google-Smtp-Source: AGHT+IEu7fqxtK7w5SoEhI6cbco/xUvu7X3eM4no2kX0m2LQwZj0KIS55DISe84WBXdk8tWZ91sBcg==
X-Received: by 2002:a17:90b:38c3:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f9e0792de0mr2925113a91.15.1738738866797;
        Tue, 04 Feb 2025 23:01:06 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1e4253bsm762453a91.49.2025.02.04.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:01:06 -0800 (PST)
Date: Wed, 5 Feb 2025 12:31:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250205070104.6k4n3zcyuki366am@vireshk-i7>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-3-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131162439.3843071-3-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_230107_765929_9F54B8EB 
X-CRM114-Status: GOOD (  20.72  )
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

On 31-01-25, 16:24, Beata Michalska wrote:
> Currently the CPUFreq core exposes two sysfs attributes that can be used
> to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> and scaling_cur_freq. Both provide slightly different view on the
> subject and they do come with their own drawbacks.
> 
> cpuinfo_cur_freq provides higher precision though at a cost of being
> rather expensive. Moreover, the information retrieved via this attribute
> is somewhat short lived as frequency can change at any point of time
> making it difficult to reason from.
> 
> scaling_cur_freq, on the other hand, tends to be less accurate but then
> the actual level of precision (and source of information) varies between
> architectures making it a bit ambiguous.
> 
> The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> distinct interface, exposing an average frequency of a given CPU(s), as
> reported by the hardware, over a time frame spanning no more than a few
> milliseconds. As it requires appropriate hardware support, this
> interface is optional.
> 
> Note that under the hood, the new attribute relies on the information
> provided by arch_freq_get_on_cpu, which, up to this point, has been
> feeding data for scaling_cur_freq attribute, being the source of
> ambiguity when it comes to interpretation. This has been amended by
> restoring the intended behavior for scaling_cur_freq, with a new
> dedicated config option to maintain status quo for those, who may need
> it.
> 
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: Dave Hansen <dave.hansen@linux.intel.com>
> CC: H. Peter Anvin <hpa@zytor.com>
> CC: Phil Auld <pauld@redhat.com>
> CC: x86@kernel.org
> CC: linux-doc@vger.kernel.org
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

