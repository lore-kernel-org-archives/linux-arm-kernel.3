Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49866FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZEU/07GfSdYREJIL2rDIO5TdGrwyJUemGVRj3FT+T0=; b=y1bL0Jyo6qjJuebEEtdYkDuljR
	o3sgXAXmbg5QmuLOjFylu4lF8wG+K/hwa6aO10NgLs6b0eQ2XNp72yhxafXsXAhxL+XbPo8AVRETQ
	DjLKi/lz/EK+0vhAIDrgDqdC1w8IfYeyLkp/UqOm0IKlesVnJjtPDCJZr+YHlXlNeDDMWbxjd7FHJ
	aaNHpZxEXJexKwgzD3LbNI3ZC3JD/GF0FO7xoUALm4+D7RyWmKGUoKlOZR8ompOAoPLkULPPYXRIx
	drlTHiu9Hpfc9wWHdKTwspM56yrEmp1YMABuOiZK+p0c+vVAXwdWlyDl4pV1UJo+/shMQrEmCg+Me
	LzuMxUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjEq-00000001cxj-3wia;
	Tue, 28 Apr 2026 14:16:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjEp-00000001cxT-29MG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 14:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XZEU/07GfSdYREJIL2rDIO5TdGrwyJUemGVRj3FT+T0=; b=GIurquiklHLqwD8H05MPtOwBPi
	9AuHWNi5XkRUte3jczL1bFPK0w2a2kmAZRUa+TgrnENBFrkkStKTJZrhtRHG1d91W/O4XGYukPO2Q
	HPktbAbLXAHQjgd+VW1e7PiIdNf5tcxtKPfcLDqWeGE+sw5RpoJmZBcPqGs3yY8rNWuJcLe73Dt+Q
	DdqLJ3cB/qni2gXkZybWaA5KnpwpFF25dAsPf3voPw7SOCINgAuY+Lk9iLLjByMs38Nf+6qD/8ad9
	dllbThhyYUliqRkrby2CjyqzP6NCHjq+/sVyNzrO6qwKqc3Q9k1iCbryphxxZEJnMKBARhi0zb5Th
	mU0DYZ8Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjEl-00000003Iec-3NKG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:16:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD7841C2B;
	Tue, 28 Apr 2026 07:16:22 -0700 (PDT)
Received: from [10.57.63.26] (unknown [10.57.63.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48BFF3F763;
	Tue, 28 Apr 2026 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777385788; bh=btCZZuKZwDHwegac4lZwAmmkykNullD5FLtTtCs4fM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KZBlPQ1sPDbrJhxD9GJVH5ERW4UKB3ReLaGE3w6Rs7y5sqoZtBJxYyDPoySmzUimS
	 O2W2ca7Bx0rNnlTgvtXYIkX9i8isJ3q6U5bEoSdMuy+joC8i+kcUX/Pz9lnXt+pwSX
	 DREPzwlNeterBeiJ8pRPWspZwsPTrQUst6s1cJdo=
Message-ID: <82091dd4-9d11-4054-89ec-99aadaeec7b2@arm.com>
Date: Tue, 28 Apr 2026 16:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] arm64: mm: Map the linear alias of text/rodata
 as tagged
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-18-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260427153416.2103979-18-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_151632_056212_59CB94A4 
X-CRM114-Status: GOOD (  15.51  )
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

On 27/04/2026 17:34, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Before moving the empty_zero_page into the __ro_after_init section, make
> sure it has the memory-tagged type. This is needed to ensure that
> cpu_enable_mte() will be able to initialize the tags correctly.

mark_linear_text_alias_ro() is called after all features have been
detected and enabled, so do we actually need this?

AFAICT the lines that matter for cpu_enable_mte() are those, in map_mem():

    __map_memblock(pgdp, kernel_start, kernel_end,
               PAGE_KERNEL, NO_CONT_MAPPINGS);

It is probably this call that needs to be changed to use
pgprot_tagged(PAGE_KERNEL).

- Kevin

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/mm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index dd85e093ffdb..f084993024ab 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1049,7 +1049,7 @@ void __init mark_linear_text_alias_ro(void)
>  	 */
>  	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
>  			    (unsigned long)__init_begin - (unsigned long)_text,
> -			    PAGE_KERNEL_RO);
> +			    pgprot_tagged(PAGE_KERNEL_RO));
>  }
>  
>  #ifdef CONFIG_KFENCE

