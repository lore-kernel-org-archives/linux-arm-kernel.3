Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260F9C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 23:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln9muO+UnoEXyYsgLcV9Ra/t7A/95ouFlMUsf8wdrpI=; b=L/xSAKYXErQ/aI8eAw2Px3gAlD
	OgGBfgQXv/i5RaASrgon5+6scKoP/T3zCMh5N3UfVGX1Z98zIkdrsPG36XmYfYZGCuOJiGMstuFT7
	9UhGrRdPy5hS85mNru0rCddtay9hWv5NcZns/4Qntu4YipWyfI9Uf1AyTrCpqGdszoLDBEf+YqVsS
	85AycguYt2rieO67bXCEiBaZRy6bucN6LafWbdO/xd0hBRMJtQdx1ZTB0JsLUK5fQKEDCfglCOLyN
	nmzmGgi7bV8I/6YNS+ECUnKrdUmY+Hw5N629VnK1hwexPv5bG2VTFh6g+VdqmSvYfVWaWeJmmjbLk
	bVVz4+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKIr-00000004DV7-1Lxa;
	Mon, 17 Mar 2025 23:55:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKFr-00000004Cix-04RU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 23:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742255539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ln9muO+UnoEXyYsgLcV9Ra/t7A/95ouFlMUsf8wdrpI=;
	b=hszOd0A6rkgJ5CDCoMBctPukdt9WOtLrLmQGWsDpv4cr5tITgbuOGi5M6poYCD/w8t9THo
	/gjcaHj0E764om2zObemR4NDjNeCueuex5s+GXbgZDwKnoc5PejbjJrQvo85oQKfSDfxcV
	oowggg9gyxFoo/UqVW+FOYXNkjEr+MM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-DU2R_2XDMkuC00OGsR7rfg-1; Mon,
 17 Mar 2025 19:52:14 -0400
X-MC-Unique: DU2R_2XDMkuC00OGsR7rfg-1
X-Mimecast-MFC-AGG-ID: DU2R_2XDMkuC00OGsR7rfg_1742255532
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C30A195608B;
	Mon, 17 Mar 2025 23:52:09 +0000 (UTC)
Received: from localhost (unknown [10.72.112.23])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53A23180174E;
	Mon, 17 Mar 2025 23:52:05 +0000 (UTC)
Date: Tue, 18 Mar 2025 07:52:00 +0800
From: Baoquan He <bhe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 1/5] arch/x86: Drop own definition of pgd,p4d_leaf
Message-ID: <Z9i1oGaAR9c2MPbN@MiWiFi-R3L-srv>
References: <c81566e5df160587de50f9095d0ec377114fdba8.1720854135.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c81566e5df160587de50f9095d0ec377114fdba8.1720854135.git.christophe.leroy@csgroup.eu>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_165223_121676_22A83E7A 
X-CRM114-Status: GOOD (  17.54  )
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

On 07/13/24 at 09:08am, Christophe Leroy wrote:
> From: Oscar Salvador <osalvador@suse.de>
> 
> We provide generic definitions of pXd_leaf in pgtable.h when the arch
> do not define their own, where the generic pXd_leaf always return false.
> 
> Although x86 defines {pgd,p4d}_leaf, they end up being a no-op, so drop them
> and make them fallback to the generic one.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/x86/include/asm/pgtable.h | 10 ----------
>  1 file changed, 10 deletions(-)

Seems this series is missed. It does do a great clean up.

> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 65b8e5bb902c..772f778bac06 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -252,13 +252,6 @@ static inline unsigned long pgd_pfn(pgd_t pgd)
>  	return (pgd_val(pgd) & PTE_PFN_MASK) >> PAGE_SHIFT;
>  }
>  
> -#define p4d_leaf p4d_leaf
> -static inline bool p4d_leaf(p4d_t p4d)
> -{
> -	/* No 512 GiB pages yet */
> -	return 0;
> -}
> -
>  #define pte_page(pte)	pfn_to_page(pte_pfn(pte))
>  
>  #define pmd_leaf pmd_leaf
> @@ -1396,9 +1389,6 @@ static inline bool pgdp_maps_userspace(void *__ptr)
>  	return (((ptr & ~PAGE_MASK) / sizeof(pgd_t)) < PGD_KERNEL_START);
>  }
>  
> -#define pgd_leaf	pgd_leaf
> -static inline bool pgd_leaf(pgd_t pgd) { return false; }
> -
>  #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
>  /*
>   * All top-level MITIGATION_PAGE_TABLE_ISOLATION page tables are order-1 pages
> -- 
> 2.44.0
> 
> 


