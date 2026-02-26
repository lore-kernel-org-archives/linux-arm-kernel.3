Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA406FD8FF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWH/kDG7md+tsneNAylFn9Bxm9uMN0EIh6KjysI+BZk=; b=fUE4D3IlQuRNtiag41Cvy6xDw+
	WKxL7Z+WqOAdCPH3WhxB3EYBQBFKTzoyipfHSY3Y4tZX6SbqhCY9pCwAL71oVrGbvwi7RvZSUXF7N
	94gV/I5F28jfmrubW17A2RENvcZJzbthdLwyAgAX8AVS22ZpPqbc2wCxcqKE0NjzOam+nyaZuO1GJ
	GyDOU7PadMTkDp5RHv2gv1SB+bUl86ljAiZUCUc77llJ79/jHGwloSD5WrdejhiQec9pYqJoM+HPp
	Xi5V8Id5Z4BYWwsurxG5vpzRZjSvhL7trkexYRniuGocBj2KdVPMLzaibgD5UgnwztGtcS91usyl2
	W7b2dssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgs3-000000072g2-03gJ;
	Thu, 26 Feb 2026 19:17:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgs1-000000072fr-15It
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 19:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E99F560054;
	Thu, 26 Feb 2026 19:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A47FC116C6;
	Thu, 26 Feb 2026 19:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133475;
	bh=1/1uwe9eA7NtN9/U2pHcOI99ZHFGOjJJq3owXC2u3jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/6Lp2q86qkmiRZJrNXZy2atYc+WEZNmQCTsH/aJHJK5u3reuAIiDjFNMzhkpvHkg
	 XT1+aZ5jWWJlqnsvmpbmpHhwze0Ko5H4pSAYXVvR6h51wmj7Acu1hvVbi2ajZeAbmE
	 +Bd+EvoBfaFq2BhilqlaiSfId0sGNMVM/rBiAZdlfhapzMShWL7EZbj3MHtQMeqX/O
	 fvl1s/Ai2cxl0UokSF7oOAxm5ZY6eaj16jHyWYSxo3IHzfl7kBJ3HtYsQCtn8CKaDm
	 zOMSa8A/c00FYp/xbSenDai54/ta/s0tHHy6QigcmQTm+ej37d5lKcr/+yzetPZbIJ
	 XWavBG1KO+oJQ==
Date: Thu, 26 Feb 2026 19:17:51 +0000
From: Will Deacon <will@kernel.org>
To: Reda CHERKAOUI <redacherkaoui67@gmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64/mm: avoid max_pinned_asids underflow
Message-ID: <aaCcX7yhp3Br0M4j@willie-the-truck>
References: <20260219123007.9101-1-redacherkaoui67@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219123007.9101-1-redacherkaoui67@gmail.com>
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

On Thu, Feb 19, 2026 at 12:30:07PM +0000, Reda CHERKAOUI wrote:
> Signed-off-by: Reda CHERKAOUI <redacherkaoui67@gmail.com>

Please add a commit message.

>  arch/arm64/mm/context.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 74c1ece7db78..fdcee1127954 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -386,11 +386,7 @@ static int asids_update_limit(void)
>  		if (pinned_asid_map)
>  			set_kpti_asid_bits(pinned_asid_map);
>  	}
> -	/*
> -	 * Expect allocation after rollover to fail if we don't have at least
> -	 * one more ASID than CPUs. ASID #0 is reserved for init_mm.
> -	 */

Why remove this comment?

> -	WARN_ON(num_available_asids - 1 <= num_possible_cpus());
> +
>  	pr_info("ASID allocator initialised with %lu entries\n",
>  		num_available_asids);
>  
> @@ -399,7 +395,11 @@ static int asids_update_limit(void)
>  	 * even if all CPUs have a reserved ASID and the maximum number of ASIDs
>  	 * are pinned, there still is at least one empty slot in the ASID map.
>  	 */
> -	max_pinned_asids = num_available_asids - num_possible_cpus() - 2;
> +	if (WARN_ON(num_available_asids <= num_possible_cpus() + 2))
> +		max_pinned_asids = 0;
> +	else
> +		max_pinned_asids = num_available_asids - num_possible_cpus() - 2;

How about something like the below instead?

Will

--->8

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index b2ac06246327..94cffda52e4c 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -380,20 +380,23 @@ static int asids_update_limit(void)
 		if (pinned_asid_map)
 			set_kpti_asid_bits(pinned_asid_map);
 	}
+
 	/*
 	 * Expect allocation after rollover to fail if we don't have at least
 	 * one more ASID than CPUs. ASID #0 is reserved for init_mm.
 	 */
-	WARN_ON(num_available_asids - 1 <= num_possible_cpus());
+	if (!WARN_ON(num_available_asids - 1 <= num_possible_cpus())) {
+		/*
+		 * There must always be an ASID available after rollover. Ensure
+		 * that, even if all CPUs have a reserved ASID and the maximum
+		 * number of ASIDs are pinned, there still is at least one empty
+		 * slot in the ASID map.
+		 */
+		max_pinned_asids = num_available_asids - num_possible_cpus() - 2;
+	}
+
 	pr_info("ASID allocator initialised with %lu entries\n",
 		num_available_asids);
-
-	/*
-	 * There must always be an ASID available after rollover. Ensure that,
-	 * even if all CPUs have a reserved ASID and the maximum number of ASIDs
-	 * are pinned, there still is at least one empty slot in the ASID map.
-	 */
-	max_pinned_asids = num_available_asids - num_possible_cpus() - 2;
 	return 0;
 }
 arch_initcall(asids_update_limit);

