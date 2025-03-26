Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D4C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IpZqI3nXfgNLmwZAq44l6QT+KM6WKem393AmhzEw5g=; b=OVP9dQoA7vqso6knfzAdmGZlIm
	kjlY3nrLADxLQ2K1zcQF1njD436XD/2vasWItRQ/qKwzlI77jS0pd0IXTMwu9/l6vl/cXRQsTxKWJ
	LGbP3RxePIXDSbYbBxvWbl4mUedLuV1XWFUAVcn5IR8fidQRbhf2gAPVhyA6r/JJmLhyPuadjYORr
	oH3s8peEjf+PCZe0LcgGUdyNlcujXBp3Wm4FPSqGOACXtsTZnAXxJ5s+vPtzOI1Q8emVKmzD9ZLsL
	p/y9m/TMFiBoe9icj+RpJlsld2QLLUjRlJgK3VdGuN2SUT3zePfrEjXS3KDEml1ZQsdwhcuMxeeIj
	OZb934JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLuJ-00000007tUC-1XDD;
	Wed, 26 Mar 2025 08:14:39 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLh5-00000007rAL-1e8y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 08:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvj1ZKGJQyXMvqUSJY3NP8eBttQ8JVfFFDkn0O4zSqaEvETdjPoifeAf4UqZgWrCTrLROoZfDRf/HCgQuWLdVYGNbnMKrMy08FdYQHuJPVLT1oEEI/f4eJl/IJLKdOBiU+h8+YnvBRtmoJtmx+ONTgx/+YA1PbbduSVdQYWFc6+yrEIU3KgVr4xUSUM4BMWevV93Qj5PWDYUAce9I/dZ/kEsTPeCwognIqWvWElpdbDpKrCF3aECcBwbKhETl1L+xbahl9/3Amu581e18k6j3PttJgSKTtWxRc/MZmsUIb9CovNVqvqaPhGKcp2Ip8OTalNtSytUS4TEl64ZJ1ckHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IpZqI3nXfgNLmwZAq44l6QT+KM6WKem393AmhzEw5g=;
 b=d6MuXtFQ4tOl951foQlHrt6aKJGOH6yz6TALaDZRjuXk2WukLdoVp/TIfmluk0CW76xaVakzJcNrlEo14dDGk4mvM+RexDosdVtyyZD9EQu9PZmVAdYwETdqBTtb316XYUhkeURL92HyKiuqvjAdnj8qDdJ+WlM2C7DJLQ464cXb++MmNUJkMigOhLzrdu+RPwaYI9hiBRKLHUg8+RwclXPBgl1V4UcY6q2HGvGV4T6nouQnSm+Z4RW+2crEObrtWqX+7FZlQI6qL/6z1uBNV0ArwMqyRA+EVHJF46ykOZjSyQZpVMFhCi4LZ+Imd0yRchjPFktTsggivBo3rjP78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IpZqI3nXfgNLmwZAq44l6QT+KM6WKem393AmhzEw5g=;
 b=iGeoBiIT2X6gfnU9ngFr1307SkBNePXUDtvKXP7hBdOXifve45mjAb3t/EeMv6hhT6JeCCu7p/ihHwpPNcKIxSfYoMkJpocmPtAeY6V/3aeirkt9SI6WzeYx3ABBzRxDv4S3WZtQPBNxAk+bLPzq6Xm4ZExgmyO5bHLQQqbVKNCR//5owIjJQb9vOfQ0GyEywnhECxNkYnt/plaKUtqOFGJWr+1z/Z8fs/2uBh2pA0xaggR+olev9WkCnnwPclqXRtG1VeAE4YVbCvsDQ6FNSbmKBZTnfwwKJi0BvSrMREj0ecgiaZLHO5LgDh1b/GLrZrwHbVukPPYmSTi0TKQKIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by AM9PR04MB8828.eurprd04.prod.outlook.com (2603:10a6:20b:40b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 08:00:57 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 08:00:57 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
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
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 5/6] PCI: imx6: Add PLL clock lock check for i.MX95 PCIe
Date: Wed, 26 Mar 2025 15:59:14 +0800
Message-Id: <20250326075915.4073725-6-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250326075915.4073725-1-hongxing.zhu@nxp.com>
References: <20250326075915.4073725-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|AM9PR04MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bc1ac7-3fcb-45b1-a3e0-08dd6c3c56d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rxGX4kuDONUziv0z6WJxARTinRVMVwXQSn7xE26qKMTUtaukZV7tcb+oEZhs?=
 =?us-ascii?Q?fSfBiRX7NNj4C4NBUCGcxk6IRAGZAP4A8xacvbySkO7BOX/BFghnhe9QjfWz?=
 =?us-ascii?Q?yBSj6rw/rX2f+uUQ9uqRgHbOWimnNXHCSKB4KJcG8Qcj3Ie1Kow2sKPaPIUD?=
 =?us-ascii?Q?yWmP1+zX1iPc0NC8UBWbz4AP5HiItkTOMMFED5/kv6Ct2GQ2eZEeWgv1Fm9x?=
 =?us-ascii?Q?U9wFeKNWPvJNa4+Qz0jl0DSzYZ1jdgSmHJD/GXvHJeKg9oFX58WWHUWnR71o?=
 =?us-ascii?Q?wiW+xwxZji4ZiXIAwrbkbTHFWBCamgNc3TOrBKJHYCGm95XIvAy9xa8Q0gAv?=
 =?us-ascii?Q?OdWrfV3h2SUITTFlzwXCLIFVvsI1DFbeBmINzDzRHN6RBm0O9X2L1Xx2gl4d?=
 =?us-ascii?Q?VKTQZ/YtcVsxqdu6UZLELmNqVXoWfkDMFJ+dIyG8citDKudbd5uFXJxRp7dL?=
 =?us-ascii?Q?6d7oK7wOzzS5+Gwlp2m3AKelY2WybHnvrl/fOqzm1fomjLnud0TQmgq9gPQx?=
 =?us-ascii?Q?mtiklOUj+fwIdf967UAxSwntmNvKEapl6AxUGUSS4AW1tl/8lcQ5fPf99VaH?=
 =?us-ascii?Q?n3+2wfIszFin/zLZjn3AegxOr+IdsXtf2aNRN6CB+EUqZsAHUHAzln19hyqf?=
 =?us-ascii?Q?PmymrzpdO/H1jI1nrjaf7/6eLBPSam9N5qlXA9nFa9YZDLJRRyzaMM1qXGWJ?=
 =?us-ascii?Q?j2DXYPpXS3Cfa9090C1GLvHfNZKXka55urD09ESklV0SyZ5+e4dbwx+hckRk?=
 =?us-ascii?Q?L9S539qJce/UrczR74QnpE+gMCIgfnIHGYxdBeLXjgeibb/VkdsuA2fI7err?=
 =?us-ascii?Q?+ShXiUbSn00BrGSACfM8bQx8dkW3Sk8ZDpHD0iR3enVOXly3Q3UmQopFfAIh?=
 =?us-ascii?Q?l8lrPcQJ2IgOoiQk2zpBF9Rm73e79h8l0E2x9OmJuVQK0wSuL7ha5RdUQpVn?=
 =?us-ascii?Q?4Plr+s9y3uB5Bf4uZ/xRL3u5p2o4pSNgaHGU25u9Tccbiaimj9m2NBldsKQf?=
 =?us-ascii?Q?WakH6eXzxOO1Ak2XSpay+TDFP3Vgb54fQNL5X+VVJhqWJK1uPQ0C76O53qDN?=
 =?us-ascii?Q?qekyDnLcRhEo15ITvgEj/4nh3V2OEVFdg63RNWEvxnt6YITapPgnJuDXgEiy?=
 =?us-ascii?Q?XRHJzelDJ3bLMRT28VT0SG+wiMs6hlXRaUPNmvUzhc2tzzUvA5JH4QibAn44?=
 =?us-ascii?Q?orNj89CaQhTywTs5QmCagMSuZMgqWhhrqoDizJQzuy0oVKfhMPhNpE5fSRk8?=
 =?us-ascii?Q?keXwM2sj4rl0FWo7VVUXovOHpZJIRfQakwcZNe8KbkoEjrTZNfXkulAnt/xe?=
 =?us-ascii?Q?9e7Xr9WIT4a8H/SWwgXrUACVDKqX19zqjxytus7U/y7dY/PhT5Qw+MuI7djN?=
 =?us-ascii?Q?IhW9rnasmQxIPX2TXwR6JWeFcm4unZcMhJZNvBZMHj51cCysKzHbi5EIdVR1?=
 =?us-ascii?Q?qWDWfhAgZEaL6IQ8BQ3ky/vXwS0EXmxqcjw8yGZq+U0aFc43Swd45Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vILVjFJyjL6Q5A5x8zybxneOOoTNc2xjpBD14w2ksXAMTg+EpRX0THlR6fr+?=
 =?us-ascii?Q?g8DiBomJAiIEBtmACP/F5b3EP0xuQK4l8eIVg8kKyELc8UDxIRWlTWs/gmxE?=
 =?us-ascii?Q?lfDjtAv4IoZjRWMYglOjx6CGJb5b7arqy6qnX2PZgcZzvIk8k8XmUyq68POe?=
 =?us-ascii?Q?NSrtB2YcDE0BxgElO/1wn+ES2BFT/Edezll6/P5PH6HtT2Vndbqh+QhLxvZF?=
 =?us-ascii?Q?4G9mDbjP+7nJjGYQvzvVOIRdb5JA5O3jq+2Tcbfm47c/meAzUGBfM4kqjrhI?=
 =?us-ascii?Q?YkzURdcTxVEOUbbmDiDRfZwoRTpWGfeHhoL0bDaUiuAZEM6SSZ9z6puOBdC7?=
 =?us-ascii?Q?eapb3ODKBlaC9j8GTkCP+tCJrODErKN+Ar23pWx8fEhX8pZIXh4YFSSD+PE5?=
 =?us-ascii?Q?ERIN3U8LO1oLPE3Ti3R6nrqJC+Y9EwkICcF3BaDUouEQyMYgKo+WRqb46Rbj?=
 =?us-ascii?Q?MO+28MlsV8+/lit9pwQpoPzxqqPNwaqEi+hZglT2O9C0uDUtd4NhDGoRua3q?=
 =?us-ascii?Q?Tbt+HFPZplCnTxuTrp3VuCKaGFHMRVuNrGRbl8HZhjoYXJn0NQSm6gDwmGWh?=
 =?us-ascii?Q?Tc2jNJ2xVpFGj5UpXKhBKqN3Bizy5OA/6On31HB8O2UhQg8dEYIYDyXff0Jj?=
 =?us-ascii?Q?9CHdOdlfGdgiQy+nhkW/lnl9xF+04SDEeB2RqKORolUWbhHFBxqftk5oodac?=
 =?us-ascii?Q?8lZMLkQG3iJm7+uzgNIKp2Qukuw2wWQavRu5aa9RniwhcaLnMZ8JV0j5uj9n?=
 =?us-ascii?Q?eSFjvcePL68ZPgEGkNBshsLA+Ia4dqy0ErrbG84FMtj7/+VxHV9FrQLrTCkq?=
 =?us-ascii?Q?64IhCdF4ObmjIT2BZba+QaeNOK/GCwOgXoz6lMSTkIRSyVKWXV+Bhx3jPvuN?=
 =?us-ascii?Q?w1vJvWTqYd77FQ4lo/zCjRmR3CSm8lqckc/IOF00BmamDr7awJBwMqO5DyY3?=
 =?us-ascii?Q?vqYxPDe5Ve8Ak5yiMQ4HoYiUrXhcA01FM+dVbEDy46rtLr1eUrZaAKcr7a9Q?=
 =?us-ascii?Q?MT6+CDsd+gECNr3P6bzrqJAt3gn9Ud3j1/x4tzfEaUGQSyUsngKZTsex+Pb2?=
 =?us-ascii?Q?AQsym2eYEQTt3noNIXUH70NfH0EGdZtH76nEcZj+pJwv1dcEgAk9S98KyTkE?=
 =?us-ascii?Q?mQVt9Q9clk+W4V1IMhiOfJTp1uH++2Fbs1aKSnUT6YLBQyzQG4YEg51kn4cf?=
 =?us-ascii?Q?bW37V3oQYyVEqDyA1ukQ5pFKDmZFcCxYb8OONUvCJ0mhHHvZ+EfqCrvowyuT?=
 =?us-ascii?Q?UGOsHSzFAMnoqXkRXHQEXTb0MoXBpOOgIY3qj9x+zDvOvzMeZu3k2H9U3oRU?=
 =?us-ascii?Q?HfL5Ok/W6Mut5C8g89gtjuuPDRHusG/xdhp8HiZNqHyY96eWuAAv/r9nQNHZ?=
 =?us-ascii?Q?5YPVAMvWDxRUcCfdK50sJFV3sJ1CmO2RpoBXBCqRxnQDLbhkW6KwncMUgUZL?=
 =?us-ascii?Q?mpaKUAeoq1aTmzSI0Hnpfqdcq2t0Gb/+gKYC+zE2vo610OcqtWTt/OekTYxl?=
 =?us-ascii?Q?6/WtlzfflopWVI4kwMIjxrvu2JCp/g9i2oXsmNyiAqZMDJmQI2NWgMKP/DlP?=
 =?us-ascii?Q?x3sjX15SvV1moqNqwhRjXan2IpEHq2a+1SuAn8DT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bc1ac7-3fcb-45b1-a3e0-08dd6c3c56d9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 08:00:56.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGMBZGZmxeolpbaeO4JwQSuBhl3pAJ3k/wgPsWaC0GAkCtkuyajYTQB8PXZBp+dWf21bBxanba84qS+wS40Q1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_010059_431763_18DBBDB1 
