Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6796CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5/hZbOh6Ifif5WjU2+oENtgouoXyrZUUc3VRiRwO4M=; b=YZRLfLZXa0jcMZKGwBl5lvmwTU
	zo/Hv6io3hKVTd1GNlDwP2Qir9sJ2j0yIjMuGu34WslxvjFC+mXsDi9y1Mxmr+6vD2JrJ6jw38fsh
	2Aca8sxc4vA5R2ODb3UzSc4nLsjwfFHntHIB5aOml4LLaCM4xXkfmBVEzbIqsh9ta1hEzOFXgui+3
	eOMoRcEg7o1bBNh664MFxHVs0RcMbNf4qsfYPRnWwpKOJyJz662T0BRt9cCjBhP1+xL+V5gHYLM0S
	DR8Yub14NVtisN7BcFnloqzzRCSNFfH111ZNGYaof0gptBvKUCmCnLNXkDcbu/DPvR8p6gPl27uBm
	SixZfx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1k-0000000BJlM-1pDC;
	Sun, 12 Oct 2025 12:18:16 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1M-0000000BIt5-3dBQ;
	Sun, 12 Oct 2025 12:17:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4hhfe6aNoy/qh8gyuuoJYebYoxwmTxVF2cPmZDEH9ki9Q7y1grBxOb7t8YYvEPXjo+UrRqA32ufBnl1LG5YR3QYvO+8J27Mq6JNdxjKJ4YR9Lw4pXVsu0BbwIDS1iSzp2ORx9hWlj7VHASn4WjdVCiNtodrJ6UYWlIRLilrCJZlcLzYHUuJJvl5MSFKQAhHoJTMRTj5AYSoSILjkN2SpDZvcE3Q1pCQxExZTiXOOLizHyda+R+gIKjoIl8r3qbH1stI5Uf6tNMfQ9+J7wsgYG+Ardlcwtr1bzW7GSWOCi2a+tTwW+gGMlrAiBKWMLKN2lj36282ioo7g7EItZmU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5/hZbOh6Ifif5WjU2+oENtgouoXyrZUUc3VRiRwO4M=;
 b=rIl+e6+7e9zrZQXe2rA0oVoYAyyOl0hrMGynGcY7X3qvapHf1ZZy4/v/uEs8FeFldWFzfoneHQgjq3dXe9qI+w/laQapJaX/ZSCP8JEkS0tc91+Ch4vF7uryGsJEv07uReDdJCJXQPZf4wFPEM6l8FoaJEjE7lPhK7r7hq7DCjEgt4/D9+6XYxMyMI2fq4Psok/VXyldVUEMsdf7sSJ8AZPLL4Lrc/Wso1wjXmO31Y9EUX8QKiwI1TvxEO1NDgEcMnMm1tVukzRTFVNWudAud25tCHwjC9QGjWonkV44fPR0FoOOVcw3PagTAWvqQa6t+JWBnHrOR+62CHgqUAfn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5/hZbOh6Ifif5WjU2+oENtgouoXyrZUUc3VRiRwO4M=;
 b=5rw4qwx/hPigKu4PRqYiT/ewjwNW33RwtIGYeEYFY1pORLE5rwAVntc/dvD4ssFo33ZjXEnMCyakpYab+NQRdG0pZFvvA/4Dgfra2CPU4KD0tu/4Me3O8XT59SSsQnL9XEKxetE1a9sGQkISrnpPedlQR3SjRVVYtZyXMre4NHO5Kwg1mu4e5+u6mJKuEsT6Qi76aqp8HRKXX76/U1j0oCK/QkPyiSHn/qLlsoxCz0nvx3fZVMUpoFkqCP6chZiDobH8VvtXinCVSENHsXO3UlyNudXt+D5LkA4ec3ipvWGStOicR0cFzZyUG1bY1LWMDheVIwrndzaQ7zJF8pDdkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 12:17:44 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 12:17:44 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v10 16/16] arm: dts: airoha: en7523: add SNAND node
