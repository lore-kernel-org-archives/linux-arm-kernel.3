Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772F8D6D231
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYD9+WzWy/AtpAhh9/Y90J+SPB0CH5V5FKAn0rVlHi0=; b=fWD63Bv7dez1K8a0OTmLNYDQhi
	RlkC7mnqfsSYzmILmthx3S2kolx6qsW5IhP0rtAwb8MS+1goxLF1eSye7lWBcbt4itStalvFDe1RZ
	1XGUifkAU+c6XE2SiCLwBTCd5Fe9+PZ9vkqcqxzCmhtVFBBrojokNiL54fqo3wKRvQ4lzyZHjgcXW
	80u9VtLuCLOW+zs6RGok3Mhd0nCxyh3vyh1h92hjfi4DxnfKSrD88G6PA4dc+70t3AyUQe/NDQVXm
	enNAao9xt9/WW4MIFudb7ESuavYuwKu812XQl94uYxZqNfkoCJ+gncvtrBFVehTt0Y/4xMf9DoHFT
	Qz154ooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNnh-0000000Dx3k-1Jeb;
	Wed, 27 Nov 2024 19:34:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNlk-0000000DwhB-0X5k;
	Wed, 27 Nov 2024 19:32:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25421A439F3;
	Wed, 27 Nov 2024 19:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD69C4CED2;
	Wed, 27 Nov 2024 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732735930;
	bh=xrciW+EMhZ5UEofbJw9NwB4YNk6WJ7ZsUg3ugalAKtY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X2BtrIqNGPOvV+49M5YnEnvMfq90m+ylhD7PzWNtlQWXRcWLiIC9o7ibIu7Z+6NCF
	 kcXzlV4NXbHYexopnI8wyMqZtXl1aARG1Kv+1kHo2QdWtEH8r51A6kx0Z+b8YMEuGQ
	 KkVWB5pfPFETZ3jygkOvTt1oTUJ7ox8ovqX6d1E+iA+5p2Dg3oRun7qGKNbz7lmsz9
	 P2yGA8boYanYTYFxQR6QsePoSp98SjRizDnHD/Y6HoJ2E4HX1u+AiXq7pnGqhQjajY
	 UFL0t9n5dlc0Yh9Rql7BGoHCScG0i7PhlQ+71XDRGrapyLXfaRB16QrJ7c3W0qJT2C
	 zsuLVCEMA8n/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tGNlf-00GLsr-Kw;
	Wed, 27 Nov 2024 19:32:07 +0000
Date: Wed, 27 Nov 2024 19:32:06 +0000
Message-ID: <867c8ov5ft.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
In-Reply-To: <20240807064110.1003856-25-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
	<20240807064110.1003856-25-rppt@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: rppt@kernel.org, linux-kernel@vger.kernel.org, agordeev@linux.ibm.com, andreas@gaisler.com, akpm@linux-foundation.org, arnd@arndb.de, bp@alien8.de, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, dan.j.williams@intel.com, dave.hansen@linux.intel.com, david@redhat.com, davem@davemloft.net, dave@stgolabs.net, gregkh@linuxfoundation.org, hca@linux.ibm.com, chenhuacai@kernel.org, mingo@redhat.com, jiaxun.yang@flygoat.com, glaubitz@physik.fu-berlin.de, jonathan.cameron@huawei.com, corbet@lwn.net, mpe@ellerman.id.au, palmer@dabbelt.com, rafael@kernel.org, robh@kernel.org, samuel.holland@sifive.com, tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com, will@kernel.org, ziy@nvidia.com, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.k
 ernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, nvdimm@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, Jonathan.Cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_113212_293313_E0EA8184 
X-CRM114-Status: GOOD (  25.63  )
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

Hi Mike,

Sorry for reviving a rather old thread.

On Wed, 07 Aug 2024 07:41:08 +0100,
Mike Rapoport <rppt@kernel.org> wrote:
> 
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Until now arch_numa was directly translating firmware NUMA information
> to memblock.
> 
> Using numa_memblks as an intermediate step has a few advantages:
> * alignment with more battle tested x86 implementation
> * availability of NUMA emulation
> * maintaining node information for not yet populated memory
> 
> Adjust a few places in numa_memblks to compile with 32-bit phys_addr_t
> and replace current functionality related to numa_add_memblk() and
> __node_distance() in arch_numa with the implementation based on
> numa_memblks and add functions required by numa_emulation.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/Kconfig       |   1 +
>  drivers/base/arch_numa.c   | 201 +++++++++++--------------------------
>  include/asm-generic/numa.h |   6 +-
>  mm/numa_memblks.c          |  17 ++--
>  4 files changed, 75 insertions(+), 150 deletions(-)
>

[...]

>  static int __init numa_register_nodes(void)
>  {
>  	int nid;
> -	struct memblock_region *mblk;
> -
> -	/* Check that valid nid is set to memblks */
> -	for_each_mem_region(mblk) {
> -		int mblk_nid = memblock_get_region_node(mblk);
> -		phys_addr_t start = mblk->base;
> -		phys_addr_t end = mblk->base + mblk->size - 1;
> -
> -		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
> -			pr_warn("Warning: invalid memblk node %d [mem %pap-%pap]\n",
> -				mblk_nid, &start, &end);
> -			return -EINVAL;
> -		}
> -	}
>  

This hunk has the unfortunate side effect of killing my ThunderX
extremely early at boot time, as this sorry excuse for a machine
really relies on the kernel recognising that whatever NUMA information
the FW offers is BS.

Reverting this hunk restores happiness (sort of).

FWIW, I've posted a patch with such revert at [1].

Thanks,

	M.

[1] https://lore.kernel.org/r/20241127193000.3702637-1-maz@kernel.org

-- 
Without deviation from the norm, progress is not possible.

