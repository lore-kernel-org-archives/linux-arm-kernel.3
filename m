Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DDFC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 02:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrHWytu78dJbZb5mW3FsyVkJxRa6zDGIfcHBrfWiJZA=; b=1v9RJk+J7ehTcBAJm2kfDEjfWX
	kMH6Zdkhqn2e8nRorBYSDFHNPb96ugki84FTEGvS55DtjB8ymGEzURnkSkoQvdII1wS+n8e6IuqfQ
	ctDytF3+S+GBefyBAGHLLwdPM6YL2Nub/61URFzEVQMNUw0QHhxM2cggmi0vr2V9nasROO1cS3t0v
	l9leH1GwLsiGN+P9WLEYpYyCybwDVYhW/MJUjd5DdmcB4ZT0KGpcHnY/vCfaOIWsssg56uEaVLOJJ
	KJE6WR4oAE+aXXcdjekndGLdiMJaEABgvmIfDqauSQqHEVyUuLPulnmUHZfI7TNRw6QetIVq/eI+T
	5+lk0U8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IWL-000000050FI-3QVD;
	Tue, 15 Sep 2026 02:03:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IWK-000000050FB-35cn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 02:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27CE0401F3;
	Tue, 15 Sep 2026 02:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAEB1F000FF;
	Tue, 15 Sep 2026 02:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789437820;
	bh=mrHWytu78dJbZb5mW3FsyVkJxRa6zDGIfcHBrfWiJZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TF+Ete7pwnQc3OH9X8zvjivV/AzHkcP0F3l10mL66641bUL1GUmHTPLr73UeQbOcU
	 89wzHqOANqZZ5Nu/NPRS0BLT/jT2scYC4+zD3MiY+96OeNNTGzUnzgtaggw5F2BafO
	 fMFPk2FoVqJF1utSEfXOjfkGiXX9x+UyF5nb7riKKfcKz8DNn3AEyC9w25YwnH8Z97
	 AV4oDcpC6uaRoankzxKpHh9qvuJyoWiCxXjsTTMurajNHogbRHyyw5ABH7TD2eCjmK
	 sSDN0LYoYLOCgUK6Yg3X22TOxKQ2qGEzeQkR0xYu4NDxV/SYj7o4Fpb/9DIU4BFDq1
	 DuzzImZVQJWOQ==
From: Sasha Levin <sashal@kernel.org>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: Sasha Levin <sashal@kernel.org>,
	jgg@nvidia.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skolothumtho@nvidia.com,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH 7.2.y] iommu/arm-smmu-v3: Disable implementations during devm teardown
Date: Mon, 14 Sep 2026 22:03:17 -0400
Message-ID: <daily-reply-0001-re-arm-smmu-v3-devm-teardown-6-18@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aqR/n+VtlgpjJrAV@nvidia.com>
References: <aqR/n+VtlgpjJrAV@nvidia.com>
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

> Patch itself looks good to me for v7.2 stable and v6.8 longterm.

Queued for 6.18, thanks.

> But v6.12 longterm might need some extra fix, Sasha?

It does, but a different one. 6.12 has the devm teardown conversion and never
got 9ff145a25c5c ("iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on
teardown") at all, so what it is missing is that commit rather than this
ordering fixup. It does not apply to 6.12 as-is either, because the
tegra241_cmdqv_destroy_vintf_user() hunk has no counterpart there.

Could one of you send an adapted 6.12.y version with that hunk dropped?

-- 
Thanks,
Sasha

