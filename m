Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DCED2B932
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k6TGdjrivprGOmWOVa9RBCqNAP/wQ3jgvTUtHJfkHQ=; b=H1Z7dPLl62irETc1m3AWErw42e
	GHfwwVE/B4w+e36leC6q7rPVFpLDY/pPxb6QFBcHG9q+QUQxvgCxwudbK3piimyivQZhkc7nSmyqW
	7mYO0VlJjGQWgSMRvj57ln6910m/yRv9Gdvz1coEMO0EUa+mHWS9rcvcr7DsvfbKhhZntr8M122kP
	bvIT7QJsqJuqAGE+rRnaQe4cRCviF2iopRQlVfZJ9kfzB29k8dg1n6J1yX6weCD+2h1Wchk+dPvAp
	bGR40biur2xpXZSFaL0nhN3ihxq9Ex3//hoLLRI5PzAceVXwq+QvriZFAWuXRaivbp4zlCrHLJcfm
	4MFFdfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K1J-0000000HBQZ-2oyO;
	Tue, 05 Nov 2024 13:54:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JyB-0000000HB0f-1DH0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA2A05C41A7;
	Tue,  5 Nov 2024 13:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D23C4CECF;
	Tue,  5 Nov 2024 13:51:39 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/ptdump: Test both PTE_TABLE_BIT and PTE_VALID for block mappings
Date: Tue,  5 Nov 2024 13:51:37 +0000
Message-Id: <173081469049.3480353.2637044997787719917.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105044154.4064181-1-anshuman.khandual@arm.com>
References: <20241105044154.4064181-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_055143_396370_8B2FAD78 
X-CRM114-Status: UNSURE (   7.62  )
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

On Tue, 05 Nov 2024 10:11:54 +0530, Anshuman Khandual wrote:
> Test both PTE_TABLE_BIT and PTE_VALID for block mappings, similar to KVM S2
> ptdump. This ensures consistency in identifying block mappings, both in the
> S1 and the S2 page tables. Besides being kernel page tables, there will not
> be any unmapped (!PTE_VALID) block mappings.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/ptdump: Test both PTE_TABLE_BIT and PTE_VALID for block mappings
      https://git.kernel.org/arm64/c/dc9b74a76320

-- 
Catalin


