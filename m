Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159D0FC981D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNRac5Q0bdyEoztagZPdambBGiK73kwsfN5Tdvc35C8=; b=mUFLP7pXjh6bzgTRqpplLLKL3V
	TH32y+ToHMpIG8C/yOqcoOWs0sG/SHG1wBALAN6PrK3X6Ir/RPRKw6Yi0hvVw5fBgjLhkwMVT+64/
	7j5EbDNnov/Sp3tLF2UyYqRxdvWFAZTXfpYSEldVJhmilq1Vz1zxSxREDc8V/yX1g6MWf/foBmeCo
	paoyZv7gwn2FUM9XXGLhwCeBU5jthXlTMA2o6phLooWDO38YjOnF91UaaGaDLT9Da4l3giBZcYexu
	7ozP0C5OPD+3s4lV8p505/SZY+Zuxkqx+eSTcwSCwgDW30zluf7UqV6kJeT01oAzzUG8WmxWN66by
	ndYCtX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78UM-0000000AvT7-3Rap;
	Mon, 30 Mar 2026 09:00:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78UL-0000000AvSq-1lSs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 09:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42169600AC;
	Mon, 30 Mar 2026 09:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BC8C4CEF7;
	Mon, 30 Mar 2026 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861247;
	bh=kryiSL0c5gWoP5Xn33RlQGuB1fDy2r29C8AZwGGNizM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WyVV6yhoGLHl2DGlMtLNk2PLvv1LoFNZHT4upzyLknoqI3XroAjHB9I1ha+vU4mPX
	 jqLByu7cdkfcSBvwjAbgeSA7t1FnsQjdZlrHnf9SNnPEyV8aXCVfzuhI/9ayog85j2
	 ZCfecMUhBhB9NayIQbTF+29vTra1H0L8yHpOy9Fwzj1WruGul10WlXsrznGUH8EUO4
	 yAVoSQA1pK/w43OyYruiDlv+uPCsaxYtmh6p3C7asR9EeKI1wjuzkpsIcL4izJJluW
	 H7vlwohlhoQLLz7U0ZJ9f5WNsHXklzmi3Z/jx+6T/BWbr7v0B1OnwuC2GYBfZcweMT
	 Fa1JpYbf/eG2w==
Message-ID: <b1c93301-c12a-46a6-ba92-53e8f9a28022@kernel.org>
Date: Mon, 30 Mar 2026 11:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] mm: move free_reserved_area() to mm/memblock.c
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andreas Larsson <andreas@gaisler.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <jackmanb@google.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Brauner <brauner@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20260323074836.3653702-1-rppt@kernel.org>
 <20260323074836.3653702-5-rppt@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <20260323074836.3653702-5-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/23/26 08:48, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> free_reserved_area() is related to memblock as it frees reserved memory
> back to the buddy allocator, similar to what memblock_free_late() does.
> 
> Move free_reserved_area() to mm/memblock.c to prepare for further
> consolidation of the functions that free reserved memory.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


