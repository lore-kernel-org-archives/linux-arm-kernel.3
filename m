Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD80CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 03:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nJMwf5lAOGoS9RXayozvp0480cGIqKJvu67ipdgEP2g=; b=ZzfmBgUme30Fwlik10n0XkcbyV
	ep+U3dMSNYe04LgnVycDLRwejrHo2SvMiJBBQVgjVMb80RCv6N0shpCLNvyQU6sfMDzwDoWGwDVYA
	LLTXYxrAVTBd1RTcdEQrQSJplUmZq4O3WaDi5FB38g3aC6Ub49ksTsdYGZV4ebSNd6UN03myj6c+J
	bcNZlu/8U06KiWr7D0u1xC2eN9YVD+kkniRMe/BawS6LhIYkTBYUne0ovoqSsjMh44wlmPBC5tT3B
	a1hSpOmqac4bEP4VhJA3RvxwaRjMEfaQW6eii9Vxc6TZAmUOubkGcLK+hdhDvZfWBz1b1XUdmB7hO
	HwEPdYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKp5v-00000002b6Q-1x9x;
	Thu, 07 May 2026 03:08:11 +0000
Received: from mail-southcentralusazolkn19012070.outbound.protection.outlook.com ([52.103.14.70] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKp5u-00000002b5s-2LtD;
	Thu, 07 May 2026 03:08:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X96bA1SboiMbuz4cV7UCV9RWWvjlCjo/Skrg9TkkZz12wM6sWZyoJew99ASxPDcfjYU/o5bTLWaIm0F+f/yi+qZHPbbhgDJnU0VnbVTEm3MGtv5ykypU6XmFoKvlvHMeO12Tz80pBBDSAlXIRj5s+smAogqh+48beXCORJk1AUvzYYQRGBo2qVUIiCNjFy3bexPboTCUXvATpjDQCsALIgbfEIb5lDp9oid25m3M7s9SSgi52YWpYP21SDDWTlBNk9aRDkhDg7WJtYsojQRbdnlRp7x+E49YjFuVkWuriXMfFiG6MiNsNp+aOFuvwG6SsCM2ylkQQxv400CLDPMiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJMwf5lAOGoS9RXayozvp0480cGIqKJvu67ipdgEP2g=;
 b=PDYyg9rtVFQYKM5b0flNLi+WfzyMRBczvYg3qMw+jQr74zBYp8Ca305DBn4Bw9eTtmBp2nXYaXlNDw44v+SaqTYmmXnoTWaBV8CBDSr2+wG/aLVVBE383GeaExGQPuQ9qcwa0dfJUS6mi5wh+rV4+MEM32I6VW9xhdOWG4k3iCr7tE6pHtJ9mDMP0I/HnflKMEXs/lJq3SQj4QgeflNApgczpKZ4JXtQG1055eIFZMTlr9f8wgst5ccRkiTY7PxWOf7x7ZndYMtSMeDLV4QZQ3tbOBRrfQNt7wWqPrXWXg60s7sMOpLfNpNLJmtQ1JVORS1GBn21bCaUstD74BDSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJMwf5lAOGoS9RXayozvp0480cGIqKJvu67ipdgEP2g=;
 b=Iiu3ewY11mVUdfsFRpbD/m7opABr1V4N31ri7+BVE1O8XFJjJnSBRPXbvSF5fEBFrHxF/bz1HcEDElHwrhCGw3GPhCK5LyAiJZIl/WFIIIfQjzz5X7J1RDNDS5kGEFefdFctfIBV6bFryj7OsIWDyhPQLOPKZseR5WqeXvhBPk33WyA+bqAo8f1DVIL7X3BZsFR3LjZGbafb/uwBUre2RQK5W6QuEgiE4Z2AA7gQro3L2MY5Mmq8dNa0xbrQTq7OaU/J1Vu4ymV6T+Co75J+Z8NhlG1cSVOJJbuvV4/B1m2mzM+nPDy27yrmuVjb3w93ZdbiLXJclR8kQ1xabovd3Q==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB8235.namprd19.prod.outlook.com (2603:10b6:510:2f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 03:08:03 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 03:08:03 +0000
From: Liu Changjie <liucj1228@outlook.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Changjie <liucj1228@outlook.com>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
Date: Thu,  7 May 2026 11:07:52 +0800
Message-ID: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <20260507030753.24079-1-liucj1228@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f96ec43-9acd-4b55-d35a-08deabe5da12
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|37011999003|39105399006|24021099003|22141099003|8060799015|5062599005|5072599009|23021999003|15080799012|19110799012|40105399003|440099028|3412199025|3430499032|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/pdxEak0pilWKBHtjD0rCUBDyJY4zh27wsWUGSUk0qi+JU7JA9jOEJ9gYLTU?=
 =?us-ascii?Q?niuv7IUXd1bHj5SdFOmcOhzLcrdSWxRpIedhTp92grsecto6YWB+zyRfPbMy?=
 =?us-ascii?Q?UzSycLYvit5Wc94jRGhlRnL1FpfIhtydEFSch7vy+2uRddRii2/zWr4xVl1Z?=
 =?us-ascii?Q?Wu2d0uvHwLw1AMNruH3Vk7Ays8RdqJTQ679WTbmk2+7eT5ZqpN/vHON+hSCh?=
 =?us-ascii?Q?RqESISi5wN6uYSOl3//fw3DNIK7ptc5JtEweUX7NAl8ul+oo6O8lIs3FqKld?=
 =?us-ascii?Q?YQY0NmdQ8hakMKsZI0CtRrJXEA/woVcOeDdlkXM1VEgaK4Y65gFE9ms7uvNJ?=
 =?us-ascii?Q?8/VD/UTcrF4VkoDGXej2FVqkDRNsidLMjsR39TTJoX84fuNPS08s4HRCBlA2?=
 =?us-ascii?Q?o/QOgFuvaNJ1IE7QilpDktW5W/au8ZNI+OJDW6fhYA7PpXeqDSQwmXZBNNus?=
 =?us-ascii?Q?XgfBrid3S3opJ7yVmqpic0qherzIH6HBGofzGMcJK6lrmbhMbO4x6Pq5qyt7?=
 =?us-ascii?Q?zvk10X6HcwC4mtWh2r7p7Vl007JAjrwTeSdLtTYu/YOwGQJiYZvz85bhfiHA?=
 =?us-ascii?Q?zpAXpl4uDRV/PnnMbKR4+zy71tIfMNb19hkpBsolOKEZ7CjciMv8oUjcYheb?=
 =?us-ascii?Q?mHMWca5NBcMMEZErI7+xi+7cBGePkJDL6s6zjIhXQQgnxIdogRcqbQ592k8d?=
 =?us-ascii?Q?cBA+7U6oaJVykaNHAq6ddVLca/bPy9kzhqCA/vBXh8h4eUlMUVIZFrSKHvxW?=
 =?us-ascii?Q?pfmVlT+thSJY7H8jD+0aYOmwTOD+yB2BNzuPDEWh5qOaU3y+MWOu8D/P2Zio?=
 =?us-ascii?Q?4XqXhU2BuogDvy1ZCSgxFvGfmVluI1DpIGZ/9/ApGsLou6IpMd0sDcUwyvkh?=
 =?us-ascii?Q?oz0npC0BCujSFiPjoAuk0gMOtEjdkOSjL5NM/RSKoOJ/buBUbQJZ5Er9cHDY?=
 =?us-ascii?Q?4xdh/nrs/8jRQQE3/9T2KIsgq/VDBl8oDro6sA+9Ml6R4mr+toyqZqZICjEj?=
 =?us-ascii?Q?ezjgLRvcDMJAdBQ0wDM0rYC4IT+QML8Ri6t1Nenf4VmVJUliL+yxJA6tvQNe?=
 =?us-ascii?Q?whE55Wfw?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6nIUSVZDhrqAAoOuReH21VJPNMpIOGfq8V/Omc6eqAhuDiGWw/E2/vJT3GNe?=
 =?us-ascii?Q?KlUyLwVgUwgtYb9FJJAZ3P/pG4CDRJkOmq+zOLh84VJdaP0mzrUihs7UAila?=
 =?us-ascii?Q?/+RKyiv+ZC60OJecYHvmDGEpjEOFqiGv+uFBFBXTGiFtYbqY5ll9Ta7o2rOO?=
 =?us-ascii?Q?I41kzWH23dXqQ9LqIUxV/U1HGAycLbZdtQAJXrpIrQFG0OSUTm5GDVBK7046?=
 =?us-ascii?Q?svLyATNRFaLQzeK8+EgTHX640DtZo6ZKm6owS2j+CnNmSnG4IqJmeffBYodu?=
 =?us-ascii?Q?FM/AE8BQ3SAg9cPFwOFIIutinIHel5xa8ktWanduMvtuyhmzkBA84V1vgPOD?=
 =?us-ascii?Q?0x8sGdYrxsGQ7wdypTx2yCu/ZEQcFubewMiW65/Npt/PmJcvw+e8xf+7+0iv?=
 =?us-ascii?Q?/bf00IKG6Il3Mgi9vEY1FkH/kIjMIh01wSI3apJuIzNdQv7j7QdX25+qi8Lx?=
 =?us-ascii?Q?R/1CT2l10wrsH6QcWiFq0Kd+8JkCNZ3mHW3Toav6rnBvFTo2QXWDH9LS4r+c?=
 =?us-ascii?Q?on0R0T9bxgCetKYX3blVU7h144IfYGglHGvZv6xlWtlpYuEuoipntMwGNdQz?=
 =?us-ascii?Q?+orQ5W6Ng8ihhkRnpmQ36IJsqPVEozhEiVXQy2IWmiKLJKSeVACCMX1iXV2U?=
 =?us-ascii?Q?TTlYvW+YEgRdz8qpYexrvPYr+McXf+E111rkC+OXFzQHIALANNTjU3h4qZgk?=
 =?us-ascii?Q?IcarrjZURdCYrVKPQXI3Qb89TZW/fbFjyOFF23e5QQ6kUHMQeI5g+g6bbCFF?=
 =?us-ascii?Q?6vYlZUcQQn1vGaCSA0evQuE4sPjDu5OqQenGh4sI2YA+I3BrREthR8uqHeis?=
 =?us-ascii?Q?l3yYi9lsG2haIkD0PAf/K0RD5QgweuQV8eOeqejXs5P54EUW59CnqCqNwyc3?=
 =?us-ascii?Q?2RJW6SDfEteF30cbgoXtvB7CJHR0myu1HgwgJ8F2buA18KfrHZaXWFwVo3At?=
 =?us-ascii?Q?v80piLWQ5LLW6d7CCFec6AX3Pi9AVNzu/6Bx311c2UvxjO4QRFwaJ/OmYEK4?=
 =?us-ascii?Q?N79CsP2Mxa0RmUR0ukfdYQGfDfk+1aXByhBzg7DdpoxXWgT9kC02P8+23L4d?=
 =?us-ascii?Q?G4urt8J3eebchcbLRnJ4+0n73hZL1m0SoV4P7U6o5aD+CYmYF17w7XuPEBC8?=
 =?us-ascii?Q?FzdFOeWiHPLo74lvMLwkP4MQ+qiw7/nkrLXEOFWof7O2OczLLhdaVRh1mS3p?=
 =?us-ascii?Q?DqaYiQNdHTsmf5A0cZFioBTFTkMHBBHxArOnpEMpHkXXAFOIT8x6rydjJprf?=
 =?us-ascii?Q?C0+Wv29MXBtqltMefdnPGgEoCWtNwLnXmBK3FfdhVhzXOGnV+AtbmYo7pQsX?=
 =?us-ascii?Q?Yc90QTNcmKLakAqWiACbS8lImWdRXZybufoLqqe2bRlKyZmH6g0eCHw6Cd9G?=
 =?us-ascii?Q?arzB+0kkxEiRCeJaCTL1W0IrLw++?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f96ec43-9acd-4b55-d35a-08deabe5da12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:08:03.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_200810_607838_8AA9C79A 
X-CRM114-Status: UNSURE (   7.56  )
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

Add the compatible string for LCKFB Taishan Pi 3M, a board based on
the Rockchip RK3576 SoC.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..322bcc726a26 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -779,6 +779,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LCKFB Taishan Pi 3M RK3576
+        items:
+          - const: lckfb,tspi-3m-rk3576
+          - const: rockchip,rk3576
+
       - description: LinkEase EasePi R1
         items:
           - const: linkease,easepi-r1

base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
-- 
2.47.3


