Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF43FCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7s9u6AyOTta0SQ5DqeQNnH2oq8JyThk/dsB0olREu8=; b=4emyzITb2HXcpMci3PNqG53F+6
	somwgG9XVFknaH3HjejasUPOO6d4WvAbX3JJsXZ8mqxnqYKbcNWP3dtdkAnn5Q7vNTf1VnnUKskDj
	FNdtCajcLzOnFXAqVp4fRkoQ6VPaTGWE4Q+hAPgxj4nfm1+lZv6ddlbD8OMZ89QeHKqafxWijGVt9
	i0FovRH9hlooG0zeD6bUloBWWMwKdW9QPgOt5KbJdnCO1nWXSXeVNLFBYvNAdo5aXyAsW1S5qrHXs
	EOx9VtfhyqW6FU0aEzFVthZwY8cf5vDwgDxllEXXaQXYbPxE3kufPQK/nMIX5BNmtpERibaUxx3f0
	Ej+QUYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMTz-0000000G5Kl-2Qg9;
	Tue, 02 Sep 2025 08:35:15 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLyl-0000000Fu4n-0PiJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:03:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCI9/SI9C8SCklHSuoS/4QPBK/Oq3MyqHpkZBAbWJj8YoetRsNsDLCaQI9SBxlwm4RZf2bFEBmy0R1rSg/IpzEVsRTywNjJrvyQ6ymXX3aiCoM5lIq0+cDFH0b8+Mdt3+Pp/FMi5UN7N9SDMKcIZTDZXUkmSeDrEfiezFKvRcmJVBRnrZtO6PIF0RQ/8dDrzJjjUSBn506ArtFtv89X1CcpIpiistHcrtebN3hT+fl0P5sdLyTn0q9sBJcHRUzTROiBrFo0Ed7uo9JusKBckv3mUvgwHIMlT0U7zqKF2qAJmLmL1N7a27O/OBIzMe3SmjnmedC3FdC0x0WwO9pvnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7s9u6AyOTta0SQ5DqeQNnH2oq8JyThk/dsB0olREu8=;
 b=dEkFeijiYofsPVJlG1YCdO53eY7bGec7Qwk+EOYbw9b/EHuWG7T1KuD7EUcF70NI5zlQXBaLwnVcBIswe3xR2hwqITNQrYkXfs/LJXsD9yDfR7sx7jFZhFZXMT4v4t3Es3PuCZXQt33WoHNmIcVz9xHCam+Ad5VnymUrJI2baOcF2ZeW3mTn8pkdXESiLTGJR9bBpeSqYBrkjfB2m3x8/whLlJkTfROFYi3ZCywtmDt7j6vfsyiIraXVTr+xCj9arUNbkSp+ntq9fo87mWqmHyyGZgIjqoP3YKvBcUbMY8aVUSsVGH5W4lY7MAn4xqh/8fwCoKttzxI0e/Oh1nyjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7s9u6AyOTta0SQ5DqeQNnH2oq8JyThk/dsB0olREu8=;
 b=HKxXUvl5SjvP11InnE9ilm0asyxnjiem4QgfehCsQZ21pDMZ3dipMyq3mLYDdratR3qFy7S8/WsHUMe32IK6KkaJbcUz6i32x/U+0x5LSKOrhI83n2LhURulJEuhrXKDk9l8aerFbxUPssxQER1FvKiXCRkdLU0q1bOg9vwxT1hVrGE7cguW18u0m1N4LtOPA2Kc37xvN/uTvu7V6C1crqme3rPguPt11/CWrrQUQvwjy40wOC6e4IRjCQK9txkTLiDUug7YqGO1GQzWN6gBJamUoj5K3MIkiI5nX2M5bdO/2ivo/APf206QTfwO7yQ9Q3m0TZe+e9lkpob7fetJAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.14; Tue, 2 Sep
 2025 08:02:54 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 08:02:54 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	jingoohan1@gmail.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 4/6] PCI: imx6: Don't poll LTSSM state of i.MX7D PCIe in PM operations
