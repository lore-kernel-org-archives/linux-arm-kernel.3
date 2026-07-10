Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B065C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxDQXUffjDPiX8s75V9lUlztwYc8UXv2+mVoAik2+IY=; b=1lLQImCVJk4ImCVS6DthrGJSZF
	V8pWhFbgHSIfYQ6nVsv6LdmQtFSB/T6XpDntYqz4rdz4p6NX7sT2iairmDe1wCAfGhDSB1IdlkTn0
	nDfquBdaSoTDihhV7bLZmORo4XVQ817oSR/QQbnTfI6Edf99QF6DxYw9YeRGW4ltjCzmWNNcG0dF2
	MQKJa4rHBB8zF4Dz3lpXOnIJxp9A04BR+Eq8EO0QFfgxY8Lv5jMoVVLLbaQdfRYPIboK1IOYBvvjO
	i5iF7DNlaipiKJeZc3mYD/dwvWC/xpXcGOLPCoLfSol5egUjkPDMgP57qEoVQf0FY6TclxYbvk1D7
	0iJmMS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiINd-00000005l0e-28Pt;
	Fri, 10 Jul 2026 21:03:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiINc-00000005l0Y-2W98
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:03:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67A8140A90;
	Fri, 10 Jul 2026 21:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863E11F00A3D;
	Fri, 10 Jul 2026 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783717407;
	bh=IxDQXUffjDPiX8s75V9lUlztwYc8UXv2+mVoAik2+IY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PJIxyA9T9LcedZvZtKzFpv4Nv71M/63UFU1MMhcIJ/witPYFfZxgHfa0l5l3+46kt
	 S8jHOqiu9gYMsbCrNw8vyi2rh+mFTGaA5y/q1GxqAMAnyAY2FjVXpfiNIP5qD+lnOd
	 x+gHiqPkYwzJehN+CZ4ENbbhyy4g1NbaMx1nbQ6/l3nfpJC5uiIDnEmI/fdpb7/bxC
	 GS5jVf3EzR2VfcWfBU4XHLnmu429oiVjVzhjB6HOviZFMLcFnUW8YOTwmIaggNUGcB
	 /s/3BXiB253AW0lhVTgW8GBFyc8MrHQQ8oBNocaMftBoE9IqqOuX743M8LC6js1hC9
	 WpYSuyKI5vHig==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	oliver.upton@linux.dev,
	gregkh@linuxfoundation.org,
	mizhang@google.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	james.morse@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	ahmed.genidi@arm.com,
	leo.yan@arm.com,
	miguel.luis@oracle.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH 6.6 v3 0/6] arm64: KVM: Backport VHE-only boot fixes
Date: Fri, 10 Jul 2026 17:03:00 -0400
Message-ID: <20260710163023.agent5-0004@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709223604.12934-1-coltonlewis@google.com>
References: <20260709223604.12934-1-coltonlewis@google.com>
MIME-Version: 1.0
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

On Thu, Jul 09, 2026 at 10:35:57PM +0000, Colton Lewis wrote:
> Architectural updates retroactively made FEAT_E2H0 optional, meaning
> hardware can implement FEAT_VHE without FEAT_E2H0. On such CPUs,
> HCR_EL2.E2H can reset to an unknown state and must be initialized early
> so later code can reliably detect whether E2H mode is active.
>
> Without these fixes, booting 6.6.y as a guest under KVM nested
> virtualization will hang at boot.

Queued the series for 6.6, thanks. I also picked up the follow-up
"arm64: sysreg: Correct sign definitions for EIESB and DoubleLock"
on top.

-- 
Thanks,
Sasha

