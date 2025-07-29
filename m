Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E95CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dC1l2Kr1gTPn6e3ySSguiqQQuq32M7Wg4iyZ9FRv1UQ=; b=MtIPcEXsKNsppmrbyMbkNR9TG4
	883bgWC0Bu8lzGATjVBtQfAjrpp+KY3DqNMcCShK1OD7vFh7pv7y+DlMxK6mOxLj4X1Vn2L943FRW
	+AgTgnOf8c07SDuUoGLpU+EUNyOagwPbvKKiIGZCLoOO6nEC04oHjslOhhE7f8pNG+FhGtpfKJwxn
	1gNVHSv1P/g0BsME7BEg//hSXi+BVCggJStaDm0poVROUb3NEDjBTUfDu2KSUYYV6CELGzwGFf7mZ
	C2zc7SBVTl+n/C53xdCo6LybO+qReD8bbkyYYNaimJ3Fkw/C4CkO0vWRzhtNOj8AMdo404nL1eYgn
	ST5P2PEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggAe-0000000GJX6-3xLw;
	Tue, 29 Jul 2025 08:58:52 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg15-0000000GIEI-2Ukj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 08:49:01 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T7nwHU016225;
	Tue, 29 Jul 2025 01:48:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=dC1l2Kr1gTPn6e3ySSguiqQ
	Quq32M7Wg4iyZ9FRv1UQ=; b=WPanjw30ewJfBXicincBxiNIzOjnxVicL8vOyUX
	3F4WCR6Kp4A8yumqbcKgxzV/I8mSUJ+O3lRA3s7Y+tnD0uILEZ/4zxGRxzCTIle2
	gy/wPuMSW228U3yZFB47JCtGGmVT5/mTWWwwXRdMD0ztFwBJCXlhvoXa0Wi7stS6
	KEvGHb9VOpb/oooueiu+gJx7sNEl3WUoTH9KaKuC/qAmxDeMyNLAa0UaXKsKIRfe
	ewEgh/Iq4dyoxH48QxnqhDv5pVA747TVlzQGlLbl5MfR9GOQnimyyuUDy1dXnEkL
	SEIvtreUCZhcoh/avd07mYSE52euoIXwfLPYn6GDjc1x9LQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 486t86g3qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 01:48:35 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Jul 2025 01:48:36 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Jul 2025 01:48:36 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id BB4243F7053;
	Tue, 29 Jul 2025 01:48:32 -0700 (PDT)
From: <enachman@marvell.com>
To: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <tglx@linutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH] irqchip/mvebu-gicp: clear pending irqs on init
Date: Tue, 29 Jul 2025 11:48:26 +0300
Message-ID: <20250729084826.3222785-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mhCc1890rHyS8Qi2IpBOiKkGQ_cba2WD
X-Proofpoint-ORIG-GUID: mhCc1890rHyS8Qi2IpBOiKkGQ_cba2WD
X-Authority-Analysis: v=2.4 cv=YLSfyQGx c=1 sm=1 tr=0 ts=68888ae3 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Wb1JkmetP80A:10 a=M5GUcnROAAAA:8 a=dGVNLvYjXAbngGU7jv8A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA2NyBTYWx0ZWRfX/n+03sKb1Elf b21G7HXARViRjUyGceyM6bL7J5mNAgU/t0HwKwslftIJh1e5kxN3PeQxBml43KoO7HMwNC4gvL9 vml2O7w4VnoVrv8XhdLqJyV/REf2MDPe3kFmjPPGkaCwilK2NsdEDSL3SHzEtr6vXpwKtyACiN1
 SZBqDDDORi+PxLls3wah1haHwX/03WvBBO4XgPf+Jv4y0AZX1l5incitakuuvLsWtqS3Zdo+jK3 6M1EI3V19GW9UhC1AJecUtVxNUrDvyiIHqriRTeUKpOWlUzm+cymjuS8Q/TvJ9Ufm73V2RSn2/q T5UdPd/nD0DrC9VHdJcsFzf6jJibwjct9Fv98h8EIErtZWKyCiY1nn3YrfDNwKQUIRmo4M4EXj9
 iRQi6avQMSAIMQ4Gx6T7425/8S9xNkYvF3YQMGLMpMoHy1z5gfS8mFhtmPumr2z7QIv56iod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014859_635493_87BEF600 
X-CRM114-Status: GOOD (  13.53  )
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

From: Elad Nachman <enachman@marvell.com>

For kexec case, left interrupt might generate spurious
interrupts in various A7/A8/CN913x interrupt system
from the I/O SB to the NB. Clear all pending interrupts
when the driver is initialized to prevent these spurious
interrupts.

Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 drivers/irqchip/irq-mvebu-gicp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index d3232d6d8dce..0fa21a45d4e1 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -31,6 +31,7 @@ struct mvebu_gicp_spi_range {
 
 struct mvebu_gicp {
 	struct mvebu_gicp_spi_range *spi_ranges;
+	void __iomem *base;
 	unsigned int spi_ranges_cnt;
 	unsigned int spi_cnt;
 	unsigned long *spi_bitmap;
@@ -236,6 +237,14 @@ static int mvebu_gicp_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	gicp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gicp->base))
+		dev_err(&pdev->dev, "gicp - Cannot ioremap !\n");
+	else {
+		for (i = 0; i < 64; i++)
+			writel(i, gicp->base + GICP_CLRSPI_NSR_OFFSET);
+	}
+
 	return msi_create_parent_irq_domain(&info, &gicp_msi_parent_ops) ? 0 : -ENOMEM;
 }
 
-- 
2.25.1


