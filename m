Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653D1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHCgKZkgOPJ10RDPa4U3v5hdIUQsPh1DQpu4yVAiOd8=; b=4vsYiL7TkTfDi/XgGQMhyppvj9
	nsVBWRQodZEBUan1qk4VTVi3usOHi11rhkl1+RTmRhKOl5XR68XWLpecs1wf9AtVZgoF3gP5TQRfa
	THewPO82kCTISWMgZCL6jN373TywlCu3hpAci9xXkUYAbWYxhs0z5DIA69zUlUQGjUQniado6Ulle
	c7pbK4dBEjSnNpSOrjaRfgvP6tDZtt9TE17JGi+rw8ESsWV2b6XIVHJ84w5heWm5terCxeKdTScGl
	8WwHAuM22ABmr+1xWbfYN4ZjG9xtW5MMtbdMG9IqfCYRj9mKfcVRh8GZx1HzbkAgHv8n2S4RVIpgA
	9olnjmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFb8l-00000001COV-3axW;
	Thu, 15 May 2025 16:08:59 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaxC-000000019lQ-1LTb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ji+hwI9JK6d69jSMy5H0T3aScu19RjgInoN49x1KL+1NsmmVmv13N3xBn7VOfrs/U9y9Hh8ZheNGo2SnUb2AtIt/DVgz0iG8FVpiUoSvngjerJtAyZhnT7TnuZpAAxDc3BPecp6Juq4looiA/vdJV3wvmq6mMFW2NYgGskXy6F8+dtiz/puqUhUIebBNv+s4SaUgyyu4Ap1LSrC0kmzVQhW000z7u1SUXDIJNGmAKViLQFSth3LCGyzLHsc7f8/tl28VI+gcO6RJd1KReSeXXqtSz5lRP00JHLD0MZp6UEF8bvPGEgGoQJCR7O7jcvL3WT06wXUHal6xI9WDiNFvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHCgKZkgOPJ10RDPa4U3v5hdIUQsPh1DQpu4yVAiOd8=;
 b=l2BgZCgT9BOLl9RcAcxnoSYx3YAahJGEHEKxrrqkggWR/OTYn0GW73bxpBr9uR+cJjI45J+v8cxPAeCmAy0ZAk+PmOYxyGhzzZYAj+Exfam1gQbkjeL5KzElEJIPrysHFK6zrfspZdbKUONQQ1r1eTMzW4PwmC/cMF2luxHdlWnxeHtjuBonDBD0/nlac8mWnXpQ1YHez8cOcAwAX2yfEN0tuA5Ro7kZLzpelQcY36B5XUGs46o6UIrWu5rzatG3hZsLji7djeXprcCSvR0PvLAGCI/V3/EKbgJo54vtuGW7+IIgv8thByfWtm+APiSZbI769NWBs/obji1HUaePyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHCgKZkgOPJ10RDPa4U3v5hdIUQsPh1DQpu4yVAiOd8=;
 b=l9f8UdqolksR4QSk0G/pgp4NE2QJGPZ0fMlnZfHnwzZw0t/5s2Tk2iOK3PhL2llk0CkPeomW+dsIHGeWZ8+RWscX2W5HPkQMALuhJR8lraHkDaolx02oOiEkfxy7ALTnCaGItCvwJO6OJOSgEgs7SpGEsuqkTrjIBq9zMvTpiF87Hx5ExfiHrieg1OgqxvZtsT717AG+CLs6DjgyXOuU8vacUVPLsfU3wUh2IMJIJFcgjBumaszpqmSotllZHO+RZap5dmjJKg9O9KqtEwzWnMVyBnDYxnFJb1yTOXdtd/BGnJyrwHQsKCswUKRVqmcGyhst9Z3mTtUOTjiYlXxfRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:53 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:53 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 4/6] arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c driver
