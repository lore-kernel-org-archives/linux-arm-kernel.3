Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABBAD3CC9E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nFOQdtCY5WT4xucC+l+5Wmqy1J150GYREjDqaA3sxY=; b=qeQqkXH5/Wuv+cuZ1xSg4qz2qT
	a4403rdZpjRG1EXD3etDP83buRCc19g7uWeEn+4mVrHlsdmBjdGfzWGYJ/YK0sW1Cbev7cKt2hxL3
	ieiVfr/+3Xv9vk95BUCQam8tjpqvjcfomvzyZ1Z7lsxBPHvwi4u5tgjbPI6GT3DmAmBKXeW/5aZp2
	6JGBBXiMZFjsG/+7l20ymxV2TIssHR3zcehnGlnHuIMPumbE1iNgMdzUGIahPfcC2f4FYsQ1DXp7V
	Q4dHHOm2z1dL1pH0L4Sh90SN7wag5CbsYQP8C7/G9MjkcKwqm6RFpiPliWT0BqEO6uQB4pIlz6IV4
	Nb/xNXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgC9K-0000000BOc1-1Od7;
	Thu, 15 Jan 2026 01:27:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgC9I-0000000BObE-2FPJ;
	Thu, 15 Jan 2026 01:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74B3060008;
	Thu, 15 Jan 2026 01:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902FAC4CEF7;
	Thu, 15 Jan 2026 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768440463;
	bh=pQ8j9Tn71UcjHmJ1kXhLWOF2qZTGUivD/SECa9XZwOg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WaCZwQ2lpVB23m9mvRB7P1BdVy4CxTZrspTarWWH7iC1Y7Vm/y2UnRmacHj8EcHAi
	 ILBqqksvYmtDVXZ3XjC5q4/lRdA6RQISezqaHVwQig0DO+PKG9cDjQodE6vsbkLH2g
	 IIRxd/QP6TbOPmU3cW4acl9BGtSbgdbu/uCwtsCg=
Date: Wed, 14 Jan 2026 17:27:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: <robin.kuo@mediatek.com>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng
 Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <wsd_upstream@mediatek.com>,
 <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
 <Andrew.Yang@mediatek.com>, <Qun-wei.Lin@mediatek.com>,
 <oliver.sang@intel.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/1] Restore swap_space attr aviod krn panic
Message-Id: <20260114172741.b8b6cb9aae39a5ae7a199eed@linux-foundation.org>
In-Reply-To: <20260115001405.3513440-1-robin.kuo@mediatek.com>
References: <20260115001405.3513440-1-robin.kuo@mediatek.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 15 Jan 2026 08:13:43 +0800 <robin.kuo@mediatek.com> wrote:

> From: "robin.kuo" <robin.kuo@mediatek.com>
> 
> Restore swap_space attr avoid krn panic

Thanks, and welcome to Linux ;)

> Commit 8b47299a411a ('mm, swap: mark swap address space ro and add
> context debug check') made the swap address space read-only.
> It may lead to kernel panic if arch_prepare_to_swap returns a failure 
> under heavy memory pressure as follows,
> 
> el1_abort+0x40/0x64
> el1h_64_sync_handler+0x48/0xcc
> el1h_64_sync+0x84/0x88
> errseq_set+0x4c/0xb8 (P)
> __filemap_set_wb_err+0x20/0xd0
> shrink_folio_list+0xc20/0x11cc
> evict_folios+0x1520/0x1be4
> try_to_shrink_lruvec+0x27c/0x3dc
> shrink_one+0x9c/0x228
> shrink_node+0xb3c/0xeac
> do_try_to_free_pages+0x170/0x4f0
> try_to_free_pages+0x334/0x534
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x334/0x588
> __alloc_frozen_pages_noprof+0x224/0x2fc
> __folio_alloc_noprof+0x14/0x64
> vma_alloc_zeroed_movable_folio+0x34/0x44
> do_pte_missing+0xad4/0x1040
> handle_mm_fault+0x4a4/0x790
> do_page_fault+0x288/0x5f8
> do_translation_fault+0x38/0x54
> do_mem_abort+0x54/0xa8
> 
> Restore swap address space as not ro to avoid the panic.

Well damn.  We have checking tools which should be able to detect this:
we referenced something which was dropped from kernel memory in the
calling function's context.  i don't know who I should report this to.

I shall add cc:stable to this patch, to help ensure that it is
backported into 6.18.x.



