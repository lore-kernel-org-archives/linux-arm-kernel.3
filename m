Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16BEC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F5c072ZBuMKZrs+rUzKDMiQaUMHosj4i8OhnS4exJU=; b=QEUDx7HRAp2aA6N73mqgjWglqM
	yXN5nnROR3gy2optcRKjy7yD1If7jFHPblJfetuMF+wcir07KPsYdKlJm0xRM4OvzvexpoX/WPU8o
	CQQBmTZEKCqxbVSipxFePjbGsLXr0c/GGs69aKxSAEM3GtYFvVu4gkKNHOSxWBsU8Row+rdzwSgGf
	ENAGtpnE7/TMuBkDNr6oKEhghOVhKEhbW+QjUr/gVpSR42bsoqXrRax1oHM9mQBFzuwBJd5JJWIKI
	MRD7zcVQ0lfiT5VYzDZpNOiiizMHCQzFCm8tqTgcVJ/6T+EK9w675pJSEC2SHzj5UaCInSBCXeaHP
	2jQwD46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPRK-0000000DRfD-2Vv6;
	Tue, 20 May 2025 16:03:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP01-0000000DMwQ-43Nx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:35:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC9FE1516;
	Tue, 20 May 2025 08:35:11 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 724793F6A8;
	Tue, 20 May 2025 08:35:24 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: (subset) [PATCH v2 0/2] coresight: etm4x: Fix timestamp regression
Date: Tue, 20 May 2025 16:35:14 +0100
Message-ID: <174775429687.297706.1519446554064234648.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519174945.2245271-1-leo.yan@arm.com>
References: <20250519174945.2245271-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083526_043279_D36FC3D8 
X-CRM114-Status: UNSURE (   9.00  )
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


On Mon, 19 May 2025 18:49:43 +0100, Leo Yan wrote:
> The timestamp appears all zeros with latest kernel, which is caused by
> wrong bit field setting. The first patch fixes the regression.
> 
> The second patch refactors the ts_source_show() function.  It simplifies
> the code for directly returning the TS value.
> 
> Changes from v1:
> - Retained the older condition check (Suzuki).
> 
> [...]

Applied, thanks!

[1/2] coresight: etm4x: Fix timestamp bit field handling
      https://git.kernel.org/coresight/c/ee811bc7

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

