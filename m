Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FFAC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xJgUZAh/daxxQlgRYl9XFAlfRsMw/lTbOVfm+5M13o=; b=fbgi4bvxJi3V1YutUzBpTVjrx2
	GiXxcMAe+Cq9XzgCgYKWYSAQDKZozUJlgmji41nYD2Vt2P0dmpbeOGa2eC3jg4zOFoOhdAZ7Hxp+z
	2UnNkIa5N3JKBM91Q5w0WNbeO2HOTr0IC41S1Ae/g+734IGqBpLjXxa4wxXo+Lp5VYE4dZMDLe7G6
	9pMTAMSnUb6kI72aBImIjDi6mTYEKsvsnlmUdplMdVcSw9X+8IP8utP+Jt24VCF8MWH0VemrwSXvs
	m9FPHfIyTgFloq+yPht4R4fWqwNf9NwbYsUnAMd9BM1qMF7+OC1GW6wK7LEni9ttrXl+V+is1uNNE
	TY51pNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbN-00000000CJx-2r54;
	Mon, 21 Jul 2025 16:42:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udraS-0000000HXtZ-1OV7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F641A54D64;
	Mon, 21 Jul 2025 14:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB5BC4CEED;
	Mon, 21 Jul 2025 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753108431;
	bh=W3DsCBY2u1iSBpXEbgL+BBx51siqsbpsok2aDJTUk7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NA3NF4SwRguReA5PzVLGxM2kOQRnW6dl5eszhshHh05TjV/aXBdeKRfdRVIDfz517
	 fYvSfJdrVvkqvumZMi2yWX7uZgupy1mbFZ9xGTdyJnulFVybRE4kGIQ1rVYzobRazE
	 0nzcEEzZZko+3TLWwwi3366OsDH64fjsGVPXRQguBFYtlHEvtD8gSaTlalSv0T6hj5
	 ETOaHncxlYb7sqYdGlLFPHaXjAaFU9r6G8k0hTU4XlY4yVsUu/vpH0lJEsR0nnG3Tu
	 4i+bPrJatkkGWPbVqzCIvObFfsa3eSEDloykgduuHFHAZhhe1YkNlOmxh8mSx9X/St
	 F3GzdYXn6sU+w==
Date: Mon, 21 Jul 2025 15:33:46 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>
Subject: Re: [PATCH bpf-next v11 2/3] cfi: Move BPF CFI types and helpers to
 generic code
Message-ID: <aH5PypjBVdzVxxlo@willie-the-truck>
References: <20250718223345.1075521-5-samitolvanen@google.com>
 <20250718223345.1075521-7-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718223345.1075521-7-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_073352_434610_3CBAF905 
X-CRM114-Status: GOOD (  12.54  )
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

On Fri, Jul 18, 2025 at 10:33:48PM +0000, Sami Tolvanen wrote:
> Instead of duplicating the same code for each architecture, move
> the CFI type hash variables for BPF function types and related
> helper functions to generic CFI code, and allow architectures to
> override the function definitions if needed.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/riscv/include/asm/cfi.h  | 16 ------------
>  arch/riscv/kernel/cfi.c       | 24 ------------------
>  arch/x86/include/asm/cfi.h    | 10 ++------
>  arch/x86/kernel/alternative.c | 12 ---------
>  include/linux/cfi.h           | 47 +++++++++++++++++++++++++++++------
>  kernel/cfi.c                  | 15 +++++++++++
>  6 files changed, 56 insertions(+), 68 deletions(-)

Thanks, Sami, I like the look of this now.

If you can get the kbuild robot on board too, then I think we're good to
go!

Will