Date: Tue,  2 Sep 2025 16:01:49 +0800
Message-Id: <20250902080151.3748965-5-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
References: <20250902080151.3748965-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:4:7c::15) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|DB9PR04MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: af405955-fee9-4f38-47a0-08dde9f71edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ldFDLUKO3NimWCLNWsBxNI+TxW6gJwAGc6YfYZBCTS0xmH6gRfu4LYQc1DwQ?=
 =?us-ascii?Q?crjoVx1CvKR/kbDhs25mQ2ef5obsonLjagzXwwQKUKKzaOVR4Hw3prPC7JGr?=
 =?us-ascii?Q?ntBwIji6LOO6NNFjJiHK9dU1FQMNDVG2VUROwYmDRTxssCq+ZU7i5SEFkWuG?=
 =?us-ascii?Q?TeVhR6CdBBrefVb2EHhWLMo22V+Wk1rxV9gL1i82pIDF0L2uvKybKufkg3kp?=
 =?us-ascii?Q?LHLfqZn+VouE1SSduago5c/u9k1h2rj9qXyU0fPnVLup0MKw39CGCJyjufIM?=
 =?us-ascii?Q?YgbWaA2V/nAWBC+XVLWFgYrC5SriMEaSL6T+cBdohTRZiMq7eQ6hjTyQpEKx?=
 =?us-ascii?Q?PkaEzWUhFYBuJFMweRvGCoJu5JbT9k5jzvSvxH/a3cFAQiUOmzLYQQfY/oIB?=
 =?us-ascii?Q?9CVeZ4o4FOLn7v1mdbuM9a3eITOv2dLggbAod3RZL+zW3yB6tgjmUIsH7Sxw?=
 =?us-ascii?Q?MkUl/TtlbkUGnlzIviAFNad1QzdIyVDaqk1veauW8SSn8wzmWcZaQGiJMmf9?=
 =?us-ascii?Q?MrdpKeHr/nOf1S5s315/k9Wk6uI9wXyDshM6L5FCfmg20yOFh24tLIDNOeWw?=
 =?us-ascii?Q?8hIoYxWoLOXH/jjXTQdO9OBiogT2qmhNjKTwOuiZzXCMKK+vpgEyA9yeYQ40?=
 =?us-ascii?Q?BZl4OzMqwVP6F59HXHDhVihz6CI/pEQ7a5KkpTMtwnUPtdGP8C3I1BksRxsY?=
 =?us-ascii?Q?HbIwAgXkpCon+IbwPnVUlkzqTNYGGHZ84xc92E/2MrSMsgZhRr/L4yWzcJEE?=
 =?us-ascii?Q?nS+PyQkuGPypzFmcPH/86wzaaMcUw3vCA8/xnDCfvLv7aMWX5hG/3MJhZzTj?=
 =?us-ascii?Q?K6rVJh2Z134tWolf12SjS6C4V7jomK+47YYV0EeqmZRTutmAYkTdf96BMiOB?=
 =?us-ascii?Q?tYUBql8bnrwo8ZHzF8jUC5rPO4wUqTIOrF6UxrYOsZilXOANaZSYuzjQeGSa?=
 =?us-ascii?Q?jAqCocYvG7jl95QFNi8Vvi1+Bcm1+VeElxrwnc7n9hpK2M6HifHtL4CgN3b3?=
 =?us-ascii?Q?uKqz/KkRp/XQDZ/4NgmwfrYj8gIL3cp9mPB+2YRkYpJuyPsumFhVVuzLiQgj?=
 =?us-ascii?Q?XHCPkvPdOL1Scjf21dI0GgPELtVc/3CabIsvvZi+CCTT7W5UtBSLKTiEHUUZ?=
 =?us-ascii?Q?gSnRdUyhc1SIQJZswy/aEjwxESBPPN6ThJ3g16KIMX7e6rEi/41HPxMsb3Oj?=
 =?us-ascii?Q?hIbzfxCNwMn1IDtm/2vZ+3LZqdn/Lo6brKJrOmmXjauP+hBpF4T521t/rskj?=
 =?us-ascii?Q?HtO8Rut/DcYcFdKRK+TSZx72WLBPrQJoO846nmnFYCUSodRNDVuu96zpGFqp?=
 =?us-ascii?Q?eZy3MFPbBzpBnVdU7Eoc4XNnkgasFHI6R4w1uTU9aymyB7Q6uRyvNL6oaFmV?=
 =?us-ascii?Q?+PuOOngNiRH6gKqN0Z9zbdWTzmkcqtcCIWpRor5tjC/SxWoyl2xjdWBo/OcY?=
 =?us-ascii?Q?aw0kpIgh2xkV8yhur/e3MLRl7DSmJScqUOluC9YrykGZPBKKZaJjVKYeM6Qh?=
 =?us-ascii?Q?VXw8Mwb13+fE9UM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smicViD88urWAxvZCtyG7y1zwGfSksyAkQQtmczi550/kWGfaq/JAcGXd7YU?=
 =?us-ascii?Q?NFpUZWkdNcl2l+zZVtL7RLHtfAGiax3nPki+chfNLjXvWXFpFcn4d/fkog9d?=
 =?us-ascii?Q?YHbS3PevuEtgdPeheGSqAUD4z+QywzKm1c8MLNPEkHoq8omauJg6ant6W9YW?=
 =?us-ascii?Q?kMPJI8eU9epxUvHKh5osUQhecywe+LjEtX0et5Ig5Zi5lW0wM/i7I4w191BX?=
 =?us-ascii?Q?zFZ4wpz8mAqbXs5PylxyjJtySu0phPRVixzjmFZDsmerwuNRtKB9iD8qo+Qc?=
 =?us-ascii?Q?QAVSrrrw5pL7hwItYVFJISIi36+zG31LBL+cmIu1cTK7Nd/BdkYg5ZQ4++Vp?=
 =?us-ascii?Q?J9F1u3wIE9WS69yLfutNOl+a2uNBh9wIWtLvjrey8Q0V34bvhxQGoZePg1Aw?=
 =?us-ascii?Q?GLf8kkxdXMzrsEpTEvv5Fw+HP5MgW5igwX7MMw9drqOKjv+9ggmmWz/gbUql?=
 =?us-ascii?Q?VSf/PQKQG/MzW58ZYbWrNPCvLxCLjh9wps0qI1b1In8FiexZVvEJmPeJVxMG?=
 =?us-ascii?Q?OkoPJpN2lm9GwzWH9cP+lofbRaw9OEgzzVzJlPxC3tTLp80DlOlE2GF36Wrk?=
 =?us-ascii?Q?v+p/0yG1pGnWdBwBT8TRbFCoXnezKBanBuK51b7c4ZqpXJYHUj3bU6Fc8Qi8?=
 =?us-ascii?Q?aQ/n/FWm51pI8jYWkVZ87jBNtT2aN5+I+I7BC4qic0rHlyODtgfdJXMts0ks?=
 =?us-ascii?Q?8OmMntyxoQu7bZsQd+j1oW7fbSrVWaLuJBR52VS3k3rhAHrTOCCORW/gC4MD?=
 =?us-ascii?Q?QGlrzj6KSt0SE9bZr+x2PWXufMQMXresZpVRkb+g3EA08/TPsSBfY67yIVhr?=
 =?us-ascii?Q?6CrZeU6oNipGT/48K+zutAdyUj8Uw1B11Jn0qfRWqotX5T6u60D/XFr3PR1e?=
 =?us-ascii?Q?Hhm90javPg+z1dvwGVnmdBoVEkEXQl/HKeafnI9LyT3k6ITjXh0KWCd/VWNd?=
 =?us-ascii?Q?kJEUg+xRragK2A7Z/jXDqhHzURcnb1hk0x7pRmOpF4yH5mTb4t9KsmONkF4+?=
 =?us-ascii?Q?QB+e4iyVNQ2D6qL1qDR6rZjXyjw1sQWL6fRPBTjKlmQDUgLlPRgfZr9+czj6?=
 =?us-ascii?Q?m++qJVRFZxdXr5NT+P/l01WUHZpXoBTPKNGr9deWKfddwWGrXOowcD532Uku?=
 =?us-ascii?Q?WTM9rfpAIFv11Vl6aZOYYkD4r4XuJ7NYdm/rCSxX4KR6AIoH3Yr0lZydY15b?=
 =?us-ascii?Q?N+Q6nvFIlaM/36qS/je+XI2da3qYSvfVTTsJKhRgi+/T8IGO2wYIw2az0/2r?=
 =?us-ascii?Q?JXVDOfvxmV+rbGkyexC0RevKBnxak7Ad3pz1R9sTSqrU8oLXgLAkBNF0MYoo?=
 =?us-ascii?Q?OCcseVSRg32Q4XUgsaGQQxog+lFh6a1KSp2SVVnDdtXH5sknWdTdhJKa3d9d?=
 =?us-ascii?Q?2ZfkyfnSwlwHPx/H21C309YiJwL2pNkctXZLgJODKQhqUEbtVoF9mLLSjUum?=
 =?us-ascii?Q?+pVc6PBgcx/V2G+nRALZXKOeUcuPM87MoOyy2CFlguOk71+ogvZgBuMF17ZR?=
 =?us-ascii?Q?gOAWNH2gRO7IcyMBIcrtSlMxxceHBNO3JLMwx8EltieVjEel3MN1OrBU4YZF?=
 =?us-ascii?Q?MTa7797xpXxB5pNelMDU9vYhkI6euuRH2uSwlLAL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af405955-fee9-4f38-47a0-08dde9f71edd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 08:02:54.3898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1E9qqqC1wv+mN3BCYaWT4gEjdxQVsKYxXKG22K6Awrw0TbyE5utU7Zrr7NokLfQaTFdcVjjPeYtXssvhZRdeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_010259_139021_6EAA9FB1 
X-CRM114-Status: GOOD (  10.15  )
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

Add a quirk flag(QUIRK_NOL2POLL_IN_PM) for i.MX7D PCIe. Don't poll the
LTSSM states after issue the PME_Turn_Off message.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 18b97bd0462b..a59b5282c3cc 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1863,6 +1863,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.enable_ref_clk = imx7d_pcie_enable_ref_clk,
 		.core_reset = imx7d_pcie_core_reset,
+		.quirk = QUIRK_NOL2POLL_IN_PM,
 	},
 	[IMX8MQ] = {
 		.variant = IMX8MQ,
-- 
2.37.1


