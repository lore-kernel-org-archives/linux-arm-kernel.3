Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30754E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P07CcM0j24rO5yaWfifB/LJiPYFjbC+FS5OWgIO/84s=; b=kqjXD6XVM9l5fvJhhD4q+p9WDf
	kjMD0JD2Pkm2r+QH/bTYq3J8hLrQiziHQdaK1myGqLdKzM5bObxanr5E7Dkaa08YQNWaigYpEMexA
	fBDjDk9Ym1BGOozciYnwWW1U+P399r8rt1SUMC3mAyqF+XvqbSfB8Uy/5NkUN+93D4QzgL+ykJACi
	FWOfTCh763dzmN9MCQN2mUj/7Dx+lc+Ge2R9U+hL4sFwvmSdBwA54juSCSSJC6ExvWpaWQWVwIPfj
	cqSqK4KZCZna7619/chNgwhwm67NkxXFnmUCGC7+TX5BZA1dBtr8ZNtM3Lt08UNWDIXawmVQnM24s
	Wb9XGs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUdW-0000000GEfw-3wdo;
	Wed, 11 Dec 2024 21:52:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUcT-0000000GEYb-1lRp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63E79A407D7;
	Wed, 11 Dec 2024 21:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74365C4CED2;
	Wed, 11 Dec 2024 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733953904;
	bh=cSH2O8frG5d2QiJhETKP8cWkp6z1/BXTqpOoUrUdmyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxZRUj9G5p/KTgkfBT+7j9WIScBKKoo85LkgLJSVu4/GMdiwVHuAnlOxd5ZYt4mzj
	 3Wi0qLaHcBZ1Ymfy5g3WMgB0u8KqnhpzE0YsIOPmuFraUZcZsMNTic429l4u7DASDZ
	 8Tt4aJCt8+K9qbNK2+cPGWQEbwARm7oZR6lO0LmM3ZDRsrsNBMAFml4MGPdQtyiVAh
	 N0a5zdqK0l1xDkf0Y7Yddfw6FqAou0lAK2yoCTOvR41lQpHC0MMSVbhpv0LL8D9dds
	 fyW2haBRcHnD7Oibmt1ahSSvV/SjEgq27SvvAMSc+FueZ+kMVXowNV7zsCWeSVkybA
	 mbItvsZQTdI4Q==
Date: Wed, 11 Dec 2024 21:51:40 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, ilkka@os.amperecomputing.com
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm-cmn: Permit more exhaustive groups
Message-ID: <20241211215139.GE17486@willie-the-truck>
References: <bdfd1e58dac449e407c5cacfd6bf8577dc0a5899.1733943898.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdfd1e58dac449e407c5cacfd6bf8577dc0a5899.1733943898.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_135145_520063_7C2E5704 
X-CRM114-Status: GOOD (  17.69  )
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

[+ Ilkka for comments/testing]

On Wed, Dec 11, 2024 at 07:04:58PM +0000, Robin Murphy wrote:
> The group validation logic still somewhat assumes the original CMN-600
> case of events counting globally, such that if one tries to group 9
> events where the first 8 target a single DTC domain, the 9th will be
> rejected because *a* DTC domain is full, even though it might only
> target other non-overlapping domains and thus still be schedulable.
> Improve matters by only counting the DTCs that the new event actually
> needs (as arm_cmn_val_add_event() was already clever enough to do).
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/arm-cmn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index edefb51ac90a..b49e353e10ab 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1779,8 +1779,8 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
>  		goto done;
>  	}
>  
> -	for (i = 0; i < CMN_MAX_DTCS; i++)
> -		if (val->dtc_count[i] == CMN_DT_NUM_COUNTERS)
> +	for_each_hw_dtc_idx(hw, dtc, idx)
> +		if (val->dtc_count[dtc] == CMN_DT_NUM_COUNTERS)
>  			goto done;
>  
>  	for_each_hw_dn(hw, dn, i) {
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

