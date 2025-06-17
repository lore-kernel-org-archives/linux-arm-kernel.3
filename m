Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4A1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zo+Y9RtFfDACEubzPE+RYoo0jy6PGY8G5nC1gVBIkpc=; b=k3cUwBckL6/+hRILBVavmDON9v
	9z5KC8qmT87mN7eVcbsalKHT0GI330wNWtLrgi3aIzoi3o2xCnKdPdthgx0aZK3fFwYVfWecn/0VF
	eQQuj8gd7KnOHd4Rnm2le9SwDCTG2OljF9bqvOaUQmRJ23A2RvQ7J7YbYUhMoR3mIi99dXN3nQ8hM
	92P9GSGn+Iaf7Zf6G58vcNe8UKbdwpO8LAW7YRmtdUsRT2y2pSxBW+hFqMzQQ9Rfb1b7VlH7o8HHI
	Pv/zbRXQiFaXMD+MtnLAXJWopkZ/DBlqte+2VVU62xb9mpOFKZME6tZ4tmr/AZAOPwfNN8zyUNwGu
	x2ySZ8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK7A-00000005sxv-080G;
	Tue, 17 Jun 2025 00:23:48 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJrc-00000005rY4-17lo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBSILs/lMB+Bu0chmqsHfB6DrrIZilgAFb5DPX4w0ZCFdB0rjzvUlAhueebs3yMJx/mJKpFTjgzVyuRl4zwC8JKD9HF53vami/bBUSTMqs2F1a2zz5tQykRXPqT9RmRHXblNfaxokeltOIYbnsK99tvkbjLaoMFxbmqiHu6DR3dD4608Ye7gISOWoUliMO/aSv9PMdgHmA/CuOPNs1LAAMlg6Ca2AKY6im7w8CZRRk6WzHB1vuldJL4yLgRJubs/zAnD3QVrSi/3n9IDN7RO1BqmA3wUeC5BVQbsACTqb0latQ0FjNh8uYJar1jnFlxBjFVmMka+LXeJc0LYIFJIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo+Y9RtFfDACEubzPE+RYoo0jy6PGY8G5nC1gVBIkpc=;
 b=Ra9/4Yq5c9zdej8tKrq3IpN6xONWZ2SFp3Xv7f8gB5K4hMnrQedH3pa3Ik5vaNW8z8FMLtupXglIF13bPhO/si+BKJL9gfmthnTXWd+gh4WmeNhOWHXEOormPC71pezp8NULsFDS7zpHH39MK26XWDn798k+KhS2TPSuSnjtxaPHEq2fAHCuDweUzb4I2BryOuzAWgFnGAt9k0j90VIG+CB6aUpSUfiqJc05/T/jMAdDJamVRggBTYQzashW/V4vb2Sj7Ux9p4Lrut8RQ5WDed35gUX17V77iiCb2TxVisl2Y1OBKc/TeoxTONyzF+7ksjUoxYsjEnLQYv12zTo9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zo+Y9RtFfDACEubzPE+RYoo0jy6PGY8G5nC1gVBIkpc=;
 b=JbdP1jTBb6e/MVBCipITyZrzQJsqbxM8r34kmSelANpJLx6RcP8HiC4BB2Ydt7vYNs10jf+KVMBrKjQ+nr4zkCfNDsz8uK3L83Z/eu6Fo6Ho2Ld72JpvMWso+kYSqfJbX9YZ1VPf/wHKwrF35Snq0ehkiWYRXVQwTpcv8GaRHzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6804.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 00:07:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:07:42 +0000
