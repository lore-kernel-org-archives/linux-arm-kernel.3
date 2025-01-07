Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8ACE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akPJh6u6ro3xwdJk0w/efOeU2utN/98RGUdaXpGS6dI=; b=PZMXlG75Jv++RBqTzLaZTy3L5r
	RNlNW9U6OmpI5QJv7+qZ2jHzE9tuxjjLeiOnhgUnBPCOT5PyVSdYl6xwdgyBqktUCEPHrtWwZexMp
	hqazVwsSvH7ochnWUxef18ZvoM7Wh1DC5XXoo7ZXBbi73c6hyOS1b1sds5QNZWukKpPcJBctlozYg
	vwecSkznuCTz7eY1I8JS6RfyVfzER27JW1EOa2YMj0VHrE2+oEkdJjzHLmn1J432W9rJ9kX4LuJGR
	hibVl+gQ0EgvRuZvencG2rKn8T3du2T1iSk+zVF8UzjX8fJMlziRK1oi6h7FloRMKcgs9gip7jjN4
	+fMA2z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV22o-00000003XbU-2pAp;
	Tue, 07 Jan 2025 05:22:22 +0000
Received: from mail-am6eur05on2062a.outbound.protection.outlook.com ([2a01:111:f403:2612::62a] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV21M-00000003XGb-3TdS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQOhzDczKE9BsxybuM607CXqJOvrr5purmjQK0SOD9ozF6Y05T9gqBpVxGf5g5xJcsYMk3Gxp1g/oEIX8VjbPnr6y64bEqDuOqyp0zNcWMm22tBsY7aAlm+iEfiOVW+aqruMyT9Nlk6QkkZJYNEFTq7bwt4FOp0sFOLC4vY4u9OulnWB3U6gBm+AfXqSzjhU0QmjTlUabIUhCpCErcxdHq28OlSZbTzyChb/Xv31Z2ClifKLNOx3Ghmqq+YTYgTdATN1hf/NQiMjIv5mJNdwAVEVHbE8NyXy4UXA+r8EVjHqmkkcEOzp7uYocJDBPH/MnYEzkM7M9jOhV40h+3yHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akPJh6u6ro3xwdJk0w/efOeU2utN/98RGUdaXpGS6dI=;
 b=YrN/7CbpZaXTXEfCnk5isA6Q601o94KbollBe/zW+M4Puv0bAlRJnu6ls9SS2ZCBQ9xX590FL9ktzko8cuPvOOeHMb2ZZMUDUEEWsToofQ9MCnCTMPOLZfj5wyrf2jKsnRWnS2KYDbM8Hm8GNHiot6H+uetbJdLsPFmWgfqxE1G/wpTZ/5YKqC3VN0Xhhhv6W74z6vsg37+uzWWxfCODIcqAi78bLV7bOba12CwzBMFFJu+kpchb1wY5mCFtf1ruvUv5ZPcSdizn1sht7GcTGm8D5EAWaThjK+OSlNaGM0toTLMgRSzx9X9R7sNN/RXBF1aqSaPrGu/VSN9DqCJU9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akPJh6u6ro3xwdJk0w/efOeU2utN/98RGUdaXpGS6dI=;
 b=vEJRwfgulnObk614frz6RfyEBx7/24O1RASJds268TI4u8qkwPpABo8bqS/R/nPUrbBL/MslHyK5O7ZrfNIR0/zJ+Y/WZuycFZBVwAaAPa6tagTvKV7wXr7bIwS7XN10uyPemZ0jg5DhCLPG3hoWSjNrlfVROfx/U9zwDZdix72eNzh4RL4SCUYb1rzc98c1FKTp7IzwpK2YlAZ8SCzawxk/5aMqOnRAFE5r1ibwSMifM1sAfl7O0s1KR0mJ/j1/QU46VJFJwRfy9R/GgqyU9qAB5S/2uo0Kw978Y/I0sCyOUykKuEABqIU0nBzhT5YBNKSdcKLCAUYVNx5lgCZR4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10445.eurprd04.prod.outlook.com (2603:10a6:102:41f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 05:20:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 05:20:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH V1] firmware: arm_scmi: Optimize the iteration of scmi_requested_devices
Date: Tue,  7 Jan 2025 13:20:04 +0800
Message-Id: <20250107052004.762817-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::27)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA2PR04MB10445:EE_
X-MS-Office365-Filtering-Correlation-Id: fe85fee9-2fdb-4268-c3f4-08dd2edb0a64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yI3qDcxv5J5GhW5UC9MIOsTM7EPnVHA0aRCXneH6/S2TeJQZtvGPdAA4u/f7?=
 =?us-ascii?Q?NX9lbKtrx+JpPMrNddP3ht+GsqY2PyHhfULPE2r1wp0udvo2Yrp/0TUyMhsA?=
 =?us-ascii?Q?9IeIH4Hsq5f3MqI4E0LMQfY6S7CQ7xRf/n7pW0D1F6SXw2PpIZNBu6WwohWX?=
 =?us-ascii?Q?Dxna1558l2gNAJhLESIGE8NFsxopHE9CtE0lm9giFF7l0/7lE3JEcoIsdGJL?=
 =?us-ascii?Q?EK3SV7LnhtH5CyIj7uXrqTQrqfdMzT80evvSHe2+gfWOw48DgO0dwQNxlgmQ?=
 =?us-ascii?Q?IVWFx6JDBuGltoNlcAV5zSmWh68O++BX+wNWT7wl7oa02qeNcg0ySaSo/kMo?=
 =?us-ascii?Q?Vf8LrRSV2OvlQbdpV0LrWrBfRZOFEynWo5IbDccGZXOPECRtcucyapxfEe4X?=
 =?us-ascii?Q?yOGeMhSoK8/4riRseUyK78oP4nh5uF/In4DQBc/QJi5TbDjarmH6IzVDv/c0?=
 =?us-ascii?Q?DVMNU/JyowFOI4PSEJSl92RV0LcCi6fsZkUMNxCyIB/PEyp5+MmGVrQ6WHmC?=
 =?us-ascii?Q?A4tXOtDeGuLK0LhNmEINFiGdoXmaTXMinduAVQB9n/xZBdG67az+wfxs44Dq?=
 =?us-ascii?Q?QDbFmJuqYAKcnTk9ZtBeHq31ShRWrh1KTSE+WZgwjTsgMTGlMVEUKhn904yr?=
 =?us-ascii?Q?5NknX1IK+VYmrPwx9pwaaDymAbeIRbINwvIGlSyv7To7HWOCp6IPKgWFfgjK?=
 =?us-ascii?Q?KPQjUmdHr9oWmXye2EOHGyIgNhPLfoFqb/Nru5f4jvC/A5lqSTTyYsSiSrjC?=
 =?us-ascii?Q?iLwy5Tjrer84ODg9ICx/8wRXAEG6fxaIz4jczEqyNia/9dNfHIfBXC+Fd5OC?=
 =?us-ascii?Q?jXOJpuqPn9VAgULeLFM4L4rnS8uLQRM0OPVgfVn0hUnelHEnlLAdrqm8MgWa?=
 =?us-ascii?Q?TfWzO/mkq32MSCyFrPlo1A20437e81ri0urZYKN+q0ODnr9Qbl3NTtTnRQhu?=
 =?us-ascii?Q?58xvC64aK5jTTX43Z2mW5r3xArrQG1LVOQAL832y2l+Lb1XqTfPJPop+z5xN?=
 =?us-ascii?Q?eplw3y3RD6oRp77CSppFsRJyEJB9pmHsikMzUa1tQocUj3GqxCc3L6hMRoQb?=
 =?us-ascii?Q?/6dU/A/jFNmC4HR/XVETc1ZhfMWRlOTyr478Kq2eN70upiQ6UM+NS1dG9B/2?=
 =?us-ascii?Q?GwWd28C8ui2qmSuUumVGwjiiW4yiru4pfnXHr3qhiR+zHETFXl5VZmYhH2aU?=
 =?us-ascii?Q?aa+IKLGYuH/aNYx8cCTG7XjjwslGAAKgDakFykT/+XTgCW0q5gsEnTTYDN8L?=
 =?us-ascii?Q?/fK+3DuLbgpoeGxLg8+xuh3zZeGAivYmd0AoJOVKLP0lOFHBzGtj6nJ3peYp?=
 =?us-ascii?Q?ZCortqizqW5oi96EhWb+uIq5F68ru5kYGiITY0NtWqSpigXRs++EIx3m+S0l?=
 =?us-ascii?Q?SudvkYNx0sjhptrGAerjIBPnJo+N18T2TN3wnWiIRfJql3t7r7vyDq4+n0p2?=
 =?us-ascii?Q?kTV69pWDz/KhxMNKanmW6x9YbYAIcNeB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OoWvyq8HqxB0SEqvHtJfdM3w0K3H+bx52Q9GOlGtrxDWx8Yw07rrcDmWIvyK?=
 =?us-ascii?Q?TcP9yRrGZHNHkTQfEDBs6Zrpgp+vyTKb9PxZZHDm7FRBcSm1KzazfE3ELh4S?=
 =?us-ascii?Q?djR5m2XKhpA0rFqk8gJ+Gt1d8EHA0GhSLza2/1FuuGhkYP5RZ7Rw5+htMNBZ?=
 =?us-ascii?Q?RrCDL1oVLv9RMPOlyuQQiBn8S0S9wxTm+mD3QtoZ1tHO+rl9dmIKPxDb9UdN?=
 =?us-ascii?Q?cdqyTf4QMNH7dXaFn+FSL2T6RNWek+OyuTTF/Q7pntxz5Dss/gHpP9XE1MK5?=
 =?us-ascii?Q?hvpE1vZAosZWD/3KwJT5uqtAmD6wVcii3Vy1hhfsrIQbMNekoLU8UGcGlagF?=
 =?us-ascii?Q?XBUMF+L3ALrw9yfZcpBfwey0PwkDjlrNGlG3dhjdfCAVYTNAxqH91z4WN5aD?=
 =?us-ascii?Q?nJ1R1aH48jWcrjJ05UxPxktyWG50gbN35UhW4dS4qXlZ3u93ta6AcZ6SpPw4?=
 =?us-ascii?Q?yxiceHw+6UFuNRpHLARy7UK/hZgvSEGp3gbbHf9Jot4kv5De+y8wU0+8ecym?=
 =?us-ascii?Q?YEZVkQeNIKOmxJ7vFO4miF0p5N4bpOeET/3Lp+a/HFEj6fuilzEeJ9iFH1jP?=
 =?us-ascii?Q?HzBL/5iMiDX76XFNYLA1RoJMPI4R+zpnoDrbJGWaOnhtNX9UxI7NgBvCRa4E?=
 =?us-ascii?Q?XgQpLfJuCK9nH0sJ0P0v5iKU65n6huR/tsIFy8evm4u8bt6zoifXu4VieyLN?=
 =?us-ascii?Q?FsQuWc6UfVlhpIA+LaAntNBXRFtIBVGBTJfg4HGjXKb0wX2DpxbNXhwQnM+z?=
 =?us-ascii?Q?V2CTmw8rkCXkmS67Wo448FD3En+lNREa6A5jjHCoFUfTAavnKMMLxGadxgr/?=
 =?us-ascii?Q?HikL1bNIQmxfAut5/1h3iia8VSUFEH/oRlQwCN2Xs7uugiXkzWC2ktE84FQK?=
 =?us-ascii?Q?hEs1dNY2Jk/G8tHhH/j4pAkpboGRhcNVPMQWt68IPnB1UQOgossHMIKglTW6?=
 =?us-ascii?Q?ahT0GFTDiUxtVzz4MfefBL9TzduZgigRwLe54oc5LAZVpJVBZ70Uu6tr8YfF?=
 =?us-ascii?Q?jfruPSP0ICDVD7Ri/YcM7AxHRlqtLrxoF4h4kzwuf6pUJm1YOWEAgpxdg2nC?=
 =?us-ascii?Q?zDx1W2phjSplPxVjBSkCZK9fXAvyHDxEHIXPlrcTbQwP00JQS+uxhlEfe8eP?=
 =?us-ascii?Q?0gvUOWiL5KLNA7gOUOBxL8GILq72rGDrVMCL83xtA60h6n/PZuc7zlOH+YUU?=
 =?us-ascii?Q?IthsgWLXj6KJM0/wEzlO5q5fOzpgEGByhJqrleImf23frEqmfyzSHGcz9SVs?=
 =?us-ascii?Q?oZu91FZIZnFFeiXcleri14d2jdTzq4OgH+TPaixRc+0BCTsT75m4tgjXjPWj?=
 =?us-ascii?Q?clX+SXXY9qw3yS5fyWZnjsFZ7HJQB1bFDSqebcvgU6PknTcfu0l6//LJb7N/?=
 =?us-ascii?Q?U8Um/98U4h5HxBvlVdRVCLXsS5uDfu2TJhSclMftHZfLkrSCF6N4eWOhvjLI?=
 =?us-ascii?Q?ruAM401NBbMwfuB6PdssDeEvw9UdGJhfk4fuKKJA0PD6nXnJAjtIPbh9v/DJ?=
 =?us-ascii?Q?3Eb1mMD+dnOlBTzxZjxqAVpfcfa9w1uJiTATqOK5nhYxvJBN6w4ygtEJ+1bz?=
 =?us-ascii?Q?yZlKHtgITif81N/ws/tv66i03QJj6ZTVghmxa1bY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe85fee9-2fdb-4268-c3f4-08dd2edb0a64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 05:20:46.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQJBxNeJB739kze69XBpc6QjK5i88b4oLD5f6zdxwSpsi1W1UZL8+F+PQzEl63qO2Tual2FPuF55GzjrLp3pnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_212052_878568_035EB10F 
