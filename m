Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3859CC5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SuFUBjQVnne/HL+wqlQZd+V6iBFMzeExDV/fn8/DYw=; b=MkayeY3CiAF7ptJtpeP7KA1Ueq
	mAxdAw2dBV2SdG7lJCb+0fVI/lxO4VpCG27lLt+OEPPPkp7dIWE9RegqMoQ/lENUajQ/bGuPUBui1
	PJ2xwvfMDwxJrIDRpavRHyFI0JD5TjAyoDL8XbOkww4XXPdLAWIituo3gSFo/bTTpn+iG0jD2cUAM
	O8WkEj48jQHXF8Y5R8A+fzL+QkeEvb5TfkgH57/mzXCWBkVYw4qkNslGkdsrbyKj/dQvFBd0vfZpa
	NN5kbjC9xT7//CF62QACmnn2RQkQJ6pMoIQeHBGhyJe/J2TgWs47XWfVFNZPCsFfBIyPTCsry60AK
	O5e3HSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsltZ-00000009aAs-2wR8;
	Sat, 08 Aug 2026 18:35:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsltY-00000009aAW-26XG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 18:35:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D369B43D3C;
	Sat,  8 Aug 2026 18:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5951F00A3F;
	Sat,  8 Aug 2026 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786214143;
	bh=/SuFUBjQVnne/HL+wqlQZd+V6iBFMzeExDV/fn8/DYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VpRcCBVUNaRKn1WHzyF6KhEFgSfBf09eLND3KW5ZP9WGguqOSFcLIg37rs8qq0ncN
	 VXeZ6cAxrgD/8aXv9eLEwEO8NUTPp7Gi/F8eNlTHRIv2OZT94/Sfpe7NtQ/OT7mrfg
	 kg+UYkXHVXKMQ0u9TzwTo2ar6PYjkfio2/dHZdX3eGp7bZi606TK8vJrjS7nRb86mm
	 x11LyHxVeoo0zho3MQVAVMwkoaqI7kNa/eFcrnd2HVc5+Tv3XJzvNK0fqeOVJwti+h
	 4rWaMp66GT/EoCFPRBDm5x1D9hF/Ew6v2J8FsYNL7BXJ9UXIN3xikumRgwCrznaM8+
	 VZSOlSyPvhpwg==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	ljs@kernel.org
Subject: Re: [PATCH v2 0/8] KVM: arm64: VNCR TLB invalidation fixes
Date: Sat,  8 Aug 2026 11:35:39 -0700
Message-ID: <178621413203.380376.242769068720524648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806091026.620700-1-maz@kernel.org>
References: <20260806091026.620700-1-maz@kernel.org>
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

On Thu, 06 Aug 2026 10:10:18 +0100, Marc Zyngier wrote:
> Prompted by a patch [0] from Hyunwoo Kim which was addressing a pretty
> annoying corner case, I spent some time looking at what was wrong in
> our VNCR TLBI code. And there was a few things to say about it...
> 
> - The TLB tracking to get into the slow path is wrong. It tracks what
>   is mapped, but not the established TLBs. Kind of annoying.
> 
> [...]

Applied to next, thanks!

[1/8] KVM: arm64: Remove VM-wide VNCR mapping counter
      https://git.kernel.org/kvmarm/kvmarm/c/c55bc773b6e8
[2/8] KVM: arm64: Handle negative S1 walk levels in VNCR TLB size evaluation
      https://git.kernel.org/kvmarm/kvmarm/c/8053393680d4
[3/8] KVM: arm64: Consider SCTLR_EL2.M when mapping the L1 VNCR page
      https://git.kernel.org/kvmarm/kvmarm/c/8c774604b6ec
[4/8] KVM: arm64: Correctly handle end of VA space TLBI invalidation
      https://git.kernel.org/kvmarm/kvmarm/c/34af2c3e31f9
[5/8] KVM: arm64: Handle VNCR TLB invalidation race with vcpu_put() VNCR unmapping
      https://git.kernel.org/kvmarm/kvmarm/c/38640bc32be3
[6/8] KVM: arm64: Sign-extend VA for range-based TLBI invalidation
      https://git.kernel.org/kvmarm/kvmarm/c/239347008564
[7/8] KVM: arm64: Make VNCR invalidation participate in MMU invalidation retry
      https://git.kernel.org/kvmarm/kvmarm/c/2b7324f3a0c1
[8/8] KVM: arm64: Add VNCR TLB tracking again
      https://git.kernel.org/kvmarm/kvmarm/c/62e3bb894a6e

--
Best,
Oliver