Date: Thu, 15 May 2025 18:56:26 +0300
Message-Id: <20250515155628.233007-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515155628.233007-1-ioana.ciornei@nxp.com>
References: <20250515155628.233007-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:205::32)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e61b44-dcd2-437a-62c7-08dd93c91c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q6AOMqBQ/pxLjXZUbk/4WdI6aF919Nf/j1fuPlUJ2Nsr9q+07Dt5Smu8hG6d?=
 =?us-ascii?Q?pUgq3zUa4D0KJnIfSljF7oWx7K2GIkPDHsDw2mHflvFEO2iTeCHjl+yia+Qk?=
 =?us-ascii?Q?l7YR0SKrQFPe661ip0lYCTSmdBFcsmU0CWTZM+cIU6jx06TFcWjB16tGyVW3?=
 =?us-ascii?Q?Pgmb/wIc/4dtEqucEXu1SVrjxJD6JSWsHCKiK9HmXXUytC5sMYEROyPgDzzM?=
 =?us-ascii?Q?tJXKCkyIS0X34N3IGMZLjePoaKaEO49wcGERDy2z02hXKnF1eaYWoi30MRZL?=
 =?us-ascii?Q?iYRc0JBj1kI6Jr7qgzZ4kl8CSQfC5OHeCcXia0Jl3xjD+3XnRvYT6NMe7xss?=
 =?us-ascii?Q?yOaGH0S+vrWqw8nwbcRNGk/Gu1HMZ3/kKvL+HqizKOCo/woO2s0JfHhk1rmF?=
 =?us-ascii?Q?aqAkvnCD1n77f24ZO3fYZzHgMr0RAvCl6mj4ZhrgLQQIvTUio2zlbgwTRblb?=
 =?us-ascii?Q?N2w8B/mEk7q84Xq9AP5H+cmfbdkN+aegB2neowICeNHXLGyH2Bid2VtV5Vtn?=
 =?us-ascii?Q?EP57PmzQXHhycECjF3eDFC74n5+M/2eIQM+oVmmeU6PSJwSKpBxpTH2qghS7?=
 =?us-ascii?Q?CB8+Mj+v0Plg+N46VKba/XWBSe34QsdweMv7zyXA23SetzjqOLAV3BZOJLrn?=
 =?us-ascii?Q?A8Ke95Rturt2JCW5/2GX3rtmP7P13KRiupcqTdnIh/hOi1D0rG6BIaaU021W?=
 =?us-ascii?Q?OpD8E9jIiq3ZSNX6qa0Oy/dc9Y8zWZGkhTSARX3uoB6rZ4juo7HAukPgfLIf?=
 =?us-ascii?Q?Tl+CkZI5Bv7nb9V2u5lIRSOIhCHT7klB5qCBRVBhBPsp+LOZQohHmAK3gK2r?=
 =?us-ascii?Q?8hYjaZlmRxZSzVP4P04uO4MIyhoNU7GaazZhk0OzH9QYVe182+P88yF1HVYw?=
 =?us-ascii?Q?7LzfljVT/zd2hhRvuDN49N02m4dHfN6Hg4U2c3LgrSz9NSkect+l9D9gLh4/?=
 =?us-ascii?Q?NycFkI4a9RXbclqRQl4ZBIeiZY9KPhr+cJXbCpWQ0NniqEL2Hxm0WTCmBn7T?=
 =?us-ascii?Q?S1whyWZp5uH/ze1czWSIgMrS7HjfcYKuN5cIUmH/SSMluF3Ex7+ahT4OJS0V?=
 =?us-ascii?Q?6nUChNORnfDRe1czkSRsSpQ7msd5JeDB3mCPxTP7BCcYTQQAQiVzsJCG/o3t?=
 =?us-ascii?Q?PphdyYH5AbSDRBNZ/AsNVAw0kOHIZ8irUVe9Sb1q2OSpbugvoEvq2AvLGJCN?=
 =?us-ascii?Q?m5adpPMuQ8epB3ntcn+wDbXO4SFO8DtMnWoOU06Y15/G3z5WMkKNkVxXGTiN?=
 =?us-ascii?Q?QpEd1eVrjgVBnhOaYmXFcOGbcJw6aDEKFD729NVNff13C546qC1bvNMfHJhr?=
 =?us-ascii?Q?OxfVo8QlTJJqNIcuoLC9P2+KaOWyMw0aamU3XWzTt9lMRztB5IcPOMz32uGL?=
 =?us-ascii?Q?6UK5cyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KvRIsmliszZ3RxhfWnD8LjaT2U1kTg1oAmrtaKoq+cA+760RDVxEjhd1IDgV?=
 =?us-ascii?Q?aG/W4tyry503/N4ZlUCdvKPTlluweIV4aoO++YY+Hjm+BhIQMV4ZdLXfJhyZ?=
 =?us-ascii?Q?dVjfd3XbHvLQTqYdyzV1IRUVR4N1tzBKFne/tmhQyiCCu5ej+2GEFm4UlRiN?=
 =?us-ascii?Q?V6u6vSKOVXGdtWoqH62NJGnxtIxAsGoPrD2fRiLDOUQdP16pOsxbGtqDWhuo?=
 =?us-ascii?Q?UGIamC4HWdKOLt0BgTtoCqgViMiQp8+tF1YEV09p3TVTyxVWeDDEIVG8d2S9?=
 =?us-ascii?Q?yutc1idC2eb8L8lRbpUZ5j/fyxg/Q6kBbpGAh3ZN1JhP+mSOIyCFSzOXB7+A?=
 =?us-ascii?Q?GSV+1FZbInAZP0mChNOAdk1vXoII1FO2blBTpbYRAPNgzXaPfYh5lkc8ej0O?=
 =?us-ascii?Q?J79jVuDS4K7jcDuTmZmJLKD+IR6C0zXiZc5EbjUeZ3VOGPti7zYJVd86P1jB?=
 =?us-ascii?Q?DKPP0jva0RLUg/OKiyO4Tzg4DfZFMiLyjeh0JpDh72V03sKTVNrxy84/t0Yr?=
 =?us-ascii?Q?EiJBLtxkjrBUw4X0xm5WVLaKubvl5DRnnqZAkZyAj9je85XYpryenOhhKLKZ?=
 =?us-ascii?Q?FD6M5TE3uHzHzG9A8S+k2HHggPCmcHi7LT/FL4+0oGCjqKlTqksF8nEaJNVI?=
 =?us-ascii?Q?Y/j281fN9myHPJMSQBkc2MBCtrL5ar8I4I/t1o9fnf5wg3y870hgdR0WszYf?=
 =?us-ascii?Q?mB+pD1MAMcO51ZexJOKZvOcfjNLcm+Myqb78N7JOCYDX0W/vNTEGzoP+P/YO?=
 =?us-ascii?Q?BVfsziFWtt5j+Fgy/c6iaokHc91VK1q+A86ivXR64jWb/8iGFgo5i0Vp5Z/+?=
 =?us-ascii?Q?7X+U49zs/TwyXPjXkJqEFwxsSuYrxiJrrYpyqviEuc57wuCskd51EsZeDatD?=
 =?us-ascii?Q?8qS+7x6AgufGojgBcYREdwypV3toxVa9wJ6PHBRfieMsaK2flD4qKXLeJIN0?=
 =?us-ascii?Q?ibMTekuQCUeYkQQzN/5Xaq00yCU13/mtq5EPe5T8MC654hosXmT09Za1iJof?=
 =?us-ascii?Q?ucm79NDfoDET0foGEl2nCTdGwrqG07W5cFXcOjtudrfle+C6ENqkSWQladc2?=
 =?us-ascii?Q?yuA9QIp2YlcZ2UR7+1Osm+jWt9mAR6hkOTG2W0G8LTJ/XOiOVuttTsXszwxc?=
 =?us-ascii?Q?Cs0viKC5HkEfxr4Oj6uQlQG39fMvBm2S+OQqd0L9QGLaOca52WFpVNRnhbnG?=
 =?us-ascii?Q?leKyqGiFPH4TrEzCbhtURLy0Tfok9stPLfh51EcLehr3R27aMnCjS/h3AqH1?=
 =?us-ascii?Q?5xCowHlrb9TuIVgZV+cuphXlIw2wqxDg2w02vHGyxcv2r61lTlNnpYkxNK5T?=
 =?us-ascii?Q?004csYY29/71woJew52cTlFFnGH1tbh1BxVVMO5y7jyra0uoMHeyGwQvnfer?=
 =?us-ascii?Q?VvqUFSq8iay/xe2WB10AaxqrnzGRpvIwjMLwhF+I76b1lmacgaQc6/zdMh2g?=
 =?us-ascii?Q?dMS4deocL/r1orjIEuTmsLBdu8KdjNIwmPPfTpn0XWEaJG28PXstG+vF11nI?=
 =?us-ascii?Q?Kndjf+1xMejdJDWWvlvCMXZCe+nZ8N6V8gqt2zIqUf41rs57dZTnUEzrCTru?=
 =?us-ascii?Q?HRkm+xNxnimo91vEbUG/seqX0MYEan3LWxqzjgX6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e61b44-dcd2-437a-62c7-08dd93c91c70
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:53.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yONR7yHPJXyVUrt+Ukb768QMK73P9RH0XkYTk1ZKMWr38ozUqoC4y4Y6OlYp2bwgdtOgZzH5uQ2rv1LqnOQang==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_085702_357518_76C43A95 
X-CRM114-Status: GOOD (  18.27  )
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

The MDIO mux on the LX2162A-QDS never worked in mainline. This is
because the on-board QIXIS FPGA does not have a driver that could probe
it and register an I2C regmap for it which could, afterwards, be used by
the child devices - such as the mux-controller.

There is a downstream driver for the QIXIS CPLD:

https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
and the hardware works with the simple-mfd-i2c driver, so there isn't
any reason to upstream the other one.

Since we want the QIXIS CPLD to have child nodes with "reg" and the
current format lacks that, change the compatible string so that we make
it clear that by using the simple-mfd-i2c driver, and its
fsl,lx2162a-qds-qixis-cpld compatible, we expect dt nodes children with
the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- none
Changes in v2:
- updated the commit message to explain better the context
- used the new compatible string


 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
index 9f5ff1ffe7d5..9c0c7724d569 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
@@ -267,12 +267,14 @@ &i2c0 {
 	status = "okay";
 
 	fpga@66 {
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
+		compatible = "fsl,lx2162a-qds-qixis-cpld";
 		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-		mux: mux-controller {
+		mux: mux-controller@54 {
 			compatible = "reg-mux";
+			reg = <0x54>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
 					<0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
-- 
2.25.1


