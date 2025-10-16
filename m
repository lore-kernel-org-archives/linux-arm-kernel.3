Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFBACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pcc+q92R5dnwfZiyWq4mv1x24oDjCFsunV9CS+VnTcI=; b=c7+gmO0/6uqOkJMqja/i59okib
	xrah3whVnjU5L3kar0CJcM2n3Ev9/2P0z8v6NS9OYBeGKQYrkRRoJjY1uaA6whPby82W5fncV3qQz
	yqRL8Hg2+64nzOTotDXM8Y6edLErW7kR1sihZwPB45QqeyzvacwtxBhIPMT4o9tyGGofCdagMd6dO
	f1WxWrBIDY+/+ROi4qptRhUAWf+tDLkNZVuBeusL6Wu2/+PoEt6skoDxKDoMn1DK4Zv/jc6H6fqAn
	Z0y4+nBgIGpUpMANfLqhSb8qO62Xa0tDrxMqiYsy1Krqf5FpDqZ2qgWblY1qI1gVfuFZ9/iekZtwz
	FxLrQrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9DIa-00000003FF7-3INC;
	Thu, 16 Oct 2025 02:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9DIX-00000003FEY-3qOs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Oct 2025 02:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=pcc+q92R5dnwfZiyWq4mv1x24oDjCFsunV9CS+VnTcI=; b=OY07EnuD7WU1kKMIyDhhjFyl0/
	U9HEnonPQUujpLSbYuyaEUBCr3p1c9mj99kzcYKggLQLDJ4/mM2hE4EmDHdbM+9zIWL6y2xlWqd0n
	ZxkMAMyU1s3Ql0WWfh5TIF/93SZ/d+6PKNnAf7sLrGQbJhLuP+qvVSYg0mv8vQ3dCveG2Jz27EzfF
	vxCmwqEN2r/A0t8rmWAeIWr8EQbp94RgjwM545le9pGuX/shqN6BkVHKXjbR9OHWwya3zg1MeqoZ8
	UQ6pvIjT0MTvBpJ5tMsIcsmFiOr5zwB3ufEN9iS4m+fWSIfqt/FK5yY9f4a9v5W9X92L//2OXs423
	OaN3AbFQ==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9DIQ-00000006PnW-05jA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 02:00:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4cnB3d0q7szRhs2;
	Thu, 16 Oct 2025 09:59:57 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AF111402F2;
	Thu, 16 Oct 2025 10:00:18 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Oct 2025 10:00:13 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Oct 2025 10:00:13 +0800
Message-ID: <866aca63-1f6b-2109-fa76-6d68cb7c547a@hisilicon.com>
Date: Thu, 16 Oct 2025 10:00:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Question about heterogeneous VM live migration
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_030051_252499_42A8B95D 
X-CRM114-Status: UNSURE (   4.20  )
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

Hi,

We are now trying to do heterogeneous VM live migration among HiSilicon ARM
servers, seems there are problems about disabling a feature in guest.

For a feature, if we disable it in VM by configure related ID register field,
we should make it actually been disabled, e.g. configure related control
register in EL2 or trap EL0/EL1 access to EL2.

Possible problems:

1. Some features can not be disabled actually in EL0/EL1, e.g. FEAT_AFP,
   FEAT_RPRES, FEAT_CSSC, FEAT_LRCPC3...

   Disabling it by ID can not avoid a stupid user to directly use it without ID
   checking, which may bring subtle problem in heterogeneous VM live migration.

2. For some features, it can be trapped, but KVM does not support yet. Not sure
   if we should support them in future.

   E.g. If we disable ID of FEAT_HAFT for guest, we need configure
        HCRX_EL2.TCR2En to 0, so access to TCR2_EL1.HAFT will be trapped.

        For FEAT_PAN3, it instroduces EPAN to SCTLR_EL1，if we disable ID of
	FEAT_PAN3, we need make SCTLR_EL1 to trap by setting HFGRTR_EL2.SCTLR_EL1.

   Seems there are no trap setting in above cases. Just a quick look, maybe I
   miss something.

I am not sure if we already consider above problems, any help will be appreciated.

Best,
Zhou

