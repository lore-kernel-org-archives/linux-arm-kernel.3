Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CED1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/07EqdT5veSVmQZ4ylSf3dwKFprXqnGXP1oqLEy0dYQ=; b=Usn6HE9MjWaYupT7R88LHFe3ME
	qplfYoRjIdveNRcAz924OdQLvWtbzxE0aM6LbsZgIJSqJW7DdvUBbq1p7S7iDbXy3A/XaAJdzX5FZ
	QY5AT5lHazm/VqARuE8fdIV4vIwy/BVOB//RUsMZBXtIr0XjrnSdh9GLfhPax5JfrtNVea/1qtVQ3
	/1AKOBRTJgpe5mE+jroi3f5O8caYZ5Srblqy8pZsk/Aym6KAGHI1dEO/yrs39gPLe3lspz5NPgmmu
	JCqTmjL8IMfhsjI7DOXUpnVr14ew4KOkZVKpF1gKpnV+eU9vZPRN0iTle2QJDlBIzPAJcrmc61Omj
	5EllBvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Ab-0000000CQUH-3yhq;
	Tue, 10 Dec 2024 18:41:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54d-0000000CPMl-0DYy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EC018A41737;
	Tue, 10 Dec 2024 18:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE027C4CED6;
	Tue, 10 Dec 2024 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855706;
	bh=RovpPnaWmHALyo/w43ic7RIcAU3sRkU89OsQBFOaozY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bz/8bkf1d7m3EyjafkAMZRUyQ/8LtiJm9Yy0Butl2V/EYURk19Ck28p7yKdaJRdMd
	 JPYpynHmW17rJ/T3EBDwjfWCjjbWcwLWZiAj/wb7NrO7Hiww9gCypTXhNl8aL8K6Xb
	 njHKu5iuaUAhdipc6vMapqthcyeaLnWLENFprWqBWvT0qhE6y+pNLHALRkNX7eHSHG
	 iXVit28PbqfKQ2tnu1esPTfXvGNktGP3QWYU+aSYv205KLWAxL1oK3xP9BKH8BvQTQ
	 hdTqeJK1kEy/PxzdwtK55X3p8uNBhpHUlz21DUCip73AqcXmbqSMqSaqALsvZ3limG
	 gWGdWRPdsAYUw==
From: Will Deacon <will@kernel.org>
To: jonathan.cameron@huawei.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	yangyicong@hisilicon.com,
	hejunhao3@huawei.com,
	linuxarm@huawei.com,
	wangyushan12@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v5 00/10] Refactor the common parts to the HiSilicon Uncore PMU core and cleanups
Date: Tue, 10 Dec 2024 18:34:47 +0000
Message-Id: <173384624655.550105.13843617535853493217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241210141525.37788-1-yangyicong@huawei.com>
References: <20241210141525.37788-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103507_149741_A25AAE44 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue, 10 Dec 2024 22:15:15 +0800, Yicong Yang wrote:
> This series mainly contains the refactor of the HiSilicon Uncore PMU by
> extracting the common parts from each drivers into the core:
> - the retrieving of the PMU topology ID
> - the common sysfs attributes like cpumask and identifier
> 
> In order to achieve this, we need to do below preparation:
> - refactor the detection of associated CPUs for PMUs locates on a SICL
> - maintain the topology information in a dedicated data structure
> - provides a generic implementation of cpumask/identifier attributes
> 
> [...]

Applied to will (for-next/perf), thanks!

[01/10] drivers/perf: hisi: Define a symbol namespace for HiSilicon Uncore PMUs
        https://git.kernel.org/will/c/41729809ac85
[02/10] drivers/perf: hisi: Don't update the associated_cpus on CPU offline
        https://git.kernel.org/will/c/f2368a209a71
[03/10] drivers/perf: hisi: Migrate to one online CPU if no associated one online
        https://git.kernel.org/will/c/83037a47d3aa
[04/10] drivers/perf: hisi: Refactor the detection of associated CPUs
        https://git.kernel.org/will/c/6cd137088fdf
[05/10] drivers/perf: hisi: Extract topology information to a separate structure
        https://git.kernel.org/will/c/c192026ceea7
[06/10] drivers/perf: hisi: Add a common function to retrieve topology from firmware
        https://git.kernel.org/will/c/32528b165ea1
[07/10] drivers/perf: hisi: Provide a generic implementation of cpumask/identifier
        https://git.kernel.org/will/c/8688c01e313d
[08/10] drivers/perf: hisi: Export associated CPUs of each PMU through sysfs
        https://git.kernel.org/will/c/3b051bb7cb43
[09/10] drivers/perf: hisi: Fix incorrect variable name "hha_pmu" in DDRC PMU driver
        https://git.kernel.org/will/c/4e15bcffa19a
[10/10] drivers/perf: hisi: Delete redundant blank line of DDRC PMU
        https://git.kernel.org/will/c/f03241fbebdf

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