Date: Sun, 12 Oct 2025 15:17:07 +0300
Message-ID: <20251012121707.2296160-17-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: d43e5b28-7a8b-421a-96a7-08de09895938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDzAPLKBTcHMd+2eDSwGJrG87gaNaEhBz1n9GQgxCcMk5iUf/kmw8GrDoGN1?=
 =?us-ascii?Q?ewEx2Uo85Eni7Cigv9VIqZwXBTnuoT68IiX5NZjaKJs22ZhsrHYcPwc7Rgwq?=
 =?us-ascii?Q?bIfdx707XsRIk/48EqHld4+GzNiSE25/qRirZmDd9oIrAq4qu498/yIY7YR6?=
 =?us-ascii?Q?b4v/voddG+Pye8UuV3U9JFcmiHxRX7Cx5WmtqLn9OcvTAh72O/JwkOxUisR+?=
 =?us-ascii?Q?r+CQy4qMWLuH1doEq50WBM7opt9GQsuwEiFc7tdhp3qhfNKhRV0/LgLidiHz?=
 =?us-ascii?Q?xMqDLTADUpk1paRRxQ0RvEUGU3cPjodq5WtwnSTSeN1TxLnqLpOE433hlAJH?=
 =?us-ascii?Q?C+w5qmbE7Tkgn5H7j+n5JNxRaKX/awOFL/yFVfNGWB/mtdAu8blqEry6X0ZE?=
 =?us-ascii?Q?9K2j+OZ+q7H/23mgAuNwRhI0uu6UUOT2oyE+0l3//FxEnGHfku6sQLd/vsFE?=
 =?us-ascii?Q?8uBdlJSV3FcdjFdkuLtjj388Y44gMyqhcRNR6ncKIx0ASddVVMauep6Zd2L9?=
 =?us-ascii?Q?yXxf7OobUwKHTrpbXZQqoVd4YcqESaQIR4Ln+WRLnZ1OFMrz+CeDoWdYnusy?=
 =?us-ascii?Q?kh/zHpg7F/BMAE1Bhz0kh41o7xN4BuQjoAK7wYg8hKsRqXqNZ9+DVhLrD6Kw?=
 =?us-ascii?Q?QkUkSqY6L4xPVZ2l04g49/m/pnege1mhrKSOYLh7U4/Li2K+9Z2tb54JlX+B?=
 =?us-ascii?Q?XtJKr3DqlppCT1iGXbVQqsOReLAu3+22jYpL3RGqf5M6SyngytZHZQ1ETLCY?=
 =?us-ascii?Q?OdYF9v60xaImniTMW5RvbfJG/7nQE/gZbzl+xtifLl7rgOCJAxk6kJ5v4bO2?=
 =?us-ascii?Q?R+MzMQwoFWkOkTgIr29jeu9zixSd0IzbS4FQaSdLUmRZpdP+84hPPNf3Azvg?=
 =?us-ascii?Q?21sGvB94DxjUKFmTBgLAoYCR6FsNV+VcPAEd7cxeFdk6cBg3738EuCJwAkNk?=
 =?us-ascii?Q?ff2LcEmNsGK+ZZUWmnXBdQRdUbHjppXy8dZ4hCsl0ne7omR4VO6c0yhBIEGh?=
 =?us-ascii?Q?zlt5tiwF+B5IaAG7uxN0SC9d7vU7PJepjEOsZsZgowgFUqcCsJCqgBgMJLfN?=
 =?us-ascii?Q?2c3YpiB3V8a42Jm607kpXR9Fm8ar7ooWQhBJwBIHlQcMdc9ROuEaWqVivxuE?=
 =?us-ascii?Q?SjBkNO0SKG9F9D1v1jKRJ3MtKWnRlJcqFCF0PIYa+BL5BhLEnIrvcsU+0jyK?=
 =?us-ascii?Q?82RP7c0oGKhJk8TTBiMdmTZ2F3nSEiVCt9qZFEr/+DZ8HG1FHRZy/koEczfh?=
 =?us-ascii?Q?5sTHA7mnyat2wI6duhSA413rx+QDwxyLt4t340AYoqDwyWu5BHMiXValFp7e?=
 =?us-ascii?Q?+HxQCU72XQm+02osgQ1QcDspDhb2nDb+k5Ef38uLc7BR4jRhLd9K+qYPLoCE?=
 =?us-ascii?Q?WifM8YfzVJTWXE8c87lXA+wjLx2GjgzhS7BG8ZHIL0DH1JNPzYRQwXRcgGV/?=
 =?us-ascii?Q?oGThwcXlKxOLMlwXo4NiVLkiYKccgQdzKV19L8GkWHCwc4Pes1W5X13NDZEd?=
 =?us-ascii?Q?MAx8FQ+yCmJB1I8l8dHgAblyJ8fPDJ7Z+G2VVRD5YEHSj7B6iqk5FMl21g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8E/uvEO6sogJiR621g1e/yxBtgSDRLKXtVSs78j2JgckeAtgwucfXV/WmtcA?=
 =?us-ascii?Q?46Xz+iBXPdVdCXBo7FmR7H4hjWJtxExjYtXHk0qNB13DYklguDr0MJA8ruH5?=
 =?us-ascii?Q?ovBW3SXCtbEeTGNWhW2Af1rePwdWwArYc97uDWI7eyrhOgeJ5CkTJgh8eqck?=
 =?us-ascii?Q?p6SEOuHnounLoTBOMv/D9/8izOuBUf6Tha3KMf5x3WOMs/DdMXVbAmd134Er?=
 =?us-ascii?Q?mPo3u1SQDcGkt/Z2TP+UKaOE1iS75k6/Kk2KERPTX8T0nj53Qy1Sh13fQSKK?=
 =?us-ascii?Q?vDgr7m/aleRRf5PVD+LclaIUkOigTRGxX8liBcIc7E+KEpTpYXIHf0cA1Quv?=
 =?us-ascii?Q?drEKccJ9UyzmGqZNK28u088XzEN6HEI70pnU0pDfxgtq2QmYII3+AP8omlIH?=
 =?us-ascii?Q?ZDhRwh/mrM1yZhzCDQFHHWxNql5REFHbBqalPKxSmgPMst0OnP0d7am3KBs3?=
 =?us-ascii?Q?QGd05O0XhEorZcmFIa9S8ZKLpp5WeTCQD6Bju/BW+VbweM77cDV3RaBaNeZq?=
 =?us-ascii?Q?dLiiZs6/8PMGfezVw8lTj5f6xjfAqpsX6DTOLAF5T5A9gf9jLd6m3Cel19PE?=
 =?us-ascii?Q?qA1t2fYly6QUOh3HNoTKQGyufSnJ9wyRLfP/ojqfk/hIfuhrFCscxBi6DRkG?=
 =?us-ascii?Q?0gmwVIIn2XOBkxctairLDSYzZWWOI7Lgv9vMJyB2p7fEsIZ+Q7NM/1Erm6gL?=
 =?us-ascii?Q?8Dh2b8OdV2hQ4zJJJkuPnrNaY5s1JxG7XQ/D+clyZtKGEDsDNW0kw6UpqPGa?=
 =?us-ascii?Q?5aAaBdQhjihYH/6OSMY/Ivmir+HrUr3z7B+zPmLpTZ00I9Grgn3GI8fu2lxf?=
 =?us-ascii?Q?Fvdn0cKPgq1vbLNNUUESWyZ7mrkD6mC3vKbwUSKzqEO8xHkg2C3s/OqPYBbV?=
 =?us-ascii?Q?iva+WdsuQzl14pgJqL/eycMU5CecJhMSDvkqzhm/XttJIeDMPPRufwPmG7Hf?=
 =?us-ascii?Q?d3P912ShDYnau1saQhDQ2D/qJ95/izqmfS+XtCXLutY8oe85nZBT+GmVm1OY?=
 =?us-ascii?Q?/W3YHiPXSIWvtNlVvkdq13Mhq2xWOXkhlrBe8gXsCcYnVEOf8WELvv3p9w7W?=
 =?us-ascii?Q?Qc7H+ZO8FvLU9EYvhoxJrRUtgPrL0x2B6PHFl5z5TqFsHldfAZCduTGSm0gS?=
 =?us-ascii?Q?LNtrYgZ3V+YR6MRaBe/zvJo7Qf1eMyYHllchUdVL+e7lBCZKjr1xZLxZG1gm?=
 =?us-ascii?Q?SoynBGI47WFk1B2CE0Yd08Ilsh0wu1I/K7dMIKtnOMNlqIkIjLxcrwVB++70?=
 =?us-ascii?Q?esvnSBnJzgsmYYfVp00MYPD1+7O7sJihvaiFP+ajHkmY9up6ifcq1LdhXAUh?=
 =?us-ascii?Q?g2iZ6hh2s8AgxOaS53Lp4SnLbM7JQ0yWAirk2j25QgSf6Y6L0V6rHwtEkMg+?=
 =?us-ascii?Q?VtD7uXAdtEJWAeHdeF1GAd0HZU8cexEHme4djjPLwNUZofuldVmi1huRdRoG?=
 =?us-ascii?Q?qwYA2hYQabb5B0fONmRvoM6cvCiYGDBFABcsP0bktL3l6ZVxfAyh+7lzJcTb?=
 =?us-ascii?Q?n1hRUmebUNSBPFThAfY+hZbK1TLwKkHl8bk/P4b+D6lMHRF/2yk5eP9PixJn?=
 =?us-ascii?Q?6BMB6tFDThZaB2c36yWVX6rjOJS8f5GuhVviFfJ6a+PZNuJR3Gdv6kYIdhT3?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d43e5b28-7a8b-421a-96a7-08de09895938
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 12:17:44.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgznWNfhL6VMCQ/sDjySttXL5BxwSuiAl+5fqVW+sk/DMvvvOEd59GFn+TMYh+yOZ3OfzsUZyBHRte9HEy6VsrUCNavqoRRtt2b6ANoUFe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_051753_199243_A63D567A 
X-CRM114-Status: UNSURE (   8.36  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


