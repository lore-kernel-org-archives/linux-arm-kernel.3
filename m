Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F18D41149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYui0318UOsS6VyHkKkmfrBiXM5qykug+UUq04REjYo=; b=uoLFMfzQgIpuKJTOfR1GDtiJhF
	38QyAMt7ZlFCB8nO+nnlMRthkKjX9PV7RfqU5u8zx+QVm7FXYNifNDTFXBgCUbtaauaLHMHrNkjct
	9E5fdajg7fgBU/Bzk0uD6pyVI8Vg0FRXsrVxetLYGC4QdqCC8eoeknoLv9Lx8eoGSN3b8KRiHoDD7
	dipd7XP0vDfv/kfZx65s8o+E12xDEaHDfzhbmJ2kQ+gMX3bPE7DpuiblSobioxhyuoxUXcrPDUZoD
	Lk6nJmFjeFmmh0QIAhLnt3i3BMZmbu1Zg+xFJbdA+w9l/781JVatEsR+5eX8vdr6pUbaNrxNy9smU
	13cAMT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJbb-0000000C42A-3kOc;
	Thu, 15 Jan 2026 09:25:27 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJba-0000000C40Z-0uAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:25:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so1143518a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 01:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768469124; x=1769073924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYui0318UOsS6VyHkKkmfrBiXM5qykug+UUq04REjYo=;
        b=Lwxhj1UorM5zwL+IB63k4/PakcIlc+EgfG6MyxzcxfTWrGQkoVnlmQen9nuNE7eQhq
         4dodLxoSrbdHcIhE4wItqKuNfgDaBjIOK7OJ8cyIt4ZM+a00yZrAb5Qdq/jQfDHCsntB
         ZIpM89La2f3I4HcPKTcv2qeai1IAhnQYFb9YTt/QH+X0Vngee52xJDAx4yMP+kqyjyn6
         mLTCiJaklJHmTBAMxyWQgoyKdahPQnmW4oXW9iZJYBPeqJHfP3w4DZlcsAtttAIDfqh5
         lcmI5fAzx5DvN41PwfZWqsEJGpzVqDt1/kjhsIALsahOn35uFyjocOemsIOQv/Yo9poN
         M0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469124; x=1769073924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYui0318UOsS6VyHkKkmfrBiXM5qykug+UUq04REjYo=;
        b=G9O261slGw9zo6VVvPdYuNQ/xCpYMQHrbH736UF/qPGcg4HvAW5fNHgBB2MKT4w8Pn
         wwM5nj+41tIytT+EqRDZn1hKbuSqywucNmmrOXy6P5HHJ3Fn3lwfg/Jio3VyRzsP1f8M
         rqO7f3SBDDpZQLKUwky3fRDINEPF5qfVPG5fcE6Ca+EIL5eRcKOgfv/iDrTKdngNPa5+
         Xdli50cvvXAiN9QBe8R9F5GSSO3R66QLwDzYazi+YGUlV3gHjqXzvFTru+jdRoMVa6qv
         sAcOYHC3A8NIDbTa/IwqXdjMJkMo52cR5c7tzrm1oBkagqRQhql3906djBfL84bAER9h
         tuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJSOo2W4h+1Z9Vnxw93sOtTQJ8mj2EAwearUQnZ0ycadAWFLZxz/Cjho9uvtISMbx1GevoNIb1PNIfmCNgakj@lists.infradead.org
X-Gm-Message-State: AOJu0YzGJ0/G9RqogKrQJh6LvscLwvVYYru7mwGDshpCEuN1RNMRneBk
	NzKQJ8dYGtm1kzQqHU6taGlO9MAZwGJLaVKYyqlNwN5YeP9M2XdJ0U5R7ThnPfm4KpGtV5aRLbm
	lSVpY78ULtbhAQZORCNBwLQMfj678MbI=
X-Gm-Gg: AY/fxX52t0Q8S27lse8zphg1uC0jSgnc/KC9axoR0DCEZzyBEGoAR/tlqYpSzW0kjn2
	L4FAS44Y0xvs4yNoaRqs93hbvv62bXxD/XkrfvPfU6DiBAO9urXEPMZqNRbQsZAZeTFUMI0Ni1M
	P3JK4t0TBGybXho+V2eyjbywKrfneAAxHV9fCH4WhkIsD38WM6Yplj3JTf7IDP1FZFD6/Lv04W4
	y1c+ZCeO4JVH0c0PiTw4AJNLGb+dGeB9IsYL2vDrTPS7dpgLSueUeHoyAiKWcGfj/U8oN0fp307
	d8++8HyE0pL5LkuqNnUZA1wFOrfP
X-Received: by 2002:a05:6402:2804:b0:650:891f:1c06 with SMTP id
 4fb4d7f45d1cf-653ec115969mr4596435a12.12.1768469124088; Thu, 15 Jan 2026
 01:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20260115001405.3513440-1-robin.kuo@mediatek.com>
In-Reply-To: <20260115001405.3513440-1-robin.kuo@mediatek.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 15 Jan 2026 17:24:45 +0800
X-Gm-Features: AZwV_QidmYXnF7h9yz4oq7n444gRgXoBRtnbiVEv5D6iVPSwvP_31krseRm0_Mw
Message-ID: <CAMgjq7Db38sNdsGe121oBFshiJz+vUrKWf5BjB3djAYUr40LLA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Restore swap_space attr aviod krn panic
To: robin.kuo@mediatek.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	casper.li@mediatek.com, chinwen.chang@mediatek.com, Andrew.Yang@mediatek.com, 
	Qun-wei.Lin@mediatek.com, oliver.sang@intel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_012526_271976_12305CE6 
X-CRM114-Status: GOOD (  10.77  )
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

On Thu, Jan 15, 2026 at 8:14=E2=80=AFAM <robin.kuo@mediatek.com> wrote:
>
> From: "robin.kuo" <robin.kuo@mediatek.com>
>
> Restore swap_space attr avoid krn panic

Also a nitpick, you may want to add "mm, swap:" prefix to the patch summary=
.

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

For a stable backport simply making it not RO is simpler and better.
We can do the cleanup and add debug attr as I mentioned in another
reply later.

So for this change with Cc stable:

Acked-by: Kairui Song <kasong@tencent.com>

