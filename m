Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021C1C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Utr3CRu7ej/khpw+hQjWz4ereXZh33JyRbqebvIcnes=; b=iBCxnmX+IYPbQM+hbhTlozp5x6
	IBiBldi1SIsLrLc34tu7FRYTray4OOA31QExgoYKVemaw/2HbSFAXNTjtps/4LDk3drDPVJkLNLOp
	QYQMBTEfE4v1LCHA86LpDs+DHWs3au7x8GW/EFZ7ua+tX9f3NFhe+R/bzO4AD7dvW1Q+jAtwT2CGx
	2JRQfin5bTELu8IHqExbjHwomfGqDfdZ/dupAxsswHB9nzFc3R7xGj+SW43mgbeVQX5osUaxRu7zE
	Sjh1IkD6lUTjYChYMwS4VQhdN4+QTcnlqFLO4GRI0gakYh84QtHxhxlD41yXBm6sVThgagZI7dZJI
	Kanoduow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5DC-00000006hQm-2WEb;
	Thu, 06 Aug 2026 21:01:10 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5DA-00000006hQB-1SoF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:01:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwlTETfmuOyHxFsirsTCljGaA2XFaK5NC0sEt0daoq/3Uvl7RcyAtqkd4EpkDKZVynRNsB+tjlGA/ISVBX+9wr5X3Ud6knPch2HBDkw4yi1DZtJTy9KgULBEcjyuZnWSlUHcHuneZtqefgSb3IYs0HZ1cipGVmX8ZOo+ccXw9XEp621rChwnW/jr7ex4K3QYnaKk1oky+IOV8iqWYTSvFy3YsKQ8uZfucnUXcI7IqIPqkxdQ2t1samweC2ftnCUVrL3Lc+a5JjJBuRNrFenzmXtdXi5JL9shOsAZacmkioHSThEKuaY8gLb5pVQIcCnscPVGAeCNAO/9NaiHL6oMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Utr3CRu7ej/khpw+hQjWz4ereXZh33JyRbqebvIcnes=;
 b=WqQG1SEDIDvoSEMt4CrM8pcb6gEXSAMFalaOvlggapWiC4Pjnn0Vn153jBwAFyk01fKhWwRbGoa3Km74sodT8AAL08TyQIDvNai7KAn+GFPa3/pvoXbb5DNdLyYFRCQ9iN6ZCb63vmasbh/ZsFm0/5f67fC5D971w4OLq8KmsxQ5dFeXgeEg5tTzLwirnWnRJshY7fuo+xHUf3N6sM4emiaxMECHd459CXpwoSjJCvhllWA8wHYxAzBzjW0nYt5lEvYgOYm8reLX7Uu4U8/Xgjuhg1K7/2df9cdFtNjJTJoRn7GecMajcDaehvmpSjEbtFMoaQ9kGa3LsfPxHODBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Utr3CRu7ej/khpw+hQjWz4ereXZh33JyRbqebvIcnes=;
 b=UpSyN7wxLe5XOfPCvmm79+fxIXDWkyidDFMSMklxbXTxKbsSa5Iz4e2cAPQbkc+gma8MrJAsYZTjsTig1vEsWB9pAuIEOilaikjdZ3xwkt1PEp585gJqQ5IjtidpO6c6hhC+4URHGgO0UfPnc/OSCFhthzY+0Yxj6xNaKmY+d6eBKgRR0SSHPuZT50RM+ZKLRlYVXHiT7hphOkl20ctEJUZP3O+IbcqGqYDn93vKsCARU86d58tp3ARiXGwopdeGW7qTRs1q53aZ+/5fOFod2ZiFe7g38vkw2TKYQZ9vnclEhQ81sTQ1rOVPkJqrrmyruGLkKxFlSmYwIv0YIsNgYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12266.eurprd04.prod.outlook.com (2603:10a6:150:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 21:01:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 21:01:02 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liu Ying <victor.liu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: Support a DPI panel on i.MX91 9x9 QSB board
Date: Thu,  6 Aug 2026 17:00:54 -0400
Message-ID: <178604995851.481285.5004537431605002058.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
References: <20260729-imx91-9x9-qsb-panel-v1-0-4d22fac95e24@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0016.namprd18.prod.outlook.com
 (2603:10b6:806:f3::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12266:EE_
X-MS-Office365-Filtering-Correlation-Id: 683fb92d-1d7d-47c2-0b24-08def3fdd28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 52iUHCLdjLN/UXPq3mlrThmNuq8yFgwLsZ9suSRpBI/pi+yWexeIuCWmoo5+EUfSIi2Ff7Xm8wZGadvQvtt5zVF0vKCmbnseicJyPwXTsi6G7Mr4eq6isDCncjXo5VAq1JJMgF7VRB5sDSdOfcKTVn0RRWeUrO7dgga/fIIqpRmSsIdfxqI9ZEHeLlvhngHo6JTmPUNj6qQm/6VCo5TB4PSZ1CLNjo1wgzQK308bs4+B17E75ik19HmpmQco8gFXVYehWxkBWahjsjiuE+ubA+5MFZHK6BIHWDsC1WPeKWndYUMjZjSRNzAUg6OEB16+kXGLjQ1OxMjk0zFOaq9YqTfKslqk3Z/9yUXkFEJ7U6yAb6WsjbwL+mx+nvxAyv0dKO1aVpjACe2udINliAWXsoor2wpjmoXhPtxkYFCWQtRr0cx9qTAitqW9NV42zsKkUZomh9yrcyZHYKE8LAoW21IQQKq+PzJhm2VrajuOnC5tr6ZmoVKbB11LShWxfwOOI7h7PjRB0c40Y3rL0mo4uQ0So4OCh1O8Bj9E+Lnh5COYePuGSxquqpVQbM+hBmSDNY7nHhvBEOXFSeMgao0/0ZNOuHv5ftVrFzwunkriWZ0I0ve1+npyDgRNKOWslI+6OwcQeIi1blZYcALUmyfXOeQBQGUmIch4ddvx9uBQl2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWVIM0ljRWtSRnRIM0dRK3ZlK3pNOWdzQzR1bTlCRS95TjRLc0xQdUhSQVdh?=
 =?utf-8?B?ZHVNTmxMMTFSYWVRajZrSXc5MDRzcFp3M29FUXRObWhPV3YwWlpsQnZtWWM5?=
 =?utf-8?B?SWx1TFRFYytxOU5SZ1N3L3o2UlFJVWZQM2VEV0VKaDBzcmV1RWNyM3NVUms1?=
 =?utf-8?B?NXJkVFgxejZkTlJEdHJWS0Fqb3p6dzB6NVBFUnZ4Tkd3ZHlXejBwSFRoL0Na?=
 =?utf-8?B?WTZndlZ3TXZYRFgrMXVWNXFoZFFLUjYydGY3T0dTc1BBRFVlcXZTTURHZWpm?=
 =?utf-8?B?MGxmM3BtdGFGTmRKcUlyUWcvZDZ6ekx0K0Q4TkVpN3NLOUgySjdlSjNEMEFJ?=
 =?utf-8?B?WUNUcTMrVmc2TlpsNzlnMjJST0E5QjdQTjY1REpoTUkxaEx5TFdxZlY5QTFX?=
 =?utf-8?B?bkdZanJSaFY1TGpBNkhQMUpLZ1FpM3lLNEQvQlNkWlFXbTRsbklEcW9CVkNJ?=
 =?utf-8?B?NVNtK0xzcG1lQkdHR0xTekVXNFhiWGNFTy9IMVNhOC9JOHpLVyswaUp3Nmli?=
 =?utf-8?B?REdCaWg5YkFXRFR6U0Q5czE3Rkc4MUl2N1pvTHYwK3JiQlQyLyt1bCtybXBl?=
 =?utf-8?B?QUFkUWM0L1V2dDFvQk42UG9JSEFXNnFYczNtSCtRSWIwdmFiSVdxSlN4WDlW?=
 =?utf-8?B?bzdOblV3Q0dZK3ErNTNkanMzNDRiRkVtbW5EUlVDWmZkei80UyswM2ZVWFpp?=
 =?utf-8?B?WTVhUjdVeGFaZXIzd1BjbVcydXArVlVyaGpUS3FUeks5Wk53SWRTQk5IdFA4?=
 =?utf-8?B?MFdJbFFVM1NqWWwzN2hROExJWDQ0MFg1VDBhaUhpOU82d3A2TTZreTZkb1RR?=
 =?utf-8?B?SGhqR2FyQXU5Y3NvN2tCR21nWHBKMC9mNUVqUHNubWMzWlN0ck9lR254OUZG?=
 =?utf-8?B?cDk1SkkrYWVPREJOTjFjektxR1RaUjVNTzBlc0crc3Z4bkJzZEYxM2VMRUxr?=
 =?utf-8?B?UmVrVHdpcHBTZGE1UDNtamNXUzZxcjRBTm4rSG1zcXVpRkhXNkxkRnA2MjVN?=
 =?utf-8?B?UEhWK09sdDZ0ZEpTMGJteXVqT0JFRERhckZ2YjlGM3lac0JHVkFsNEZYcWFj?=
 =?utf-8?B?ZW96bjNRU0lkbHJaMkJWU3E2WFh1OWs2M3loWlVLUjg1cnRqdzFsVjJHckk4?=
 =?utf-8?B?d0ZidUNYaWNka2MzTC9nKzRNdFZLUGJyU3FOM2FLRlMyWloranBzeWZoV29X?=
 =?utf-8?B?Zk51M09aajcwVjVJR01PV1pDSGxTMUl2R2Q0WHBjc1g2R3AvbW8xV0VpZ1VD?=
 =?utf-8?B?TG9kdGllck04c2lWODdUaFhZSnVVbi9XdFRBZ0RJVjl0M1VlaGI3dGZEY0lW?=
 =?utf-8?B?S0Zwb2l2dnZvcCtNUERFVDRxN3hZSTNaUXp4R2M1NUlaeGFhUGtyQ2NmQ0FX?=
 =?utf-8?B?TG1LZFhDOTRKM2tJeDhob0dVRWhrODBCMWtNL2NjYVdCM3Z0cjRyaCtRYnZS?=
 =?utf-8?B?a1V0eW5uUGhqd1ZuNXdlVHNMamRDTUhFam9oSzRudVNBN05GcjdTdU1YTSt4?=
 =?utf-8?B?a1ZjbTY3Y0lkSUx6ZTI2ZmVlbmRSQVJpMmkwcENZRmFRNU9VaE9OYUxzRmgz?=
 =?utf-8?B?bkZxTHErZ3ROYW1Gd2RhN0dNQlhrTko1SWJlRnkvSEpVdFJrNFp3dmdWTFFo?=
 =?utf-8?B?ckYyRm9RV0IzZ1gyc0YvZjVKcHNOaEt2K2hXQnh0TjJlOGtOOVMvZFRKMDJ5?=
 =?utf-8?B?N2NJRE1uK2sxUzludnZKV3BGNS92b08rUzIvWitJdEo4YTMvZ0VBY3krQXJK?=
 =?utf-8?B?QU5KbEZVVVdhbkxpQzZIcmw5NHN2K2lyZ3U4WXRyWllIUFhlMGI0TjN5K2ow?=
 =?utf-8?B?K1BUNDFXOXQwVEZka0Z2dHJ0MFZqNXlDbjdoWlZ3OEhaL3haSWxPa21KVFFp?=
 =?utf-8?B?SVhtS1gvSXVqWnJYcUlyaVBqTzNqck5JSFBqbC9QV2dIaVF5M0dLM0V2ZmZY?=
 =?utf-8?B?Mi9NczhxajdtczdnZlEyMnYzcGprMWJQWTlmWERoRkZ0ZC9rdDNESTN1NGVP?=
 =?utf-8?B?K01jRkVycFJJaWlnNHpDZWRORjd6Z3JhY3FWY2RsMnU3blM0MzdjcG1UNXZv?=
 =?utf-8?B?cGpFaXkrbVU3eU4zaFpoQ25BcGh1ZzFVQWhXS3dyUWZiTWRIbjNRR3ZyZjVj?=
 =?utf-8?B?a3BGUlJNcnZPcXdaRkhxbkY3VlRrS3BGTG0zMTZXR0kzVWNFMXMwTWYyaStH?=
 =?utf-8?B?cGRaNjVRUE5Oak5VZTErSGgrZkJBUnQyYmdFcVBMSWJMOXdZZ2QvTWRMbEVW?=
 =?utf-8?B?Z3BhME9RdlRudnVMWmphZ2dTNlpWOVNPak1qaUhVZEgvbWZSNG5MV21jc1gz?=
 =?utf-8?B?SGxUVWlXSTRqYlp1YURKdnVWQndDK3lqbGNZNmp4R2NwcHRKVDBYcGMxbVp4?=
 =?utf-8?Q?c0NxQJbwsy3Wy38RGZ8vb0araGtNurj3uuaPJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683fb92d-1d7d-47c2-0b24-08def3fdd28e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 21:01:01.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lJlTFGLisnjglDXfOv+CjKCKWmeZXCeIePhdEH5nvg8Kc3ZGEbSteXbNxyLCN51zXZgNZRemgZZWGfcz3Z1QLgWRPF5pu0ls7uIiyuIjOhrsFywE6VDtgDB4epApvOg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_140108_420258_EE97F479 
X-CRM114-Status: GOOD (  11.84  )
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


On Wed, 29 Jul 2026 17:36:26 +0800, Liu Ying wrote:
> This patch series adds tianma,tm050rdh03 DPI panel on i.MX91 9x9 QSB.
> It's a panel module which can be connected with i.MX91 9x9 QSB via
> a 40-pin connector and is same as the panel that can be connected
> with i.MX93 9x9 QSB(already supported by upstream kernel with
> imx93-9x9-qsb-tianma-tm050rdh03.dtso).  Add a DT overlay for this panel.
>
> Patch 1 adds compatible string "nxp,imx91-pdfc" to imx91.dtsi.
> Patch 2 assigns i.MX91 media_{axi,apb}_root clock parents/rates.
> Patch 3 adds a DT overlay for this panel.
>
> [...]

Applied to imx/dt64-indend, thanks!

[1/3] arm64: dts: imx91: Override dpi_bridge's compatible string
      commit: f3b58de70f408cb8cdc6b22ccafbd940a939b7ca
[2/3] arm64: dts: imx91: Assign media_{axi,apb}_root clock parents/rates
      commit: 244b541761379dedf1381a80cf9ab509481f3a0b
[3/3] arm64: dts: imx91-9x9-qsb: Add tianma,tm050rdh03 panel
      commit: f3a5c5e1cca363dd27e96c1735d7213671eac7fe

Best regards,
--
Frank Li <Frank.Li@nxp.com>

