Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03579CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDKsKDSbVExn0jxUl7+BzuzYpAY/H5UznWmB8z1SNjo=; b=FVaJKWPtu7t6hxvBoTJJhSAqmG
	FAeG+hoxcKgGgrRq+5L0lJdIDMnoo7Fw9PWT4lKMYin2I7jsvOSI7EuIOGj2aZzF3W9Tx8n1+6C7g
	wZtMwdgVxGW17PHBNwcJ9rPyNXvVfiL+fr6y8MUhABlGb1JGNCeVlI+Yb5ZGjPuPcKXb9mDgtJWa0
	woEvEdlLGNWtqKe5goIGUhpRrcxAIn8t7gMRpGZMNICr2GpEovDGLGV1zw3yOnAdg3xll3szNscRr
	3VVumu2HTNcV7uM9epePQko1yNQozXAdJqPhfiA0yXRUCQMBNDo+LGWl6/MuDlHfozFEERQvHfMny
	P83tyKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn5I-0000000FJvK-26DS;
	Wed, 03 Jun 2026 15:00:44 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn5A-0000000FJqs-3YoT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1780498836; x=1812034836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PDKsKDSbVExn0jxUl7+BzuzYpAY/H5UznWmB8z1SNjo=;
  b=cmMoK126WvsLYAVMpPvQCmGQUcJuq2A2X43dH37H1KQuyXysRgfGtjid
   6VLLmJH5Psw6AsRya0pVNLXqhGjEZapmBf3PtLpy3nqJhyinHGfS8d7BA
   5C767eT5AvoXZI/g6rluNnPnJo2C/ZewaaSPMatpaf+f0aeYEfTuBsccf
   FM7uRHEZ5hB79hK5+lX4pMURdEUAzY6ebSGglQ1AK2sqvuWkmgBh5570s
   avdRQuuzwl8kQo+laUbgqimMud37HExeHpVpNSCkuV3CGFQbMVMjaPhaV
   g5TUbAhsjAUP5DWU7gLsdJVc+ygEg1jdb29ixTdkv5y6oj8Fq6R0j9TBL
   w==;
X-CSE-ConnectionGUID: b9jaOWH8RN6ZEhdVqDhijw==
X-CSE-MsgGUID: 2SVPzv9oRj6D/tKKggKFEw==
X-IronPort-AV: E=Sophos;i="6.24,185,1774310400"; 
   d="scan'208";a="21030303"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:00:30 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:26179]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.252:2525] with esmtp (Farcaster)
 id ebaf609f-8359-43be-8777-7a8e67c948f0; Wed, 3 Jun 2026 15:00:29 +0000 (UTC)
X-Farcaster-Flow-ID: ebaf609f-8359-43be-8777-7a8e67c948f0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 3 Jun 2026 15:00:29 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Wed, 3 Jun 2026 15:00:27 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<avivb@amazon.com>, <zeev@amazon.com>, <blakgeof@amazon.com>,
	<ilkka@os.amperecomputing.com>
Subject: [PATCH v5 0/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Wed, 3 Jun 2026 18:00:23 +0300
Message-ID: <20260603150025.30980-1-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531110447.10095-1-avivb@amazon.com>
References: <20260531110447.10095-1-avivb@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_080036_946135_3C39BBA5 
X-CRM114-Status: UNSURE (   8.14  )
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

This series adds support for Graviton5's customised CMN-S3 which has
zeroed discovery registers.

Changes since v4:
 - Fix patch 1 authorship to correctly attribute Robin as author
 - Collect Reviewed-by tags from Robin and Ilkka

Aviv Bakal (1):
  perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5

Robin Murphy (1):
  perf/arm-cmn: Move DTM index data out of hw_perf_event

 drivers/perf/arm-cmn.c | 121 ++++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 31 deletions(-)

-- 
2.47.3


