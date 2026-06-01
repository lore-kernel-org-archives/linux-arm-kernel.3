Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939CACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+yq/G6RDEpEEXzgBVEXVFWB2UadqfOuAVLpLY13evM=; b=yiajSrv70sEr1CxDXX695OqKnH
	jW84jJhRDeoVh+3ZmL1l7wIpfthYIxbvbIrn2ICavTahpUHbmiOQo0GQ0Jw8Usa0sHfm8TxIW+WLI
	49VLmsOGuYWkyYKUx7UYxC+HbdHqddP1ii0smDwlYYi6Xw/538Pn/XVxsscVcr2Ptl7qBDSv/MD/6
	lOjZJh+Q0gpGb5j7VyscJJHHJpe45CrEpFNpGkUx538+rF8bh74rqf9nWFw5A33hkOlOHRjb5Zffk
	U9rSQeVaJgKWIRTDGq9Dpn2ezHXCjGNIo9B8gx2Fo0V6cFQRLGv7Iv2xY7/0k0i2Z/pJQGfnvJIx6
	MCoUO1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU76X-0000000Be3V-3L69;
	Mon, 01 Jun 2026 18:11:13 +0000
Received: from mail-northeuropeazon11012055.outbound.protection.outlook.com ([52.101.66.55] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU76U-0000000Be2v-0IyU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 18:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZDbPM7fVtBH0AOtmM2nWMKT0zA6b3d4Lz8x64qv7zi3FRQ/TwbaK4t4grsDAOEIl+HYLfsfI867p5VWWRzYILNqDzaO9+i/vfckQ60ZIm0SrXAepyXGcA5t+KHqKf+aL0EkPwU/i9tEFIV92yjUG/ZhRUwZT0bJd4lddKBflVAJdsOfejLah4wgS0xVwDTa+XI2OZUEUc1suuVcqJIyUr8GyzraROttMGz6pswwiOet6BJT7MT78hEKFAJHkpOWgKKGMWUVmnsnCay74lRKZiKN6iirTwja0VjEZrgZTAevHrrwb43T/JXS1GeeuX6OCW9vEkvpS008596CWjQ2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+yq/G6RDEpEEXzgBVEXVFWB2UadqfOuAVLpLY13evM=;
 b=wjLtu0Puer4SBlQs2S1dBG7Z3ztvF/UiHe0hY/tfIols8zgtLQp31yGtBm6KdHID8oBWRCT1zP3G4PsnpgimoiuXdyXVDOkxkWokAgki89voEC3VyeHCA6ABonpcp3QU6nNBXH2ULg6WNr/FQ/5TT6wnpSSj92IGOu/DlcA/4Xco2W0JX127f7mORM1UfqzCCWPU21QWap1Icd6psheaM6ds4xL32+SLObHUj00Hu8y7qSAKCvru4wIGoz2Qz9h5DjVO7KXZR3f3XcrI1hkqrnBqejqah4vVmvdBNrZvL7dzf4QexdPhheAwcU7unlwOiglC+reAQGD2GC0eZ3yFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+yq/G6RDEpEEXzgBVEXVFWB2UadqfOuAVLpLY13evM=;
 b=CX6FmHitsVAU3iuprDcMl/fkGrc/riU8cSjjB8Set+tDne+6N7tESIVwTjoczy5oC/IHhJwtx1sDj+lCIKnS00/K84lEht2YPCSMjuZ1qbsmO/V1DLSb7LpJAGw+HQanPY+1S3HFzmJN8D0qVoA2A38ColI5mSgw8Xzi2gX+5s5UDt257TWrkT/8qk/ELkefTrevkZHJReh0+hbMi9t+I3SeizCVQKbRqPvLDwUPBpeZtAhCC//za4cwgaIU81JRJT74VRy03Fkthsm0ZYujuPoq5/OE3WBlDzzSVY1Ipaxt/twpECNADfMYDMqlFfLX/6DdbwH8lT+V+V3WHyAxlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11662.eurprd04.prod.outlook.com (2603:10a6:10:60e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 18:11:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 18:11:05 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
Date: Mon,  1 Jun 2026 14:10:56 -0400
Message-ID: <178033738931.182320.8991467833458902504.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055431.249960-1-sherry.sun@oss.nxp.com>
References: <20260519055431.249960-1-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132EE.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::36) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1fdc42-b3ac-4c42-b1e5-08dec009256b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: Uzal2Na+madR8Lb2XXR3ID7rcNvU0jJ6oNhkzkojr7XUkN5hxgrr1vRaSy0d3NUXa3N0GtZnvLEIn4wtOW1q3OhhR3FtINojH7Yo6HW2lhMh+WO2VaqTzpOvJbAwmVt/cX9NTjKqPUdgrMOiXBPDdvvb37mPP/9py4kDuEoavs92jmylPYh1vc2atR4WPTALK/5BoEylzELP8L/5jPW+J7l+q52V6nqWxoJCchbIgFLpAWjevYDkMcHmyW1s9JMQ9TriuS9uL0TpGP0HvdOrCvVeQytyD/0o+HXG0HHgm8FmIfFR/o1V/RxY2QArcldrRjqRS89cQdZdfKUZI6T1/NGkir/xrW236qTobocP6JswLUXB7g4f+ftdOb3Y757eanYyNrwO8jDyGuMfefvG25nd6Y24t7rwywRcYM1/U8IlgPtGzj3Tk1/ONifZgZj0kbxfhIWqP2G2fNUDjzr6xvrXtyXUtvSvw5jsWFZABXj3iHle+/vU12KP81Nbwn+UXSSc60hxu3LRAryeWZrXqRPPAqx+fATjT+oeslMlmlQ7KteGOMb5mo/qDVlGUDTBvcbFZSaB/8XA8SSPL9pcnnVFfF+viAGyDvaatfwazRG31sk+uvpkvGrlkTN+Td9t4/uznADyxlGHt/mlAHKvWU+52CUL+qJBIEUYeNS9vC0y7DOMAM1IoX2zRN6zGODr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVJJcEszR25vR3NWMW9HR1gveXZUa0pacjZ3SDFqWU1nbWZJdzU1NHgxdFlQ?=
 =?utf-8?B?bzhobTBrUUNNV1VMV3BMVFBOY2U5elBLRGxXaTdaVVNiZEIxTXpYZlpIc0Zp?=
 =?utf-8?B?NHNzdEswTDlqdEhOanNIejZHWW15WTZsd3VsMFYybytvOHdweFpVTU42UmU5?=
 =?utf-8?B?YzlSWlFON2FDSnVEclo0Z09iZUcwZFBGMnkxdHBEckJQRjJ2akV2RFJONW1U?=
 =?utf-8?B?YWNoRjBxbkE4amZ5T2QvbWl0U09jNEo5aEsrWmlYUzRJenFTUE9Iekh3M1kx?=
 =?utf-8?B?S01HM0Z3MHhwRm0yNGhweEtKS3FVTlJLV0pUTnEwS1g2aVFHMXFOMnlnUzcy?=
 =?utf-8?B?NzBvMDFzb25LTEp3REp6L2tNM3Nxdy8rZUVSTXhRamY0S045Ym80blNNcEVG?=
 =?utf-8?B?UjYwemZ4Um1yTWg3cDVRbFV6WVNIQnJyNmpzdVNnVEhZdlF0TEFaS2FlekRu?=
 =?utf-8?B?ZEZJZVVaUGZ4ZUxOeVlaQ05ocndULzVLbExYWlJ2N0JROElMeEJIbTJmVkx3?=
 =?utf-8?B?YmhDRmhtYTBIS1pkUjZISGI2RlBKUWlKNUlVZ1dPYlBuMHNVanpleGNVME5z?=
 =?utf-8?B?N3NuZGEvK3R1YVdLTnRXTGNVTm9ua1FBcWE0OTREc1BrWXFqcEJlMDFUK1VO?=
 =?utf-8?B?M3RKd0QvQm55MEdvTVlwWmJyT1JMcWUrTjc3a3lHUjlJQkdkazR0VmRaYWNn?=
 =?utf-8?B?UGN0UTdWNVQ4c29jTC9HZVdKSFRFSGtXV1pUZHF6bEpvZnpFOGZSUHo1M0hi?=
 =?utf-8?B?Y1dITDMyemtvT2ZDTVcvblZGU2Z2Ti8yYmNxckRMU3ZxNUl2UXlNV3BKZ3BO?=
 =?utf-8?B?ZmVrejhGaUZER0xXS3p5NVZEbHRjWTRlYzZGTVlDeDQ5L3pIVFhLWW56bDlO?=
 =?utf-8?B?QmVVeDZPeUZwR1Z0TVpFdHA5Y1A2TmYrSWIvY2M3VGI5dVBnbDRkOHpHcUQ2?=
 =?utf-8?B?TVNtQllXc241d3AyVG1hdUR0TSt5QXBsS3ZyczE2bVYxcHJKYW52N3dJY0hr?=
 =?utf-8?B?MGhBSG14NEphVitqVzRyUjUvWG1RU2FBNnY3M1RsbWtkOG9ndkZTd0xqczBp?=
 =?utf-8?B?TmdyYzg2YjVLVWZmU3N5bFlWUktma0xoOVpLZ0lJdW8wNi9ISHVSUlRqR3lP?=
 =?utf-8?B?OXdFc1ZYOFlvbjM1QXJQeTU5TjU1U0hIcytucGEwWCtmcXI4eDBTWlF3QWFh?=
 =?utf-8?B?S2xzZVlvbmhJVVZwZzZXOXJHYk1KdGpaL3dXYURwTVJtekVuSkhtZktlVk4r?=
 =?utf-8?B?bDdhclhvRmdSTm9DMFZpYXdPSE54Y2xNLzBTL3pTZ0xHU3JKdElXazloZ3h5?=
 =?utf-8?B?bmFsejg1MEl2bURYWnRLUTAzbkhFTGVLcjlnbjljSldvOUVrWFlsYXprM1Iy?=
 =?utf-8?B?VlJBSjRzRVlncUJudTlJOFFGVVkxNzNkM1NjQ0IwSzlSTStoS041ZDF5UUpX?=
 =?utf-8?B?bDI4VjlRTkNOWHZQUVdlNk5VWHFRSUtWRDFUQlVVZENCbzNwWUUxakxHNUdp?=
 =?utf-8?B?WVhqc3dqNTZRK0QxVCtIdjJ3RDVmTWFXS09hSEJoaWZVNnc2THYveUNtdnl6?=
 =?utf-8?B?eEl0MnlDTURiL2pVdDZzcGNyckxTTWwzTEhyRWFESUU4RVdGZ1FNTDQ1enFS?=
 =?utf-8?B?Rm93WkxtSnJwSWFrclhEMW1ZVVJwZmNHeDhSS1dVZkFidTdHanZnYy90Yi8z?=
 =?utf-8?B?blhCa0VCZStuOEhjRUpUTjJReTIybjVNZ05vZjlFQVI0M2dvNkhEYklhNVR2?=
 =?utf-8?B?aGxCMjdGV2Rzd3VoN05TNXdtcnJCSzdoRkhWZGFRanc3L2F4UzcxSkpCNkhX?=
 =?utf-8?B?R0hVdERBQnY5Wkg3YnZDcnQzV0x1aVZtS0xNNVRHSlZpSlFvQ1ZxNWVScVBT?=
 =?utf-8?B?MThyTVFteEJKNXQ3eENLaTM3TWFobnJTUUtwbW03UnlNbW55UCtBUGF6N21t?=
 =?utf-8?B?QXQyTWtTZzN0L1NlakRYK3kwWVBaMThndk1TVHgyazh0TU5oUE92eFhDdnZy?=
 =?utf-8?B?dHNYOGtsUEoyZnE4V3hTSFd4a1V5bUovcjZ6bkVYNFBJMDJlenNqL3FsTUVz?=
 =?utf-8?B?dDNCcU9MMjFNUGNPOXRvcWZyYmUxWk5pTU5ka0VZKzVQTDJTeGdoVzRMdEt4?=
 =?utf-8?B?ckE1bUlHWlZXSkZOb3JEZDA1U2g4cHJOLzBrYW1KN2ZUeDAwWGZ2djNIMjRi?=
 =?utf-8?B?WmV5WTRBTGo1V0NoSVBlZWZ2NFVZUWo0UzYyRzJZaFJESWY3bEJOSllidEtK?=
 =?utf-8?B?V3VWVnVTL1BRRWhibnNPT2RaZEFnN0pVRmZ5UTYvcHJOTERqK2Z5RDhlVmxv?=
 =?utf-8?B?Uk91ekszUXcxaWJ0UWlrZ2lkTjFXaU5aZGpvM0ZFVEgvZERPZ1NmQ3JvdHlE?=
 =?utf-8?Q?KVnhn/KauMDE3/onHBvlsTLVb7bQEXDdhu4zQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1fdc42-b3ac-4c42-b1e5-08dec009256b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:11:05.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxY6zIudGiZ1FMehf+XVU8tdL7LLgMBvCcRctZoLz65W9grgwNZ1At3Ajg3VCfv2KgrpbLFodwInb5U8DXXETG2W3UIOiitKMRs2fTNUmhdC0FgVHo0xepo30sadqyXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_111110_402587_BA748F6D 
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 19 May 2026 13:54:31 +0800, Sherry Sun (OSS) wrote:
> The vpcie-supply property should reference the regulator that controls
> the actual M.2 power supply, not the W_DISABLE1# signal.
> On imx943-evk:
> - reg_m2_wlan controls M.2 W_DISABLE1# signal
> - reg_m2_pwr controls the actual M.2 power supply
> 
> Fix the vpcie-supply to use reg_m2_pwr for proper power control in
> PCIe endpoint mode.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
      commit: e76fd0257772ee54f9ca4e594ed5d4c2277e4a03

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

