Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E7FC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26UKhnyxVBGF4YHJq6dZWG+pMg3/1SKLtE9nSj3nJF0=; b=flJz8XWeuWqRacmHErGKrcD5mV
	evGxPlxuM/S83xojw8/6QC62WtBhhn5tTwWw6P9OEnKzGvDpJsm6X9saLFXZsZNP1icg70WKvGxSj
	Z3b+bVwH6buSwxjTMD7XaFDxgU+rPTo1BV7jfPIkA3zEc3bknBhhIzVHdIOF9lcrzBURIRzaIvq53
	ll9M6/gL61sGsIz+pSf47bP6jp6HGSrIPyU+DmMe0MnpEV5EWUPMoAPqL8QY6Jo2tr06PWxio0EyP
	IRuBO6kGIeCzA5bXcvrdG+luXry6arxvJi/x9MjJfuSQXzMfX6HIvSe9RBtNRLCo1ezMKlD/A8L5m
	sgPZB/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibIw-00000005ofL-2zkg;
	Wed, 21 Jan 2026 16:43:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibIu-00000005oeU-20UW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:43:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 653F01476;
	Wed, 21 Jan 2026 08:43:21 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 224293F694;
	Wed, 21 Jan 2026 08:43:26 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: james.clark@linaro.org,
	anshuman.khandual@arm.com,
	yeoreum.yun@arm.com,
	mike.leach@linaro.org,
	leo.yan@arm.com,
	Yushan Wang <wangyushan12@huawei.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxarm@huawei.com,
	jonathan.cameron@huawei.com,
	hejunhao3@h-partners.com
Subject: Re: [PATCH v5 0/3] Coresight TMC-ETR: refactor the tmc-etr mode and some cleanups
Date: Wed, 21 Jan 2026 16:43:13 +0000
Message-ID: <176901376427.1889457.8743102994419435831.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121101543.2017014-1-wangyushan12@huawei.com>
References: <20260121101543.2017014-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084336_585565_BE93D724 
X-CRM114-Status: UNSURE (   7.01  )
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


On Wed, 21 Jan 2026 18:15:40 +0800, Yushan Wang wrote:
> This patchset builds upon Yicong's previous patches [1].
> I rebase the patchset onto coresight for-next branch.
> 
> Patch 2 introducing fix race issues found by using TMC-ETR.
> Patch 1 & 3 introducing two cleanups found when debugging the issues.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/
> 
> [...]

Applied, thanks!

[1/3] coresight: tmc: Add missing doc including reading and etr_mode of struct tmc_drvdata
      https://git.kernel.org/coresight/c/5da8c55dd879
[2/3] coresight: tmc-etr: Fix race condition between sysfs and perf mode
      https://git.kernel.org/coresight/c/e6e43e82c79c
[3/3] coresight: tmc: Decouple the perf buffer allocation from sysfs mode
      https://git.kernel.org/coresight/c/eebe8dbd8630

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

