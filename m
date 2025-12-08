Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CA6CEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=; b=JlQsoYySpW4plaDUJ46CFAUmbX
	NHrme+9egGcovSvoIldvotdJ7rMHaRun4Psn8ycKLrBUyoNvh1Aa1mcXf5+nDXBWkgFy6g6aEcH1x
	8OhEzBfStpJGpBkx68raIJGcX7/rNzj30P+KuA3ZtkOQFrZZxKBNXWQ6h6PnHqfy+ZMDvv/UvG4ye
	jClmJbMUjFxP8z2oeuAsoCdFPFu1KXDtdR1UzrUtI9JGEcu3X2jS3Svaq4ETqgXdeyKzHjyViEGZa
	6hv0vLSJjUazMI1TJEzZPRQhrdWsrnNURzSeY4PhkGlV/+d5ItOJZ4tE14c7L/mRvKgkT+2HtaotP
	XvK765VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUrk-0000000Chmq-3Ez5;
	Mon, 08 Dec 2025 06:37:00 +0000
Received: from mail-westeuropeazon11020094.outbound.protection.outlook.com ([52.101.69.94] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUrh-0000000Chiv-2yNr;
	Mon, 08 Dec 2025 06:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRtoh8+axz1Y6OYjFqRAQlgQHYqhC4DGE19O37dsMDR23kygSJ7T255z7mT5DQwkBkyL7RUxowyB7VZcnaVtPVuqsOuAggnFzDZmJnbQkiOtwvIPqNWXFlWrHBMklS9ossLXokbQ0Eya0/rAKiPDRYzXPm9JrBoakrBueb5OoAEzHWf2wtydC52abTOKEZ1CQzSdTkYUHv5qdlt38d1FIM7LbTKs5e9avJY7JNOjaa6+xRlF+PJE9LuYlkjRdT0QcGC0J7F9YYUAho3YBgkIzZPpWESEc/MGAVrWxwPhS1Q29aa2iHfkUUEIQQAt1S2WcIEzDT7vPGpo4wh1/Gf4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=T96GbfGKygcXqHRdN9j+isOPdWT0O3uZiwnoz/DxZiSzVEceDNLLuJnHzkCgGxUMMI27Tv5/zfE8fpeYGEpi/olBaCHXrcl8G+JCd9dBOUikt8RgzoN4Hci6SyAiqr4i1lIw4NJofqdbmGapQhF66v3budUr0ig2w+2M5OOE4mEZAxd7CN/9d3mRaHQKpZrgCWZDQ0Li4ptK0dvw7aKRoZ7R0EJKv0itYcnu5/OLuYIXxRY7iRzICpD0ZSijhYVk7cGuCxuuwUeqTDBAxHtCSx2QFYZQ/xxayAOZ+ibPGXE6845zYnjg19UvMM64j62EVZ4+escvnqUewV8IPaIdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=cafCFh/xb1NEUY565Bp96RSHSIrKRpREj2xPy37zGgSBGXBAFEgIVIfaKta3oRVySITZTI/83prGnp7Z0zo7B7k6OthS+RhidM2PKfEo0WSQt1I8A75dn/cDInh6W6f0/ydsJ802Y8mDEoAcVONZtODwJh6Qd56HNzN2ePGJOnG5jc0ss5TxMp+lSZC55yVt+01A0UgnqwkKQ2pIDcwGrihL69ELhjKOkQxNleChFHT/mIISKHRkw6t/mASr/RRvWSYSudq4TtptmLI5b3Nl4N4EpAizyGnzl+Uyyh3EmwGIVbhU9P4e7asjxFFiSIZdwsE4QW72XCSUQTEWSsRlEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM0PR08MB11704.eurprd08.prod.outlook.com (2603:10a6:20b:745::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:36:49 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:36:49 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v2 2/2] ARM: dts: airoha: en7523: add reset-controller support
Date: Mon,  8 Dec 2025 09:36:38 +0300
Message-ID: <20251208063638.3009460-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208063638.3009460-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251208063638.3009460-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM0PR08MB11704:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bdd8e2-6db0-4f13-c738-08de36242a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Npy/b/QSpaoiMD2m2tLSfxCTBuz/NyygAnoM4y8s1wRUKhciy7zctgSPuld+?=
 =?us-ascii?Q?eFNPk0402dY3i7y29m4E0TGFUiRO8k+YRGngx05InJ7FcKyWgUgnwjilJ8w2?=
 =?us-ascii?Q?fGn9dAyZ4apzr3pNg42Lw39C1QYeXN614+CZS81gWE+NjMUDHuzX4ZhE8iO6?=
 =?us-ascii?Q?LD5HAgRw5Q4U8DN8RT07uY5vgnBKKBm4TAWL17ixO04tdL9WUpgB4DFASJ3R?=
 =?us-ascii?Q?OR69oiKOM/93EgbXLiUzfHm3iToBGvEcqN+zA24w4NmolGND3dReEwDBxqVy?=
 =?us-ascii?Q?hWE7fPCXjOj/BCtRhbM9PCYt56EeoVdJgRV80TY2nBcf6G9K4rihquYbA4t/?=
 =?us-ascii?Q?9hPcy1qZGXZQqZ5AHAoSDUCyZiyoMMkvBWtGirelFr5kWbzGSPJel3yu25in?=
 =?us-ascii?Q?okF2028d+jebQMtLgb//bznupWaFMqemO1/BG3u2IJ01kmjSVZyN8bcYmSks?=
 =?us-ascii?Q?oimDuh1AOLz25KY1Ccubsr1w1QLDWx/Nzhc8SYbTPwDbGMYvQwPW2slv3I7E?=
 =?us-ascii?Q?Uh2sc1ns9okoZV2SRmoTZwsdNHVp/7qbVfFtBvz/EQL0n6lJS4nOtxrS1KsO?=
 =?us-ascii?Q?PGiIZutByngF+LF1RZD830/+DCbLRgQxIgtJHX81DnjQ/LQkY8tPB3w946kE?=
 =?us-ascii?Q?ERydSVr6eJvX7AEXRR00gxUlEVItFirKLOmaAs7HJm+2MXg1WIqQuJ03lj3d?=
 =?us-ascii?Q?YKkpz2+Eu3vbzMKkP/FIGzYuMsalyXNNwfYjJal3RlMneeobft9P7FUPXNPk?=
 =?us-ascii?Q?EqexroR6WJul3StO3QLhbdw82wzGsofwkaINd+NHGhy3FBRWJsKDESbxYlLm?=
 =?us-ascii?Q?QY45uZzthSuTTCzlwh51K+S/Nws9h3o+j7DJGvkrcptD7TUiPRpXIzQGJkH2?=
 =?us-ascii?Q?l6Z5Z1vmzU909HCymkAGdyT+gXa4NshN6DWDFkD4l9207Zz49hzsYjZwKD+V?=
 =?us-ascii?Q?Anqr5H5YJj9+Fk+a1+H5xs+CNNTJmWgTgZsu+IQ+E2+zG3j6H12BJW4slCgF?=
 =?us-ascii?Q?S5oTnOLIRD+kIfSMJMG22aVfaTKFrEzNfFBY+J90lMDiNmw+H0SiJns7NNG3?=
 =?us-ascii?Q?haCGTsXYBpEfze8zyQuXzh9loib5NqRfOIJnkwBX4Ich50DUn4dXR+pUkXpQ?=
 =?us-ascii?Q?2wGnU20mUylgDvrz6xsOESMLaGxtHofJR37SeF6EVuwLgx42kFmbKX8TyQJN?=
 =?us-ascii?Q?W0G1u60/m8IST4IgP/jC91psIrPjw08t1WcMHr7aGk4COKKGbWOFVOTYp8rg?=
 =?us-ascii?Q?U1SYbs6OkdGTNADdyaKbnLxWLdZIO0Za2z9BIL5nlwoP14/MxjEUNNU25IHy?=
 =?us-ascii?Q?4Q6wIzdInB4MXus5nvLow1BHHDLY5RWBYVLMm1t4Y7HzSy7XrCLDEXZlnAK4?=
 =?us-ascii?Q?I0Wz+aEc63RkcyBcgdHfdOO74iKj9iODWmzTltwE9JUg7+V01AEvbTqbmDyP?=
 =?us-ascii?Q?pHFnTAP4DiT8KsYen/mnXD760GkBZvwG5WgeAAC70ZiX2fnlfzEAoulyV0Uz?=
 =?us-ascii?Q?/BVyRwFh8KtCc9fASmCIAbg3vW5LksWwTuM8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxqmUTKR+ysMaG5Bjff6zhFsb2T9m83A7RcWFDRtuV5LtTiOS2YcnYw4nkMW?=
 =?us-ascii?Q?FkTvxhJQe6m7V/EXjnVnhNP9vi9sxQ032IzF+WLSOXcgM6QnS/jClC7NqsJU?=
 =?us-ascii?Q?QWTulMxs6auLwySdpAWLsQdB9yXj61Rk4FwrACNpdbnvAo/iVTM3whA+bpd6?=
 =?us-ascii?Q?pOOYljXzXzcL5Os8ndZm3kqz42WmL9z6kj2GGklG+Bt+z23w9S8LhfLa/VK5?=
 =?us-ascii?Q?yQ7aM17m0lUyYcI8bxQDhU7aEU+ulUvbGN+xICJJDFrNL7qfkfxWEHbzu4E0?=
 =?us-ascii?Q?Ru/Hi+D7vt0a3e4K0YI0qwZrT7DmoPDzAROSstVoBVOqj+KycoI9oNmH051D?=
 =?us-ascii?Q?J56blvm1+M+Ou1n3bywDXMtnPeKqZkwjp6yx8k9MkmIlWhLpAqYycq+rmdyR?=
 =?us-ascii?Q?eFYyC88tB3JUK9H4GdyWzQQbk0q1posBEgjS0Xzcd3IXif6YjMPEFU0tr/KC?=
 =?us-ascii?Q?riJaXTsCmWLes+WGt+B8sT/dT9ZrE9WTCCwIkpNpkSjR/1re3f9M1R4VbE8a?=
 =?us-ascii?Q?fOY2jiP76AWf0+8GE1qhEu2le6n6EcT0SVuQ9B7qTRIY331PG6EmcZeqIFOJ?=
 =?us-ascii?Q?tnO1QnMXFBZE9j2EpMKGTe7bcCoVImKIcn0/xKhfKJs/xXgZ/Ii0+XzU7qB9?=
 =?us-ascii?Q?56/mCZ+nFYLRnLof9mwYc5FekctmNOZPExUW6w7/tIc93LeCMcegliBhiJ+9?=
 =?us-ascii?Q?EBGKAQJOyuhOkgrE3xq9LZ15weAFqWgCLxA/OXG94ivIk0hxW5VgcBTsw3Z4?=
 =?us-ascii?Q?X1fUkhotvGqTYoPuZjgAgzSfqpecwaFGUT83IBYSxUaCqAE1gJv2OiZzSr/X?=
 =?us-ascii?Q?Sly+UelfYqlLhKyEgZ8+Rs6TNIIej8pPPDpMEHz/gFvGsCfpb1GgRQjlDD8T?=
 =?us-ascii?Q?ixTMFSpWCN0LD5GXRBUpoba732fC3CEXv9UXs1suKXQShKtPtK4zRFAKeKyn?=
 =?us-ascii?Q?QHuZF/jLtF+E4L9Ek9qH0fucLWiBtCdc4MZei2ha/6BnGSRknkkptXBinJ8L?=
 =?us-ascii?Q?H+pPFILwLwZA2d9Rl2ceNzyUPSpHEuSR9KeD4Ar6cG3E/D1F5tA1aghRyzZj?=
 =?us-ascii?Q?9l0/g5p2+GnpgFfgZNHowAHZw+rBT9KIrqM36etUeT2693Sjn35Bo+DX/m8G?=
 =?us-ascii?Q?rx6FpW7sBGchorNSne+qualZ/EqrMStdj7tf6j9XswXurC1zsf0sZrf7QAt5?=
 =?us-ascii?Q?qfSZ86yo12ICMoM6A9lEZ4tIYC2kmOaARRt8wCa6cO+eQ+9tQ/nfB+H4czPw?=
 =?us-ascii?Q?M7Zj/xLm7MqMnKTJt/qScsVbWflvBL1VS+xT8Db4TNR6wxKBp69vSFrobVSt?=
 =?us-ascii?Q?1LVVbl1PA6i1m1KFCxmZUkpZ60aSulxZgb+tfWwhqXIVerkGGLozEutpXvcy?=
 =?us-ascii?Q?D3Cxe4bKT0zYykdQuiVK0XhMqkWdiCdCTaSRs3/ek8qkp7NBCiSsou8/W/I0?=
 =?us-ascii?Q?jh+cvGxqSVtZjtxDtZOUpbp1TWUPgivj/g+WvLEHffo8A4O3B4OZIXWiBcde?=
 =?us-ascii?Q?iiUi79k/I3xVNAdLbvm0y1XGfTTndYWuqNngHXQVlNVXk4CQ4YmS0A3IQDu+?=
 =?us-ascii?Q?sQ5gF32s6CP0I3iVQ9K2F+snR7a5xKxZQdAH0Z4RLRhInfkgQInuHGhncnpN?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bdd8e2-6db0-4f13-c738-08de36242a6a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:36:49.3660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyhHT/dfZJOzzCREKak5mbJzIjWTKcLXDnVC1vTKxH8tCUZToDzv8YbeYMoLYGlxWrEqJI5b1SstQpFFh/TNRkyaS5Hu5aRtvRVx5Ew8w7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_223657_764765_C9116DC5 
X-CRM114-Status: UNSURE (   9.76  )
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

This patch updates EN7523 dtsi to reflect the reset-controller
support for EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index 31191b8d1430..115cc44093ab 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7523-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -91,6 +92,7 @@ scu: system-controller@1fa20000 {
 		reg = <0x1fa20000 0x400>,
 		      <0x1fb00000 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	gic: interrupt-controller@9000000 {
-- 
2.51.0


