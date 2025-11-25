Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EBBD0EE0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pzv4wPySUCo5TjyWJfZWczih4hDk48kb3MpklOlTZw=; b=S86M1y9bw9mCLufG6dfWj+Aut2
	9bW0T10G5Rfrb39c+DufD34u/nxV9MTs4080U0U0vQ4TXICTNm4ou5dLRndK/qPcx3MaIMwXS1Zig
	Ds/mxi75JvbUAg0ZOqQ11tQOLzkfnwIDTBk+JgH/UuzPhOBM/fOxVMnMULAoLrOnccE4s5Kgq+8dB
	WX1eH87i7xuWNXKHNp4em/ZiDWohFmw/m71JYWqDBvJIiwr33R8mqQXSlUnrB4umiehNNQ5w6bblA
	r5g9mbQu5DWaJaoyIjLSHK0YPqRJu0llkFk6riCx7mh5JEHDQMa/KinnXEhADNMsFhlkF+e3FAvR+
	5dWv7kPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxpJ-0000000Dlz9-1D2Q;
	Tue, 25 Nov 2025 18:31:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxpH-0000000DlyU-0qbi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 18:31:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4229A1570;
	Tue, 25 Nov 2025 10:31:34 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 294003F6A8;
	Tue, 25 Nov 2025 10:31:40 -0800 (PST)
Date: Tue, 25 Nov 2025 18:31:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, will@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, shuah@kernel.org
Subject: Re: [PATCH v2 0/2] set_id_regs cleanup
Message-ID: <aSX2CSJEwUYkn5GQ@arm.com>
References: <20251125101207.1492580-1-ben.horgan@arm.com>
 <86cy56qgi3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86cy56qgi3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_103143_300485_35DFBAAF 
X-CRM114-Status: GOOD (  17.14  )
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

On Tue, Nov 25, 2025 at 03:27:48PM +0000, Marc Zyngier wrote:
> On Tue, 25 Nov 2025 10:12:05 +0000,
> Ben Horgan <ben.horgan@arm.com> wrote:
> > 
> > For this v2 I've dropped the ksft_test accounting fix. Mark Brown has
> > more extensive changes [1] and looks to be a user of the set_id_regs
> > test rather than someone just doing some cleanup. The other change in
> > this series is to remove ARM64_FEATURE_FIELD_BITS from the tools
> > sysreg.h header rather than the kernel version. I'll send a separate
> > patch to remove the kernel version.
> > 
> > Tidies up a few small things in set_id_regs. The removal of
> > ARM64_FEATURE_FIELD_BITS touches other code only so much as it removes
> > the define but set_id_regs.c is the only place its used.
> 
> Acked-by: Marc Zyngier <maz@kernel.org>

Thanks Marc. Shall I take these through the arm64 tree, together with
the removal of the macro? They should have probably been a single
series.

-- 
Catalin

