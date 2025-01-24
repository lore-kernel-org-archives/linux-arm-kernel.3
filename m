Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A080DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 03:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YtHwD+3ED5cGp9BL5t1b6GReiZ2l6fBPO+RUUjVzlU=; b=TOPTCWORQ6m9NECjFyga9dJYXo
	K4oBJQYlhovd0cDQLDBda+sYna1Q9C/q8zfR1fnJz2J++CfjjM4fDWqod/Qkd+aYXUYpxmGiRRpwP
	Rlwod7dlujzvW1GCoh+dgwnOZdyyxKy3S+eaYd7KPb/noeqkvA6onY6WZS/HW8cv/7BI5eKqGA3Ys
	kl1s5oNau+11VUQxsy9o6ta9NCcf9PFCGq0B7d226hI/Ig8HzEy5US0ed+vkee0I0ymaV19tIaSu0
	x8fBmHu1f7iKCbmrXE/SrjYHsIVgRfkIzxxF4Ehu6zQ2tfTzSFW79nQTYRCeB3NfRJ6Xx2HNMTyzs
	MvAW10sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbANn-0000000DoZC-06dO;
	Fri, 24 Jan 2025 03:29:23 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAMU-0000000DoRJ-2pYb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 03:28:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso3060259a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689282; x=1738294082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YtHwD+3ED5cGp9BL5t1b6GReiZ2l6fBPO+RUUjVzlU=;
        b=OTL6l1USr1BU0QW41JZnViVzWwRhh29J54T4mLvsa1BplmA+iROcCJCU+PLbnSUZSz
         bqUlw/KMEIGas1LXQ6XyvIiNxIhFHHsInlcvWdnGSYj1FzEqXeGwTUpjce1l0Afc6u/Q
         GwT9ir/iglENsWX39xp90lhnksPWnwCioN57QjkFchAkAbr4ZHkzT7Z4Cc0Mvh3tIIRD
         jl3YJ+K3Ovu8HHYYQnJUBUA3Ggd2XLCVXFaA10Kq0sphknuqC1M6etMCSwFlomAlpC21
         AWTF6zBHO9tjUyCOctiEtHai9euSMsLTiLjg4ZV07Hsz5CZqXnki8ZPEY0CR39aSZ6ST
         Gr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689282; x=1738294082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YtHwD+3ED5cGp9BL5t1b6GReiZ2l6fBPO+RUUjVzlU=;
        b=wUzn4ORVWsfB/p41Dl6N0/9ytookQp9/c3GmqE2vC8gAf92DdPyfTQYRevNkPR8YNz
         DQ+6M43NRgCEVaY6cVGkoJYNs+gl8fXQ2rrIvmzvYFbRjqgk/Rv7iFPTyLMlV0tb4PIr
         UvniLTrPewh82j0+QeKL921pROd9kpggWpxDJP1pup3YYCIU7E4Xab1RqfUrF7CDyAQX
         YH7jGRyxpFrgKsnhl7m51SLNYShWfIeAB+oMOanJUy7EXyCTbYzWqzQEOvYLtwDj/1XZ
         HImXE+hIVEAMawx2GCCIOO2UQ+kL0mDLviUjY8nZWanHRxHB7AYo2IpfZqItW6uGkmtk
         Wb9g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3t1EbxppEq9AdQO/L9g77DEeIeXAgSsTMEPrP6R7LeTWN9jSfML4Uiuko49uhJsxF7zaokwp8oOnk/ysLn2C@lists.infradead.org
X-Gm-Message-State: AOJu0YzjP/67Vj7knaN9p60LU3ISVvTadgLkg2ZjeVZ4BY0f91a4sOJf
	i7RhfEP65eIShhD/V+6jejQwJpOI3STwjoBqXOaPwLJUhoNAZWp8WIvGJJlqZ/w=
X-Gm-Gg: ASbGncvAfs8gaKPekr+DEyJohj/GFp6Tb5NAB+04sL3msVnc1fWrvbTmDHbeKgFe9rJ
	B22G54JG1C5ngBOmvSc9HFIGJ0G8u39UY1di0oF5OBYHLdMw2GlGPu0fOoNXn0q1rSvMFJEULy1
	mta5T+cb/WbFqidFq41rrSWakf62TvnwoR37nyQr+YLfBzlpzSZMKIRJl5gMOOkd8lMDyUpjBPb
	IbRnc5hYupce3Dq7ONvDc+4RMy52ai9UNp4egKb08TaDL0eenYRdsxNzrISSpk/BnMsux3NFXS3
	k72i5RI=
X-Google-Smtp-Source: AGHT+IEjcYLFKFT/4zjAgtn0Ur09jWOBQWRSc3NOeyRishuwgqWAN1BJw6YRpnHk99tT5Mt/zypi9A==
X-Received: by 2002:a17:90b:2cc3:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2f782c628ddmr46198761a91.7.1737689281866;
        Thu, 23 Jan 2025 19:28:01 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa76ebdsm514831a91.34.2025.01.23.19.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:28:01 -0800 (PST)
Date: Fri, 24 Jan 2025 08:57:59 +0530
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
Subject: Re: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250124032759.zo5l7pvdlfttyu5y@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-3-beata.michalska@arm.com>
 <20250121105355.sdrgmjv2w2256qfn@vireshk-i7>
 <Z4-6bsDzfe9CLcVf@arm.com>
 <20250122060902.5pgfr5g24jpjrxw3@vireshk-i7>
 <Z5K42yXtcDSZGuUF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5K42yXtcDSZGuUF@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_192802_714800_D92E7920 
X-CRM114-Status: UNSURE (   8.37  )
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

On 23-01-25, 22:47, Beata Michalska wrote:
> Do you mean the new config option? If so, it is in Kconfig.x86 already.
> Unless you have smth else in mind ?

Its good then :)

-- 
viresh

