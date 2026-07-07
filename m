Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz+Rv4KrW6LvrUErlfZGgG1wi2piAsq9FSNJvDZO+9A=; b=gqIzKBZXd6XH+NsYe6lX7qB16e
	3vnSQkesNztLWrLVKOMdJpTr6S8OB+VG12H2S0nh7wbJhf1oUJWv0i41knP3s1HgmQAhPo4aB0y71
	GksDbD/53plFrGRIBJBAtvfocQ38kv958LUEQQvaUbir33WWdrBgxD4HSBaEQ01O54ymfDckfA9uZ
	MImD5lKiKo3WiaK4j34rAEU9nZlA0vSAhj6u1MuMkxVdQEvpUhwsR8Nfk5Pk3quNKS82yL4zfzPEw
	5qzz96CuFDPuVeQMZ/9k1HZK+XKoNMJSl457+54i3lv7jpeqrd0s4w2SZR94Dmp+1+U9rQFep1wfl
	HQOMRtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkk-0000000EGjg-101S;
	Tue, 07 Jul 2026 06:57:58 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzkh-0000000EGhu-29Iy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:57:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCkjSSPApABDb5XRN0J9wZFvvonBv5QD0i7lRVl4wF1a5O24zzhZlo8/Li4mtNIZB2Jx6b6CUl8V8JXKHYJEfZN58lTwOx/RI1VD7CPfIy/iZAx5arHV/HPNWem1tEJL6DMzc5pwHdS7Jij+pdhzGAKBMemUkY/7aK27Cs6iuhyOIjaCacmpwYOJkKrHruu0gp6oL94adas460YlFHJKsUuEJgp713mHh9lHmh9Ox0ZZtR5Dc3ynEGj5gR4/gAK0pFokt+2NbuXJvnXTs9I6HpWNEjwkocYFz9SqqFDV5ASJDVfTzQSEXsWy/maWukgvpHfEvir+lbVy6DRH1Vs2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz+Rv4KrW6LvrUErlfZGgG1wi2piAsq9FSNJvDZO+9A=;
 b=G72qUuXg8nHSydkIaTFlyOQu3uEyGPebG77TrGsMxxU33eZR7Drs2R31sJRDSXFuxtK92W8fL08iRejKZXj2zMq2kdjoj5trDzn3oXCwxM8SOehsQqoces5VfCK84QO/d5naV5IDQ9lzCi5aB3OV4ow9Ede9agqLRuV4wWcHOKqYdngzR8PuDM2M207c/DYdDZ5pLMd0iQH/dt/edgzmKtlI3QHlCiRVSDt4358/YnBrEhEr9LBPqj1YDbGQvsOhyCm/BhJV+RVxymVYJaz/12abvnG50HcbxRVY+BWIgHvhULfVxE85yF8SIqPX3auq6qHtEOpLRuZvNrgdK6oikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz+Rv4KrW6LvrUErlfZGgG1wi2piAsq9FSNJvDZO+9A=;
 b=m12K5BR1i4+y+ZR4SoTKHwNk6bKZpFQdn4Xc+2gw84hO02rgBuQpnbUIsRnH2QESUV7R5Jp3op9uj7I1UDKylVi4nIRe/ucV971Fvm98hI72v9yhsl3I69WOMIVJd9g+i6tI2UjiPLYTkO4UE+iwPMGuFauvPupV8YTDgk2b2I2aAjzUtPR0ZucC5yOmrZLonLvvAWeSR2u3NMdT9O1rgdTbMzxdTSztiR/S7lGzUBTItO5jS9A3vdpjOH5+B6A8PCio1G2UkjahHv0alQhO2//IoLpBq3EyeeNB0NbVBjm73rNKLv8CIlVenWVPeGfeKNgmB9QaJfIdl2FBOc14MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:57:46 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:57:46 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] ASoC: dt-bindings: fsl,micfil: Add audio-graph port support
