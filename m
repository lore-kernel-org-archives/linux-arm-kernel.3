Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0623CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjkLJtnxM98/AgFmjH7Sdk0bVMrTXdTPuwMI7aqdEIQ=; b=zGDcWBzn2JWxecX12B4NfKGqoE
	vaPOn+IXXd3XDvSdBVY3wxPqC2i5ImPn9xt1v3lfkdOmlx84KO3Ws7O7l6MdmRJ3OUBly3i88VE2B
	QFhGfJ0kzamWsgj69sOuxOUmairu9+Azk/k4eBl0zkHUDLeEddj/fenig4TQaHhNrlxsT0slnYAPT
	l4SDD5l9RhO5bPrBbt2m42OFNp3P6lCAu1/hTi4hEgjADujgxRS8xwiJBLswcMCqwHEe0QP1rRmE4
	l/mxEcWuCUG+PXvsV4YE1hiY1ERdCzf3eDPeYBoC3ScYj0v1MK0pIeDRRuE/Yb/MYkc9c10bzLyJc
	B5p8Qodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usc9s-00000009qnZ-1air;
	Sun, 31 Aug 2025 07:07:24 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usc7C-00000009qfV-1YPs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 07:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwR3y5luUnapd+DBQYFkbzDLY7FRC58iKICwyhSKNikiGgmIaMQVocqcH0LcRgEuMICZalrTOq+5eQuBIN/xhdqlRkqBL7kMiXS9ME/AivnIITPngLBJwb/JvmMmbehyxZTvjFtgV6L0l/Qk+CKiSZ30uLgnnkgyidjkKoFw4RKAQiyCFn2VscquG7dZav7SHgva5BFf3lBBKX+vio1f5JTvTx8byHdFhrmP7+Cap5GwBaHi9qOflaP2cRKVyn5VyxRmeb9tbNRHK/fypW5qdhomIr/7eoU7SyYDVt2+YNi6mzZWco3lpVKZbmMfQb4/jtgHsOHD4dSkA9yOWsC9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjkLJtnxM98/AgFmjH7Sdk0bVMrTXdTPuwMI7aqdEIQ=;
 b=hg/wpj34Es1eR0PRsQyscS+RGqF5uj5XOqKr7hnVDmWdS0wZFFdaEcQbEN5Pbl1Qja2MeWduHIBEFFzSiShuahpSTC3m+Hg7msm6NJRV1u5OQBG4turoYYkGh0bZ4eV5/QrLO97dvk/gm4RPB70kMucbeP4Qy43l4elczHf+uP3sKzXVZDsOQMUKI5QpJXnmMXtBCSUZH2HoKaCaQTxg2eGlo6FkIPDfm8SIhoqwDyue6eHqA04jKaSpHJZ8KCY0h3ZFjVqOvSmAOy5VmVEBHLmG0bK5fLvLZkS4gHVnie86rONqnO3EXBPbaXnBNzILI05VQeEwik1A1SA8DpbMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjkLJtnxM98/AgFmjH7Sdk0bVMrTXdTPuwMI7aqdEIQ=;
 b=nCgRHu8IdjXuvrrCF0TKJ1tojX9SduXYDwrMsu/LX3VS38udP+Q8bnwqwKUg04VvfnAud2KAF20NCQ2JIFX9aYXFfwi2UW/WhOd9K4snpac2gFMiXjybLoJ/5HYccHGmNtYDRa7PPcrJ4592OPrpUPwzUxzzrJnfpfxnJ/Bm1j3cg2VpsEpTF8MxUIy3K/jEHKvnua9iy+o0/qmrurParbgo4S1uCUJk8vUdbiomRtI51Wwa+25+rPI9ogGM3gG3V+dzO6zHwX9Yw0CC/UaneKfuC5Xjap2FSqrlHS8yxBdaz/WHBANWYJXHcYFpZGez8WqrKL2fWvqakC8fR50bqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11355.eurprd04.prod.outlook.com (2603:10a6:150:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.14; Sun, 31 Aug
 2025 07:04:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.011; Sun, 31 Aug 2025
 07:04:28 +0000
Date: Sun, 31 Aug 2025 16:15:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] firmware: arm_scmi: imx: Add documentation for
 MISC_BOARD_INFO
