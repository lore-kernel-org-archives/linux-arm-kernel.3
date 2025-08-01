Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B24C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNizNHEWDoaAK5rIkMJPYjZq85ptGrqj6k93znwRBek=; b=PXskJjsmKc1v8I3Ydb/Thdzt9T
	xckHzmOwyXlmvwBQYrbFirGt0AZetZrPKcN8pIUirXXMHuHgjMfG4wLYXX9Koi3gJITG47k+9AR13
	7DtmT/sMZH9G9Q8Ba/MPnOzBp6tfPulA3+4Ohsc4o5akoiRXRgtW2DLI2Ad4t5CNajzTcZ+K1ypAE
	fK/BizAk65LnrqlBkih0kSBGonbxmk9M3nI9hBdFwpxif7LPFmxwRcVuaA4TgBtKNmlPYmtk/sJvM
	TmjPODgae4pUNTHULLLRGnTQEXnEBozd99o2fh62ZkQzuTZKur/koess3W/Lnw58oRr9o7imKe3Uv
	cigJWccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkrr-00000005DZY-3ujq;
	Fri, 01 Aug 2025 08:11:55 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkge-00000005CNr-3uPY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:00:22 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4btdbX1sV8z2RVy4;
	Fri,  1 Aug 2025 15:57:44 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E48514027A;
	Fri,  1 Aug 2025 16:00:09 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 dggpemf500013.china.huawei.com (7.185.36.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Aug 2025 16:00:08 +0800
Message-ID: <c7bc0979-3721-49ba-89bd-ebcaa5ce70d9@huawei.com>
Date: Fri, 1 Aug 2025 16:00:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Zhou Wang <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
	Luchunhua <luchunhua@huawei.com>, liuyonglong <liuyonglong@huawei.com>,
	"xuwei (O)" <xuwei5@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
From: Jinqian Yang <yangjinqian1@huawei.com>
Subject: Regarding the Issue of vNMI Not Supporting Live Migration
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_010021_126885_6DEE84E9 
X-CRM114-Status: UNSURE (   5.78  )
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

Hi，marc

https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=arm64/nmi

During the testing of this set of vNMI patches, it was discovered that 
vNMI do not support live
migration. The reason is that GICD_INMIR/GICR_INMIR0 have not been 
migrated, causing
irq->nmi to reset to 0 after migration. Therefore, to resolve this 
issue, we need to complete the
migration of GICD_INMIR/GICR_INMIR0. This set of patches does not seem 
to have been uploaded
to the mainline. I was wondering if these are scheduled for upload to 
the mainline?


Thanks,
Jinqian



