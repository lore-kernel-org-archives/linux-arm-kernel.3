Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0F8C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ/47zCz0AxvlC0JOjpioiJlI8QJLni0zmgQ/7sWDYA=; b=1dj/vGWPG48Xxs0/F6cJ87t8Bn
	AL+GusWgv44g1XD0GNkph5KRTLXnVnUxADiMpmRteUC0k7EZSn9jqeV3iB0m3Jmm9O+Sz2rq4PIGw
	arBkdaop3I9sERczJUhMG4Odat2NQm91faHZWxjbgBAi3mrXfs04RKeYHIBmC0tTxUqrL2MCxRWNv
	VCAdSeHXVojA4kbrTK/PKIKhvulhKmin+sIXExF7zln7BzGYphVkxGucbCB1w48O5qhbSK76Fkyqa
	9Ti7IetWKIN0DV8yE+DJlgxjxpU5ntl3KTvRGgTltNrwBRgOFdWkCXgRI4McYUSoHk4icFzSc2KKS
	3pJDWO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDyN-00000002hbd-2bMi;
	Tue, 22 Jul 2025 14:28:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDZ9-00000002d4O-1feB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB6FE5C65F4;
	Tue, 22 Jul 2025 14:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7561AC4CEF7;
	Tue, 22 Jul 2025 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753192918;
	bh=oujexYziHgPEDcDx7x1RYjfQC+/RIpBUJRP2MbMPYJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G44437V6zc3RRb1EuCGCfuuEnJ07kAW/wsYjpBm8OmiB9hTdtAv80wb1ej2FX2EnN
	 6+HmEVHCE1bDMhZAF+Vt8TYCvH71Q+HtgWWukjAJu+KaZYNC5GbBhqeuC12GXOz6Va
	 bvPuGtxnV8YqXpR1IpQ/+pRPFEp1/pI5hgv0np+dO5+J5xFiknR3J61cL0A9o7cJZm
	 54PdtwRRVaTH5sPuotqtWT7QjUQdIDJUMNs7cGWIRCJSe5cUHKOSbvi2EqsyGZqtTL
	 sEF6B9IiUtrnq3AaEUQZNOd4FjMOE4x2mbp5enjjF0v21taQAIZvOY4DcMHV3dSUNF
	 NwFyFRSblIffg==
Date: Tue, 22 Jul 2025 15:01:53 +0100
From: Will Deacon <will@kernel.org>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 3/3] arm64: cacheinfo: Provide helper to compress
 MPIDR value into u32
Message-ID: <aH-Z0SNzNVz0cToB@willie-the-truck>
References: <20250711182743.30141-1-james.morse@arm.com>
 <20250711182743.30141-4-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711182743.30141-4-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070159_478267_1BB31311 
X-CRM114-Status: GOOD (  25.98  )
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

On Fri, Jul 11, 2025 at 06:27:43PM +0000, James Morse wrote:
> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest MPIDR of the CPUs
> associated with that cache. The cache-id exposed to user-space has
> historically been 32 bits.
> 
> MPIDR values may be larger than 32 bits.
> 
> MPIDR only has 32 bits worth of affinity data, but the aff3 field lives
> above 32bits. The corresponding lower bits are masked out by
> MPIDR_HWID_BITMASK and contain an SMT flag and Uni-Processor flag.
> 
> Swizzzle the aff3 field into the bottom 32 bits and using that.
> 
> In case more affinity fields are added in the future, the upper RES0
> area should be checked. Returning a value greater than 32 bits from
> this helper will cause the caller to give up on allocating cache-ids.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v1:
>  * Removal of unrelated changes.
>  * Added a comment about how the RES0 bit safety net works.
> ---
>  arch/arm64/include/asm/cache.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
> index 99cd6546e72e..09963004ceea 100644
> --- a/arch/arm64/include/asm/cache.h
> +++ b/arch/arm64/include/asm/cache.h
> @@ -87,6 +87,23 @@ int cache_line_size(void);
>  
>  #define dma_get_cache_alignment	cache_line_size
>  
> +/* Compress a u64 MPIDR value into 32 bits. */
> +static inline u64 arch_compact_of_hwid(u64 id)
> +{
> +	u64 aff3 = MPIDR_AFFINITY_LEVEL(id, 3);
> +
> +	/*
> +	 * These bits are expected to be RES0. If not, return a value with
> +	 * the upper 32 bits set to force the caller to give up on 32 bit
> +	 * cache ids.
> +	 */
> +	if (FIELD_GET(GENMASK_ULL(63, 40), id))
> +		return id;

Why is it safe to ignore the other RES bits (i.e. 31, 29:25)? If the
architects decide to pack some additional affinity information in there,
we're in trouble, no?

Will

