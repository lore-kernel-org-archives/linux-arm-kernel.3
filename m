Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969D7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 01:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcVu1prbLUvLRy3Dn1DsiDEQRfXHRu4dapPBAt88k3A=; b=UDeA5YulLT82fDjV8KRKwi9v7Z
	++iWkIUDT2u4jwJBnqpon79CsejEgKJ7NIQsmi9GQncAKULKvLrMwgtBq41IUKY2U5thJVGsasYcY
	9lJCgX9bkQs9KOArh+uvuxTuAbTqzxIkZtGPFmSQL4kqCFD2FwJh+2f1QU52xRVPDn/EV4KsT45MQ
	p7juNvJw7UgRBL3yNSVxXzSgQQ5QbpD/s7hWAIxmje5TqqMbo3lxobb3pge+03VO25QvyzJOPEo0O
	czyhPQQ73B0PxF3vnrdzaZEPlHhoVp0duxkJAnzy8RJJVJqgyQUUrizdn9Kd7Jq/DnxFQE9Hiz9MI
	D4bFwN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unosi-00000006GbF-1qRo;
	Mon, 18 Aug 2025 01:41:52 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unodc-00000006EkR-29yp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 01:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xn7Uq98YqWurvyo4/TFTQZe2k5ufEN1ME+njItn4Eh5Sw2UkbIQQDHWTDGgZfHYfGOu+rSo8n+4TlPz1WlBIXYJep+KxAPXX6Xb2nUkqEQn+9CnAmamTNzxRg2kdscjt913CVDpru/2iujvYXB7KRlls+2WfkfWQKCqYK+zonz/TPfkbbO4eD3wchByS/GLIRX7ksV3U3mAlvoaUAiNfch2waPMC4y6b2ezGeb7r8JALTgxf1Z+EjWkU3neIBMEDJtsnbfBIMJ/hwXvdf72UYCRID751B8g5SZgKhnW4dHiJqX65bWwVqSIO3wqWe69QFA28JhXrDvBXaBoy8RxE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcVu1prbLUvLRy3Dn1DsiDEQRfXHRu4dapPBAt88k3A=;
 b=tjSqnQyu/UAHFMyN4B1j+rUUSNED6fE3MYPJBUNQAuD7kWvqTS+nHLTAJfB25opF2XpmnFdmK5v8QoTr7a3AHVFob33hRG1Zt355n6NtKPQ+UDVaMDMb7enH04uGEu6mitEQAtVAsyd4QvTREXpltVCPlv1Xk4LNd+D6DJ38dVAQDkYGBsQ4tq1ZBh50nxxQxqJrZx09dljVoni7/RkFkmp+5AF8zRuq/4P5CkLhku6nWcVfumrQSHOmv2nUM+f/0PYPbT9uRpMYnX8VaEcZeiqQ0pqGZwzinkSELyTsfRFaBaB+r6ZAkW+D+WB2mBZIt/8LE9M6zQU/2ix+haAQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcVu1prbLUvLRy3Dn1DsiDEQRfXHRu4dapPBAt88k3A=;
 b=e6fb3v13LtRqTDAVx4A3oOnAdc+fv8fHsyjhJEW2sNouPVn/H+Mmu9dDrHxv/fSk9DiRgr/KKP4/j1w4JoG8tPND72L6g4fiyF2WnRIOrHIhE3bS9YZgNu+B//4+GWGqKdvJk9UAdDii985j0zecH/WsB4uSL6APJBLVevjJv1HveBjL9MWczfBZ7lG23/OoKbZ6Vhn7Hzy7u2ZUiAD1izF+6r95ngG7nBbjmMa9w6xHSwCDhixOCzk+gzs6dJhszwy+9821s25hR1knjaDs4Uih618+ZR9WhYAUbHjQH14pbamDzZT4F+3O00sg8rpPiuTSEiFT3R+n4ljz9uxW7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7388.eurprd04.prod.outlook.com (2603:10a6:102:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 01:26:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 01:26:09 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 18 Aug 2025 09:25:35 +0800
