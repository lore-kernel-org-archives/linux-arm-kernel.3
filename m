Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E67CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrY1vC629cDqdzPFpOwsItfoYUOhl4JR4U7eVl2MbKM=; b=C+Twndcn3zWnMDhRe9znGUFCda
	EMomlnjM3ZqXomeer4m+3DR81+Px9GFgNCibU/1/JBAXDv3rGLiGczS630TB35CWKJkxJGcw/Ow5l
	mWncsuN0oFRCkhj9q5YUl4myryP9mOA6GIFVnI9m5dxjenx9szIHlV4pltP+YCL7lVu6OlFZT6Oz2
	pmU3PN1sAriiT2yBbCTOEtoM8onE8hDe3aTlfXiYFwmzBxSDejSILF8APHABtXKNXpLYiO9EuMSmY
	I9siD2sUBDYJG3P92jGHMaTVeFbcirmhiPA6JdhCP/svOJOj0uYv1p843pSmVg5+uWUb4VgP2XlsH
	x/0lvYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIP-0000000Amdp-1IZx;
	Tue, 12 Aug 2025 12:40:05 +0000
Received: from mail-northeuropeazon11010048.outbound.protection.outlook.com ([52.101.84.48] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull0y-0000000AKps-3cu2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:09:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xu7Cp/LwEi3m9Qii8flp2VklmhSrKoULFrWNyEWvnUx5QpZJ0WhhN1ySq0MkyeeKo1nWVlfCitvoEW+L6bGLeNi6Ed3/dk0DNNxV1ICc7r22T20mTalReTRUDhnkG1xody7c0ITVQt6cKBDCic9WLkCC52bsMVBymLUii1BNMXSBwF3LVlaCiuodQb0wSH5G93aLZLJLP4keARXK6ym0XJzpmGzo/dZbmFKxYeqe+fujc1WWmauJEyim2y2JjHIlwY9IUR6BWt3vLLdiYbFq6ktjO7Eq5ROmRP4zqXNEI8bf8xgesAn4TLE3WHq4EYpFTtohDwGhVBMgeUTfoswVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrY1vC629cDqdzPFpOwsItfoYUOhl4JR4U7eVl2MbKM=;
 b=eJEjYB540Gj+a+Sp5NPl3CPYDabZji78rKLhSlTwhqrtStF2raRuSdIddGjGzq86GXBgICkITNSaXLnsmU1UpPQCdnH32fU82VZ+Iwymx33FqIHsaRrsbuX0DGnLf58vOn9M5DIMKjhTbTKtjjgT1FxOW8LVWgaee7nCbh7AA9HyzRFTPwCQAFqLWE0/76vUDHIO4HDd1SWrxPn31NpNIKQo9JbJKEnt5QI2oGrNTxJPAkkpO4nsFORSX+l/iTffFX+DB0h7AfGevvCzJ0RJ4hXs3r01i9/VCBkJdQ0S9t1F6Zs1nOwcQZUk0aFUqMNsZK9STqg0KIJmfcsPU0ahUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrY1vC629cDqdzPFpOwsItfoYUOhl4JR4U7eVl2MbKM=;
 b=e4bDt3g48JsQHN/xf5Dr83Y4HsAEmgIeJ91Hq15OQar3+tJzJlUQJqfL91XyUzT56ePt2iEI/2bk4YUGEccF8jEoj4meYITTNwJeO6gIJIHppyj97OJvi07s+R3SupdR1mEaATLOL3YpS8H7m09KW5X2F2LIW9sWSGIKjLxk5BehlSxe8mifamZeHx1DJ4MluSq9R6Efw6xCgIOL3rUvCQfxQ1j9axl55TZdcWOXADtdRA/Ow6o1IwaATbht9dTKTAwe8unRWOoy+fo+DyhTL+gHf0P8+6N7e6HET8EMFsS/ezPhYDiFkWy/Qlx/BlfNivi44/RKkvQvt37d33LQEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 09:09:48 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:09:47 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v2 3/3] media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback
