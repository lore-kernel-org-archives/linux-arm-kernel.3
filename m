Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF46E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdNn4snXo6oooVofIwLnFGavxhgfW2ExUaOQfZOcC+Q=; b=XpgJALaRa4173bSKVS1QOZkMww
	GDKM3Fjm186SRGEU3uGSCVJcIQn3ZCkYE8BYj0XTM1eY7WT4LqTK2QH0NCPa1jSO/ZRHH3JGz6RQh
	kKjQqAomoOExQgS3oT0uDo4YlPh9vHibGiWtqBI8cSx2E1LZjy7fYJ9KObVW6VDXyBGZFHEMusbAr
	xdgL0f44dDLpDja2same0sgMBpP/M32AwGR8ELm2s3RgsR7PvWUAGF59SMpVFetJ3DAsVWLuNKgkr
	giRxk/ZakoR9qGj0vi9Xc9ldtz5PXDTnMVpzio7+sTLYipCemoutdgoXBtvPtN8l9cX6lrdlpdZzG
	cxnX/9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIJ0-00000004rJN-2S1f;
	Mon, 13 Jan 2025 11:08:26 +0000
Received: from mail-am6eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2612::61c] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIG5-00000004qfu-2dmF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb5Wf2/qZHbygW26+UpdOBorGPnsVSEANBRKp1L1TuujEhPbU4Bs2QxTf+m+nlYzi3Jk71ogUATsF6FJex1KfTmEgGDf+xZn6Z1NiWS3HZAioxMY32wi/fkkMkqWCbyHjicgpjCrCkQzFqhJZrNp5mQiTcuIK8ePZ2XlKM23d8bdxzREc1L9wP98GKOQCjXkNNwmd/64LiqY66bGweJZd49waPkcvWNBnHNwWmhfeJ+jQ37wIPO/5+6z92uwoiqAJJweyd/mS/tpx6LlP/24VHzj2vPW0sWJHi0NfcPcJDmcN6zCgNGGUGM7g3Id1ssbEGp4j6EC4cReyb1UHUibhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdNn4snXo6oooVofIwLnFGavxhgfW2ExUaOQfZOcC+Q=;
 b=rXGfX8NpA7Pl0I7N9evF+6tKgTz29mry+pvZB2TKlUwXK6C9cuW3wUJkP594sXWqiiZRsPh1MsiApABPcbMJ/IoNgmhfhQApNMQlHzn19DyubtMOgx3ARQCUUuTovkYb7hcg+a5ZnKo6eLRhHYMcKVZZbS1jMLWZvjHnFFU3kTHgxLUr9WBhUkHsOHq3PLIbO7e4v2rrCv9EQ1gJa6dRw8tYTZCbfn1QQ9znezCLPe4ni0AxTfM6afg7K9Nk1PV7qp3gyakTKHv9dkxrNYKQ8Tnuv4Hm5VTT7X7RtpH5tLGH3DwtSZMmQTwDlBxk3nTs9NPOQ0VXuI8Sp2SV0Jzbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdNn4snXo6oooVofIwLnFGavxhgfW2ExUaOQfZOcC+Q=;
 b=iGuKK3BFLhRijDYByf/PpaO87wcJFVV6QTyd9bmFzd1/Y5wnAMqIWT4tGwcOYa+CWBFEup+G6iRIBd245m3SgRWHutJaCpJvP5rpz3aDGml2M7sIiLsTpJ/AqZnYEM8FHKThOlxXzNexH3I3tGlSmQs1/gSVoEQkqXyO86bAD95wQ/zJW98vNHAxqiTH4wrHdjjH/ScQwjymyidn5YNgnGz9fd1XUxv9dbezZ6Ppoe3R3ytXeEXDOx4LbctUW23+wp8twZPZoGZev76vjAVpn9e+KGE9qvcfNbaSHjoTJaqTbM8J6wrjFc6XJ0+dszmkuDGky/EaPacZQ6VZJSa+7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 11:05:20 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:05:20 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 2/3] arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
