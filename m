Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1371E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 04:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr3GeSntlHloZ4yayQx6BsNSKnwpryezH5Wr5AEdqz8=; b=o4egUftCqe3Kdd8j9GZlBOFfvw
	1bbKnW0t63gVFI6YA213w3hqCy0ZpPL6mo2R51vfts58bWxLBtutO2U+ACaTnu++CIlXsnckDPxV5
	euyjj5oAVWbIProkgRzHdMvN6dTb/mx8hnHvsZFCOsgc3vSS1v3Qg+iKqSCG9erzFUzB5U9n7Tr3/
	MkFyk0TELK/TItgIlFd7CR+8zjaZgKwxJ8rYhvFurqKukZ4KfE3theLnidg+eq8UAHvfgmLyqrHv7
	DP9Z0AL4dyHBUmYXy7t6aI1zmnzW8z+BYZ8mKYS7VZ6eOjagxXFR98T2hNWCCzmSa//MsCj21uUAM
	WQAp75LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPCJ-0000000C9U5-0Q3U;
	Tue, 17 Dec 2024 04:28:39 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPBD-0000000C9KI-2Gla
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 04:27:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so4371324a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734409649; x=1735014449; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr3GeSntlHloZ4yayQx6BsNSKnwpryezH5Wr5AEdqz8=;
        b=RkHMHRdbm+9spb6hjDAzCOoskkFQdkLEBi7LoCRNqF9UBBBP8VDLpOp//qXT9J525B
         hrkgnpfwGCfIVip626g22v0rXdrlhpPKatJrGSdAzmNDswGblpL+nlzsEZFZphX2SjTW
         kqhgb8MtEmwN0ATiFID9Wv7Rg2qyWYumPU+r1RcZKHzMUGw68HhetxiITgB3frLj25sz
         fGuctRqg5Xh75R8lmPKUWjomz6XaN4PWjx4vlzeeM580uSyTgZorciFqfIEzzm9k7aIh
         lzVOrZY+PYELnpMuX94GEqEB0IbXWudbed3lm6MNOedDc9vU9lhU16iseV1XGutcF0Ye
         0Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734409649; x=1735014449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr3GeSntlHloZ4yayQx6BsNSKnwpryezH5Wr5AEdqz8=;
        b=GWP8PvuWlbarpBaK8DPhvNZlKBeufesFoE9IkPYNpFtt8kJh7Kso+R4lRYvYnZbMiL
         nIjtgDt/aFEhRbuc1DoiDlPXyALjMtJgjLeBgv3yqz6857OQfo+5nEGyEQLj2HysKVcg
         FISp8ntpIzgqhcRi8Dn6GzMKUZ9MU2nex/rC5ph+igU+NQU5ID5UkKpxYQXAQflIWvZ1
         7lA4BAZ2enub/qdjRIODvtNTnaMAkTIVVpuOFaLz0Jpzrj0VP8k77NJqoxLp/mdJy+JX
         M4Yl3q2h6AJcjwQP9wCpSREOTLojB5XeYeDbc5XPpl+jiQDVzuRkv3PJwEay4WXrvZtI
         9G7A==
X-Forwarded-Encrypted: i=1; AJvYcCVR4Ng0SIGV/QfgqZJ6YUTZt1jSgxbzQuBOgiwU64133IY3yVGBjEpe/YDf3VjknillEwBAlH0zV5k/4KugDHaK@lists.infradead.org
X-Gm-Message-State: AOJu0YxsgTbip9Qk5saGXMrjs8+dooPpJr1fXwvLeyW/fBCBAj+NcufS
	5mV1FCPcjc0WTmUHjNfAjp5kCDGcTsONDAytJ5YqMYkNeBD+H3L64DNuaWmJYQM=
X-Gm-Gg: ASbGnctsfy+sPXNYO3CRkV8LKI8SBBzBiGYUQeBnVsmGoRqtZctSumtyeU1s/ZcVVwo
	AgABpfWLkq78o723Dwbz0SJW6+82jkAFaE2LvwRF1oTtWdxQIbjum9cari/vEJ2KcIOy1eYc1DD
	S/MV87Cm6PgPccXHR3mTRHz0lsGmJK2q10FTIrDib788DMaq3NZvQaS250QjrD4L4nCRENEDPt+
	Emo8kQF4EAAyGsZKltqFzBzx56P4ilDEhwlWawLNZ6aqYSExvg3tVCtGEM=
X-Google-Smtp-Source: AGHT+IE/JeMuR4dBQFhr2ewi062MYvFxM7gFUf/kYOjekW7K8q6et1llylqaVQeIxsiURZEwVjKeIQ==
X-Received: by 2002:a17:90b:2e48:b0:2ee:6736:8512 with SMTP id 98e67ed59e1d1-2f28fb6f983mr28756658a91.12.1734409649481;
        Mon, 16 Dec 2024 20:27:29 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142d90d45sm9072765a91.11.2024.12.16.20.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 20:27:28 -0800 (PST)
Date: Tue, 17 Dec 2024 09:57:26 +0530
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
Message-ID: <20241217042726.isllh5bulpnwql7i@vireshk-i7>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
 <Z2CmcelSy89NULtz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2CmcelSy89NULtz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_202731_583172_EC9D5146 
X-CRM114-Status: GOOD (  15.77  )
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

On 16-12-24, 23:15, Beata Michalska wrote:
> My bad as I must have misinterpreted that message. Although I am not entirely
> sure why this might be unacceptable as it is not such uncommon approach to use
> signed int space to cover both: expected positive value as well as potential
> error code case failure.

This part is fine. The problem is with handling frequency here. Signed int can
capture up to 2 GHz of freq, where as unsigned int can capture up to 4 GHz and
so we would really like to keep it at 4 GHz..

Maybe we need to move to 64 bits for frequency at some point of time, but at
least we should try to not break it for now.

> Enabling the new attribute for all is an option, tough not entirely compelling
> one as exposing a feature that is known not to be supported seems bit
> counterintuitive. On the other hand using cpufreq driver flags won't help much
> as the support for the new attrib is platform-specific, not driver-specific.

-- 
viresh

