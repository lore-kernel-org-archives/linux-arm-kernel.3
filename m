Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB29C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC+/Oasy3YzxrJ+xcR6YHpRRPYhekqR2drvQ0c+ugYQ=; b=etD1ROouc8Rg2GxawHhAAV8Xsp
	EVNjmVtsbBLLEIXl6neOR5hesl2bwNAWUYZfqds3LxfHMrY5Ct9UBXqwcFHA95J6jnG7SEnB4iPho
	QQq4YZl7NmeLv6tqNLcQkydKMGCPIpnZ0MpzODCn+0rxHhxL6aCKXqXbMua2H/7xMIKk2Ju5Bpkbu
	mWQliL+u6DmHlcai6rIh1gr+04df9Olaq2r+Q2wZvA89ILD4gGZB/OgpeVK474gCA7LoEkuwaaNuJ
	sVhM+fMnQ8gR6RLyP4ue2uON/z2GCrqRnEOVSAHqgOIbz+4uFTfLq/OXKKcQSZSANxjV9aeEB5DMN
	3KuR2qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zJx-0000000GU46-1nwD;
	Fri, 11 Sep 2026 11:21:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zJw-0000000GU3x-2WUP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:21:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0AFD6025A;
	Fri, 11 Sep 2026 11:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701881F008A0;
	Fri, 11 Sep 2026 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125687;
	bh=LC+/Oasy3YzxrJ+xcR6YHpRRPYhekqR2drvQ0c+ugYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pr6w7z9jOHBtcBu90TmuUd+SNELbLx52X8SgihZxsdWTcx/Yf/cpGaK7u88rhwOXr
	 JDi8auGQ5AkB1XyjA3Os5QmtVwZ6+HZnHmS/XfV7Ef2H2jU/mI61GuAx8jfqD/IItu
	 EO3hzoaPtGNKrm7FnYdmMvXC9wTh8+xCM14qVpChGC1JUiNgoULAPMT2B7qFL+gMPb
	 6OlvBAglX9dO/QPFxzm/sMVr5aQKRQ1/RFXCmrCn7VNpAPXGK/pQJjopELA1TIalxF
	 8HbpEiOhjmnH3E4v8jwLx9xmbBmx7M0c+ZJ2NyoUW+df8sqPZhrViM5FRXmmY4nz6D
	 GqsSBXRwNMuXw==
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
Date: Fri, 11 Sep 2026 07:20:48 -0400
Message-ID: <daily-reply-0029-re-arm-smmu-v3-devm-teardown-7-2@kernel.org>
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

> The Tegra241 CMDQV teardown fix moved VINTF hardware deinitialization
> into the implementation device_disable() callback.  However, its
> stable backport preceded the conversion to devm teardown and could
> only invoke the callback from the shutdown path.

This is a stable-only change for 7.2.y with no upstream commit to point at.
Since it has no Reviewed-by or Acked-by from an arm-smmu-v3 or tegra241-cmdqv
maintainer, we need that before queuing a stable-only fix.

Could you get a maintainer ack for this?

-- 
Thanks,
Sasha

