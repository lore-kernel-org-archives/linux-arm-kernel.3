Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76D0D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 04:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ON54VBPuaPOx/W+zJleaVcYOSzJ3yCHtWxHE1bgcAOA=; b=gy4lP2OsEqx8I1jjkOZ8JkgFzM
	aMHeY66/h20NN4MymKGou2nc33Az7jCJgJicYrl50FzfeTZtv8QEj3SHMQKqYgzHE/TLLXh6XKDb1
	fo0FfFUY90PFRnkn4PcpSIrkWP9KcyVqVqMwOama68hDC0+QQiIuGM4PeWP5dz1Q5kTT5TBbFFDJO
	BK4abtIn53nqnxHM4nexL6Du68LzWsmIdDNP/4LGFo/Lxg5C05/zCdMthMfPoz10KulstwhKxUNfA
	Vw8TJuJsGo+tqb5s604x2uZDoPttFBeaQI3wlPMHsV/uQXxcQPY/u46A8wZrs7AHlBR5pWwprpeiJ
	D+aRLsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPYu6-000000021Tj-3dfk;
	Sun, 30 Nov 2025 04:19:18 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPYu3-000000021T9-1t2v;
	Sun, 30 Nov 2025 04:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnztsmbX8yVCGTJ9t9Aw6dbVPrQLsmw3MH8ROztC9jyl0lsJmNR2ohtlE7/s+2ULLFZn4aqY92UVaP8bjT4CTyhr0ptU/x/IfJrXFJDsVmCtQdYDysqfeC2HR8gpDxuZR3CgUUNmVLFXOKDwJv4caE/EyVd9ehYuvkkpazt7BTz74KQOH785iKDJM8k0reN1XcAYVopNjGH77FRsIVVaTPldSzpfXMDdBp8ppekeDhz6P/9ucCd71M0zKKxtxzuk9eR1BKCU8FU4qWTzt42pwzeq8+HZ4dbnBoS1ZvJ8A1LHk5ltkq3AmSfqZSzh096zRqYueqsZlj/FpTtguEsOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON54VBPuaPOx/W+zJleaVcYOSzJ3yCHtWxHE1bgcAOA=;
 b=UOWV2+lxkf214eKsC2EVXNEGPXM4wHUWYZS1spApBWFgF7ODm0j4nFAY12jILmmuxmyh+Ch20FmeSajTBxUNzo8vaABIr5upFnqQclE3aRMtIL8bv2t+v4Ekml7LnPssF4F+Eoia6allg+uHNs62dn5KMGiZaBo5P7eYpCfVkQQRqWzNEbw6PZnb/hfSRUxPs7YCx50TuEUCVDtZ8CkQh6MAEVmU8GQmncTCZtn2SyqYu/UjW6TNcjTSel0RLdtcD2xpMjXyERoiSef2UgQynjCTSMAVD2orWIHw2+LGx572W3IOd4R1lGikZ/n6j48Mh/94kOrsjigOPK8oWEW7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON54VBPuaPOx/W+zJleaVcYOSzJ3yCHtWxHE1bgcAOA=;
 b=TO0zaPXCxx71fgjAuhZiFOJC620tVJW71yTSQJ93ssBGmNIVt5vnlC/0KoEaPW1VG6RKMKNIJrl3xCki4nWOv1BtoNDqsmxU5ffoXm7/47A4o/ZIQPEyi03QXv3HrkUzuh/y4lscLelx85nnNpnsAxLDzN57i4Eqx/j4wxUbkNWD5gYlRshKBBwOnyr4Eo2Gn+p2q2brDgygCPbxSlZMsX2dtcGtxJlJkUushglgAlM1PRduHbzS+h2N2/ImtFRReWeZaaQi6wIerYePDzzLyjHLQYt52Xpd0c+ZtYTBUGqkQvmGYclY9MOPxmUKmiDC0/Lq7VM5pROCRezgH4q2xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DU0PR08MB9049.eurprd08.prod.outlook.com (2603:10a6:10:471::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 04:19:02 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 04:19:02 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH 0/2] arm: dts: airoha: en7523: add reset controller and support and SNAND node
