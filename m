Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD52C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+ghQVwwIcBHPV3xBu7iUV/MUtzGz9ebQRM8ZIfeaVU=; b=A+5fvj/wTr/7xThQMbrPsh4jsq
	aEC+sRsm5q0reknsHLdbUkO1kUmlDAqcQs44v2YKO9Ect995C/FuFRs6EYLdZpulk6KrFoD1Pyr98
	TxD5QjwPjLo+ymSlMiuNybccp9uZ1kCvGYJJvglazeitDqGE4ihkZq0PE8fvh1qiGzCSpa/uLUX84
	n1DAQDZ1hnnwV6UPBxY6nalbFIxXlKlIEMLjbT2hClPkiKlJD76vT9gcFTmQp1wOHlEj2Y1bZ5TPG
	9fpEyS788S0JAerEXA/g/HqVzdxsDCzvhK9B0eJejyD07rfraZNfCtbQqD4QgSy/9rz8gUU81djmz
	Vi3SCCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBbW-00000001SFd-1u62;
	Tue, 04 Aug 2026 09:38:34 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBbS-00000001SEy-1PhN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 09:38:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=i+ghQVwwIcBHPV3xBu7iUV/MUtzGz9ebQRM8ZIfeaVU=;
	b=GhZ5aLEhiFaCM3jklQpFSS7vF2SYu99iFO3h/0DiE9Kf1fOocwp5HQHZ8G4pyVbh5n91YEUbI
	lx32I4z4RVPQeyqxtN6HYN2brFFxdwwrv6yWAt+M7o8ditZyD925MauCivtVi/IxiCF6b1E6RmY
	WBb5YCrKatqS8jpX0YFv7jc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hDp9g537BznTVn;
	Tue,  4 Aug 2026 17:27:51 +0800 (CST)
Received: from kwepemf100001.china.huawei.com (unknown [7.202.181.215])
	by mail.maildlp.com (Postfix) with ESMTPS id C180E40565;
	Tue,  4 Aug 2026 17:38:18 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf100001.china.huawei.com
 (7.202.181.215) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 4 Aug
 2026 17:38:18 +0800
Message-ID: <fd3b6402-fd34-4b23-b5c7-69aae1adb5e5@huawei.com>
Date: Tue, 4 Aug 2026 17:38:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] devfreq: Add refcounts for governor modules
To: Jie Zhan <zhanjie9@hisilicon.com>, <cwchoi00@gmail.com>,
	<cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100001.china.huawei.com (7.202.181.215)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_023830_698093_18605D9B 
X-CRM114-Status: GOOD (  21.37  )
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

On 7/29/2026 6:23 PM, Jie Zhan wrote:
> A governor module can be dynamically inserted or removed if compiled as a
> kernel module.  'devfreq->governor' would become NULL if the governor
> module is removed when it's in use.
> 
> For user-friendliness, get and put the module refcount of a governor module
> when it's in use.  As a result, unloading a governor module in use returns
> an error, e.g.:
> 
> $ cat governor
> performance
> $ rmmod governor_performance
> rmmod: ERROR: Module governor_performance is in use
> 
> Note that this can't stop force unload, so it's more of a
> user-friendliness improvement rather than strict protection.  The
> existing code that keeps devfreq working when 'devfreq->governor' is
> NULL should still be there.
> 
> Patch 1-3 clean up mutex with guards and factor out a common governor
> setting function, so as to prepare for implementing governor reference
> counting.  They can be applied separately.
> 
> Patch 4 adds the reference counting mechanism for devfreq governor
> modules.
> 
> This set is based on devfreq-next of 7.1-rc1.
> 
> Changelog
> ---------
> v4:
> - Patch 3: Return an error if starting new governor fails and restoring
>   old governor succeeds, such that the caller won't get misled.
> 
> v3:
> - Link: https://lore.kernel.org/all/20260519113251.3745140-1-zhanjie9@hisilicon.com/
> - Rework patch 4 to make the 'owner' field assignment optional in the
>   governor code.  This prevents device-driver-bundled governors (such as
>   those in hisi_uncore_freq and tegra30-devfreq) from causing
>   self-reference issues that block module removal. Additionally, merge
>   patches 4 and 5 to clearly present the new 'owner' member alongside
>   its usage.
> - Drop patch 6 because it's no longer needed since v2.
> - Update commit logs of patch 3 and 4 to clarify background and
>   motivation.
> - Pick up 2 tags from Yaxiong (thanks!).
> - Trivial cleanups.
> 
> v2:
> - Link: https://lore.kernel.org/all/20260513093832.1645890-1-zhanjie9@hisilicon.com/
> - Rebase on devfreq-next of 7.1-rc1.
> - Drop the patches related to the NULL pointer deference issue of
>   'devfreq->governor', which has been solved and merged recently.
> - Remove the dedicated mutex for 'devfreq_governor_list' because the
>   refcount changes don't depend on that.
> - Some minor cleanups and fixes.
> 
> v1:
> - Link: https://lore.kernel.org/all/20260326123428.800407-1-zhanjie9@hisilicon.com/
> 
> Jie Zhan (4):
>   devfreq: Use mutex guard in governor_store()
>   devfreq: Use mutex guard in devfreq_add/remove_governor()
>   devfreq: Factor out devfreq_set_governor()
>   devfreq: Refcount governor modules while in use
> 
>  drivers/devfreq/devfreq.c                 | 185 +++++++++++-----------
>  drivers/devfreq/governor_passive.c        |   1 +
>  drivers/devfreq/governor_performance.c    |   1 +
>  drivers/devfreq/governor_powersave.c      |   1 +
>  drivers/devfreq/governor_simpleondemand.c |   1 +
>  drivers/devfreq/governor_userspace.c      |   1 +
>  include/linux/devfreq-governor.h          |  11 ++
>  7 files changed, 112 insertions(+), 89 deletions(-)
> 

LGTM.

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>




