Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892C5CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NFQND2bBLSKcxHd4866jX5YaYjgomSawNC5YiSuAKA=; b=H8BwsccSe+ap8FsQI6dlOVBaiU
	utoiQxbzTrNLqquEagAdGQk5+OHwiPRl2l5X8ESQKlrMWHIfUzmlyO9XqqfyVlzWC5+9vGGJmRtei
	wCF5dkFXG7x6IlN2S9neQ/euxJNr/cGmBR7HliKZtfY1NXzdopmKSbODnh/tV+pVCEECDXZ5A17eB
	E0Bq8d3jhUpvwgIsN89f4Aj4NS+bFWQX1bifRqFOPy8C63CyFIAKotNATCIrpzC4RR5VfA8hhbfyE
	OUOCsIBW0jPObsVPAK6qHmv/Yvw3DdYdrOEbin70Vz9ZLxpdUoVgIaWxhcGFg9Lvzfsnbgz8lbmvG
	jqMhqKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uumC9-00000006zBF-34rz;
	Sat, 06 Sep 2025 06:14:41 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uum9K-00000006yiO-3858
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 06:11:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757139103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NFQND2bBLSKcxHd4866jX5YaYjgomSawNC5YiSuAKA=;
	b=haGuMH4/9MQ1i8a0rvaUXsu8yFTDMngQShGe8qVeYZkb/qfA0PpeSzmLmoChvAIQqPzwiM
	Qzlr33tEud3ehDJmUEYacn5rAl5294Hn8Mmj5frISc0eSZG198jv27ot2/NRTna1Gcxl2K
	9c0gPtkUKlrRpNhZSPUyDftng6jsfAQ=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	p@sswd.pw
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Subject: Re: [PATCH v3] KVM: arm64: nv: Fix incorrect VNCR invalidation range calculation
Date: Fri,  5 Sep 2025 23:11:29 -0700
Message-Id: <175713908291.1682559.5048017839017321240.b4-ty@linux.dev>
In-Reply-To: <20250906040724.72960-1-p@sswd.pw>
References: <20250906040724.72960-1-p@sswd.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_231147_542896_E36AC2D2 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Sat, 06 Sep 2025 13:07:24 +0900, p@sswd.pw wrote:
> The code for invalidating VNCR entries in both kvm_invalidate_vncr_ipa()
> and invalidate_vncr_va() incorrectly uses a bitwise AND with `(size - 1)`
> instead of `~(size - 1)` to align the start address. This results
> in masking the address bits instead of aligning them down to the start
> of the block.
> 
> This bug may cause stale VNCR TLB entries to remain valid even after a
> TLBI or MMU notifier, leading to incorrect memory translation and
> unexpected guest behavior.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Fix incorrect VNCR invalidation range calculation
      https://git.kernel.org/kvmarm/kvmarm/c/5b9c1beaa1fd

--
Best,
Oliver

