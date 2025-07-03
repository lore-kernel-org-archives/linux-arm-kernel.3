Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA1FC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbWmFPbzW/RREtG5/tFMRdEM/ThRCWDGIye+S+DiJ/k=; b=XFIZ2u49DCqtIdnf5FauVOEWFu
	3+zcvp0oDLZKDpgtahoRDwXzip7DHqqXpS2tkWnDOUVY37GHvZmwzd48ub4bafu/vPZREQ7MPLTwT
	hSUjf9cX/hySqU9U22r8KGOighJACypTmAkWmQ1wW096LWadlWn7E7SuucJ1VaJhQloaEDZDyzrFv
	GhSGLB4ZKVq/HIyMLrCBK2rcsaLUZr49L2yGiAynqFaxix33CccM8uD6F+78K2Px6sn8sXsbqxhZO
	N/NjHMgsEbxrzYRdQDurQblIn4FIpv+FzsRUFrCqoY6f1sBq6RiZIpM3/im31ArbZ8oppatN8NwIC
	pG0ezGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRfe-0000000CddV-0C0c;
	Thu, 03 Jul 2025 21:40:42 +0000
Received: from mail-mw2nam10on20719.outbound.protection.outlook.com ([2a01:111:f403:2412::719] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOYW-0000000CDdh-0NAj;
	Thu, 03 Jul 2025 18:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkL3K0cLWjpbJxrMBuV7Sm2HnkC60BwF3RuI1oDasBlfJAYmNS6yL4nnBQHomflNiFSCpfJ9fuREeuR9o30/h8xz+D6XZNSf70Ul03x/LYZjHNJ4/qUl1TRbGBVfp/bOugwK0fJRUdundWg/c24hHU9d2ieBimZ3zHSlDfKmHTk0u7NrNsaJVUSMATsZKlfS9upIiPRVZqs+U+53wHHrUsjJQgV83gvrQBTQTosxGhqVhx/Cc0cj9/IRoEtIQEh806KTqkMNWmNmNBPC6zom//vnSBFmA2xLLRBX3mN1jcj7j1nvCe7c4OMLRdm9QWLkY3gQEb/SKIQIB50r5nWJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbWmFPbzW/RREtG5/tFMRdEM/ThRCWDGIye+S+DiJ/k=;
 b=Xw/5oVfWnK0O4yLHL6P8t++Em5x7osM2iR+V+BU0TCdyiGniwFQ7ljMtJUdYC7BryNv80NESZrmS8r43CEdh34j/yC2y1kkGnQCrZ6eEttxhfyJJSr2ljSJWUfvpGA5OkYZe6mQAOv4DhLH10Ag05aNj1tyvJyghckAHnGXYoq/qtQ5nxWY398gAReEAD6ArmEkiUTqWqP9SOGnVmO4fKBt5Z3c+oB5aYrnxaCGL0q6u/5p+v8UzGybbdPwZhbIITtcYnTZaX3zErjQLVCPMQDoorOQhqRX+cJxfRDCSLrDPbWTNzTImzID0scQ+4BWFSS2DAG+16EmdEXEMM72Wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbWmFPbzW/RREtG5/tFMRdEM/ThRCWDGIye+S+DiJ/k=;
 b=FTedGQyN30vRNqzFKYRCm1owGD4dLSyF9BNJ3pzu24SKb6P2JuENYWbrNoz7EONxSHS0XpAB9uFfqqOkplnWgfPDFADrXiY76elXc0pB7oO2iC2WxZekihstJkznU/UANpkhcSQDz5EZNzAe3MykIxRdxXpOE+EKeV79zcuhimQzGaDej86dDgp/KYNRofgklj2Mmg9QnIhBdZgYNcpPZLj36QR71VYvAKfPdBe8UQ5M1fzRkGNgNIZ4BnYx5exNRvglvuTiOYggcRaSv7Iy4DovPv7QZ7RoLxmfQUJBpcOlks5h4gQ8V/WyPtcOPW3xLt0Imwa10Ny+zagKajiYIw==
Received: from BL1PR13CA0326.namprd13.prod.outlook.com (2603:10b6:208:2c1::31)
 by DS4PPF7D4D8EFA4.namprd18.prod.outlook.com (2603:10b6:f:fc00::aa8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 3 Jul
 2025 18:21:03 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::6c) by BL1PR13CA0326.outlook.office365.com
 (2603:10b6:208:2c1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Thu,
 3 Jul 2025 18:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:21:01 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:47 -0700
Subject: [PATCH v6 05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-5-cebd810e7e26@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=hshah@axiado.com;
 h=from:subject:message-id; bh=kzZmv2wMXX58BO1MUMoZRrfL6cIGg7yDUK7Ad7owp+w=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn/zkCQGtEDpvmimem80uj3GDdEhKe+/4Fau
 9YBQ//fNOOJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/wAKCRDxWHMRoTLV
 +2JLC/9r52bVx5j8x/8oYZuVPP5/uMkKHeGe0Un8a9HFxXYzFUXCVeireMqhOLuakQMpGHWT8UE
 A9hk445Tkr0I5qaoTFNbrF/HUKVHLjrnDIrukuHJ3dGPQlPHJ8ojpeX3PUUZkk/Nk5k91vE1ybU
 x+5yn5CLiECWiufMssRu5V6ywyBb31eETohfAZAXqDSV5gRekMhN1/LTWGQhVCw5BrU9qA/tjK0
 /B/FzbqyDqKwKVvD0KniJPAq8Vh4yhdF8+VzOhYMbElKFFaufzFvLnOTEnp0I6MxEDSyGETKHkO
 Y4bfeO7lKNcyuUXF86O4d+u1XlllSwOlSdi2uA+VPDsv8srs4jseCJgc2M5Xto72uQgEU99uVVe
 Lwh3er5sOEqOeOA93A37q8w/BaDB9WUaGIY1tTLzXaxkBJ3m0k89CwBry4njRGPVQGz9Pkd3y9p
 MgtQcrzXcImmtzhKLXOKacRYXMgoz2O3jgwkkk2utogwfp1994VRCToMLYKvzznZt6h7k=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS4PPF7D4D8EFA4:EE_
X-MS-Office365-Filtering-Correlation-Id: 19812cbb-b60a-414e-227d-08ddba5e5e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2M3QTBIRi9oajFDMkhoS2xHSUdZa2FFdGREWUpIRFduWkhncVIxZURnMjZH?=
 =?utf-8?B?OG9MeUM5d1VrWXlqUmdrTlp3TEpkeGYrUFV2aENjUWE1YU11RXFJcGdHbjY0?=
 =?utf-8?B?RkJCTXAzTHVkdXd1YndVbEpxRGFGNktvMGpTaW90bVVDY1p1d3duL1RxSEIw?=
 =?utf-8?B?cThnMWdkSW42Yk5NQThGYmFKbXFOeE9rbXpIQWxvYlEzMWZDWmNTcWlvci9n?=
 =?utf-8?B?TnZyZ2t6V3JwMWdwcG92SnE0RENGcXh2b0N4V2FaVCtYaXBZaUp4eHorYld3?=
 =?utf-8?B?MVB0OUdBZUdZSmEyejN6VEJERUM0ajdlYSsvcXFzMVQ0M0ZOaHFEeHB5UGhC?=
 =?utf-8?B?RDhaNjNid2ZwSk5uQjl4cnlUZURCSXZLK0VQK01zNmdBdUV2VFdUaEVCeU94?=
 =?utf-8?B?Y0R3ekx5UUViNHRmVmJUNUJtNU5vaWRGeVVVSVVLMi9XSWx2eXhNMHFXNHBs?=
 =?utf-8?B?NzZhTDJIOG1Ua2dtZm1iS1FYUElvZUxyOU9YSUtUMG1wR3hUSFBtUFQyMWNS?=
 =?utf-8?B?UFFqRm5NWU1SNW1nYVUveXhRVjlFSVd4MmY2cVhRV3c3V1NheUZKNml5aTFy?=
 =?utf-8?B?ZW03UmVEaGtLZHFNQ3d0dnpFYjl1eXJtNVJ1ZGR3d3BvamhKUEx0VlJaNjBH?=
 =?utf-8?B?S3ZGUkN6YTdyelZwNjBoUGN1ZWJqTlEwYUg2RUFEeTI4Vi9KNnVTUVZGR0tS?=
 =?utf-8?B?R0RLNnEwTnQrNDlWK3QreGR6YTIvV3BCcWM4S2lJdDJuRERTWlM1YUxzZ0xZ?=
 =?utf-8?B?MVRBb0xWcXJBZ3JnS1cwN2xZdHNXNHNVRWk4bm1TTW90LzQ1MTB4a29Nck5X?=
 =?utf-8?B?TGFSeDRjd2FVQlBKNGNUbzVybEpsWDg5M25NakVCMmI4TDZ2OXhuMFFWMEoy?=
 =?utf-8?B?U1dLL0hsUFVpcjB5QXRPL3NPdFNUUWtONmd2Y1hKc1llY3VHSjRxbytNbnB6?=
 =?utf-8?B?R2poUUQ0bFJBQ2I2RStqN0R4MW9mVFAvMXBMNDdoMlVYMTJTTTNoS3hwWHMv?=
 =?utf-8?B?Yi9GeTczallmTCtaNU5aRDBXeVBCVjg5QWNtcDVaU1pyWFFXbk93MXd0ak84?=
 =?utf-8?B?WFltMEc4VDNZd3FFaFNMeVJ4RVk0OGxtV1h5V0RYUGNzVEJqdTUyV1JLbi9O?=
 =?utf-8?B?Q1lsUjErK2JqTmM1eHpFdGw0dDhSNTlTWUUyaGl0VUlzM2RyRnFKZFBGMCtB?=
 =?utf-8?B?ejJicWJpamo0Q1FxNGI3RGJ4RFV1ZXBZSXEyKzBaNklUUElEamt3VzVJMVZv?=
 =?utf-8?B?VWhLNkFQdjlJek9iTlBmdHVnWFV3bm51TVlqemtFOFM4YTZoK2hIdG5DSERV?=
 =?utf-8?B?SUQ0UFg4cUVPZzI2VjYrTmsyWXdOallydDV0WTkrSHlFdlZIUnRvcmRidm1Z?=
 =?utf-8?B?bWo0RzN3UjJmVzg0b3FvUDN5UzdodHdxV1pXKzNjNVdURkdtcmd0c1NneitC?=
 =?utf-8?B?blRmaE9pb2tVTEtCSEZRbjlYZ2JXYmQ3RDZ0cG82cnEzbERpTlNZQUthaGNr?=
 =?utf-8?B?Mjd3aWlpVEZwUjU5NjFRK2kxb1VDSUhBTGhuTmUyRUIvTDIyV1hqTUdIQTlr?=
 =?utf-8?B?RU1OV09jTFR5QTZqNUhTZjN1d0NxeW0zTGJEVUpWcjFERHFadkd3Y2E3Z0Ju?=
 =?utf-8?B?blF5bVFHVURZK0hjS2U0OWdYRjRIc3ppYlJIRGJqYlJpMDErYmNxRUo5NEpx?=
 =?utf-8?B?N2NzYkpHTGgxbDRhRVZDVGhIZ2V3aUpEVysxcU5SMnhZbFBrZGNaK3NqZUFG?=
 =?utf-8?B?NjJwcm5iVDVvMTdvZ3dmL2dpMWRISWlwZUQzenBUSUJDOWMwb1VsT3JwaFBo?=
 =?utf-8?B?K01abXk0eUhNVjF6VDdHL2pBcUIvdm84VzlONHZ1Wmd2Yzg4Y0QvRFJ4RGtS?=
 =?utf-8?B?WjZBaUl5Zm9IS3ErZnBLVklQcWJXT2ZFVHl4UWIwRHF2ekl3ancyRCsvUE9M?=
 =?utf-8?B?VHpKRks3UU9tQituQUJDR2JQVEJZZi9XRVBQYW1tSGtMSXZBNHBvQkxsZVRh?=
 =?utf-8?B?TUVJVGhlMHY4SUJlNFM3RmxBZWhCVTFpRXZmdTZTa0tzTk5wY3FDaHNGbkVM?=
 =?utf-8?B?WVFlTkFtZXZqVnArd3ZMbjZSQTBQNDByWW5CQT09?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:21:01.2354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19812cbb-b60a-414e-227d-08ddba5e5e74
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7D4D8EFA4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_112108_132590_0881269F 
X-CRM114-Status: UNSURE (   9.16  )
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
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index d7f047b0bf24c444e2d81e0156fb01a89207ee2a..9d3e5c1d8502272f8b08f7d59f18d5e6be25d891 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -16,9 +16,10 @@ properties:
         items:
           - const: xlnx,xuartps
           - const: cdns,uart-r1p8
-      - description: UART controller for Zynq Ultrascale+ MPSoC
-        items:
-          - const: xlnx,zynqmp-uart
+      - items:
+          - enum:
+              - axiado,ax3000-uart
+              - xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
 
   reg:

-- 
2.25.1


