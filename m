Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55742D4415D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Hrrnz1agtug3txFehsx1kEyvbttcAtV/uHNaVwzOvQ=; b=Ma83di2ClUE+mVpNXlrxdBCe2b
	QLercAg1BN9fuJTc6qKuc6OZ+VTCStkeV98TShEH5cx60awWX+ZpFexTMVFWScFMcRJGsBSP7W7r4
	VsT7GkcLxGyuDqq8RUmEbLZDsdw/JOUkglu6lXiszEfKrhzevG6iOj5rQ7p+Ql6QXfxFyHzsu7mCQ
	clodsTp1gr/noLlETgj5GkweDQY/SI12u495XxnHZ5JiIwbS+NOrN21XfDngioX8L+/nu+5c4F9Y4
	oH3dHWFv+IAQpr1LgPO9MCvoZm0JYp0hHRyEzhbasvS+J23UUSV4bhB7SCAgbIr6dnCArEvbv77Ul
	DTi57/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU02A-00000000PFU-0iof;
	Fri, 12 Dec 2025 10:05:58 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU027-00000000PET-0NKQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 10:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxMQjrucY93GM0P5JjmTN/QO2stGXva7TXrwnf60qdWSWurN4fY5VnqT1YWy4O78zu8vQ+y3NnD7aJ4eWJ6B3Gsm/6Tk7ee1WRHwjkHuDE9k1q6cneQHV0uzu1/zsXuHMubeg3Te8I6UmLyBOswfmlxnEqsETJIcJR6KqELsROpYuAn9ulVSDocRPI53XAW9JJ38A/MnxkSqWwTAQi6xwZYJ3caXpHXdTyLFAzoHx8/7j8Qbpy8X9+G3HRME7gKlESTDqojjOpXB8pjbte2qAFXb2x3Q6x2XRfyhEo5GtSC1vMif2bRAVwt6Z2q9DbMXeCqjplteN9HuFWWg9fxryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Hrrnz1agtug3txFehsx1kEyvbttcAtV/uHNaVwzOvQ=;
 b=N8iS/kLkKDCAQZH3kkl6zMCwz/T2hhjCwz/vUeMOLyviOty+4l9GWdq6ru9hGeChjTBbwmfEZg97j2VhRrs6f4JyJCinyd/Gq98Rlhms7kO5h8JccN75lxhRDUs0TwrSzSHxN7O9ueu+7BM+X6trDCJJG362Z5h8ahFLESvLGa4KbgMzb6t8vNvptHzfmMrkuLHeopsDvnXdIGmGHpdsXue1Ft2FBYqFt+0ZC+mGvZ/amBahogY6R5XvLaA+KGPtgwFQMyMgiUb6peCqhjjtGgJaPMtovOtaA76DmDGiamvLdJFeBjkz/K6hFrTHjFHiJFhhWabaWzEHmShZqhq7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Hrrnz1agtug3txFehsx1kEyvbttcAtV/uHNaVwzOvQ=;
 b=O4YZIpPN+neCG6tKOtzBS1pP+tMjkFpGIDgDIlSGm/0snlSEYxMRfgcAk+Cc6FWI0HZ6mnXW4ZJq3kcmksOEb7T/hXGNfEkGhCF7aX4sbB+j7jH+0C3qSAJQhhxQ/QBLwD/Hjg2QohDOaCC5oJK8vcSuogQWkyRH0of3A8VBJmw=
