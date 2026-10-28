Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34741606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjkwRGph;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EceVUvxL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mzc7Hanv0CDK4THhGHtewy5AYoBUPo6jlbuGdSqeuHA=; b=jjkwRGphLnH4RcDFvKmHMY73rM
	lKWh53ZsVHuJ8Bs21yI+N/baexRDgFA30S9bEIBrpOqN2jLHTQD/d4JzkDEBRughtG3iLqEym4LVe
	obNbu7lrJV1UaBDlUtnkv4Bc9Q6yZ0DSYKrVkknOU03vdqbrOPI52aFInLzv86Bc6d4XqZWPJAeak
	JehyHufjj0RUhYHB30Th7sujos+pbs/0brqBTYyrMlHdbCGDzBDNu2XwjR7w6bU2J2HD5/c63TFap
	orCSBIj8AdvlUpZhR9RtwPi6cbnXs7et2dnAoLAQEQJIx/dYcvOq5CTtNGQB3AdxZpVjoHPes4wZF
	JAtSNf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM794-00000007dYy-1Fps;
	Wed, 28 Oct 2026 17:09:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM793-00000007dYX-2Bdj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:09:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73ADD600C8;
	Wed, 28 Oct 2026 17:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17901F01828;
	Wed, 28 Oct 2026 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793207340;
	bh=mzc7Hanv0CDK4THhGHtewy5AYoBUPo6jlbuGdSqeuHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EceVUvxL1OnZids3GRqeq1btRudotGLxGnTzu4CsVMZohND9PtMu9iepxejI6Lc4e
	 lCb+8Gpj01vLylCaE8zNKBJpXIXHsq8qJkTbTCuptNXWEyA7zDptDe1LKby7gYWd+U
	 5pNOxKOAOcEGtsuqqVSOGWGRKrlDwlSrlfvaAfWUMg+Df399cbWJPxKeiRU9M6em+3
	 YT4JnocZn3WzwtlbylfValFVt7mnMvqooGXe7CuDLeahKeCebD01bLSFFfhq+la3dv
	 nkl6EQigdTw4PjDi+Wp+Pdd5BkI5DtlSMnt+fUDuONmDt2aat+HgAm3JXLIi4ChCp5
	 X7T1w9wWUe4eA==
Date: Wed, 28 Oct 2026 19:08:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] memblock: Introduce MEMBLOCK_PTEMAP
Message-ID: <auIsIp-nKJokYmry@kernel.org>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <20260921110050.3977591-2-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921110050.3977591-2-vdonnefort@google.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Sep 21, 2026 at 12:00:43PM +0100, Vincent Donnefort wrote:
> Keeping PTE-level mappings is interesting on some architectures as it
> allows mapping/unmapping pages from the kernel direct map without the
> risk of splitting blocks which, under the break-before-make rule, may
> trigger page-faults the kernel can't handle.

Let's be honest, it's arm64 :)
 
I believe that some powerpc variants could use this too, but they don't
have break-before-make, so either "some architectures" or
"break-before-make" should be rephrased.

> However, mapping the entire direct map at PTE-level is costly. So
> instead, create a new memblock flag MEMBLOCK_PTEMAP to selectively apply
> a PTE-level mapping.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  include/linux/memblock.h | 18 ++++++++++++++++++
>  mm/memblock.c            | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index aa845f488327..13263055996d 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h

...

> @@ -285,8 +289,16 @@ static inline bool memblock_is_mirror(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_MIRROR;
>  }
>  
> +static inline void memblock_warn_invalid_map_flags(struct memblock_region *m)
> +{
> +	enum memblock_flags map_flags = MEMBLOCK_NOMAP | MEMBLOCK_PTEMAP;
> +
> +	WARN_ON_ONCE((m->flags & map_flags) == map_flags);
> +}
> +
>  static inline bool memblock_is_nomap(struct memblock_region *m)
>  {
> +	memblock_warn_invalid_map_flags(m);

I think it's better to check and warn when setting an incompatible flag
rather than when querying it.

>  	return m->flags & MEMBLOCK_NOMAP;
>  }

-- 
Sincerely yours,
Mike.

