Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E58AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KXR54CGSrSbqb/7H2c1OQn6Inadnotq2aA0wVA9618=; b=sHpb9eqTOfyt0jGk+276HBufM9
	fi0WHfCa3CY43KuQuX644EGU3nINhPY7sPVAm3x9YRm7l9pz5yfD/5md+MCPyR3npanDUuZW4EFn2
	M99/ClxbtkviWWWyGXdUAAZ0CcIPP1Xeh5F1FhYJ4jn4P/X81Nd3W7bOqFgUVztGpnxyuxX9PUXEb
	C511bPO7yiHgibjcJ0HxtJicvU1tC9utNpTO/W/eHmZRCekVYD1W4VaY+x+YlZsEIxBbiJwFYmAy0
	fgxv5Cz7HKaRT6nTJOtdYoMKVLftgcVvOB8ilth7GYmd56VaqI2PnW0u2Rxl+TwrwRDt4KuX0Ju5J
	Uuqbs9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhs2-00000005pKE-2s59;
	Fri, 20 Dec 2024 18:37:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhqu-00000005pCr-0CO7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5041A420B8;
	Fri, 20 Dec 2024 18:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD88BC4CECD;
	Fri, 20 Dec 2024 18:35:52 +0000 (UTC)
Date: Fri, 20 Dec 2024 18:35:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, joey.gouly@arm.com,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	chenfeiyang@loongson.cn, chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
Message-ID: <Z2W5Bs0bZANI6NKv@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_103556_145685_232CA73F 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, Dec 09, 2024 at 05:42:27PM +0800, Zhenhua Huang wrote:
> vmemmap_check_pmd() is used to determine if needs to populate to base
> pages. Implement it for arm64 arch.
> 
> Fixes: 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>  arch/arm64/mm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index fd59ee44960e..41c7978a92be 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1169,7 +1169,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>  				unsigned long addr, unsigned long next)
>  {
>  	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> -	return 1;
> +
> +	return pmd_sect(*pmdp);
>  }
>  
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,

Don't we need this patch only if we implement the first one? Please fold
it into the other patch.

-- 
Catalin

