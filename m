Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ECACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxlCgSawrrESjER7N6bKeFcpOc+r0KUYeuoehRoxbek=; b=YBt73+7PmKjrj9ed6SUaCgVYvC
	lt4G9/DLFXhtVt+iGMACaEwfgXKa0McqPkOdWpqayM16klYEroIuJGTgmOBFd5g1VuGHtsA+Wsy4/
	LwuFgz3Rg5CtFRtcJTaQtuiY+LKZ2AWfXBDC7X5GlUsct3LN3nDuawcp9EXZB0raW4Ki/lHQ08x28
	vVG4gUAkOhRVg7PHmB2GlOxukqa7IgQhwtHqelfKewsAu9kdah/oJD4M3nRf27ndmFo8ZTrOFIGZL
	u2fB1z3BMWYJ47FTLGOAaHYG+qsxlW/HJ8nA0jAcslCjodqjpJPAq6rHsFPJZ4ZJrrEUe3xHzX8VK
	eOq8RPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9aN-0000000GdRB-2rCn;
	Thu, 18 Sep 2025 08:01:47 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9aJ-0000000GdO9-186g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfpYHqeN41dp/35l1uBCf76T6kF+x/YnQEVr6OktBvsP5e2wtI7MzaOhbGx6sK2Z9otdtLD+XXXBG7My1sP58vii/Hd+b97FMCZ4IB/ypsT7MI8QPmfKxyvvJN77x8TspRobjoD6F9xsVqD28d1tBQeEFBeGF3p2olGg3L5TRdCL7hPIbrgFQAAWcTA+mtPj5V7AwJ7Q/3m8Lo7+Ol8SwvpgojAExppQKaaCEhnEUsWeuKgbyXXSjwPQcPkVLOnYgKwkCqjoGyZ6NMC+RyckDGRl/Npv7KqSbhsGC29JovPRxGtC9cE1QSrDcKsYFPy78bjCv4KYvUhX365vvvoDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxlCgSawrrESjER7N6bKeFcpOc+r0KUYeuoehRoxbek=;
 b=YrbH3F21VA8Z1EfZ9QXmHDPlIovT3A55aBYFfySdux1mFZoCWUSunWuyK1P7vF4D3Z1Bxtms85k6utusltc389No9p6jLyeeE8fBifffkxeICAIWxUOc2cm4ZqXI/NTRlwrWTfT/o6tWSjzcvNISmQU34vQmRvUvKmMe/A1iSwjCACFnc42WKNtTPrCBr4QY7LKUm3bzbMUVP8juQpGkeeyFF/8lffzlxz9s/fo/C9OoMOnPt1mbTqZon+C1TpANHbKXO3geQjfYMFgXea3vKZJ4NhIWo+Ar4YGXzvRlkesUQZFqwuWAIP++G0HWxl0ZatRIQgj31CU2cvAWZhUNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxlCgSawrrESjER7N6bKeFcpOc+r0KUYeuoehRoxbek=;
 b=n0660QJwpwIzkuww3d8KBw3gxvvBNyy40CXZlcjALC+w36lJTr7v5jCvckQ5Qh9zgKZm0YRZANtZ4Bx+4kF5W3lJy5qqwTvOr57YLgvFmHMF1ZxS+BiJVb3yPuR+qP6fNgh/4Yzq/rehu1tF1QSopI2ZtpsWPpkeihz5KBqFOIC8I5iP+V1/TLO/CTBI3rOcKZT/J3m4ImhxRB37Fei/c0//jcNnZtrlWNiSZg5mmv7K6jbiefu/SSOlT6pk/KPnflHx75dXlnn9cQ/h5mGl9OsBVII/zv+9ETW+pi3UKxHJyJ8ll/XTElhyTUTOnDDb1CApARpZyb2rIl6GOZQZZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8268.eurprd04.prod.outlook.com (2603:10a6:10:240::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 08:01:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:01:39 +0000
Date: Thu, 18 Sep 2025 17:13:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: freescale: imx8mp-venice-gw7905-2x:
 remove duplicate usdhc1 props
