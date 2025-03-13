Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC40C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYxlmv810ezcplIPoQtIO8dfhKLPRYFog6EoMaT+7UQ=; b=YjnC0M+A91D8AHopbvzt7XZv/J
	KALQQ3MRncQJ4dHuP9Sre2j9raFhoRXT2+LUcElWasltEwTdN2uri3TST0grAJ4NTkIha/TALcNs8
	a/GoEqZxr5yD6lqPRhaTNw+Mb3b3dMStoeyxSM7HB4SPBComh3oI1h7lYUaY68fXDShBdz0d4aVCM
	dd/RGEbbTh5pviP2Wooc3pHDZNA/w6kT1gbqK/+3RfUI4nKp7P7iuGpvOFmA6ZIDmixdRFawe/Ra5
	MNvc7y1N5N58n6rhvEl1/n9xvpkIs4YgUr4fpP1Ol1boMQ0Mi04bzp2wJp7dg5ig7auJf1kSielDQ
	lEN7cdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnfs-0000000CEYh-29Zq;
	Thu, 13 Mar 2025 18:52:56 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn37-0000000C9or-1Qfo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:12:54 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so183552766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 11:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741889572; x=1742494372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYxlmv810ezcplIPoQtIO8dfhKLPRYFog6EoMaT+7UQ=;
        b=iFwiUBl0QAlMxNznW/6XEm07Yp5s5CSD+8UX3wHWEGGrsT1lRq72DDoQr4wggCwtwh
         dDSKFIeI6NhIvmXotfWDuYceCpogDGWPVqgvgXKAk0C4QfgLcW2jhr2crCrVCVsgEhbd
         BM7b7P6QeUANAk4YFDNbuqCT3yTS735CYLhWZ5HrSKWuoeRRRoSLwFHJt/c43J3MQJO1
         EqHNTz65rhvI8MCLdTihz7ClYvuZhIyZUolN5+/2GokL/3U/pUxx1Tum0H7QJobvJoCo
         WppRffETVyPPATQsDYJZWfnr955o70nUZWgTVZhYBTZTZ60XVt00rsXi9vB+BiivyCJq
         o5KA==
X-Gm-Message-State: AOJu0YwuNzdvuKMP5pyhTHnQA5WXwOf+M9N7Tg3Au/YJYS7O4erxvJ4Z
	SyYEAi/p/mmj0YkFkkKpiO8jfJlroVLUO34hdLL8qy6x+yfRr/Vv
X-Gm-Gg: ASbGncugpHd4E8pyTwsU6x69LYP35DWvCITOwV90r7ICoJp5+Uzvv8zBGzyDgWcuVcW
	R92293WEdpOP22T6z7u82iv5fJgpc9mHed9WMcVlNdmokSLBY5mqpRt/BxgazLrD6vcqYQSzOGC
	8fc8EUXdaLebFV6WgC8NpXn+G2jgxQyYUq86VJTg4JD6QMswiQBXYlQegOckxrNj1DxzN+4zp7a
	wwfqQjg/LBRnHOgiK2IsKIzP4awI28dNH/WfFpV8+EvAXG4NPcxskDOtI3rRwSPnkUbqXJ6475J
	CLqyvLNQlaS6//DT4YNCSvWa7jJcm4QRssTcTni3ozM8OQ==
X-Google-Smtp-Source: AGHT+IEIROBjcQc5+N5Ug6gFEtowlLLgmIvSl5IlxYNgNSYZ+MT7JS4kaQNvmVgwY2CUORVYXQi9zQ==
X-Received: by 2002:a17:906:59a1:b0:ac3:aa7:fa07 with SMTP id a640c23a62f3a-ac30aa7fbd8mr405245766b.44.1741889571403;
        Thu, 13 Mar 2025 11:12:51 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a4856csm107427266b.156.2025.03.13.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:12:50 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:12:48 -0700
From: Breno Leitao <leitao@debian.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <20250313-angelic-coral-giraffe-dfa4f3@leitao>
References: <20250308012742.3208215-1-song@kernel.org>
 <20250308012742.3208215-2-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308012742.3208215-2-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_111253_380215_F1DCFA2B 
X-CRM114-Status: GOOD (  16.42  )
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

On Fri, Mar 07, 2025 at 05:27:41PM -0800, Song Liu wrote:
> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> This version has been inspired by Weinan Liu's patch [1].
> 
> [1] https://lore.kernel.org/live-patching/20250127213310.2496133-7-wnliu@google.com/
> Signed-off-by: Song Liu <song@kernel.org>

Tested-by: Breno Leitao <leitao@debian.org>

>  arch/arm64/Kconfig                         |  2 +-
>  arch/arm64/include/asm/stacktrace/common.h |  1 +
>  arch/arm64/kernel/stacktrace.c             | 44 +++++++++++++++++++++-
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 940343beb3d4..ed4f7bf4a879 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -275,6 +275,7 @@ config ARM64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
> +	select HAVE_RELIABLE_STACKTRACE

Can we really mark this is reliable stacktrace?  I am wondering
if we need an intermediate state (potentially reliable stacktrace?)
until we have a fully reliable stack unwinder.

Thanks for working on it.
--breno

