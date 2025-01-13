Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABF5E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnbTmzQ7eZrAuY1oxk8FSXMW+3vT0ghEEPYWv9si7bE=; b=1Qfyje8sg8Ji0X9L8LDXiyargu
	H5vX+fSjahcbNUQ5olEv6cPPvdJFjyhycjAuhYM8bYBbhXCav8/IAgPled06uB/y9kRUIq5XMBPv0
	Jcvagi1pYEwiR8ZNFF8p/sBDsxjZH77KZCAfKCZPdWB5KPmYLW2PUQXYr/OSpKSNOLERO7qDG0eno
	GaGLxcOWkU4RH29898BAOWqMQoOY2Pl+/Y/jYwxNV0HjJwJeREnFHltjumbXO4eWcmpkneKILbZiN
	tOLKok2VcHds0h9gvxqwNKIUSYofWep2yiiF5bO42gisb8XTO5YkmaH9sMSEQnx2mn5Uqqy92YSzr
	N3vevsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGet-00000004aTh-29MD;
	Mon, 13 Jan 2025 09:22:55 +0000
Received: from mail-dbaeur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260d::601] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGXj-00000004Yx5-3S5H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX792n0pipH5cg/nWySAA+W7Rah4zFPsY0nimEnboVKuoSouYIFB9X3d8At7uAUxFrcZpDkUoNxG/WVsxj+d3f8N9loQoBjamqRChakxvA1ETUTlHtjvVvQKH3bVLjrdPRY7j0whLY36l2EP2uKFgm3dvEFIA6s3RjC+odpVV6XMpmG+uifrGdwP3dA4D3JF5wUiMbagZ1TQ+ALY5amRCfC5Mm7fr9xaWpVcAE6J2ucwa9/zVcTxxiXHWbfHLgXZcsEcC7NeMT8ODR2mLuZxSENLYsmcKuepY1ZdydSCCLu4um+TVoZmwz8mW07A0SqkyCnP+w+P03ro5eOOTrbH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnbTmzQ7eZrAuY1oxk8FSXMW+3vT0ghEEPYWv9si7bE=;
 b=ogJ0rHKyFoDr6U/kmAxc7hXSDrAD7J6YedhTAM4a+Si94aw3aro2oJIK2F7LmgnqHatLkQeXkEug9snEo7P98PPnS7+Wz9P8RIesUNlkG9zLJlL4XTRFNoQfePHXUR1kvG/5U4efeNlEewJmwQ6FBdD680exr/5yhvamJafuGobB4tm0OqMvePW0skhcu1JJJOU1XFv1u2P7fPt924qx0gMzmG4XB+UgKY1xdxq8t31AIpViWWSog9NCFlbgNOZ+7Yp752TsdXmEH3AxIa5DRX1fnzwpvbwbyNhB7UFGDyirTbBxJ9blSsGFgPAHl3T1Nur2g1iADpqmpDrdpLvHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnbTmzQ7eZrAuY1oxk8FSXMW+3vT0ghEEPYWv9si7bE=;
 b=L+r4fbGUnKuIApEOjhFrGA16axw4gNDRdOsp66NsQJZU4En1FC7FV/yiO5FUIUEG9sG1sEY1fsI9TMqEuQ8u4OzTPUxl1xQAiyigwBj6Nh3Fc9k+cDRpPb8XbFuZzYXKIgLzruH4WluUFcKV3Wq3a3d2mToTDXVdZziKkSuhnfzhEzhkzeeZ3uD6qf/oVBOEmpkOUO+1QhQRgfM9t3U8HpMXswTXkZ0ail22//YpYNTnMgc8FbQ4BL7DqGlZHUt1zzm8nJper1f4VqrP6e6Qt5BHU2nI8Qaf8i5iQoxdDfmXTIsv11I6fYgRx+t3ugoFla0XQ9Tvo3sGT+fmBLJxmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.15; Mon, 13 Jan
 2025 09:15:26 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:15:26 +0000