Date: Mon, 13 Jan 2025 13:05:11 +0200
Message-ID: <20250113110512.506007-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 60128616-6a45-4b4e-ace0-08dd33c22b66
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2tIY2ZYR3Y5RFZQK1hjdmYxbTlkTUIzSU1lSThVZTdMbjJqODYvZ1B6ckV4?=
 =?utf-8?B?MFUybmtSa1BwdUVGY1VjaWdlbHFGMjhzMmpKTVMrbWlBSmlIcCtGcGdlY3Nj?=
 =?utf-8?B?eU1SSW5NaWRMb3JvRG9Da0VYelFvY0dQeWwwZFdlR1ZONU00WmtmcHRJUXlN?=
 =?utf-8?B?aVJ1NksrdUVwbDd0TUcvdUxjK2dwTmwrNUpBbmt6NUxyMHRSVkh2QllRNVMv?=
 =?utf-8?B?WVJjUlQ3WSs3czFQZ1Z5QkpESzhhRUU5K2lVUFRBUU5FTWdOU1A3bHJ4K2xY?=
 =?utf-8?B?Wm9aQmdjcVVLMmFqeWpqdEFENit1bGg1U1BKaVY3b3pibTlIM0RtdXRBV080?=
 =?utf-8?B?bjRPU1M2bHFvQ0xGeHVETU9aekRNWjRMellZODBpaGdKM2dlcG9xUUxHaXB2?=
 =?utf-8?B?ekszSWdQb0tIdnIwUXJUemhEWTZEMWJYUTdYZHpFZFpVU2x6VE4xQmYxQmlo?=
 =?utf-8?B?S2ZTZUNSZ0VZU0pDckg1SVNNOU1OZkh3WFExalpwZ0lPbG8vem1LMkdpNHVz?=
 =?utf-8?B?NnNSZ0g0YU9xT1VQenlmSnh1OVFyWUxvZFBjSUNkMXR4UmxmcnQxNFFickVt?=
 =?utf-8?B?N25PWDROQ1Y3RnlBdU5RTmNydVVGNHcxTjJDbXgzL2Y3b1BYaGhscHRXR1N2?=
 =?utf-8?B?eGxiK3FZRVlYVnZJY3hTQkpNUmplaUlUcXRjRnEya1pGYTdLSXZtYnNjQ2RY?=
 =?utf-8?B?T1RnTGNnaFRVdFJNcHhONDRaZUVrcnlwSmNvTlNCc0g3MVRTREtveGk4cCtw?=
 =?utf-8?B?YjdaNnFBNTIwYVZEbElKbHp0cCsxYkNyNHRnVnBiNGtMRUkyNHM5ZHBHU21J?=
 =?utf-8?B?OFo1ejVpOEhWQUlXVWx6eGZLTzdCV05NWXoxbDFidiszbHRoRWg1eEZuTzA1?=
 =?utf-8?B?MEllR0JrTDkySU01T3NGQXlQR2QwaGpIYzR5Wjh2dmJYQnR3THA0T1ZEMytS?=
 =?utf-8?B?dXBUZmNhRVdYaXdQR2VneUpobnpmQWVXTVRTVmpES0M1Y0xIUVBYdWRMN2tt?=
 =?utf-8?B?UmdPU05xbk5kTDZEQ1ZQOUtSTVpFOFhwYXNGM0dzT1pyZjlHa0pMaHZPakJw?=
 =?utf-8?B?NHZkeFpqeXgxWmtGdXhORkZWWlgvVnNaS2ZzUEJNTEdPKysvU24rVHVOeFhv?=
 =?utf-8?B?SEZOeUJ6Z0duNTBLSlpOTmxUS3dyTVhTYmRkZkdXd25zdVhEMmJjNFA2WjJ2?=
 =?utf-8?B?djczQk8zS21jamlMVXl3VTBnaUgzWDFtZ2tGZGdtNWtDWXdra09ZM1lEQUdL?=
 =?utf-8?B?OU1XUUJ3cFhidlV0SmRWSThRU2JTck5oOTBlK0xjQ1VxOUphRTBGQ2FUbTFF?=
 =?utf-8?B?aXhMd3FxbFZndEM3YnI5SFdkZEJjbXpQdU9SSHBsemxwOGZuekJHNVBuS05S?=
 =?utf-8?B?MXRoN1dZeHBxc1VJY205c0RjMXBUTmJlZ0huKzJ4WWRBZmtSSVpkZ2o0SEg1?=
 =?utf-8?B?T09vazF1Z2VYNElxV3EwWHg1cFp5QXpUQnE0WEg3bTliZURmeGNMRm9uVDZO?=
 =?utf-8?B?Mit6UXdHeFRsYmFSbGRVbU4wV0dkTnpDNGh3ZzBCNUxRT2pQdEJ0OXduQXkr?=
 =?utf-8?B?cEtxcFBxd05WK0VGM0YrV3ZaVDNXblQ1RmxubWY3MTN5UHlyWCtPd2ZVSEUw?=
 =?utf-8?B?YW1kSTIvL3VudUFRdUtRMXo1cGtZVXg2bGx0YUJvRGo3bXp2RWpXVU0rNnV6?=
 =?utf-8?B?b3dHRkhFTUpjSVNvV282RXE0WWkwREtsUlZWOWVuZDR3b2x0anZVc1NvTGNT?=
 =?utf-8?B?RENCcjZ5VVZ5azBwMUU5cmNJVXlMKzFrQUJoMGdYdWgyUzVocnc1aDZnLzBH?=
 =?utf-8?B?VzJsaUdZQVUzRW4zYlh2aUZsWXpxcUtEZmd6VEFhbmxFNGs0MjAwdmlxNitr?=
 =?utf-8?Q?Gi47064+ESmR4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTh5V2tRVDNvYnJXQUd1aDlIRW1ITWptaXRvS3hML2ZpYzJzK1gxcG0vTlZP?=
 =?utf-8?B?K3J6WTZpZThvTmE3dWYrc1pGNGdrR2tkYlpUWE9DVC92Rjc5cjh2ZkZRRHFO?=
 =?utf-8?B?WGE2SmpCajZVcUl1SE84TDE3Q1RaK3ZsUmJFOUpLbk9nR3VsY1NvNllPQWhj?=
 =?utf-8?B?am5mZExPNmZtQ1cvWjkrY1Y4K2t4eHFzczN2N1l5dXNLR2hWNmlwRWo5cmU1?=
 =?utf-8?B?dnRTY0g3V2FIdm9TVDdZak5KazkwcjFFNDAwaVArdTNHS003RUNDM0tLeFRM?=
 =?utf-8?B?cThHVVMzcmJYajVHMXdja2ZDYlJYMFIrSSs5cDY5RTYwaVlXMzVRNkhVSHpI?=
 =?utf-8?B?Yk9DdkdtZzN3d0F6VzR5Uk81L1NUSXI0S0RJaHQ2cG4yTWc5WTBTbld1OVB2?=
 =?utf-8?B?RDg5Vjg2VDdjbXZSdGEyZGVUb0VIUFJVejEwZ0tINlNWbWEvUFB2S2xxeEdL?=
 =?utf-8?B?RmtZWjhuY3JzZHYrenBia0RyZUxYNnhEZGozSTR2YTgybXBkLzBJeWhwVVBE?=
 =?utf-8?B?UXorUkphVmUvQ3NtVUNzM1djS2JiRll5eEI4K05aWDVmbTJJYUN0Q1UvSTFY?=
 =?utf-8?B?Z1NUbWxuOHQ5NXlQMkZKUE5qOFdtaGM1SVZzMmJlSkFLSFZieVN2ZW83TU9H?=
 =?utf-8?B?SU03OTloQmVpL0JJbkdNR2NGMFVYaUxDeTE0UFZXcmUrSFRnTjhNVEZwdUVI?=
 =?utf-8?B?dzF1NkI3QmZHOWJYK3VwOTZSNFRoZUF5VjFnSmZScytEMEJ5KzJia05UbmJk?=
 =?utf-8?B?VmNBaW0xVnJNazJjME1JVXh4SFNUUzBnY1phdUVaMGZJOFhzYmtHTGQ5cWxz?=
 =?utf-8?B?ditBRDFNSjZVNXNuQWc3NWZheWJIZG1oN1pDcmJkN3pSK3o3UEVGdTYrbEQ4?=
 =?utf-8?B?UjZiVHgzY3lIMmJYYnhWV2NKbzhoYzl2VlhUbzQ1OTBMdWhKaFpCY25iL082?=
 =?utf-8?B?RjMrNHVkOW54Sm1FeXRZajZYMVROQkRZc0RRTnJ2U3FSYW5rTDJnb1RLaVF1?=
 =?utf-8?B?ZklrN2s2c0htN2FCZ2hyZnEwUHBGWGYwc2RjbFhlYThxNFpndjVnR1ZoT3cv?=
 =?utf-8?B?Y0NPL0oybDNrellmalJ3RUcwK1AxVEZXaGlZQXR1cGFuR2R4M0Y1U2Y2NXlO?=
 =?utf-8?B?eHFsbzFmN1hFall2MmIyRkFMSlB0VU11U1RWY29IM2xaR041QzVhampMTjE2?=
 =?utf-8?B?a2xvUEwyb1Y3Wi9BY2xqek9lRTlFcDRQUXMvclNxYitRdHhic1ZyRk1SdzJ0?=
 =?utf-8?B?cm9hWUZjeHJxdm56elpvNDRHWXJydnBoUEV6UFJyN3c1bmhoU2lQd0FydDM5?=
 =?utf-8?B?RjNhSmFaMVd0dldqZmxTY0o4UzZGc0hzb0QzVEg3ZmEzM1FIU1NicGcwQmRU?=
 =?utf-8?B?Z3FyeU9xS1czZHhjamJLbWdmYVE1eHhtdG1pdTZrM0xsMVZtSG1HbGU0NzJx?=
 =?utf-8?B?MkVEQVlKUHpIdzc3blVhYjkwdkhMM2p1czBjNzdiWlcvMDJ4OCtYYmJMV3Yz?=
 =?utf-8?B?Vm5YZkh5Z09QQU5vbFJONHpBWGtxZTFYRW1ONks5UWg1Mk1qS0RCZEVBSzhL?=
 =?utf-8?B?WTVqaWNYMHFLTTF1YnNFcWhyYk8waVhWTWgwMXQ2aGhqRkdCVGJlM1NPbFA0?=
 =?utf-8?B?TjA3RnRabjdVbEpNM2JUbXN6RVB3MDMrVUdZZklRWFVlNTRnV25QUHBFVEtY?=
 =?utf-8?B?SlpvQUpXTnBHS3Voa2t0U3B6VG9NNUtQVFllSjNHZlZia3lEZGZ4c3lOR2Qv?=
 =?utf-8?B?b21VWTVSNXBESE00eTRxSDJrNjdMbDFWWXN6NUkrM0JLem92Wk5rV29XNzdK?=
 =?utf-8?B?Mi9Ma1RDQTJGUzQ4MWZQZUh3eWtIc2hwcWQ2dEQ4Vkc0ZEJubWpoaDU5YVpU?=
 =?utf-8?B?QW1PNWF2SFhJR2QrNVR6VW9kVFhNQlE2UUs0ZkNMTzlJdHNNcjI0aHFqVHlk?=
 =?utf-8?B?OEhEK0tVNDVGQlhqeUZRbXArTG85Tm1YZWF0YlBOdklGRWN2WXVpTGxSclNu?=
 =?utf-8?B?ZGtRTlR1Ykg3UTZWbFNTVjRhRjZ4SmU5M2tnWXc5YndMeEpSbjR0Rml4eTlq?=
 =?utf-8?B?RW1teUN4cXd4UU10UVZqSkNuTzhCVDc0QzZlRmFSc1AzRllsNGhVekM4YlRx?=
 =?utf-8?B?dmhYeDBXWjZlWll0R0VwaTFsYVI5ZzN4OXVjeTJEYjUxMDVZejgvWlJSK1lT?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60128616-6a45-4b4e-ace0-08dd33c22b66
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 11:05:20.2895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7ZbPEAWIkI+HCHvz2Rpj4GydoOKPplW1RmQIxXNiNQN83oUKox8uW6tk0+4A1sq+a+eQ8GxNvb6m4e9jiv1RZ6JXpAMzAtS7Y/YJ/qGouo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_030525_820658_EE51E3EF 
X-CRM114-Status: GOOD (  14.40  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Create common part, s32gxxa-evb.dtsi and s32gxxa-rdb.dtsi, for S32G2/S32G3
RDB2\3 and EVB G2/G3 boards to avoid copy duplicate part in boards dts
file. Prepare to add other modules such as FlexCAN, DSPI easily in the
future.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
 .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
 .../boot/dts/freescale/s32g399a-rdb3.dts      |   1 +
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
 5 files changed, 275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
index b9a119eea2b7..c4a195dd67bf 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s32g2.dtsi"
+#include "s32gxxxa-evb.dtsi"
 
 / {
 	model = "NXP S32G2 Evaluation Board (S32G-VNP-EVB)";
diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index aaa61a8ad0da..b5ba51696f43 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s32g2.dtsi"
+#include "s32gxxxa-rdb.dtsi"
 
 / {
 	model = "NXP S32G2 Reference Design Board 2 (S32G-VNP-RDB2)";
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 828e353455b5..94f531be4017 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "s32g3.dtsi"
+#include "s32gxxxa-rdb.dtsi"
 
 / {
 	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
new file mode 100644
index 000000000000..a44eff28073a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ *
+ * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+ *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+ *          Larisa Grigore <larisa.grigore@nxp.com>
+ */
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		i2c0-grp0 {
+			pinmux = <0x101>, <0x111>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-grp1 {
+			pinmux = <0x2352>, <0x2362>;
+		};
+	};
+
+	i2c0_gpio_pins: i2c0-gpio-pins {
+		i2c0-gpio-grp0 {
+			pinmux = <0x100>, <0x110>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-gpio-grp1 {
+			pinmux = <0x2350>, <0x2360>;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		i2c1-grp0 {
+			pinmux = <0x131>, <0x141>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c1-grp1 {
+			pinmux = <0x2cd2>, <0x2ce2>;
+		};
+	};
+
+	i2c1_gpio_pins: i2c1-gpio-pins {
+		i2c1-gpio-grp0 {
+			pinmux = <0x130>, <0x140>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c1-gpio-grp1 {
+			pinmux = <0x2cd0>, <0x2ce0>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		i2c2-grp0 {
+			pinmux = <0x151>, <0x161>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-grp1 {
+			pinmux = <0x2cf2>, <0x2d02>;
+		};
+	};
+
+	i2c2_gpio_pins: i2c2-gpio-pins {
+		i2c2-gpio-grp0 {
+			pinmux = <0x150>, <0x160>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-gpio-grp1 {
+			pinmux = <0x2cf0>, <0x2d00>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		i2c4-grp0 {
+			pinmux = <0x211>, <0x222>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-grp1 {
+			pinmux = <0x2d43>, <0x2d33>;
+		};
+	};
+
+	i2c4_gpio_pins: i2c4-gpio-pins {
+		i2c4-gpio-grp0 {
+			pinmux = <0x210>, <0x220>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-gpio-grp1 {
+			pinmux = <0x2d40>, <0x2d30>;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-1 = <&i2c0_gpio_pins>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-1 = <&i2c1_gpio_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
new file mode 100644
index 000000000000..91fd8dbf2224
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ *
+ * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+ *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+ *          Larisa Grigore <larisa.grigore@nxp.com>
+ */
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		i2c0-grp0 {
+			pinmux = <0x1f2>, <0x201>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-grp1 {
+			pinmux = <0x2353>, <0x2363>;
+		};
+	};
+
+	i2c0_gpio_pins: i2c0-gpio-pins {
+		i2c0-gpio-grp0 {
+			pinmux = <0x1f0>, <0x200>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-gpio-grp1 {
+			pinmux = <0x2350>, <0x2360>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		i2c2-grp0 {
+			pinmux = <0x151>, <0x161>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-grp1 {
+			pinmux = <0x2cf2>, <0x2d02>;
+		};
+	};
+
+	i2c2_gpio_pins: i2c2-gpio-pins {
+		i2c2-gpio-grp0 {
+			pinmux = <0x2cf0>, <0x2d00>;
+		};
+
+		i2c2-gpio-grp1 {
+			pinmux = <0x150>, <0x160>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		i2c4-grp0 {
+			pinmux = <0x211>, <0x222>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-grp1 {
+			pinmux = <0x2d43>, <0x2d33>;
+		};
+	};
+
+	i2c4_gpio_pins: i2c4-gpio-pins {
+		i2c4-gpio-grp0 {
+			pinmux = <0x210>, <0x220>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-gpio-grp1 {
+			pinmux = <0x2d40>, <0x2d30>;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-1 = <&i2c0_gpio_pins>;
+	status = "okay";
+
+	pcal6524: gpio-expander@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	status = "okay";
+};
-- 
2.45.2


