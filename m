Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE38CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZQP/9YRF583NL4L497GKu9NTRk2AV4bI24r7ys1hDE=; b=03613CjIK+9gSI2uAcUNMeFO0R
	nek90byD1khCXTD3vJXa/T1ygAQ9I7EU1iEim82vbQbS+ZPSWGV5EnOe9hWkEcsIyObGh9rzPxdTo
	IR9FOd3frzKIy6A9Q3PSJaWIn3KqtCn9UJXwbEmdDTBOsSFSh844TGn475zj0wieXmDJudVyFhYnJ
	Tah7aRf9lL21EgH95lVftI8/tkOGrSbI0h/DSbMWkPPMLEt+9q3KQx7GbTUjYGFyPWXMt2iVB5+rF
	6i50TUrf5k2pHA3DX19Dra1BocpJ1b+GSQkm6xbYBLBzQ7moLpROD+dPAaW8LywbPKIhSEGLx7nz4
	ixyBMRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhTc-0000000H7h4-33Jb;
	Thu, 27 Nov 2025 19:16:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhTa-0000000H7fp-0RJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:16:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 153E2176A;
	Thu, 27 Nov 2025 11:16:14 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F12D3F66E;
	Thu, 27 Nov 2025 11:16:20 -0800 (PST)
Date: Thu, 27 Nov 2025 19:16:17 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	shuah@kernel.org, Oliver Upton <oupton@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 0/2] set_id_regs cleanup
Message-ID: <176427094645.1018621.6342347190473898593.b4-ty@arm.com>
References: <20251125101207.1492580-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125101207.1492580-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_111622_182209_00E11D31 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, 25 Nov 2025 10:12:05 +0000, Ben Horgan wrote:
> For this v2 I've dropped the ksft_test accounting fix. Mark Brown has
> more extensive changes [1] and looks to be a user of the set_id_regs
> test rather than someone just doing some cleanup. The other change in
> this series is to remove ARM64_FEATURE_FIELD_BITS from the tools
> sysreg.h header rather than the kernel version. I'll send a separate
> patch to remove the kernel version.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks!

[1/2] KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user
      https://git.kernel.org/arm64/c/bf09ee918053
[2/2] KVM: arm64: selftests: Consider all 7 possible levels of cache
      https://git.kernel.org/arm64/c/4138cc63d3ef

-- 
Catalin

