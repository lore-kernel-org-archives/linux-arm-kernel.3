Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547ECCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8/9itvtjVpmK2G/4RfwVhCe2Dd6oOwI96bHwCamrAc=; b=YSqt/v2phXMnstfJd0JAXapllD
	cy8j/UmKTnSkR7PFOdolgqybpPoy0sg96rTyWRxFQSkKQcRHlOo43eGY6/psPK/3xHITob9fFKihV
	4uIJGHZYSA5tE/2QhAjb0IVzwxbU8v0zp31Uld7/8w168YemX3Smv3I1+Atopynzn7Uyc+/IvEh75
	VGJvWnoOhA8vQdn8ikOOIpDHUjIIt07iKbOet3ArONog1NrhKtCMGiRIP2tt1ZZsOzHPspMYU3Qmp
	h8A5+rjYj6mwV2s1+uvs35SNY35Jh53gVhkwrIhN8QrLuvvSK/YlMVtx/S5N6bvKSIh/mkX9n0wYy
	JOQ3z5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWk4-00000005fon-3PN6;
	Thu, 14 May 2026 14:08:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWk2-00000005foA-2btM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:08:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751A3165C;
	Thu, 14 May 2026 07:08:38 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA2F3F7B4;
	Thu, 14 May 2026 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778767723; bh=ZwroU7tmqUzIwx3OLWe8/OVhM+VrbO2aOhG+QWT7o7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbUlJ+K01yvU4yMUh82q/i4X+b6YPVKupVqfelFFaHFV/8d/POdM9zvsan+2rTipV
	 Smjf1jhG06mdrTbZ1BIg/6LQzavTnBGzg6PL8eGSDtiEH3VlIhsLqWX7OefqvsoR6G
	 5ZHcam804m39+RujcvbPlhj9xfrp2D/8z5/mjDmM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com,
	James Morse <james.morse@arm.com>
Cc: Will Deacon <will@kernel.org>,
	wangkefeng.wang@huawei.com,
	xry111@xry111.site,
	yang@os.amperecomputing.com,
	reinette.chatre@intel.com,
	thuth@redhat.com,
	ben.horgan@arm.com,
	mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com,
	ahmed.genidi@arm.com
Subject: Re: (subset) [PATCH v3 0/4] arm_mpam: Add support for the MPAM v0.1 architecture version
Date: Thu, 14 May 2026 15:08:01 +0100
Message-ID: <177876763941.1936042.2744198926229834411.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508162341.3762549-1-james.morse@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_070846_705463_DDCC9D09 
X-CRM114-Status: GOOD (  11.77  )
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

On Fri, 08 May 2026 17:23:37 +0100, James Morse wrote:
> This is a v3 of Zeng's series to add support for MPAM v0.1.
> Included are the changes Ben and I suggested, and a couple of bugs found while
> testing it.
> 
> I've put the bug fixes first as you can hit these with mainline.
> The patches for v0.1 enable MPAM on those platforms as this extra ID register
> was missed.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/4] arm_mpam: Fix false positive assert failure during mpam_disable()
      https://git.kernel.org/arm64/c/f1caff3335ea
[2/4] arm_mpam: Check whether the config array is allocated before destroying it
      https://git.kernel.org/arm64/c/6ccbb613b42a

I'll leave the other two patches adding MPAM 0.1 support for the next
merging window.

