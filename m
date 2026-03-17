Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F8FB5EAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 04:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNdYXUI1yLseJl+51bqIhoJj9krn1w3IZWALZFGoy4Q=; b=JVHePvsgM3xbemHgK1O+e2DQ66
	J24QEGk57V1PklAIHI0fI/Pb2zNCE1lI3SvVz7SlfbeXPkZFemqM/Q140cUacU9uUcjC/4T8D9tky
	aOXnTtsWA+FL5bGf2yifgR5FP+dhYAIGG85p2Q7orrpY7X3YtvluHphPZ157pbuZMp2yqfJgAeK/W
	XIbhrK4CtkHWsQJ/DUtMiLH6B/2WSdkAEfOvwzqU6gi76sDPYFKQcGvjPSsgi70LPWBqQlutMnX6F
	a4YmEVh2ueB68fI7ZMTgDJAN76u3pryE593jqgxlKwfWaZypkEp4SJPf6ltEJ8uVGyXGmIHYiwgIg
	xNNlC00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Lb6-00000005MQx-3Kao;
	Tue, 17 Mar 2026 04:00:01 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Lb4-00000005M4M-0Fnw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:59:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MNdYXUI1yLseJl+51bqIhoJj9krn1w3IZWALZFGoy4Q=;
	b=EH2WIk1TrykRf2u8v36SVCg0xzMijM34wCSIQIDRqecM7HKt31/ZNhV5Zzq8jCX7yM76Q4KfL
	658CcBT+YbbUtlckSaOGnmnyn9IWMWYyysUo0Hy3KetqAA7qnwEAvTmIYKNKf3p+Ka3ph8VD5pb
	MKeiCLMLKpcO7tNyzrWTfIA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fZdMf4RwXz1prKM;
	Tue, 17 Mar 2026 11:52:46 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AC91940538;
	Tue, 17 Mar 2026 11:57:47 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Mar 2026 11:57:47 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 17 Mar 2026 11:57:47 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 1/2] soc: hisilicon: kunpeng_hccs: Fix discard ‘const’ qualifier compiling warning
Date: Tue, 17 Mar 2026 11:57:45 +0800
Message-ID: <20260317035746.1773605-2-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260317035746.1773605-1-lihuisong@huawei.com>
References: <20260317035746.1773605-1-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_205958_247265_389ADEDA 
X-CRM114-Status: GOOD (  10.28  )
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

The link_fsm_map has ‘const’ qualifier, but the 'str' pointer
in link_fsm_map is discarded. So add 'const' for this pointer
to fix the compiling warning.

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 2af3bfda313e..d6ff7de63836 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -961,7 +961,7 @@ static ssize_t link_fsm_show(struct kobject *kobj,
 	struct hccs_link_status link_status = {0};
 	const struct {
 		u8 link_fsm;
-		char *str;
+		const char *str;
 	} link_fsm_map[] = {
 		{HCCS_PORT_RESET, "reset"},
 		{HCCS_PORT_SETUP, "setup"},
-- 
2.33.0


