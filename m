Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B856C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YedCAl/i3QOFkQGLpd7RciM9uejEanI0+GJ5rwoUaeg=; b=Ku6Y8lfiO5YeVXayTRr8jwdeOC
	o83wgYJ5w3RxyrQAg0JLdsr9zkJaIwDDmoTH0AJeWPg5OLq14JIO6yGBKq6DIh0bhfDqWKS59Bfoo
	g8UZ7VEDZOFU4raDtZiw+dGt/AopZ8hp1Y/wxuIfe0ZnPzBRo6FR7z7mlwhu7RfOnI1Hq8L2Hwgfz
	f7wAr5/yaqsa2t+83CeXkMlrYhu0Q70xbVBCavW8UODZKdEj2ZenoDLhL+DD7ENb/oBWAiuMvRYWh
	msgkm7UwsRWsQrE4HJ3/GTFUN8Ey+HgV4uRvB7y0eCUkKHtUHisnNPM7C/ewJsQoyD/sJi9IK48iD
	QGC/F8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u556u-0000000A9pT-2Yss;
	Wed, 16 Apr 2025 15:55:36 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53wr-00000009vip-3BE7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:41:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGY4lw5fryliGqn9idxhDHwbfxWbulFDF7QKfk4vjQYzVxEh7XQ3vky76ZpXJEV3PT2PQmvzS7V6PkFEJvSUiP7v2tjlWx9QBBRTK0bGaB0/baKkZelC0cm4LM34dVKgtT/oO1DebeFwggLtTrdCbFhvkBLwINNFYk4I2kKiJHBAAbAc7DgSnHnEccfteSjLLIWgKueEOSTVXOZwc+JqRvJ4v5u3tp6OrBmxMy2zs4A3yHIOc4KAMF75B+FY8T7bDrzFbdllPrTG1l7RehAQRDkvxzZpPszTpBt+70QOimFrM+bTANeL2bY0w1ESRDiLANEW43+ab6L63rotGTL0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YedCAl/i3QOFkQGLpd7RciM9uejEanI0+GJ5rwoUaeg=;
 b=HuFUFFXljhz4pizKkwCROMgu4sW13LARfYVuPQje72jZlbcjcPaG7CLJBNULuWNCBsMsn4Zdrudf3Ecj/Kct2mY7q5JJG69fPUD2ahdsM/vBXaRgWvhCtW4yOf418Gl3GCWcsnRI2Sas1vsohctNWlX6nTtJgurvfDwtWPqqtBDRoyJRMkhfUzih3859iOyOEHHc5Asl7y3aB4AmtkX+WsPxuZdsXU6+Mkv/UoqRU2VqBeyiiSUusJ21lfjHCpOFASfERfvyBDi3GcmU0OCSNqVwFEspSrOMcV5AOtY97fsVQqPT6q1WN74JEW71Mnf0p9436Fqbph8Z9uOLQH4S8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YedCAl/i3QOFkQGLpd7RciM9uejEanI0+GJ5rwoUaeg=;
 b=daRoKNJ9ycWMv2WA2POt8NmnyXx4It/zOyXwAFldEgV5D1rQuou/qb14S+HJpfdzL+Y8Vyx4LmRERkd5sWJYUFAq4I+CdP6akPMyKKU9fZ/4RqWemd4Zt3H2eMge73iNMH9tnA7zLkyH8MGhySTqvk0tYWARjTdOTRbkkxuhj2MItzBAwdLEvNrsoxxjdu7kpgI04qH+yYyALLkux2Y1rLu9gm91BF7r/y9Gj6Yy1FPx2FuPF4Vow1Cql4vht2R3KZpVM+7cA937WtFAb8SMgM9bHRQ2Ul+ttGrnkQcknNwFTpcbu9bZ9HymZq8L9C2FUDX//MpS3v/9EBGLNREFWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10647.eurprd04.prod.outlook.com (2603:10a6:10:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 14:41:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:41:04 +0000
Date: Wed, 16 Apr 2025 10:40:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 02/10] arm64: dts: imx8mn-beacon: Fix RTC capacitive
 load