Message-ID: <bdf12d3a-dfb9-44f5-b95b-4dd38859b6fe@oss.nxp.com>
Date: Mon, 13 Jan 2025 11:15:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: s32g: add 'I2C' common board support
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
 <20241220123916.1452582-2-ciprianmarian.costea@oss.nxp.com>
 <Z2WQ8j2kIQ462dxX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z2WQ8j2kIQ462dxX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::13) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: d73863eb-e0b5-4d47-ff11-08dd33b2d0ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THI0eFFyN0RPS0p4cUhKZXR4WTNIRU9LeFV1TzZIekNnVVRMcGdTTktWTGRx?=
 =?utf-8?B?M0NKUGZmYXg2Ri9uSytJWHhGcVUxOWdSWElWMUw5WE1MclkweTQraFNITWI2?=
 =?utf-8?B?K20wck5HV0RpWmRITGJhOU9XOW5VNko5R1AwaGZMdWZCempWNzdhbEJJUGZo?=
 =?utf-8?B?OW5kcmluV3JiTTlYSm55RCtEdWs3bzNpT3lzczBYbFljUmdPRmxIOVZTVEVN?=
 =?utf-8?B?OHNNVlRvMzN5ajJHTXoydWxXZVJ2N0hsM04rRHd3ZzNuemQrSkcwdjFzaUdT?=
 =?utf-8?B?WnN0c2ZPM0lSQ0l0T2ZmUGFWYjNjelRyYWRYeUZlUlJvazByZFUwVm14Qnlj?=
 =?utf-8?B?azg0TCtPK2RBT2ZoQlZkZWV6QzBxWDFRVHd5d1BlRStUandpa21Gdm5YMUsz?=
 =?utf-8?B?dHlxcUx5enZqb3BBT3RDUjV3Z1pycEU5dVhNVDdFdEgvQUlHWU5aaXB1YXNu?=
 =?utf-8?B?dEtyNk5XVmFEWDluRkFkSDYrYW1HTnNWMEd2eTBURk92L3kwM3hSbTFpZ2tZ?=
 =?utf-8?B?SFd4bldxMFNmUTE3Y3hMYVFFWVhmeEM5T0RDcU5CNGI2U1FjYmtZNE5FU01J?=
 =?utf-8?B?SkdvbXprL3VqQnNmUjlvV1ZWZm82bVlybHNvcitNMDd6aXNqekllQjMxKzJl?=
 =?utf-8?B?dGxSdWJpM1IrNUZNWVVEbHEyRXlxRXhjS1JUODQ5SGxXRTBUcFdQSnhTZWNw?=
 =?utf-8?B?N0NnbjBhRDN5YWxNK0lMV3l3SDlMU3BXNmpKYTVSTmV3cER0cVFjZzROQ0Zh?=
 =?utf-8?B?Q2t1dHNMVlpNUjJpamRUTDNCZWJaMkNWaXptajI1a0JIQm5jdmI2OW1wM3dl?=
 =?utf-8?B?N2hiN0lVZmIxb0JjbCsvN1pvSnpKcE5Fd1lCMU5RVklPb2xvTkg0Y2lxWHp4?=
 =?utf-8?B?ZU8yL21DVWpPTEF3NXRDYmo5dU11S3UwemFnSyt3bnVhcWV3RWxsTEYvOTNi?=
 =?utf-8?B?YWl6OGxQZ1U0anlQblpWK1ViVEJPWkRwaERDUmNPdjFubWhZTkQwc3VlQkZa?=
 =?utf-8?B?eks3NHpZNFNFem44akFJVFVKMWZnM3RTaGdRZ2xaQTd0c3lMbWVVRDAxMkRB?=
 =?utf-8?B?SDUrZFU5a3FLWENsR2wrY3ZsRDY1RmVyWGlBKzBFUE1qb08xRStyK20vU3Vj?=
 =?utf-8?B?aWJKOGM1WVpmOVR2MmE5S05NenFlRWZpRnRjb2wxMXEvQWNHRUo3Z3hYRUNn?=
 =?utf-8?B?OHlqeGorL0d5Qzc5NWlFM3l3SFR2UXBRY1VtTFM1N055alQzSXBxWjMxcWdN?=
 =?utf-8?B?RjdCUkZldk5WVExlT2hjUEs2b0Z3THZacUdyL0RqYldTbm1BS3JlK0RyMnd0?=
 =?utf-8?B?eU9TblJ6Z3lHb2w1c1RLeXBnNzVJQjJkcVprcitQVVR1SWNkS1lySncxWjFU?=
 =?utf-8?B?VXg3clljSyswMTZ1Z3ZwajZIcTJMY3dWakkvZmpUajd0M1lKRnlLcSszU3Bt?=
 =?utf-8?B?SUFpOFFESTdHdngxQXdRdU5vUGNrVlhRRDdpVVRReFhkMDRnak03TjduczFS?=
 =?utf-8?B?VkJ2Yk5NdlNVQmxvVkRJMGhtdlFwL3o4cVVUTEhtQjh6VHFPc3VCR3lYaFB5?=
 =?utf-8?B?Y3BsUEhUMTJicElISWxJKzB0Q0lEV2FmUFZEQkR4SUdRMTkyOVlBTDVteEJW?=
 =?utf-8?B?OWxHMHpnNzVvT3c0c0NxRnRnNWxPNmQ0UTlIbU9STmNLbVVlQ0preE1EUlZq?=
 =?utf-8?B?NWxYSUc0SHYrdUhyc3RJVGJuSjBUQXE3K2RieHJyVDFrZVIzS1VJRU96bTRh?=
 =?utf-8?B?TlZQV29HTHQ0WVprRUxBMlNkRjM5SmdOcUlmaU92MUpjT3hSUFpFU2JnVzhW?=
 =?utf-8?B?T3NibGcweWNPV0dEY2IyVzlDZ0UwYVdscE5UREhYS2JKTHlnTmJUSFpvSkZO?=
 =?utf-8?Q?mxW+EEhMRF9Ni?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czNVT2l0MXB0ZFFySmJYV3VFTFVNZmgyY2ZpWE92M0xTWmorNXMrMHp5NlZQ?=
 =?utf-8?B?QlVSZ2o1K0xieDZidEJSUUdzRFVQd0hkbU9TSXJzcmJRQUZORHJpdWFiemti?=
 =?utf-8?B?SmVzekIzOVM1ZDFLMHB0WHIrUllyc2xqMFVxdkxwcXVpSmpSNkZzZmVPaTNQ?=
 =?utf-8?B?aTNkeHZBbVF1TXlNS1dnV0hDZEM0eWRYbFZZS3BWc0JpMGpWZU9rcG00OFEw?=
 =?utf-8?B?eEd0Tk82N3ZGMVNNOGEyVXA3d3dvVVV1UXhBV214b2dYSFduRUpsQTJiV3hU?=
 =?utf-8?B?OHdnVDl2ZmFEQTFPcFhGOU1CbjFhL01rWVRLc29NeDMwTXZqajA2Q2gyNFpT?=
 =?utf-8?B?bTFPTmlER0gxbmFGMlNHNFVCTDFtaFplUkU0TUpuWEVRUGYzdG5WWjdhNG5Y?=
 =?utf-8?B?eDJUSm94RDliM1d5TnBHOXl5Y0JPa3lXMzFHcVphSENKVjJNTzN6Y3FsM2dv?=
 =?utf-8?B?azRaRTNKRFVkQTBvYk1QQ0pYOTg0R2FCV0pvTU9NZUthbkFwZnREeCtXS3FK?=
 =?utf-8?B?bkIyQVBNQ3FUV2F5a01ncnJjOXJHOWpWQU02SkJ0WUpNR1Y1NkQ3RHNIYWlO?=
 =?utf-8?B?aEE5UlVTZER3VGtxWGdyQm45aEFOT05qY0FSL3hzWDBnL29semQ4YmVNazlx?=
 =?utf-8?B?NHFTQW9VOGdNZS9TNG1nZHRCNXNrazlWdFdlYWhQdDBTb3NBSzdVNFAyeTdI?=
 =?utf-8?B?d0RrMlZxQ0RIMmJUU2MzUkxDbzBoZDBnQi9JdWJYZXFhK29kVmkrTXZNeld2?=
 =?utf-8?B?TGpXU1NKUjJqdy9iWWhML1pXUEs5TndKdFRlMlBxQ2cvMXVXZjkxS1l1TXR3?=
 =?utf-8?B?NHoxYjRpWFFwbklBbk5Ta0tYOXczaGVPSTZZNEd5VjRhZ3dlVktKRmN1UWhx?=
 =?utf-8?B?NDV2NUM5MXR5ZVZueEJkWDM2V1YrckRWeGdVL1BCVUZjV21kdHRFd1dvMWdi?=
 =?utf-8?B?TitnRFhSSmxzQjlYeUFSYmxyVWpudElOM0RhZjJ0cHg0QkhjTFpTdVZwdlNl?=
 =?utf-8?B?WWZEbWpsTjdTRzRwU3Q4cXd2VEJJQ0phY1E2MFArS1VXNkd1aUV2QlBBTWpa?=
 =?utf-8?B?cGR0VUYrc2JON3QvQ2ZHNEh5V2RJTDRTTHpJVzZXYlU0RHBpTFFEUGNqTG9q?=
 =?utf-8?B?UzRYem92RjdUMGxkTGtNVzlXVHJyY0RuRXp3cmdobmEyaGhmWWZXU3N4SnQz?=
 =?utf-8?B?VUdXM3h1amNTcmYwY0FPaGUzVzBsT0JScUZZNXE1cXJUcUcrQ0cySURKdVpN?=
 =?utf-8?B?R2xrazJrcmV2aGZteVE0Yll3c2lmUHR1d21HWE5yLzNLdVZtdEZqVFE0UmZl?=
 =?utf-8?B?bHg0RXFuZXU4SnV4RWpiQUFMRXZNdWdBNm56bHhlOENLWXluUm50TkM2RWYv?=
 =?utf-8?B?Mk9GN05mUk15bi9rVUV1UGs1aUtNa09CbkhaVWFsRktrN1RUWHBtTGJNeXBn?=
 =?utf-8?B?MVYwSlROSjhFZFNGWWNqOUpGVXVydUltT2pFaldua0k0Ui8zSGViYUhEVDBV?=
 =?utf-8?B?QkZzVE9jWkthNlhVZjhuRmN0Lyticjg4L3lHdEFDR1JOUk0rS2d4ckMzb1U2?=
 =?utf-8?B?S1B2bXZVTytxVXlOSVhDSTVoaFFxSVFXbmo5cmlKS25JTkU3c1daaDBra3Ni?=
 =?utf-8?B?bE8vcndBUnFLWlAzak9pMFhCd2c3Y0R5Njl0cEszcG9SUkJ1cnpaZzlHVjFC?=
 =?utf-8?B?VWxEdjZHdUNTZ1RmMlRpVjMxZ2FEcW1Wd0ttTktTaUZ0cHNVVWpiTUExcDZ1?=
 =?utf-8?B?bXlvZHN2S3hzYk9SaFcvV290cGlja01jSjdNWnVsdXhWUFAxMHFEdVdJRE9T?=
 =?utf-8?B?SjgvZ05iNGVNUXp6aWdLeUNxS3hEMDl5MUk3UkpRZWx3YzJNZXIwVlcxM0Vr?=
 =?utf-8?B?ZUo4elN3bXRXYWFsU0tYYzdDYmdwOGVOZzlueXNVTzE4d0lQNWQ1U3RwOC9D?=
 =?utf-8?B?cnAvZjZPYndIM3hsbmNRMG5DYXgvblNjN1Uyck9qQVVsUFoxV3l6MUY5N2VV?=
 =?utf-8?B?MmlBMTRORG5yVE4rZUVOdGF6YllrRWdsZHp4M055ZlZKelFnaERRVG9UVUh1?=
 =?utf-8?B?QWpBL2VKblM0TitaMGV2MUFOcWpjTmdlTndwUlkyT1hSV0RWOFhvTjRNcnZV?=
 =?utf-8?B?M1Fnd1phcHBURmZGRWs1aUVJRGcwL0t6TWh5T3FwNzViOUxxc05qTmc4aXVt?=
 =?utf-8?Q?WpAAYgD5Oz6k0TCmIECfyTk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73863eb-e0b5-4d47-ff11-08dd33b2d0ea
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:15:26.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeTyZEG5ySRpTqxDq2+8v0p0iNuetGCfopbBj9SGtqiapjGVYyu3pPOcdV1FIdoXB1Y2RzyRE8KUZRMMmqH11UbWYJHueRU+kG8a0EwpF7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_011532_018621_6E758E90 
X-CRM114-Status: GOOD (  17.33  )
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

