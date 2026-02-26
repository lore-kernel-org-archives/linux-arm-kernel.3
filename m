Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E988FFD8FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Mdt10Ir08mV8M0rWWx3ukU1oA1BVepvcaoy2XO0X+4=; b=OL2j/0m8GUbpEdwAaS63VIT7md
	kBeqY2pk8UmGca35ehQeHJ24MTAPNvQd9RIQnBvOU63shq9jqMi5Dw2n1oUSRHrBGYR54g8Z1loRv
	K0V5tbch8uZRHdxSR0qG3eobML1Awfm/ZeFs8KigoW4uh4zAlHG8rLJqtFaBTVlXbY3x0Qb4tVBuJ
	zoQO+FZjuEcn4iHyAkBn6DjA8qzuzvnuVLyvMTFY9mmABmDVduowS32ahXUmPOw8P5inzoug2w2VO
	WIZJ+Mmsm8QK8IQBF/5i2QfFwBlnH5KBWNtYYtF4YeheWJ2NmHBh7VEhdM07/ubKVS/tEghu2BlX0
	CDE8QUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfpJ-00000006vUV-3GLV;
	Thu, 26 Feb 2026 18:11:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfpH-00000006vU3-47dd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 18:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0Mdt10Ir08mV8M0rWWx3ukU1oA1BVepvcaoy2XO0X+4=; b=LV9cWyX3lBQRhxK7+P2t7/ks3l
	cRc8AXwbZqwNDHjKkM4h9pyMXptbeuRUY8+pDTdhfCmSR1uqFBbGL/+dgPIxI0PX/LlQZ3si8r+cm
	UyATcBlp9F4M6j5RRXfUatFJpSy0kncBW4Jl2cidCTqpzt0zoxkUEzyHAvPBI69WPCU7gqTftzRFh
	WFyfzYTMpF6z6pmS+DUUvkarXi/hvlR/RzX0X0BGhV+DwiNNP3c3Zo3eORAp+HK5ptbU1pdQTMO8b
	dQZevh7E54sp7bDf/WsciLDlmGr27GnNa+lN1B+2Q0kdgUzNcw06iMStSu5A04ho161rfUZTrHjGE
	/qU5Ebqg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfpE-0000000Bkvn-3VL0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:11:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E88861516;
	Thu, 26 Feb 2026 10:10:21 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 113413F73B;
	Thu, 26 Feb 2026 10:10:26 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	daizhiyuan@phytium.com.cn
Subject: [PATCH 0/3] Arm SMMU errata updates
Date: Thu, 26 Feb 2026 18:10:19 +0000
Message-Id: <cover.1772125743.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_181101_168351_9F30B293 
X-CRM114-Status: UNSURE (   7.00  )
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

Hi all,

As promised (well OK, it's not Monday...), here's a more comprehensive
SMMU errata update since I finally found time to pick through all the
latest SDENs in detail. Includes some bonus cleanup since I despair at
just adding to a messy table, but that could be split up if you have a
preference for what to base on what.

Cheers,
Robin.


Robin Murphy (3):
  arm64: errata: Reformat table for IDs
  iommu/arm-smmu-v3: Update Arm errata
  arm64: errata: Sort Arm entries

 Documentation/arch/arm64/silicon-errata.rst | 114 +++++++++++---------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  18 +++-
 2 files changed, 77 insertions(+), 55 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