Message-ID: <20250918091317.GG23028@nxa18884-linux.ap.freescale.net>
References: <20250916153216.1042625-1-tharvey@gateworks.com>
 <20250916153216.1042625-2-tharvey@gateworks.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916153216.1042625-2-tharvey@gateworks.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bf9a2f-9b2b-476e-9a95-08ddf68998dc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7kCruuBLroeGSTBg0gnTPB+00eGErB+cGiqCwamkWtJkGh+DqynLyYyalJSu?=
 =?us-ascii?Q?i2wAdZtRIeMvLKr0b30B40an+HSZsuqXZasZcsVEQHlqpVdvNPdTvcSTD7Rz?=
 =?us-ascii?Q?/53EEJfy7xL447Bz7o9qAvpcRjZTbzO2HPp8Sb2GZDy03ZJ+/5YoJb0aYJbN?=
 =?us-ascii?Q?NDEa1qvgV1wDFblv2hvX3egxXumptOxclx4WetVTSDOpuVmZkV6TdK+DCGoM?=
 =?us-ascii?Q?En0pFRFX8gd8sot8H/fVVGTnJa0eMUvRVTLxyr6UeqvxVHSCHEWQjWalXAIr?=
 =?us-ascii?Q?gEPrbC0S89cdoraS1hU5Zq5p6DtiBtVe2Rdyivj+pS9rAx/0IQHyrlrdcbQG?=
 =?us-ascii?Q?pApHcofY0PDctzTb6RB3q1wfHWln15Im3Ym3pYOgIdvYsv4oHprbSHGa+5H9?=
 =?us-ascii?Q?58Dgjx55bL1ZLXCr9S108Nvdm6Rj7SuxIMVk6TwIEoZUA5CPJF5RKGGybola?=
 =?us-ascii?Q?sxUUMHwAVr1gNkvCCIT8BYJs9yiTrQkiaEnlvMjMCXpvrsFuohxqUgNi9CLb?=
 =?us-ascii?Q?cgYX9K+Yis+lmOYof0qmeaZb+ilPyj+QG5Oe2H9/4B44qWCPdw4/UN1b+qyV?=
 =?us-ascii?Q?Jl/lZA73fSf1iTlN6DJU7PK8jR6y2FN1Rc/I0LOcNZCjkJ2ppeJFQDg8gw/U?=
 =?us-ascii?Q?1QuZet6LcAzHJMSNiR3t5VcgjqSyvFNkwu9DhcIrcC3kuY6gaDZ8ubzlwUVM?=
 =?us-ascii?Q?zeCugawSnzvaDEDEBejzyp7Pxd6sr1bxbKW7NLZGCzvg1ebAjcs30HiqNnZh?=
 =?us-ascii?Q?fIuj8mdVWq3Fwm+gFY5AbWVWtBTjienm9X8QSHa9Im4rqpoI5Tzl4R/2JBig?=
 =?us-ascii?Q?5BpwEs+cVsIGLdZWfwKjO/qdYlqPrqplFEVH63m+PDKlsiiWakahgJEMzify?=
 =?us-ascii?Q?3ts/gpnn0iFlxfoL55esY5n+YXtE2VGXfPKXa7d5vFFORnvGY2R5S4NtTOXf?=
 =?us-ascii?Q?DxRQ1RiQQ/DIOGSFv8DRxF0S1KNYnJkucidbvmUuuquMG0NFfklp8MIDVwy3?=
 =?us-ascii?Q?Hc+aY5seKIM/e/sYeSlnV5gM4RmPmuSemuDyJNYunTCGuZXat6f/I2TylqTS?=
 =?us-ascii?Q?FQBpZ+Bl6L3Aq7tmL2EyIrP/24J/D+QT6z1vngcqV2Emf5iGoBi4/5KdNCL7?=
 =?us-ascii?Q?zpz4uQqMU/UWrhmAgy5VZ2WpML8oD/T3zf8spgBBDIDJsO29IqSqbzp5ZoKO?=
 =?us-ascii?Q?k/iEhQX2DXmd2OEero6rLK5SCiqy7rffMYQsTXt0TBmrEkU1AH3LzZ7qu/OM?=
 =?us-ascii?Q?Sgq7m+w6gkHTz8K22WQMq/WuMX3wNICmG+8aUX7aRitAZNNlicxPU/F1CW0S?=
 =?us-ascii?Q?uyzBNlSW7Wew1KcW+csBgtLZTdZKLDqIauxPUklK57MvDNQjMu2MyZD8ahT4?=
 =?us-ascii?Q?H3hnebdOuhXyiiB41w2twtabHkMMFIvM9NQ+sepj3QsQ5Kz6knlgCl6/8LrN?=
 =?us-ascii?Q?OnwM+yBDtDmiKcChk6GPzYVnR3PBDjgy7WkRCU0AGSAVQITYauc9Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RaHlcXwXBiOieSFZS/Is1dtvVc+jqodFT659dEVYctobhVI6VozLHumscjE/?=
 =?us-ascii?Q?j/z8mLCPvT35xhvNMJTCPOTJipMa+xGir1R5K635x0WUXMOz5rgePlGdF+6S?=
 =?us-ascii?Q?lDToWV8VecKCWx/KGzFYiZjOXM6OkpOVhUZps8+JcBcwAz6W6hRTYSGGYeQT?=
 =?us-ascii?Q?OVDbdC5Ms98m+HFrqT3XUpzu/sMtSAm0sn2eLjD9OFlMmeIQMgywuOqG36I7?=
 =?us-ascii?Q?2fP3q6O/ZDyfqZKP2eJ5cHCZ/6JLlPilU6m/vG34h2FsjoLY9ECJ91f4WCjx?=
 =?us-ascii?Q?mr7ApePLJLh5wJirjJhzDJuBEvT5i3riWKJ4ZxKZ1jyjYK9iFuk57Vhb129O?=
 =?us-ascii?Q?w2T3pvEnmlgH4ZkYY7REjl46rObDrY5JNWZVTgcMGOoDttQ/V5vvq+MhSwo/?=
 =?us-ascii?Q?b9lJRI7Pk93gYtFudgNZ8wIXtmOnGzdnR7TLayiMvQREXzxDa/00jvVosEoH?=
 =?us-ascii?Q?7P2inVr8xekJ1YMjix2oFTTbMpoDWpi8DYZwV8wrI22N9vMVlFUReoTmEa/8?=
 =?us-ascii?Q?dSw670UZE/jm6n74QrWlSGLDmkRIGQP0KoYA+SLq8iGQbVdvVYXFOLLKGOA9?=
 =?us-ascii?Q?bydeuwsxcz/gp2Oea3dvGiaAQYsIr98jOCh+gNtLGMs5PG08KJyW3ljoSn4c?=
 =?us-ascii?Q?Fpua/mQCA0BeaYPTAn98tczP/4Qe6/Ut01l84v96AIrVitV9ahsBvXpEnZ98?=
 =?us-ascii?Q?u5iOKXxqwgJscFSggqidFgjYZTEhms9DuNA7lNXBIrwLhCOwjT5sP+w7mxG5?=
 =?us-ascii?Q?2oatoKPLYvsTfJUXXLYcKKPoBwFB89XkQMrBIgtjzMtDyJHzWbFKslWWHvBc?=
 =?us-ascii?Q?hzc7BBeU3WsZ+6OwIR2Tb2TdU6RTgXv6iIr8ShTHqgKFnEc8QIlu3+ObOruK?=
 =?us-ascii?Q?HoneIJHjnFUcBm95TcF5iWEmAeSV5Yrg2ocF5DBEAMJKNQ1Ok6iV2wiAOsJF?=
 =?us-ascii?Q?QioK97Ydq9bIDxkNWkb5r26+DFETtXJiWkQIUBuE7FDSPpn2WJuHdIAn7Jaz?=
 =?us-ascii?Q?4AmdBrPDHgdpMBvxMwJTCqNA7ho3v/R1g9lCsSmkKXc+LckvQgqr3j9/2m9m?=
 =?us-ascii?Q?QYWGahocI4gZwBTfYDJjVNrCz+kc+vS1ffELsBCgFatSnzo/LTwjlfZshoAU?=
 =?us-ascii?Q?uqqaA0DfZI2E/Hi7Cz21f81x4R1rtpI56lSgthG4bl/sEZ4n39ZJIiYEUzRY?=
 =?us-ascii?Q?qSzyy7sw3syvmvrdd73nCiYOcEm86vsWzIEqbg5a4QV1V9NSyYh2YF80P6G+?=
 =?us-ascii?Q?k048P6KG8krAvb7VZbx2k97GuCe9hL/W4Sd/wnOfwDk0P4ACdnrV1B0uYlub?=
 =?us-ascii?Q?/+mXxCa+2UyP7cVPCHvmgerMsM6V7xbrzlPsGuMCQmFrNlVPYk3CJScqRNq4?=
 =?us-ascii?Q?toiiP1BBqtNPnM9HLjMZys/h9stiGyIWjePflSVidzmuzxj+o8iCrSkOOfh+?=
 =?us-ascii?Q?kPupVUZu87PKAoApnBfy3bAFqAxF95sUM5kTsM40Wk2ET1Wb37beQhjfkApL?=
 =?us-ascii?Q?iLi3UPqQG6ZNoVZ3Szbk5Q+Yb26rBeMhBJghZSDgxUSzOTGxhmlOylCtefIu?=
 =?us-ascii?Q?oZWb7MQq3/wc1wWFbvy+1S4osm60gmeO3Wbc/tpM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bf9a2f-9b2b-476e-9a95-08ddf68998dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:01:39.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PfsWVCIdFfYUU4l5lY55CO2ZVAtelLxa+7kuLFE14uX6fCtAz8x0oDCnSqHMHJhN+c5zMvRUPQOsoiaoy8fGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_010143_307510_7A52730E 
X-CRM114-Status: UNSURE (   6.64  )
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

On Tue, Sep 16, 2025 at 08:32:10AM -0700, Tim Harvey wrote:
>Remove the un-intended duplicate properties from usdhc1.
>
>Fixes: 0d5b288c2110e ("arm64: dts: freescale: Add imx8mp-venice-gw7905-2x")
>Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