Date: Tue,  7 Jul 2026 15:57:21 +0900
Message-ID: <20260707065725.312450-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0179.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: e76a6879-f472-4b2e-ef18-08dedbf50cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 8FWR2d2Q1wJPi3Aeu73bOvLyvdcAKb44rsUQeIvaVH/bLHvKEDfaGg+jNLEraj5e4XUPWDe9S0xxNXv+TA3MY3jxJaPljx2ayzLFthJYRwQ2PpJwnH+lNwo0h7reA00LyIdaa9Kde0w4cGpEBdAvLYgQeoeLTm0JJMpfL+vfPb1YBiA/9h8yFMmGqpLsGMlzVUlZabnteiagMs/6rVih3Ii0hS5SQ5wp7DpkBkQ9Hr/9DJpxQESda2kPWnWj8OleZ0ZCMjLG4pxlucI8XmgRQSvUXg5qU/3wgV2waInB6mZs3vJLiSLqByOxFZiz9IBkswJq1cZ8gzGAX6+UpMwCf+easwNFghsK5UOr6/AJrIJ9Pw1myECTqi5zQK2hPvo6eo07IZQ+e6/AAyVGIBdQ4vNinEnK7w1P71Adil1A1KRUcprYJ61tYF8FV7k6vvs/1cV5c4a5EJ5LA0T5KPDovcf1wKD28okRnz3teYEeGFnDniGwRKcJxP16Fx4fP2Dl83T67uR3sbY7w3hoc/xuxfWMlWr98oKS1ODl2dLm9jUVWm7r5Cd3VWCRsCX/YJuyGJpMJlVPvqYYVGYcM+y0MQtpzw1s+4QQXudpw14rb4IuqvybtSZuSSCI1fKN4HIt8JxY8mNW9uQXyr2rvb6QIgkHYm9aX1nCFImGYkeHwD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XMvllkleFFm2i8ngavRXMSZEGoTlqm+b1SnFskL5CC4c8e8MZwRHH5u9V4x/?=
 =?us-ascii?Q?xRv42qL5lJZfoGwDE4OpbtH3gERglbtf0bG/BFPt6hECrmiap6MUte/zEOZX?=
 =?us-ascii?Q?p2Ss9Ahuq5sUxIBW3v7xGK6Rao3XdVkg40oEBZnginRK/7JnO+nUIx6xHQqv?=
 =?us-ascii?Q?SxtERdpxtmpySrRi+8KOszemlcnExZgy+rYzdDvQBx+K/KLF62psnEWquyYL?=
 =?us-ascii?Q?kcA6HqMbWoagCGkURPmSxORL+Ucl+PChIayIFsQGinSuQAZfVHwKJTQYgtPb?=
 =?us-ascii?Q?sBkTXGhVachUqoN+ZGxf7FmUy5B+5bocwD71xuvdJBCHqpCXibykBL/j0u36?=
 =?us-ascii?Q?Ib8sQzCGvwSLXUg591PKrZuSWQ3TDOMq9YDvHSAoCNUnfvKmEJp+9zpoCYcm?=
 =?us-ascii?Q?ubq0fO2sezLjMB/QmYhAIoT/IF3uzl7gM2/E8P0qxuhJSPOzTRdzbtHrbOAq?=
 =?us-ascii?Q?98mCw2oBH4rKmnpWaa+5nyv6gSkH9Fy6CZoMzkh8UrFsdVsd9ZK3Ce+V9IiT?=
 =?us-ascii?Q?4kNyc4sxcQvtRZ3kBvFwFcr/XjcOEL27zr+crwkG/ZgNy5/A5VDt87o5RG7p?=
 =?us-ascii?Q?9B3vX6kAfjcOCc00xccSZrmCq8vB0MDCic6c/Yaxe44t7KLjbNKgh3fRQjvB?=
 =?us-ascii?Q?lpCy0wrj5Gaj+jRgVK2tlmyazbxLOZ7XmxnMEupX2RFw7wJ3/6nFopq+k2j5?=
 =?us-ascii?Q?Ls7prB/re+3z9dYXGpFIZ0BEXsTWm60OALsiI6O46A3qrtBARKm9iw2NJdei?=
 =?us-ascii?Q?yqPyW96ir7CzaUmGuT+tiyQ2J3OJQpOaDwwpsd/wH31kSlUZMBYEA9JC7bYS?=
 =?us-ascii?Q?SeDy6zknDjIVW1wjT5MMpfRosy/RVhwTnIM1DJk6UjUgq1TmWMAuJMe7HZYv?=
 =?us-ascii?Q?G7TX80099W6nXtnBghbGtHbNcWQqEOyxaC9Pxygva8h4KoOR1Jf+BvSz9Gmo?=
 =?us-ascii?Q?R4G1jH4zhNA5IIaNBMwibThZDQ6ncr2X8j+HO47kLTqtZRGzxZ31H0PSIkyt?=
 =?us-ascii?Q?26YKEq2GQwhUd29DJXunZukD+FIoSncPBFzKXWGv+lt+XTMDC31TRT1wWPGS?=
 =?us-ascii?Q?CDH1r09v59cbzLtDqnHs+O4nw0s2Wym+HxSQTgJW0Re6gowfPSYJxgRnxScs?=
 =?us-ascii?Q?izemZrxNoV+dUZjeSPq5gT4EiTleBG6uObyei8y84K7fVELh0/wVM/67CK5N?=
 =?us-ascii?Q?DALOIw7mbl6PCKnJixTjij0S6zEszEbP9QoF7eAI9x7x3Jpu4lOsL0Uj0gkI?=
 =?us-ascii?Q?t72kN0DaYLydtqaTNKnLAe/d+gZJMhmSanxBzBJJL27lP5CqfPpBDKEQFmKu?=
 =?us-ascii?Q?NKHjRHlnj+mvKJ81kV/de1h4PcF9xwkGl3rrNtJasAbA779+0BXANXXk/qtG?=
 =?us-ascii?Q?063RnJC6tWsx0BHqdPiYLktNnCqLB9CRRlv7BpCCZRq5WkFpXb35FFy/U/Jp?=
 =?us-ascii?Q?RDDIiSW+vL4ElVTfD8O3LxYi4qRNO5LYvRZGUwjApfwctTIZ4fkV7OWsKa/Z?=
 =?us-ascii?Q?Zk8ef+pNv7vguRlUp5tQgHzjnNwUHdjpVeao7tfXBQ+eS7rsjhxzc4FYi+1/?=
 =?us-ascii?Q?FaMw9cWxHksyTcfOjqIKQJghXUyfEwOjWVeVt8+kdKjXPiEcZ34aGn+NH+mU?=
 =?us-ascii?Q?0BBm+8Mm5TYPc9vAYu6RAr9hfO51NWtNj9BhG8tzMQxiQT2+iGJ5QTii+1MM?=
 =?us-ascii?Q?+GxfjfOjXnT8YI20LFHfqkYSJucbKEVy7RqCDxMTNsBnK9mjUTwNRJFjZtT1?=
 =?us-ascii?Q?E1yp6roEGUSzktKyh5dUUFIvHKGjWTi/MWlNXb9H670gWG32/Rud?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76a6879-f472-4b2e-ef18-08dedbf50cbe
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:57:46.4545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZCeKAip/BGAeBduVEv6+7Vr4j8TwmFGbFya63/lUt+ZEl0Fa41RyXqAHeF77GIrNnLCMDBMZK8bVcJoFvuDVZfUSG3qiFr9ZuYHliOjTnrW+NBjoE5hnOSfwCiScgh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_235755_624999_5480B55C 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Chancel Liu <chancel.liu@nxp.com>

Add port property referencing audio-graph-port.yaml to allow MICFIL to
be used with audio-graph-card and audio-graph-card2.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index c47b7a097490..4c7dadb310de 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -66,6 +66,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.50.1


