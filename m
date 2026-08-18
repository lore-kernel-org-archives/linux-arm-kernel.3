Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BD9C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ln7Mczd79sZi5QwsaLE9jqFE0MNCEuo9MspZyFqDHr0=; b=uYzFPVi9mAKr+wf9LojCcmUnWQ
	+k/hNTQByrPSDOQ/2uVTHW1tQnKnLpPuv9uAsVty6BJhmH2uWjooXNuDHHrJrq9dMquX3SnWczQAm
	sS79hLY2LhAnSPIMrCy7kFFhvYuBpJdHSqAbt6Ydb8hmdN7jsojSShqZYWHt5YBMjHABlT5pt2CQK
	xktGPdasJnHLpq+nNiR0+9h9u8MfdELewbZoVzRn6EprsUrdy0SXZktpE+YfFhkNO1appgYqGnuMG
	eGD+UVWlBtesmYMTUu/oMzW/XjwTvShUlRQh5uBEdcuTmPhR48QZXd4rZSttc7XOLLC6aJLlwH/I0
	ddHeM7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKTr-000000085r1-0nS5;
	Tue, 18 Aug 2026 14:07:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKTn-000000085q0-1yPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:07:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44278152B;
	Tue, 18 Aug 2026 07:07:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187C43F85F;
	Tue, 18 Aug 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062070; bh=XYnpofG5ApFYBdgBh7eiqhDJLh9ipL/B1jlA8wAAIas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlQrt93omVnNUGW5AJAWkmrhdAxdJUeYlENyL9uf3jbP9mEjIJbPbVHtQ8AbK/8XQ
	 qBdKSDBteuuzyBA4Km/Yh2uL4pt+s6L1zOxsmN2ydh8aCItQsF1z7h81P3Gf7S8WvB
	 wrjfJAgW8ba8u3QAJm4YaQLsE0ncWlqwcTgwpqOg=
Date: Tue, 18 Aug 2026 15:07:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 07/18] arm64: Add system_supports_hvo
Message-ID: <aoRnMRZ0jE0ycwcT@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-8-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-8-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_070751_551024_AE70A99C 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Jul 08, 2026 at 03:11:17AM +0000, James Houghton wrote:
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 25c61cda901c..6db3ef827f86 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -75,6 +75,8 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
>  	case ARM64_HAS_LSUI:
>  		return IS_ENABLED(CONFIG_ARM64_LSUI);
> +	case ARM64_HVO_COMPATIBLE:
> +		return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
>  	}

We shouldn't use HVO, a software feature, as a CPU capability name, even
if it's called HVO_COMPATIBLE. Maybe we can come up with a hardware
related name, e.g. BBM_THROUGH_AF.

> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..3b9224b99a5f 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2172,6 +2172,16 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
>  	return cpu_supports_bbml2_noabort();
>  }
>  
> +static bool hvo_compatible(const struct arm64_cpu_capabilities *caps, int scope)
> +{
> +	/*
> +	 * We need BBML2 to support Block -> Table transitions without taking
> +	 * faults, and we need HW AF support to support changing the OA without
> +	 * taking faults.
> +	 */
> +	return cpu_supports_bbml2_noabort() && supports_hw_af(scope);
> +}

I think this is wrong. cpu_supports_bbml2_noabort() only checks the
current CPU while hvo_compatible() will be run once on the sanitised
register values (SCOPE_SYSTEM). I should be something like:

	cpus_have_cap(ARM64_HAS_BBML2_NOABORT) && supports_hw_af(scope)

-- 
Catalin

