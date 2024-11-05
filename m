Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBDDD36119
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VutQcHafKKq0a8sDGRTz9KmWMJ24nBgA/V5M2QzbTQE=; b=WrUY++XECtWsGBNuU+mSXZUGe9
	XQ8Lbe0wFWG93QRbOdVomdgTPVUL5C30WNWYkE2BqRFdtthdtAy9X51wztb9C1rwR7xPG2PL5gE7J
	7lYKz6ZfUyGK7H2CqC4dPteiUvpcCnPEvivUg+9pRHMoeaLJAVqyNfg5umcUEP4lPQ3OLKl6krsEJ
	wzQZ6BSw3ldPUSMz9H2j3r9YdAqN8S3jM9ALqUnCdXCkxtS5lbRmzltQcIzAjJX3wkSR9PgHdkaug
	QjMky/E+cNLEpLGLUI7n4em8YT0G6dqnTVxLc+KsM0eq+9dFIsu8uX1R6QfKlxyi5LYuRVzAtdkqg
	+5H1tYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PXd-00000000bLC-0UEj;
	Tue, 05 Nov 2024 19:48:41 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PS8-00000000aKO-0N6h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1730835778;
	bh=GiOBrRt8u3pbme+9crDvgrAOmXf8UgUMxXKx4GcDPvs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GHRsJVARCyKaKjxinMOObYFMZjO81KYlxs89D/N6BdPi3basQCsKMRDj2mc+jpOl8
	 fHm9PAKJDm6cjsBwQ8+NERTkezcJsfkp0PIsOOc0k/4emMC3zBWfhG3a6DwU5LsYcl
	 KMpD3PlvL+RDM17VJR+3Q1x4CVKdVo59/pElhBAY=
Received: by gentwo.org (Postfix, from userid 1003)
	id D7D964027E; Tue,  5 Nov 2024 11:42:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id D59424026F;
	Tue,  5 Nov 2024 11:42:58 -0800 (PST)
Date: Tue, 5 Nov 2024 11:42:58 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Haris Okanovic <harisokn@amazon.com>
cc: ankur.a.arora@oracle.com, catalin.marinas@arm.com, 
    linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com, 
    rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org, 
    arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com, mtosatti@redhat.com, 
    sudeep.holla@arm.com, misono.tomohiro@fujitsu.com, maobibo@loongson.cn, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH 3/5] arm64: refactor delay() to enable polling for
 value
In-Reply-To: <20241105183041.1531976-4-harisokn@amazon.com>
Message-ID: <efd92a03-f5a9-ba9b-338f-b9a5ad93174f@gentwo.org>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com> <20241105183041.1531976-1-harisokn@amazon.com> <20241105183041.1531976-4-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_114300_535164_36518B31 
X-CRM114-Status: UNSURE (   7.88  )
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

On Tue, 5 Nov 2024, Haris Okanovic wrote:

> -#define USECS_TO_CYCLES(time_usecs)			\
> -	xloops_to_cycles((time_usecs) * 0x10C7UL)
> -
> -static inline unsigned long xloops_to_cycles(unsigned long xloops)
> +static inline u64 xloops_to_cycles(u64 xloops)
>  {
>  	return (xloops * loops_per_jiffy * HZ) >> 32;
>  }
>
> -void __delay(unsigned long cycles)
> +#define USECS_TO_XLOOPS(time_usecs) \
> +	((time_usecs) * 0x10C7UL)
> +
> +#define USECS_TO_CYCLES(time_usecs) \
> +	xloops_to_cycles(USECS_TO_XLOOPS(time_usecs))
> +


> +#define NSECS_TO_XLOOPS(time_nsecs) \
> +	((time_nsecs) * 0x10C7UL)

The constant here is the same value as for microseconds. If I remember
correctly its 5UL for nanoseconds.


