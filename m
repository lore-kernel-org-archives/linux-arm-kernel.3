Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F9C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 03:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+aR14lbVmAtukTyCbAkseNWhGnXaucpuMGaS4Jr03w8=; b=hTgqVSGv9W+HWeEtNLbJzx+wCG
	FWEaSWTMYx1J9ruE4KKYWVtN4XMA80L0bWaiN3wnQO6+jbG4deLA6LLxzQ+0UeyVIJYAMPLlLyIj1
	5Gotya9aDxmDjH1lENOPw8Io6jlsVEvXqPxpIFJ8UQfp35mcaDklinwFuiW1Kpc2R/YTZsIOGqMck
	RCHIzHfJm6bWh1HKyeQ9s+ZMscF9r6ug0r2UkWdzrggOd8/0p8ENC40csZ4JTRbmRJsb7U2eN6j9f
	EjAuPf1cKC/lGVdUMU7Bhht5vApFNjacZWz7dMRAmrP6gj3EZOp3+hnRccG/KsZUCLIkPA8pfepGM
	5fwgwzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyNAZ-0000000Ef4l-0n8q;
	Sat, 29 Mar 2025 03:47:39 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyN78-0000000Eeut-2tlL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 03:44:08 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZPjpX3TPJzHrJb;
	Sat, 29 Mar 2025 11:40:36 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id E42E91800B4;
	Sat, 29 Mar 2025 11:43:54 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 11:43:54 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>
Subject: [PATCH 0/3] Two minor fixups around FEAT_E2H0
Date: Sat, 29 Mar 2025 11:44:06 +0800
Message-ID: <20250329034409.21354-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_204406_895365_F770F2FB 
X-CRM114-Status: UNSURE (   6.92  )
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

Two minor fixups for the FEAT_E2H0:
1) add missing feature register update
2) fix boot warning with kvm-arm.mode=nvhe if !FEAT_E2H0

Add a cpucap identify the HCR_EL2.E2H RES1 (!FEAT_E2H0) support.

Yicong Yang (3):
  arm64/cpufeature: Add missing id_aa64mmfr4 feature reg update
  arm64/cpufeature: Add cpucap for HCR_EL2.E2H RES1 (!FEAT_E2H0)
  KVM: arm64: Fix boot warning with kvm-arm.mode=nvhe on !FEAT_E2H0
    platforms

 arch/arm64/include/asm/cpufeature.h | 23 +++++++++++++++++++++++
 arch/arm64/kernel/cpufeature.c      | 14 ++++++++++++++
 arch/arm64/kvm/arm.c                | 14 +++++++++++---
 arch/arm64/tools/cpucaps            |  1 +
 4 files changed, 49 insertions(+), 3 deletions(-)

-- 
2.24.0


