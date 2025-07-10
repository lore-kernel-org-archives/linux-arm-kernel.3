Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD276C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFgfYgelPFWu10+orQ/pP3pc8XDCsaez4z9Zz3a1F6c=; b=dBVmSZm3//3O9tVlM87Q8BIJJB
	q5SGQnb/mvwGE03Um3dYl1yfR1STHOR3pC76iyfQNnH0B+sDWT6egeTolSXW2xPM6OBx0arXUx3Gk
	59d2D89NggSPVB5sczb+MXoNzw0PC0zeW/JpKtvcPFY0doZ0NZrHXsX0ZFI8f1A5AdGvkbbXxQ03o
	wEm5eyUVYQG/3ErsdUWUkXhXUAcF3nXaC1HBTwN9+AtPxtu2bWwaj0aNA+04PnCgXohgQKcKoM4/c
	f3xKzNgSxgBDB6xJNfTK1DQPLFV0JuvfybqOff0Jv+InXz2r/azYkVKqNsb3DU0QcoE6alNkVaN+C
	o52O2glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZv93-0000000CbDQ-07Mo;
	Thu, 10 Jul 2025 17:33:17 +0000
Received: from mail-dm6nam10on2070b.outbound.protection.outlook.com ([2a01:111:f403:2413::70b] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZt7G-0000000CEr1-18wb;
	Thu, 10 Jul 2025 15:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiWrWHW2IfA01lzGsoRWKKP502xc7mZu29oDYAz8hc6c8PWUYMA0QCpJkkqe+D13Gb2YNXdbMM0WqQ/gJ/tfO3emaAExI7BikGOWXCL/4TItLoBrg3pt7rdz2ofb5+01N9L2L+IkxNFJgVlnQS3zDiJTC9YQ2nj6E+JISt5aK6eO97wQjKzhjqo2ZUUlOXmaQRIoyGW75thz9pi9ZAm6kzwMquPChKixQiXkpJNTttK0NvRJtDw/TklQhSp+satzJg0BA55NOusBx3BVhwAxWa1M5394o2UJRnexdPns8a7/KdFlHykxAE07lKUkh9GzZ4c/c2zHOjUeaiAjI/3vRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFgfYgelPFWu10+orQ/pP3pc8XDCsaez4z9Zz3a1F6c=;
 b=OiJZRnA/jaIgJTHV0LCj9oyF1Yhd0lYmS9qpg8Tz1UqjutYY4wUlTBQhgHJpcFCl5ntmIJdtRrTjBKRDKdlDaSawvreI4eeFEqCE8Q+1aoaCQZRrPTwxsZByZ7p2p4pODb+tYGVAYaSzdcaaeWkRJjC9RxiBszhsoQB2te54nD+MLkUJOZdtJsIMiLhDcMkzv+2O/vXqSbPzz8GofylFtRJG42WMn5NCcU5xVLS4USHYtibUgCf0Wifg73O+YcI9nsKzo4ba7W3wnUyIYxrFwo8spMR9NZF0R30D4GrcmyDag+Fn2H9uYaTfwKRcmhS3lptfnCiRZoRWQt15Py7jEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFgfYgelPFWu10+orQ/pP3pc8XDCsaez4z9Zz3a1F6c=;
 b=Xg7uVNUEgIRz0VvpoZj6V60iOF1WYTL67M9rlFMouOjlsoXWTRH7xy5YqXddVlC90U8jBnzCXybhE162IK7wxaW1YNuv8O2H2lrJkXaO4pqPYc8M2WLgloSFZW48H2aavBj9mMKqRR+zcABS9mTEpWV0httzyPawL2RHnYo9h2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by PH8PR08MB8487.namprd08.prod.outlook.com (2603:10b6:510:25a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 15:23:12 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:23:12 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-rockchip@lists.infradead.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC/PATCH 2/2] phy: rockchip: usbdp: implement .set_mode
Date: Thu, 10 Jul 2025 16:22:50 +0100
Message-ID: <20250710152252.2532020-3-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710152252.2532020-1-jkeeping@inmusicbrands.com>
References: <20250710152252.2532020-1-jkeeping@inmusicbrands.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0621.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::21) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|PH8PR08MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c55ccdc-78c4-4719-4d4e-08ddbfc5af07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k6vjpUasFN1qWzI8br+G4SVg9y1qJSWZtqxAK2ilL/3hpZ9xETdGsjSVd78b?=
 =?us-ascii?Q?73fuEyADGluVnuFlo/CVWZ6HVGDEgEn2IJnf7300T8OKYHoYi/3TY/yNuqnt?=
 =?us-ascii?Q?++3YYMkPEN0FV8WH+xj+akoSFSYfM7GTCA7fST99jOiaNn4kDDqMJMRmNRqh?=
 =?us-ascii?Q?7qt2sgZntkhlmY9b55KIt+EIvTynv1qenu4LxScZhQuhgNO2ff31r78pUcpp?=
 =?us-ascii?Q?CkFIzGGkKyqVQzqw7QrSXIz/bNjFaoZi9nQpCtK/G1B+tW0iqc9T1zwzsjVP?=
 =?us-ascii?Q?AEh0QlyEwg/6qx0XxnJUE2g2LLmKgXBed6QvC+29Z3m+KaJX9MSh5EUsAuVy?=
 =?us-ascii?Q?lBXDzxoKAcDoHmNTSJOX9UJUjeDREN1PmapO2Jx9ohPPIzRq7tuqQP5tW2XK?=
 =?us-ascii?Q?u92gmxIRCLnMDZdaASc1Z9Nf+tRV/ShzlSy8TpShpZIbkXIHzCJDkYKJ2Uzo?=
 =?us-ascii?Q?CfYu/w29UV3pnvwvUqBLPXyXF7xMEv3S40a8ME/TfBuy/btphU5dve4azhRe?=
 =?us-ascii?Q?Ht275RUeM4byZq/GQhLWgAKWRlj5rm0XKjxgdEl4Mc7KUuQcQIHLdlfXcr9U?=
 =?us-ascii?Q?J6pfdoj/OlzjHJIJMuGEebHfUzyYdUKjJVlio6yCvP4tDLY7U1+aprhnWbZb?=
 =?us-ascii?Q?P84BSXupaDJZcVHr5xYprU5f5ORIcsjxep+RdWi4qggoUeGREjLFmwoFjc71?=
 =?us-ascii?Q?uVubQy9cy+MCy3css4cURkio+cNqgOVfmZObfhZQyZ1smgXZoCrgUmTE3uTn?=
 =?us-ascii?Q?nxposXdmMfc3z8qrg+9VfwOEC1VVVR/L/8myeZEBjnec31XC5PobvuDQkiCC?=
 =?us-ascii?Q?tmE+4UD7BE7tuBrC1VPkW5QbAiPhVyaGzQQBVphTNZ5n94rkGrC8XENLfYZs?=
 =?us-ascii?Q?tA7HFJm51BoDhLfY8zoBLU3/a+JQM1m7B9OATKhbl2ygPGCKBGWjSBaCOCOD?=
 =?us-ascii?Q?dgMSHEQDehd2ZJbe4e5JMZeBG+GDke+MS/Dw6yNRdzaL6tkpjqD/KBCPh4nt?=
 =?us-ascii?Q?MYKZas3sTsX/buXwzU9UDV6exuvRxkDkdsF964vvAGwykQqjv4PW8FTle86r?=
 =?us-ascii?Q?t+MSDoA6QGqVQdy2tuy4uYERDxxm+2VqNGs1dt4fmtNMkvm/0eJdAb7pCCsC?=
 =?us-ascii?Q?edGmLudMRx1SKH7xyckF3ZAAQjtuj5QOtpP9bTv4+JNcBuIerihFxyRJ6YLg?=
 =?us-ascii?Q?dDJhoR9OCpsf0E12dTCu2wUtQ2yN/DYRfYqnMyTKzmJacP+R6pcbxxa6TL2x?=
 =?us-ascii?Q?Hfekf0lBodPF3ROb5Cof7H6F0n/JXwj5wbHdAiUtwA31Ap1YRAObHzA6hRLs?=
 =?us-ascii?Q?e8MrMaHzYnjWRx62NC3K1VyDQ1uv4hbn/tt9xjU1du29vQTCCZO6eMopss3S?=
 =?us-ascii?Q?nJCLGbTYleK8ZUSwxqTeKOVCzoTmwN5+vQ2Agmx2oqpzw0qibbtQ2yM0WwxK?=
 =?us-ascii?Q?AI9PgeQKYwsgHHLtPlKzymbhCp0+ZiiYgvf114RdVDz96AuPfuRrsQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmCiaT8iTyzEf6ooSf5R9yRhud4KDh9Ur4LW/3fghEhvCeJGBie9eYKESFUi?=
 =?us-ascii?Q?eFWCEMo4Qg7AThKzk22A4CaEOBT2yw1xyId6ZBrtkwrcdv3O7jFrSEYNB/Es?=
 =?us-ascii?Q?vgpM4S3s8ay/rKGUrqMZtYfyO54v43WyLq8DL36SaNIFJ0Xu2JrUYVtCA/zR?=
 =?us-ascii?Q?EyQaW1Dw/r5Iy5yRTYFMO1t7EHZQxppl6yqHDD48goiLiacpWl3kNPK0adFE?=
 =?us-ascii?Q?RDHceI/Bc6dXTJSoW+v5CvC1e56IytSNcwktAL+YutecwDnlciBqvB2GIODs?=
 =?us-ascii?Q?7yKP3CNGUH0IaD1ELLtiVvSwch9d3Z7gBK5lS5tibQ9tVDdrJy2E4akMGV4O?=
 =?us-ascii?Q?PcupqziYq4XUwJETJa7xKDqP8aPp1PLqIzX+ig7dcu+9mCEnQw18sbq2YpLm?=
 =?us-ascii?Q?b0pByT3XjDViFN0cVWVfjNB9TA96mHLOgL+rfFn9VFHeJ6jLRqS0ArgnXrSm?=
 =?us-ascii?Q?9b9DmjYaxZfStIfSzYqvs+whWiK3wrAZhg+koPQi4dVjKgQx0bIVuvT/pIuC?=
 =?us-ascii?Q?EK0Q4EbEiZAWBh7o4/DkYbyyzILkTLRTASK+ZGctpEK8MNXDuJeOCauFnrO8?=
 =?us-ascii?Q?jrPXHT9BfAEjxOGjVrs371viKdzb2BhbCWxwDF8sQOiVrJ4jZWsmcju6TPhM?=
 =?us-ascii?Q?NkmKOEsk8Ke43jgMro86Dm3bOfRP96HsuIlqPVoUNVrmgThlcgPnS/jjYxSu?=
 =?us-ascii?Q?pNClBUjZ0/4gbnQWZhu01ynoLfPq/y+3XBI9Btf0Bzke5iB1n3NGmFOARwO9?=
 =?us-ascii?Q?buqbxSu83pdLRV08TT1DLfFJSK1h7kGszva4U1GfD/6k2ytdaMhGK/mepZ3u?=
 =?us-ascii?Q?ad861Rq5+Ash5aLeVw7O4oQNU478ucYuKKoW6UrEBlF/WfkTBGWJr/9u+b8A?=
 =?us-ascii?Q?cNPYzFzyMKpbP5D6oqzFfgeRchGDtku2lPfQxgM03Dx4Au5He4W5NGv7p5Pm?=
 =?us-ascii?Q?ujYO33ejvF7cpnPkc+X686oRNkjD2HPlC3MqTg9SneHvbaH8QSGwwkzfcyJk?=
 =?us-ascii?Q?sW3ZwnTxo8lwrIpA+vQcWy4zbCJZUVUMGuplylglWEKrwFAcDFXvBapNv63K?=
 =?us-ascii?Q?l50Oj+T8bX5nrC2RpK2w5B8NkLJI7pSWQsaISzfB7Iwcvn5pZHt75BgUqkEz?=
 =?us-ascii?Q?pd6qrmCp1UA5mGOM2xx8xmC1xLrP+X68y0jlM2rctLzD/W6TMnS+caR8VR3g?=
 =?us-ascii?Q?XQi58K97ct/eyWmI5aCYxPZSjjQSktMTHERaT0uArajWwTU2yTjCKm4q6DBf?=
 =?us-ascii?Q?FWPGZ2UY8e0lG1vRtaSMqDrnRZ4Lbl2fjoGjqfc+IrAnqQvM5BgWZZudmtt0?=
 =?us-ascii?Q?upto7ZsLOcKQl23loSY6YqmzUBwhJvnGrlciy870lhfQsuO1Gwdzm7DfpHQU?=
 =?us-ascii?Q?1qPS8od4IKak4Q5CBZ7jjAfjZoL+g30MTKdYurwI+ruYIOL61+W2U3fCT6hc?=
 =?us-ascii?Q?D0hNd8A1+Ku4kVbkmZw1Y8JIK6XXpWBLOQCwf3BN9wjXcDLIUvVBUMVCCRwY?=
 =?us-ascii?Q?26OFwIJDXEMdga+PSJqBZm3vTAJyWEy6lGBZMUSGsrp+4wtnpVRKIDkfvi49?=
 =?us-ascii?Q?MCOftOTF2vzB+afMS8X0uXlpWknCBZLsMKhF0JxN01TlZahaFxw8S+ToHoKc?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c55ccdc-78c4-4719-4d4e-08ddbfc5af07
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:23:12.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Fb9n8FZwHBpRwDDRLwjBQMrSVLrJvjvWsrQvFMwCJk/OZRiqso2Wtj5CQQgKaUTGQwgQicM/0Z0RWSKjw/aXZunJzN+3/OSWA5QSVPZXKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR08MB8487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_082318_314487_B2888808 
X-CRM114-Status: GOOD (  14.63  )
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

When the orientation of a type C cable changes, usbdp set the new
configuration in its internal state but does not write this to the
hardware.

Make use of phy_ops::set_mode to write this new state.  This should be
called by the USB controller when it is notified of a role change
(assuming it is acting as the role switch) and will be called at a point
when the controller does not expect the phy to be operating normally.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c066cc0a7b4f1..00368fb09307a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1335,9 +1335,23 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int rk_udphy_usb3_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret = 0;
+
+	mutex_lock(&udphy->mutex);
+	if (udphy->mode != UDPHY_MODE_NONE)
+		ret = rk_udphy_init(udphy);
+	mutex_unlock(&udphy->mutex);
+
+	return ret;
+}
+
 static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.init		= rk_udphy_usb3_phy_init,
 	.exit		= rk_udphy_usb3_phy_exit,
+	.set_mode	= rk_udphy_usb3_phy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.50.0


