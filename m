Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48283CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJzFTe46F7SyRJFk4aJB20oIiUGK8Uy4qQAc6lafjH4=; b=S7/oi9ll8R+Q+adtdOR04RdUWN
	gO27/EUFEXklJ3eh+MmGXg2Wc6Y8VaUAoNWJX/Erxjw2beexJwbyOfjj0fECB+QyiRBHewvn31Cvv
	vgBijrgwAGxGuoYXoN6m3Nl2ST9d0J5aoVazzlDER7rOJcduGDgjpVo1mhoSUVyxpF7DOLEzd4+6c
	g/FMnQ6CFmkMcFrvZAMp7NK5XK8u3U6h4VP6vjtOl6H3y8LvULOFzPsJDCXrWdR6EcQ6ex7UeSstv
	nXYdUqFZLCK1NYzAL5nSb3epAWUXKLmIhSNu7rADLpGuY5uNlmspc1TCCABgrDKfCRysG79WJdvY5
	nkhFx+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjtS-000000047b5-1OPz;
	Thu, 11 Sep 2025 16:11:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjtO-000000047ZF-1vq1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2253D43253;
	Thu, 11 Sep 2025 16:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6392C4CEF5;
	Thu, 11 Sep 2025 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757607086;
	bh=F6rpAcs6AuSZfMpWOUiVYz+zbOkP8L8AQHJbK2gAKuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O68+ouopGE+jfpd24CxLs5kkmPVexpvQFmGHuxv1jys7ftxvaw+XhcCeLaOhD+O47
	 QDyBunLdjZ32E/ZirAJvv8y42expeYRHyTlc7m4SA7FSK8++uz3kDENhPJunF3i2Vs
	 F6zwZhYVHPfi8t4ctfiZUNjLx6Fib7e1Z2qJxd5B14aFzlgRQ6DP1J4FJT8Z+rrQTc
	 6oBLlQS56fF/CCPHpJI9aQPJo291kZvKFyFPoVMLoTIp9/FmsaEGCWQdqGTlKANe3o
	 sj3e+CW8DAyOrlhgFnLLNu+M6a71kIoopb/TEqp5zU53k4yXY8JU8zGcTLOi2Bxdd4
	 V00jLR2Qjp1bA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	vdonnefort@google.com,
	qperret@google.com,
	sebastianene@google.com,
	keirf@google.com,
	smostafa@google.com
Subject: Re: [PATCH v3 0/3] arm64: sysreg: Fix sysreg field definitions and generation script
Date: Thu, 11 Sep 2025 17:11:13 +0100
Message-Id: <175759836827.886602.11949922116281673131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829095143.123476-1-tabba@google.com>
References: <20250829095143.123476-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_091126_546454_E137AB21 
X-CRM114-Status: GOOD (  10.59  )
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

On Fri, 29 Aug 2025 10:51:40 +0100, Fuad Tabba wrote:
> The sysreg definitions file has a few errors. In Enum Security,
> NSACR_RFR is set to 0b0001 instead of the spec value of 0b0010.
> Additionaly, the sign of the Enums DoubleLock and EIESB are wrong
> (should be Signed and Unsigned, respectively).
> 
> Moreover, the file has some redundant definitions, e.g.,
> RCWSMASK_EL1. While these redundant definitions are not wrong per se,
> they add unnecessary code into the generated header file and could be a
> source of future bugs.
> 
> [...]

Applied to arm64 (for-next/sysregs), thanks!

[1/3] arm64: sysreg: Fix and tidy up sysreg field definitions
      https://git.kernel.org/arm64/c/2c2529e47062
[2/3] arm64: sysreg: Correct sign definitions for EIESB and DoubleLock
      https://git.kernel.org/arm64/c/f4d4ebc84995
[3/3] arm64: sysreg: Add validation checks to sysreg header generation script
      https://git.kernel.org/arm64/c/382cbbe7fb2a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

