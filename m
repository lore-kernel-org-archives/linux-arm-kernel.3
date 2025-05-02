Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E625C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cXXwc+BZ8KcRkIsM6RvYG2rxmbTcNTOCT+vESd/p1rM=; b=jx9Udx7r/noT1oKOBp+eeR7DCe
	qWcn4U7gZbkFJVPoKb1oN+Kmdx8hD4FARVSyIyh2lHJwHP6CpZmdkDOxyVUSPBWpyWWqFUxc6wpWE
	SkRlp4F0iIg054jPjEESxGE0xH2S4tHXHVlQcqQ8zhHA3wkWeUwbnfVPaeLHrWGjIHtic2yMCNj4/
	7KflAou+cBYB4I5JxsiAu/bECcFvM0E4A/BovzIZcy6+kXDyyYYF74Yfr9AlRtaQD46fhQtV1KSpx
	EKYHvNgfKgnNNXlQIlxayTilLMNkIenIIcd+TOKKl4bAa4fuZo7/yf5wRLWp0SDOw8fkS4hpSBY6q
	Or5hUftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6H-00000002dnv-1Gzs;
	Fri, 02 May 2025 17:23:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtDK-00000002VNY-0Fwn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 16:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cXXwc+BZ8KcRkIsM6RvYG2rxmbTcNTOCT+vESd/p1rM=; b=gi5sPXxBXOqsai44kz0svkkEXo
	6Eocsh+vYEquhU3uv3/vcTH+aKn7XmBFLd5VqxkOJqwESWZFXQc7O+MbfWNQY9or+nCHi+ZsQTB8B
	GzFY99kVsvqx2SVyHnA6UF/iZ6DNJ4BpNnC8l2plz/hnVFinOUoGZMo2RQjc4H9stGq48kpl0kebY
	1PiDkEdjyMiZ1Rhyy5HFl//snJLd4/MiNVKrFfObl6Fhy/epgrH9b2CUDvHr6A1ngWiAMtb7sDoH3
	Ict3rM817/nV2T5/9lSU38/7C8miVADUkZFOGU35NQjPKMzXwbn34FN0jzPC1lVoo4WusSXnmM+6s
	t2ydV20w==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAtDF-0000000F3u1-1efF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:26:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPksi448850
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746203146;
	bh=cXXwc+BZ8KcRkIsM6RvYG2rxmbTcNTOCT+vESd/p1rM=;
	h=From:To:CC:Subject:Date;
	b=lGSX/eJqSCiEaXcRdyFM2oHAYVHEE0nHJKYD2fBr2ld3IshaWm6uMH7yjUAXL5w0J
	 v8dsj/kRGZ4PM+Gu3Og36DwMjU7pY0u3RSGG319byw0q4NflZiSUuRV0aUV7ho6gFn
	 0Yrt3SAw2pEL25qrutdaQJ4gED0gLoBcABs5a2OY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GPk5q031008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:25:46 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:25:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:25:45 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GPex6028994;
	Fri, 2 May 2025 11:25:41 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <r-donadkar@ti.com>
Subject: [PATCH v2 0/4] Fix dtbs_check warnings in sensor overlays
Date: Fri, 2 May 2025 21:55:35 +0530
Message-ID: <20250502162539.322091-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_172609_921760_98FE38A6 
X-CRM114-Status: UNSURE (   8.77  )
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

---
Changes in v2:
- Change the Digital core volatge to 3.3 v as mentioned in the TEVI docs
- Add links to data-sheet in the commit message
- Carry forward Reviewed-by tags

- Link to (v1): 
https://lore.kernel.org/all/20250429154133.3377962-1-r-donadkar@ti.com/#t

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


