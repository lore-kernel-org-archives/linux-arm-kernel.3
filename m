Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F5107637C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpgdsRBIfybYQpKIU9QXK+ymTOvzqCHCto1T2WRCbVo=; b=eDtfVQT3Anqh7fEsdaK9izRyQO
	7rwsdkqwrBIip75et+YOT21hHVvSnTYtvvWw5VPNJ/AmBwL9iogaTsyS5x87/0FDFAXjD0OhKt8Wx
	6MH3d20Zr8hZvzPi+ke4LYYg/jzA6urbFOfQoTbWhWldKon4dbSQVXXYJoweZygiFqm1YWU7oDRjy
	qFLY4uQFWdqC7AKeXWXo7uVa7qqlav6wLXnO+IScTV3rqeX11tl0V04ErsBOmeLNFOzhqn78YG3hc
	5QnZFDtSoEaBSDPdRDmGjvcUXRFQWgaNuN/UDog98FxTcQLCZgBLhTXdmPrpe4HL2/UvVj8AkA/2N
	Ma2aua0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vks-0000000FKS4-1inF;
	Wed, 01 Apr 2026 13:37:10 +0000
Received: from iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com ([34.193.58.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vko-0000000FKNo-375a;
	Wed, 01 Apr 2026 13:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1775050626; x=1806586626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=cpgdsRBIfybYQpKIU9QXK+ymTOvzqCHCto1T2WRCbVo=;
  b=mP4R24ttfPYvJd00KY+yOh+EThsDudwVPvk5GSJQH+f4F7NT8TJSWZVp
   tAbbiUDa/mtSrx4+phvYBRaeuUjwynXj8TPd6v4wb//XCMqLSu7UzMjyf
   TvCNz17YoF84pSo6ju7hbeUUIh72RfzOj655iKs39GQ5rKim0w9XW74TM
   ElVTR9ncv3ZD/Hvmrxg65FQfzKjsdNCo2WvKHaktF3LuiuA4pYDnGuH2U
   O61pOKBABIdw5SvLj2lUvLG4cq0vegPCEljRHE1jj074whFKtN5GMz177
   01wGC4ecnGMF2aL0tsUH8nwem94sJ9pMiHmf8bEvrfOSjId4IYAxOFDvc
   g==;
X-CSE-ConnectionGUID: 34e5EzuFRgOV31aCHGvb+A==
X-CSE-MsgGUID: efuqIHR3QoqOjf3QTAMGtw==
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="15127073"
Received: from ip-10-4-10-75.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.10.75])
  by internal-iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 13:37:01 +0000
Received: from EX19MTAUEC002.ant.amazon.com [72.21.196.66:16921]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.220:2525] with esmtp (Farcaster)
 id b4971fc6-7db9-411c-927e-3ab4757a8014; Wed, 1 Apr 2026 13:37:01 +0000 (UTC)
X-Farcaster-Flow-ID: b4971fc6-7db9-411c-927e-3ab4757a8014
Received: from EX19D012UEC002.ant.amazon.com (10.252.135.254) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 1 Apr 2026 13:37:00 +0000
Received: from EX19D012UEC003.ant.amazon.com (10.252.135.160) by
 EX19D012UEC002.ant.amazon.com (10.252.135.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 1 Apr 2026 13:37:00 +0000
Received: from EX19D012UEC003.ant.amazon.com ([fe80::67ea:859:1e17:25a9]) by
 EX19D012UEC003.ant.amazon.com ([fe80::67ea:859:1e17:25a9%3]) with mapi id
 15.02.2562.037; Wed, 1 Apr 2026 13:37:00 +0000
From: "Heyne, Maximilian" <mheyne@amazon.de>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
CC: "Heyne, Maximilian" <mheyne@amazon.de>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, "Keith
 Busch" <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Hector Martin
	<marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, Sasha Levin <sashal@kernel.org>, Peter Wang
	<peter.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bean Huo <beanhuo@micron.com>, Brian Kao <powenkao@google.com>, Seunghui Lee
	<sh043.lee@samsung.com>, Sanjeev Yadav <sanjeev.y@mediatek.com>, Wonkon Kim
	<wkon.kim@samsung.com>, Ming Lei <ming.lei@redhat.com>, Hannes Reinecke
	<hare@suse.de>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>
Subject: [PATCH 6.1.y 3/8] scsi: remove an extra queue reference
Thread-Topic: [PATCH 6.1.y 3/8] scsi: remove an extra queue reference
Thread-Index: AQHcwdydSAl8T/8/v0W8CfQbTcumKA==
Date: Wed, 1 Apr 2026 13:37:00 +0000
Message-ID: <20260401-blobs-hurry-1dd1b23c@mheyne-amazon>
References: <20260401-defer-gleam-5226cb65@mheyne-amazon>
In-Reply-To: <20260401-defer-gleam-5226cb65@mheyne-amazon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.235.223]
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_063706_940167_06BCC5F2 
X-CRM114-Status: GOOD (  11.25  )
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

[ Upstream commit dc917c361422388f0d39d3f0dc2bc5a188c01156 ]

Now that blk_mq_destroy_queue does not release the queue reference, there
is no need for a second queue reference to be held by the scsi_device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Link: https://lore.kernel.org/r/20221018135720.670094-3-hch@lst.de
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
---
 drivers/scsi/scsi_scan.c  | 1 -
 drivers/scsi/scsi_sysfs.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 696f178fb57d8..0eaec372f7560 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -344,7 +344,6 @@ static struct scsi_device *scsi_alloc_sdev(struct scsi_=
target *starget,
 	sdev->request_queue =3D q;
 	q->queuedata =3D sdev;
 	__scsi_init_queue(sdev->host, q);
-	WARN_ON_ONCE(!blk_get_queue(q));
 =

 	depth =3D sdev->host->cmd_per_lun ?: 1;
 =

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index af81b2ba0c9b3..456b92c3a7811 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1486,7 +1486,6 @@ void __scsi_remove_device(struct scsi_device *sdev)
 	mutex_unlock(&sdev->state_mutex);
 =

 	blk_mq_destroy_queue(sdev->request_queue);
-	blk_put_queue(sdev->request_queue);
 	kref_put(&sdev->host->tagset_refcnt, scsi_mq_free_tags);
 	cancel_work_sync(&sdev->requeue_work);
 =

-- =

2.50.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


