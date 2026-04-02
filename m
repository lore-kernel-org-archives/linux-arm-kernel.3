Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1298D3942C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyrWPY5Ev1YqXQNI936Pi4tZz7GWIXsbdLr6GEho4RU=; b=Ho95B/viFceQ2cMBbml6Dcpfwz
	AcsaaJ9aMH/6D4s9rvx1S5zrP9V2VwtePaCYeacvBpKBE5f9oLBfQoRk2tul2d6oB/jVY/5C7p1fQ
	YEMh4yUEI4ELA9Z3mm0gRxgjPSg9i8Ogos6ucceDZjH4rVwbI8KAUXrnS1cdBi30cfDZ5y+sFH7lp
	xP0aNDI1tlelHQcg1gMDM7DDCVA3a2Nd7YwiimmxOnpH2/znZaQKOYBjNaSv11BXSeUN6sObbmJ8f
	YKqjJLNTnDaxMsOX32uAtG9eht/1i83KZ15S+lOVAr6hl79jT3uXL/uzyH0C3fdFJIFFi8r2DLOQr
	hx51GJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IY8-00000000Dzk-00mC;
	Thu, 02 Apr 2026 13:57:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IY5-00000000DwV-0gjl;
	Thu, 02 Apr 2026 13:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yyrWPY5Ev1YqXQNI936Pi4tZz7GWIXsbdLr6GEho4RU=; b=EqU/tGLYUOvOb6ULNvKBZklZaF
	vr5b53cFYH6Tu2PLFIyDgumNxtlzR1L/N1QHWV3fnZEannNrLX/gEuQQ9Ajme3jLOqD7Vo5WhNetc
	V9KBVQ9uqmZSrsKPM2HAT4PnmONX+AS376jmHV2PnPT2pJrmX8vpwG/lcZDGy8dzNxS/pg1eIA2mE
	2/Oag6Xg6OLIHzekPskVB5QH8oMjrzOChamQekUtWpvFt2CqI0Z4ySGwlej7wxR9E2gHg23SuFQEW
	uAJAq7d7Ycts5fGkNDqXfYDel2a8gB/rpE5faE4D4Aqomozvx+IC4RvUWXtlBBG73HWD796O/dmpO
	986eL7OA==;
Received: from iad-out-006.esa.us-east-1.outbound.mail-perimeter.amazon.com ([3.216.221.67])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IY1-00000002bl4-2y3h;
	Thu, 02 Apr 2026 13:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1775138245; x=1806674245;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=yyrWPY5Ev1YqXQNI936Pi4tZz7GWIXsbdLr6GEho4RU=;
  b=dEuTpA4CV7h4MtIqiqRb8YWp28D5USKGgdhWReGT673L6Fd0nH1gWpX9
   NpVDBoRFcCXkeeOHZ5dYRw3w9FOt7xTLq1Z4nkubtoW30p/QQg2dpUUtd
   y5L2EG+wGS5tGb+r/2MDzIBqrz+Om8DJYWYESlAXNSyuQYIkq0PxKyLag
   jCmmBQiGOFu0+Tv48nCFFNf6tTlhzocgAC8hX/5n/ii7ygJedIBfSsutA
   KHnvnlYwKePW4ZOJYdfmgJ8uM4eI8ooBffCOjXnM+bYGPy8KZR2L/hWZ7
   coxny/3TKjM2a86YnImhgt5JF6kGfWCdqVGm3rvzS941nD07hzfi/OG1L
   w==;
X-CSE-ConnectionGUID: cCuUAN+OQB2K6u5cvFpdWA==
X-CSE-MsgGUID: CBI+7n0xSMyKsLNmLVjrTA==
X-IronPort-AV: E=Sophos;i="6.23,155,1770595200"; 
   d="scan'208";a="15383184"
Received: from ip-10-4-17-41.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.17.41])
  by internal-iad-out-006.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 13:57:19 +0000
