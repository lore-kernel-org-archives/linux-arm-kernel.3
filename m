Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1F6CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 06:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9bfoe/jx3hBglO6tc2XYZrJYhwjJ6xEZSorNfn9J118=; b=PArx3Agt5676g/5BFgxzwRQnpX
	ZN1tJKPyckpDO46Rk9R7yt7o3VOvLG3eqaHoG8aDZSQV+/sfLVOZuIHJZhs2Hib9pO8DKspt2HN5V
	LjvTrZGSUWaNHYJrd0oWJw0ttXaKEn6g8/tYiA6oeS1DbQjZoN/lC7f4Zh3jj59wJ+s89c0aqATol
	0or6JIugjjfiz/Ef8aRrwrwQ/IWWmeWS6n4fIaHrG+L5vauBoNVd8JslndOGywN3M6BQkqYiOhcGF
	XIP0MRekG7EwgtrCKWsZsgbWmsAqNUbVBLnon8vtqqd46BOVfUgH4+WrLcc5wvGp82WK+k0u1vqKu
	4CrtFT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG2I-0000000Gjd5-2sVT;
	Fri, 07 Nov 2025 06:33:26 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG2F-0000000Gjb0-1Diw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 06:33:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9bfoe/jx3hBglO6tc2XYZrJYhwjJ6xEZSorNfn9J118=;
	b=I4tqWfFsImrDtzJzBEWWRT+otRiiDRYaCh2BbbZo0UDLOlZDFLsLz9UoTmcF8BbyDb7pdWQjS
	YaNFjvJ19huVM69ukuWhR6GqUh9AYTF4YQquc7Pkkb0abbteKkOOTtbX2vJE4r9OPTIDEt7QdZX
	BKj3kQiO5ZRqmJ1nANkBlvc=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4d2q2q0j7Mz12LDp;
	Fri,  7 Nov 2025 14:31:31 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 77837180495;
	Fri,  7 Nov 2025 14:33:05 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Nov
 2025 14:33:04 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>, <ben.horgan@arm.com>
CC: <sunnanyong@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <zengheng4@huawei.com>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH mpam mpam/snapshot+extras/v6.17-rc2 0/2] fs/resctrl: Fix the iommu_group parsing process
Date: Fri, 7 Nov 2025 14:32:58 +0800
Message-ID: <20251107063300.1580046-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_223323_482020_8EF0020D 
X-CRM114-Status: UNSURE (   4.68  )
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

Zeng Heng (2):
  fs/resctrl: Fix the iommu_group parsing process
  fs/resctrl: Migrate iommu_groups back when deleting the group

 fs/resctrl/rdtgroup.c | 91 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 18 deletions(-)

--
2.25.1


