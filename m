Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285BDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cpFSsHQ/CjxmfN6PXI8qC4wK3Fx6E4RIfeUZXkIOFg=; b=JFqyM2RfBRWaFL5VJXvZ5CkJGD
	Me/68ulUW1xRoD8sMSGZLmxPo978EjuXxapbztcItYcEndw3LRgkjyIBCkBRwt/cKNDexg6keq718
	fyvUW7PI1jqXrtZK9kknV8Eqvs0kptYpnQhFXptq25t9UkcUVfcxLuG27JuClYeHsmpXjCoegjO3V
	hVQ9aG+zPpFpql0HEjewBVgni+50F2bc+6EuPXJj1hxQQ1VVIf/x5j+wExwOcu3PrIaSfjRbX/hpu
	JhCcdGH+zurL+QyLot54VRvyx1NUax1PteBzjYsqkgxfuPm4HaXHyRzZkGP888U9uyavFLwcwUq16
	kDouwvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOd-0000000C8DJ-1n3y;
	Tue, 06 May 2025 13:31:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG7M-0000000BfGv-20re
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:05:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B7A113E;
	Tue,  6 May 2025 04:05:31 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 363B33F58B;
	Tue,  6 May 2025 04:05:40 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH] coresight: replicator: Fix panic for clearing claim tag
Date: Tue,  6 May 2025 12:05:26 +0100
Message-ID: <174652950905.248615.15182322345223514612.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502111108.2726217-1-leo.yan@arm.com>
References: <20250502111108.2726217-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_040544_560478_E75FE7C2 
X-CRM114-Status: UNSURE (   5.26  )
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


On Fri, 02 May 2025 12:11:08 +0100, Leo Yan wrote:
> On platforms with a static replicator, a kernel panic occurs during boot:
> 
>   [    4.999406]  replicator_probe+0x1f8/0x360
>   [    5.003455]  replicator_platform_probe+0x64/0xd8
>   [    5.008115]  platform_probe+0x70/0xf0
>   [    5.011812]  really_probe+0xc4/0x2a8
>   [    5.015417]  __driver_probe_device+0x80/0x140
>   [    5.019813]  driver_probe_device+0xe4/0x170
>   [    5.024032]  __driver_attach+0x9c/0x1b0
>   [    5.027900]  bus_for_each_dev+0x7c/0xe8
>   [    5.031769]  driver_attach+0x2c/0x40
>   [    5.035373]  bus_add_driver+0xec/0x218
>   [    5.039154]  driver_register+0x68/0x138
>   [    5.043023]  __platform_driver_register+0x2c/0x40
>   [    5.047771]  coresight_init_driver+0x4c/0xe0
>   [    5.052079]  replicator_init+0x30/0x48
>   [    5.055865]  do_one_initcall+0x4c/0x280
>   [    5.059736]  kernel_init_freeable+0x1ec/0x3c8
>   [    5.064134]  kernel_init+0x28/0x1f0
>   [    5.067655]  ret_from_fork+0x10/0x20
> 
> [...]

Applied, thanks!

[1/1] coresight: replicator: Fix panic for clearing claim tag
      https://git.kernel.org/coresight/c/f42df204

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