Date: Tue, 12 Aug 2025 17:08:44 +0800
Message-Id: <20250812090843.1035800-4-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
References: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: ff692904-59c5-40bd-a0df-08ddd97ffc1e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUJOVVE5NTFBZ1lCTUdma1lzMDdQMWliUFQ3SXQ5NVo2U1JjR2xaK0d1dFFz?=
 =?utf-8?B?UlRrRGxSNlpITmM1QkxNWElXSy9pMy94aU5JRWNYejV1SWFoSzc4U0JYWDVi?=
 =?utf-8?B?SzdoZ3Q0bGNjV3V1SlpwRWJOM1NzeHY3V21QZ29UV0JZS1BBTTVuaHgxVnoy?=
 =?utf-8?B?enk1QVhEUjZrRzM1SlY3aUZKOE01aElQenVtUzRkeTUxVWNzc3BmVFNWaExT?=
 =?utf-8?B?Q1JZbWp6UmNsdXR3SDNOMEVySEZ0UE1ueGs0dVc2WVc4K1k0dmY2SFhUTU5z?=
 =?utf-8?B?T3daZHR1R29YZHF2MWl0OGRzUFpRZ3FXbUc5U1pHeWxlN3o5TGNRQ0d3UTZE?=
 =?utf-8?B?UnB2SU1ZOEUwa3JXeWhWMStKQ0cwdmZ4VHNQSFJ0R0JPaHJWYjRjMUlnaFNw?=
 =?utf-8?B?Tkg0SWdXUGhncEduczVBUlJ0NThTNkMyQURjU21qY0c0SXBMa3c3VVpuZlM2?=
 =?utf-8?B?TW1CRitmQ3R2cDJLQjNZZjBCcW9uRE9EWG92RWlmbUJuRHQvOHE4MUtHSkhM?=
 =?utf-8?B?dkZyUHFRTVY4VEdsZzBPUUh1cEh1OERudmNOeDJ4QVZpVVFTTko0QmZoQ3N0?=
 =?utf-8?B?blFSVDk1ZFlNVzE3K1ozQlRiTis2ditUSkplY21ta05GVk8yU21XRjBWYWU5?=
 =?utf-8?B?bzl6dTYwVW9mTmZKWGtkaGk2V3UxRk9UYXJhYXorSUwweHhPL29hV1ZGLzd5?=
 =?utf-8?B?MmkzSmxZbzJWd3Q2WWtXM1luTitUZE1teDdoQlJRai92QU1xM2QzSHRuRkFD?=
 =?utf-8?B?Wmcwamk3b01IKy9Ha3F4aUc4RUNZdm9qYllLMVZMYnVMckorTitFcmdpcXdH?=
 =?utf-8?B?TDJCZnVYTjBzd3JPQ0pZZGZwbW5LUkx5TG1wTmM4eTlnU1M0VUJGSjlRQnNi?=
 =?utf-8?B?S0ZmZXk0OHVMNllyekhlMDVYdU0wTlVTbG9nd3d0UEpnQ0RNWjhRL2NVRXdM?=
 =?utf-8?B?ZUM0Nmd0S05Xd0c4Tk4xTHUydUNxWVpiWlF1UmhOQ2M2QklvZ3c2RXkybE5o?=
 =?utf-8?B?ekVURVV2bXozL0lXMm51ay9lTm1XYTBRNDNCTGRXTGNiSC9aQU5LY3c4ZmNv?=
 =?utf-8?B?TkJGY0w2ZDBhVlF3eHdEc1l4bVpPZjQ1WUdmeitSNnVtem9aTXRZejhObzg5?=
 =?utf-8?B?bS9HRHBOZWk4NTlYemVHUFR4ajRWaWVTMXdhMGhsejc3Wk1CQkk2Tk5DUjF0?=
 =?utf-8?B?cFg1aHF6Z3BpQkIzUi85ZjJMYmZUQlAyeWc1c3h6NEU3TlBIVHVydjFub2hZ?=
 =?utf-8?B?UUo4ZytqQVB1ZnJWTFhjc2Z5VlVHZ2FQNy9zY3pyN25BTVRub3BDK0pNVGhw?=
 =?utf-8?B?Q1VacFQyQXluV3BTZ3piSE9iTUQrc0pSWGdTdlEvcDBhSUxwY1paTmtjTmxp?=
 =?utf-8?B?Tk1WcnJwZU4rY0QwZ2FYN0V3Vy9lQ1A4ejBRTlpWMGFUTUF4ODl1RVFRdURG?=
 =?utf-8?B?UUFUL1A4Mkdsd1lGUUFqNkhyendWeVY4dURLUmdrbnlwWDdZUmd3dXBYbnpF?=
 =?utf-8?B?bDBBK2JmK05Ca1JORGFrTzNaMFExaTg1eUFaV01lekZHZUJFYXFsa01mblk4?=
 =?utf-8?B?RXFMZ0g1N1ZDeUtCVmFaakdoM2tDeWhVdFlMZjV5Q2JTcWVIbWNKTTBnVWt5?=
 =?utf-8?B?Vm91blJQajVuT0ZpalVNbG1kL0NZVWVrTkZ6Qm51SldwdnZHdUVEcmdTR2Vx?=
 =?utf-8?B?bzJaMmlGUkY2R296R2kxbEZOREcrR0o0MjZ4RVh3WitEMzFCaG1oRENQbFh3?=
 =?utf-8?B?T0xqKytKRlI3cDRuWjVNT1dCWGx5SXhnWmZlR1JER3RDR0FlQjlzZVJncTAr?=
 =?utf-8?B?ZXd1TEw5ZFNKUzdOSmNNS05WR3NUK3JaMVhhVnJhQ1hmWEpZQmUxSUQ0WlhN?=
 =?utf-8?B?SzdEL1E1aXdqL3NNRXp4OXRQL09Dc3pKSXIzMXpjVVNpbHRYUmwzL0VQaE1k?=
 =?utf-8?B?cHBOQ2JjcGpOaVp0VW1Bdks3ME90WlNzR2lJZGFhL2M2cGFRQkd4OFk4ZDNt?=
 =?utf-8?B?Y2pvVkFBQU1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCt6dm01WC82TTFTYTYwYmNuVnRuNVN3R0VtV3FqdzQzbm1YbG1RazUvVy96?=
 =?utf-8?B?M1dnVVprUGRkT2I3VEUrbExjZW9EUE9hR1hIM1lTdk16QzVjZXprYU96UmlD?=
 =?utf-8?B?N1dYR1lTNTdKV1p3RHNvZTlhVWc3WWZUbXJtbGdnMmxtTEkrcDRLWEZXVXRy?=
 =?utf-8?B?TGxEOXJQZFRFT2RQT3MremZRbWlBZUZMVzRCcTY4NlVEVENhUi9NRmdWRmZS?=
 =?utf-8?B?NW1pTTRtTjM5MjFnTEZPaHFPYjlTK01uTVBDaW82bnFLZEltNUhLZ2ozK1U4?=
 =?utf-8?B?bVVPcmI3ZXlrYzBSSXFYMWxWYThJVjZmQ1Y4RWhweld1d0FwdHlUUnVYcWQw?=
 =?utf-8?B?MExZZFRodXN2TmtVSVBHS3I3QlM5Yld2YTcrVXMrT1hhVkFzVGZCTGN5bFpu?=
 =?utf-8?B?Nk1PWG11WHhhZFhVRWNUWWtTTSt5VWtWVm5BekZ6NWxxbjZLWlpPWXBMdnJT?=
 =?utf-8?B?RTZzRWY1NmVxb2pNN3NjYkNKZDFCOFNyMGgvZ3l2b0sxTUpCT0JMaVJPRW5t?=
 =?utf-8?B?ZUswZEErbUE0clQvODd2aFdpeDJ4N2xidHBLKzBha2MyOTJGNkpWWHFOYUNF?=
 =?utf-8?B?UFBYaWlMclZIREt2U0tsQlExN1VRcHQ2VlIzUUZPNTlyK2d0aUF1SDZhdVFu?=
 =?utf-8?B?cGwxaVplS3VlNUwwbzRmUHFYWmJRaGVDY28reHU0N2pabGt6SzZObzZCRExE?=
 =?utf-8?B?bllVSkxHU1E4SVBhV1h3Yy9FeGRLczFFUitVUHlxRUdJOUpvQk9HY1VhKzBK?=
 =?utf-8?B?VUNTQVdNNkVvVXNvVDg5MkkwbGZJT3hRUmNaZFNEeElVejBmbldOQU9jLzdV?=
 =?utf-8?B?T1dwZEpNYmh4UFpwSi9vSUFMNFZtd3QrVWhiZ3hKOUdXcHV2SEpLMXIyTVhk?=
 =?utf-8?B?OUVpa2F3R1g3TlRBTGt4K0V2WWYrNHYrRHlPd1c0ODZpVUhjTHVZWkFvdWNo?=
 =?utf-8?B?M1hQUHIzVWRpanV5bUVoVzJmRkdMMzhWQ3gyK25HeGEza084Mkt2cFdhMXBR?=
 =?utf-8?B?R0RkdVZsRWpoTk8zOUQvSDAvNVNWdEdFczhNSVhtYUtnUUg3bDJBYWpPaDIw?=
 =?utf-8?B?TWZOcXJEWmsrTVBlYWxHRlBsRGl6Q01CQVA3UEJhcnZzSlNRL0xlbk5uQUZ1?=
 =?utf-8?B?M0tISGZrZkptTGdqUFYreEtBaHRxTStxMGxpaTEwNG9yTDBmRnZzeTc3MDQr?=
 =?utf-8?B?clkvMlpFUDNuNG9IMnBibVhwODMxOENNaWQ3RHZYNXZGNy9DZzhFdVpjNjU4?=
 =?utf-8?B?TXBKZ3p6NTRPRmdBcVBJL1dxZTJsaHd0MzRvMXhxRkhTWjhWR1owNmtUWnd0?=
 =?utf-8?B?Y2ErdjFsTVlQZW41eWg4ZnBBaTJmc1hQVFVkYjAvLzQyMDAvaGtOUWdPdDQw?=
 =?utf-8?B?bzJQUjVRY1dGa3JmRzlpbDhZalhWQ0FiS3BCUXVYcWtOdzlpZlNGT2dyTzFO?=
 =?utf-8?B?UUhPbjRPNVo5Z1B0bHFkM1lIS0ZLRUdKM2F6WTRYRXI5cThNZUIzN3gyMmoy?=
 =?utf-8?B?ek5MU0Z2Y3FBcThiSVVVUVl4c0Vwc200c3Q5MkhDeU9hcE03bXl3WGZwZTRL?=
 =?utf-8?B?TmlkWlBkU2IyVEk1YjJKTEdMdXBad0ZsR2c3a3pONTRiTE03UldvUGhsWUZX?=
 =?utf-8?B?U3BndnVNcE5YcW40OUVsd1h5UHB6enBEbkF3NGNDZWZQdmFteWZ1enU2aGlu?=
 =?utf-8?B?QWV5czlNNHl3czBQRlpsb1R6cjBTdXJqWDVLby9hMjZ0YkNtQ2IxTmIrYzlE?=
 =?utf-8?B?YytYRzNXNTJtQ1lyUjQ0WUMyTG9ZOWJPc3ZsdExWYTNYL0l6UnNwdk9GbEN0?=
 =?utf-8?B?UU1GbmpIbmlFYmN2eEc3eDhFRWVxanhxdTlwSEc0bTRYanhxc2N0b2FJZ3lP?=
 =?utf-8?B?ckoxbGJEeWdNd0FMRVUySmNiOTh3TEpQdXloRUZZL2gwUlRXbXhhT1FHM3dP?=
 =?utf-8?B?SytkeUJpUksrZ3A1K2VsdWdPMFFJRVNNTUE2QnAwMmNDbEVMa3Bxd1pGWW9V?=
 =?utf-8?B?THgrUS9iSDJqZjFRdlV2K2ZBd2E2M2JobENmaXR6SzV2eVJpYWowYU15L1ZV?=
 =?utf-8?B?WWs5UXkzZmdDWGhZNldlVDUzVmRpdVhRalpmd1BHN1NJL09OS1hhVCsyVzRE?=
 =?utf-8?Q?4ilfccm7inseimz6LjhSjDOpm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff692904-59c5-40bd-a0df-08ddd97ffc1e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:09:47.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfyqaz47yr1jHBVCd6Rnyh0AmIBGqrEqCLCY46fRVaYGpGtpSUW4DTDBPeqgO+UJze7zOM5NfB6XSQgHjqDGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_020952_908952_66297CC9 
X-CRM114-Status: GOOD (  12.32  )
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

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Implement .get_frame_desc subdev callback since downstream subdev
need to get frame description.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3de9007ad122..ed6578f7f0f9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -689,6 +689,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
+					  unsigned int pad,
+					  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct csi2_pix_format *csi2_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != MIPI_CSI2_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
+	csi2_fmt = find_csi2_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
+	if (!csi2_fmt)
+		return -EPIPE;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = csi2_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = csi2_fmt->data_type;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
 	.s_stream	= imx8mq_mipi_csi_s_stream,
 };
@@ -697,6 +728,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
 	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= imx8mq_mipi_csi_set_fmt,
+	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {
-- 
2.34.1


