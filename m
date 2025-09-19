Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E2CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SUomTAeW4m+cZy7AhnVgB6s1OkkuLFRE5cw0/DyPsmM=; b=2s5JL16o4ypJ7sZaMWpMRjphvM
	bknLLGVWmuz/miKY3pPQax6HpPRbFLs6v+KYE225FvTaQEqIowl6t09GXzyw9jwXfVlLPrdFvkhb+
	AQtUc5zE4BkBh4rgxK618RxnhpfyERqAWzJIxN+UACpPvAB3NusLrx8vx/Mf7so+PmpiQT3WOoNPz
	7u9eDZ/S2tIyMjUkPoX6akGzbNImCd6XT5seRJ6WCxMqvVaax+O8uVPuNLNgGCmFITdD9kT/Mb/st
	dcAxtXyzIxzQq2+xg/7Q6LwHMi24XBcGj3E6/VUBo8zGC2Pio9PCSXYgvEPkwth/IpzjYzh2bY7BF
	yELN69tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXFu-00000002LvU-3xyt;
	Fri, 19 Sep 2025 09:18:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXFs-00000002Lu5-1war
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:18:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cSmyC2wmFzFrM5;
	Fri, 19 Sep 2025 17:13:23 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 460FD1402C8;
	Fri, 19 Sep 2025 17:18:01 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 17:17:48 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 17:17:47 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
	<maz@kernel.org>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <wangkefeng.wang@huawei.com>, <baohua@kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyccccc@gmail.com>
Subject: [PATCH RFC 0/2] Add optimization support for implementations using near atomics
Date: Fri, 19 Sep 2025 17:17:45 +0800
Message-ID: <20250919091747.3702-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_021812_665681_B6EFCFE7 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Add optimization support for implementations using near atomics, in prior
reimplement __xchg* with __lse_ll_sc_body() since currently kernel doesn't
support recursive alternatives. Though patch 1/2 is a preparation for the
optimization in patch 2/2, it's a pure refactor and should be standalone
to improve the code.

A previous discussion could be found in:
https://lore.kernel.org/linux-arm-kernel/aJXhHVEIdafxcLP_@willie-the-truck/t/#u

For basic principles for near-atomics and far-atomics:
https://developer.arm.com/documentation/102714/0100/Atomic-fundamentals

Yicong Yang (2):
  arm64: atomics: reimplement __xchg* with __lse_ll_sc_body()
  arm64: atomics: add optimization support for implementations using
    near atomics

 arch/arm64/Kconfig                    | 18 +++++++
 arch/arm64/include/asm/atomic_ll_sc.h | 40 ++++++++++++++++
 arch/arm64/include/asm/atomic_lse.h   | 68 +++++++++++++++++++++++++++
 arch/arm64/include/asm/cmpxchg.h      | 63 ++++++++-----------------
 arch/arm64/kernel/cpufeature.c        | 26 ++++++++++
 arch/arm64/tools/cpucaps              |  1 +
 6 files changed, 173 insertions(+), 43 deletions(-)

-- 
2.24.0


