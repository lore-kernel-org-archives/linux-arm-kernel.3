Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B4C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvlgDf6Yvq35+fBumEAM1qR24sPwVNBgVJgj8D6IUeE=; b=WJo51wOIjDodG5KN9MKh6b3ULP
	tvRpQZAbBhBX7clOQeK228mumMtD9NL847o3gvHiwihmw1hv0NjKpXEvm/iJbORqD5BGt1aTMphXZ
	ghWKWORRR78yoab4wkHCAv6Av4LRP8ykoZmKUZzO2kffuukW3BAuzmDAWywJQbILSxYLu7iuh4w2O
	4e0AdfWLT3dRNtwOtt//jMkDhyLoRiPQE3QdR5391QNlFKsZzTVAH7r+wgxNrjhTL2Dhg+te6dVE3
	IeQkaLjfpcGwVUdNdnd6Yo9rP5y0DiFN6tG6I4Pw+Hisj1ZRvtMlwADnbxq6l37FgglSobe0drf+t
	qgd7zWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEwG-0000000FDoh-0Th4;
	Mon, 29 Jun 2026 16:34:28 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEwD-0000000FDnU-1qR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtIDlglHa2FoDV0wiR77lEMlTcfdrRqRy4CbgkvQWUPLUUnAbgZYm8CH17YySmcV97EB3dEWM88XTVt7Hrc2BlpCJ7UILaaJ45F0eT9Zjka3gw0dWx49N4Pcj6S2QM5W9wo+e8ct8oCf9gMWJsSmi5brmo/lxYjv3MryjdmZvfcjFmY9y7Ar8qs4WorUYZM3BlVKi5R+idEib+xCt+jaMe9Nn30zXlFwPqLF7RS35Zyip4oAg8aQzP6lJixLjVCDDB3C+ejkBVN4tM8hq1JGVw+9YnRqOTLkJdH3PRL7QAKDcON1pawMOA/FDnQy+KfyEJWf6ZxE1c4eu2TYfakZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvlgDf6Yvq35+fBumEAM1qR24sPwVNBgVJgj8D6IUeE=;
 b=nrOHgJQjToF/kzx7fNLqZ1CWkjV/pgOZxD26/krJAY/pB1lJwMZfI01osiaKTVjLMAWogdnkRGg4FDMAPkzHbCtqm2zJ9aCqltcQZUqNJcqvii38paJZhKxZOIbDDHaCy8pIRfG/UyxCdQv6i67ckJwF0evlz8Fu8Y9QV02n6m9yqQsrK4nQFemCBSnerigvAzoDGgvNsvUSpV+KA606hAs/MtGwazXYFmDWp7WEZzAQe4cXkL8MV1WhqMCIyFrIfshLtDlK/NXq6w55MOYGWrsOY1BKlY8+YsW00oo4OEem9Fdo3Czg+IgRY2SGZ+ocSzNoYJwxe+vKuqksz2Btnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvlgDf6Yvq35+fBumEAM1qR24sPwVNBgVJgj8D6IUeE=;
 b=NLfCxFkZW9LU83hfRBmT7McJa8hSkzUjJr79IelR39Lz/uCFCNnV5ltZiXXapPs7wGgMWrVyc2QgafTDMVtbpZ9F/t3+NooPtpOrDnezQIu+Efx/H3r0KGit9rjPx3BLlhPr7U0DC/nlJyx05V4y1SCxD1wuAIaryWVH+VhgYUANtMe+VvY8ifpSOdd65lai+/C0cNJqtH2Kvkwg5G0lUCzsvRFRAaAmljNSf8x7izTG7ZS1aRAJ2rmPSm616OyCKlyES/C8NokZKMnT+BNr7iFy+PJcImkWYlzBE5dIJK3pkVDMgJTmAOsSO0H7pJBapbOVqi+PnJzR2Q6nsmiv0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6922.eurprd04.prod.outlook.com (2603:10a6:10:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:34:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:34:20 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: (subset) [PATCH v5 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon, 29 Jun 2026 12:34:11 -0400
Message-ID: <178275083341.2286594.10476256286182574520.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2866b710-b839-4706-7d4f-08ded5fc4548
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ddhW4gq1WzIPAKG9UTxajxWrojgxSpuU2n/dOLZcuCme5yvFCum1XhNSAel+2j+H86sNAkafH8lOt8N5S35RPtcghitjJRb/IKpnmdsTbhJ/Uw412Q5UkxeyDev5O+MsNGLj6AzIFeFcnhiVXM1gSw353OuSv5ViezzfBzq9QHG4KRMtLqK0PB2IM4HySO8je9lS8tzi0phjHwvpf5T37gRGyYwC7gDBJtXjYYqHebV+Fpv7ViVOVid2Xj33a4dQL6d5Q8oEIyMpvF5iLZGRx9bmwYa8xWJwFRNQq4MJo9WumfJOr9BnKR2q/E5tBOjvQzCJ2S6O0XDanQg3Cq7BFDYnyO44nrBxxDykl4RdaNG/hmuH699qj0W7NOvvwuklpk0f6Ihmoki0nAtZ4SEA1eZ71sJ+XRFWURoLuMAx/YKafb5TV/jDJp8ehLE7cfAkgkvnsDNzhQ/mjBPGPBm0O1M4Gb2wiBSbECEvNlXZS1Nu/fCoPrqgqV8ii5PkCSsMbHao+K7ov6rUIu80xHyOdCXcYYgcfY1y5u/6EQ3tp10Oj1uV5Bm1qifhM51+k2SA+iTJ7AGz+udDyv/DMxjQxIjBA6kQdi/qUjdQW+C/ITTpI6JhzN/OcHU6/57pRPlSLIMgtw6sPbV/VyT1IHYV+7o285lSMjbRSxomyNdvf5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVplRFhKMnB6TWVPRTNWazRQa0N3UVNvckxJcCtWNXJsZzNaM1ZqNU1LMFM1?=
 =?utf-8?B?Z1g3UDF0S0xvdXExQ3VsMnpRUHRzK3A3Mk5mb2NzdGZUNk5JemZERzFFb0dX?=
 =?utf-8?B?RGp6L3dERkRTSTZzbGdPYTdoNUFod3FTYjdRd1RicDY5V0d6MTR2aG00eG1i?=
 =?utf-8?B?TWY1U2VOdFd5dEZPZUpMdndhdUJ3ZXFRbWcrQnB3K012dHBoTUEzSkNpVXdY?=
 =?utf-8?B?OHBtOEZYdXlCSlZiM0lDWmFrU1VrUGRPRzVSb1c1MzRTY2xLNVR4WW1kRFd4?=
 =?utf-8?B?Z1p6K3R1dklHMkZueXR3TVhjM1hwek4yVVpsNWpreVdFdDhhaGRKQkhxMTlZ?=
 =?utf-8?B?bEI3SlhJSDM3UWtVNGFuWTU5S1NIKzlhVll1SmR3Mit4RXdYN0VndkVYOWdV?=
 =?utf-8?B?eXlUdTYyN255b2xsOGlkZk5xdGc4anpCT1lZRjZyWmhFbnNQRDhrUUswQTU2?=
 =?utf-8?B?R1VGOHVWOFhxTnlvMVB4YmhMdkgySEVOaEFkSDZZd0lxYUNQR3ppb3p1YjhJ?=
 =?utf-8?B?aWNmd1gvNXR3M2VKTmRPSk1TTnJXVGxuS0NDTW5sYTVyUTF6ZE9nVEJlK0pz?=
 =?utf-8?B?S1B1T3l5WXR3T0R6R2F4TWx3VXJMY1gxQVY1WkFRZzgzUFUySWgwdjJ1K1Ru?=
 =?utf-8?B?cWpWcVhmd1BEcHVsOTZSOHU5OHpPMEJUQ0RuK21EdUhSOWpaSzZHSTVMWWVK?=
 =?utf-8?B?RENLci82QTl6R0l3OGlRM2hQYzJIQ3YvakdBTVRLVDV0WGZ6NHY4aXRoUm9D?=
 =?utf-8?B?aEYrSXdGT1ltN0JhcGlMZm92RTBIa0ZHVzM5SmtzZGdvdXdRbmdtKzJuT3pF?=
 =?utf-8?B?NkVrbXNLUmNOc2xwT2hYODN6VnRXK0xzd0ZaamYvRGt0WHh6Z0VEbFJqbi9G?=
 =?utf-8?B?M1BieHJxdXFzZVBnTk9pSTk3TVVOcjhNbUJYYnBxeUZVTmFEb3FiRVV2RFp1?=
 =?utf-8?B?OS96amZYR0k2R3RKV1RvWVRNalVJK0x1OWxiRUhwN3pKT0l5WjZ2MWRRTTZr?=
 =?utf-8?B?eHJuQVhwTmdPYzE1TFFrUGQ0ZmprT2R0V21yMEUwbUpQWml2RUg5dXh2N0xv?=
 =?utf-8?B?K1hveFBIZzFEdE15QjlrRFhQVk9tVW5KK05IMkxiZU1HdXpQK0hlL0pCYVJa?=
 =?utf-8?B?azJNQlB6a2FUbnQxOEg5bm5VWGxpQTNsdzJPYS9KcjZqbVR4dys0aFhaZ0RT?=
 =?utf-8?B?SWlWbjkyVkhENjNDeEhyb00wWERQR0E0eUNqYStXaGd5UkFBbHNsUE9nOW9K?=
 =?utf-8?B?RkdrV1FHSjNjYmc5QnVmSmhjb0F6T05lTXlkaU5jNk03LzdwYVZHaXIyZDRz?=
 =?utf-8?B?NTFRNFNTalFlV1pRS3VFV09JWmxhd0IzQ1l5S21PY2MxVE1XYTBIcVFSOGZx?=
 =?utf-8?B?L3N1RVdVYkdJWXlFWXVDaHBldUFsSkhjVWswZklQTUllVGRReGIxVGZ5bmF0?=
 =?utf-8?B?ZkVJQVhMcFRxVVZPNzVSemFDdWFJK0ZEczRpOXU3Vk9LNGprc2RzNmV5ZWdP?=
 =?utf-8?B?K3QwT3N3S3NmcDhzaTZJOXkzQStxK0RUb2M5WGxQakJmS3FtaEQ1VnlhdmxJ?=
 =?utf-8?B?ZXRablhTSUIvYk9zN0kxeEdvU3o0YTNkRFpvRVcwNWJLUlljaElZMjZvT0Vr?=
 =?utf-8?B?NG95eVpOaU1rVHNNNHhJeXFBNjRaTEQ0SkF4dFRQS1lUd2h5dkEvV2paeGx4?=
 =?utf-8?B?TytrVDl0QUVmNDY0aUNUSkxzK0hTeDY1QlQ4MFIwUUFRc0tCQTIxYWJpZHZn?=
 =?utf-8?B?TjVhamM0Q0drZnVHMXJJTmlpV095S1JrOG5zd0t4bW1MbHNRczNyQnRvUThC?=
 =?utf-8?B?RjJFYStkL0ROS2ZYRkFGYStaOVArVXJOOXExN1I1OW5UZlBRdDVSeFUvUU5H?=
 =?utf-8?B?VXBJTFE0SjhjYUJGTkZXcE5HanF1ZmJSalkzRlVpNW5KR3h1aWhLYVVUZW0z?=
 =?utf-8?B?ZER6UVlVVnJENzZGRThkdVlPQjcvMDN4UmM0UFZUZTNwZ281NDB0NE1hU0c2?=
 =?utf-8?B?MDdCSVVxT1NxcWFwTmxDa1RiNzBwaVVHWnlGbENMWUkvaUVyWkhQSWxDRGky?=
 =?utf-8?B?cHJiY1RTS1Ava1JwQVZoTFN3cnVaZ3VEcVRxTXpWekVtQi9HbkdJa01mc3ZS?=
 =?utf-8?B?ak1ESFhTS01hN05qbkRxNjhEYStNSDNUQ1g0bjJ1Q2FTT21mTEJ5T1dFbHYx?=
 =?utf-8?B?WStxdGZ3VDZkVDgyTjhtYThxdEhoa3prb1FLL2hTUTQyOFdHQWdXR2hJSTdI?=
 =?utf-8?B?T05aMnBCd0tPMWRiR0RUTWRzYnlxdHFBY3c4S29MMXp3eUl0bzhrdDNFMHNK?=
 =?utf-8?B?aENydVU4TVQvTTVkZ3JuVElHT1BEOS9SMnlHbVV0TXBXWkpHMVRSaGZOZENa?=
 =?utf-8?Q?v7RxZOoOOj7/NvLdwXGUKMudDUf0413dFQcTO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2866b710-b839-4706-7d4f-08ded5fc4548
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:34:20.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TrHQMdUgE0MBO0on8eoZQxsJx4Z8up9Dd0ZaL7oDU0Ydb+B9A54Yii1sp9B9cPViSwCTm96rOFnGFnghf2LOvOSDiYvTpzjkWhlk1YlrA+PqenLShel6le7QMHQseyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093425_478534_AB6E9802 
X-CRM114-Status: GOOD (  10.00  )
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

From: Frank Li <Frank.Li@nxp.com>


On Mon, 08 Jun 2026 16:41:01 +0200, Stefano Radaelli wrote:
> This series updates the i.MX8MP VAR-SOM and Symphony device trees to
> better align them with the current hardware configuration.
> 
> It adds the missing board peripherals and completes the related pinctrl,
> GPIO and bus configuration.
> 
> v4->v5:
>  - Add the SION (Software Input On) bit for the I2C recovery pins
>  - Remove regulator-always-on and duplicated vddio node
> 
> [...]

Applied, thanks!

[01/14] arm64: dts: imx8mp-var-som-symphony: add input keys
        commit: 5a7946c9753b159ea2aa6d2441c7916497696558
[02/14] arm64: dts: imx8mp-var-som-symphony: enable USB support
        commit: 41dc722afe74974c36c963b3a140c8eb2935e972
[03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
        commit: f9aa2804d9e7b969395a65d5464f8031ebc74dac
[04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
        commit: 5b4d6e1e0ff4ad63997ab725499272b117ed3475
[05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
        commit: b1c9dd9559059a5c7ccbee70a0f383ac19404927

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

