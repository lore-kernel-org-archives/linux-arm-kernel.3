Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB99C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VCy9f/b2HN1cgotXKRxZEmm6KvtxurBOUMOHFRmRcE=; b=PJK0r6Smde8WyY2cejKivdiPZD
	Ega8vXmV80NkQiFk+TYBGNfc3LjZsPU3Jxu5yGh7XIYuKb0bp2wvfZtal+TBzJrx3ohEheSFWtkS0
	nU28sbr92mi/2aLRCgtZ8jku9SyLHnt9qI4GleUOG3YutdVrVsplPbRXXs0o0hXnlhUmru+W4ik0s
	zvrzZkyIzd+VMg+nOQ2QGcDXdTlr7X6kW/TntF6JsFTwmgTJSSIZWP30Usur5MDybPatWgJ7dKA+C
	7J04K6R4a9SHp4sbN4ZKQR1k5R+anjQo4TNePLQFRbO1qTI2Ul0sb8xSZtZcXN/AdVl2u9NhrKiyc
	ZNjlyDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfYZ-0000000C0lx-44M7;
	Mon, 06 Jul 2026 09:24:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfYY-0000000C0kf-0vjf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:24:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5573400B1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96B31F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329841;
	bh=/VCy9f/b2HN1cgotXKRxZEmm6KvtxurBOUMOHFRmRcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cEdF47yNLO3pphWl9Z9UJ5UIwwKD3iEFYoNj9r5BrRVXUcTQ8Xm/St37A5LqW3NPJ
	 PkpBs86OuUE2EpH7wIYgGeAmHYD3wiU/DnFPevt6zgUdFR0Oy9ZpFrS4leuHN8YLzn
	 lhb03HgalTTTif4ZcViuy7HB0X9by2Dg9wNZzbwL3wzBeEgafq04CM10AsDfoFWVzM
	 kwkt16dz+p1x0WPTLGotXgJCv9+aGukScaICd/zEacaDm+9seWO/H76rnWBRtxzYNA
	 9HF1ECi8DKQ+PWLoW272+EVWuUFC4vROVTkR7bwepZyFt7sMDycP7F5s+WePBDUF+C
	 3d2o37MlD21NA==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e99ef0902so99173885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrVfxhWEpNwLhz+7tPqXLdhvfvsMHD7x6ylOvnuiGy46G5FSdazTR/QeWMiqaSDugQSdnF+AcvD5ZYtdfKL/YNL@lists.infradead.org
X-Gm-Message-State: AOJu0YxdB/WcEGNEePF6/6oeZ4hP3YFFcSel0SR2P3+xPfMGB/E151cS
	d9Pq/n5KVjzV2ryon+5eda95u+b4+bIGaz2Ruwc3174vUc23g9+uvJxCy2JtL9Dt4CRap/CMVXb
	8D/is36wahpsnq4FU5PmcsPzxwTn5FAI=
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id
 af79cd13be357-92e9a3467f8mr1291272185a.13.1783329841061; Mon, 06 Jul 2026
 02:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 6 Jul 2026 17:23:48 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xpy5n_Hnb4z1CC-pYqk55NMmq8XL0p7u+WYjUSYvOnQw@mail.gmail.com>
X-Gm-Features: AVVi8Ce5HO3aW-MIRduy27P7j1S6xo0Yi8WmdeV9cmeasUBES2Y1Oo867QtgRwc
Message-ID: <CAGsJ_4xpy5n_Hnb4z1CC-pYqk55NMmq8XL0p7u+WYjUSYvOnQw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, 
	shanghaoqiang@xiaomi.com, Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 6, 2026 at 4:43=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com>=
 wrote:
>
> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous. Two techniques are used:
>
> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
>    segments
> 2. Use batched mappings wherever possible in both vmalloc and ARM64
>    layers
>
> Besides accelerating the mapping path, this also enables large
> mappings (PMD and cont-PTE) for vmap, which are currently not
> supported.
>
> Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> CONT-PTE regions instead of just one.
>
> Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
> mapping logic between the ioremap and vmalloc/vmap paths, handling both
> CONT_PTE and regular PTE mappings. This prepares for the next patch.
>
> Patch 4 extends the page table walk path to support page shifts other
> than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
> mappings. The function is renamed from vmap_small_pages_range_noflush()
> to vmap_pages_range_noflush_walk().
>
> Patches 5-6 add huge vmap support for contiguous pages, including
> support for non-compound pages with pfn alignment verification.
>
> On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> the performance CPUfreq policy enabled, benchmark results:
>
> * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> * vmalloc(1 MB) mapping time (excluding allocation) with
>   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)
>
> Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

Please also put Leo's data here[1] and also please collect Leo's tags in al=
l
patches.

Tested-by: Leo Yan <leo.yan@arm.com>

[1] https://lore.kernel.org/linux-mm/20260626151214.GA1794676@e132581.arm.c=
om/

