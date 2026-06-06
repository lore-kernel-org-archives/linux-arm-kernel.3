Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15259CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=; b=UdgdOcYwAN9wx3ZdHKksZBaSqa
	XLRE+nvZ1msa1PNnwiIXg61MBREi4v5FfxFG6dki+/TPmAvjxqZAIwfR1IKCUygtLq4lxKlhsIPlq
	0YBS1bzilhub7gdDoXT+K3s3jSjbXV8+rt/yJPXs+Tf3Cq2dJg4V2YXxtrVRD3/IbE2pZpV8iZWv7
	3pef3iRYqijVvwY0fWpLxALErRt6XDUiCmmnas8njhdFKo3GnYTuRtGjiMmu4lqOiZ+fK0vEYgDey
	tzHgxWmx+Vgov8A+PcAGlLaouCwFenOxUW2lAr4+nU9f5Lknx79ObEmRVp6Khy8398BCDzJ0dHs7i
	jcmTgfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOd-00000001NAm-1NP6;
	Sat, 06 Jun 2026 02:04:23 +0000
Received: from mail-francesouthazon11021117.outbound.protection.outlook.com ([40.107.130.117] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOY-00000001Mxz-0ifB;
	Sat, 06 Jun 2026 02:04:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY3zE0sqv5RW3qjT5Xpsbc3YgM+Vo4th2KYghlX4yRjPJ/QfoYF74heN0QMwC3aTGqp/hZ7OilNNXUkonUWmrDEiZEk+y/Bw/a3uS803BVicVk6lCxpgtxl8S4yvdy1sYzg4cTMm0t6kWEdmjbRCsQTeKyK7e1riwIXJnjTt+KCf4q/eL+QB4PLARha90x0ls/COakISryZJqcx5khr2Rp9QzR3Nz1eZmVC9v1ywSQqs+TVQg/8aP3ebIpZlXDnpXyRTUkjQvhfdYIxoQ4kfLXAH6doYORAlKZ2eZAYsH0tyBaLXw3TnzWPFK9liqRKNi+7uDgcBT8ctEMMngt7fdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=;
 b=TK07zNKGslP2KhqKVzxoeyTwg1Qle+HOi25zlhQWKzIA44dxDmN6rl7mDirR8WAlhuyob+VDt6icf+F+S4wthv3tybpsDxnSjPBfsd+ebaNVVhCHx/srLPxvPlWqVSp3O+3+tpe6ZOahKL8AhN8kjL+5U5DBs6bURFVwAnUQgQtyJZyAYuI71peG0CtydcwbMMyc8LmOhHlw53jbFMKLJ5QVK3gOWYa1vmd3jY30eB4vg9DyR+MFwpd4VX76AwJK4toKJFLNJwJgI/iT+2wYC0CV336FVCsIWDZRYCa/hLw4LwTAxraExiyVvTWIBqCbOo4Pvhvj7AdlQepEfaF4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmv5FDc3RzrOokFUxRHlDIsh4sYkP4dtEiig56W4r38=;
 b=cJ37JZRjMr0u0Cm829NDYl8Qlp1aWHlwO8uDw0y7HH6aNrHsL/gDchH+CwqE6qD9WlRBi/8gK0nSd4Mi8i5+d8F+Hurt5eZGcr5ty1LFO7zkvBYIbn5Lv4cAIvf6/7YVeEHOuqz8hZm1LTLSSDSQE4JudigkYy5Q11oF/pwBddP9DB5tqFaAlwDp+Y6cAUYEBiaZOSHcvJds75t7mjlx3V3ZZs+SLDbFB2BUDeLA5Nbxdvf/swUfw9n7YR7LMJU37GNDt7hp7LGLQp2UCW/cbzGthKwH1Or/TCJ4AWf82hXBMUd8RuY+2iUp18POTJJSwyU7eZFOuSivDPoqtCssVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:06 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:06 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 06/11] pinctrl: airoha: an7583: fix incorrect led mapping in phy4_led1 pin function
