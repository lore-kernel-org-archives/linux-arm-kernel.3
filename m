Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84678C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kk7G7boo8yTsgRWJx3qdEV38SHjpsAYxCy8cSJ4gBNM=; b=jp9MVK/Xp9z8JMJjWkrRHsQViu
	nGlwTJSYY92wEif3aLcHCNAhY5lT1ZvuQY4MyG0MCzcxLFBV3wNamf2UUkQoMbs8QTyWcwnzoA8ye
	h4g7PnJOnURpV0IAwcPBNLCSV0j0qP+RH//uPxM951iLCbB8ZpBjHkjsocACFISTRNvNv/WCM8r2P
	Iv06bGEVHWtnW/3jpa9y/Zm8q0Fzp3JU1qMvN7hH0oUhVwQNqEe8jWTZhWxou4P/ZKG4lAnAJg9mB
	nsVQfLEDMlX34anaRwIxsrtOXHajPMfcdSIlXewksrseYNKNg/to5Jf+B2AsHKX9WqeeUkQJSmy9P
	5JsPDQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpv4v-00000009B2b-0gFq;
	Wed, 05 Mar 2025 20:10:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuZg-000000095j3-0HUj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35C45A4610A;
	Wed,  5 Mar 2025 19:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEC3C4CED1;
	Wed,  5 Mar 2025 19:33:07 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] arm64/hugetlb: Consistently use pud_sect_supported()
Date: Wed,  5 Mar 2025 19:33:05 +0000
Message-Id: <174120317313.1423488.11091478258805705032.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220050534.799645-1-anshuman.khandual@arm.com>
References: <20250220050534.799645-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_113836_159276_BE04C24D 
X-CRM114-Status: UNSURE (   6.25  )
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

On Thu, 20 Feb 2025 10:35:34 +0530, Anshuman Khandual wrote:
> Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
> Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.
> Also re-arranged the switch statement for a common warning message.
> 
> 

Applied to arm64 (for-next/pgtable-cleanups), thanks!

[1/1] arm64/hugetlb: Consistently use pud_sect_supported()
      https://git.kernel.org/arm64/c/34e8e63a6dc1

-- 
Catalin