Received: from EX19MTAUEB002.ant.amazon.com [52.94.133.143:5141]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.39.103:2525] with esmtp (Farcaster)
 id 68d3bac5-7a3e-4487-90d4-822c0b579f99; Thu, 2 Apr 2026 13:57:19 +0000 (UTC)
X-Farcaster-Flow-ID: 68d3bac5-7a3e-4487-90d4-822c0b579f99
Received: from EX19D012UEC002.ant.amazon.com (10.252.135.254) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 2 Apr 2026 13:57:18 +0000
Received: from EX19D012UEC003.ant.amazon.com (10.252.135.160) by
 EX19D012UEC002.ant.amazon.com (10.252.135.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 2 Apr 2026 13:57:18 +0000
Received: from EX19D012UEC003.ant.amazon.com ([fe80::67ea:859:1e17:25a9]) by
 EX19D012UEC003.ant.amazon.com ([fe80::67ea:859:1e17:25a9%3]) with mapi id
 15.02.2562.037; Thu, 2 Apr 2026 13:57:18 +0000
From: "Heyne, Maximilian" <mheyne@amazon.de>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
CC: "Heyne, Maximilian" <mheyne@amazon.de>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, "Chaitanya
 Kulkarni" <kch@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Hector Martin
	<marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, Sasha Levin <sashal@kernel.org>, Peter Wang
	<peter.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Yen <thomasyen@google.com>, Brian Kao <powenkao@google.com>, "Sanjeev
 Yadav" <sanjeev.y@mediatek.com>, Wonkon Kim <wkon.kim@samsung.com>, "Seunghui
 Lee" <sh043.lee@samsung.com>, Ming Lei <ming.lei@redhat.com>, Hannes Reinecke
	<hare@suse.de>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>
Subject: [PATCH 6.1.y v2 4/6] nvme-pci: put the admin queue in
 nvme_dev_remove_admin
Thread-Topic: [PATCH 6.1.y v2 4/6] nvme-pci: put the admin queue in
 nvme_dev_remove_admin
Thread-Index: AQHcwqieIRJTxL3DvEmKk95Z3tjcyQ==
Date: Thu, 2 Apr 2026 13:57:18 +0000
Message-ID: <20260402-kemp-dime-b84f5127@mheyne-amazon>
References: <20260402-moral-jockey-f072379b@mheyne-amazon>
In-Reply-To: <20260402-moral-jockey-f072379b@mheyne-amazon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.235.223]
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_145726_052994_BA28258F 
X-CRM114-Status: GOOD (  12.75  )
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

From: Christoph Hellwig <hch@lst.de>

[ Upstream commit 96ef1be53663a9343dffcf106e2f1b59da4b8799 ]

Once the controller is shutdown no one can access the admin queue.  Tear
it down in nvme_dev_remove_admin, which matches the flow in the other
drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Tested-by Gerd Bayer <gbayer@linxu.ibm.com>
Stable-dep-of: 03b3bcd319b3 ("nvme: fix admin request_queue lifetime")
[ Context change due to missing commit 94cc781f69f4 ("nvme: move OPAL
  setup from PCIe to core")]
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
---
 drivers/nvme/host/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 13c0098939ec0..38732c0c28bbb 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1782,6 +1782,7 @@ static void nvme_dev_remove_admin(struct nvme_dev *de=
v)
 		 */
 		nvme_start_admin_queue(&dev->ctrl);
 		blk_mq_destroy_queue(dev->ctrl.admin_q);
+		blk_put_queue(dev->ctrl.admin_q);
 		blk_mq_free_tag_set(&dev->admin_tagset);
 	}
 }
@@ -2831,8 +2832,6 @@ static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
 =

 	nvme_dbbuf_dma_free(dev);
 	nvme_free_tagset(dev);
-	if (dev->ctrl.admin_q)
-		blk_put_queue(dev->ctrl.admin_q);
 	free_opal_dev(dev->ctrl.opal_dev);
 	mempool_destroy(dev->iod_mempool);
 	put_device(dev->dev);
-- =

2.50.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


