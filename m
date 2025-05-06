Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7FDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ebRWM+3o09AKqu9Pk0NCzKq3MWq68HrD3704MTKX5uY=; b=AUGZr1KqWkoT+of6CDQMRMxfHl
	CN9300hTveAb5BocERw1ADtFsH+AiR8e7vpAPaRVhcqt+RixgyKZLNHYgrSz/3V/Nj9Tab3/en3um
	C26P7cE3uKd9N2tQcwTAERZutqZO6UKSDL3UJippFXf2skIz652OHrO8tC2gK0tP9r41EuU6OTsod
	QpPPxL+663eJHcxjWb/AFpKK4raOuelkOvW35ufJmpIsIGu+9/v1+Zepe48hss9ar0cVDVWrVVfgS
	uijAQvSGcVih8poOm/HKWCcsEfmry1OpvYk4HQS4zbNEvuOVHKhm7mjov4PeqRD3nTGjaWR700q1D
	FHO4Kt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBat-0000000Ad4c-2z7x;
	Tue, 06 May 2025 06:15:55 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAIZ-0000000AIzI-0fo2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 04:52:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qVTD431999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 23:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746507151;
	bh=ebRWM+3o09AKqu9Pk0NCzKq3MWq68HrD3704MTKX5uY=;
	h=From:To:CC:Subject:Date;
	b=xP9bUt6JPnXVKEVfQPbB1BRamOJYFyCQP813Taw0FvXZhjO2vhnEsXmDlH9Zd8N44
	 d8CvQ7TjabjshDu6Oa1iBgcWGrP6dAKZ5qf3C3L4+3qkkOmq/6O0iYybkv+xq6gZKj
	 ZJmUfRPQC+wGUYKNztxEN9kNi4ZHGKIU/t12dMvM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qVDh050122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 23:52:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 23:52:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 23:52:30 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5464qPcT069139;
	Mon, 5 May 2025 23:52:26 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>
Subject: [PATCH 0/2] Fix dtbs_check warnings in ov5640 sensor overlays
Date: Tue, 6 May 2025 10:22:23 +0530
Message-ID: <20250506045225.1246873-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_215255_310990_62F1CB1B 
X-CRM114-Status: UNSURE (   6.53  )
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

Fix the follwoing dtbs_check warnings:
https://gist.github.com/Rishikesh-D/2f6e0a11f2f72ce70f75058d0caedc9f

Test Logs:
beagleplay + tevi-ov5640: https://gist.github.com/Rishikesh-D/38ac71408f108147f4de596f260ad7c3
beagleplay + ov5640: https://gist.github.com/Rishikesh-D/7911f4efdc935c22a2c97ff502c73189

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Rishikesh Donadkar (2):
  arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for
    OV5640
  arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for
    TEVI-OV5640

 .../ti/k3-am625-beagleplay-csi2-ov5640.dtso   | 31 +++++++++++++++++++
 .../k3-am625-beagleplay-csi2-tevi-ov5640.dtso | 31 +++++++++++++++++++
 2 files changed, 62 insertions(+)

-- 
2.34.1


