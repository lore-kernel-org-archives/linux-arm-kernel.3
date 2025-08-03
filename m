Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9017FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8becethY+pQDU0jTwKSw55ocXAZlaNFBl5hko9vAq58=; b=TxPKGLgvoEv2SAUlm2zNOgzJvX
	1gpx3QsB5FAdLHxwI4nejk1asdwrXLW35ADQzMKGyazn7Z2PkmEwlu4ucKC+/CC36BHxGKETErAXX
	CSL1FDgbIW3pdNLIiKW1YtTm1TdIjqGNop38zZMOByiQKEDbVgaHxQzKJc1owkCoMbbcwoB97McdX
	gSSCSw9quJShYU80ht4VttfLixEbuUIUUqHZ8uhfR6ADb2fyLBCmEf/1ySKFZVPnJrkXhLU+pQ03G
	RR4Ya1N3bru/dCh2A1BAJbb1TLNqrftrpD2URsn7fKaUHgZbE/EyLOg/q0UGgMmtYAh8timS1EkOk
	cbYBZglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiagf-00000008phD-1keY;
	Sun, 03 Aug 2025 15:31:49 +0000
Received: from mail-germanywestcentralazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c20c::1] helo=FR6P281CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiaVd-00000008odo-37r3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 15:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE1ykt0k3CcXUxcYD/kbvTsmUvQl4Rtao2ie3aUNeLe+GnBWhe/akopex686CFfOwNtophjgGubBYnZe7GE/YY3dP8oufOGiPiqaOssj1Pc1q35lI4mNu8Zr2y7MyjJ9MR7XhhPVb5rD9RNxyPGvJ0YB9asYwLwKAZ/zpNNRdyQpBLnQDWV5i1Nf8PDp8itAb4ZlUnIKPPUjCWX8f6WIKWJ+kzZydv49NjmZBylS4Mz5vhxeW1BlmJjITsZNwaurGMVJlBW/k2OJYmk0ZksYpX3wL5nHj/VAgoi4cPOkWFR8ROn8smsC2bsl5OyMKK8kVwwIN7CuUzaE8CwDELTUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8becethY+pQDU0jTwKSw55ocXAZlaNFBl5hko9vAq58=;
 b=hrEdQIMdnCsy8LFou5315T65DFx64eyWQaHqjk0D9a8TZvHpVGhFYiA0RC3MfrzLAv+zQ9UgAkNBG+e+8zAAQBSZIxDkJ76CsHRrVOKcX579Lw87mZIotmXSK3VH0k6h8S0/GA86zTPtB4jksQYXNBFm/s7Fs0HIIryEFkgAWB8BglZ+ShZJ2CN60qPrQ5hOUYj6BkqbJoIXZ/AHuy6MDD5DvtGxdspD88mtAa5kXOMiq81hjfMTZy76okkrATuSx4QGOZ1vnspvBqMMV8lGujHl7pYoPl14/IHBIKGraZG5ahpb/xJyIEPVCLAlZWIuaUD4v3k6Cp7F/Umox1WAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by FRYP281MB1898.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:45::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 15:20:23 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::32fc:c799:7f09:62b5]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::32fc:c799:7f09:62b5%7]) with mapi id 15.20.8989.017; Sun, 3 Aug 2025
 15:20:23 +0000