Date: Sun, 30 Nov 2025 07:18:52 +0300
Message-ID: <20251130041854.2909001-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DU0PR08MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 478a9364-478c-4668-0947-08de2fc7977f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TdN4dERBdjZhjr1mqSsehbYCPi7vlv+sROF6FDvpLXH6osYiqaCn11uX9cCO?=
 =?us-ascii?Q?CMJEvJSvMnCrM+zeM9cNTr2IJ/ajN9FYPKBNBx/5AfUcAeUKm20SHYZbRmtL?=
 =?us-ascii?Q?9FRAPeC3tIwgrX3NFJw65J8hRSiBLiu5qPixtYX3mGbJqOX/KkR8qW5SiQm9?=
 =?us-ascii?Q?O60axFB1xfU6dyn6BBVrAdyGhFuOsRaGDipOoIJmJ8XaJhhXT3XA2N/lOeIZ?=
 =?us-ascii?Q?MP6M2WwaKBEHwbtYmR5+hQ/fNvRsMtpoDyQxGOwVmBqv8kSU3HXAyYRDTpzv?=
 =?us-ascii?Q?VfhWzczkG7tZs7g6dP2XP/OPnIsqbpE67hPU4SoPycjiDwzWLAEGwbnGexik?=
 =?us-ascii?Q?7oJIHStvK1syyx8io8wlcLOp74nW1Mt/Ed5FTKtCVmzgcqXQbTKd0pqP9vy+?=
 =?us-ascii?Q?UFuelb176NpleNwB3M+NImsCfaTrwWn9RFKkqxpWVBEfMeicOaTlh8AjSglo?=
 =?us-ascii?Q?6gDyfiGHvErRp/Ckxo1XdoYTedI5OCbuqjer2MZeweRdctRqqNsXyV5ELWzj?=
 =?us-ascii?Q?/U2PRUjXowgYIDh+5x4GqS219R9Fdoo8Nem8jcK8KZSMO7hNnPbUpBpPB858?=
 =?us-ascii?Q?G35ZL2k/MUtdI9KJyCmf1xJB4qUEW1Wzm5Pq6O+ClohiG1lK9fPBwVq5qM9R?=
 =?us-ascii?Q?ckB1w4mRb0SjxpYUQt9ZPfM0oL4hwKC0/k6e9Y1JjJWMM+Xdr505r+Z/gIbs?=
 =?us-ascii?Q?mQR/IoFr8ksvDCVxrlwOIAbpuYRoDiz+kqB21lAlLua5Ig+mrQiKXL2jFzoM?=
 =?us-ascii?Q?CrdZjKBVg2KnnMfqeUaFtbeuNAqSJvn2Y4tOHYvM6I1EiXdqcz+dAmReKBRS?=
 =?us-ascii?Q?P8s/w0hOUVhXEwToEcYi1CLEnkZ8pUNijTJPJ6WwRZp51DJKIInmJioxqTAn?=
 =?us-ascii?Q?ro7LwmaTO9EWBqG7B/pdJMgFCdQ1qfRFcni5jS5m+zkNOmYx2Rv4jWwdL9ev?=
 =?us-ascii?Q?ioUOuqnl8SHdo6tdUHhfDE1cG4xDMtzDppxaOOnYd/bhy+RnXtn2PsT+Xw+u?=
 =?us-ascii?Q?VwaVnLEu+CXLaXFsUxDGnemSsuXGT9Hu/zNlNCCH2CwGonv7Q4CGrG4J7/J7?=
 =?us-ascii?Q?qVkNe4yX1MNFXvUGdeZbk0WPOmZwh4MIDyPqx4bkJpSNgmT2WcafZ2KVGWxm?=
 =?us-ascii?Q?xNKhONsl5MkKW54JeeHG+MUGOVD7C1lL0rIXmR4tBlV5H23J/kx6MRADqMx2?=
 =?us-ascii?Q?QHlTx2YjsrzWIM9qwF2t+7HPM8tUsv9F4UEz1uks8uvBMt3yIP/rCFhPlb4N?=
 =?us-ascii?Q?tTHv3nFPw5I9v0+QEMNIbOevPao/9MAzNef1BQAvNPFtwsmwImp7tWWax18N?=
 =?us-ascii?Q?w8k9SWLxfEEkax8NSlUmExg79/NBnLxkRdH1IOVAZdVOQj1vZkCkkLDehQIj?=
 =?us-ascii?Q?nFfk0zBVM7fjEkmuZubGflrjuYUPHGwJ7TCGoMR2y71iGMTChpnH8Zf9RZag?=
 =?us-ascii?Q?GoLrC9IlDmLdIjIM4v0BECBQsYK9FCiru8M863GraLUQH+ZUcl3+NShKGALL?=
 =?us-ascii?Q?NhZcv98Vd8VJ+APpDlCJTVXhEaa1oUPsJkS2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CUYkNtq8FwmSj6nfq8rwNFwI0ugwb9N6ohkd1UubeKInXekomo+Ze+ifOD5X?=
 =?us-ascii?Q?e/ZvMyu6zMzbrvww2t/hWNmIYjzBirgLXPW2YWeg049hyHczB496fqhW+P62?=
 =?us-ascii?Q?gMYG0z+tOoC4fM9i116zZz1ViTJ+lQDYYuVPGaEw0DHxrZZD2yd+vrOp+Rc6?=
 =?us-ascii?Q?R2ew/vJAu53IGjPqHv8jIQb0g4FwZOn8gmBk+Fv5sUhLbB6BQJyjwvwJFaim?=
 =?us-ascii?Q?PqwNpsOAdEaV3/9LY3yzWY2xPuW4XRpaMjAs7cOqR++CD5vY1KR8u8/a38iP?=
 =?us-ascii?Q?lc///r6kVQCYWBOI3aC6Uu0yA/+HOukwy3yAxW36JY+EjPcFPAxTo3vb6+4K?=
 =?us-ascii?Q?Rkh83E6jdsmQeY+O3d7T+9w1x34T0t5Y2M/K/BDMzv7cuo1HGANz0RZhMG50?=
 =?us-ascii?Q?M4HWvraAt4ugNh9c1XHsF1Wuc0i+nmkfhvkUWlrH4hIJeQEBiBMQfB/4GktN?=
 =?us-ascii?Q?sWbq4d8K3xVXCWREAQ4n9meXKyM8VTX9dwVLf8nmskO2JdUW5V4S19chq77b?=
 =?us-ascii?Q?2gZWljBGc0MaCCqRTjGyCDbeEyLFSopmqSnvhCIzqBp0N0y3qQRfJHbDttww?=
 =?us-ascii?Q?kHEai7XEXz/rMEbCnvhdmOCOyHiVNZzNoLNqMS8XAVqIO6w2spq1BAj0ABVa?=
 =?us-ascii?Q?tmJLGXKf3xppKPPULoA4tMzlu+YmfNA1I29Ho8KAyztRZnjAmTkkD0OwhEia?=
 =?us-ascii?Q?sQV9nuctjPpekS7CBhE4bGgSpttpyn7EEXmKn1iX1/neyT063hXFCBR12tHo?=
 =?us-ascii?Q?Dgxlsqf+m+oz0rg0yUbI819xqmEGr5gS5mp2ONl/sO9l/Jpwb1EUuRIr7zs2?=
 =?us-ascii?Q?ZPiNqc1b7FeuiBsiwylLznuePyjRwBFXaq8Y92awKA3RJxJbVlLAWt8exxYo?=
 =?us-ascii?Q?3yXM5jPTShJv0oEtitP6ulghvFpgf+7fZyte4S+2XhQlQEZ0QAmUEOOF2RnW?=
 =?us-ascii?Q?bJTyeELW+h2uGu7PGGJob17959w+Hf4aAAY6FFRd1vq7V+00BeDUM0Jh4TN4?=
 =?us-ascii?Q?e9te3YIn7s+yZ0uX/Cxcd7l6uPSlj2bn4KvtLykeHDYOkgZrsa4GiE/fyzTS?=
 =?us-ascii?Q?LDwH5lyDxKk/L513P2FSv2nniBwRyxswrQ9cb5jESMJpGLJCXaQeeC3XSak+?=
 =?us-ascii?Q?JWQmdWoXWI6foErgcS2ihGpdDPLvw0HP9fFRwV2PPbN6hdS77icYtRN31W5Y?=
 =?us-ascii?Q?Q0yyWLmGZL+wsqQiGX9rcIMw+5/qF4JU3nIeq4iz2GaZg7WfoDInOHR1Tw7/?=
 =?us-ascii?Q?iz/FrkKxdACFgHz1mWUWzT395ZjEYUL9y7POJgKYRLeuZsf0Grj39FoxaCW7?=
 =?us-ascii?Q?olIUF0EKOvR6BS/uyzALl1QloudmeVB1+uBrBYNICJBtN1F1C6ecWwf0QdQb?=
 =?us-ascii?Q?5Bh10Q+db0BX6/C6+MaN+Is5o8no5WEuSvkmhKrMSI9QfeSdvwaskrqfCDdC?=
 =?us-ascii?Q?s/RLoTatNNNeOpke+eutW/x7K/PU4jkebiDgd6igJ7UiN4HXavFbd2/Bz9q0?=
 =?us-ascii?Q?TAAcBK6UxeOvgWk/NjjScw+coNgY47fdQZdnxXdaITQHhe1Y6i6Ygt6G/RHT?=
 =?us-ascii?Q?7K6RwP0v/V11bTFaDhclysqtOOYbUMDORyftMs4wl86Oyjs1bx+PmQwRkCUK?=
 =?us-ascii?Q?XwMJg3Oy/Yg/hX4eXNHCD1I=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 478a9364-478c-4668-0947-08de2fc7977f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 04:19:02.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19Y1x5ahg1hsYnG7c9D+jP/0LxY5VcDTxp51XoihSd0YjJetSDXFXFEjcLhaGT8p+0cWTVJAEd2e6kIXx51bgPjhcRNZjSkXZ2hieNIurYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_201916_086820_475B9ACB 
X-CRM114-Status: UNSURE (   8.37  )
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

These two patches updates dts for en7523 SoC with the recently
added features:
 * reset controller support
 * spinand flashes support

Initially these patches were parts of the following series:

  https://lore.kernel.org/lkml/20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu/
  https://lore.kernel.org/lkml/20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu/

All other patches (except patches from this series) were already accepted
to linux next.

This series just groups remaining patches together.

Mikhail Kshevetskiy (2):
  arm: dts: airoha: en7523: add reset-controller support
  arm: dts: airoha: en7523: add SNAND node

 arch/arm/boot/dts/airoha/en7523.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.51.0


