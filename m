Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D50DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuEPDDknz5zorBmpK0Wq1gjwEpBsu5EMQApjVHV87Vw=; b=kdllw10Di4P4Z2b3rGeAacYqn6
	iF1sWvkwF86WOxf2hX6a8ppuztKMtaQze9A8QXpucNBiXjw1SI5+ACLum9QdkW0tDPpB4nQh43p2l
	jOpPixHrA1r5nT3KCaz85bIcagJjYUiBM/zbAuzCYiUwTgtWBtCLDKzLLeTCwYvCWisbWJF0uOJyr
	CO5iHOBU9UY0TinJPVhtCVp2Rt2zNypLExEtNuxgotQerZxtWZVZTQ+I+oFfXOOZFQRp79742gMXs
	jOyMuUpEiVspW3yz87wPqGAe5KS7jdhMhQTbVUtHLEHC8aCAq0WIOpsQ3F6fWRMNEUA62MLPn8v0S
	STjfltQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhtu-00000006bwX-0NbU;
	Tue, 01 Jul 2025 20:48:22 +0000
Received: from mail-dm6nam10on20717.outbound.protection.outlook.com ([2a01:111:f403:2413::717] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWha9-00000006ZgN-1t2E;
	Tue, 01 Jul 2025 20:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rz0vFJE9Xcl+jkYXe6Q/DlAkRRwJIElsUxHnT+dAwatb99zwTJQwrrE/e7nHKtNYWmStg4CNlDYQG+PiWFPfXo/T0VbfjobsZQYmHUxixoVL1/qg0v1jlLl6AB/ARfB40hduVFzODO7SS+0yHQqtvjMDValgJgt+T7o4iq+thkdmBFldXOtWx364bKX5Bz4J0XF8i7SU+Fm19xsh7QpSnDIYFatEQwouIqhD702f9KiHrbOMsixh3BR5NIWGM0SNqAAHG16A0C7lzx2qq99oIdv8ICr4iQc6wYzmr9gaASkHTEda70lFWWnV3uwMC3muhkwd7RhbkspLRC3NzCgJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuEPDDknz5zorBmpK0Wq1gjwEpBsu5EMQApjVHV87Vw=;
 b=NWsFKcZApvhp/wazfuEy/a5c92arBgP2APf2kyUqNQSg4T0xXoPcGQV1G/2EUXaWpVPtYXcZbwT+sfbcMCMqqX1/rsQ4InNWEAiD+Ddm0/9Mn3w4PB4PbST/hB3NL0U60DixIvJpADiqncG6xZmVkoSgy6mHgTVdhpCbuXJXTkDYsd1okXjENUSwkAKSSMQlHrZ92HYWW/0HYYAl315hPsKKDCRZaqwqR2DsAsh6oZOY8M5PgR0VA/QklpXNSNqm6VHaMNytOPKXdJw6VKI8fMnhrJSWDrzKD+7EefG+2GLQ+/jVNBpPL7ms7icW3U6+h6LlaRg5eh9hyMlyJY9vsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuEPDDknz5zorBmpK0Wq1gjwEpBsu5EMQApjVHV87Vw=;
 b=Gjs6FoIl+Yxf0qDkk+DMP2NyQ723vU/uJr1YKYCF3r55yRJ7ioT91P4aML2IlqJCwMIb3V+fyTaT72mq55BZ40GGw/WUydEBGP29qwj/uC/gOLMC29MdfbYPkwX2crIQcL3+1J9YnhfjNCpujMT16uVsS2x25cuYg1Kar1ExTwh93TCdTMxNHr0kx3wP31pJEuNQZSR1Gw0T6qpp3opK9Lt9zquPRAp+c2ubZ91wzm3qNGiEysolUIiHmWB4lqeHUazzxtneOXxqt2skp6vXPn4lLgFZX59XRk1T3wRY9JhKf/Y5t2wBaDGRjodSltAvI9W+i9zAFf6ZToYlLYwBLQ==
Received: from DM6PR14CA0060.namprd14.prod.outlook.com (2603:10b6:5:18f::37)
 by MN2PR18MB3656.namprd18.prod.outlook.com (2603:10b6:208:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 20:27:52 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::69) by DM6PR14CA0060.outlook.office365.com
 (2603:10b6:5:18f::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 20:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:51 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:29 -0700
Subject: [PATCH v4 05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-5-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=hshah@axiado.com;
 h=from:subject:message-id; bh=ezSeO5cfCe+Dt/bg3fjtSXTxawA6Gq+CrrOEaKrDr9U=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES9NN8owZnypYPmPHR2Vy3peo0qyXREi40yj
 /gLNeRDRxeJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvQAKCRDxWHMRoTLV
 +6D8C/9TFmfatk5n3RtaGqqTCp2gGwHw/gEQohpBKLKTrXy1RjqQoGp/No4yZIbZUfjpxJ01JJI
 yAqugmT2kXwUyrFTPMkhRGg5Ts7Y6+npbUlGSeIvtVKfa3Fetkxkbu7DnuuDuREeBWb/GaGsUWf
 ASEg9EP1NG6sdZepoIC1vH1g5/vOZWtzz/HH9PKB79W0opOGVfjxA+9wCoyPhaeqs7QvjpsRFDP
 zOW406Yhi364TTfdMLccomtLsPNGyuFZr4rWJKWYLX6L1isK+J55s2QN+zbGGVnE8r63HUVcflE
 M3dPpuCu+P4T77JNd5aa2UG1x4hkWD0w6/RbKXoLXIj4ajY7Pqvvz6ONEADVE2uWiVUeR4wL1Oa
 wtG8vxbyhMTUjjOEt9UGrgi3MuXcbOZZtSB6/K/tHwXo+wXV/zK11JtWU57v60plwEHMtSzjDkw
 R+2UNuAxoeupdP+POkLxP8EvmraaMyolYj3kuzKb00kee71/snwxmoH2Cy9ZieI/kBnKQ=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MN2PR18MB3656:EE_
X-MS-Office365-Filtering-Correlation-Id: d64c9614-5bf5-4d35-4bac-08ddb8ddc15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WERhOFE3QkdleGo5N09TdGpzVGJLYkM0RXoxTkZIV2lhd3dqNEhYVHJDYUZJ?=
 =?utf-8?B?WmwwcnZNcTBiVlBLeDBTQmt4VEtncHJKa1AzSTdmZlBUU1draklXaG0wK0RO?=
 =?utf-8?B?NFdIL2J1R3BSWkxrRm1qWE1ETTBUeEhDUWlwcmRTb0hYNkl2dmtlL3RwdDVn?=
 =?utf-8?B?NG16UVJlaWM3blJVZ3BEL1JkUEFwdHU3NHJWbmtqRnZWSUdjUFYwMnBKa3J0?=
 =?utf-8?B?NG1ocHVIVUdGcWdUYTc3cGo1d0t3amlXdlZCN0NuSkc1Q2xzdU1hTTBnakJm?=
 =?utf-8?B?RUpHa0VVSkZRVFdwSUJxZjF0TEh4aG9EWVZNb3l3eENBY2VXNWpRWWd3cTEr?=
 =?utf-8?B?U0NnM0VibkVuaTJZVmtNSTRUU2x1dFlZWXdWSWhIZnZ0WXJ5RndXVHFjWFFt?=
 =?utf-8?B?OURzVzFaNUh1QUR6RThVb2l4V0FSZk53bUhqbGFKT0p6bHVRb2FFckcya2JQ?=
 =?utf-8?B?cXh2ZWpHd3piNCs1cFNEeENCQzVFTFJkUUFXZmdxNm9xWE9CMWtITUNDWkNI?=
 =?utf-8?B?VkhkZVNsUjBjeWVIeVlIL1BXam1Xc3NieFFzWHd1ckNLWjA5TlhiTHNWWmg2?=
 =?utf-8?B?VVMwYzgxV3hHTVVER1NuZ3NDRVNINWxYWGJQRy9Ubm04MnJzTWd3TXhOaWdv?=
 =?utf-8?B?UHVRS01sekVMbTBPelpDYnNmWFRsbHREd0ZyL21UNzBTbTNzNGdOTEhKT1h1?=
 =?utf-8?B?eHJ0MzVXRDNScys0T1VlendzSTFublZmV0E3UlRJaUllRlAxMkNwSUsxVklI?=
 =?utf-8?B?cHh0MFd3b2Z6WTJUd293K2F3K21kQVcyQ05TNGkyM05uWklYQ2lwM0NBdjRE?=
 =?utf-8?B?VnIxOWZxKzAycklQaG4xdk1lT0JYQVVEQnQyVVIydytrczZIQlhzWGFMQTdw?=
 =?utf-8?B?VWtvMitQYjlCY1lqZllDOCtxeHlYRXFpOWt4OU9KYytvaW1IWHQrR1VzeFFC?=
 =?utf-8?B?R012UmFsc3NQeTRTK0ZpcHhpUlUxOHM1ak9jekx5Uk1LYk94bm56czVVZ0U5?=
 =?utf-8?B?RGYrR2pzOHFNR0x4Ujd2VURVaW8rMHNTUGRRbktUYTRHOTdDY3k1djFVSUk0?=
 =?utf-8?B?ZlplOVdCdnNSSnVLLzNWRGJMdlRwUmxBTmMvblVaN0p5U01NZSsvU1FNd05N?=
 =?utf-8?B?bDVhSHFPYmNqczBkSmNJT1dLMEtPaG10VzY0encvdjE4MW1DSkZwOGM3a2Nk?=
 =?utf-8?B?bUJKZFp5MS9oazF2OHdaSGF3WVVQUEdiNUpZTjFxSjNyZFNMbDFvT1lSd2pZ?=
 =?utf-8?B?WmVvUU1aV25VbGJjZ1psVllzbFF3Z2tOMHlGWE5SRDVXTyt0MFFQd3JLU0pT?=
 =?utf-8?B?SXpabWxjY2E1QkI4dXFPUk11MExLVFEvMFJ6cDE0TnRCUHcrR0YvVVVweHV0?=
 =?utf-8?B?T013Qi9FOXNaTmFaVHNoaENCWDdvME5qZnpDbmE2VHYvUGVLRlRlTDJpeXZF?=
 =?utf-8?B?QUhHR2JlVjIvNzBWWFJOTkJxL2Z1b01VV3FBVVZ0aVpxVHB2VlFja2ttWkxo?=
 =?utf-8?B?c0ZpTm9xZXNXK3dCZDBSd2Fjd3NveHBrWXVtUXY4YTZaK2N2N2lZWkNtSUtO?=
 =?utf-8?B?SURPNHh5cTJhWkdtdFMwalFuZVM2dzN3SStTTytpOEN5V200ZHM4bVN4S25u?=
 =?utf-8?B?ZU95OSs0dnlSV2hSTkFUTm9ENWs0Q2d2SmZBQW5WWmtRN2hkNnAxNXBTRmJ3?=
 =?utf-8?B?alhjOTdMRVFhamtFalBCdTN1aGY3cFBkR2ZpcTI0bWlMeHNtY0tnVjdKWVUy?=
 =?utf-8?B?ZlFvODdUbmVzbjIxSzdtTmdxK3VjWjFkd3c2WWgxV1J0NHdyaitpMDV6WmRl?=
 =?utf-8?B?YWFycFpwYjRGNjN5VGRFUkZlNy9reXpxbTN5NkNwbzJ3WERSMkVNaEtsTHVp?=
 =?utf-8?B?TDJsREtuZkZrU2gxeUp5L0hORjFFcjU5V2JtRGVrdVZuWFQwWjhyS3AwNHgx?=
 =?utf-8?B?SXE0SHd1NDRHMzF5YVhac2N1dXI5YkRaVFlTWjF3cTJ2YllrWXJ4bmV0T2Qx?=
 =?utf-8?B?eVU0QjhGc3lUQS9LajFZUGpvdHRIU2ZKNHZTZnB6YTVOQm96c1BIVnhrYU8y?=
 =?utf-8?B?T09HY0xjSEFpYmNyUkhOZTVmVmpkd3RHMFBJUT09?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:51.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64c9614-5bf5-4d35-4bac-08ddb8ddc15d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3656
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_132757_496558_FBC2652D 
X-CRM114-Status: UNSURE (   8.81  )
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

Add binding for AX3000 UART controller. So far, no changes known,
so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24c444e2d81e0156fb01a89207ee2a..4c8b4953c3f32ed46996accd0e1caf6e0d7cc251 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -20,6 +20,10 @@ properties:
         items:
           - const: xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
+      - description: UART controller for Axiado AX3000 SoC
+        items:
+          - const: axiado,ax3000-uart
+          - const: cdns,uart-r1p12
 
   reg:
     maxItems: 1

-- 
2.25.1


