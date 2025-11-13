Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B97CD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3geGswiqCo3GsUSfNRmOgAZx3bknHVtZ13LGHgpLV5c=; b=jMMbzl2ab9WHyYgBOf/x3noeT7
	ByHzjsv+Gs5iA0Toow4G4FVm+GQzTT925zgLFbeBvmEUHirhl2WuTq5+g8DSwLDT7lwQgl5MSFY5o
	BYw44e3clV/8Yidyh1B2bQPTSn2aGNifnH+vp2fe8v89strAlr0Rwc8nld8JDdo0QC0eBHL+NtrVu
	V4QkrOlq/XjOZK1T3SVuz6QNhBCqBGzEv8OR7HRma8kRSeP0Iy2Myt8C5FEnoiziRYWkE33gUgVWV
	R1qAi1Z7h4U/RSov1m4mx34msaMBv1PNSbmzZP5RUG37rY5JNR6szZhpnZ2MprMh09uexMZWBAyR2
	KK59Zi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf0p-0000000B8g1-0KP6;
	Thu, 13 Nov 2025 21:37:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJf0n-0000000B8f6-0XXx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 21:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E6BB60123;
	Thu, 13 Nov 2025 21:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC1DC113D0;
	Thu, 13 Nov 2025 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763069867;
	bh=rxL7Gci2ztB1l+oHFBXQu9xc4TlmQwnasATOD0+gSsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GvkUI3zh4TXQWAF/jkz1rD8ACMooMrT6gTt6F7LqLMW0pIbenBrms060ck2KP7zLm
	 5Qg6dNO4uS5dUXXfrC2ZSdYAR1Oe2qhtLoF64+aaRC9q1iD0QlGn6+LgoweHYF2iXq
	 PM7/Ey2rJpvQUR4ofpCIfRTxVeI3rq6OBU3D2iHnXWljtJKoQ/+aMB6vxTQWQf2Lih
	 c8jH5OjwrC4pdKMeR7Kjo7m8aSonT3vptbPfqXgc/4/8nBMPWd2eHVllqhY/+0S2/u
	 8uetADDxajYTDLYQevWVJ4pXGiXpmYMGgvf81FEhuecA1cz/YDODAjLZP6weJ6hODn
	 GFjPZZ12zK7Hw==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] KVM: arm64: GICv3: Check the implementation before accessing ICH_VTR_EL2
Date: Thu, 13 Nov 2025 13:37:45 -0800
Message-ID: <176306986138.2184993.9505471875702043816.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113172524.2795158-1-maz@kernel.org>
References: <20251113172524.2795158-1-maz@kernel.org>
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

On Thu, 13 Nov 2025 17:25:24 +0000, Marc Zyngier wrote:
> The ICH_HCR_EL2 patching code is generally GIC implementation agnostic,
> except when checking for broken Apple HW, which imposes to read
> ICH_VTR_EL2.
> 
> It is therefore important to check whether we are running on such
> HW before reading this register, as it will otherwise UNDEF when
> run on HW that doesn't have GICv3.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: GICv3: Check the implementation before accessing ICH_VTR_EL2
      https://git.kernel.org/kvmarm/kvmarm/c/8ed2ae76f20c

--
Best,
Oliver

