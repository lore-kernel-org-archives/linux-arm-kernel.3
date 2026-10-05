Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB80FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m0VKyXAl9UvOM2m80f7vibkh+DaQDic+AOY37wFW5E=; b=l4OqLXtLwmZ/5FX6vHNqfInJUe
	V05+jpEc56i4EfLZwEc0UPMFKcUdnd0pF+/iQhY3inFQz1y8ncIjG1rP/xFy6Gjeh0djAXZvBOUFY
	vPgyC/FKl0uUFi7Vmk0xsHfuOL5ymz5WVRUkwPij8cNNNb3ivVnMLcurobGNQi0N0vFDmwiiDrsBX
	yJV9rQY4DM9Y1MmRAWMX695HuTKA8o6ktD7nT/Ye8KEwdtCaQx6OAIF0Fl5AGgJ1qqKfWis49ovCU
	QU34UUeATWCIJEEYZoxhYsz383tK3DPa/UBbBuztUea2AY+n1P6ocH/kXtGiY9yMH5y5eqGUhBexW
	Hiuji6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfFL-0000000G3Dk-2NQ9;
	Mon, 05 Oct 2026 09:44:35 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfFF-0000000G3Bq-1NFQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJfJIEJmwddmhi1QoBC5zYzAAk991dxGAg0IScn/kZhF65OYoJrfhUZZxw/FVdOBjNkstYE6S19GWmDUGOZ0ucNV4/GBkinNE7Zm/P8tbB5LMZm9BFXvOnI/0PSGZm5vgOU43xzILzxrHw677wnjxeVPBw61bAeeStAFXrH2rGZG0APC43ll542tEz1IhqmmE9vcZd38bbNAprJUw7oqffX/Rr9rN7Qa2K2+9ccd/qJVaMjy8mPc72oZmhvuXmFSRf/3O/QvNsWIuxtbgtwv7MZbPsK2uTFtFVEU9fNVwjAQol0AcU6cuytZyDfjNE20ORVu7yDvqkfpxMiJCqAWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m0VKyXAl9UvOM2m80f7vibkh+DaQDic+AOY37wFW5E=;
 b=SMxeo8FmOHEWxyLZs7h2aBhklBSmjO/S28d9VdPjYgKw5zj0/UrMMauI/a0bmvIPyDSUZeP6TX4BLEqpDHX/Tr5Wwz5+5Myu4QMBVDM/Vr6tTEbW2Fc++ywWYxfs3D8xannbvXtVrdgNlHbKVXVjAVa4v6NRa5ebVrfsTOZsh2/Sk+BdCNsNgq0Y7Bx4C7bPZxSE3cfDrgHWNFcbsHxKAhfVpBMRW5COAqgXgMjiwdAotdYztlyzH5MRuC+UuH7GBhFY8lLE+ll3GmA2Ut1bSjnwTEppt5B8pjBNRgj2Cuc4jU0XA0dNn35muVz3pQNh6r8SciohgLKNdUYF9qY7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m0VKyXAl9UvOM2m80f7vibkh+DaQDic+AOY37wFW5E=;
 b=PoaGKsjqtRcXVAlc/LWuw1TlZNgl7w+aVgW0T+pA4kGDzlmDWMh1G/1Vi6tOVH8VytvWX017rs/FDnYweilDVuYKmQajLcTJU707UmGuIe2ORF2PfZANv7va5DWrmIloCfJkF/Sa34Oa7sNr1t5pRVLEaLKrc+ui0vn2L/lKsH4=