X-CRM114-Status: GOOD (  10.77  )
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

From: Peng Fan <peng.fan@nxp.com>

scmi_requested_devices is organized in IDR based link lists, so only
need to search the link lists when there is a match protocol_id.

Back to search the next id with 'continue' to save cpu cycles, if
protocol_id does not match.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Follow Dan's suggestion

 drivers/firmware/arm_scmi/bus.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 157172a5f2b5..c26f470fc24f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -72,14 +72,11 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	 */
 	mutex_lock(&scmi_requested_devices_mtx);
 	idr_for_each_entry(&scmi_requested_devices, head, id) {
-		if (!phead) {
-			/* A list found registered in the IDR is never empty */
-			rdev = list_first_entry(head, struct scmi_requested_dev,
-						node);
-			if (rdev->id_table->protocol_id ==
-			    id_table->protocol_id)
-				phead = head;
-		}
+		/* A list found registered in the IDR is never empty */
+		rdev = list_first_entry(head, struct scmi_requested_dev, node);
+		if (rdev->id_table->protocol_id != id_table->protocol_id)
+			continue;
+
 		list_for_each_entry(rdev, head, node) {
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
 				pr_err("Ignoring duplicate request [%d] %s\n",
@@ -89,6 +86,8 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 				goto out;
 			}
 		}
+		phead = head;
+		break;
 	}
 
 	/*
-- 
2.37.1


