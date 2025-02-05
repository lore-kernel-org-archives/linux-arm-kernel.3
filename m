Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD3C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 01:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ck/KyDLZ0Hdp7ue3uxbCp/8Bgg/pRY0hm93UPm01SY=; b=Epsql3yyhUOahmF/dniwFkRqLh
	CKmlK4Rkuye0AM1uciA8lBlIJOrP+AjEoPFqTGIdnxUELo3h+Rwq9pSSJR6Xj4hyhzPF3QmBFWIx9
	37CcfuVVxmcfutyn+JcI7udh3bD4j4g1DnRZxVR90bSGXK+olu1RCH512eJkmB47xRrkvuxSTZfow
	/IwMMvZKU//EyGWMNI0slSUrMyjGr8HZp06splWrqnHxVcIr1POWRjv+284WxUL4lBED82NxizNa+
	JS8ZhLzNRNERjstLEun3R0HK0u70nG5U2dFNyYEoFO6pwUgG5o4BXvZiF8zfeW60HBXCuXZwIlttR
	i6FfwOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfTrj-00000001zWM-03oX;
	Wed, 05 Feb 2025 01:06:07 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfTlT-00000001yPa-2Ltp;
	Wed, 05 Feb 2025 00:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuJ5UUIAo9d9+jYxjdXgOrcgHjlSWYNpIdz566YTDSQEtqIvPK5XXyqNIn6DztO4Ri3rdXQ9tBc+Nvt+udk2AchoQE/fd5mpog4jOlBH3NTRYl8hMJOCNefX2SO1Tx1jb3HshxZnft5DZzz5Xi/ELW9pbcmNYoRceMOMSAEZAKO4wMb8AWnLS1ZpRycEj4dgR7P2uuqvlR30f7dv5JW/duj1wPWMPzjKBI4Fphcd8gGT8XjQEKCL6rxmcw0a16tVpi2gzDJ4IOF9eVTSDfX818dGff9ElMkWqSVxb+wOG3idzSHvZS8QJBIdYAtokJbAYmAgnEaskWrFT80Fy6I/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ck/KyDLZ0Hdp7ue3uxbCp/8Bgg/pRY0hm93UPm01SY=;
 b=LG0nCpKnuu9PAogxFN2sajN9+JPaB5M6qRYwZhc47ollARBOam8LfJ6uCexkftir4TMFRheBed27KqYYuaHbJuJXje1TwV7Oc+0+OnWkWCZD248ghcwCT8l1Fs49fhaVNli98zlBN7BGnx1aYxLSahK6Nh93qehsH39YC5591eoWqSTbdo1Q6zB+N+lTXz9lBj9R1VQ4GT3bcXsvLRWghBtGdUjtvc2kBps0HOxflj35TZsv4FLg7+iY1Zpg28d7QZAgPnqk7h3oXWcHJgi5AQ/pmTRrxggNtxbn86JBugO237q5ikACFLfqmNbks7fuGp2XTDYsorw0VsWyv29aeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ck/KyDLZ0Hdp7ue3uxbCp/8Bgg/pRY0hm93UPm01SY=;
 b=CfX5SlQyCVmrqBHhShACJI/gw8vkwEFvqMlWlxPis+c+eqTxomSCD0FlNpCV6RXg6HykimPu9sOiorbmy9n/oO86Xjq+tlMzzDzOwLWLcjR8CtPGHReJKPI34B1oFbSLhk3R08qnUcvrH5djsjTxB6G/lRajAvt2ZB2ortv38dTsan5X5MKUtYseFViTi9XDYZ2N6z2N9P7NhvBuAo+aVoIEtGodAZvnpfwoH/GUR6ZUbI6UqWSnCD7bZLLLpf2BUMK+017pVJEIcX7cvVC/78CE1KlWihgkiJiWPfLvTVhHSV0qEqnVwtMTkfbEzJHRIrZFBk1iCR5TTbphHp4Tqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:22 +0800
