Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFF4C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dAcwrd/aAJ61X/6DO4h8mgGnht28wDaOXsjCEr0sV4=; b=DYf/jpLlWlBoToNDdTU04VJQ89
	dX8dy72msFZL9y5toFoilHJYjVCIih3OVSQL5uq6UoSnRBl2Bttfxgwt4xIqDeBI8QS8kSdcu8WXf
	Aq+i9NShe1UVZC5S//DH1KzRoVMzyuC/VngH7PmxxHsi53X/pU6TtI79Q7Q47cD7303hN0091OO09
	W8znkdFMB1CkzUx9ROyFg6310yjC0a5N8J8K+6YLsPn9v57jsslVp7hPpNh7lCytzootr+Eu2xoDU
	jqefmxZGqEcLslFRrdjBp9FpONSO0/eE4S4MP50gKEE58jMSJfEFGLCLhwFe1aIrcvXXck0bha+qH
	kt+gQ4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1ds-00000006Kqu-2CXQ;
	Thu, 06 Aug 2026 17:12:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dq-00000006KoO-3xbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6007260DB7;
	Thu,  6 Aug 2026 17:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418451F000E9;
	Thu,  6 Aug 2026 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036346;
	bh=7dAcwrd/aAJ61X/6DO4h8mgGnht28wDaOXsjCEr0sV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jkGK2hxr6Ib/cwClCJ8F3GGJ80BmEpUSKLxiVALTt40wxP5RgsgdP/q4LQD5999Rm
	 uHN+dnFv8poaKQAIBX6KLd3eOsPo4ggkqRgZeqshdCqRwkEcV+7rIiGF7QV9Oclbbl
	 8hhubsTM9Q8tpTYbgYTc+VnfnPgQVQtFnrSQGWhxRSeqUhVG1mKErM2EsiH1QzsrPX
	 1BHZgkAp5GpqidaA4sE4FIVDAVtLSpVFhfSD62QL9kuswp+LbYSg/mgDioFq8IC+90
	 4LESRNP+zOeP0bIc+JSvyrRlRHBdiSKmvisg1JifbF2lL7xVAIvg0j0gKoZ152OtP0
	 t5AdLV6l0xqYw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	maz@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
Date: Thu,  6 Aug 2026 18:11:47 +0100
Message-ID: <178602166709.420813.3290777524014442521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 27 Jul 2026 17:34:08 +0100, Vladimir Murzin wrote:
> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> [...]

Applied first seven to arm64 (for-next/nmi), thanks!

[01/45] arm64: ptrace: Remove INIT_PSTATE_EL2
        https://git.kernel.org/arm64/c/b7f741717d1e
[02/45] arm64: debug: don't mask DAIF for mdscr_write()
        https://git.kernel.org/arm64/c/7cf2d6efb86f
[03/45] arm64: hibernate: mask DAIF before restoring hibernated kernel
        https://git.kernel.org/arm64/c/684bde100117
[04/45] arm64: hibernate: Restore DAIF state on error
        https://git.kernel.org/arm64/c/541549827889
[05/45] arm64: suspend: rely on daif helpers to handle PMR
        https://git.kernel.org/arm64/c/630ca6c58fcf
[06/45] arm64: suspend: Initialize PMR on resume
        https://git.kernel.org/arm64/c/d3ebdc1772c0
[07/45] arm64: entry: mask DAIF before returning from C EL1 handlers
        https://git.kernel.org/arm64/c/0d774e0517f3

It's a bit of a drop in the ocean, but they seem like sensible
improvements to me and there's no point in you carrying them out of
tree.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

