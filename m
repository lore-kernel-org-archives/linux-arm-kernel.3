Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ECDC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IguZ5Oag0covDIAikAUhxM1m701WZwel7fdytL4nLjY=; b=5C8uL71dqrZcF0BpO6Qqr0Hv/H
	aTBUL5QmDi9fHBNS0dRGm0iAjd90kNea9LS4j6jAnAFCdReHTwqaW9rdSmq/pz7yxLBVVSIRucdnm
	7QvNRBvoBckXf62KVIwlucNe/xiJoy0U3KrmVrw05MnmIpzyguVH6YSmuX4k33Bz0gQ7zch7WtIR4
	CWBExGvOKIa6z32LHgxeWlAgmhoXsJ5qsSF4z5xMAY4QTT4IJ7pked9goSn9dFSRj1LWr0PjBnohb
	wSPCNvh1Nsl7JQYeNcyrZZ3FvGJsQm5v0IbPjNmapXpes2LMsClNWZB9OYxcM0/It6ORNT/f1HkGe
	TsvWD8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGB-0000000HWGN-1B7M;
	Thu, 13 Aug 2026 06:49:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPG9-0000000HWFo-3zvo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6367C43E92;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B591F00ACA;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603789;
	bh=IguZ5Oag0covDIAikAUhxM1m701WZwel7fdytL4nLjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IqZCADmtaZEws8oz6nZP8szNmcqesy1n85piLDIEHAVoWLtH7YgUKTfqOKU/fjnAX
	 UYoKz/afxUxTDB1retLFMC7x2b9GSYgunmvK7OmehYcaPgImTZ0btpINJ2nsaGrsFT
	 BeZhogncnUxqsUXSDU3HLD03/zpoUhil/UoGw6WCKh+ANjFr4RcnHEXUh8C0EcwAUW
	 ABl/4/AWwx/7/mhPQBgZ05GFTA/+rokAdZhfP363Cb2vSBlEx9DSZK5d3TKIvTCCSE
	 RqeWYtJhEmMcsXoqvcAkB/YSDa1rVGaET4SctD0N8DpaWknUxPMBmxkWMh1PDwYvOV
	 Wj+XBQ62Oobhg==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	jic23@kernel.org,
	Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic: Fix detection of MI on no pending LR
Date: Wed, 12 Aug 2026 23:49:42 -0700
Message-ID: <178660378191.666424.10998670140107835415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810102923.2426475-2-kajetan.puchalski@arm.com>
References: <20260810102923.2426475-2-kajetan.puchalski@arm.com>
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

On Mon, 10 Aug 2026 11:29:24 +0100, Kajetan Puchalski wrote:
> As per the ARM GICv3 spec, the maintenance interrupt identified by
> ICH_MISR_EL2.NP is asserted when it is enabled and no List register is
> in pending state. This is further described in the document as "no List
> registers with the State field set to 0b01 (pending)". By checking only
> the pending bit of the LR (bit 62), KVM currently asserts the MI when
> there are no LRs in "pending" or "pending and active" states.
> Fix the detection logic to consider only the "pending" state.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: vgic: Fix detection of MI on no pending LR
      https://git.kernel.org/kvmarm/kvmarm/c/a342faadc5ac

--
Best,
Oliver

