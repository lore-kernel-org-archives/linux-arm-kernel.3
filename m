Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99852E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iqs1c3QB5IqWSWTDoNPQ2DxDZ7OSzPyWlG/XAzoJRyk=; b=cWkKQICDNTT05YdukJHPjXGEj6
	/b+gx6l+cm/XvHI64MiHKwcxMy1K2/HYeRSXkzzhSioe1yoaWkHUC9dTnTSbniVEq9QykAIu+cbS+
	0mH4irUXEwVjYCvJycuAN+0dMHx3y018NpqpBFDXXbDTIzDmaTz4VQ+8ukyY8OFFhlSupG2F4vElH
	Z8rnULpfi2Km3dAg84QAJhvEHud5L3eR4DjzGwJCP3ysEjJYAgSn3srUxX+Gt+H1Uoz6x/m3Gx/aB
	3TAswsEbs5cTxwNr/c7z31TIk2DWPYyvGG0tVmoZFL7HDO2GsthKAuAwCDd6riOoKc5uTwO55Kqla
	zkFOiJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGVq-0000000H6Zm-0YWd;
	Thu, 05 Dec 2024 18:23:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGUX-0000000H6NC-3yN5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FD3EA43EAA;
	Thu,  5 Dec 2024 18:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF769C4CED1;
	Thu,  5 Dec 2024 18:22:19 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH] arm64: Ensure bits ASID[15:8] are masked out when the kernel uses 8-bit ASIDs
Date: Thu,  5 Dec 2024 18:22:17 +0000
Message-Id: <173342292873.1735998.10553787213604000003.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241203151941.353796-1-catalin.marinas@arm.com>
References: <20241203151941.353796-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102222_046596_936FEAE7 
X-CRM114-Status: GOOD (  11.36  )
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

On Tue, 03 Dec 2024 15:19:41 +0000, Catalin Marinas wrote:
> Linux currently sets the TCR_EL1.AS bit unconditionally during CPU
> bring-up. On an 8-bit ASID CPU, this is RES0 and ignored, otherwise
> 16-bit ASIDs are enabled. However, if running in a VM and the hypervisor
> reports 8-bit ASIDs (ID_AA64MMFR0_EL1.ASIDBits == 0) on a 16-bit ASIDs
> CPU, Linux uses bits 8 to 63 as a generation number for tracking old
> process ASIDs. The bottom 8 bits of this generation end up being written
> to TTBR1_EL1 and also used for the ASID-based TLBI operations as the
> upper 8 bits of the ASID. Following an ASID roll-over event we can have
> threads of the same application with the same 8-bit ASID but different
> generation numbers running on separate CPUs. Both TLB caching and the
> TLBI operations will end up using different actual 16-bit ASIDs for the
> same process.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Ensure bits ASID[15:8] are masked out when the kernel uses 8-bit ASIDs
      https://git.kernel.org/arm64/c/c0900d15d31c

-- 
Catalin


