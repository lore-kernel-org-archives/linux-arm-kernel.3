Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06811C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0dlg/OCZ/KvufmAUs7+NibuZAe4qcL98ZBaXdAOiso=; b=Cx3HVrLZlvKUD9c788pPdB7C8w
	P3syuTtwFc81z2TzvU9dL4k0l1pu7ME1husUaquN1nJNsJmnPMNdKQL/g5HkkR+6rFDx33R27ocoq
	BJsFnn7xtIh3behLI+Y/ZdWq3rhbIqCzr+fbsS2uEpD4Hw7eDLwNpXY3bROyVmxzOWUr22xOEc6Ze
	sMpHbRkoOHLaQwVhqMy1gyhgOcQbIy9+iJRWEAYy6UlwOCyhrG5qBlBiKytRespW4Fuxv3OXXOF50
	rIwbfqIc6dLqejwIQLHvjufdqe9zDitvsoXNRbVsGZC+XZ3UoW57I32EY4WbPX9z4WaMMg8AKM8kh
	MIewy37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ihs-00000005W17-47Vg;
	Sun, 06 Sep 2026 19:39:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ihs-00000005W0y-0xB6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 19:39:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25E51601F9;
	Sun,  6 Sep 2026 19:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625C61F00A3A;
	Sun,  6 Sep 2026 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788723550;
	bh=V0dlg/OCZ/KvufmAUs7+NibuZAe4qcL98ZBaXdAOiso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQNoTprdzIABHeaY8m1+qIYrChSBW4YR5g56ND0IDGxjVrUjtu75iXcCInOb1364I
	 +wTB43doqgMJLnfBYJoSskumSgUkqMuUSGSIyoiPPsV5IWdYEYUL+GqtDQkjrs8b/w
	 R6nDfbG6LsyEfVITroBVaYZCYKvjcF1I8vSvuQf2oWbg1ZiodwnpaEcX1THbxmnSe+
	 IHQQ7ZglbTz7DzRXjtIv6JDrqgE4UHHd8b9zAX216R+bHlW31/yMX2GKkwGDEUCJoJ
	 YO213e8leFhpd/Q0nqRYPJDTLfgotLWQBIY2H1TusP0BQqbzqo8eIUTF+jNybiPMEk
	 M4oRLiEK08ijQ==
Date: Sun, 6 Sep 2026 22:39:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/10] set_memory.h: Introduce
 can_set_direct_map_range()
Message-ID: <ap3BVr5hHwA499gu@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-4-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-4-vdonnefort@google.com>
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

On Wed, Sep 02, 2026 at 11:47:05AM +0100, Vincent Donnefort wrote:
> While can_set_direct_map() tells whether the direct map can be modified
> globally, can_set_direct_map_range() checks if a specific range can be
> modified. e.g. if mapped at PTE-level.

set_direct_map are going to have number of pages parameter soon:

https://lore.kernel.org/all/20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org

so this check can be a part of arm64::set_direct_map

I wouldn't expose can_set_direct_map_range() as a public API and rely on
the callers to "Do The Right Thing".
  
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3030d9245f5a..88175c3fa751 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
>  {
>  	return true;
>  }
> +
> +static inline bool can_set_direct_map_range(struct page *page,
> +					    unsigned long nr_pages)
> +{
> +	return false;
> +}
>  #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  /*
>   * Some architectures, e.g. ARM64 can disable direct map modifications at
> @@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
>  }
>  #define can_set_direct_map can_set_direct_map
>  #endif
> +
> +#ifndef can_set_direct_map_range
> +static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
> +{
> +	return can_set_direct_map();
> +}
> +#define can_set_direct_map_range can_set_direct_map_range
> +#endif
>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  
>  #ifdef CONFIG_X86_64
> -- 
> 2.55.0.970.g62bdec98f9-goog
> 

-- 
Sincerely yours,
Mike.

