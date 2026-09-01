Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E3BC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfHpSlsVl9cURa/O0KVf77O7hpqdHfUCsyagMRcBk/g=; b=TU8TD8hwVkolv/LunHt6wmwg8z
	/BLFWQI2LEuP2Idp4QgHKVNNW8upZz7PcUbMQN8gXqZUyqOTSm+7YkMQOQDtkk0Bi+oE+QME0VH8+
	0x9Dc/0o9k7RzNML/W6/8bQKSoVPlet2YymThIQY3LzbEJtnmoij/Cf8lZpHggQzQFKmtSN23WIju
	PYlZhBfG54nhXuyP0EHAoemFawDTo8nOK9ycroAanlno9Mi0fuq9LZ/oaCpM9bZPmCxYTTaeeNMbC
	oMVBwZbBTTv9FT8G9ZOdtt/tu0aJG7t2PhMZy9Z8AC0/h2HgE4uVcgAXPP7Z3ibZBIAyZkeyxNm1l
	+tzjSnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PYY-0000000CLkr-2JkE;
	Tue, 01 Sep 2026 14:33:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PYV-0000000CLkB-1wOc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:33:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B52B1756;
	Tue,  1 Sep 2026 07:33:38 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BD543F882;
	Tue,  1 Sep 2026 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788273222; bh=1sptuKVyrN75yvJtA/uLN5QzLJtblY/b6d0mqfGbJNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYNM6X2zqA6tod+6SjIBW+v6Liwy/ak5LM2gfcF+mXgLfmpQRUpi3xtLiAnTZwdnE
	 pgnAmIpBhiaiN/fvEhj7GZ1T7dsaMhZgszRdRQ4l0RGyAg918/p2d0WlL/uqhcUtTx
	 /asFjuJQcod+c5gT+rGYBCsQ+UeWK4ZxUu1QSuog=
Date: Tue, 1 Sep 2026 20:03:38 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 02/25] set_memory: Introduce set_memory_pkey() stub
Message-ID: <apbiQtt-cAlLkDqV@a079125.arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-2-743ad31b2c8f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-kpkeys-v9-2-743ad31b2c8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073343_538563_EE828169 
X-CRM114-Status: GOOD (  20.74  )
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

Kevin,

On Tue, Aug 18, 2026 at 03:08:44PM +0100, Kevin Brodsky wrote:
> Introduce a new function, set_memory_pkey(), which sets the
> protection key (pkey) of pages in the specified linear mapping
> range. Architectures implementing kernel pkeys (kpkeys) must
> provide a suitable implementation; an empty stub is added as

Could you make it explicit here why we are restricting this only
to the linear mapping range ? Would be helpful to add the reasoning
in the commit message and as comments.

Essentially we are also making a assumption here that there are no
aliases to the linear map ?

> fallback.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  include/linux/set_memory.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3030d9245f5a..7b3a8bfde3c6 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -84,4 +84,11 @@ static inline int set_memory_decrypted(unsigned long addr, int numpages)
>  }
>  #endif /* CONFIG_ARCH_HAS_MEM_ENCRYPT */
>  
> +#ifndef CONFIG_ARCH_HAS_KPKEYS
> +static inline int set_memory_pkey(unsigned long addr, int numpages, int pkey)
> +{
> +	return 0;
> +}
> +#endif

Would be better to make this (linar map range)constraint on the API name or that passed
as a boolean flag ?

Also, it would be better to have the __is_lm_address checks in this generic wrapper which
then calls arch_set_memory_pkey ?


--
Linu Cherian

