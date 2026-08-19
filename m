Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA1CC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+PPr4LH5JCo56T4OEcpqKtA6FqaZJJQTU/xNmje3fk=; b=iI/NFU/fzbvyjB+fIXZSk7IQCo
	0NHxCaAjhiuKs7LkOU++aV36jiq2y9AvgkAUsJbT0sFT2fKqkhc2s4m4QbJxtqaC5KrPMyVyylDjQ
	HzW6rxOfze6YI8/AbC4cjCI/wBhbn8RVDiyPZY9GrXV8L8271aV7qlZMbKjCIfk9HhnoxxE1Qybjo
	PEFDLev7xOANT+ipLMCjLzzl4vn3YFyFVXSNVf+e3WSWDOwmivrp9QqK4N4HWylbnkAtXjlvaIvlD
	b0HsnhHrIZHxy/U8lOKDD3Uovg0kMj2CQj7TbDQ9q6I7zQGvRalKNwFsJA35TdaxS5fF20H1qxplb
	Fq2sRFzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdGR-00000009UH8-35Pn;
	Wed, 19 Aug 2026 10:11:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdGO-00000009UGS-3Vj6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:11:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB328153B;
	Wed, 19 Aug 2026 03:11:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44BC3F66F;
	Wed, 19 Aug 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787134274; bh=jm2HpTC8cEcs53XkB4cm7S5Wv9tNGZLKt6fDNOQqogY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFJe1ZuJ+f8GRxdAgY8srN1RiSC4v2YvCNlLlmUtqGq0JnBUN5kBgYHgAdtl1+WBE
	 86jkDS1YRlLddNDdfgMKb3RVjJvd/DDlHtSCIqjgjuwU2N63jNz2qDHOX98sxoLboM
	 FHd7s/Mzcrg9P/Q3NGrRDdX07qr9iwtrz3o25+oI=
Date: Wed, 19 Aug 2026 11:11:09 +0100
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
Subject: Re: [PATCH 17/18] arm64: Permit onlining of HVO-incompatible late
 CPUs if HVO is not in use
Message-ID: <aoWBPU9XKmKjfLnb@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-18-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-18-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031117_032545_60834834 
X-CRM114-Status: GOOD (  14.15  )
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

On Wed, Jul 08, 2026 at 03:11:27AM +0000, James Houghton wrote:
> First, HVO must have ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU so that
> incompatible CPUs can be onlined if HVO is not in use. The
> late_cpu_enable() callback is used to check if HVO is truly in use.
> 
> If the late CPU is incompatible with HVO and HVO is *not* in use, HVO
> becomes permanently disabled.
> 
> If the late CPU is incompatible with HVO and HVO *is* in use, the CPU
> is not onlined.

I haven't looked in detail at the logic here but do we actually care
about this? We still need to solve the BBML2 requirement around patches
12 and 13. BBML2 won't be an optionally late feature for other reasons,
so such CPUs won't be allowed. This leaves us with HW AF. In mainline,
the check is done on the sanitised regs but IIRC these can still be
overridden on late CPU onlining with a warning. We only use this check
as an optimisation, so not an issue in mainline but can be come
problematic with HVO.

If we don't have a strong use-case for mismatched HAFDBS support, I'd
drop these last patches for now.

-- 
Catalin