Message-ID: <20250831081541.GA17728@nxa18884-linux.ap.freescale.net>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-1-82c982c1815a@nxp.com>
 <20250829-handsome-fast-clam-a35afd@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-handsome-fast-clam-a35afd@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV4PR04MB11355:EE_
X-MS-Office365-Filtering-Correlation-Id: b0497540-7f4f-454d-0cf5-08dde85ca06b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T1psBvtxQ2efH3qWFqsO4srHmqGEWXIqiM9j66oje1Gd0Lj1pCxVE1eFsajv?=
 =?us-ascii?Q?UjN4VVSSm4snTUVzYhskAgPx8Hv/HLM1kRETiy031JlDLIp93tlSOtsYksbI?=
 =?us-ascii?Q?yVhdluq1ZgVsb3CzeyCQT+2PZm+I8bpAiahMnIrTXLcnlbNc+AlOeKVtpXjs?=
 =?us-ascii?Q?BEKjSnYP8qk03XnXzfJ52sjSJPh91nAL7nTn6osMCZykMtiOJLPbHfm03xKK?=
 =?us-ascii?Q?zUtOh+k9uTZYQ84du4IAfmtq4UaApf/T7N3A4WjB9hrCqFryWcmZRt9FZgZP?=
 =?us-ascii?Q?nuvyW+pq5nrYl5dR6VKm2eFPzWA1RBTfpRUVJ6t3G2pH7PLhnF7jj2rhPvLm?=
 =?us-ascii?Q?k9umyeDt4WT4+wfL7k4yM/eKH4cRBgGmxma/6oei3LuhhfoM6vMvhV6cbJNm?=
 =?us-ascii?Q?H8axDjgBTryfcia5mR8zOtXB9VxtR/IjkiLhCN2r7qYGWXts/0Kl+mCsLyV7?=
 =?us-ascii?Q?JsX6ARnmunQzM1tdbwddpz+9tfjVnq3h9H6xY+mWV0Xt1HGasVrvQjsuiX4M?=
 =?us-ascii?Q?mqSYCJwLdqbdYkmJRwUjaUkpnfvL3rIs4iS2XEivUMI88beuDlnqZg4v6vTb?=
 =?us-ascii?Q?seN9Y3RnJR9vSzG4eXGjpVOmj3vgC5cVzVxfXq/STQUi2ZNYLr8CCn9bum2d?=
 =?us-ascii?Q?C47aWfuWA3BHphZtrLfs4BHZMCfoUw3OoDB9emJhT3nCARsgNKrydiQH29X7?=
 =?us-ascii?Q?xd0pcEJZyJe3maIrOOCFIPEIRzpN5Ux4KszMWLqLpFTJhY4U4YRJTIgIFPoy?=
 =?us-ascii?Q?WCeP/UjkXRCeKTx0MO0pe5FGjd90PUR8Eydzj3ZWc7JDRzKQMgJjSHYLKCaI?=
 =?us-ascii?Q?fjJuFRRxwuSjAkD81xlOuURZA1ibUjchWgL8QWi9dTvlcMKtI3+dbRDVOQjL?=
 =?us-ascii?Q?BGOxwWyLeN1jKv8W/Ooa0+dtiLntc+79rG7+FARGIYEpwtn9L4ASbNagiYZG?=
 =?us-ascii?Q?erKyyr52UCs6IIr7abhsCT7tJggeR7kfsVnENN4NbXTFmq5ergWIuNy1R/tD?=
 =?us-ascii?Q?a0EYF8iiXzYm6odCikN3yuci2y0Pa79jfcfTwyQtdAzwnOAhVxByBNjHh6b6?=
 =?us-ascii?Q?RbYQDr34mxipnPAkRAKyvxWAuMRi/FwmkeNrGug9X2Jj7BfDgSDf6U9BmuvD?=
 =?us-ascii?Q?8LtFHq8g7sBF7KGKrnjTPq3ziDbvYMkN3sy1pO8NIfRvmapbh5QcdYBYxebT?=
 =?us-ascii?Q?lujoDjOwm6oDH5gisSeH1u0Oleoyehicjf65dR0FT/faqjwsljpu4QTTTv2Y?=
 =?us-ascii?Q?dLPSpkV/RJckAN5e1hopOBrE8ktlW26bUdkhwvKXhrE8uVsrIms6u0M5ZYVI?=
 =?us-ascii?Q?Z0mPKlpcMq2hWImeH44HOtYotICpn0TaDTX5aUVz4Er/ummpYWTCN1iLwLTU?=
 =?us-ascii?Q?xqiVRZJWDL6Ul2fEECqlq2fihDSy+h1o+MRTD8Aj73Gb0foBNZKjPw2eWgWY?=
 =?us-ascii?Q?qg5ACR3sxpAQfc+fNmNVUmop+lYx6aiQHW9LNTEA0JHwL2AMq20eCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fi8aH5bXOU5OZyZ6um0jfon+D5zdcDdEN1rYqK5t7XLmMVm5C5taiwF16nJn?=
 =?us-ascii?Q?1uCU157n34cZ+2xGaogsK1/RFSZtHxkdI9JouSkd0wynzF5YtvrED5kgBh1T?=
 =?us-ascii?Q?hosooRy0mRWc5tD/cuTOc5szGh406520ytJr4GJ2YY+GKcnI08UWWY+qdS1V?=
 =?us-ascii?Q?M9jslYltrPyL7yub16m2pH0UGt5Z1/eBN6EetISZ4RataiVNo9DKYT9DPRCZ?=
 =?us-ascii?Q?0bpzYW/kJDRujqPpKxH+MnMWijAxXaV4+NxGJVafx+uhCB/M7wpIR/UETis+?=
 =?us-ascii?Q?nJJuG1eeCB3gQFfofH7efEKh7BT8fbS37Kr69dRgzI03waPx8T5q3yvMbkwN?=
 =?us-ascii?Q?QwHNt52Fm+0zUXgC0ncttwRSH1/ocFsYWdwu0onbbnrU1/AI1UY+yihPJKd0?=
 =?us-ascii?Q?SYJ/NAdpnav/egUTPb10Id/mOArkNxGqhVjh6dE3M9+FNRgIl94NlGvyYuq+?=
 =?us-ascii?Q?01vGBKeZWg7zCXBHCuiGKqSSD0GsAgOIyxFmS1gY9kZYQMx/Vp7H1t8lMz3l?=
 =?us-ascii?Q?lk7UIz0lTvDZ9mal3Hp/xigfiha0OsFlfmfMo8k6h5AgLO2Cdy5cgYJczTk/?=
 =?us-ascii?Q?Ol/BmBPI2F5wq4sNoqcTeb67Lihi4qONt6r4HwG3N7WNaUUDMyMUfcVTggEd?=
 =?us-ascii?Q?xfIp+bPRWTFzyrSsGaWfnAe7riXx98eUY8jtZu6yOFv4NwE2iNs+aB3E6srv?=
 =?us-ascii?Q?Njlno0zzaQoAOM+a7GtOFU79a8Fu2Xmm1c4Z1Ms5E4Dm+LFI95BvwuqP3NLj?=
 =?us-ascii?Q?ZI8NxeuBOvUVIQjiowa6W07MlTa0haqpPzYcEmBAICY50vtd+6BxBP/YEjem?=
 =?us-ascii?Q?evgdiByHLobx8dKHwezSC2Y3pQL50ddkJ5UbLPORAf8NP+ybaOn76GJQ2jun?=
 =?us-ascii?Q?nBuCK6bFrIK48bErDtKpy4DKs4CoZheBB7f+LKS4Ol3x+BcmiLBKfrRcTTB5?=
 =?us-ascii?Q?xeWb0OBEsrEmNs4vOMg7JzePH4AdZVr5xaulQcGc69VO764vBzgqXfr+sA/I?=
 =?us-ascii?Q?404T6W+9VW6B6+377UwkH2zi7q5l1gE18u3h3IQnsd2xAN8cCOrzAjuMPX6F?=
 =?us-ascii?Q?T2G0cP9uVtn3FqwJWW8cIRHt1hM/9o7phm/K6aScQEFeh6wajLTynPkTI5GH?=
 =?us-ascii?Q?/jLIDXoZd1wZYnlNR/wBCIFP5QjFSsyKof0A2cwEcCRgSvp2ZVSkeXf2LQfF?=
 =?us-ascii?Q?v8HldnVNoddJRljaq6paeo+JB03mOW8Ym9EJvzr9MTV/38rBJhRH+1FdbShC?=
 =?us-ascii?Q?CoCrIRvm2TMnS/wsav/VaLsM6O35u9Yc7034SEC/7C8YN7f/uCx+toiOGlKk?=
 =?us-ascii?Q?EjH7EUgSjLgpJTHnxncOR42U6FZFdLVOXW3TWRzFAr8ApnhI5dvRPcgr1Bv8?=
 =?us-ascii?Q?i7LfSpYWu/QL/zDPZEjC08bOXCfZTmV1H6Q1kxlxgXtT6CuTdtvp4F/SVk8D?=
 =?us-ascii?Q?X3KaFGEUPxWwiASQ3P8cRv1ZPTDji0kAHbUBU9mYLcW7jG7c9zaPXov5bKRA?=
 =?us-ascii?Q?0Zd38ytfvBcmnEcK2q4/NoYfa1yp+614v5gXP+3dUfeXqZIPGFJDMeRqWbAi?=
 =?us-ascii?Q?mZ0aB/lcqGwQUATEp4HXRmVz9zOFqojJM+Atgipy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0497540-7f4f-454d-0cf5-08dde85ca06b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 07:04:28.4672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kP6TADOyxUf45WanLDvu1QA2LxlzePZh4Iopx5b/7jUqLgkmG/KxdE0s3IjC0r2VO9sHor9xhRTpp1rdZvoiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_000438_420495_F15A76E9 
X-CRM114-Status: GOOD (  10.79  )
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

On Fri, Aug 29, 2025 at 11:43:41AM +0100, Sudeep Holla wrote:
>On Wed, Aug 27, 2025 at 12:59:13PM +0800, Peng Fan wrote:
>> System Manager Firmware supports getting board information, add
>> documentation for this API
>
>s/API/MISC_BOARD_INFO command/
>

Fix in V4.

>> 
>> +protocol_id: 0x84
>> +
>> ++--------------------+---------------------------------------------------------+
>> +|Return values                                                                 |
>> ++--------------------+---------------------------------------------------------+
>> +|Name                |Description                                              |
>> ++--------------------+---------------------------------------------------------+
>> +|int32 status        |SUCCESS: config name return                              |
>> +|                    |NOT_SUPPORTED: name not available                        |
>> ++--------------------+---------------------------------------------------------+
>> +|uint32 attributes   |Board specific attributes reserved for future expansion  |
>> +|                    |without breaking backwards compatibility                 |
>
>Is 0 the expected value in this version of the spec as it is just reserved ?
>Please state the same explicitly here.

Yes. The SM firmware set it 0 by default.

I will add "The firmware set the value to 0 for now".

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep

