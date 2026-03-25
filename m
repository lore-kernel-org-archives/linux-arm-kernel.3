Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450A3FEA837
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=728svDarDpybv6q7KG00Eki4xvaBhCJwwC+/P9iXkjY=; b=O7P1C0KhHOMQ14TFHfaI0/OoA1
	TDdLyPXMY7oGKtKDEziV0RRqkteH8GO3H4x+KI0Gy5zKlzcKqPfhQRYPFOcCOn/MXfkXN5i8mPQlI
	c+WX2NC1zwRed+kdK5WD6rIlu++ikMtBX4dUKDB2Bu30qraaJnx6ZhElxtCpLonMQ9ZCPlogocIvM
	WErFpmIxMQyPAykMa39pyaB4iCidneHEX2NCDICPl1UUBgg+5fRf7VKLFE5zC85LoMKcNkYet3Lzc
	k1tIUejM+3k3cCLcxnzH1pi7TGkUXy/NrDhB6o17W9ShLeeNSLGsE96VokMgoMx1jtFg7326sd64R
	z00CT+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jy1-00000002zBu-2qTN;
	Wed, 25 Mar 2026 08:51:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jxy-00000002zBO-47l1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 08:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33F004023D;
	Wed, 25 Mar 2026 08:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F3AC4CEF7;
	Wed, 25 Mar 2026 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774428713;
	bh=wb0mpku6g4vk6LeYoqKTVgZtD079ouSEG5afLG7CYHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1e3/Kii8oNvJgJ1AntUStWco7jvCebnWCtuv9zQCi2oUsNeV3CcabZ/VnDWT/4Bu
	 SdMcpnZUmux3R7PA238aj+buhQoQTRaRCXpWVo3lfGnlVNamvRsJHecUDO4uY4JETZ
	 xHJynwGclZ7csipkKUqwqfdSbhr2yZe/cHdAo7WUa3IRdxgN7vSItNWj8/2zpJM8+z
	 ZD01fhqLFQqk3slMEX+1PFlTdn7jeaS5TQm3vnMZ8RuoTjWtwNM3l4/A2ygJ2Hvbj0
	 HyR0HIfxv2d4zYS9GJNQyVlSryBTgfJVvw36EgMl3VIff5tJxeQAebFY0sT7kqzmW+
	 QsAWpfwuNt7wg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: Alexander Potapenko <glider@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andreas Larsson <andreas@gaisler.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [PATCH v2 0/9] memblock: improve late freeing of reserved memory
Date: Wed, 25 Mar 2026 10:51:37 +0200
Message-ID: <177442863989.343689.8532363597437067519.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323074836.3653702-1-rppt@kernel.org>
References: <20260323074836.3653702-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_015155_067727_C317995F 
X-CRM114-Status: GOOD (  11.78  )
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

On Mon, 23 Mar 2026 09:48:27 +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Following a recent discussion about leaks in x86 EFI [1], I audited usage of
> memblock_free_late() and free_reserved_area() and made some imporovements how
> we handle late freeing of the memory allocated with memblock.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/9] memblock: reserve_mem: fix end caclulation in reserve_mem_release_by_name()
      commit: ea459d3c24fefd90b60a702f4a73833434ae0248
[2/9] powerpc: fadump: pair alloc_pages_exact() with free_pages_exact()
      commit: 6e827110aea5fb9c53a5bf070413ffe5cad105b0
[3/9] powerpc: opal-core: pair alloc_pages_exact() with free_pages_exact()
      commit: 3cf80188ecb828ed034ba562614cf1d48156b126
[4/9] mm: move free_reserved_area() to mm/memblock.c
      commit: 0aa264cda784f9fbe1a80ef13144cf81610086c7
[5/9] memblock: make free_reserved_area() more robust
      commit: 456ac994018598bc57ceaacb8a2c72e722c9755b
[6/9] memblock: extract page freeing from free_reserved_area() into a helper
      commit: 40191dae9ed84c816b593bb1b36a80f86c2279d1
[7/9] memblock: make free_reserved_area() update memblock if ARCH_KEEP_MEMBLOCK=y
      commit: b9e028ca869de24df00206d7ec640380670fc38f
[8/9] memblock, treewide: make memblock_free() handle late freeing
      commit: 64cb853c2ab4d8bd25b965f05e33ac0c6672bae7
[9/9] memblock: warn when freeing reserved memory before memory map is initialized
      commit: c7fc9cde41be029cf6675befbafcbb2dab40b39b

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.


