Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87AAC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OxtBiS9M80qDbTd9VXJ/v1Hn5GOVpz5N+s1O0UqU32k=; b=Rs2E5GIWBqOXB3VXm7pCOVhB68
	i9WyJ/FhAkWhs6Hkn3xZSFoOP6pdO8CXKNOOtfrw8U0d+Uum99tvdL+yKar2E1qc52nkLl58n2G7q
	t01iutmPFoS1RhtsX935mU0WU2PLaZq+xl+M+NU0Do7n4+2WxwJgcKJVynYPYXhqyPxRbq1+UNiKz
	G5kxhoGZRJmdHIAYsyigESg2b7l/swmGJo/THuW1dCroz6KI3Tl25fYgg49OYyRKmkc8t1vcZ8kRi
	usYwXujYbPkLOtTmuv3Ap3C4wb4XeQYl3LPN5R51yh8PPbQatykB/UoRmoAnciQHr8yYsovLat4Ya
	PkAykpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nR6-0000000ACWt-0CdK;
	Tue, 29 Apr 2025 16:03:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n5x-0000000A9wq-1yMl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OxtBiS9M80qDbTd9VXJ/v1Hn5GOVpz5N+s1O0UqU32k=; b=dIAuFOtOFK8hC+fMnPJKO5Yk/d
	xIWtmercWOB2L5tCahmvfo3uG66Eq5p+bn129tpUndkhOtvPyuoWdxSB9UqFQuPjdAghVbJmqAg5V
	oaghZFL93N+8kNUBGa+uhFg0KzbzlKFp7JU8eDsvQnocDTdJkKQulONVl5r9iiQoUClW9ds+se5L9
	9a8+MQvBgFelL/b0CyorfSdTmvVc3tAWMFRIwCsQG2Jk+8viPKAWL0FiayHJs9TMfi5r1rn5vbzRF
	EixbP7GNHHqLHhlLOlFZ4hPh+4PMozuDlAzks5L3cwLPmhecYTol0eg64KY9/56xggh0v1Gc1Jwv2
	XX0vImtg==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9n5u-0000000DS8G-0GUj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:42:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfdHY3882243
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 10:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745941299;
	bh=OxtBiS9M80qDbTd9VXJ/v1Hn5GOVpz5N+s1O0UqU32k=;
	h=From:To:CC:Subject:Date;
	b=lP1LzGL4t3TOSXM7vCrWioal767flHhPGJVCPLuuAzqnfE+QphWqi5VE2lE34Dj2k
	 jCjOEP9hMw9wCFlSDw6EW33LNZQRpj3yCoguIezdh22EJKYXE1uCa+Hd6YFL6DZtXg
	 +0JH8behbTglpWcOckmcsQNiX8vw0LdPTijVhB1I=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TFfdod049526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 10:41:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 10:41:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 10:41:38 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TFfXVp030051;
	Tue, 29 Apr 2025 10:41:34 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v1 0/4] Fix dtbs_check warnings in sensor overlays
Date: Tue, 29 Apr 2025 21:11:29 +0530
Message-ID: <20250429154133.3377962-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_164202_492277_5D502887 
X-CRM114-Status: UNSURE (   6.66  )
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

Fix the follwoing dtbs_check warnings
https://gist.github.com/Rishikesh-D/ba0876a26e35c3b9662c75563b8b77ce

Test Logs:
am62a7 + imx219 : https://gist.github.com/Rishikesh-D/f32d6a0ec3cbb0f9f4f29254239d3cd2
am62a7 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/21aad1db1487b884c22527d6e1432ae7
am62a7 + ov5640 : https://gist.github.com/Rishikesh-D/da4489f1813e90d840fa5ca91df5923e

am62p5 + imx219 : https://gist.github.com/Rishikesh-D/f75ac40f999fd996495f8962772761ae
am62p5 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/9d117779a5373e7d6faa2db59501746f
am62p5 + ov5640 : https://gist.github.com/Rishikesh-D/70f426c89154cfeb6292081623581a98

am625 + imx219 : https://gist.github.com/Rishikesh-D/b93542292ce22e498b1039309c60fae8
am625 + tevi-ov5640 : https://gist.github.com/Rishikesh-D/62d63e3a2bbf6761cc64457d70021bb1
am625 + ov5640 : https://gist.github.com/Rishikesh-D/b3e799671675d00363c3ceac00f8977f

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Rishikesh Donadkar (4):
  arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
  arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
  arm64: dts: ti: k3-am62x: Add required voltage supplies for OV5640
  arm64: dts: ti: k3-am62x: Add required voltage supplies for
    TEVI-OV5640

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 22 +++++++++++++
 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 ++++++++++++++++++
 .../boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso  | 32 +++++++++++++++++++
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  | 32 +++++++++++++++++++
 4 files changed, 117 insertions(+)

-- 
2.34.1


