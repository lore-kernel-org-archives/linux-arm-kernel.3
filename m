Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A4FEA80D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppnKZEdmmJpbM0b/Lc5OQLwmcCK4ODIOS1qyAKpRn6E=; b=rTAbt3hCODIszSVYzNWsYEztWT
	8n5F4z2rH7XL0uXtdGT2OPinp8gBFKDFZA3hH0Kpk3Y1+SbUPsgewakXKaRwazJRO4ZrjFLTXBC1W
	mCH2dDl2U7fpt1ktL8a8OksW+Bdl0Pmsl1xrPD1hDCO/k+LnWWcoXVFdLM3J1XKJi4UdWRH19wzOH
	T3sjTu0Io/qjuZmcYmaJEddvxXIK3G92kd3vFeg5wC54hjltjrgpCgmL9aFwlF+Il4n+uKllEWB4l
	BK3uBAecN+QHxFXJSQxsjhmGwId+NUWiWgJbgMbNQve86DU6e4MuwjySIqFp+rbsAnCsOFaNPSdQb
	sOdXQk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HoJ-00000002n1G-0wSZ;
	Wed, 25 Mar 2026 06:33:47 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HoG-00000002n0Z-0FF0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 06:33:46 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260325063335epoutp0170f899c18005977321fc071b7c731894~gAfdZ46Wr0494604946epoutp01d
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:33:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260325063335epoutp0170f899c18005977321fc071b7c731894~gAfdZ46Wr0494604946epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774420415;
	bh=ppnKZEdmmJpbM0b/Lc5OQLwmcCK4ODIOS1qyAKpRn6E=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=AIa9ubkbqSyV/CU7vI8s9yuxyuKC4Mk+jHPbQ0Pdzi1aSSJQCwx2QISgrv4q+Qwy7
	 3BaTq8G38+VQktZ3JQRhGq9Dq8OvzWFtl2D1JYMVomxgo8Oo03CP+awXv4sjboTPJF
	 DLeq1Qfun60bmjJWjXZQqqJ6wXDDvvAuWSAI4FK4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20260325063334epcas2p40f15a1f6ffa1ffda6628090b5f3068f2~gAfc4teNk0894508945epcas2p4E;
	Wed, 25 Mar 2026 06:33:34 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.210]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fgcYV12prz3hhTD; Wed, 25 Mar
	2026 06:33:34 +0000 (GMT)
Mime-Version: 1.0
Subject: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: Justin Tee <justintee8345@gmail.com>, "kbusch@kernel.org"
	<kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>
CC: "sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
	"neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>, "justin.tee@broadcom.com"
	<justin.tee@broadcom.com>, "nareshgottumukkala83@gmail.com"
	<nareshgottumukkala83@gmail.com>, "paul.ely@broadcom.com"
	<paul.ely@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
Date: Wed, 25 Mar 2026 15:33:33 +0900
X-CMS-MailID: 20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6
References: <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
	<20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
	<CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p6>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_233344_735827_19769874 
X-CRM114-Status: GOOD (  20.81  )
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
Reply-To: hmi.jeon@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Justin,


After your feedback, I found a simpler approach.
I've modified the patch to add nvme_setup_cmd() inside 
host_path_error(). I think this patch won't cause side effect.

Please leave a review. Thank you.

- Before
nvme_complete_rq: \
nvme0: qid=0, cmdid=0, res=0x0, retries=0, flags=0x2, status=0x370

- After
nvme_setup_cmd: \
nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
cmd=(nvme_admin_identify cns=1, ctrlid=0)
nvme_complete_rq: \
nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370

Regards,
Minsik Jeon



From 98af885be8314dc9093983c531fc36b454b78e81 Mon Sep 17 00:00:00 2001
From: Minsik Jeon <hmi.jeon@samsung.com>
Date: Wed, 25 Mar 2026 15:58:20 +0900
Subject: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error

we were checking host_pathing_error before calling nvme_setup_cmd().
This is caused the command setup to be skipped entirely when a pathing
error occurred, making it impossible to trace the nvme command via
trace_cmd nvme_complete_rq().

As a result, when nvme_complete_rq() logged a completion with cmdid=0,
it was impossible to correlate the completion with the nvme command
request.

This patch add nvme_setup_cmd() to nvme_host_path_error().

- Before
nvme_complete_rq: \
nvme0: qid=0, cmdid=0, res=0x0, retries=0, flags=0x2, status=0x370

- After
nvme_setup_cmd: \
nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
cmd=(nvme_admin_identify cns=1, ctrlid=0)
nvme_complete_rq: \
nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370

Co-authored-by: Beomsoo Kim <beomsooo.kim@samsung.com>
Co-authored-by: Eunsoo Lee <euns212.lee@samsung.com>
Co-authored-by: Steven Seungcheol Lee <sc108.lee@samsung.com>
Signed-off-by: Minsik Jeon <hmi.jeon@samsung.com>
---
 drivers/nvme/host/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 766e9cc4ffca..378d28b2c971 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -512,6 +512,7 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
 blk_status_t nvme_host_path_error(struct request *req)
 {
 	nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
+	nvme_setup_cmd(req->q->queuedata, req);
 	blk_mq_set_request_complete(req);
 	nvme_complete_rq(req);
 	return BLK_STS_OK;
-- 
2.52.0


