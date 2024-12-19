Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E859AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tT6nIixbMZCyuVj09HSsIgV9dvdbVamiZ90Ow4o8Dgw=; b=seOAZWBveTNoJqtwBSdlRsZXzD
	BEsZQEOD2Edwx5q/cprsHOs5IBzz3OfXRB0ARdF6bBKxjEn1uYThU5cuXapDaCp0r/xBaKXJRJb5/
	Po4xHSicgozCC6RxO2b+hrEU0bbTZTjFW17g0liWqWNIfQ4D1n5LAWY3AtHiKyQz+OCNVihZxIwj1
	VUYFYEIJBPzaytm4YBEVxFYcmIJHHbqQgOLqdV5apyJq0pp1YY1vAcAXwln618RvHoePFdtRG7Ev8
	cRdF1rzYCPUJiz/iewXPBGsSH18Z5aY8IRyJ300juVROdV2x0S5+tnz8IrgTNMQ0as0PrrIMRE3jW
	btTSkOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMXm-00000002tx9-3Tqk;
	Thu, 19 Dec 2024 19:50:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUg-00000002tRn-1fAA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6FA35C68F3;
	Thu, 19 Dec 2024 19:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1147BC4CEDE;
	Thu, 19 Dec 2024 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637653;
	bh=QbIWuvJkAjzgbFMcr9LS5gY4MBhrgadLFDQpbMSDlJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kMh46afrmOIPlqKaPuxWgIuJLr/KMyVYbEyEk22rtJUd6L7bNOw2tZ3KGkv6fHRcJ
	 z9JR7DoL8DkTpJycGiiuzZ01MJIrnVj62TojqwQye3pvbMN1rzh6UkjmcUiPjvs0Bs
	 30E3ZW9zCz2oBw6SQSNTv7S6XbAQvAM8tUp8mompxDKvDSQRALM5O+dCCi25BLUIno
	 B4++JibIJ+s0srbfC9et6zIyckzONouw/pYLevA7AkUeIHjrCxrX2wfowmib90NMyU
	 YBhrNKccQbL6XvKaZkqe1TzIhcltHNDPAW3fxxE+SeuWDMTb+5lRe2UJe+TbYfrCiA
	 H3Ps8h92FBW4A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/4] arm64/sysreg: Get rid of *_ELx as fields for EL12 accessors
Date: Thu, 19 Dec 2024 19:47:10 +0000
Message-Id: <173463125944.3934348.13870436616394837034.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241219173351.1123087-1-maz@kernel.org>
References: <20241219173351.1123087-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114734_474434_8AC78A22 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, 19 Dec 2024 17:33:46 +0000, Marc Zyngier wrote:
> We keep adding *_ELx definition to the sysreg as an abstraction for
> the mapping between an EL1 register and its EL12 counterpart.
> 
> But nothing in the architecture has these ELx suffixes to describe
> such abstraction. When they are mentioned, it always is as a shortcut
> for EL1, EL2 or EL3, and never for EL12. That's because *_EL12 are
> *not* registers. They are accessors, nothing else. So what we
> currently have is not only bizarre, it is actively wrong.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/4] arm64/sysreg: Allow a 'Mapping' descriptor for system registers
      https://git.kernel.org/arm64/c/078bc96539c3
[2/4] arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
      https://git.kernel.org/arm64/c/7052e808c446
[3/4] arm64/sysreg: Convert *_EL12 accessors to Mapping
      https://git.kernel.org/arm64/c/233fc36bb5a2
[4/4] arm64/sysreg: Get rid of CPACR_ELx SysregFields
      https://git.kernel.org/arm64/c/e5ecedcd7cc2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

