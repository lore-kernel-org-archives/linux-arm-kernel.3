Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16CCCD4F2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waMIux8r+L0MrIcI6WQFTntj+25g832hc9wwYZGR674=; b=eoBrzlK8P3mIeO8/iTpcVgjgl3
	h23x78PipPWpROP9QoxgwVmCauHyTZgNsk0dTvsO86SPpkvP6uTQRQtqLcYpEkf/97XRyD/+GGfrv
	ZTlwczHpQPgT+QDGq9jHwwuMtitURDxpHA9YuShfyqRs9WGwT2GOYRrFI4pzXtvnTgkVsMdgqM9id
	hReQd4CYOZXfaLDF2QewHCM63vbVFPV2tvv1848pBGlVHGCMGDbc7ylfJjS/gPq+2p/5MUn6xHr+p
	pkuekoPT8LIK7mOTr2cQ2a2G3OjmuznGvnJvkZwamBIe4bAJlZVF3ThOTYnTYqShWCSa6xPDj7LqH
	2Zkg96Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJP2A-00000009srC-2nT6;
	Thu, 13 Nov 2025 04:34:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJP27-00000009sql-2OHe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E07143CE0;
	Thu, 13 Nov 2025 04:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B6CC4CEF1;
	Thu, 13 Nov 2025 04:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763008446;
	bh=xjyuAAPDocq+pcIMgJPYGtD+7FFq1Kw4NmzC0x4omiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Dl+5ZE8s54+WHTwow/GK+kcMRaEBwrSjov4DLNKxDGWpvU/5o3AgVOdRni3b8MKqs
	 clraPd4U/ENbc3uRwLNq4BxFdQCo+aM48L98ZJKaidvOa8aK38v1YfjplnUKUUJsCQ
	 YZlGGJMu4eY7Cjy2EnAFJM6POEGLvBL3YFp5ZMgv3qyZdNzU8JSEflkKZCJcE1rb1T
	 fPUC1S4tN4Uzjqj6jZK3ogtfR72tNEJILdIbpCFfDVgXoDM5sVpSRDy7KItHZsLxcY
	 8VuZfQ3jVZXnf2OTf+8pEaOGdhyXj13cMia1CSSBZkAa1UmbsJCa7UgNgdifuWT3om
	 DixDj+fW+b3xQ==
Date: Thu, 13 Nov 2025 13:34:03 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 paulmck@kernel.org, mhiramat@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-Id: <20251113133403.308046d2df1c97ba7dcd2388@kernel.org>
In-Reply-To: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_203407_627836_D9BB8F13 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, 12 Nov 2025 06:05:43 -0800
Breno Leitao <leitao@debian.org> wrote:

> Hello,
> 
> In most major Linux distributions, it’s common to have a separate debug kernel
> build. This variant is compiled with additional debug configuration options to
> provide deeper observability and easier debugging, typically at the expense of
> some performance.
> 
> This approach is also used in several companies, including mine. The debug
> flavor is usually a drop-in replacement deployed when investigating
> issues, allowing quicker identification before more detailed manual
> debugging.
> 
> I’m currently debugging some hung tasks using the debug kernel flavor and
> noticed that backtraces weren’t printed correctly because PSEUDO NMI isn’t
> enabled.
> 
> AFAIK, to enable PSEUDO NMI on ARM, the following are required:
> 
>  cmdline: irqchip.gicv3_pseudo_nmi=1
>  config: CONFIG_ARM64_PSEUDO_NMI=y
> 
> I wanted to have pseudo NMI enabled by default in the debug kernel
> (without relying on kernel command-line parameters), but this isn’t
> possible today. The reason is that `irqchip.gicv3_pseudo_nmi` is an early
> parameter, which can’t be set through bootconfig, so, independent of my
> .config, I need to hack cmdline arguments to have the debuggability
> I need.

Yeah, that parameter is for early architecture initialization,
which is done before parsing bootconfig.

Can you try building kernel with:

(arm)
CONFIG_CMDLINE="irqchip.gicv3_pseudo_nmi=1"
CONFIG_CMDLINE_EXTEND=y

(arm64)
cmdline=$(cat /proc/cmdline)
CONFIG_CMDLINE="irqchip.gicv3_pseudo_nmi=1 ${cmdline}"
CMDLINE_FORCE=y

BTW I wonder why you can not configure your bootloader to pass it.

Thank you,

> 
> Question:
> 
> Would it make sense to provide an option to enable pseudo NMI in certain
> kernel configuration without requiring an extra command-line parameter?

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