Received: from MN0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::34)
 by LV8PR12MB9109.namprd12.prod.outlook.com (2603:10b6:408:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 10:05:46 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::7) by MN0P220CA0009.outlook.office365.com
 (2603:10b6:208:52e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 10:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 10:05:45 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 04:05:45 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 04:05:45 -0600
Received: from xsjarunbala52.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 02:05:44 -0800
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH v2 0/2] Update firmware dt-binding
Date: Fri, 12 Dec 2025 02:05:40 -0800
Message-ID: <20251212100542.2756757-1-ronak.jain@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|LV8PR12MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: c461cb0e-9a26-41e2-9b41-08de39660487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?es1oXJ9fAs0BS3iGs7/sNzkPlAPUJ5Vqxp+VQ8JYixh/9cvQ1hUNi3G6IEpY?=
 =?us-ascii?Q?a7tmRvDNsEVy/TViXN4fcRSFlVXwe0vRnVseguD6QrP40enl2IXtRs/IYyAX?=
 =?us-ascii?Q?XuKrPFDZTXjBg1Vg3bwzhsfSEOYh621O5ay3z5XtrrOKsdtKjJmX8dyij8Nu?=
 =?us-ascii?Q?01NkmmpXZ/9GN2VXwN2Tt1KesKJXQ/mfxmXLUT9lidcUFS3B15kIFtTk5ka/?=
 =?us-ascii?Q?iAZj6mvIK3Egpm5ZoZo+a11tMqQQaMUlG6kB4+cecWyEmbil/Q60Yv+sFwoT?=
 =?us-ascii?Q?EWlzhz6koQjo5HZXPI/sF1BPk84xCJgFS/basOkicGD9ZN4OvZ5LcynlsaNR?=
 =?us-ascii?Q?PrVwCtEuCHN0UBHX7BUxEpGiYvidhRlQnEgey98pXeh8cpTfmWvU4n9+c9s5?=
 =?us-ascii?Q?yhM2vlWVQUG0rCRlQgxCQXgy3LA9JQQ7t2nZGn/LoFIRZlge7tgq8T9Rmt+z?=
 =?us-ascii?Q?FiAdXd+n0VDaxsQ9nOonKnTIE8c5wx6C3f2h6FoFWsUf9RZpgwShk7dYh6RQ?=
 =?us-ascii?Q?Qc7I8QdBQH0immARgdDQFfIMISVerb7bfMBb3gWNnfO1tO9CkMa7WJuU1alP?=
 =?us-ascii?Q?STvXUQ7AI5ZHS7Jcvd1le+evocMyGKdJ2llfx1RX8dGYywRH1byz7rbLrSpv?=
 =?us-ascii?Q?a7psiC2Mq/7eTLKz1xyKDvwG5+KaVy3kWa2ggzWw5avxLOZ25C8F7kWGJbh+?=
 =?us-ascii?Q?rZI101SoJZU5GryS2oaiIudT1t8SWmTT99LN55kf9/5MHzWat9bMgbrQdKu3?=
 =?us-ascii?Q?iPJGKdZmnlJjS1lA+pzbRVYSs9Gcxzu7yRsUigew6rakV5ETMmc4jM0nliWB?=
 =?us-ascii?Q?tgwj+DlJ+CPChlwyK+qALXh+YhfF3ci2EoxypIWfdJbAt2E4Y5RUO2Wavwr0?=
 =?us-ascii?Q?FEbLoIoD21NfHlpKBMP1AxVq7Orw1PP8rNbFC8sVmvmVbNHkOZzi6EJDEpZu?=
 =?us-ascii?Q?8NnQvezrllFNQUM0WLWqv3OQopF3dVxjFP+aIFpgJ0IXSi7c60Ip7aQtLnah?=
 =?us-ascii?Q?7zSEIBjmEvK5bAs/aKV4b7rDlp6x2hUoOF0HoeMO+kpC7XmWy52gPtyi9l3F?=
 =?us-ascii?Q?LFtA/2Bmi37RjkRUTUOkqjIAC62FYTptnGdfyWyyowbLNvK7XlCDbdMw6gc5?=
 =?us-ascii?Q?Hb22E9KrjuIlCyOj5W2oknI5APPYzPpT0Px+T360upVfd9B2bN10YzhXcg06?=
 =?us-ascii?Q?1jZxMIekNGFSCeEAnykPUpub5pYNgHkt2TNj+s8pkV4LIJQyDNu+O+5YDrfI?=
 =?us-ascii?Q?IJIM7UpwqHisXlpxAfw49V+rahV2Jm9dNkbm0W5WsRPrTmEVdy2/xkQkzQLX?=
 =?us-ascii?Q?B7dsOeU2cNjW7HXXC0qT4l/HFMdAsHR37IDDtZCqOpkY6Z0mKGzjPjmto9T0?=
 =?us-ascii?Q?lIm3bomLBq8XPPtnW1T0/OXMYFJg6YAdM9nzdU65GEvxk5vDfL77lgo3KO/H?=
 =?us-ascii?Q?SdgpNKXRhMICW/KW9olc1b+ApC+m4+jrgQ89eLXXs8a+w9xbDgUgp2AYKCcE?=
 =?us-ascii?Q?b5ktRJ/GjO0iMZKc8J3mauEqtIrr0LTXW0w+2G5bElKKVz8MfB1ryxZUmAbY?=
 =?us-ascii?Q?FdMDD45u/cK3HxVndZg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:05:45.8298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c461cb0e-9a26-41e2-9b41-08de39660487
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_020555_163033_31C2A708 
X-CRM114-Status: UNSURE (   8.07  )
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

The patch fixes/enhances below problems,
    1. Add missing compatible property under the example section for
    zynqmp_firmware node.
    2. Add conditional pinctrl schema

Changes in v2:
- Added acked-by signature in patch #1
- Following up on the queries again in patch #2. No code changes in
the patch itself
- Dropped off patch #3

Ronak Jain (2):
  dt-bindings: firmware: xilinx: Add xlnx,zynqmp-firmware compatible
  dt-bindings: firmware: xilinx: Add conditional pinctrl schema

 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

-- 
2.34.1