Subject: [PATCH v2 05/11] arm64: dts: imx95: Add OCOTP node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-imx9-dts-v2-5-8ba787fb5280@nxp.com>
References: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
In-Reply-To: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755480344; l=1132;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EqWij33R1p3LnfIB/RscL5Tw1ZYJRG+PZyZ1Zh2uutI=;
 b=depZTB5OxbJCGjcxqRrjOdSXp7T2kbLNj+5R9Y/L6Qok9i8byPss+r9qY86UBIL39ceJAMCVq
 R6LyTyN0KxsCtuQOP0eKfYR+osTn0pfDToYJwWDtIejIvfINazW5RRb
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 33762dd0-6484-484d-ee85-08ddddf63613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkYzb0tkb2ovQ09QSHpEcEQwazBxYW4zYmsyREFkeUhLK09EUU03NU1SKzAx?=
 =?utf-8?B?c0pCeENOS3A2VGdEbkRyMTR5QTg2bk1CV2liZ1hlSWIvTlBDY0ZveXpobkh1?=
 =?utf-8?B?OHNrM0FVOXdqWjZZSUdMTERKNlQ0V09xL2drK1JrelNTN01iQjB0TXRmaDV1?=
 =?utf-8?B?aHZjZjFsYmg2Y294RGRTNjh3MHJ3blRYajVHenN6bUMxMERsMURsLy9uVTZ5?=
 =?utf-8?B?RkUvSDBhc0xCNVBkNG11cmpQNFJUSGx1eWg2dGpQRVRQOVkxaTg1ZVpxSmZz?=
 =?utf-8?B?dnlTaCtwWTJzMUh3Ym0ybEY0WUVLaklrbmtzYWpwdVBvcWRKdkUxUGFLdTBw?=
 =?utf-8?B?RHJmekt4Wk1NTU41dWdpQWh3WjhMNHllNHVzcXVUSTQzTkF3ZnorcnNoSFdu?=
 =?utf-8?B?TC9LZ1lTZ3RpejhNenV2SjlqUUlOZVRCelZOcGZ6ZUNtY0wxYVpMLzFpNXUy?=
 =?utf-8?B?R2VCcXllbW1wcTNybXBYL0hkR0FQa21Pc3pId29oZzdraFY2YlVMTWxOSTlL?=
 =?utf-8?B?NzcrWVNLQ3RyUkxTZitXSDlMZndZaUlCY1YwcTNGMDNhZ253UnZHYU1CZFFU?=
 =?utf-8?B?cm9DOTRVZXVnc0tEQlloWlpaRjlyc0FRRDhjZ2M1R290NlhvOUpzVHgrN3VG?=
 =?utf-8?B?VzJVME9rcmROdGtMcmFsRG5BMmdhTkdLYWNES1hFNzZrS3ZFL0lyVEFlcXZQ?=
 =?utf-8?B?dUdUUHY1S1dXWTI5aWhieE0xN1Y4NVBpcm0vRHY3LzZYWWNRSERBYkpqc2U0?=
 =?utf-8?B?Z2VEbXFtVllwOEpvL3VpYUVMT2s2NlpWZHhYcmdwcGFBdW9BSkFBeEJ0T2N4?=
 =?utf-8?B?MHNQL3VoMm9hWEFNeVdIZXJGNnFOcWZ4eXRqOG13T3V6dG9seXNmMmRQbVJh?=
 =?utf-8?B?WVIyRnEvbjZOcDBQYTN2SmZLN2JNWHRmVGx2cTdrMFp4NUJMTFl2WXdjdEdK?=
 =?utf-8?B?UXlrRWZTQ1E0MTRsYXdlNGZEM1NEZXM0cFhDcmZJa1NVczlFbElpeldoMGlS?=
 =?utf-8?B?akI4SUdpQWVlRXdWSGJONjBROStlVWFqWGJxZm9aQ2Z2dXZkZU9pK0I5cVZs?=
 =?utf-8?B?cS9HNC90RnhPYXFNYVNnYTRRQWlFWE5vbWxoU0VnMEFzZ21VM3Q4TUZnTmNv?=
 =?utf-8?B?THA2NzllNlk3WHhyL1M1VWFrNjNxMXJzZ1FTK3BvNHdPd0dpV3JRcW5MUlFk?=
 =?utf-8?B?V3piam5ZTk1HNGVOU2ZrWlRrTElkb05Sb0NyMG5OVFM4TjVLTUZTRTVIeFFU?=
 =?utf-8?B?V09PelNKdHZLZDJPSlJJUUVJVytyQmwwZ1lZRmEzMW1PYVZsK3RobjV1amVs?=
 =?utf-8?B?RWhHN0crWXdEU0RJeC85dG1nTzFMVGkrbmtiNDB5MzR6YnZPY1BKbHNMRDlw?=
 =?utf-8?B?c3NrN1c1T0grVjA1L2ZOSnNXWU51S0FTWkdrMWtsMDdZQ1MzR2JoS0hCVSto?=
 =?utf-8?B?UkJ0NXNZdEtxT3FScml1Y3Y5N3lFR3M1VzFObTZVQUkxYmVCcFFxaVhYWVR0?=
 =?utf-8?B?S1B6d212YzRmWldZNTZyVGZTclhPK0R1QVVRdk45QmQ3WkszREM3bXRINHJT?=
 =?utf-8?B?NVIvZHAxSm5ZMWNwaWdMQ0k3U0NsMm5TNy9iOXVBTzFHOVdXb3FKYkpIaVh0?=
 =?utf-8?B?R0N2dzJRRFJXdVp6djBaRHJRVUZzVkhlcEM2YXUvTVdBeWxYeWVhVWZuS2pR?=
 =?utf-8?B?dE9VNitwcFZ4SjZvLzJWZkdQZnpQSDNicitIUGxySFdQM3FtM2t1N25xWmJY?=
 =?utf-8?B?WHJjWG9SWVlqeHRsUlhNR2lFRmk3Zm8xc2lUK3RHc29uNEQ2MnJtUCtGeFBZ?=
 =?utf-8?B?VXFTVkNjRC9qSUNLUDg4K1VFNGUzRXozUG5rNWpkam02NC9aNU5NeWk2T01O?=
 =?utf-8?B?R0pRUkplK2VxaVdmYlVibDVWTlFSZTUxdFVLbldTdjdHVXh4NEZSSlNTSmpP?=
 =?utf-8?B?eExYM3J6eklERFlYenFPZDBiN0dpSDdJVWViL0JBZ0w0WnBweGI3TTVwb2ZQ?=
 =?utf-8?B?cENiSElzeEZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzduQ3Z2ZTdSWXRkYkxGMWQrcW5OVVQxUzJac2pKSzFtclBUemZrT3JWYkVw?=
 =?utf-8?B?UCtweUFIVm9UNlZ6dlAzSXl5S1lLd2J2SlBzdml4TzBIbUNpUzBLcjVsRzlC?=
 =?utf-8?B?NjdBenpkUS9TL2RjcC9qZTNNVjIyWTM1YmxIc1NrUHlMdUovb2dBMGdFTFJL?=
 =?utf-8?B?UHFQa2E4K3RBc0dFRXV4K1BTajR1bk9NVnRWUEkwUndaaWYzczM3REk3b3BC?=
 =?utf-8?B?WnByR0FmR0tmM0JkNlhDdW9WNW5TTmh6RUs5UklqU0hkbTdaUTlpYXZCV0F3?=
 =?utf-8?B?R1l1em8yR1RBSEMwWXZMNUszSTZFbGUrUVJnekdCZEJrUjNvQzMwWTZBZDZm?=
 =?utf-8?B?Ulk5eFNCMWNSUUVBeHk5Zy9nOElRcDNDNFMxSEVNemJoaXkyajJvYWFQdGI0?=
 =?utf-8?B?MmhQVTVsSTMrQkRmY0szNGYzR2RwTURFZ2VhREhXQU1MOHY3N3l5T3ZIK1lm?=
 =?utf-8?B?ZEdZVFMveDlneWJLclAwaFFzMHA0a04yS3BpVWtyVCtrYVIzSGFTN2IwUlNZ?=
 =?utf-8?B?SXJqUGhVZWxZKzU1eDNsMDQ1TnI5eWYrVkNXaTNkd2VwanpBd01IUGdldEQ2?=
 =?utf-8?B?QTJmWWFYcVFsMGZJdzdINHhOOHE4bGgrMkhDb2poeWxlclh3aWpwem1DaFhY?=
 =?utf-8?B?NWtkZHdyYVJCdnZJK0MrTmlxM2tmdmoxVDBVUWpMU2lvVTRoY012Y3Bwa1RS?=
 =?utf-8?B?bFNRY2dxTkpCT0o5MElUWlE5MXFGT3FmSXZkakwwNU9mbEtnUHNMWEwxZWxJ?=
 =?utf-8?B?K014TDhNRTNjMmNhcHhFZXZWZ3hEb2sya3BHamk4S3NvVW9MMlkrZVY0MWcw?=
 =?utf-8?B?WnordnlZMGF2OFgrN2owZ2tPc2pxM3V0OWVsM3JLN252VlhxTVRYaUtDemtO?=
 =?utf-8?B?a1pRekx2WW12Z3VzTmxqNEpqcUNacUZCRzZMek9QVWdTRExHMW45QVp3UDE1?=
 =?utf-8?B?SnZYWnBXWkFJdFl6RGRQVEEzYWFLVVhnekhzc2tQZDQxVjBKYk8rUStSeWw1?=
 =?utf-8?B?ZENUaUJrRGRRdW0yQTVPOHNya24zTnh1Wm1NR3Z1VzBwTVVQSkxEQVVjQjcy?=
 =?utf-8?B?YzQ2UFF0UjVYanJYRE94MHBrU09JazhiTHZHMlJCWlM5Zkd0bE9KWElIVHA5?=
 =?utf-8?B?bm9BeDllaHREQXdJUFRJa1l6YUd6dGZKdWNTQm1VWXdvVVBIYmZRV3UzcU5n?=
 =?utf-8?B?bDQxL1Y5TkVIZjNIRDFzbU1UZzRTb3VYWmhjMytSTWtnUkZxYmlBWWJpNmV0?=
 =?utf-8?B?K0ZVVHUrM0JzclNoV2ZyZHU3aEkzbnV2cGlqNFVRYVF5djJnVEdQQkNQOWMw?=
 =?utf-8?B?czdDTWVRQjFweFdvSnY1SlpGKytvSjg1UC9tSFpJQWJUTGxkTWtwL2VZQnpP?=
 =?utf-8?B?eVcxVEtKbC9PZjNzUHliS01wR25QT1lub3RkQkZwcXFRcDYvc0orNmR3SEo0?=
 =?utf-8?B?Mm80WlltTjFxdEN3UHpDd2VvbCsrN3NORWErQ2dxOWtHbHQrTFMvelJ0UkVM?=
 =?utf-8?B?T05vUllhY3RMb1FSMlA4S1cvWVh4Qlc5RnB3ajJ6ZjRraHRWR0h5b2xUV3Ba?=
 =?utf-8?B?QkYwZlAvay9sdzQ2NFdId0dvTlVUUWtTVTJvcENtY05xQW1sbm9qcTZseDFC?=
 =?utf-8?B?TGtaTFE3RWxSalVkc3I3bGZpZ1VlSU1kRGh1dTJUcEFjWFMrOTR4aTdoRHZ2?=
 =?utf-8?B?UTBrZVpoN25RKy9hQkhDdkxIWDV5UUZvNnVwYU9rcGI3RHdiL3hhVnZOUWF5?=
 =?utf-8?B?MEhnK0pNQTVmNmsydnlLWW1MbGhBUTdtQmNRTlZleEhCQWFqRzFIZ3RRb0V5?=
 =?utf-8?B?bEJ1WHprdEF5S2dvbEhLRzh2ZEt0T2Y4dmRoZ2xMWXpxUTU0SGtSZUVYUVZx?=
 =?utf-8?B?M1BCQ2h3WFlzanNXS0VKai9GbzA3SWVsc1lydExPNEJyMVZaeU1KcE9BNVlQ?=
 =?utf-8?B?QU04QlUreFdHQVY0WE9HZzFhd0JvTGpSZlBjRmNqbEFCY3ppa2ZnN3N1bThM?=
 =?utf-8?B?R1lURjZWWkRlYkRDUWpLZ1JSQy9UWVRQSm41clBvYWQ5TWREQm9jSzVMWHNS?=
 =?utf-8?B?MW5HUldQQUhZMVNkSU5YRkdKUmlBRDVLOEs1U3BiM2kwMG5kaWZDRWN5Mjlx?=
 =?utf-8?Q?c0aUoJp1o1x04S2RwZ0j9iB3g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33762dd0-6484-484d-ee85-08ddddf63613
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 01:26:09.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J580Y7KKy624kxNptqqzWCkETuxNJF0H8Sa+N3IyKOUui7qMObLq0aP2xhaX9NXHosg3M1434Gdo23cf7cYKaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_182616_558913_D5ECBBA2 
X-CRM114-Status: UNSURE (   9.62  )
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

Add OCOTP node to allow reading fuse using nvmem API

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 02c0422a7aa3877c8431c9b050d85f43f5ed7bde..adc63448aa15b148ca0eb8499ff5bc217fe8208e 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1553,6 +1553,25 @@ gpio1: gpio@47400000 {
 			status = "disabled";
 		};
 
+		ocotp: efuse@47510000 {
+			compatible = "fsl,imx95-ocotp", "syscon";
+			reg = <0x0 0x47510000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth_mac0: mac-address@0 {
+				reg = <0x0514 0x6>;
+			};
+
+			eth_mac1: mac-address@1 {
+				reg = <0x1514 0x6>;
+			};
+
+			eth_mac2: mac-address@2 {
+				reg = <0x2514 0x6>;
+			};
+		};
+
 		elemu0: mailbox@47520000 {
 			compatible = "fsl,imx95-mu-ele";
 			reg = <0x0 0x47520000 0x0 0x10000>;

-- 
2.37.1


