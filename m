Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15AECCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 03:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQ9+FrUOLU6xs3hDj3/iLJUXMSzokLF5kMjQJ6ztkh8=; b=sdu11k7kjkp3Mbt8yG5nOFoLge
	eyqgR9aq/PP+Hx4/8zm19lvyhq6Y97waStHiEo6DJM5RmHiTVMhZ5gwd1HTOL+NvxFri5hzBy4zpG
	krc7n0fGtkYSSWCZew/XbfGFnyztzIxk9vD+XVhSsQAcVoqh9DpAuOAsFSf8/HQbyUQyuWCdh7XQF
	X71CcfFDo0lFlZ011KsTq7Fq2faeC8w0LI4PiQA61+Do7etXoTjD4PbDt0V9L46+9JfoyfU5GNgvn
	d0iBmxa0cnx3ssdcdAPFsmzQk+9US/IOw8iS5FJToTBz0a6pUrT8Xq8K+RodWY1/z3ylazJTpEW45
	nTx/2diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rqB-00000000IdQ-2NKl;
	Wed, 15 Oct 2025 03:06:15 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8rq9-00000000IZE-2qJi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 03:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+nWUO8APIfKD2KkvqICivmxHWLJgAKJK/W7D5xjZbzwjgNcjTfkqRYtHHk8TGf9mKaYxi6Bcl4G2WSby3YbrS+8E6JcBt8+/0G9R/fhTcoDh/PiTPo1tA0vGMzOj0L1XZeIcn5xQhMmmpsQ7eRQD65AkoRTqqTUwDCFs0ysEJx2obwjKUTxpFXSt3iI48O5qachLfj3ebpoy6Y0tuOI0T1MzXVrNFjQ6V6Lfl0cOktCGVc3wvqjs0ZOZNZhJzXIN5YH/MSe6Xtqo3/ZiX9GD7D4rDVIcoEWcxGJLqEOL+a6TYm93ICuOlbLjDgdxVNUOoMYll2vqMYdghdiMLxlbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ9+FrUOLU6xs3hDj3/iLJUXMSzokLF5kMjQJ6ztkh8=;
 b=J2hRKcekQn1QUfq/sjWnMO1zIXJcuzfW7kz//e/AZuLRaH3YFhy9yUYoMVAS4n1EAX/e5Fb3V0bbl34klU/mNQ2votEvAqorVbssWfeIENFh4eJXQgqfyvVmOg95R9vctTnrNLTYsxrCigU7g2KcfPh9Bi6/s1IIqmt6cmXdqjkhNhCWELiq5ry++Yspf7VyQJ5UlV7YTrSM3opIU45HzGveluZkPoyLgEvEM1k4pfZYXHllO9fiQgmNJN6dqOD6YzaJiRn9fWPX7dRB09hgx0mpIRH6JIzqTzPvKumSe85MUVgfN/5SWLHkPDPKPgXTZs3uDzxstIf2exA0M9Ajvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ9+FrUOLU6xs3hDj3/iLJUXMSzokLF5kMjQJ6ztkh8=;
 b=SK1LXEPJLOAgKJP22dXvNVt6zuQFBOW+9hyLtVNCSC03PJYxF51QjbbJRJxAe+T8Kdhg3L+takWm74wtQHBCpv2P1j3lSmDcko3IyEiQmZxaiU6nDl1kpj5WzyHokeXjdgPVNWsT92wRcaHxytHoIwEXolNuoABbRvKUeN981O1fgwEUYQ3ENul63k8a3FYwzANGztPE6HwgLWY3TaGeQesT8bU9tD8rK1EtkZdxsGCT0E9leHjgarqMlSwkb/jvndpwFm0yreiun7hlDDHxsvZxa0+mUzrkZ4CyL4IxB1SLnrp5W/k/iPXKuNRZtDEbm66IqAtHRchU1JnHi/AJ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6)
 by VI1PR04MB7006.eurprd04.prod.outlook.com (2603:10a6:803:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 15 Oct
 2025 03:06:07 +0000
Received: from DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1]) by DU2PR04MB8840.eurprd04.prod.outlook.com
 ([fe80::7c5d:60c1:2432:86a1%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 03:06:06 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v6 11/11] PCI: imx6: Add a callback to clear CLKREQ# override
Date: Wed, 15 Oct 2025 11:04:28 +0800
Message-Id: <20251015030428.2980427-12-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To DU2PR04MB8840.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8840:EE_|VI1PR04MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d760969-7c38-4292-3cd0-08de0b97c8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0CXfbYm8gYv1Snmh+0GUsZi2JC6SNxzdV9tQUqlKgGeOUNWL8pjBvKa2FJQ9?=
 =?us-ascii?Q?+64PvapPIbBPSLeGirP+aa8GeX02AdrH9k7VMXZMbIkPp93l+TzDgwa1QXyQ?=
 =?us-ascii?Q?bGA8zeMj7ZuqsJS/KzWgC7EgKwP3mMwA+BofTwnbHVOmlGBo1zIQSulH7i8m?=
 =?us-ascii?Q?wqSgWLZOl1PwZ362HpWDNHSP4jixPvx1C/QuUNtEG+LQUbJiar7VJQ4MVKrz?=
 =?us-ascii?Q?7nxyv5X0K6/3rwk80J7e2EUlvNeha1F2zE9i07OfGB4aZsEgQvi7P3IRzgcw?=
 =?us-ascii?Q?FEg4wXWsLoJeZbsvMswY0UcNwrNXgrrSr9Ug3wJDz9QaTmKEH3is46GuK0ak?=
 =?us-ascii?Q?pFGRh7AAPY3hT1xt+w/ZaTV0MarU4280sdR9e130dcheitLOCRiJ/aQ5SFDX?=
 =?us-ascii?Q?hbjcZsp50ALbxowlEIpGdH9oMXj9fPgnQEcCCJPHHItOQKibrr6JuOqNCGfr?=
 =?us-ascii?Q?c7yPcwEmnNRBTpA+D8Yk238/hvMgzkYJ1MNS/lc5QeiyOzWXC+K1t52uQw7c?=
 =?us-ascii?Q?d6GKVYK8HYSkGjBIaSDn/GvH7atXxOqGrq3fAh+9Z6d0mCJJswdvzMvKHrQR?=
 =?us-ascii?Q?IW3K77qx9h45zJ3/I+i4e0bS2W8eij1nhP+f81YNVix2Fso4sVAF1iF2G4pn?=
 =?us-ascii?Q?F4Z3ziU0EqILN4MgMP2ud7xrWovyOtG7zctGwnOxEKCYdL209yewmmEG2uww?=
 =?us-ascii?Q?Uzibe/FvHw0FtzBmMPPEFpJ5jseKyzdF1nu/lccqCDxtMamE36ilhnnuxGeI?=
 =?us-ascii?Q?O7os0MIp6MYzENY7YER7Qvq6AnaKvuWbMtvKlZZIetmEMs61JFFVClbQG07p?=
 =?us-ascii?Q?KHnErc2idlvtrVw0kwhUByoDWTf+YYfFNZSoxFvjl5jk1kXdSsHtanjf5/aD?=
 =?us-ascii?Q?PH8uZIhffLP7rQ+B4oAM1AucuGvo0C0Njug2KvjUB2EyS1CuynjXLB5h7FJb?=
 =?us-ascii?Q?bGp4IJKDszxp9EP6t6QslUCWJxA4amPtZ+dIDRe43BACkZstaiH0NapVRpLH?=
 =?us-ascii?Q?+Wfiwzh6Sz/uNBMuwkvY/mIBWdCHux/sObqraLsl0OsYYUXU7B43jOfYmW4B?=
 =?us-ascii?Q?762mqDCEnqUq7cfqoJ/vP6bObQqJ/LWvuHbIkvJYB0loaxXyMobDhMRGishJ?=
 =?us-ascii?Q?kRywdxK1cSC0aIKPvJ+UYLuKM7z6MKYDHAhtsDCCOYzVpFFLCU/EY/J9GOyO?=
 =?us-ascii?Q?UkS1CcS6gezU0ySLyFmurnZGkPvEdK4Ia1RrALpQvjsq0Mk/4tK3lRTVHOu5?=
 =?us-ascii?Q?zGjxv8srfrJbEhjuGmFdDPdFSNyN70sIVLNSq81uiJny60OjaDgw8EJhJO46?=
 =?us-ascii?Q?Fq8V5OEl8aVKPyG2xxRingg9nTd3adtlU0Chmgj1G6meyG+NiNt4+jHREQ8U?=
 =?us-ascii?Q?rwonhGw9ylhwYoqe3IDJ3y3uP3+kjgnFw4tbh1eZVtPJhD/Z9jSPiRFsMNUj?=
 =?us-ascii?Q?MwWJFfN3jDPVtUEFshS3TIWJZ2peAfsNOmGadUyduCqGWeFN/Eoe3of38VZ3?=
 =?us-ascii?Q?hr9yldRdvxF6E64hKX2nIMl0tOatmpiCOvaCW5pzaY59w1DWFgfuWzz0Kg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8840.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UAxU847J2Mr3T+GspjPDB8Q3TX0j4iNMtiX44Q8ZqIuAoEDx6Ecmf0ExDwa8?=
 =?us-ascii?Q?oz7iks1cSuHIVonxgnBmYYNVh5z9nfn+4sQKqXwfLj0q2tjqxpWYRkQtuCrU?=
 =?us-ascii?Q?/R5jCa8X3lz++UIu9z9B78X41ca8TRunhg+x1iRTCd1ClpIH0oVxoXt+HA96?=
 =?us-ascii?Q?m8gkdVyFhLSCBWoUh/9MW71maoTMw8j8eqaA1YvgeusEKW+27KXqSlriihB+?=
 =?us-ascii?Q?7sGlPO/+PDbrpw4hr27nNKXUEQ0l0JImcLNKncvL+o9959PTj6qYcLBeXIYp?=
 =?us-ascii?Q?+JQ2VQaEAWBcPU7AOjbS6t5QfgCfusIE2mhrzapkXiMtn8wnTHjYNHXnFhcZ?=
 =?us-ascii?Q?N/LdBkxF/m2ZhvrNulad/pSu5vvb8uTDthVkiUPjOmzl25hfMEgQ7zhJ6Sna?=
 =?us-ascii?Q?zQmbAcl9d7H/J/lYiTkpsJYzI9Jlc8q5Dd8pNzX0aYgA/YgW8JFAOJcabt7i?=
 =?us-ascii?Q?XxSUGNd1vHcv0rcUw6lWLfMDlotGQ8I5RfH7LCfTH79fDKmBs+stY4w6/Bo6?=
 =?us-ascii?Q?mv/aKecbSgkzSAd9ovAeOtfrZ+jGjL6TKygbNG6n4c9SFtJqyean+IR9M5Wo?=
 =?us-ascii?Q?hkdn/GJxDaJGxSbVzHU0HCt/KERV5b2EXxDd9OT5iQ2D9OsSlaA0F/Fmij2N?=
 =?us-ascii?Q?LgFi9QWHDVlscwrJdZai9dm2/dPCQwGH5ATJSuCTK9B+tCCvGIO4d1NodbRZ?=
 =?us-ascii?Q?Cwf6Tu8yEGRJ+hrY2jurGpFXh6ynuQHMKMssy8Lyw99y01eM1hrwwa8POx76?=
 =?us-ascii?Q?hH6243U1UZC8naoZMjKfcfoo8TtrVG/ainW65OQ2apwsZJwp375iPM28gU+C?=
 =?us-ascii?Q?+ozbH3fVCMHPeuFgCfrWAHtOuebRUYjRNglzvU5o6t+03313VxH3gzWhNf8A?=
 =?us-ascii?Q?yN4h8KC52SnlgYu70vCSl5LEVhXPY4WcfOcqE6tUcLv4Pqlo8OEsTnkKVfDp?=
 =?us-ascii?Q?QqdWlWRfFs7cAnTfq3tCyL6M1GST//KMxiYwl6c/txR5ag8PGBPZY+uPk6sH?=
 =?us-ascii?Q?ueejcGf7Z9Mlmk3xNPIfb33SNDLOUl0Pdu37tXUce8/mYWs+vJefiVMjanUi?=
 =?us-ascii?Q?CDz1uXJw+iDBiu6lzNE3JFM87A8Lr2YYVbqNw5RPiXPgJRt3lg/M6AhI6slj?=
 =?us-ascii?Q?+GPIqYQ3b7hv8aRys3P9qJaDEeIWZADOCYhGU7GuT+hZP7WSf1R97KPpbTKR?=
 =?us-ascii?Q?+oXvz0gYsNOQbptwen2ZssQS1ZRaWw4ZcOUj9dOjMsqcieXeQl2K0aZmI39z?=
 =?us-ascii?Q?W+Bhjt/Zzi3qHI1zV9+mfAlBj2lGs0qJ0i1yiM0a+GPIpjd5lUreTkSGb2Pg?=
 =?us-ascii?Q?5pSeWh6gy+8jHvj3iBSzBCqoKwZPL7sJsB1fKFV9z/S0guVG1rPtX0cfx1j5?=
 =?us-ascii?Q?TA2y8ZJviTA7RDCI2CqRhIZqBDIqyQxnDs1LXua0HJSfd1Yh1NucAOPCv2Xe?=
 =?us-ascii?Q?/bqvZOOuG4PMan19IwMKj5TG4LIfw/GEI5wNKrbiSfA8EiGAfKv/EgSjNKh8?=
 =?us-ascii?Q?xMTvCnUyC84GX1Nr7wlLhq+ejZ6IsKS8XR3FXof+Lmj2xD4dzDIbOWa1IdpA?=
 =?us-ascii?Q?bVWAlYaSmL819ht9iZtCLi3TX4jNIOMTIhmGdqac?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d760969-7c38-4292-3cd0-08de0b97c8ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8840.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 03:06:06.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3G0Nc6yZl7ptj2SUMhGJ2CSiOuMnhP9JlhC6tsPCwAdKBo64l49T6MymgOyZlSqKAG1/NEnwMyLd3zGkY3/nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_200613_727524_304A4ADB 
X-CRM114-Status: GOOD (  16.20  )
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

Clock Request is a reference clock request signal as defined by the PCIe
Mini CEM and M.2 specification; Also used by L1 PM Substates. But it's
an optional signal added in PCIe CEM r4.0, sec 2. The CLKREQ# support is
relied on the exact hardware board and device designs.

To support L1 PM Substates, add a callback to clear CLKREQ# override on
the boards that support CLKREQ# in the hardware designs.

The CLKREQ# override can be cleared safely when supports-clkreq is
present and PCIe link is up later. Because the CLKREQ# would be driven
low by the card at this time.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index aa5a4900d0eb6..7cd0dc62ffd3b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -138,6 +138,7 @@ struct imx_pcie_drvdata {
 	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
 	int (*core_reset)(struct imx_pcie *pcie, bool assert);
 	int (*wait_pll_lock)(struct imx_pcie *pcie);
+	void (*clr_clkreq_override)(struct imx_pcie *pcie);
 	const struct dw_pcie_host_ops *ops;
 };
 
@@ -151,6 +152,7 @@ struct imx_pcie {
 	struct gpio_desc	*reset_gpiod;
 	struct clk_bulk_data	*clks;
 	int			num_clks;
+	bool			supports_clkreq;
 	struct regmap		*iomuxc_gpr;
 	u16			msi_ctrl;
 	u32			controller_id;
@@ -729,6 +731,16 @@ static int imx95_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 	return 0;
 }
 
+static void imx8mm_pcie_clr_clkreq_override(struct imx_pcie *imx_pcie)
+{
+	imx8mm_pcie_clkreq_override(imx_pcie, false);
+}
+
+static void imx95_pcie_clr_clkreq_override(struct imx_pcie *imx_pcie)
+{
+	imx95_pcie_clkreq_override(imx_pcie, false);
+}
+
 static int imx_pcie_clk_enable(struct imx_pcie *imx_pcie)
 {
 	struct dw_pcie *pci = imx_pcie->pci;
@@ -1345,6 +1357,12 @@ static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
 		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 		dw_pcie_dbi_ro_wr_dis(pci);
 	}
+
+	/* Clear CLKREQ# override if supports_clkreq is true and link is up */
+	if (dw_pcie_link_up(pci) && imx_pcie->supports_clkreq) {
+		if (imx_pcie->drvdata->clr_clkreq_override)
+			imx_pcie->drvdata->clr_clkreq_override(imx_pcie);
+	}
 }
 
 /*
@@ -1763,6 +1781,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	/* Limit link speed */
 	pci->max_link_speed = 1;
 	of_property_read_u32(node, "fsl,max-link-speed", &pci->max_link_speed);
