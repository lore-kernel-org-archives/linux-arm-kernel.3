Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318B9C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HKA6epoyG5k7PVVX2SWKSB8APlH9M5pg/2J3Q1G9Iqs=; b=Mhfe/FkhqZZnQjpFebuVP3GgF9
	QQpltBDMegd5ZP85cNMucHmporHjHOUgPvvfZ0MNHUPITMxBLPRTrZy3CCvJx1ABYuy141pVXT5/1
	uOj2BuvKEpBPPf4yCdzSQHF2ytnx70oKr5U0rxzqWdjst8JhavC0eAfasK/ZlS9MoXujAUlPKiVMF
	W+b6v7NejSizHfjWUU5jFDr5vzUfVWn1jzPvs1xOb4q/2PWaLbLlHYOnxDUtJBzmpdEqInSpzD+A/
	dnydJLjkrj0aYxialPMl16P00bsUqG7YjGN8aIOtzTSi5Xba114XGo+s4a9T3KBrzevtSLnW5wCv+
	HOMayz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6ZM-00000001312-0Iai;
	Mon, 03 Mar 2025 14:14:56 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6DX-00000000zIf-41sM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:52:25 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 523DqAQA2770688
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Mar 2025 07:52:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741009930;
	bh=HKA6epoyG5k7PVVX2SWKSB8APlH9M5pg/2J3Q1G9Iqs=;
	h=From:To:CC:Subject:Date;
	b=ZAQ4yBgK/Lk91iqOLs9LBj877KPeCh+db+1G/l/eZs3N1BA7S8TLyRradc9EKO9iD
	 KFSeneUZOYTm/b8C2J7PsAXFWdnfMDJOjOSWxDYmDf/VQOtHJSnWAXkYghrReMMZgF
	 4QiK2UjlOwILg+EEK3P9qI3lYfXyBw/8nU2aqVMs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523DqANo095277;
	Mon, 3 Mar 2025 07:52:10 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Mar 2025 07:52:10 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Mar 2025 07:52:09 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 523Dq9k0047060;
	Mon, 3 Mar 2025 07:52:09 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 523Dq8NA018076;
	Mon, 3 Mar 2025 07:52:09 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <horms@kernel.org>, <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <richardcochran@gmail.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 0/2] Add perout configuration support in IEP driver
Date: Mon, 3 Mar 2025 19:21:22 +0530
Message-ID: <20250303135124.632845-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_055224_040192_5BC7AF64 
X-CRM114-Status: UNSURE (   8.30  )
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

IEP driver supported both perout and pps signal generation
but perout feature is faulty with half-cooked support
due to some missing configuration. Hence perout feature is
removed as a bug fix. This patch series adds back this feature
which configures perout signal based on the arguments passed
by the perout request.

This patch series is continuation to the bug fix: 
https://lore.kernel.org/all/20250227092441.1848419-1-m-malladi@ti.com/
as suggested by Jakub Kicinski and Jacob Keller:
https://lore.kernel.org/all/20250220172410.025b96d6@kernel.org/

v2:https://lore.kernel.org/all/20250219062701.995955-1-m-malladi@ti.com/

Meghana Malladi (2):
  net: ti: icss-iep: Add pwidth configuration for perout signal
  net: ti: icss-iep: Add phase offset configuration for perout signal

 drivers/net/ethernet/ti/icssg/icss_iep.c | 65 ++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)


base-commit: f77f12010f67259bd0e1ad18877ed27c721b627a
-- 
2.43.0


