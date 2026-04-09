Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2051F31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xgavpk2uvmkTV5WY8Vis02tqmJPmbKPVocjIUxktA54=; b=gFwlc0YQOKmx2Sr6wlSSJNrAJY
	bxYZTgi2v96YxDJj3J/4RYdp5bQBOZGq6uzqiPj7A8mqcFjL4ymTLJmYOBTNoZoKSBFxl3QHDoylG
	WeJPPY1WYsoTFqr0nP07vAY863a9A0Zix//Tl8kFM1iqe+FXueTfD0n9gTFg/WOmdvF15WRQwGIGX
	/UTt++lr1M9N9iMx2Dls3cPf1DSc069Yi0pLpuRf5SPoz7VLDD0UJ2TzbD61Yis7dkKznXSJsS+mt
	oWa8+GUpq9vSQPabpDFAjfyjVEgEu9WrVVJWvFSuEuhW0UKDK52h1K7G1nwrGLezVi9qZ/M3TwSe9
	LxCNsBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqMe-0000000AhYV-2a06;
	Thu, 09 Apr 2026 14:28:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqMa-0000000AhY2-0RE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:28:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B88432BC4;
	Thu,  9 Apr 2026 07:28:00 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3C933F632;
	Thu,  9 Apr 2026 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775744886; bh=IoJNYfM+Mn+BFe5mjuehAoualrFBYvdI39XI+cuiCQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mnd/rLtUGdn8bdxWrAR8qG76OdAn4WsoEOoRZcDsUkwHptl5aN/fDFUHnW0trQUsT
	 taJuFzZsYTkMqyeHUcWCyUnQA6IArkpUvKlmvqih+ed3VgBadWWQ9MMcjUXpkG3IMB
	 2M4+XJodDtKkUOOf6pe2TWtuI0vdIAWJY6NPSddw=
Date: Thu, 9 Apr 2026 15:28:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 2/4] perf: Fix uninitialized bitfields in
 perf_clear_branch_entry_bitfields()
Message-ID: <20260409142803.GS356832@e132581.arm.com>
References: <20260318171706.2840512-1-puranjay@kernel.org>
 <20260318171706.2840512-3-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318171706.2840512-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_072808_259630_376F3D26 
X-CRM114-Status: GOOD (  20.80  )
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

On Wed, Mar 18, 2026 at 10:16:56AM -0700, Puranjay Mohan wrote:
> perf_clear_branch_entry_bitfields() zeroes individual bitfields of struct
> perf_branch_entry but misses the new_type (4 bits) and priv (3 bits)
> fields. This means any code path that relies on this function to produce
> a clean entry may expose stale or uninitialised data in these fields to
> userspace.
> 
> The function was introduced by commit bfe4daf850f4 ("perf/core: Add
> perf_clear_branch_entry_bitfields() helper") specifically to "centralize
> the initialization to avoid missing a field in case more are added."
> Unfortunately, the commits that later added new_type and priv to struct
> perf_branch_entry only updated the UAPI header and did not update this
> clearing function.
> 
> Zero new_type and priv alongside the other bitfields.
> 
> Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
> Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  include/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..d7f39b7e9cda 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1481,6 +1481,8 @@ static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *b
>  	br->cycles	= 0;
>  	br->type	= 0;
>  	br->spec	= PERF_BR_SPEC_NA;
> +	br->new_type	= 0;
> +	br->priv	= 0;
>  	br->reserved	= 0;
>  }

We already know this does not work well. Instead, we can define a union
for bitfield and use memset to clear it, later we will not bother for
this kind of issue anymore.

  struct perf_branch_entry {
          ...
  
          union {
                  struct {
                          __u64   mispred   :  1, /* target mispredicted */
                                  predicted :  1, /* target predicted */
                                  ...
                                  reserved  : 31;
                  };
                  __u64 bitfields;
          };
  };

static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
{
        memset(&br->bitfields, 0, sizeof(br->bitfields));
}

Thanks,
Leo