From: Tan Siewert <tan@siewert.io>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Tan Siewert <tan@siewert.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: aspeed: x570d4u: convert NVMEM content to layout syntax
Date: Sun,  3 Aug 2025 17:19:40 +0200
Message-ID: <20250803151949.68618-4-tan@siewert.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250803151822.68080-1-tan@siewert.io>
References: <20250803151822.68080-1-tan@siewert.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0292.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::8) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|FRYP281MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: b02355f3-e229-43c3-0b73-08ddd2a1447f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|52116014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9+ARy6pHGR6GZ30V5BrBrRmTpfik0obTYFICibIK1bwYJz1d4bpRYECLa4l2?=
 =?us-ascii?Q?DVROtrK59N3bvKq41qLZMWJPvNF8eMZ2TeBGWB+86uYJO0d8q6W5RSfYnGVs?=
 =?us-ascii?Q?+aWmByMti+ixPS48U5srmhSOYyDHooPsP70rY/5VP7ZUpsKGmcaMYYW5QCmw?=
 =?us-ascii?Q?85urFa0psRrDJnmFhwVx7PH+vWix0Vv20EMYWjQ238ZHk/E3Abtxg+0IA8pm?=
 =?us-ascii?Q?yZAQ7MhTYNH53drM/ytzRS0iXWmMuBQ+IES1m+6TKWY2mlP1kGvzKuvuzK6I?=
 =?us-ascii?Q?UEwhxUUawden7lSgA8Qz+FJWSy7FeVZv/GMtpLijnvW8YJA+7QxANMqkNwY+?=
 =?us-ascii?Q?ZKu4/k32Ju5nGUT9FJlhssmwHBeILa7vHWe2LsyU5o9N0yXfEhiSBp83WgHV?=
 =?us-ascii?Q?Bhg5g/+K8TWTeAjV5Vm7Rzwwp0xQ2Rker747HMXHjviBVZuGi5ImLWiDFQHM?=
 =?us-ascii?Q?HxhTqrOfvWpG3QWN3D1Dfdd7iZUW0l1+b0bt2A8/Dqzek36aZlIWWDhN5vYO?=
 =?us-ascii?Q?+oWOk4CJeNlM2JS/5hdYl6NEzy9vg7W7ancuzvu2c2duUdZgKyspkNUZbwai?=
 =?us-ascii?Q?7M8u6xex0xovSp7QxZ6POj/8MyOY/WhtI5qwRaLw2qYcDZ3l+LDryxWBdxaN?=
 =?us-ascii?Q?bCg4Sv0giXRTR6KFKV6MbM6D53fk6wozmP6ANrpIAJhnndDI+ADRQCoYBRpM?=
 =?us-ascii?Q?oyh5v169PHeMZnmLuCkqa443XFfkjcfKMyOv9ZfcFEvb9EqdOo22z4W7ZImZ?=
 =?us-ascii?Q?CN205KWxXFdWQPScba6Q4kITXPMJ8jWfGguCKr+rvSBFgB5KTlw+Kzvqye9D?=
 =?us-ascii?Q?yVP8Jfpv+KmN7ikhleEF//xNp4LM6vZxqeEeKEN4u89KoKTHDwpY1EmvB6Bt?=
 =?us-ascii?Q?3xX6dJ58AJVhEN8RkqbzWQAsoALqOgcoQz81mAoPQb5u1NwJUV6/G77Pzlqu?=
 =?us-ascii?Q?QrkMDnV8beN9aysKoo39YwVWShh2ue7HD3a/MZ2cK09BrQ3TgQdDnYNpyJGB?=
 =?us-ascii?Q?KbH4H6RyTlikQIeYrX7Ag3WcJt+DaoRZ/O150yVFKImBz0aEg4QxWQ4lh0lF?=
 =?us-ascii?Q?fZswBonMwKB99l6ntO1ujykRy2WyyzaVAW9IjhyE1iLv2lrHbOAnd0EdaLNu?=
 =?us-ascii?Q?u/yp8KivkyT8pmlGrbzYl62Ne5N7PjcSgLNAQGpTUbahDdFZukJfhkYfHHyA?=
 =?us-ascii?Q?zx1Z72RitjeZ4n7pJdb137dto7EXqvKqUbAHmzQnafZKa/KaHDxnes0EBGBv?=
 =?us-ascii?Q?JL5/5qvbf4tKP0aKtFEmlF4l/Qn/3lHkF50ePgpCPmvHNKHhA99W9By8eYP5?=
 =?us-ascii?Q?hqMYCP5kADOW1cblpniebcolKj4ZyNz/lOzb/AAvUFPg2n6M//1H9Ku9a1tJ?=
 =?us-ascii?Q?n+0w76SSFOlLpFc0yz57cihMM86I19Sb5T0beBCWyT0o3CZmt7wj2wM+PMlj?=
 =?us-ascii?Q?P8we+fn0w+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(52116014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JpO0DiuzZW7Fpyo/lybG/IzNpK9UX6PneVNq91Z1cwixzAio66ngFzaRsJqU?=
 =?us-ascii?Q?rGYmbAfWZTALTkDq2nb5fYxmB+e+I44JJlTHfr25ctNjwHazwl8LXI+RVbq6?=
 =?us-ascii?Q?XNkj2wiDP3FgJqW3k7qV46FNItkdwPXSISVF9aViEHw20Ot74mEPWvIElTzs?=
 =?us-ascii?Q?ZjXqOdicN/FadjmvkaQYLRM38YKlf0FSvQihF/nsRvxy9zpj/wKQR9Inzk9D?=
 =?us-ascii?Q?o8+Nas7X5DJbZOhmsvAbll0f/vSopxY6yU4YHrQwcKkb9cS/aW7IIy00wej3?=
 =?us-ascii?Q?m8sq2fYCB6Ofeqa9U6ICsJUiOL6nAt/Mj9N49fXGuVPl44EVaAqVC+00rx/k?=
 =?us-ascii?Q?6sIa8MydzzZqKRFUvisC9guSZbBMMvWFJkwgtleMWi5c3u0MnE4NcqSqUWSy?=
 =?us-ascii?Q?kOpKgDb0nczCa4eO5J5NSthSs7humRGp2hJagTn9UhtnaF/shP5ouRER6i/Z?=
 =?us-ascii?Q?YtyHj7gePEp4pkgtgDgmEdHGZ94o4JU1Z1yB/Pp8MWXk7QXi7AhyAkntUtD5?=
 =?us-ascii?Q?UnznJfW59P4Vw0Sb1uHMRjWkNo77uAztNKsUptGaAQCwSmj6fx2ayTwYYI9z?=
 =?us-ascii?Q?lughQ9w5af2aqfbtg8jkBtbKK6p34d/wd52hqCIbyBdzWe76IhgSXJ78N7Ik?=
 =?us-ascii?Q?G5tgYfwQrKkGXEiYuZvcSdTphUztGZMvNQtfIvi4MZXNYSSFvTIb+tg1PFjN?=
 =?us-ascii?Q?HXCnO15deSDNAiyqubdLdW2FZrrIwqArZH/hzypgUvxqj+ts7KTYNekj+2+k?=
 =?us-ascii?Q?VWQ5lf5O3MAo8Dc1N7W5jutV4aWD8SeWYL7DYYUVam8gOXnJAHHThyEKwNe/?=
 =?us-ascii?Q?cXOh03LTOEOFzGff3ltPhfKB4pja4ZLSpyPvUEAQRMHLEtpCeGSo28SqbXtH?=
 =?us-ascii?Q?fJzuqb2xv+7/gBR72++rc4QxNZJVLENIo+BrJbC69QpNDcGCsDWYFwL1TGH1?=
 =?us-ascii?Q?KFOo2ft5rGtA3ETseXhoY7m1UF76dQVo2kDOu48HOc3Jqjy/E0s3GeT5QIM5?=
 =?us-ascii?Q?HeT+x3CuFGssggCaddlK0tdciNH9iWEbRKM980KBpJKkjfPzhTq/4XgZ6T/2?=
 =?us-ascii?Q?Axh2kvZ4VMWN+aBY/THlsKQomTD/nDKGIRJ8aPW4hQxYQxEzCMk1IrKVvy11?=
 =?us-ascii?Q?Ls+6W0J2vwpvrfuLXD9jXAw7ZGMFoYpzvpUTwPqHzibcileSa8i9Zgfmmw2+?=
 =?us-ascii?Q?iNDEWNH1XsTNQbazP860uEh0WJMesD8Lrhl5o0ZmkmhQ/JRgV8AqshIqQE2T?=
 =?us-ascii?Q?IKXM95jguD+kdKx80rWcRVL56K5HnLQCMwqOukyGAI1+TD/oPx/E46aj38a3?=
 =?us-ascii?Q?FuWK0OYVOFGiAq1TWOKTeY+4Vbp2KZar7icgt+jchwpOfJsJXPcWhIoHbBMe?=
 =?us-ascii?Q?A9BFohYYiFp+s3YZSA2eQld4KjSBvlJ1hp+/vNXD8Jw+dbHkaelE5rg/peEV?=
 =?us-ascii?Q?hn2gHyBG7n3/VcE8TGllMjtdxOE2oZKAvjeh+cCTGern6dwyy2zfJBibRSHX?=
 =?us-ascii?Q?5JCpN4uwFX3Y3ZwMvCdhrbENj8Nb3gyQx3dfzgoXTwZlnV0eey6xShcXyTxN?=
 =?us-ascii?Q?iJqiYnNLOQRVNh3m8IjKuRUvXhg0V0tnP80vfrkF4Buwdrb0U3xj07BmSNXC?=
 =?us-ascii?Q?ySKrgGvpJ+BNW6xjAuKu7NI=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b02355f3-e229-43c3-0b73-08ddd2a1447f
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 15:20:23.8388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/XJmkJ0TQtHAD5j2CB2XWHjEYuEfI13oeNQpx9qbAAEaOF+GLMGYcM1H1ne81M7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB1898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_082025_783102_5A48EE16 
X-CRM114-Status: UNSURE (   9.51  )
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

The used bindings syntax has been deprecated and doesn't work properly
anymore.

Use the newer (and non-deprecated) fixed-layout approach. See commit
bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
details.

Signed-off-by: Tan Siewert <tan@siewert.io>
---
 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts   | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index 0943e0bf1305..e61a6cb43438 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -232,15 +232,19 @@ eeprom@57 {
 		compatible = "st,24c128", "atmel,24c128";
 		reg = <0x57>;
 		pagesize = <16>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
-		eth0_macaddress: macaddress@3f80 {
-			reg = <0x3f80 6>;
-		};
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
 
-		eth1_macaddress: macaddress@3f88 {
-			reg = <0x3f88 6>;
+			eth1_macaddress: macaddress@3f88 {
+				reg = <0x3f88 6>;
+			};
 		};
 	};
 };
-- 
2.43.0


