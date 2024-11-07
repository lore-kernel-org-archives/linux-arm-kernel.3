Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF606D43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByeRPKBWxzkxPFcmPuiuxw6DpdBBLZ0bXdRjXzYZSw8=; b=K1K6qWb1KokfDOw3OpE6ibCXh6
	2fq/3T4UOiDFNytPIusL5mcdne00Pc9VvNkl/TpkS1/f3pNswyCJOFQOG3B2D7XOe3Iea50RoThKn
	cCpi0NHHnvOH4eWQyLOZcXoAfgoS1tGJhU9A7Ejy9jmMh1NIcndtIMpdZTyJrBiStq/tUjgfwTFVh
	0ex7vkXZwUfopelkTh9N4bTuoXPqMN2jZPBIxv+PDJA5x8QvgNHG3ek47dHFwtBWRANG2Bx8V/qvy
	k7Jg3gkPtvsJjBotYyIMkjP7aSzUQCxRfR/QO0xJ0fuUIFkvJwQXVEzSyP//L2b7HFv2WF0O9yNCE
	pDLxI/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Y5-00000006v2S-2PFj;
	Thu, 07 Nov 2024 12:23:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91U8-00000006txK-3hmt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 932FA5C559A;
	Thu,  7 Nov 2024 12:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDA1C4CECC;
	Thu,  7 Nov 2024 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730981974;
	bh=PMG+rqlABVBz+TqA6nHYjw0V4WbjciJIqXhw0ydeDBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8V8HpJITTPmja2fujD4n7zRSQFfnm6FOleJVFliFEYtzsasJyxzs8n+ITApVzsZL
	 +y+HLeswGO8p5X3x7XoCANdaked5j0Imcxpb5c+Njfa15INmW8jhLLbxo7B464PmN3
	 /dKGfdgwBA5udEd4cyTHcBNuSRN5i1uEEwryLaQ5cQNfzQZOZF9sU9DwdSEEC30GJI
	 9CxKT754rhYdr/Z6PrzgWCaOwEWEqOSHSPdInsBkjuY9ua6Mf0QMM2rlxowQRdEdL1
	 iy5nZmF2SBMVVqTGUmuVZQWJtnPEluxhpJa9XyUwuJ7Wi6JuG5y6+/qbFeUIvRajvC
	 ux9Cz3MLRwxuQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	ardb@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Kconfig: Make SME depend on BROKEN for now
Date: Thu,  7 Nov 2024 12:19:27 +0000
Message-Id: <173097843612.164342.13696404397428904701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241106164220.2789279-1-mark.rutland@arm.com>
References: <20241106164220.2789279-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_041937_073681_E9DC64C1 
X-CRM114-Status: UNSURE (   9.68  )
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

On Wed, 06 Nov 2024 16:42:20 +0000, Mark Rutland wrote:
> Although support for SME was merged in v5.19, we've since uncovered a
> number of issues with the implementation, including issues which might
> corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
> patches to address some of these issues, ongoing review has highlighted
> additional functional problems, and more time is necessary to analyse
> and fix these.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Kconfig: Make SME depend on BROKEN for now
      https://git.kernel.org/arm64/c/81235ae0c846

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

