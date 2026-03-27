Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D910F284F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1hDdogGyke8gjtXhD5G24n+MAtBJfTvduOJGOs653E=; b=NxUWFni5Mxc7wX48/fjRRXLYbr
	IwK056RItTADw6qXsacaGPc9SMVEH5gzNelyaGXfKGIqlzXCIlfwwSSjbgogpgOGkdlnRhYZ6mZWU
	9Nls240r/FvEEipeTSBM6WZ3ZfbCXZDrG95Kh0jeHWmMkc53Miid6FBqeOg5SYGUxN9nESkeyfms3
	ceALX70CrryELPYTHO6KFPkLCA0VJ/27VlcaGxtembkkQ/lV98x08GDiLh589iVPJxWrwn0Vnm4nW
	BGsj9MbWEumsFoFhWVRJoLH5YH3yFGBi9H798Siy9jC86DSRVqKRPz+9qFI7xAAqdThWar5VrijkF
	O0CqHL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6APM-00000007oGh-3Dfo;
	Fri, 27 Mar 2026 16:51:40 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6APK-00000007oGH-3duF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:51:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvnqd/dFdtdNDkNj3fVz9McZA+j6cLGVURct4qzB9Cq0iOktIzsMSgdpmRoPoTOupB+9MfNjBtv5dqLpfZNvvmxSf5DMiPMUC+zoTLAistuE9dfkoyHiufSE5ml8tbUvng4BHvtXYDGgRYBsnT8uACYFeAXxStkiKqtTdHvK5EabyNsI01yLF4ya0ndrj1y89FZeJgzGn8II8kkEzkAOtbqvSMmXFxoVRwPfxyPwspqgYldczZpAw98sAEyW9EuTuVxckv1jxAwUsEeHTOoLB+aPrSMTRa4ZDAYi3W2/PqbrEUeJFUwGb2Sr58y0Kkuc1bn8UKfSVstRXqQALIhKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1hDdogGyke8gjtXhD5G24n+MAtBJfTvduOJGOs653E=;
 b=BQ1dsoapAN4P/X0eg+Zqai4KcR6xnvFU0Usj/gPfE8ITj0dUpWuOi6QRErLv3chuzViQUB3cOyO7T87DIrg0uU1FrkZPfvPASAEGBo1s3f7HVTEEzy+n2ZG5ynkijTUAWSjCGtf3p4L7bI4f6CFIUwmlxg5cYdlz7CUCYN9DAEAcck4C5fSfB5Yaq7wRrBINTeAi5AwziEQlprtgvR04VYcJlz94JX1iPOsMlfsAQfHHWGiafeQNipu3jne6nYnlBEF4PdbK31pyUcEP8j1/rPJosnStDfC7vPf4GG5EFkyMnWClhKzHd6pPypgHe7iphkCIai1Leah9rdfh9YoMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1hDdogGyke8gjtXhD5G24n+MAtBJfTvduOJGOs653E=;
 b=nUc0F3HaPTVBo6rXIALzpDRb0gKHRMGrf46LDDOSeDFMcnL35Ft+Pmnm0DWuWOZRHA39OrsClpvIjOWNfMXMc0w/+YLdz1eZlnoLhVpZxh0qqXf2/102KuBjvwh66c17ijCPmLZq7RydLAXApCzLnccFlBRt2jDuLx3JmCHglHdEz9g36Q4CjRudEPDDgSoSq9ZXWhjzYKdAR/XC3855AB2JVYywUYmcSh5eMqndi5uLchwy3odPrP7ZCkZqUhEi7BPdg37swn2j0EJaTFpS6bBzANFhh5ryazXGToFsTsoYZZp5zeA8U3U4mHDwGqrl+HIgm67dfNXyy7GGC2ZG5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10070.eurprd04.prod.outlook.com (2603:10a6:150:11d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 16:51:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 16:51:32 +0000
Date: Fri, 27 Mar 2026 12:51:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
References: <20260327163243.17334-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327163243.17334-1-stefano.r@variscite.com>
X-ClientProxiedBy: PH7PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:510:325::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10070:EE_
X-MS-Office365-Filtering-Correlation-Id: c5abf95b-b214-4afe-e17f-08de8c2119ba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qIBRC6Ty91Ru00M+8KcVCpCf0cqWKrOROfq59iGS4SJXMA2+/AtEy51TAo4UzAp37ygnYJyaAL2eXnMEaY3tOJ4EG9hsENMsFW7DO0UF35x2hJbIsQDwcX8AKIQvU9xaUbMJn/Noi8Uje/Es7NgmPOZ2x9hbI+FHwZWIcOLfv/tJE1teiBVcVWfaU9b3N8dLhJk+Iqeb9NZMgqRU4O6WwgYhX/B8SxCMEuyPHmBiEFhoglLlSFmjP/4b0Z2UX8lY/Oa3j3X58zCgQM2GfsvNjJE/jPvB2ZHvcppfHCAk0X+amHB9nCQKdJ3jjEWxtU0B4UH0FzILfctElmizt6cI1y+uLue8zPQepMgo/Vx51EHVZNSG1t5e637Z23LiX82Syxq+T+x0Ln2BAfJ4nMEk7voiRzBXVGYAMaObznPNs+r8KIsx/iiSgIYSNIKIjgUlBk7F3bHbjsJwUzs6445NzCNrWvhCNLvVkwbcnIc50860KMWTIQflxTD3bYoEvOfwRClxW3CEJ9h6X43poUyy9EN1vD8LIGyRJREGkDV0OKyvGwdPFh+vPVlC/W4asAyWzaM/YI6xtJsV96IkGYt5MuE+mjevtV9X/tTA7/UdVu2HHoONwj4PG04e/uzI1vQk7gaDb+jyNSdtC4QRMPwIl18sHnqY9kdxLqIa1wtZQJYD9/PS9nEn2YYaWxemRSVWHas218jE3N6ITHNbmPxE3na+58ca0PZpiwCEBLrG7Ofhq9vCRFr0nfyKcYuxaqCuQU0xPP070wbA0qfx5s+G553Ein73rgWwSnO5d/Tut0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zEgh3icof8zclBdtlUSu1XAJtvfsbKZ1zmMUFBKeaCR3FSP2r1G/sU9ZgpJH?=
 =?us-ascii?Q?ZeHjQTNf9LDCgmfPgQDyb+H50OongQlxlH7n2V0mKiHOYtF4MGPSYhqEUKLC?=
 =?us-ascii?Q?M7K8v8cOPwTj8rvLDI9IKsM3V2OwfpvqgDGlL6SFyfeK5UWcVlbL2Tbt4bKU?=
 =?us-ascii?Q?f/aUeRAVicWa+2VBP4NKJvZDSkzHQZHrybQfjNjlUR9OTh2/1lvE4mRy1+tC?=
 =?us-ascii?Q?PRJOMj+089SL42Y9KOCYhQHhNarUqflVN+ZrqKh9O9ocs6oKX9uzJGvdVnUh?=
 =?us-ascii?Q?WpicRCUzK3j3l/hs8Me2hF2M2LOizKEOZVTMg8VIJOCP21RENg1/k36PmiI5?=
 =?us-ascii?Q?hWGLo20edTNWhWcAt0PG1KIMlsFV1Ee9SsQ/hIg4NTLhZ1VuJlrlxP/F1oct?=
 =?us-ascii?Q?TFSF8xBr7jwmGunfKKFwxgpfAwA8cppmqMeulj3rNtC8qi/YONitZjaAMq/a?=
 =?us-ascii?Q?h2bu8CCLI/H45sn078OLXBw/5/dRMpsZkRBgzo8iVFOAVHH7K0IbB7jUa2Yq?=
 =?us-ascii?Q?ePuGIIoEV2DPHKacRnhQb73xkgKVSCEqLax2J6dUx4PZIafhhFrvJC8YF1uz?=
 =?us-ascii?Q?YaxpAJj0U4VbxMTHJkh7G84pt4P2gvSrBJFx601Vc6jzepgt3riJyu5CSMaz?=
 =?us-ascii?Q?ZdXpFXmwv7yr1qZDjToPEM0azVqsSS1QqLmPCjfEp1G8fsVNbnodGbsx/W8e?=
 =?us-ascii?Q?lu7h/LjJHyZdsukvKXNfOc7EqkagkTg7JGuhCIrCRJ4De/lRD5p/hf90jIgk?=
 =?us-ascii?Q?iMVGjtvshFfCozoQrXX/GtWHb8otfGr08ErXewBTmivFwWmABRh/pDzpRx7B?=
 =?us-ascii?Q?03IJXQfC26ntDG6/z+KJ4MA0deDQJilI6zkf13iZNEBCSErykJsugu1CNdIN?=
 =?us-ascii?Q?bU/0D7KSHcUhiF/PLCCGdFjueOyoeMVubQlGK21ioJdrsU7OQWGJT/kNIWRw?=
 =?us-ascii?Q?xg39UQbg+c7jC+Zfv1hwXdyoQhUXFInSn8kwebslMfb109DlrIYkJ4uXUnBK?=
 =?us-ascii?Q?AwkzpyNoL0h6I82G2IJuTOG+/YmSMz/oMq60IfQUCQ0WZeGL9MwoiBv7Hj6b?=
 =?us-ascii?Q?Ox5nzBYjAlFeShQrORfzawGRKxpgxgVwCoH7qGHD0jzjtENH6lbmGYODcZwk?=
 =?us-ascii?Q?H0F5wrjsvUzfULfBxG3EOXerIqJon6BuoD9X4HgDUPqL5in/hL5lI7jlteqs?=
 =?us-ascii?Q?QmxXzZFXOGxkPJAp8T7pzk02vH+dmdogg2V4WZkUSlVygcGqUaVyAaMJdpNK?=
 =?us-ascii?Q?TPvaPRRL3ADSeLMt2o4OU0YhBRB1b+f1DDJGtDNNbGtmRByvTdp4JPicTae2?=
 =?us-ascii?Q?u2dPJhxek0V/Q8eRl5xAWiJ6nKKbdc+z+uS/2EJ/TY0gY2xF2+53f1X/JuXX?=
 =?us-ascii?Q?pvR9OGajMTrAnlN5mcotr9jdwA4aBHEzF3SrR77YtfYgWNEdKDJyiim110kL?=
 =?us-ascii?Q?4i+DKQXUHvc7T5eI1LIkiCBGL9B7sYnVQZIyTQ22XvWo3f1EBT1OK3z3xFIQ?=
 =?us-ascii?Q?+kmcJOLGqezzlwMAsFMBHN3qt2CiyN8lJjH3BABASv1SIWHW3ZuZiEFcR12Q?=
 =?us-ascii?Q?xHS5vUMx/JyYL1RuRRj67NPFoYE3MYvVlcm+iJNrOsRl3JknsfoLr7BWegdO?=
 =?us-ascii?Q?Y4fhcfnlVAmtN0vDwgy3MyiybWlw5Roj2nOscDjjCO2yPDrZ2LzCDSVB0vhR?=
 =?us-ascii?Q?Gbc6IOC2sKz7IToiJMOwJySypgRtv+XtZK5r7JdAMh+l/osLwBCf3QupjAFJ?=
 =?us-ascii?Q?+UyvGqmFiw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5abf95b-b214-4afe-e17f-08de8c2119ba
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:51:32.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ORFiIZ4oyw6toKJytwg97IMcO1CCippfxtwVDIo4+sl8gtUpPfiArluyKlOq9Iz9B52yFDFd5JsbKsAeX6ibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_095138_918060_DAC2A25E 
X-CRM114-Status: GOOD (  17.17  )
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

On Fri, Mar 27, 2026 at 05:32:43PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> RGB_SEL controls the routing of some carrier board lines on the Sonata
> board. The two PCA6408 GPIO expanders depend on that path being enabled,
> so describe the selector as a fixed regulator and use it as their
> vcc-supply.

Does below resolve your problem?
 https://lore.kernel.org/imx/20260325-pinctrl-mux-v4-0-043c2c82e623@nxp.com/

So needn't hack select as regualtor

Frank

>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> index afa39dab240a..3b5816884f24 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> @@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
>  		regulator-max-microvolt = <1800000>;
>  	};
>
> +	reg_rgb_sel: regulator-rgb-sel {
> +		compatible = "regulator-fixed";
> +		regulator-name = "rgb-select";
> +		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
>  		#gpio-cells = <2>;
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&reg_rgb_sel>;
>  	};
>
>  	pca6408_2: gpio@21 {
> @@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
>  		#gpio-cells = <2>;
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&reg_rgb_sel>;
>  	};
>
>  	pca9534: gpio@22 {
> --
> 2.47.3
>