Date: Sat,  6 Jun 2026 05:03:37 +0300
Message-ID: <20260606020342.1256509-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 192535aa-2e20-4408-06d8-08dec36fe372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: bQpzYqULgkf9zdNZO1jbS6/ylec3iMwUvQ6gGaGyGOislsD9KSeRN4ItlpIQaYl866VglTt5p3zHvrU6nG6aa2Lzn0g5SO8uLas7zlN15YANp3VvDQZl7J5dXVjC1/JVr39oeKJm9y3auUNbRdXRyOn1RKYOexomusiRyeg/QLSg78in8rQJpQwdqP3nMKFshrLybhlzKNcBPTLTivwfkWK0ZBIzY1XyavYBCQ4Yhycvxddfw8Dip6qfBkxb+YpU9SiHRAqB2jECnIV0OgZyxBHN37bK+olfIKhINg1WxuLUzaJq2gTvlquPEiZ8aTJQ1NvFAAgvs68K0WLpXC2hKCOA8kIEIgC3q/RIHpRxcXHeAoANPXJBpYEpIHyieiaU2ms7cv9bdNPT53ou8WmW0JyNsQPQa7V5DNlEf8yAHCLJT/nWdBAVu7jrPFrcB7/J1pJQ+hBKdAQHo7y++l7UblhVwwRMbgbgxRJmqdBlyP5OgNIKPF7hKyedp7XkopQBB169r+Rr9mhPtt3uz2OM3Mr+d12WNtWc334bMoxR9hPKiBjQ0vTnixG5Ov3jg625PpXbVL267q1Sx2QYY66srmjOlF/ZxMkvhmtBf10Voo2+XnmdSJ0AkNZJhwyiz8VwjJXpWJz6z2fkvRKqrH2vVEYaLyKs5l94sLH/jTzzyRwLUdstfn86U/r+7BDcuLS1lJHEuw+ikAXqKhigs8MnilCcz9aJNhhHU9+f9c3d3ofzpMWxJxmurInzoYZTeMl4pt2h3irF/tBUWCChRd0MJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z9JjNLwjvhQFW4Lk+Ex1yn2a+zXEYHd+iFp57NInMAHLvi0XKYqs7SPKJagS?=
 =?us-ascii?Q?wRXUgPIDtZd0wdsv+5DbDz3+2wHLFkVAUbCQC+dmtnl+Fwsk+n2Z7ce7OyN5?=
 =?us-ascii?Q?CsZ0RNmxpHijOI7hvBxmChIn0LUV7lJqH+gV4+ARfJrFoB4TKhx5xms1bLF2?=
 =?us-ascii?Q?wAHDqQs4wD7q0z8lLkR4wrBV3i6ljrCCeljRe0sDvnBpdt30BHyZaMnbiH2C?=
 =?us-ascii?Q?gA9G/eXXwmv4sQZr2qqLdwjXETyTqs1AbALDi/jQiLrSxgmp+SnpzJKES+JZ?=
 =?us-ascii?Q?9FI0+L598NmCkHlQRlQmD2MVftZeXyWc9eA92tZKAeGITchT5b5DmzHtyA6l?=
 =?us-ascii?Q?+qNlSbijZGdihIOngqShAM8ofkvXN16dwgEMq+kmmN1/yuFHlLlRHFPfwEmZ?=
 =?us-ascii?Q?fPIsV4fAbVLUBnRShiJtvWGOQzno0KXEsk6mp9mDhrFBWArWVsotu7mqwy6W?=
 =?us-ascii?Q?EhMIc1LtJBmFKTAsytzflLiOmGgkBOeXmFAyGytuNTS0z9vOAjf+/TcPt7QU?=
 =?us-ascii?Q?QktD//Zugd7WqsOfViiCr4usVHyhiKFU8fOiZFCHnEFWBQaOgHRUeFVzVYIh?=
 =?us-ascii?Q?lHoBwell/pap6SRKtpU9RSI02fx+i2ieRDTEHdMfOiJXA0VBIsOPx521g81d?=
 =?us-ascii?Q?9x0zycA5pfmGRpaCNeSiSdFQbceJQkHYd4PniOmBcRvDnE40CY+6d4y/SWbh?=
 =?us-ascii?Q?MZQnWdTCTzw35WTCWpzQilARCnQcRUTa3ECaDQOUuLyyrakWWKZfgKy/hI8t?=
 =?us-ascii?Q?0hIt8tTd3f6YVq4vRv+Xw1Q3UjFYnA5z5kANyEAJx7j9CDJ5XpMIbw4rdhIv?=
 =?us-ascii?Q?R6LJOyHrjYUve/499a3ytt+6cI9Ig8jFzturso3YkexzPplmtFfrIeENdPZb?=
 =?us-ascii?Q?ttgCwEfBn9AImgFeYTXEBkOcPUqAu+k5TSOs8lvzZXM7xftH5CLxM26lPo70?=
 =?us-ascii?Q?+BlwjOsgskbyhCAvq/M+YiNkhgL0BOU8V738GShetHw1wfhxgIJgNU9ClRgx?=
 =?us-ascii?Q?p7eOnQ8Zn1KM3m0CdDXtFaAMce5wwwNNaYy/Z+alXfhsAFXd5WpCYpplhwYQ?=
 =?us-ascii?Q?thipR5udGCV+/Y76J6djZ319dhnSfuZN37nWkYhChBmtw4jmHNwAYAPgkh/D?=
 =?us-ascii?Q?fWKEbJuWGshnY6OliV3DEQz3lg3PKvDT6EYPnoPzQtGG9xnE88YALOgyVLkE?=
 =?us-ascii?Q?QvP4d2hAdwUzxaggOmCBJgi4mfpGSC4z2/YilPyryBoMgHqF+HtioriOWjkX?=
 =?us-ascii?Q?RoCzOrJbJVcu8InzPJxLHgCUtkMk50EoUpL1+zlhyoTzNDYLFjZBUHl2wqvo?=
 =?us-ascii?Q?vLJSXiQnUN+EsqiF1tQd5dcgfIzb02eq9reANgoHdywh4fbJrlCe3oU+iiW5?=
 =?us-ascii?Q?GF4In9P3/17YaO8IrVRkfXnoY+YyWHVGsmM2+kt4Mh63VvyENrqAlf20HgEq?=
 =?us-ascii?Q?NyjQ+ybdDOcyXTXvkN7k4VLYyEIlfl97nI1v1UNwgiAvcqdQMm6T6il/HxCK?=
 =?us-ascii?Q?6idYz9IjwxJcE3f/MKtJFD3KkYM/lnoZSNK7w8AQ2Znr7exGYPRAlexQQoEo?=
 =?us-ascii?Q?G6LkgwDq4XBxkCKhqF1eRuE+WcWeJShHtfpEkgnG4w4vzuoIy6pEl5A78U0D?=
 =?us-ascii?Q?q/ynhhvg+/6ZInOvRm0gQigVGxuujKCBN6snbFmEPPRDxTs+8FDpKhICUVl3?=
 =?us-ascii?Q?XxsxqjH/ch1fowJ/a99o4K0YhgFBPmErtbui1eUA6Q2bZaii3DxD01iz2lYD?=
 =?us-ascii?Q?tXuDPib+zGqI3NvTedFziHTm9in6Y0E=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 192535aa-2e20-4408-06d8-08dec36fe372
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:05.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAipO3XW//o5alzIXO/6++mP6rUIAX34M+pPF6Fsx10uf63PhW8Qdd5YavGFQTF09FjKvZljDw5js6KyczjuB/93l57PjitUbaW13DklDn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_190418_217414_A7D477D6 
X-CRM114-Status: UNSURE (   9.48  )
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

phy4_led1 pin function maps led incorrectly. It uses the same map as
phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 9497f5110f61..9be759f08b18 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1710,13 +1710,13 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-- 
2.53.0


