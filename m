Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81B6C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 00:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t67lzjuNhuqGREvzVTrkwcsIDvrKBgIXJKoX7O/nXzA=; b=yq+OB5StjAyFZnZJ6Qy8SHIJ5M
	Zjwd3SaTv6oXryxfwoOzlK8akMysXbQX8Gw3FBHwk26c0rkzwqvT3w3twS1o9y9VXLUrVx4sCcmHT
	02lrb/nnOlgUhN5RQSns2FkYZbT6+nVSq5F1rwXbgeLayjhuEEPLhwythY2uMgrmVc+kh4rWAQN7w
	E3GKpLApqC+O8V+8S/4ppVRVQAnqGaimteSYFb7Lf4K2Snqe29h7iQCbulypm7r6/dhNabmzVQ+71
	h0LIBNvmKe+4pMuF6HfL/bHF1czI3bu6Ly190Uqg2f4Pg9xPdABEItO0O2X38nc3Qxhdfkc882u3h
	mXPuLmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa2x-000000012wh-3YTd;
	Mon, 07 Jul 2025 00:49:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZyw-000000012Xg-30YZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 00:45:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8792A45453;
	Mon,  7 Jul 2025 00:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E09C4CEED;
	Mon,  7 Jul 2025 00:45:06 +0000 (UTC)
Date: Sun, 6 Jul 2025 19:45:04 -0500
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Breno Leitao <leitao@debian.org>,
	Ard Biesheuvel <ardb@kernel.org>, usamaarif642@gmail.com,
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
Message-ID: <aGsYkFnHEkn0dBsW@arm.com>
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
 <aGaxZHLnDQc_kSur@arm.com>
 <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
 <aGfK2N6po39zyVIp@gmail.com>
 <aGfYL8eXjTA9puQr@willie-the-truck>
 <aGfZwTCNO_10Ceng@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGfZwTCNO_10Ceng@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_174518_781087_C31FFBE5 
X-CRM114-Status: GOOD (  16.02  )
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

On Fri, Jul 04, 2025 at 02:40:17PM +0100, Mark Rutland wrote:
> On Fri, Jul 04, 2025 at 02:33:35PM +0100, Will Deacon wrote:
> > I would actually like to select VMAP_STACK unconditionally for arm64.
> > Historically, we were held back waiting for all the various KASAN modes
> > to support vmalloc properly, but I _think_ that's fixed now...
> > 
> > The VMAP_STACK dependency is:
> > 
> > 	depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC
> > 
> > and in arm64 we have:
> > 
> > 	select KASAN_VMALLOC if KASAN
> > 
> > so it should be fine to select it afaict.
> > 
> > Any reason not to do that?
> 
> Not that I am aware of.
> 
> I'm also in favour of unconditionally selecting VMAP_STACK.

So am I.

-- 
Catalin