+	imx_pcie->supports_clkreq = of_property_read_bool(node, "supports-clkreq");
 
 	ret = devm_regulator_get_enable_optional(&pdev->dev, "vpcie3v3aux");
 	if (ret < 0 && ret != -ENODEV)
@@ -1896,6 +1915,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_mask[1] = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
 		.init_phy = imx8mq_pcie_init_phy,
 		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
+		.clr_clkreq_override = imx8mm_pcie_clr_clkreq_override,
 	},
 	[IMX8MM] = {
 		.variant = IMX8MM,
@@ -1906,6 +1926,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_off[0] = IOMUXC_GPR12,
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
+		.clr_clkreq_override = imx8mm_pcie_clr_clkreq_override,
 	},
 	[IMX8MP] = {
 		.variant = IMX8MP,
@@ -1916,6 +1937,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.mode_off[0] = IOMUXC_GPR12,
 		.mode_mask[0] = IMX6Q_GPR12_DEVICE_TYPE,
 		.enable_ref_clk = imx8mm_pcie_enable_ref_clk,
+		.clr_clkreq_override = imx8mm_pcie_clr_clkreq_override,
 	},
 	[IMX8Q] = {
 		.variant = IMX8Q,
@@ -1937,6 +1959,7 @@ static const struct imx_pcie_drvdata drvdata[] = {
 		.init_phy = imx95_pcie_init_phy,
 		.wait_pll_lock = imx95_pcie_wait_for_phy_pll_lock,
 		.enable_ref_clk = imx95_pcie_enable_ref_clk,
+		.clr_clkreq_override = imx95_pcie_clr_clkreq_override,
 	},
 	[IMX8MQ_EP] = {
 		.variant = IMX8MQ_EP,
-- 
2.37.1


