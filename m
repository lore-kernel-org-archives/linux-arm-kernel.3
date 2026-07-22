Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D21EC4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyMySADOfkdNBmTgBv+BFxJNFcV8ar22rjFpLcVIsQY=; b=XYENV6QD0M6yvJExM3l17Ohu53
	7ARQ5v5Jih2vOukOVfPVJAMWEzayvN39Prs9z8EfJYPbL6X61jVJ/J3AgEugMqUfwQJNZ+kUUQCZo
	ccFgo7agYgnCNf3kWOYLf7GBRHRmNWV5Qcb+5gxLsW2e0tm/oz7CMyop9NbeWXWt9POYIF3S2HTnQ
	CgQCbQJ2Saa7IDrIdbFAIaeuLTdQTYHP25Uq3w5IREKYWByDiph29VYcE8EXG9Y005e22wMHddXic
	0sFm9ACp+WEvUyMUgxO1GIN8okLr59YgmFQhddDcXdFOkhI5ykq7e1WktB/L34cARipvSKdXWZSwR
	neiC7ldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeh0-0000000Cpzi-17VD;
	Wed, 22 Jul 2026 21:41:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmegH-0000000CpnO-2Jpv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05273600AD;
	Wed, 22 Jul 2026 21:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5D11F000E9;
	Wed, 22 Jul 2026 21:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756444;
	bh=WyMySADOfkdNBmTgBv+BFxJNFcV8ar22rjFpLcVIsQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OEJuj4js+JtTJv0NsZkWb23cfLqGJ4yOfUWB6+wNiXLXql714QOzMzTSTAVbaFiUp
	 idzif4ciWotZpzFvCh7+k05v5RaQ7F2MQq6OUN7g45CC0qa5T/27dYV+NcUSLuPkHu
	 x2NHvFm6NHrqrOe4B0BpZYEBDMr0JWkH3pU+kOeKU+uCjTN0omjH12vBTKeyXrCXuh
	 RjIF9SpTcWbx3/FUyWFOj+XfXT01MlkO/az5dTx9lMpnkhnDIuDv9c0pKGS/p4jmpz
	 5U4Ao3XjEGNWMfZ7P67MjsUNWSCRgOWWuLaREbcyD+1BqfUmgGQIRJrMeoDOUMUV1v
	 N+6igEw9pgRMQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	rafael@kernel.org,
	lenb@kernel.org,
	saket.dumbre@intel.com,
	beata.michalska@arm.com,
	zhenglifeng1@huawei.com,
	sumitg@nvidia.com,
	zhanjie9@hisilicon.com,
	geert+renesas@glider.be,
	cuiyunhui@bytedance.com,
	vanshikonda@os.amperecomputing.com,
	ionela.voinescu@arm.com,
	jeremy.linton@arm.com,
	viresh.kumar@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	linuxarm@huawei.com,
	Pengjie Zhang <zhangpengjie2@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	prime.zeng@hisilicon.com,
	wanghuiqiang@huawei.com,
	xuwei5@huawei.com,
	lihuisong@huawei.com,
	yubowen8@huawei.com,
	wangzhi12@huawei.com
Subject: Re: [PATCH v2 0/2] CPPC: reduce FFH feedback-counter sampling skew on arm64
Date: Wed, 22 Jul 2026 22:39:35 +0100
Message-ID: <178475048433.1329854.7282103675861242164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708082818.808041-1-zhangpengjie2@huawei.com>
References: <20260708082818.808041-1-zhangpengjie2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 08 Jul 2026 16:28:16 +0800, Pengjie Zhang wrote:
> The legacy CPPC feedback-counter path reads the delivered and reference
> performance counters separately.
> 
> On arm64 systems using AMU-backed CPPC FFH counters, each FFH read is
> served through a cross-CPU counter read helper. Reading the counters
> separately therefore widens the sampling window between them and can
> skew the delivered/reference ratio used by cpuinfo_cur_freq. Under heavy
> load, the skew is observable as transient values that may exceed the
> platform maximum, as discussed in [1] and [2].
> 
> [...]

Applied to arm64 (for-next/acpi), thanks!

[1/2] ACPI: CPPC: add paired FFH feedback-counter read hook
      https://git.kernel.org/arm64/c/9aa7df520523
[2/2] arm64: topology: read CPPC FFH feedback counters in one operation
      https://git.kernel.org/arm64/c/42971d5329d9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