Message-ID: <Z//BeYVYYye/7lkV@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-2-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-2-aford173@gmail.com>
X-ClientProxiedBy: PH2PEPF00003855.namprd17.prod.outlook.com
 (2603:10b6:518:1::75) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10647:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d30638-b1a0-46fc-7e5c-08dd7cf4b71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kpTeRaomfS4cJ3wWuDF+cBR/fSEuYQs0hSToN8QibnEXMN3iRHJciSZQL6wR?=
 =?us-ascii?Q?MXx7GkOcED3WmY1I4+mO3p7hPRTRcIyTasuOv6oaduJ87fKdYBsY8BpBnJgD?=
 =?us-ascii?Q?1+7Gp44YyCZl20zETazq6FbYl2yhF5oE9d9uGVhCZjcAp/MkrsxVOhl6dR/I?=
 =?us-ascii?Q?8xMDeNoOScPpr5INym5WG1XGAwNg2zAQ3O8hUoJfJAnuXWboqjVTEo2QsXfv?=
 =?us-ascii?Q?n5un5EKetzkDM+LQpe7NGZfilIDMLiA9jtEiTQofDTa1/7vb8f65YLE0XKrZ?=
 =?us-ascii?Q?9iiyk5O+aP3qP7CcqwmFksrB2SZTLE7drR+k6baUXTI6ERyYhdx/tG4oWTo3?=
 =?us-ascii?Q?VlSRYSqFrQxpzpSgfTbIYpWs2IK0ts9Lsml7Ssj/cytakAlHVI/AKD4CdZpb?=
 =?us-ascii?Q?2KHm/DbpTmFD4e2LhChw9Cyt9y265uoX06Ya/kpaS1WoHnocqSwCT2mhHRCq?=
 =?us-ascii?Q?uzMyHqx0e3SurFViAwSKz9WkzqSKUR/pmc6d45sejpbvI7C/1AEerandD63Q?=
 =?us-ascii?Q?BR24g4kVKtgDAGjpz/WWZiZ7CtrF0b7RhBZgv2tkKOjPfgZaHlczi1akRLYx?=
 =?us-ascii?Q?VQ8NF12Za7t5hcJPzWlHDgeeuOt+wu6C5QtvSD5ug8t02L8Qf8BuYB+FsiiJ?=
 =?us-ascii?Q?gIrHEu5YQV4PezKFHXLZ8BwTSLlPT06xzX8hT0Jkvd16d22BhWqUbNAVU25z?=
 =?us-ascii?Q?sz+pNvG32mYum5nM2FcMFelCF+82m92fb3zRFLbyeippaBHB8YCRucCtgx+D?=
 =?us-ascii?Q?w62h9YXg+cbz4Ez68Bk1V3NoUeUcQNsiF5KWUXWBeGZP6wA9audyuYc+HMmq?=
 =?us-ascii?Q?dtnPWrb8aXk2tz8rF4oH+HrTMNmgaqPBGWr088obTs16SRb6tHhjQR/9I0UJ?=
 =?us-ascii?Q?0NMpWVR/9C/8GlJZxhtLj87IOZEpmgG0+VEeZGuunDUacipnhujD4Gp+LDnX?=
 =?us-ascii?Q?pyQ14gzVbqapXJnEoiUI8wnfxGu1WuTajhx6U9Le96UHOY0IUupErbcheIOY?=
 =?us-ascii?Q?L//hxkROvbNGOlkNEbHFdiwTsW8FR8cN2r+tMLsLP/lpcFiPitq9m0yM5R0r?=
 =?us-ascii?Q?ahdkCWJjJla+Lt+o2lavgRc0GybeD0MBM0zPlr/fs1FrQVT3GDJ5eXC8v3tV?=
 =?us-ascii?Q?Eq6Qwzko3EfClSha02AuJ26VUImdf17t/pCODrp3r2mwR9TeBzWl/PJzOkda?=
 =?us-ascii?Q?j83R+ljsn0fIwqu1OlLcytv6W3gIg9EB36/PtrbmUuHe2h0canFVxZg5RStk?=
 =?us-ascii?Q?Wg2dcSTbG9YPC5w8XY60IoOXNfWSgMBjGPQgYqAW7TPQx1SlanHtBZPNkxzR?=
 =?us-ascii?Q?1yolyzxE3hm3iUMSl5MkczQlA2KAmGepSjJaX5C9Q0y6Nvd6AtCgUNMTVRIw?=
 =?us-ascii?Q?+6+2ahhdhSqD3GCFGsXAmtWk+h0gT5au6oeeLuPFzFicCwLBJj5lXK4JAgw7?=
 =?us-ascii?Q?pYKkqNfzV37lH1vEQ4nvbIFGmDSIwgxlHk+fFLOA5Cg2/wydTE6RHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GNZkivONaLrAs1WsB212rHt0dcfvgBXshq+xuIyTc/8nQkeV6siBns1W6cRW?=
 =?us-ascii?Q?YPc7W7EzirEMj2hAEprEH5vyh4bzzUjO197r6mNMkIns8cGVWKB+9RC3IHvl?=
 =?us-ascii?Q?lRm8WkRYbv3W2ges0g0GGXXLrAXV1p83nXAfa6mmMIw/fPjOaLKO0NWhbzA8?=
 =?us-ascii?Q?XXfVf9YfEynq30Fhssw9AzdEcxjT31gDMq3xxHK/vKKOigNV6rWVhhizY0WZ?=
 =?us-ascii?Q?Wv8BYE2bHKyYjJqf3a5jD/GhyjCegqcXpSQ8B1GfeBZStYthcmg59Rf38ssu?=
 =?us-ascii?Q?+jzPlxXzR6F5/ZQ6CF0KGWkvh4PieIqkKIBUjTWnsiNsD7Z75qXEX4zEhV1H?=
 =?us-ascii?Q?1BvztxkQti7bGVJoAopkcQFxFMX7/8b14R80BDmjs0TrrA/0kzrv/qSiQvHV?=
 =?us-ascii?Q?ICAyn9VmxcatiJI/Rvf2YJ0VGYCjepmtap190285mm8yV6Zjas1/GXWD5j2A?=
 =?us-ascii?Q?89HQobvfrcg5dxdIzQIkPDqPehUxuW4iaWKrDp/Igl7Rgt2/60K8ZIaTQII8?=
 =?us-ascii?Q?ipsJlrAbRt3YayH7hQHRHpxEAtbBm7eRDmy4yesWRfy1nuc0GBwRe32IHa3s?=
 =?us-ascii?Q?NeITVgFoIO3Nu9SYpzMtdm6a4HxNLQbH+IYxa36kgHadydkjM+y+RrA23k/9?=
 =?us-ascii?Q?c2o5aMVqDrVTP5sKdxO9lUXxCVJPemdbCFjI4HeGm7Ytbe9REnqm8/gKYwCw?=
 =?us-ascii?Q?k5lzLlH9FWfVsIeMWWoSx+WbUVQRVnbijMuUkYfliA6Wcnd8SEIB4bAO3pTO?=
 =?us-ascii?Q?RqVmrmEPj7Y6UoHZbzHZhznFx8KLkM9xRSDro9JMSXyaJeCc9fW5XddwghWq?=
 =?us-ascii?Q?8ED423zBZ0xpYdUcqpvls3Luz0XfwjrghxvwAvYB21+mJOq5vfs7ATkJQC0u?=
 =?us-ascii?Q?988Gqjcb39EeQUEIC6dwuWp94WD4MoAej/ZGgHwCFjcDfa3a3rHkysEm8S7f?=
 =?us-ascii?Q?6rkcs4MezrIv1frVYEZMe+gdFkDK0MYekNuM78sjoBbSlZ85el+/50tKbbvx?=
 =?us-ascii?Q?eViAIn35Dz3oU3SRTD6U7KbvKIPd0abN5kFl1VkXT5i1s6VtSsRUhOLt+Xy+?=
 =?us-ascii?Q?MqAGRjbC6eQBsBBpd07jHHt4WAElWcAsuRY/11I0I/AlWMUvsbnBCRc5xbRp?=
 =?us-ascii?Q?N6RMHt+WRqlJsQnHj+ly+8PDRR7Dnl/yENNbtg6vaoLbeYC49zCdi+bJkrGq?=
 =?us-ascii?Q?OvclE/X6N+FAEgE/99+el1rN3O0insWgW0cc2xvaJBmKh9hoZ5wVZOfjGfnd?=
 =?us-ascii?Q?1s/Ak6juYMow3IzK0mDivwy2po77rajagywz9Tq++XyC8HRFE8qpG7+kd7nJ?=
 =?us-ascii?Q?6bteD2R0O8hV5y29nMXAP7/foDCZx+zNKO/j1/YcpiA9Dzba4PSVTKusCZlF?=
 =?us-ascii?Q?W7zE2O6RYIHFdimZIkZjY4hKufT42V/6CE70+4qyCdi7M+Sa/BXveIgjWICX?=
 =?us-ascii?Q?LIVYws1JSeN2YMRUsbyA3DlHU/Btsmozw9GKoCyKeYUT+ZWOYAZDnKiFHPW/?=
 =?us-ascii?Q?e/BnrK6wz2mM5YH12LAG5Ggyda3k1jw//X/RJJaBYJ+fm+1tjPXHUDbSV/AN?=
 =?us-ascii?Q?QTvEcM+RGoj62guSDURkdjhUHgjwY/05VYwMTrur?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d30638-b1a0-46fc-7e5c-08dd7cf4b71d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:41:04.4750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAnYECHvcbKSq+oT+fflS1Gd5k4DFYNrqoGDDZpc2/qhw3tu4yj6RClAIC8Sueha1a3729jzqkS/iplU/a0w0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074109_798729_F787C51D 
X-CRM114-Status: GOOD (  16.25  )
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

On Tue, Apr 15, 2025 at 08:01:28PM -0500, Adam Ford wrote:
> Although not noticeable when used every day, the RTC appears to drift when
> left to sit over time.  This is due to the capacitive load not being
> properly set. Fix RTC drift by correcting the capacitive load setting
> from 7000 to 12500, which matches the actual hardware configuration.
>
> Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> V2:  Change commit message, no active changes.
>
>  arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> index 2a64115eebf1..bb11590473a4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
> @@ -242,6 +242,7 @@ eeprom@50 {
>  	rtc: rtc@51 {
>  		compatible = "nxp,pcf85263";
>  		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
>  	};
>  };
>
> --
> 2.48.1
>

