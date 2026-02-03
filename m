Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C75E7C714
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 01:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkenT3LhfDIBCAPJRkwElwxYCz/hdaK4NATOlRlu974=; b=dWHkJYlHCIQPehgtkfFL04brne
	DsjtG7VEkgIcZp1kVrA4m+GccPOTOcItSVgkSLtcJUd45hdZKkDP+qRpSVjoBm/JuD+eBY9PQDYKw
	lEAj6+K31gIIIhw6hxDh7B7zDp3eoq24lmF5+IaZpQ4lwNPFq/Gbdbc36OgvPKnF8RIXsnV1PUozF
	cB0ErSK6+Qi57OYMfrGHFxau/sZayO2Sh7C8T0Z4sMeD5Ds81fyPpsEVVxAS+zfqVJQ23BIuToPgS
	/H/iejNO1ShhEZTroYIcjUsYtSDFzWDD79Ryd3+X3VvCN30LIdnF+/b7Dy5AOu7IR80QeD7fBWjyr
	NLe1pP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5e8-00000005sZN-2A9m;
	Tue, 03 Feb 2026 01:56:04 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5e6-00000005sWQ-0IBv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 01:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC+9TJlMgsdEMgZ/1/zRauRnj2JpUrZLsKRkgZbSZhAOFUcO1vKKZnqYWsT6sRJ3vbW3cMkNESPzq56B9CZJxD00GMGASFEpasH6u+U5MdJ9tkxkk5z4m/F1xBoQQLWD+MBfXRD3IQiiMXacJU9EqoBNTUK83GIMhG8o1FzDilU2r/IMv3ilYzhT/eOkYMtEuTXRDEOETMfi9RbQprWi5a04d7DFRJyLL1BfU5iM1hz/046TiBa8jozQv96qT+OfBBiFJn28HeI6oBtnU7sQ7qBOBQqL0bMQ1RIGM0fxrhFKNloXGkeCMvcJCPkIg8hXY2VU7/7cd5lPPv/fl5k1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkenT3LhfDIBCAPJRkwElwxYCz/hdaK4NATOlRlu974=;
 b=h8NH6LHN/j4wapQuIWP/LTdILdp0ySK9qdv9PC07D8HytXlzROMoih+9ilZ39A1epXn1uqtr0b+Qf1kLShGui6kUL+h5nTIRg1lBWR7uSI0r+HQwbRP4C/dwj2CgcsMNls+15oAFxsdzDu2j9sjIzMEpyo4WBGztXd7pfRU571k3CBzBfWFhOhi7/OfhNYenZug3SiH9MhBV2bpmHniaow7G+WXt3aDgAtLpV2NydI3ZPVGDmjYI9abnDaLtYaOaah07GZeiPHr9xzvsrB+kh5ht6betgGE0A02le8mbVKHYMlEmRwaTnAg/OYJV7ali+f3aFBwaOyenj2V80hMgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkenT3LhfDIBCAPJRkwElwxYCz/hdaK4NATOlRlu974=;
 b=dM0Af5S2GPlDBTrSHHlcEZCcHqMBh/I7z31wr6uo7xnp+MdnkLJEM6VNbh4yWEQ2ho506Mg+sPOaSiWf2hTo3MsmvgUQxUH2VZn4Sns3SpVB1ZuufXCeNdhnZp+MWxq+tOcZxV2y1eHCTcdBnOsqy0NRO/SgpmEGztlYbfURVmDddyBkeMINbxHiWmy8SQPfk3L6nxQu1x6nHSHt8SHZwUNsJoq7hwBtR5QCYavaXfQDbODvrXYqnq3n6+ATinblwlXiqTibACtWwtWhxDH+U454n/bTcfRfeKERWboeRFQcfdxPfiu8mWqRqka+qVR4JbbzRYKEY7bhiU2+aWxCHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GVXPR04MB10301.eurprd04.prod.outlook.com
 (2603:10a6:150:1dd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:55:58 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:55:58 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 07/10] arm64: dts: imx8mp: Add Root Port node and PERST property
