Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C66CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pmnk1p1wR2u51vF+qf9IlBdMpNuWfADZYy6Kwd9pNfw=; b=nZVITYIIm7LKgUNOn38Ie1uD1u
	NShMuGZxxcOj788Lc3M8FZNqCJRekK8RiA48wAMHRxnP9xQcm9C9zdRabegiOUgOXJHbXLIBWgpon
	PiXq8rR7ZKtGtRRytpeo5G+kUHvVNN7YUf9nEQ24GVt+rf2HLk/IkidfUjCQvuolV61S989yk+g59
	8XlBvoNrOSJ2B1/eW+5WeHhnhNHoVpOKnJalRr7GBZ4m5t++Mp40lW2nA4Sc4AfTnKfK4HJvyG+C9
	r/qzFjA1KviIVu0UAqyY3yR55/Jmjw1aqKCbz3BJm+UfPi8ZJxWD/4FyFJ3KVPLhwSD/UmVWr3JNm
	rNub5XAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBn-0000000E9g5-306Q;
	Mon, 11 May 2026 16:09:03 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTBb-0000000E9c8-2Tef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2yjK8A6RPzgx4DqrjgCFIoAHaG/ejWpSiheeoidRAEqA425rYFWHdKF9g1d6HFF5UD28zAa+Yx2GvjckNgeFmeDs9KTUzP20GFKltBwb894VK+XSN92PFAo8f/xJRvwa8yt9AypRsBYxk9W6m7wuJMYXeMvq8/Lyx68LQ/N7WBl2ggV5X4kyIksSb+px0K3uP7XZ4yv2BesMZqprBqwHzXWY68M7R8ImALlMiumtfew1Aa9kAGiUGOJIHZNmtNr0CtRWRTgx4z9GGtIJg7vi4gRC5md26YVhw4Dgy87Ag6HbrI3gWwC8wAy2H2sDDC346f1iIO3jHSBKfyj42VaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmnk1p1wR2u51vF+qf9IlBdMpNuWfADZYy6Kwd9pNfw=;
 b=arr+rwBQbuxjRtWO6R5qSsOmb64vh4KeE7ZCrA1UB961x6mrbW2c3K7WR417e+Px+exsQOazPtedUCNvPEzFG4BQic4TAnHDW1nD1kTBnVBcVqfAwCZFYMGVjjh6W61wicofm8F2kzN5EuNOymGv1nLj7+QnM629eHpzzWAfkv4+lIr5HD4hpdAIKrufxaxrn91MTwr8FarC4VC4ubkkFM1olvUwMfQCZjnmi0ydKSpHNTlh4QCj+/vSJsHOyZ7N0InHo+V1k76ESkGFE+5MzrtiRW52YsmrD6Qa2vDjeH3c6Cch3oWOp1flldp9n74trYsVbOUX0hMG0DtmXvDgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmnk1p1wR2u51vF+qf9IlBdMpNuWfADZYy6Kwd9pNfw=;
 b=O00BZMgAyc9b5ZUYCCzZdUz4RT+9Wd5ljwfzkTJMFTd3v2i5+LcCQBx6afpoU69C6OeSP0FEqeq/1MwNLb9g9f/M4LAEeSZy//WS5oIDKUIJ64hM2h4bu07dsVa42ug9OQjeYA2i3xE1KPZjio+VgpIqjhlpxUw8pkJqniR/ih4=
Received: from SA1P222CA0164.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::29)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::988) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 16:08:40 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::d7) by SA1P222CA0164.outlook.office365.com
 (2603:10b6:806:3c3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 16:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:08:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 11:08:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 11:08:38 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:35 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/3] usb: dwc3: xilinx: minor fixes for dwc3-xilinx glue driver
Date: Mon, 11 May 2026 21:38:11 +0530
Message-ID: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7c92b9-fbf0-416c-bd3f-08deaf779116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: SLRvZWB/6nZGvLE7W/RgBtz6RExKGK+fD6XQDdnWeAfhxV0zLVixXoWjUiQi6y8PeNGSoxRklmVAPnFJExq+k8pinGxAyBXHaZ/AngqSXZTFksyU49XHJO/IOH2gItYgZLkFcSqXC3iS0Orf0KfdMt/Js7xLJnQKRu4GatU2HRvWlmKvOv38JFZZcfchEB//sTBd0nbkUAyuroI83oTLEkB5MeLa6UyJYDgnjttu0OzvroPmaxFDFXeqmZN4FTknd4VHRtAbvcX5UjYMygwyxGMcbjAcFPFFR7Py8+oPt5CbxcHATlE9YxHQf68hwJL6k07XjZtuZLWfbJuRQSG7SYYwTOk7JQ0lOHLwXmj3/t5nPv3MoaYP3+y/Det71Wbg56W3KHX0pnxqFNRClrrlzTvSasO1+rVJUd7c8NHRyu4BPpAcXyRMO3r1QLxvSxI1plbNFdfPB8WAJYy2O6Tn82q5V1jjgEkmBtZZS28t1TEOA3fAf2Gfm+jCzQlMkx76KTRzS2srvfnjl+rrVJhc5VpsKwCYkm71I39toDxdPQDFXp2RIBoW82awEW7IBWcrbK7+POQXHkureft8jCGh0ILR8iOCvKfmmYQV7mIe7v/cNbidZfTvcey7jlbKWOuGOtkX7Y43TzcItGPXsMHBgCGLcclHYn9XhBepsj1bq13h3MyL7qrv3co3eXB4u4qRWxw0yA8i1X53mJH0leJhh+dnghdHTdccSYV2Gc365Fo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MF6ApyMTMvqvddThopXUYQpZjF/IQfjwoQm4dqWy3+ksw4gh4tryjFfa+kZH7ls8T4OgUjRdS/p393aWzYsK2oGjLnQ9Fi6l/6KUk5Smcncrz7aBBHtPOSX/o5ZyibIFZwFdcl2Ys0pCGb5nqiGMc7kaOhzmdzt2VmVF6ngtheevCP1hLv6l25X1ZnVoWNXBzeOMym9pgUA/uMfNF++/ilnd6OljtXrciPbNXP/lAJpE7rL6m92BkULC7/x+9DnwguGiKJw196P6OqesfaNCGwR+ouF8lOPQ4Xdt1tcWUf3eS9fH1wHfiTGU+f32yhwDpoQyyMjQu3jqDIE4Lp76jY4X00vL+DlOM1T9VCL5NxIaXu87DLEE5B8//LF+6iNvyguMOcLBNMosKP+WfMu5zJOFzcLFfN8TT+qo6/eozhN2Aveio1NRiJbCWl0n4ju5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:40.2702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7c92b9-fbf0-416c-bd3f-08deaf779116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090851_653332_05A7D3EB 
X-CRM114-Status: UNSURE (   7.72  )
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

Minor cleanups and a bug fix for the dwc3-xilinx glue driver:

- Fix a comment style violation (missing space before closing delimiter).
- Use reset_control_reset in versal init.
- Fix phy resource leak in zynqmp init error paths where phy_init() and
  phy_power_on() resources were not properly released on failure.

Radhey Shyam Pandey (3):
  usb: dwc3: xilinx: fix missing space before closing comment delimiter
  usb: dwc3: xilinx: use reset_control_reset() in versal init
  usb: dwc3: xilinx: fix error handling in zynqmp init error paths

 drivers/usb/dwc3/dwc3-xilinx.c | 45 +++++++++++++++-------------------
 1 file changed, 20 insertions(+), 25 deletions(-)


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.44.4