Message-ID: <87ldprnsc2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexander Clouter <alex@digriz.org.uk>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: orion5x: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:07:42 +0000
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: fb08db48-93b6-495c-d5e7-08ddad32fab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qwnatHuqO5O3/SPxe93CADiaO8UJjL3DB8vP34gtLoZUBiDejTwbIbYmsz9k?=
 =?us-ascii?Q?AmIKhfDgTVIF95yoZbejadJ1IdRL6mVAuc3cgFo4BSi5XrLrESSaWWim0oUo?=
 =?us-ascii?Q?yINuOgSwKnLWGUyZ541sn6cyUfVLNPk2cR5PNwXzCUWXJFC6HTYVPnBpN+E/?=
 =?us-ascii?Q?Zne+gUqFq673QeVWAZWVvGCoQeoFki3sws8cs6OCAa0uq99LYOrtQLgYaRKM?=
 =?us-ascii?Q?J9IAvzn0nfnVmhCjaGg/tBf4YCVhXJ66FPyFeATWuBE3QoIZ7P2sKhnkgKmQ?=
 =?us-ascii?Q?YNyYYh5YJPOq4fpyrcWfhAVwGBLiQCwmvRmTlDh/tFRFAu79qBBDtwEb03Mv?=
 =?us-ascii?Q?zFpDfprodwaN41DkO+7ZjzDaK66CRpEe1ZPq9A1SD5/dEgORhcLZ3yZWNarW?=
 =?us-ascii?Q?G9oWJmHQckik/yqkv98oL+SUql4jcmRgg9/m/qAdr47VZtHUbN6ZDwOUViGf?=
 =?us-ascii?Q?BzMMgZkmgPRIgDOxLpHeCGADh1C12LU6+C53QQei3MkS6C+6PMcMOD55sf5Q?=
 =?us-ascii?Q?ISdk8wZsbnlKHa+NSfwH+HdsLNRFGART4XZY9blGNrUkY3VV1N4Yg8wEHoW1?=
 =?us-ascii?Q?xhXpOlZrK/OR6vcleZOtbV7wyZ2BnHH9vJZmxAXqfTDvludPi83EXf59jQkp?=
 =?us-ascii?Q?2jAv4z+uW06gA4DqPmPcQ0FUciz17RfNrohB8OGogRZroU+sD6B8++3LopZ8?=
 =?us-ascii?Q?JUL6a6x5jf3oQIorCvtS37CAhta5haqkdBjMupdFugaFfeQx8LbX6NaXBVc4?=
 =?us-ascii?Q?ZkFNgugTlWdE2PjzyWD+iMwlTsN1hK+qjRl4R0ENX8Il3bjgTgpES0vxOI97?=
 =?us-ascii?Q?CoQlzB5ErCs/oel/Xwyk4YJQOsXFkX0fB5mrR8B+SReSFKH41FjoMcF4OyWn?=
 =?us-ascii?Q?krcW453MJYDZYfYH/Xn2jB4F3Kfbi0tFOlcvfcFJPCmQSdLZIZr5YgPzpo4R?=
 =?us-ascii?Q?UWjyx0ZaRS61zWo9KRQ3iEzZIYKJAALapLDYTfxWdElEoLVeTsjCxwoYYhkm?=
 =?us-ascii?Q?IGDOi2w9npCeqzVnYMLrx1dWp01ciGkCf9Gkgu2aVBgp1fgdKs+lVDDz6JfA?=
 =?us-ascii?Q?WSJhKFJNI0EiJILqYc83BNRLSjkMg7BRihfeh1kL6bF0WxGpAEt4iqAm9nfQ?=
 =?us-ascii?Q?Ik5Ph+Dc7ElT+8Sk2hfgU+XK5fzwPuh0mE/pfkGIPMfnfs0EnIOYz7f1vPXL?=
 =?us-ascii?Q?ySk6EMjAnJZD/PZt9umEi85QCDuaVVckZqCiUp/g7THGIiVZH3EvBa/g3n0h?=
 =?us-ascii?Q?AIqfyT0lop9HZtPY1vPg86TOFPHUb7FFcXdP3L6cyvnrgJAEVRilJVuFRIMz?=
 =?us-ascii?Q?lIu4K/in1l3ioxPR6M3R7O80yoBhEMZ0O0KDB6NtNcvZDPIp2g/QAJFBU5UT?=
 =?us-ascii?Q?Kj8yeFUZzaX5hVyEvy3NrFyoWd/UF5YBDK1NJw/KZwVT/GLKQwEClqF+ULQC?=
 =?us-ascii?Q?9E0Bzz1OxTNE/PRB+DIcp3wKPt/TQ40OrfL6JHm0q1z7klnYpeZ+Sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bN36Bm7baISWss0BGcf6SJXqjUazVwQYwUMed90YmACNEsCYZTC6zqKrJzrP?=
 =?us-ascii?Q?bk6rqCE03t2aAdZP7VTS6uqT2W4iKbAj0NLpAC43q+n0H5VRu6r27zmm4sXT?=
 =?us-ascii?Q?jTbER43QUK4+OUMaBZaZ8rkYXSPg9fYtn6ozJ0dLiwQps0UxAx3KhjxPpS6n?=
 =?us-ascii?Q?fLLIy2BlPDZN6wLmbT6Kku35fMPgsUNS2mmG4A4NbqMrHqURPf23c8ThBcWL?=
 =?us-ascii?Q?b9sUZtva+68R1iIaQgdRAxKisPsICgg9VSqJ7JEY8Dk0ndpWokTUHTX+WRJJ?=
 =?us-ascii?Q?u87fjut6etpt7BBQufw/zpCN+2p5l7SCdkTPp7JZzvDtHJsc22UxgU9dx/s4?=
 =?us-ascii?Q?7TwIUldlWxwvO7uWlW0hGmupZToOQM89IweLFPh5YXFyKmrZODthRIoxmxym?=
 =?us-ascii?Q?esqyHQGHXP9TvR7hlpY/qt2hXA2mzJJC0mzSjdvER9v2Z1OYsK78qIEDJhya?=
 =?us-ascii?Q?wRxgzNHtQrPBhZma3ef/ukBA0lPH7xoDaCIkyTrkx21NVt49qwbDClgFwTeB?=
 =?us-ascii?Q?c33RjtDLAkTfgEXvE33fio4sAugJWSRl+RazAgD2UQPjSBDr5SAwK969+mmA?=
 =?us-ascii?Q?y1XdIbaM/+ETVLZcOXfkgOtaNl4v5en91WqHqhiCDhZGD35x+MaBh8SLAwTZ?=
 =?us-ascii?Q?WcQI9LqnUJ7/Mk+Vebm0l6jfSZFTcUkjHiZ0WHStf16AVBnUyicT7S4d6Ciz?=
 =?us-ascii?Q?8DgHVaNCbN7iCGLkB77PxgrsBvhOE344WMraEHllAG7FsDz50QnOaU9SFoHo?=
 =?us-ascii?Q?iSKo2K6Vud0oMYO0GCOLIWOKGAuiBWqgB++4CjutMU/I+YwkJtM4UL5f7Rni?=
 =?us-ascii?Q?WhtAA5nTxf1jHUNc0QEtm7pxSZp8ZvHhHvv+Rs19s9dpF8uIH5jneGpfuv/u?=
 =?us-ascii?Q?B3e3mJb2CSG5wHs4wOe+WBoVP4lV01VsW0DX6tK0WymFL/uHo/zKrby38xT7?=
 =?us-ascii?Q?JYDfv73H3zHnzwVc8MLcLNVulkLZzRsK7LRru0lIRU7AwIgimM6AQruzbxf9?=
 =?us-ascii?Q?5ud4VdMqKvxVJbF/iiPDYCkTDFVXeQ5ADzhpEYawqVDKjKQ3IhIJESpMgs9L?=
 =?us-ascii?Q?LBk4DTvg8BZ3x6wke/sCg0YaDgJPPK59vAdmbjxp/EUnJu+wM3IEC6ORHliq?=
 =?us-ascii?Q?VOJr+iQWqBEL/97wJoUylvntKks/v/y0NIKzJj5w4XIoSBYmqBrUQqJss85A?=
 =?us-ascii?Q?xGNP4ksMlFni3N9nlHoxLt2KkjjMJIRow3RMEX4YVbLHOH2sBRCO/pjVwzMg?=
 =?us-ascii?Q?dkaGfv4atxS5UP9VnAqgwHC0rm44xOyF4Pi/OubmERVgHqla06k/4NFfU4SP?=
 =?us-ascii?Q?/nL8P5VEiKNlrvh7LDIeHnrdmZbFlG2ogjAEOhugLXOpDAYSBFXzdwTDKGZQ?=
 =?us-ascii?Q?0v2V35jFtdS17DknTEoQmdKxCrLBBJw95+Nb/POZ0YPl5F9fLvO3BqPzJKjP?=
 =?us-ascii?Q?drxn319pvPlLV0MdnRGEfwkiLbwneB/cLJaCFFaNjpGE6f6RIVtc6RbyfvN5?=
 =?us-ascii?Q?r1VA2JV7d2Cxjc+1lb/mpJVpXPgqc99WPPU/KnFb8aDKsRLVsX7EP9Un+cXJ?=
 =?us-ascii?Q?2r/b519RHaXAHh2aIplJy1/A6AzoOZ3MO3pYW7iFy8IsnKntMk0cToumgnS0?=
 =?us-ascii?Q?aOMLKRnOvbwXDEuTIA/9keM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb08db48-93b6-495c-d5e7-08ddad32fab1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:07:42.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //MREI8/Nc1bHxjM4pAALtbkAAYwV7Ucd4FO6bQmRF8aZMtPozHeF+GJQS5W0JX03/5cRqIDLk1DG48rM8J3ywM/r8wMYVOTgNUJ2QtclyCK68tmzY+sD1oGPuSyp5Ni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170744_324278_135C827A 
X-CRM114-Status: UNSURE (   9.29  )
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mach-orion5x/ts78xx-setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index af810e7ccd79..c250703e696d 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -460,7 +460,7 @@ static ssize_t ts78xx_fpga_show(struct kobject *kobj,
 	if (ts78xx_fpga.state < 0)
 		return sprintf(buf, "borked\n");
 
-	return sprintf(buf, "%s\n", (ts78xx_fpga.state) ? "online" : "offline");
+	return sprintf(buf, "%sline\n", str_on_off(ts78xx_fpga.state));
 }
 
 static ssize_t ts78xx_fpga_store(struct kobject *kobj,
-- 
2.43.0