Received: from BN0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:e6::18)
 by PH6PR12MB944609.namprd12.prod.outlook.com (2603:10b6:510:3de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:42:20 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::8e) by BN0PR03CA0013.outlook.office365.com
 (2603:10b6:408:e6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 09:42:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 09:42:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 04:42:18 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 04:42:15 -0500
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v4 01/15] iio: adc: xilinx-xadc: Correct write edge in CFG
Date: Mon, 5 Oct 2026 15:11:51 +0530
Message-ID: <20261005094205.1045874-2-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|PH6PR12MB944609:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3fff11-e344-4687-0d06-08df22c4f364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|18002099003|22082099003|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 0u6J8anENjJrQAtnMV/mfwQYuOEtvRw71yKLjpltHoEiSpeyuX+fzwLHeGlRyjql5Dsv6cerriLMTpKXJqZQOJWM2VaeprFcNL09AcD0rFsYrszNabPr4P7KHP+XUcZ196cL7CpfIq7IPxLWrZDsjDavfo2x1wdpOfwiHI1jSxXyJDwN8zOLEBGCWLTcLjagLDBpCP/m367HxX0EJQMsxHWnZ+xuaLMSwT1kCWpMXhZ3aKkOeZNWid5GxPfKUt6UkgjsFhXgAZ2yW1FxLb8FoTWEp3xxQPWEDr8iloFNTJG48phL2rDmwG1lAI/vr5lDlhvc4B8kzpUpTcqV1lrHBhGNgjxlLp5D5Ps7S5GBMqTONTOwqu/rPZyvfSxZad0SSN+VXGjIq5zwNJShlLugXw6nsZdXDZfPYLOhfkv/TkfYvQuPw1s/fSok78/n3izgFWQbNycM+V9qedEfosODcfOoOAqcSe4afdulTGOZr4cJLWRlNfU51ZbixOzdRHTtS+hhq+3fKALeHRInSL+nRjc9Iypv51MMo4jRx7ASmxll/ysrhQrzyWVWpUklVwuc6kdE81/Aa9buGHYaqB43y0S9XmX5LMlGcPHiQ8fiIH3QPuKBJsK6WWNq4/QVdPnd2W5SwzCBhraTbLLp/7+PPqZUE9TjInvJAn6HM9xYbrfIZDdBKn1v3kh4KWiEhPUt
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dtNOCcMScX6z7vuA9qOtl5dQAajdKnMzphzJYagPVrqLpz6x77Jufk2FkclGKeaWqirr2RzXRRuQcJH+ULOWABjNk8D0zVhw9SJ6n/tGqMmZmmqNfPbwTQzKTlAeNsxmwX3tW3UipkpApsNUYAnfuZ1pE1qEOMhBxE65/V7SBnZjNWwcb5h8A6I5LFA2MTZzHj47rN5bkgWxmRqn2PvGLbG8cdIsjIMvg8jud0w5JogiYMyO/4nLxbQ2/Xos3dZ+Lj1IoJ5VmjCMRtCTfbABCR58zyUUhhuQzXMsuw5zFmb23wa8oES9MdqC9m37NlczETg2yF6CeE/kIbrAEwjv6ihjyx4aAAF9ksIRPbj7gar9lfykPqHXDiZsWXhOLNCzhkhmIW6x6zMUdUv8qM6oKt+ULflwVcbsdp2lae25NOmK8cXQ1wu2GC/fYlao4bPN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:42:20.1826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3fff11-e344-4687-0d06-08df22c4f364
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB944609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_024429_369664_36F027A0 
X-CRM114-Status: GOOD (  10.67  )
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

UG585 describes the PS-XADC interface configuration steps: REDGE is
1 and WEDGE is 0. This is consistent with the XADCIF_CFG register
default value.

Configure WEDGE to 0 as specified by the TRM. Abnormal
XADC temperature readings observed on Zynq-7000 are no
longer reproducible with the documented setting applied.

Fixes: bdc8cda1d010 ("iio:adc: Add Xilinx XADC driver")
Co-developed-by: Conall O'Griofa <conall.ogriofa@amd.com>
Signed-off-by: Conall O'Griofa <conall.ogriofa@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: stable@vger.kernel.org
---
 drivers/iio/adc/xilinx-xadc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index cab66bb8cc1c..bfabe78b66e3 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -390,8 +390,7 @@ static int xadc_zynq_setup(struct platform_device *pdev,
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTSTS, ~0);
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTMSK, xadc->zynq_intmask);
 	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, XADC_ZYNQ_CFG_ENABLE |
-			XADC_ZYNQ_CFG_REDGE | XADC_ZYNQ_CFG_WEDGE |
-			tck_div | XADC_ZYNQ_CFG_IGAP(igap));
+			XADC_ZYNQ_CFG_REDGE | tck_div | XADC_ZYNQ_CFG_IGAP(igap));
 
 	if (pcap_rate > XADC_ZYNQ_PCAP_RATE_MAX) {
 		ret = clk_set_rate(xadc->clk, pcap_rate);
-- 
2.34.1


