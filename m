Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D3BCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNr9c/fSrb3xbX7PAREzlwJ34Sgln0Dpaexm5/bkhgU=; b=q4h6QEwlRww7efi25ureWoirxQ
	gZZNZvNR23vbJPkvlz9A/lQCQD612hqkDHFAi7SV+Gdb6xrHDHusARwPJpNbuDx7piNI1yISsRaAN
	IeFOcDmKMhRkpjpcVv3bD4GpFVdNNcfJgB8isnAij2VMm1PL3jO2qGitXoXDmiyO/G9PZwVS8IDIe
	VG3rPD/cGBt4fQcmQJ1gh6ZWuwrQnARgILyBRswfw/pvd2m7dEWLYL+C3cdUKYOjDWUSH32lYjCyK
	f+PUH9LD4dlHOK91vhS3f2oxEq/k9INiaOa1kzlCjtJINIG6F3zEvGsKzqGsA1sq+kc/KOGnGVjdM
	DUs04IXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrkK-0000000BKz9-1RPO;
	Tue, 12 Aug 2025 16:21:08 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnEQ-0000000Ac3E-3ZY0;
	Tue, 12 Aug 2025 11:31:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF99D44964;
	Tue, 12 Aug 2025 11:31:47 +0000 (UTC)
Message-ID: <cf90951d-0eee-4b51-a769-b657144dab7a@ghiti.fr>
Date: Tue, 12 Aug 2025 13:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Remove pud_user() from asm-generic/pgtable-nopmd.h
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>
References: <c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy@csgroup.eu>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c7f99612ecfa04054b37518df661d04f88f7c9af.1754997083.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeejtdduugemkeguuggumegskegrtdemvdejfhgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeejtdduugemkeguuggumegskegrtdemvdejfhgspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeejtdduugemkeguuggumegskegrtdemvdejfhgsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_043155_043357_730A7A3E 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Christophe,

On 8/12/25 13:14, Christophe Leroy wrote:
> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_user() in include/asm-generic/pgtable-nopmd.h
>
> But pud_user() only exists on ARM64 and RISCV and is not expected
> by any part of MM.
>
> Add the missing definition in arch/riscv/include/asm/pgtable-32.h
> and remove it from asm-generic/pgtable-nopmd.h
>
> A stub pud_user() is also required for ARM64 after
> commit ed928a3402d8 ("arm64/mm: fix page table check compile
> error for CONFIG_PGTABLE_LEVELS=2")
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> ---
>   arch/arm64/include/asm/pgtable.h    | 1 +
>   arch/riscv/include/asm/pgtable-32.h | 5 +++++
>   include/asm-generic/pgtable-nopmd.h | 1 -
>   3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index abd2dee416b3b..fef7cc7a340d8 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -955,6 +955,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>   
>   #define pud_valid(pud)		false
>   #define pud_page_paddr(pud)	({ BUILD_BUG(); 0; })
> +#define pud_user		false /* Always 0 with folding */
>   #define pud_user_exec(pud)	pud_user(pud) /* Always 0 with folding */
>   
>   /* Match pmd_offset folding in <asm/generic/pgtable-nopmd.h> */
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index 00f3369570a83..37878ef374668 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -36,4 +36,9 @@
>   static const __maybe_unused int pgtable_l4_enabled;
>   static const __maybe_unused int pgtable_l5_enabled;
>   
> +static inline int pud_user(pud_t pud)
> +{
> +	return 0;
> +}
> +
>   #endif /* _ASM_RISCV_PGTABLE_32_H */
> diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
> index 8ffd64e7a24cb..b01349a312fa7 100644
> --- a/include/asm-generic/pgtable-nopmd.h
> +++ b/include/asm-generic/pgtable-nopmd.h
> @@ -30,7 +30,6 @@ typedef struct { pud_t pud; } pmd_t;
>   static inline int pud_none(pud_t pud)		{ return 0; }
>   static inline int pud_bad(pud_t pud)		{ return 0; }
>   static inline int pud_present(pud_t pud)	{ return 1; }
> -static inline int pud_user(pud_t pud)		{ return 0; }
>   static inline int pud_leaf(pud_t pud)		{ return 0; }
>   static inline void pud_clear(pud_t *pud)	{ }
>   #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex


