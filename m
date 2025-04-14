Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AF5C369BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feKubO7XTIm6lQ+UaH56M0sqB3yX9zlod9Y1maSb+sY=; b=JM1FIz50CoI7f7ifUH4L8Ahg21
	p7qNVlYVQ7fQxtRwgyPaYumDp9b1bg7HF1EguiNUmyRT5OD1dyf28Ism/22zJRaQGSrZOeyKHOest
	adVeovGhJJmoQp6Y84te0rZnORienIiEKycb+8ho2dGsDpnd1Sogh1H3Hxj1TSclFVEwuQ12eIPpj
	A7AaLeIQeLqqwMJyL9gaI/d2QBwpKz1+NsfAg4xUZjdvK+BT/M/ijhzRmpzWdbhzZYPGsckQC4dnk
	x3OeCZZvFFRvCdcocELJaJlhWrJBPxoFVKICiMbp/CrGNH7+MTKU1ESidnMj7kVJAv6BT4aVnTta4
	xJuGZ+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JtB-000000028hf-2dmd;
	Mon, 14 Apr 2025 13:30:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JrK-000000028Bc-2Roe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Apr 2025 13:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=feKubO7XTIm6lQ+UaH56M0sqB3yX9zlod9Y1maSb+sY=; b=QiEXV8A3xhcKW7XDrdHtn+yr/o
	bRn/G2Pgu60tX+L1z7yeDuhDCDlMkkW7/M8qlw8I1t0G9QQuLvvFaDi/mQZE6oW8tp0Cnk1u7G89H
	C2txqGsC6NeRHd6ohXpqtbfQgRQ64q5QFTaM1/kfzb+ICNSzjH5lOsXb2ISeU0L5YEqDDy8cMjD10
	90g/qpn0wLHK+19U0ZBh1W/Npk2MHMpdkvx+6JxKqxtV0cYQZtB2kCrtHxdmHVSz6/wrcSerbZSwi
	0Zt6sOnXC/3aXVLK6d2cFJpFlSn+Ih6pDYg0rvRGQSH/yPtDdYoO7pTKXjwHevBwU+qAc5xROq3gk
	dJ+SA3Yg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4JrH-00000009gqK-0b6v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:28:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2E3F1007;
	Mon, 14 Apr 2025 06:28:14 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B5DC3F66E;
	Mon, 14 Apr 2025 06:28:15 -0700 (PDT)
Message-ID: <0bad3714-06b3-488f-a414-b825f409b926@arm.com>
Date: Mon, 14 Apr 2025 14:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Implement pte_po_index() for permission overlay
 index
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250410052021.1533180-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250410052021.1533180-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_142819_563309_9F8F4A21 
X-CRM114-Status: GOOD (  18.54  )
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

On 10/04/2025 06:20, Anshuman Khandual wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> Previously pte_access_permitted() used FIELD_GET() directly to retrieve
> the permission overlay index from the pte. However, FIELD_GET() doesn't
> work for 128 bit quanitites. Since we are about to add support for D128
> pgtables, let's create a specific helper, pte_po_index() which can do
> the required mask and shift regardless of the data type width.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc1
> 
>  arch/arm64/include/asm/pgtable-hwdef.h | 1 +
>  arch/arm64/include/asm/pgtable-prot.h  | 2 ++
>  arch/arm64/include/asm/pgtable.h       | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
> index f3b77deedfa2..028a164924df 100644
> --- a/arch/arm64/include/asm/pgtable-hwdef.h
> +++ b/arch/arm64/include/asm/pgtable-hwdef.h
> @@ -211,6 +211,7 @@
>  #define PTE_PO_IDX_2	(_AT(pteval_t, 1) << 62)
>  
>  #define PTE_PO_IDX_MASK		GENMASK_ULL(62, 60)
> +#define PTE_PO_IDX_SHIFT	60
>  
>  
>  /*
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 7830d031742e..b53bc241e4e7 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -136,6 +136,8 @@ static inline bool __pure lpa2_is_enabled(void)
>  	((pte & BIT(PTE_PI_IDX_1)) >> (PTE_PI_IDX_1 - 1)) | \
>  	((pte & BIT(PTE_PI_IDX_0)) >> (PTE_PI_IDX_0 - 0)))
>  
> +#define pte_po_index(pte)	((pte_val(pte) & PTE_PO_IDX_MASK) >> PTE_PO_IDX_SHIFT)
> +
>  /*
>   * Page types used via Permission Indirection Extension (PIE). PIE uses
>   * the USER, DBM, PXN and UXN bits to to generate an index which is used
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..41979c0e6c21 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -182,7 +182,7 @@ static inline bool por_el0_allows_pkey(u8 pkey, bool write, bool execute)
>  	(((pte_val(pte) & (PTE_VALID | PTE_USER)) == (PTE_VALID | PTE_USER)) && (!(write) || pte_write(pte)))
>  #define pte_access_permitted(pte, write) \
>  	(pte_access_permitted_no_overlay(pte, write) && \
> -	por_el0_allows_pkey(FIELD_GET(PTE_PO_IDX_MASK, pte_val(pte)), write, false))
> +	por_el0_allows_pkey(pte_po_index(pte), write, false))
>  #define pmd_access_permitted(pmd, write) \
>  	(pte_access_permitted(pmd_pte(pmd), (write)))
>  #define pud_access_permitted(pud, write) \

kvm also uses PTE_PO_IDX_MASK in compute_s1_overlay_permissions(). Shouldn't we
be converting that site too?

----8<----
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 3a96c96816e9..d9a8ee8e600f 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1073,7 +1073,7 @@ static void compute_s1_overlay_permissions(struct kvm_vcpu
*vcpu,
 {
        u8 idx, pov_perms, uov_perms;

-       idx = FIELD_GET(PTE_PO_IDX_MASK, wr->desc);
+       idx = pte_po_index(__pte(wr->desc));

        switch (wi->regime) {
        case TR_EL10:
----8<----

