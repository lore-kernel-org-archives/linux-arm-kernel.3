Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31816FB5EAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XG+dEuu8/plY2AlGZStlzL3/6l+YiRU/kEXlTZn+g8=; b=W8XVt5xFLJ++d2UlPw9vX6Vn20
	y/vXiawz2Nj9xKTvfZWhAuUK5NIPy9OFvxE7zCD+kLdXQ4gVYhNYtPGeJNnEHeS4TFrgpyvxbMqEe
	vKCsATa4oH1lunU6j8L1zqQs+UU5OUrsCvsvt13xqf7ym5m9aGKE0d0p7wtwQUFYCikWOLLcqYOte
	UCbIEoYiVjRdLoikYKnDrC0qRSeZ+Ah00Bc2lQ09bKNZwAAtBViqCSVkiuyOoMxE8FDO8Evfb+tcD
	1zhlDjMBjS4xnaR1XFq+7rM3SwANsSc0rD32u478O6rVpati+4nWcfMUHtDYrEOXa7BHNLdqmkAZP
	QtuiCLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LZC-00000005M64-4A50;
	Tue, 17 Mar 2026 03:58:03 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LZ9-00000005M4N-3pxS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:58:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9XG+dEuu8/plY2AlGZStlzL3/6l+YiRU/kEXlTZn+g8=;
	b=ajpZhXhnGFgER5i0JGDAX7u8EP4UJp4pUnU+O+Vasa2fnAyJHDFw9h1TihtkUwNvcYBuJyiKb
	N02BEOFekurLMvRGoJcm1Rm1HfvVaQWOtQzhjXOsoEe5LI23A/aNPKbymsTnKJW+wk2iwYMK+Ph
	X8D44i/+i49gE1RWG8e2Xi4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fZdMf3nGQz1prKM;
	Tue, 17 Mar 2026 11:52:46 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 9632440561;
	Tue, 17 Mar 2026 11:57:47 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Mar 2026 11:57:47 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 17 Mar 2026 11:57:46 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 0/2] soc: hisilicon: kunpeng_hccs: Some clean code to fix compiling warning
Date: Tue, 17 Mar 2026 11:57:44 +0800
Message-ID: <20260317035746.1773605-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_205800_107800_2F1C6BAB 
X-CRM114-Status: UNSURE (   5.40  )
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

Fix some compiling warning on kunpeng_hccs driver.

Huisong Li (2):
  soc: hisilicon: kunpeng_hccs: Fix discard ‘const’ qualifier compiling
    warning
  soc: hisilicon: kunpeng_hccs: Remove unused input parameter

 drivers/soc/hisilicon/kunpeng_hccs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.33.0


