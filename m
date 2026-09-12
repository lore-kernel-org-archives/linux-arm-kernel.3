Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FFEC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDJIzQWqsOsISqXG0JZjfAj+hlNjsIuLPf7NWL+sE8c=; b=ztb2ZyItOE7Ujm0VgYLFmvEy3o
	CKz2kyHvLuiO9Z8MofXKLiPOEnjloihpT0/hxFF7LeRg2AAp1CfMIaGDIeokXHR8zqgiroaXKoQWt
	GrMwMBGuW2eNA/eJT0asYy0qaq8/tbx6MH0ViR8UoqsZaVlyFJw//t9rwLAFoAiA8tv+CZ5XsCOU3
	sA4kMNfYIS8AtImojX0rxPtJbWf33V6mtlhK3h+27BCT4lJknIMmZ8rAul3vN9aRoY2X7OZvryV/d
	Ezlt6zfWmxHunqXqgaehQGKUpC3arZ5dO1TwhIBtTmQ5LTlVKXjxCoC44qE/t6p0IF6EXavQfJuN6
	6HhblvnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5PcY-00000000yba-2aWY;
	Sat, 12 Sep 2026 15:26:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5PcX-00000000yax-1aUq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 15:26:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F93B60233;
	Sat, 12 Sep 2026 15:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8FB1F000FF;
	Sat, 12 Sep 2026 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789226784;
	bh=TDJIzQWqsOsISqXG0JZjfAj+hlNjsIuLPf7NWL+sE8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gxS6CkCfXErMUv0gDr+LM/aHQPUAmSBikB4lA2p0doW13+g6kzuBifOJggTHKHyIc
	 InWHZq6Mr1Ctb92iT2qJYnJJ+CzDVohKtQhLrPfCIbbYK2TjefheSO1wHFv9gez6SU
	 Fgt8JCU9CkhwlNMccVHSr086lvmkv/M2rUrjfCiRvaWWQZWcJoX6nDYCm9HPsNr/ft
	 KFmepOXuUiPHg6h5crnMO+AIq8eN8UwV/BUukgOJyIXqLb6xJ3fHzboFXFhTqCf9Sz
	 JRb18NKQYN13As8WgCsv90JYCGDRGNQCd5LurHB/JwNRqqg8RFwlorFP5o5pWOnlIi
	 ObOFf6UTjJ2vQ==
From: Sasha Levin <sashal@kernel.org>
To: jgg@nvidia.com
Cc: Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nicolinc@nvidia.com,
	skolothumtho@nvidia.com,
	Wentao Guan <guanwentao@uniontech.com>
Subject: Re: [PATCH 7.2.y] iommu/arm-smmu-v3: Disable implementations during devm teardown
Date: Sat, 12 Sep 2026 11:26:11 -0400
Message-ID: <daily-reply-0001-re-arm-smmu-v3-devm-teardown-7-2@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910065429.1703706-1-guanwentao@uniontech.com>
References: <20260910065429.1703706-1-guanwentao@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Now that arm_smmu_disable_action() manages normal teardown, invoke the
> implementation callback there while the command queue is still alive.
> This prevents the subsequent implementation remove action from releasing
> resources while the CMDQV hardware remains active.
>
> Fixes: 5994617e09ee ("iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown")
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>

Queued for 7.2, thanks.

-- 
Thanks,
Sasha

