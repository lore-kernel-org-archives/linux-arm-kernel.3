Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1798C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4nrK+EG1GYlb31PoHngslvUKC6lV+cyNjjOiGNjsFY=; b=4/q5FVH/gVqOEiWm9w9lczyXfs
	rSFckBR3/YMVIeiKCMtyr2PtG57u8W4dOJqiojG7EtDc+8amgf8BvhYi4pN9c2jIi+WkNpABaXCI0
	+1skrlKoy3HMYgNL6atSUNTRFHfe5wbLms36zPQORfbnfbsRh4h6R+EBTjM1ZgepWsMc5VcE4WZH3
	yt7s+jelJb+2fqgXAlc6AsyPacq/jpBGsLodTsheptjXlb7Q0RYtYvOZ0MMqvvdJuBr+tSx4bVXun
	ZEqxYZM/5cxg8h9giET0r9x98K/Rg3vYMmHmlueKeHoM5wOwjFCiYPii1hC+88pvvnNPHnFDYxTYD
	EiTnxneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC40-0000000FIXy-21XB;
	Fri, 27 Jun 2025 16:36:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBFp-0000000F99f-4Akc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B642437E6;
	Fri, 27 Jun 2025 15:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FD1C4CEE3;
	Fri, 27 Jun 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039081;
	bh=LURfJhqAl+8BHurWPCQDTi9LgUDBYI8WDX+YxZQ2m1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRHm3PrBp3xrpjPdG/q3p1NN7SbpFRbY/cp2+Yg1U1LXnX+Mjt5k+cl/vRUD7I+cY
	 s+Rg8PwhUP65NeKOB6jURqCNvtRneCRwpgSwQPLuvaqMdf+N7XGZRV/E1R7Z8QBIrV
	 9k4ceP/niRzMxW/m0bv63AOJG2IRq0Z7Wbre+QO3B+FTyoqD5z27HlQHAc7as7Kz7k
	 hjtfp8hG1pBlBUc1z5NXaEUhvWZqCiucngIAKy1Ap3o61mV1b+N9Ah15GISkrStWjd
	 uqv+huheXwTEGoDhnJiGwLF7tmVIjRsBWcTPRmP+8hChd0zBPq/u35P8sv1YtLgwEs
	 lpOrxiQSkA03Q==
Date: Fri, 27 Jun 2025 16:44:35 +0100
From: Will Deacon <will@kernel.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com, corbet@lwn.net,
	patches@amperecomputing.com, cl@linux.com,
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
	xiongwei.song@windriver.com, ardb@kernel.org,
	inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2 fix-v2 ] arm64: refactor the rodata=xxx
Message-ID: <aF68Y5aQFBqShtjD@willie-the-truck>
References: <20241212082426.4110-2-shijie@os.amperecomputing.com>
 <20241217071715.24797-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217071715.24797-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084442_054376_542058F0 
X-CRM114-Status: GOOD (  19.02  )
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

Digging up an old thread...

On Tue, Dec 17, 2024 at 03:17:15PM +0800, Huang Shijie wrote:
> As per admin guide documentation, "rodata=on" should be the default on
> platforms. Documentation/admin-guide/kernel-parameters.txt describes
> these options as
> 
>    rodata=         [KNL,EARLY]
>            on      Mark read-only kernel memory as read-only (default).
>            off     Leave read-only kernel memory writable for debugging.
>            full    Mark read-only kernel memory and aliases as read-only
>                    [arm64]
> 
> But on arm64 platform, "rodata=full" is the default instead. This patch
> implements the following changes.
> 
>  - Make "rodata=on" behaviour same as the original "rodata=full"
>  - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>  - Drop the original "rodata=full"
>  - Add comment for arch_parse_debug_rodata()
>  - Update kernel-parameters.txt as required
> 
> After this patch, the "rodata=on" will be the default on arm64 platform
> as well.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
> Add more comment for "rodata=noalias" in arch_parse_debug_rodata() from Ard.
> ---
>  .../admin-guide/kernel-parameters.txt         |  2 +-
>  arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)

Sorry, but I'd missed this as you'd sent it as a reply to an existing
series. When you send a new version of a patch, please can you post it
as a new thread with an updated version?

I think the idea of this series is good, so if you send a v5 against
mainline then I can review it.

Thanks,

Will