On 12/20/2024 5:44 PM, Frank Li wrote:
> On Fri, Dec 20, 2024 at 02:39:13PM +0200, Ciprian Costea wrote:
> 

Hello Frank,

> Subject is wrong, this patch is not for common board
> 
> Simple said:  "Add I2C[0..2] support for s32g2 and s32g3"
> 
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> On both 'S32G2' and 'S32G3' SoCs there are five i2c controllers available
>> (i2c0-i2c4). Specific S32G2/S32G3 based board 'i2c' dts device support
>> will be added in further commits.
> 
> This commit have not touch "based board".
> 
> So"Add I2C[0..2] for S32G and S32G3 SoCs commit dts."
> 
> Allow only copy subject here for such simple add some nodes.
> 

Thanks. I will update accordingly in V5.

>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
>>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
>>   2 files changed, 115 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> index 7be430b78c83..1a9683c234b7 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
>> @@ -333,6 +333,39 @@ uart1: serial@401cc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c0: i2c@401e4000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x401e4000 0x1000>;
> 
> reg should just after compatible.
> 
> Frank
> 

Ok, I have nothing against this. I will update in V5 as I see now newer 
dtsi follow this.

>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c1: i2c@401e8000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x401e8000 0x1000>;
>> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c2: i2c@401ec000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x401ec000 0x1000>;
>> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		uart2: serial@402bc000 {
>>   			compatible = "nxp,s32g2-linflexuart",
>>   				     "fsl,s32v234-linflexuart";
>> @@ -341,6 +374,28 @@ uart2: serial@402bc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c3: i2c@402d8000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x402d8000 0x1000>;
>> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c4: i2c@402dc000 {
>> +			compatible = "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x402dc000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		usdhc0: mmc@402f0000 {
>>   			compatible = "nxp,s32g2-usdhc";
>>   			reg = <0x402f0000 0x1000>;
>> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> index 6c572ffe37ca..5d28b439906d 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
>> @@ -390,6 +390,42 @@ uart1: serial@401cc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c0: i2c@401e4000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x401e4000 0x1000>;
>> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c1: i2c@401e8000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x401e8000 0x1000>;
>> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c2: i2c@401ec000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x401ec000 0x1000>;
>> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		uart2: serial@402bc000 {
>>   			compatible = "nxp,s32g3-linflexuart",
>>   				     "fsl,s32v234-linflexuart";
>> @@ -398,6 +434,30 @@ uart2: serial@402bc000 {
>>   			status = "disabled";
>>   		};
>>
>> +		i2c3: i2c@402d8000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x402d8000 0x1000>;
>> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		i2c4: i2c@402dc000 {
>> +			compatible = "nxp,s32g3-i2c",
>> +				     "nxp,s32g2-i2c";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x402dc000 0x1000>;
>> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&clks 40>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>>   		usdhc0: mmc@402f0000 {
>>   			compatible = "nxp,s32g3-usdhc",
>>   				     "nxp,s32g2-usdhc";
>> --
>> 2.45.2
>>

Best Regards,
Ciprian


