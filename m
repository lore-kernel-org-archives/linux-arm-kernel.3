Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B8C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8Wh7N4cq/t88nKN8ZqZ4f+oRUbvezWnn3f++63qp34=; b=wmTJg72BAEv+hInKzOszqhQ1/u
	tU2HGh2dlqqfOpEVELaRhmCgGIy+Iwl1p4/m7Zn2XdWBSK3WGYXtaU1B0h1g8zQ20aLC2jIjAgVEf
	ytzqU8/hKFM5RgQVWyjU6qy7B27WncbWFMZtXV7b3hHNJLfcpBSXujPTGP7yVoX1ASAn0AQ1g3h7A
	AHr/3ktE9+qNyAcMcFMDTBFe6/kj0AqoKNEpBX7WJDntCPvxjpcHvI8jQCtHrwd8C99vNCvlaXumB
	aQftzPzEu5dg+6NYpZ+RkWslNQzldcgwPLgvnjCoCm0IaQCq5BspR3Ypxx79Ww4Yw+jeoP0AtKXes
	HmCaGzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ge7-0000000CCVk-3Snt;
	Thu, 17 Sep 2026 18:15:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ge5-0000000CCVH-0uxm;
	Thu, 17 Sep 2026 18:15:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B37601F91;
	Thu, 17 Sep 2026 11:15:36 -0700 (PDT)
Received: from [10.57.7.135] (unknown [10.57.7.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C76C3F86F;
	Thu, 17 Sep 2026 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789668940; bh=H8Wh7N4cq/t88nKN8ZqZ4f+oRUbvezWnn3f++63qp34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=roYFaSY285gwN/8IzsFOtN0+e8Iltix2FpDfvQ3utTYL+K/fJKmz1KXzTmdsXwN+S
	 WAMAddn6lBMF4PqxGiGTEo0pOprPlbr/cZxNj8ql3o575Mymat7lIXSIibWHw+fpmU
	 bkqsEF4P/sS5BnYk4WQFSwVQavKpnE4kImkX3gsQ=
Message-ID: <258a124e-bdc5-4c25-b649-b4ed0a1415ac@arm.com>
Date: Thu, 17 Sep 2026 20:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] Revert "arch: introduce
 set_direct_map_valid_noflush()"
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-6-949b64a9f755@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-6-949b64a9f755@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_111541_338937_ADAF66FC 
X-CRM114-Status: GOOD (  14.32  )
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

On 03/09/2026 11:28, Mike Rapoport (Microsoft) wrote:
> Commit 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
> added set_direct_map_valid_noflush() to allow updating the direct map
> for a physically contiguous range in execmem.
>
> As Brendan recently pointed out [1], this API is confusing because on
> arm64 it means that is sets VALID bit in ptes, while on other
> architectures it is an analog of set_direct_map_default_noflush().
>
> The only user of set_direct_map_valid_noflush() was execmem's ROX cache
> freeing path and it was switched to utilize VM_FLUSH_RESET_PERMS for
> resetting permissions of the direct map alias.
>
> With the last user gone and with set_direct_map_{invalid,default}_noflush()
> accepting number of pages as a parameter, set_direct_map_valid_noflush()
> become a copy of set_memory_valid() on arm64 and a duplicate of
> set_direct_map_{invalid,default}_noflush() on other architecture, it is
> safe to remove set_direct_map_valid_noflush().
>
> Also drop a stale comment in arm64::__kernel_map_pages() that Linus
> bothered to add when merging changes containing set_direct_map_valid_noflush()
> to his tree.
>
> This reverts commit 0c6378a71574daa6cd1534ad42a956e3262756c7.
>
> [1] https://lore.kernel.org/all/DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev
>
> Reviewed-by: Brendan Jackman <brendan.jackman@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

It's a great feeling to see the set_direct_map API get a little
streamlined :D

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