Date: Tue,  3 Feb 2026 09:56:11 +0800
Message-Id: <20260203015614.2957479-8-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203015614.2957479-1-sherry.sun@nxp.com>
References: <20260203015614.2957479-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0125.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::29) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GVXPR04MB10301:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2f55d6-403f-4b27-7629-08de62c76060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CH+LtvcNWaAlmZGa4/IziM93p8p433MdGpQvEId33GDkgpWkmf/NQf9NiSxU?=
 =?us-ascii?Q?XS94/RRGZnK/1we6ylUcLRmatMUAFYJMIrNplDs9zujxvb6fvhBvKtHiVhGE?=
 =?us-ascii?Q?Tps1Sw0/fI2WcahJFVJZqp0/haqXV+Vh6HA4lAoNXlvY3O3FGJM7m1Z3yBp3?=
 =?us-ascii?Q?Db7O0VzPqwSAi2KsMUTT/bPXKoPyVy4m22QTBHnHvHpejracWrQL8USZJaOD?=
 =?us-ascii?Q?5Na9JiQnvWRYdZEo/QyfJIGysodvX8KK+ER70p90zyqdbQ9lzD/xKVhLfFA/?=
 =?us-ascii?Q?wqfZ10YaJt1cLz7YYGS53tg20+mW9vhEB8XwBAEPqBqaes84YgB73Zov5xWB?=
 =?us-ascii?Q?BJoPO/Cyt+Dbb29vRv91uV6/SD5ocW3s385oFuGKeHNqBb6zU7byRR4rRMGc?=
 =?us-ascii?Q?d1nn9NYR/+qxe3XWEfO3WjRzDCS+RO0bmkitXbkXf6wV5ccK1f2gUDb9SoWS?=
 =?us-ascii?Q?XggtbSYt9xxfICOApks6Sx7eo+8UQcy0krjba3g7anPaDf3wk2Nq2oceunez?=
 =?us-ascii?Q?IcJ38e5Bz3YYbLUfvcyXMOpNJbkVdMBXEJ+L8KutsO0sSORbQG5tWrHuOcsZ?=
 =?us-ascii?Q?jxcq66eaNv6e3u5/eAp4oaM8WmMJrBJK27hbVWD2Noc1jh1tFRLcoccq9zPp?=
 =?us-ascii?Q?zV9tNSXQJv2By0gP/V1PGXGkIijA0n9kiuW1gQroGnzXBH8c957Ny+choVv1?=
 =?us-ascii?Q?8sijyfMCzJAtrMjme35TmX1RWEEAud41sSWlZ2BAfTfC64L8+crs2/MZ4Ipw?=
 =?us-ascii?Q?8qLsrxiKfKjQ+MxAYne585uRrXgqZcEZS24x01IafrdhlwtIYCw4nhbcEoOT?=
 =?us-ascii?Q?ZLDo9WT+PoMo2KRKBKJzh6uNEBadawNd4Et1nAs2Z1C5ekud1E1Wxqk50qgq?=
 =?us-ascii?Q?9IeE2nPv+x0FwuPqt0oSCF5jQy/fpa+kzn7dDRPthqPPxRaQZiI5Abb5+UFZ?=
 =?us-ascii?Q?dRzT03JV9fpkCOG16V4bU+5TloDQT7DW44N2eyzzC3zm28Qn8nqZOFRmk/Js?=
 =?us-ascii?Q?QiDHFO0ZnqBC/vEYp+JCxgXaAfDatbxUsyYg6m7FdE+otxIY2itr097KxZSQ?=
 =?us-ascii?Q?JBHcwFyj6CXp2OypmQfz7S74RHiMN9mxNJ+k/9j+XZDK1yjATZ6lF7fmlGiA?=
 =?us-ascii?Q?0nqtf3n2jw1eHupZLA8l7vVkX1DrXp5Cm8CerrN7v1jlU2vJ3Spwi/vKAqVJ?=
 =?us-ascii?Q?uh44l8i2Y2tELo7AO5YxrKvrDjUYj/9GofN4f/1Uc/uu9iqCD3KS93Z9T3Xo?=
 =?us-ascii?Q?cUVq1s6gcscixgy3mPyWKTdW6zZ1OGD7JJutPv79ky0Oz/S1My6AKM3lN6rI?=
 =?us-ascii?Q?z/IlvUDid3b3TJumin7pr8fNCGEsWULoL5U7VbodxzLnIqUYyNvf02Hm4tjf?=
 =?us-ascii?Q?+DeQuUjU47cqaVu2xf7yNzXCH/AG67vMsLX2GBHyd/TIvg8fIAImN1qlBfWf?=
 =?us-ascii?Q?jVLy1Btfn+92KBcxYaqqQrY0DQ4m7RDFgWrLTIB8XnNCmB4CW1NEExy0LX3R?=
 =?us-ascii?Q?Tf/0XAhxGPFEI7XHynezjTiO3wC2HtDzQuyx25slqBSeAdbNlb0oZgOw5AH2?=
 =?us-ascii?Q?mUJmfOokkhkkUyAEL4Crk1dv9oLhdSzg+zYUEzow6AUDlJKtlymYOcoJCdPw?=
 =?us-ascii?Q?LAYrbHLGXeNeiRqUuaNzBa0iVzd+vNFRM8e5RBU6aGMq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4dUhci+DCK1HY7phb+eUM0bsSv0vlxE02lkLdMCveFvcFlY77HelW10tiaz4?=
 =?us-ascii?Q?WG4EPq1JYXv06DsrflWMOJjLRvpQBOlnXLrOGvuf2apNrhIQ1P6c7ALuerv1?=
 =?us-ascii?Q?CJniqqUatC4/949XsOfc0UfpPnhE/AGIHPlgnrEEA24BM/kWcDaG0g5JzWNK?=
 =?us-ascii?Q?IALitLhTCJ8aHpF31SuAGfTiu0TSlacx60HSaXhe4Lp8cba72gDYGa533PzE?=
 =?us-ascii?Q?buSsAmyycYYOjSyrRN910fKdbbUebRi5x30jAFY7Pko1JAoGf+Q8BsqGwrB7?=
 =?us-ascii?Q?v41uLfVDHQus16yKtMxtVTeUY0PfqoCHdK2J2Zu0WpoF4H4YFszj2YUohiCK?=
 =?us-ascii?Q?yA0ccpVNZBLt8OoWp44VqlfsRTyeBSosRyMsU2CuU1It21jW1TF8fzh4yWob?=
 =?us-ascii?Q?t5zp0p0nayU6rvS7aA5c9i429YeAvKTEPMi9PQ3cNr7obKVAviD3l2IdLsb4?=
 =?us-ascii?Q?ZIkjoHfmYMjGebpi8uCnHQAS7Vp6F2pN0pjs/WtwYE2lydY+kvI+InzxnAOj?=
 =?us-ascii?Q?lh1tgoIqbCwrWRqssNPWjXNLtgF0fSRLHCxCofJkGJ7PM3OfwTj0NRKXSuqT?=
 =?us-ascii?Q?yrjrR3awJF27aCh1RF9rLa+3CKnk14ZC7ZiHGLLUMIY4C4gbEnKHNbPU8WjU?=
 =?us-ascii?Q?MuffzXj/2bM90mGDojbJ6D1JV6MYlsYeQElphX3iZeNPffTy8b2t9T7xTtwi?=
 =?us-ascii?Q?Z+yHmBo5tfNHkeltPi3WbIuxhdTiEaAjWoiLUeJlIuO5ntufTZalCkGNk/Hr?=
 =?us-ascii?Q?cQOGQSqLK6uxtuXnkdc3cZEhOFCoW9S+bBM82lr7T5bNOXtY0+hSJWhQusGD?=
 =?us-ascii?Q?gRzp/M9bmQfdSQ40QfpZo78PiCISQUUA0Gg3xZqkH1LTyI5NBz2QKiss/PVS?=
 =?us-ascii?Q?BXeDsxw9/bDWInIJQn8EQ2O69mH77Z6MMpZRDvRIFandTt8Ifmm9Pn3N4M8I?=
 =?us-ascii?Q?71tyPn6ka0aihvSk4uU4RjZl0T0xgBb+1hwphxJDjxAuCU9SLCfK7q3x//A5?=
 =?us-ascii?Q?APyN9I3qBeNn+gehlOQaRlOHxCF6VATFLc4XPsXvnxaBzr1E5z2xC5kEYubs?=
 =?us-ascii?Q?tvmkCK5YZJQTpQFivwrBRoX/0Q5CyauzkEs+O7vMwPVyGg45RZkwmZSViesP?=
 =?us-ascii?Q?rXuLyRZw+0hW7XgtJo0sMVXE45ACgSfhkmk6kjYy9kwyCKuGCIYBArVK/StK?=
 =?us-ascii?Q?npINtyKtuZMQPe2WLuiFazSXruoWTnc7Vq9o4ONIUFUHPXMrI0nKQsZtzbYp?=
 =?us-ascii?Q?gHO0rRcFEy1cJ0zEPGqedAWXW2G8eVPKq0AgoUjC/gbEACvjck6E2Bjpc8of?=
 =?us-ascii?Q?nenuneb0R+a3BBoO37I9sCeIoQP4o3iW+MTaD+R64DwOd/Lhd/TN6cihFhsx?=
 =?us-ascii?Q?cIKlEwiuj/5zcOnT+vlCgDl5VHTDh6/8iab1mGXDBW9Dxtt8xYAFfkLqVN+u?=
 =?us-ascii?Q?HOdAQMgT7Y3tNI+dep5A4cWRQkfawdK3w7tH4YVJpNNowt4SiVF6tzo59pGy?=
 =?us-ascii?Q?wRiiuUz38mz/i5RTJ9Oq4T6fnzF5lDLGwsI2qWzqX/SY0T/Bf2gDQi8tKI8v?=
 =?us-ascii?Q?cIqp48Ntx1plmgAtAYcMeH4RA/ZB0X98gmsP+lRgsjIldOcgaT6LJ9Kcrqej?=
 =?us-ascii?Q?gXcfLlnuXBc8Kko1i8+/1q2KnOtk3DUtot0N1gezTe12AROfWjV/UvP37muV?=
 =?us-ascii?Q?MXNtM2qy+v73aQKLvxVh/3tT9qayCwU7jNiwt7YksxSzs9SI4ozrKxPhDS+2?=
 =?us-ascii?Q?pD99e2o/ew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2f55d6-403f-4b27-7629-08de62c76060
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:55:58.8824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4K2pcd7uZg+YQiUffBNFd2sRlom4wbGYqPI7AJhJKSCZwP/kW10mTQk6hmX/0SJuVW0N3yANT2V9Jp8C7Aq7aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_175602_327767_4CF2C207 
X-CRM114-Status: GOOD (  10.59  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1..3f9b3fab8ac3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -762,6 +762,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
@@ -775,6 +776,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b2b3a9bf9e8..f66667735a02 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2266,6 +2266,17 @@ pcie0: pcie: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie_ep: pcie-ep@33800000 {
-- 
2.37.1


