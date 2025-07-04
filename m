Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A8FC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 17:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1TjrERKCDs0OiiX2oKEgSiVPZJbmKX8Pjq8s4xmH2s=; b=b0XzYBQbhldQ4w5K1tRdeb3Gos
	mxo7mH+CoU7/R03WekZ1lrpxRmgYkV6Q3sdYczoYkm7vUfgRBgmPTGovP1F11Z+oF1dTDGC4jBgz5
	3STaIuVVTKIIT3/pOO1iM4FrqhnvM/KWrvEPqYgva2Xl4unBZVqUO/BUgCbImk7X668wZ/DcUQyZ3
	iwHNd+Q7+t02t4+002tb7T5Km2NeQx61J1Eq3fInu/kjQp7npWKOQ4tfscCMFkQozdl5IdWKbAkYm
	NmbZgF78c1l+gGV8CKoY5v91Ds/0274kWiYU3pffRQAiNsmtWE+w0sxK/NhVqB1v2x/IQL+Levg4g
	plWbwh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkbm-0000000F9T3-2Sxn;
	Fri, 04 Jul 2025 17:53:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSZ-0000000F89j-3yyl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2A48A53D1E;
	Fri,  4 Jul 2025 17:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9784DC4CEE3;
	Fri,  4 Jul 2025 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651066;
	bh=U5nnWc8et1R7IF+cWx1R1lPjeXoH10cuLrXX4i8v7gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQRZACwg8LDHZlxcYpbS31jd5tqWJIwrsstgROTiiHSHrjhqxebGVu3HC8ZoOeIIT
	 yX2MKC7ekn9of5uEGjqIiwqPsN9140wN+fbXsJpQfXP56VsHm9pomj4oI0f8aQ7Obc
	 JeS0lLTmXmWC/Yq4o+WODzN2PFTkQZ10Em3BPSu6hGfrUJ7RgxW5kpgMH3AupQLv+a
	 2F7Dl+2R1A1HbwIZVVF+W/nkOVsTn0VQKWryx3/XCPbkiP068IJ5aV5UspLYv+YCfg
	 HIZCVctgBwKoflleTOJiyOtwBq69mbQggYCJThC6817bSw46QBLhdRGMr2FgKTK8nZ
	 MeFaEEhA+zNyw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Drop wrong writes into TCR2_EL1
Date: Fri,  4 Jul 2025 18:44:08 +0100
Message-Id: <175164396550.1190820.4438826795121262303.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704063812.298914-1-anshuman.khandual@arm.com>
References: <20250704063812.298914-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104428_063652_90F82014 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, 04 Jul 2025 12:08:12 +0530, Anshuman Khandual wrote:
> Register X0 contains PIE_E1_ASM and should not be written into REG_TCR2_EL1
> which could have an adverse impact otherwise. This has remained undetected
> till now probably because current value for PIE_E1_ASM (0xcc880e0ac0800000)
> clears TCR2_EL1 which again gets set subsequently with 'tcr2' after testing
> for FEAT_TCR2.
> 
> Drop this unwarranted 'msr' which is a stray change from an earlier commit.
> This line got re-introduced when rebasing on top of the commit 926b66e2ebc8
> ("arm64: setup: name 'tcr2' register").
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/mm: Drop wrong writes into TCR2_EL1
      https://git.kernel.org/arm64/c/9dd175749341

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