Subject: [PATCH 4/7] rtc: pm8xxx: Use devm_pm_set_wake_irq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-4-66165678e089@nxp.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1104;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=bSEqkb62Ag5Dw5Zs7cv9/9hd9K53rCnxW5QPy69d5F4=;
 b=L42mVUKdk2pIlYxrwXtM9UoydiBfMxcoLJG/qK507hD+NAO+hlBnrqcre2UHyB7TyVQhpASlf
 v1197RGA8YYDYNV5dTDNFTz5VDBwM/ZBvnjvFAQM2Y3RLB/Imv8CwYL
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 249bf700-da62-40a3-2051-08dd458055c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFSU0RCUitYSkZhbVYxbFFwbkpTT1g5ZjMwRndBTnZnUFdXanlZZy91U3da?=
 =?utf-8?B?WGRBZWxZT1dlZ3BrQ0tkZzNsbG5RUExkWldBWXhqL3JSZXRyQUd2VUczbDJ0?=
 =?utf-8?B?STlwd2tmY29TQTA5VDNISzF5REQrdTNuQXA1OEVab1kyOXhKdjgxWjMzL3Zu?=
 =?utf-8?B?N2RnQTVaMmdaK3VIM0ZzNzVTTk0zcTV0bW9kQzcyMWg2V3J6aXczRDlwdHVq?=
 =?utf-8?B?WmpZUkdMZ1ZhL3hYUkk5UnZneGhYaEtDaTF3OURKbEMrKytLV3poWXdKaEc0?=
 =?utf-8?B?VGltanBUREpKVVNaYURDRkQvb3l0U0J2TFBxTGc5ZUhudlBSS0ovQk04ZEx3?=
 =?utf-8?B?S2lzRkZQc2E0Mk5udG9xVmRYQjRGMnFFVzBqQ3QycEFGNjFycXdLTnhtK2du?=
 =?utf-8?B?ajRmUXlSQ2ozaXpoYzNVeVhWckRDb1VrZ0lJc1N3WFg4UFBHenRtdlVCWEZy?=
 =?utf-8?B?T0x0Zy9UaHVkLzhoVCtDTmFOWXVsWjByNWxEUXlUOUVBOU0zcXBOMDIveGVl?=
 =?utf-8?B?VFdPQlpvWjg3NXBVUmt1V2VGL0c5ME9NMEtSWExoVzdyeFFUSUJ1aEY4b2Vi?=
 =?utf-8?B?NUFaUFdCOG1HZCtMSjdwZTROWWcxc2NablFFbmVmTjQ2ekJpcG51TGNBNEtm?=
 =?utf-8?B?MEpGVmJvUkFRalYrVGFWNXN3WUVJdWpwMEpHWXVuRk85QjdxdmVMeXdWK1cz?=
 =?utf-8?B?UDRlUTBuWmZSb053SmUwak14QXpKeVBCQWErLzJjc3lHdkdGZDAwd0VKZFNQ?=
 =?utf-8?B?UVF1WmRTbVV0Q0xxRTRFdkhOQW03cTUzNE54VCttcDB4MXdWUVg5T3Z3Skky?=
 =?utf-8?B?R3A1enpzQU4rajBJRXBGcHJ6Tk1QeHdHeTZHdzRWeHNtRXlVZTN5YXJyc3or?=
 =?utf-8?B?ZXY1MzhQcGJGK2pEN052OHJjTmY0b2ViMEdOQlc4UVNQZW1MVEw3QW9JTlNQ?=
 =?utf-8?B?eU9OcUFyZzAxNS8yWlBIcDVSYklsSEU3N2VxZHN6cGpTaWx0bHlod2ZGemNO?=
 =?utf-8?B?NHBJb09CRkxGeWx5WjloY3kyWldrSGRVQ3BtVDRBSmpVSzBjQjIzWXFFZU1h?=
 =?utf-8?B?ZVdCTWpFTVI4NXpaaVFqRUJKY0UxRlNYR0pXNUVKeVF6V1B2RGtiNDhpYTBK?=
 =?utf-8?B?NGdPaE94VXkvZEdPeWJ3YlJXLzgrQXhBaHBxOE91WHVyeE0rOHVLTktYV3BW?=
 =?utf-8?B?L3YyejMrT2Vac2ptWGRON09pd2hnanlBVmJtNHVQdEYwd2VvbEFObFZMblFD?=
 =?utf-8?B?aWQwSXMvNjRGNEdvUVFNYUFYczJaSzhCTEl2cmVPQWlqUlZJS0dVTGY5TjFQ?=
 =?utf-8?B?a1BrTlJOVzgvd21MSlljMmdMN2ZEckNES2oyZVM5M1JKalRqVmRqR3pOODlV?=
 =?utf-8?B?dXpYUjVYVUszbTgyQm5HZUZSKzhudXJMRXQzd1VtTkxXMVRsQUtnWUl3VjVE?=
 =?utf-8?B?bWdndDVudnpsTzJYSVBpRTBTODdQV3k1Z2FOTk05RzE3YlZsaU9XY0k4a3ht?=
 =?utf-8?B?aXM0SERlNmJSQlpBV2FDNWRvUGgydWdUcTVnUkVqOEVxalg0aXRmQ3ZiM0dG?=
 =?utf-8?B?SUVTZ2F5WDZBZy9RWUF2d2ZCalBab2RTR09qNkZvbFZIOUpML3RZWUtucEY0?=
 =?utf-8?B?RTAxMlZRSU85YkhqbXZURXBjTWxhdVhUTlBIUVllRnBJT2FHS2dRNXE5dUtZ?=
 =?utf-8?B?SE0yQ21pcFg4ano3UXlhWnRKM0J1ZHE5eFFIZmlTeWY0SDZIY1lMdHFoWm5r?=
 =?utf-8?B?ZWoyRko4YklCUWY2aDFNbFd6cmtWNHdCblFqM1QxVFRudlEzR0EvZVVBMVND?=
 =?utf-8?B?bkRuYWtEaVM5VCtlbTFoVUN3N2xPMlJHZVJxNFBGcUxJQzlBcmNncXB3dWpE?=
 =?utf-8?B?S1Bvb0I1ei9xUzloQUhwT3BpRW03NUo2Qit1UURGTFN6dE5CeEdXbDdRMFdM?=
 =?utf-8?Q?F5VP8gU/oE+9l94uWiHOqFASozbW0YbJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azFUTlJtSy83NWJnTk1lKzBjaUt4d0g3WUEvc0hsN1Y2WWUzNzh2VjNSdXFa?=
 =?utf-8?B?QXFRMTFZcmZpSFk2SGtHWk45WHhOcThoLzdaWEpRRVRIQUFUNCtqdCtRN2Zz?=
 =?utf-8?B?M2h4eXFXTXdvY2J5Rm4ya29PNFhPVU9pdENoZ3lOTlRnQ1BWZVo2YnNNQStu?=
 =?utf-8?B?ZVE2YmNVU2lnSlRJdHN2Y1RiMzVFRmZOVGV6ODBUN0JtT1p5NWpvR2xMdExW?=
 =?utf-8?B?cVlRZG44azFoZ21GN3VvdFUwWUxnNEE4SVlXWjByeVRtbUJieno3MUpkTlB2?=
 =?utf-8?B?aGgvSi9UQVVRUER3NExYVjBpSXJSaE5jWlJkb0h3dkkxaDJ6LzI4OUxiVWdn?=
 =?utf-8?B?VXlxYThXZ2F4QVkxR3FSTjZlQ2NUTitLVy9EU0hoTUdMTFJ3WTlQdEY0M3kx?=
 =?utf-8?B?SmFCakZsRG03ZUhRbEh2d1hDeENTNU5TbFdocEZLSjRNWVZxMGRGZVhkcFlM?=
 =?utf-8?B?MHJ6SmZKMTNwT3ZBRDB6TXpCcUk5QWxSVWtNWWI2YU1Bci85d2o1TENoMkNp?=
 =?utf-8?B?ZW5TK2RYSnE2cEwvRGl2TjhRMFY3VnBURStGampHTlVoSkkwWEVtNkxtS2hF?=
 =?utf-8?B?UG43c0NWMmREQitvQUNWT3pVZjY0eFNUS29mWElQS0p0K1Z3WVRCdEp2WWM5?=
 =?utf-8?B?Y1o4aUJMclc1eG1Vc2ZmaW9DVjdTYWUxYkFaWm9oWGFjVEVndisxN2VpemVW?=
 =?utf-8?B?cVZ3ZWVaOGdUeFlzMWp1Y01LSWJ4a2J1a3JVbmpsb09peW9kbmNSWFZtMnMz?=
 =?utf-8?B?Qlpnck94b0dySW04TzlVKzNkZTNuc2pIakEzcy9ldjZhakk3YlRsOVllcFJh?=
 =?utf-8?B?eG5ESFR5OEszU25vSHdHMi91bGZLY0tLUlUrcTFiNEIrenpNOHhJbUdDdmlN?=
 =?utf-8?B?RXd4L0pDdHVBL1F1ak1ZL2xXNXNzUnQ2NUgxblZ4dTFHaEFucGwvUGJ0cllV?=
 =?utf-8?B?UGJtamlsSjFBd21IVEVhaXV0YVdxUm5MRFlTaHBTZzRybjB0bXZBaE1ETGJj?=
 =?utf-8?B?bUg3VHlqRGMrL2JxK2dvdmR6dGQ1WGZUR3d0L2FjNWlzS1o2MGdjdklpU2Z4?=
 =?utf-8?B?Y0RGRm44OHlaMjF1WVJmTE5lS1ZRTGwxZ014MklST3FyMWhTMTNhVFNGNDFO?=
 =?utf-8?B?N1NQYkdjekFOc2NjL1BKZ3NlSXBqKzhKTkdqa1pNeW53SVdKTjFEay9ON2Fa?=
 =?utf-8?B?ZWptUlMwTG1HaDFsNW5uSkNvd3k3OG5xR21ZNS9GdE9lc3VSZ29PNEpoL241?=
 =?utf-8?B?Y3QzNE1QU2hOSXIvTHNsYWZTdnlCdXJ6byt6T1pwdURvb1dja3lWODYxY2Fp?=
 =?utf-8?B?cmswcmxXdHNKblZHNXBLSEZGWkZST3pQM3JSNEEwWkJmZkxneVhyYzBzWUxQ?=
 =?utf-8?B?d1Nyd1dPdHBFSGVXTzNaRzJXdkthYzdSYm9lY1RvSFB3Q0ViVDVjTUEyc2Zj?=
 =?utf-8?B?S29uWFVjYjhyQ09lWFErd0NJdVRQMENBcUtQdjNqazg0QXF5WnlJZk9jUG5a?=
 =?utf-8?B?VHBFSWtTZTIyNjV3MGZKeFA2ZGhCWnhSRHdIMDJxbXBLQVlHaEY5bzBwQy9v?=
 =?utf-8?B?Y01GTHlDT3ZNK2VSM2piNngzZ1pMaVNoQUFRZ2tWdXhNUytSa1dsVGx0SnA5?=
 =?utf-8?B?UXFuU1ZHUDUzZGdwRldsQVA0eHBHRktvcm80SDhMbWNQUFhURzRCVVdKT3lC?=
 =?utf-8?B?cnpacm53WW5pVGpUKzArM0NYamhTdGoxTGNkMHR1TkdEYk1La1B5ODR4MGFh?=
 =?utf-8?B?OUVnWldIMDdTSVIvaHZSRWVKZTB2Mms5NjJLOTVXUzZqeFJoelZuMjVVUmZy?=
 =?utf-8?B?cUJLR0ZsaGNWTzl4dmVvd0FHQ2VnYnNtdjd1d3dIcGhkcGJmSVhVaGJmVEND?=
 =?utf-8?B?cWE4S3UzNHRUa3lBbnNNK2xhMndUelBPa1g4cGdHSHViczJUb3EwZmxvdXN1?=
 =?utf-8?B?ZEY2bzg0RGpTOXcrV0NqbldJaU5EUkdFU2t3eXJOM2dlRS9xalhMS0NESWwz?=
 =?utf-8?B?emV4bWUrbjdaY0hvd2w3QTF6S3picWJrTGlrM0h2c2drdGhzOHRINWVaUkI3?=
 =?utf-8?B?WnNZNWhQU0ZFQmorSnVkVHNUTm1IbG1jdmJSUkpMUEQydVBsdlU2Y3R5dldN?=
 =?utf-8?Q?Cod8PLPIEvrs7J38ZoKJOOf0v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249bf700-da62-40a3-2051-08dd458055c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:25.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhxnzHxEVq9spQJvNG2Oo/QkLYeSZzav4wympD+45yAGhqp9UA0cze5+E7h2XnnIFafMUUT+VLc3sSxVdQBIVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_165939_605495_B768C46E 
X-CRM114-Status: GOOD (  10.92  )
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

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-pm8xxx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index b2518aea4218f36ba24a5fb660ed11c1dd78940b..852d80188bd0b5e75882c7945f166162fb039507 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -523,21 +523,11 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	rc = dev_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
-	if (rc)
-		return rc;
-
-	return 0;
-}
-
-static void pm8xxx_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
+	return devm_pm_set_wake_irq(&pdev->dev, rtc_dd->alarm_irq);
 }
 
 static struct platform_driver pm8xxx_rtc_driver = {
 	.probe		= pm8xxx_rtc_probe,
-	.remove		= pm8xxx_remove,
 	.driver	= {
 		.name		= "rtc-pm8xxx",
 		.of_match_table	= pm8xxx_id_table,

-- 
2.37.1


