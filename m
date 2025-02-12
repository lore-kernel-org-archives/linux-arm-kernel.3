Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D67C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rlgz5seG82Ux+fkG2i/legtN8SP4dQp1hc1HwNMZJ+Y=; b=JZjtbJ4Istvc0WPQ8oBxtnlSFa
	I+er23rx6Ly2lqfaXPv0+kC7M1nKqMjL5yMGpg6KuMh9pfMyqbJoYSCk1/3vu5jZxh6VpwF0MdyKU
	udHtacrsDEYRroKnH3cX7iS6YgjniX4jNs86CGyk69zYzKohtqYTzkpqBV/Ugey6qoO2vZ3FDJF/w
	Z19Z5+G309Tqkwpxdb5+DFEDS4/Npc4h9YjvXsdAsIUUD5/O5Voz9dvx3oYkObozvkgnFxKUc+zS6
	vdi2xLV6MxQB5fOlvXFU3OeFQ6xaLrjy1SWcrQzgWzwXL3V8gf1IUv5vbu+wUo4KPrCWtYqBTX6KA
	VwZbgsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGTz-00000008JKk-3bQA;
	Wed, 12 Feb 2025 17:25:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGNZ-00000008HyS-3Tpd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6A1D5C5FFC;
	Wed, 12 Feb 2025 17:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15C2C4CEDF;
	Wed, 12 Feb 2025 17:18:23 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:18:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 5/5] arm64: introduce copy_mc_to_kernel()
 implementation
Message-ID: <Z6zX3Ro60sMH7C13@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-6-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209024257.3618492-6-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_091829_904546_59C48365 
X-CRM114-Status: GOOD (  13.92  )
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

On Mon, Dec 09, 2024 at 10:42:57AM +0800, Tong Tiangen wrote:
> The copy_mc_to_kernel() helper is memory copy implementation that handles
> source exceptions. It can be used in memory copy scenarios that tolerate
> hardware memory errors(e.g: pmem_read/dax_copy_to_iter).
> 
> Currently, only x86 and ppc support this helper, Add this for ARM64 as
> well, if ARCH_HAS_COPY_MC is defined, by implementing copy_mc_to_kernel()
> and memcpy_mc() functions.
> 
> Because there is no caller-saved GPR is available for saving "bytes not
> copied" in memcpy(), the memcpy_mc() is referenced to the implementation
> of copy_from_user(). In addition, the fixup of MOPS insn is not considered
> at present.

Same question as on the previous patch, can we not avoid the memcpy()
duplication if the only difference is entries in the exception table?
IIUC in patch 2 fixup_exception() even ignores the new type. The error
must come on the do_sea() path.

-- 
Catalin

