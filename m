Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07678E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46UE6runPwTpjl55BOALYXRS6O1g5tdPvIQolSh1GjY=; b=xUnt8et6zbC8SY4MY8P0nGJx1W
	DzdM0yTgt3iCfT/HFbwnoJZsnBrOlAS9/Mz6AUUbusrzfN+2Bu/xXeBtnngg8NBG5XT/2UYeBrrTF
	auVpicefo6W7c4Nmwg5eaVErAJ0aDvCLT/uPX/FLE1e35i0FUiAs29xK9e6gJecWmZ19X05pQ0Wc/
	TEZB6CJOZVJyW50InzQoLIDP4SPZFjZYXFwgRW+4jC6r2rj6F3PN9zc7bDBPQrFy91uKQdIgVMM9T
	un5YVC/5rGJl1LXXNps1va8f+1+7km52Li3aT5IR3g3HsMMGeQ7HZGuAPvRt5S1+w4BcZ8TzmJ5Aq
	cdOoRUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL57X-0000000CPrN-0OGM;
	Tue, 10 Dec 2024 18:38:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54V-0000000CPJs-2NFk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F731A419C6;
	Tue, 10 Dec 2024 18:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C74C4CEDD;
	Tue, 10 Dec 2024 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855698;
	bh=zYJk1YUuU4g7BvRhCqPEyANMPM9cSeVoWwQIsesbzCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hlGhKCUK7ki8Y7e9xyHsYrMOgnAWdxv21KW5DbSwbPMDZqA5oY8aGRBn+ema35uIP
	 szN8wWPgQW5+L0lADzS+gIWn3CsLxRRfJwjXoCZOgErPWeWY9PoLAa1+t20FDlYbuf
	 /mstAiR/E3e/O7wWFO+fMDnQN0NwtMgR7yuGFXjDG0Kj9BXZpUA3C/fi8Or8pUol58
	 dss2jiagI00yTOyjb+wgnfoXQa7IcZz4wgalxZqO1WnokFTXD/w12MU74zCZKvyYv2
	 Pe+hyPVdV2x5UJHFvEma0hW1emjGrWqZD0xpyQINLepm/Vwdr4Rr6A1/4mjsBtQsDk
	 gk0GZ/DIgnRjg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Replace open encodings with PXD_TABLE_BIT
Date: Tue, 10 Dec 2024 18:34:44 +0000
Message-Id: <173383037764.3807705.806887970785893565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241202083850.73207-1-anshuman.khandual@arm.com>
References: <20241202083850.73207-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103459_671782_3035F2A7 
X-CRM114-Status: UNSURE (   6.30  )
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

On Mon, 02 Dec 2024 14:08:50 +0530, Anshuman Khandual wrote:
> [pgd|p4d]_bad() helpers have open encodings for their respective table bits
> which can be replaced with corresponding macros. This makes things clearer,
> thus improving their readability as well.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Replace open encodings with PXD_TABLE_BIT
      https://git.kernel.org/arm64/c/a0e33f528e09

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

