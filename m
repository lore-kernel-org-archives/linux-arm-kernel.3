Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10618C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baP+hytXxCA9BTjAQikAvw9FlFzTTrIe+yKS0C4px1g=; b=l6fF5RIk46nP8yC1L6oAlXd9VL
	4OntuMGoeAAXZfxOHU/yPjhXMDWIFKpif1pa5/KzqxdFIAnLuSmMRK+JfM1ngQL39cNQte5++VN2k
	pClVQ0Z5aoDDNrUr9Tnp+5mA9VcykLi/X4BcyVq9oNCzPGekuSdhjkTgEmgh6IuoGHkcvVd+ofoYu
	F2dU3hocicsHAcS3ANUVUbccrNXl1DEMudX6z2w6d1QFej1lEw7JJh8z/vwX+PO4Fq8TkUcdDenD+
	KAqnlBWNb9qSBD+Lg5RDcSruDFGky3MdTVtsbCmL5/BD26dOvoO735Nba9ZQc3GDXkvzLtf8g9fBw
	Lx4+FzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4K7-00000009yGY-41oV;
	Mon, 19 May 2025 17:30:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Xb-00000009qGb-48TK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:40:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0299113E;
	Mon, 19 May 2025 09:40:25 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F6E93F5A1;
	Mon, 19 May 2025 09:40:36 -0700 (PDT)
Date: Mon, 19 May 2025 17:40:33 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Song Liu <song@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org, indu.bhagat@oracle.com,
	puranjay@kernel.org, wnliu@google.com, irogers@google.com,
	joe.lawrence@redhat.com, jpoimboe@kernel.org, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] arm64: livepatch: Enable livepatch without sframe
Message-ID: <aCtfAcg32kbczs-g@J2N7QTR9R3>
References: <20250320171559.3423224-1-song@kernel.org>
 <Z_fhAyzPLNtPf5fG@pathway.suse.cz>
 <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW4MAcVpXmZVQauoaYe0o3tDvvZfgmCrYFFyFojYpNiWWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_094040_066174_E65BE5EA 
X-CRM114-Status: GOOD (  10.96  )
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

On Fri, May 16, 2025 at 09:53:36AM -0700, Song Liu wrote:
> ARM folks, please share your thoughts on this work. To fully support
> livepatching of kernel modules, we also need [1]. We hope we can
> land this in the 6.16 kernel.
> 
> Thanks,
> Song
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250412010940.1686376-1-dylanbhatch@google.com/

I've had a quick look at [1], and IIUC that's a hard prerequisite for
livepatching, as without it the kernel *will* crash if it attempts a
late module relocation.

Given that, I don't think that we can take patch 2 until Will's comments
on [1] have been addressed, but I think that we could take patch 1 (with
fixups) as per my other reply.

Mark.

