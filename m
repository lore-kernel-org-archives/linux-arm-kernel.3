Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC82FC54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1eHgDEjvF/cz4Ulq1Xo9gDiEIb6oaBm2mYx2XKUTWs=; b=t+BEgXEdIJI8FZlE8r9Vfwww4V
	0LncW25uSesByvnCIqPEIYrSVTmG2ezCku5l4MOZiKdnWMyL1Y7RX6MwDYnt0+AaOhhfRMspmoLJW
	r3c+KYTkGRkKJgUEINPTdxg3trzS0EW/NCnePR1pEE/bT6b1ISKMK4r1JlJeEdV7nmj9IH3unIjxk
	q6SIz+nlh81hihi+uLDDMarccg8G9arp2zZAM2BI+Iaf2TPWhME99uXRXXA5L/wVnIFzdRH/bN16P
	nlo7wK070uEznAjDTv1aNL/UP7UTuW/2QLAzcpCDXVNw4AXRAFbOtv76CjFlzK+PQc2DWx6kGYaC4
	CIFdf2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBR-0000000Ftkx-0dLL;
	Wed, 14 May 2025 17:46:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDoK-0000000FXt2-05c6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19F815C1017;
	Wed, 14 May 2025 15:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1442C4CEF0;
	Wed, 14 May 2025 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235659;
	bh=VtwAscQyUTlRhZtUQltGV4edyb2igJ5ad6uHqpn+WRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mtpYjOSME//tW2/y4bFxZKPp3B5Ja5xV63HYq7wpQOJn2o6cQsf0XViPQLUMo6jgx
	 M8BK8QREZ6B4bMEmer82tTJUoZAIZ9EsK2yBAGVZRAv3KFrimGX6lKVqiX/lKwzSzU
	 RmNmfsJacG/YNCEvLQyvBvjjlIRquxImSiJ9A0fjuqFHnRZqz3yu1ksiJqWfeqx1yf
	 LXPBIEGC1n+8ewTFdNatWZ1e8tFujqss0mjfK8vJceqjgV3bsXDz9+EgVWyN0xwkI5
	 PbG9m4BVDiCxgEhN2A7LdckrQ9KdWIqtTa/qjKT0uOGkfsj1UG9m2WfUPm5VnaZoBU
	 LSMLMLHG88HmQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Date: Wed, 14 May 2025 16:14:11 +0100
Message-Id: <174722567630.76853.13198140352994941416.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081420_100762_0C06ACD5 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On Mon, 12 May 2025 11:22:40 +0100, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Disable barrier batching in interrupt contexts
      https://git.kernel.org/arm64/c/b81c688426a9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