X-CRM114-Status: GOOD (  14.92  )
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

Add PLL clock lock check for i.MX95 PCIe.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 28 +++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 42683d6be9f2..1c8834fbcfd5 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -45,6 +45,9 @@
 #define IMX95_PCIE_PHY_GEN_CTRL			0x0
 #define IMX95_PCIE_REF_USE_PAD			BIT(17)
 
+#define IMX95_PCIE_PHY_MPLLA_CTRL		0x10
+#define IMX95_PCIE_PHY_MPLL_STATE		BIT(30)
+
 #define IMX95_PCIE_SS_RW_REG_0			0xf0
 #define IMX95_PCIE_REF_CLKEN			BIT(23)
 #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
@@ -478,6 +481,23 @@ static void imx7d_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
 		dev_err(dev, "PCIe PLL lock timeout\n");
 }
 
+static int imx95_pcie_wait_for_phy_pll_lock(struct imx_pcie *imx_pcie)
+{
+	u32 val;
+	struct device *dev = imx_pcie->pci->dev;
+
+	if (regmap_read_poll_timeout(imx_pcie->iomuxc_gpr,
+				     IMX95_PCIE_PHY_MPLLA_CTRL, val,
+				     val & IMX95_PCIE_PHY_MPLL_STATE,
+				     PHY_PLL_LOCK_WAIT_USLEEP_MAX,
+				     PHY_PLL_LOCK_WAIT_TIMEOUT)) {
+		dev_err(dev, "PCIe PLL lock timeout\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int imx_setup_phy_mpll(struct imx_pcie *imx_pcie)
 {
 	unsigned long phy_rate = 0;
@@ -821,6 +841,8 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 		regmap_clear_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
 				  IMX95_PCIE_COLD_RST);
 		udelay(10);
+	} else {
+		return imx95_pcie_wait_for_phy_pll_lock(imx_pcie);
 	}
 
 	return 0;
@@ -840,11 +862,13 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 
 static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 {
+	int ret = 0;
+
 	reset_control_deassert(imx_pcie->pciephy_reset);
 	reset_control_deassert(imx_pcie->apps_reset);
 
 	if (imx_pcie->drvdata->core_reset)
-		imx_pcie->drvdata->core_reset(imx_pcie, false);
+		ret = imx_pcie->drvdata->core_reset(imx_pcie, false);
 
 	/* Some boards don't have PCIe reset GPIO. */
 	if (imx_pcie->reset_gpiod) {
@@ -854,7 +878,7 @@ static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 		msleep(100);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int imx_pcie_wait_for_speed_change(struct imx_pcie *imx_pcie)
-- 
2.37.1


