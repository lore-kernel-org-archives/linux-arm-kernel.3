Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FA0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BJhPa5XviX/NxkO2CpB/gFM8Zd06D8DQ3ylDTEcjWY=; b=M8t3b1jrpcanCXift4TjHLZQ1i
	W8SDt30+8Xl9HmQL87E41Btzq48EHmYrY8c9YGuY5m6LbyTNiypj2ZHk0/wMf9RvYfBcisubUy3fv
	AyFeqRpt/dWjJvmiIA3VY66or2nAk1g+eMM0rUaTx+F9opCc3jtEkxFxaxVmW/YrVtVPrbY5JnPUs
	9JKyhXFqUNfukaT6MpCm2rbCbsw2qyFCLRBHVpPe3RSHSdvn4hWHae99WtavqGIHQKXHZd33croqW
	kN/q1xnQSrX6d/bogo2GgGcpHY8utfzrRY4Tjb1cCP30YfQv28pVl1Seoq9cdnQZhOcyoXXcGmwQM
	ZOAE/jJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9bb-00000005efL-46jw;
	Tue, 08 Jul 2025 14:47:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Yc-00000005e3K-0Hht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 825F45C3074;
	Tue,  8 Jul 2025 14:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84979C4CEEF;
	Tue,  8 Jul 2025 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751985869;
	bh=jNWFOFzmmWJU2ULGPNLCuMC59ExJlWbHk+a2tsA1bxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EbuEXvZp3xyY1g+Im1NXEHFsOfxL52xFR+nJELmHdTBavF67jbj6KUqxXPjQ1XuwY
	 R5EFwSDanUUX2viDMaBEoxkwwesxkTOCewWv/ENZmhEIvQ34UsF5BECCNhOJ3OJ6Az
	 4CrZ6qoR+iEmzwpEZ83l1Bn2U69b6RMKz6h06laVwWf92+6j3nz4exd07bovspBRHT
	 xWv7IKjz21ZstR+pCEoaHHIBJJuTliuFmzsLlCGWiY8dVN53j2qV7CLvciW6D71v9/
	 htWLkG7RqWftuCV6JiCXjXjflAFN3bsyDqeFNDOBSfOSbrmLeY6FCQPkWFnwBD7LC2
	 Dx/9Moyiybxww==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v6 00/13] arm64: debug: remove hook registration, split exception entry
Date: Tue,  8 Jul 2025 15:44:20 +0100
Message-Id: <175197766369.1369071.12712004182921623694.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707114109.35672-1-ada.coupriediaz@arm.com>
References: <20250707114109.35672-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074430_143390_91A36374 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, 07 Jul 2025 12:40:56 +0100, Ada Couprie Diaz wrote:
> Another small re-spin (okay'd by Catalin[-1]) to fix build issues :
>  - Patch 10 would fail to build, fix by correcting `el1_dbg()` being`
>    modified when it shouldn't have. This creates a small change
>    in Patch 11 as well : removing the line that was mistakenly removed
>    in Patch 10.
>  - Patch 11 would fail to build without `CONFIG_COMPAT`, fix by marking
>    `el0_dbg()` `__maybe_unused`. It gets removed in the next patch anyway.
> 
> [...]

Applied to arm64 (for-next/debug-entry), thanks!

[01/13] arm64: debug: clean up single_step_handler logic
        https://git.kernel.org/arm64/c/ad8b22648b7d
[02/13] arm64: refactor aarch32_break_handler()
        https://git.kernel.org/arm64/c/b1e2d95524e4
[03/13] arm64: debug: call software breakpoint handlers statically
        https://git.kernel.org/arm64/c/6adfdc5e2ef9
[04/13] arm64: debug: call step handlers statically
        https://git.kernel.org/arm64/c/403b48aad5b3
[05/13] arm64: debug: remove break/step handler registration infrastructure
        https://git.kernel.org/arm64/c/d4e0b1262094
[06/13] arm64: entry: Add entry and exit functions for debug exceptions
        https://git.kernel.org/arm64/c/eaff68b32861
[07/13] arm64: debug: split hardware breakpoint exception entry
        https://git.kernel.org/arm64/c/43e2ae77fcab
[08/13] arm64: debug: refactor reinstall_suspended_bps()
        https://git.kernel.org/arm64/c/80691d35523d
[09/13] arm64: debug: split single stepping exception entry
        https://git.kernel.org/arm64/c/0ac7584c08ce
[10/13] arm64: debug: split hardware watchpoint exception entry
        https://git.kernel.org/arm64/c/413f0bba005d
[11/13] arm64: debug: split brk64 exception entry
        https://git.kernel.org/arm64/c/31575e11ecf7
[12/13] arm64: debug: split bkpt32 exception entry
        https://git.kernel.org/arm64/c/fc5e5d0477c5
[13/13] arm64: debug: remove debug exception registration infrastructure
        https://git.kernel.org/arm64/c/a8b8cce9d96d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

