Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB7FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjDYMkgZ6/C0908IWJ8wP/3rLr1dUg87rXMpKKYkU3w=; b=J0zBENRHt0i9egkIEXWL4Rd9ED
	cgcavHJpJmtzg3q2/5/+RwEsSSnH0KQflEj3g2pjNBWP9Njrb8GrgAf5GEpVwUAB8qeIEBXJ/Rets
	iBc2eXGLepTJ9n4g5G6FEb2iJodTSXnp0skgDKczNg7grQ4AW5IreNXFnwzIdVOy6m+Fm7BtlxC3F
	nQR9TRvNEJgec6jn3CJ4fRMJkGJfQIQloDj1KGaqi+RRv6Krss1n3gLrj7rKZylbaNja+1AzByMPS
	XW13pINCnaZa4/GAjSS0w3IbmAd+8+vBBq7ny3+yFr4b+NARrXrcuOvaXysSYgWtbcHrHbtFoP3IJ
	Efs5b7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkpk-0000000FAoX-1Apu;
	Fri, 04 Jul 2025 18:08:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSm-0000000F8E3-3ts7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9DF646A4C;
	Fri,  4 Jul 2025 17:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023E5C4CEEF;
	Fri,  4 Jul 2025 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651080;
	bh=0Of2DAv59lR6dZHDz2GpwsJOOrpi64d81pjQPe/a6Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dciBDgjupR1Gqcs3h9dxuBq0PJMSbW6ATGfmhtk+IyTcKojt1lZUzOP1OI8t1nZxD
	 J+Rxp+Cb5Wq8cMH4/R8KnlGCfkM034c1cgD5ERhOB4y/GBz1Yqnspumz4ppTfLeM1s
	 B1+kATCtwVP+0R4fzUyGazPDwQRLCz9eh2GrmP7DkQhyxvXQvpmbvFfN/NGrPo2NWE
	 En4b79nWgCdMw8qChSteMreR17AuE86IrWtDuIVsqQ/EPgUpm9wlwznAqId4q5QLHt
	 MvodnK8v/COgCARmcBKfIJzahIn6zOTV3Q3YTQHmB5YjzmyBfT7nVAp2jl7INlQnUw
	 Np8znltyXdA2Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH 0/2] Improve POE handling for uaccess
Date: Fri,  4 Jul 2025 18:44:14 +0100
Message-Id: <175164363953.1189181.15632215061604413984.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619160042.2499290-1-kevin.brodsky@arm.com>
References: <20250619160042.2499290-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104440_990773_3928839B 
X-CRM114-Status: UNSURE (   8.17  )
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

On Thu, 19 Jun 2025 17:00:40 +0100, Kevin Brodsky wrote:
> This short series attempts to approach POE (Overlay) faults consistently
> w.r.t. uaccess. We currently assume that spurious Overlay faults are
> handled by retrying the access [1], but this isn't the case.
> 
> Patch 1 ensures that spurious Overlay faults are indeed ignored. This
> being done, it typically isn't worth using an ISB when writing to
> POR_EL0. Patch 2 removes the remaining ISB in the signal handling code.
> 
> [...]

Applied first patch to arm64 (for-next/fixes), thanks!

[1/2] arm64: poe: Handle spurious Overlay faults
      https://git.kernel.org/arm64/c/22f3a4f60859

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

