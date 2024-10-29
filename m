Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D02CD3A67F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MOYJZ53wlDHsMXrUL6JL+woPcSF3sMjGPkxfoE18bw=; b=1fVYixmZthLVFNKbQ34+SD6ruw
	HOVx9VSEelgJhFQl8yFoPQg0lQlzAIKXeTRmBlSnfidoYtdSY2FHzg6/Ow3UY10nsrLxearhY85eS
	xaS6Tn8Hvc7KtbehNJ4LxGpGc8hVxaYJJBxzPHAqfr2JDqcF5Egg7B7KkCtb/mep70d9+/QWmBjni
	o05MgBkHdsSPPTV0YR1lPYAbpvZB59lQAIHs6KavlKI209xQltt+uMfXrKIqvMxGhdjO3Xju1Pb8t
	aCJ9AxFhhhG4QxDibpqIeUJL+HcEGkgI10+GlKOyP3Yihn55EZGyQ9Fj3p3js+2Vfzer+wDzmXIWS
	Vvep2jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDk-0000000FWhq-06wd;
	Tue, 29 Oct 2024 18:45:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5osa-0000000F5FN-43tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07F59A42FFA;
	Tue, 29 Oct 2024 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7530C4CECD;
	Tue, 29 Oct 2024 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730218535;
	bh=bZ3umWUB2daTUxDUPol2jd5kvJm+C26sRYBZhWz/XMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qxS/G3K5GcU+Td77rJL/3ypn1M8aqJ1u6PegKPGZzC06zh7nvomc1EQ74nMC2xEzo
	 3T+Tw6sI0lqTLQlRKgPEaMg0GLW+72rncLuw6wDKsqeKA7xe9EaExYg1SnoItTTJM7
	 UD4OmU9BNzcmcnxnWhq/wEku7RqJsrxTn3stYsV9NXe7x8HN3SiVCsRL6vul0uPviw
	 lvewBpnjhs4t4BIN3MBkg02HM6d9kZ3kbKM5TKyy+HCmTmxa06cwvUwuz7elqzSqVK
	 pQj1Qgl3DHHczqAoutBh1qhjk+pMOyKj3km+HHxGqYlar+Dqn4iJTmNDrITZ9JB6rP
	 qE/8LLXao9m5g==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org
Subject: Re: [PATCH 0/2] iommu/io-pgtable-arm: Fix for stage-2 map/unmap
Date: Tue, 29 Oct 2024 16:15:16 +0000
Message-Id: <173021209382.4087086.8047959157749601171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241024162516.2005652-1-smostafa@google.com>
References: <20241024162516.2005652-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_091537_097189_D2F0B959 
X-CRM114-Status: GOOD (  12.91  )
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

On Thu, 24 Oct 2024 16:25:14 +0000, Mostafa Saleh wrote:
> The first patch is a bug fix for stage-2 handling of concatenated pgds
> that can break map/unmap for some cases.
> 
> The second patch is adding these cases to selfs tests.
> 
> While looking at that, I also noticed that the concated page tables support
> is minimal and not supported for many cases (level = 0, 2, 3), I wrote some
> code to support that so I can test further, I can send it later in another
> patch.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] iommu/io-pgtable-arm: Fix stage-2 map/unmap for concatenated tables
      https://git.kernel.org/will/c/d71fa842d33c
[2/2] iommu/io-pgtable-arm: Add self test for the last page in the IAS
      https://git.kernel.org/will/c/d64c8053378e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

