Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56052D3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSrvo/kDttaG782JFkAC1Ut0fksBvqP5kEvSYwWrV+0=; b=FH114cME0yKICA4Mwka+8TInqV
	0D8UpZi95VZpqyB6eaw7LO7smRmrc8jbXt0v6cyUVZedzUWPyTR8r0Ir53o8l0hASIdFZVp9p+lfJ
	PqgBhAQpQ+w9v4pl3Ftd0JFz7UisOReOkPHDyuatCMRnN75BayFzpdeyjVCafaIXgr/At7ezUtji7
	ykEACGmTNdVCW3YzbHpWdkGgLFZXrVG0qo8rhQ2rP/iw8940XpknFwgZXnXJeG+BjJaBEyew8YRo5
	GO4YU68I7DVvqlCafkgjmxyy4Srnk+PnNdxMI6DEu06NH3z97/NqmrbOStWtKFGEAL+8HCDX0xrlg
	crMXdaeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EzZ-0000000HMGb-19pn;
	Thu, 02 Apr 2026 10:09:37 +0000
Received: from mail-francecentralazon11013052.outbound.protection.outlook.com ([40.107.162.52] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EzW-0000000HMDz-1cz9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOtyj3tmNIiGqiw8e5uWMbGyw1T3LM8mROp03H+SQoslS63WabV4r/ZLI624K89iaH0PDw5muI9BWJ9dsjUrnlMuG8AfTohONIsyCUUOngAmAkF2FaL0+peluPyEow0pVkC8efnziHPzeI7ehbdjVBY8IQuvqs0FhEuny1vpVXRRsxd/xCFqsl8gWaLwYBsOS8Uo2MoDdPByoOL/n7Q1fO1115fKK4NJakOBsEO4IRJq8GdeYgST6FBMEeXuQRhJA+pRnEZT2CQEgWwIPVXILnPpKqlGJPNlqNML1ABxxLOHjY11KdG6FeXpgFKfgA42TporvEOTvO8hgPYWDGRGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSrvo/kDttaG782JFkAC1Ut0fksBvqP5kEvSYwWrV+0=;
 b=uZZ6zSVUVPB4TBAzPH7ptS6ZMzw8e3IiOAEH0m/kgHJ7fQ6OCsbnfkkjNn46QOaH9FRJ0kKY2+W90YeDWDoGsKIxvJmYfm/H2FRdFBl1pAlz30Q+4jSADAIcLK8tqmMbeXU7smO0Sp6gLwKS2HH9bE2fFWsG6WlYkIJAOn+OnbtBpr43tt97rwra3aoKezWNdbVNtHZR5eLRi+AaKVwzqy1pJJ1Z4RGibyvd9xwV8R24MxWIBXgZ1JTDpiBBzhc4i3Rsf/ezsC9vmS2esnoqKqZmKpNiYCv32iuvQhg1LqCCNSi5hKmHV0UmM5uh5hbIvjDPamvBizTtZx5HvWr9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSrvo/kDttaG782JFkAC1Ut0fksBvqP5kEvSYwWrV+0=;
 b=jcCufsjrBdApjQOp/8GJjCr8GdfgirBWk2InoRsb2mXnApok8yfBQKpUKAaSnaPRUjlurV/LO9Qp/68NIJHaZlq76x6A8Dpr8WI66t86HF9Azctn3nMdo1PhGnfaMLaRVwpcKY/iaR6UnsItQ1hoyjHz9HG+gNjwrZbCZPnPZDAW1zw4+2rP957zAMZDihYcb3IIzY0nd15uzBebZ2VJab9y8qJzXZhKDZszp0lunJzNg0teAm8k7RiZlpl8sJ+suFG3eXzrmlFRFLIHHoa0Vj1Q+jXXq1uJlWViv6U9RVseMTQj8twjuXOl5By5pfNzkOu1qqhs2GrDiGhPEjM0Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV4PR04MB11944.eurprd04.prod.outlook.com
 (2603:10a6:150:2ec::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 10:09:29 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 10:09:29 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/8] arm: dts: imx6qdl-sabresd: Move power supply property to Root Port node
Date: Thu,  2 Apr 2026 18:10:01 +0800
Message-Id: <20260402101007.208419-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260402101007.208419-1-sherry.sun@nxp.com>
References: <20260402101007.208419-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GV4PR04MB11944:EE_
X-MS-Office365-Filtering-Correlation-Id: eb763096-4888-4fb1-b393-08de909fed4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: r4DkO05DlS60QMVfj+dy42M2s+W7hK0YunqIu5dPmyApBS87xUz82zttWwWEvx1kMwdRiHCuFkqD+LjrsEjC0UAPUjfF7hNNoKSI5qcEavxss7iFtuQhgSuZstmyfmKkYYaY9KecFfuYYQ+75rIfAqfNRnY4Hxo11G0dDFmxkV/Y9jVS5SqSBdrxxZ/O+4vTLxzl2A5DOWO851yvRprxLFJbg3SnZwSQK3U9QigtI3hL3RBotf9jRz15ijpcF0fBXEPEwLMGui0aOh5uBZhXs23a7Ty5XRUrsfnzcwSvqaOa+q3vtbJxiXIrzSezkxx6D/VLec0l63Ig/lV1GwEjPJ3UFLdNs+yyvs0eKnSRJQPU8QkNtgSXuM7DExGsdwzAWW2NQLg2ulpeWFO/bFjR44xrRSC8eHXU1kl8739STjWfKnrSMssKJ/naX/mzQURECNcCum10N8JCX/rsjlEZZ0HKGx38FwNwegjMAhPqtdMO98HvyiBDgUH5kd+NK2y8C57cw1nYoXtSpiZwFKbc7BrODchKL4f6N6W3bpsCqmgfWbgHuFQcLnBq5e4yxBs4qv3zBxHWJUtXuuFUc49nUjw29kNCsvRtazfZ8tJeDNfxgfoOwavXbhULX/jBSd3nPVMf1CqKKIcAHrhvv3QT0VsD4gfhpVv76rsJPQ3nVSZti/zg1DoEDohfmN6Bdl7BhV3z+cWNOzMEDAEmKELZ3SxSPiFKUIahudSCppIczlJLAJ21hU1lYOAjmzYntMAiobUFGAVmFZSJrOCArmvew/e6ANK0hQxkUl0P/tbwrATlSOyBgqeL6Xao83EOVUfI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ReKgfBDzuZgyfdIzKnTFzkDxhfH2IKCqEAR0YFeLTM0GC3j5b+R+TaS9+rhW?=
 =?us-ascii?Q?raclFDSScF/ASe8e3fWfW0f+hzv8N39fRipvhstsLiqkSLMfxHTYIOs273OJ?=
 =?us-ascii?Q?PNxSQYHReQgWxhIJZsiGmjtzI1VOC+tu/D6KXTJO6xKIwEZdikPzfpIHQVIW?=
 =?us-ascii?Q?fWZsKK6OUoomLanuf5Fzsbd0P5TPR62IPcnsppxZwIL+t5fS3VDZILx4RV77?=
 =?us-ascii?Q?aJQpPpQZr+nRMCy+quL1jpIf5W7aR5WcLtKyq+X8fgcVtekuZlBl0s6kyFi0?=
 =?us-ascii?Q?Z3l03GM/qFZXOuRqh5A5c4hZ3+WWh+ZNivP8v2u79fr6kQD5sR09t2sZ93mq?=
 =?us-ascii?Q?BG6gCeJBhMHule/Jxq/6yGk0gU+u+UprOKVmcGdAtc3GwKXhOhMY6cg7+r24?=
 =?us-ascii?Q?yze1PWk8SKE5f5pIUz7ev9LJji8DuEQMohwlih+VLbR+/jjIM+knGk2c6VBv?=
 =?us-ascii?Q?J3lgJNVTQN+4NXqrPBtWzAf/fMeZumHWSfQe1qsuQlhM+CGc3wZ2S6FvIpGW?=
 =?us-ascii?Q?nsWksTPd2SiP0qq9lYvGqosveG6pIaJaxfXVqLvGIOMn9e3eYZZkfxk39Sdl?=
 =?us-ascii?Q?d8tQSSuia1Yj6ynADvdfpElwO2IcbiSm0GsOzSJw64qKzi6aCe0PyyDTSqWf?=
 =?us-ascii?Q?ilcc5BxWvFis0U3whUsyNSmwYx0y9BTq7xTzvZYJd7tNtYNoPsZh6p7wJ3pe?=
 =?us-ascii?Q?3REsxK8z+PxbYlo9YokIfdGmn1FHXjBtYTvzgDAVh5QefP+y5LkxWOxCgRaL?=
 =?us-ascii?Q?7eDQKjYrDUYYM/WFVq59J6od266X21PvOwIWPsB7SW9EDqHiPNUh2pBIsrYw?=
 =?us-ascii?Q?RGOkmXed8kIx9XH8/uSOayS+qVavtLqa/zpBu83rjZAavKqSqDoAzxGHA40D?=
 =?us-ascii?Q?ZEdB02t+X7x749XdU/Lay73TZMJ+z6D86q0W00GyjGuiasOHTKeV5n4ElLMw?=
 =?us-ascii?Q?uwQKextgCp6TDIw4QFkPV9d6Gpc8S95Qh76atXkUbfwH+8ivV6h361yu9rrH?=
 =?us-ascii?Q?V9+Z8ZDy5SxTsEntVtUAeX+/EX3BAfEb3xenf9fRk5iv+DJrzw2zevC9J316?=
 =?us-ascii?Q?moCR1DS71ofzt+Wq7nadV3z07irV90NKVTwu2u3YvtKkBf4PkQW/FP8YIshm?=
 =?us-ascii?Q?QqQPHLxgHXWUiBib2lREA8+KKPWX22bWvWWKIr1JWOu2ApWO1fnKsE5LcLH1?=
 =?us-ascii?Q?xq56N5piTSqBB+qCUyq/nntfDyOtb/Wt2wskcnybA2n1ZhakdNg9WNcKi+zl?=
 =?us-ascii?Q?Wsip73UfFUz4K4K7z8NEdNa94wPiOq5DaIPIc8mqDTdinM4QHGvrtvlQUbWa?=
 =?us-ascii?Q?zGT69H6yK4B4iQcV9XNeH4S3Zi36xC8yQCWxSj12LBGa97IwpffIhD0/iEeU?=
 =?us-ascii?Q?8FHs4K/2r43PXzek+5hpo4XP5oQVGH2QiOf227jxOdL8hzh8rRZMn7moIqdx?=
 =?us-ascii?Q?CrKj/0e2aKBul23RpQc3UvXQ/DS3v5Ap6e5mq45V5sah9HIUkFBpP3nAbh6O?=
 =?us-ascii?Q?N7PLBFXEdeEgwNYgU2cyV4q5LJsxqHlUkksqfglJL+I++OlX2vJlfjUXVj2Y?=
 =?us-ascii?Q?sdVU74Hk5Y9mlJaVekni7EnbpSQK10YFm9H8UJk5gXyK1wVD6YdNP9bWNKmu?=
 =?us-ascii?Q?83EiD5pY3c48TYo0WjmM5Ci5fqkmyS1/uxJHPA+W9RG3TkoUmCnsO/YUQnYz?=
 =?us-ascii?Q?SlNDQ9gOSnP59otQ0SzlqWoDBQnOr7m9asQ3rMrrc0bh38mUCh7qkJiTGV4M?=
 =?us-ascii?Q?LxL6JAdHfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb763096-4888-4fb1-b393-08de909fed4a
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:09:29.2097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDpPHoiAGZb/cYXKhHihyXJtPaKQswSyK6Wk4KX9DvQpZZYBddXCq3zcIVnqye86uLE8dAOrUFQLaA8tf1n5wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_030934_431915_F60D0802 
X-CRM114-Status: GOOD (  11.53  )
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

Move the vpcie-supply property from the PCIe controller node to the Root
Port child node to support the new PCI pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index fe9046c03ddd..e52205d7c487 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -756,12 +756,12 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
 &pcie_port0 {
 	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie>;
 };
 
 &pwm1 {
-- 
2.37.1


