Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC17CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ymbqo3sQf65nxypSQJAoEHnEh6imn6MCosTpIapEuzc=; b=is+yJQdTbMgrRJJCmOw7qi/lAc
	bCH4CH9KtOdlIgLWDwYMPpV+rc6ct44LNRIxWQHEXZjmpL6ZzcBciRx5D0sj4rvHVj5+22wuP9q9X
	5QCTY27wshmJraSrGtvcxwMQUqSm3vuxe8J1Ty1BZp1Wgbmq6RvnFhgtxGf6YjlYbZPTbJ7jhBTek
	mfysmLQ17eHBhGm2QyZ9wtJF3YmRvp2o6yJ0AuwEZ7cdDXCQ0nkQKP2DnU4aSS8Iv59zYigMTjQT3
	d9RHhec3nbudycqq1Jhs30YA/lMNk4T7zLJq6BLwOJg27pQYB5/wpDMCnE1P3Z3vV/b+QrsprJalR
	uy0hczqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxT7-00000005lze-0eCl;
	Tue, 09 Jun 2026 14:30:17 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxSz-00000005lr2-3ysy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJt4ev3/ne+ZvulXb9V2zlHDovXqOL6zEGM8AnwETrcQx+kXNT0h29kXaFaLgCnCkq+kU3zI40mByO0J1uXmUqkXrHwYgA9RNV4fXPJ4nNCu6//QmfPbUDa0NdG3ZM1oFNCyMoGPI/OeTc6odjNxivq4WahQldhscAFYXF5OvEBa9Z+iHjTVAIb7pQalKWRnAcPHIGnA1XMwz+n9Euwglc1VgyY/xgms2hzH81UfcuQiyM6EBDRDvf99lfPekU/ggYEAmBtyV91mJGiKPeYfsBCPar8Vqcb/f/EYmo6h+Vb85ejKkY6RetNJIgJ2exZcJw8XtsEcG7pYHK4sZGEo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ymbqo3sQf65nxypSQJAoEHnEh6imn6MCosTpIapEuzc=;
 b=f9KkTlacfBMuAEr2+jRatYZipPRd5Z+9qd0HXTK2SBX4bRQrYjU32/JShfCj39Xj11c/jscQ4V0Jz+Qf8MoB10iJeEthctoEUdn4+sgwN5A1hNn/k3ugontZ27gNsud9VgcDQkPMtEKe9mJvcbyhMB2NRVWK9OGyD4r6tEGyAy3mwAG3NtYotA1OXHveSMlAFaT060nu0Jr9VXOyyz7Z0P0ZUnStC1h14gX4QMSui43vst9iMQf8zMDBLitY2fHUOf5fBDAiD0wHy19jAgP2gqAfiM7G3awmOToLU1OS1qv1lu6RHDveF1N9FqZx6J1gnzoHOY2BtrH4Hb4uveDnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ymbqo3sQf65nxypSQJAoEHnEh6imn6MCosTpIapEuzc=;
 b=potbl3PcXah4KSpTvJ2144EuTnOfZWnkitANAJRYzfKKSR43RZyX7dsC7ay/s/cMgmA110FdAZjOt8Marw+2C9hrwiuNQDpC/zN7FiwDDTNoDFynYyttPpUPihWs4uYcOtyw4HBoKqiKYsuXWqeEITMgwRes6KcZwn65wmNUFhihh2bjO2GnN0wMTYrmCEWHBPNWFwJegW6KSKBt0W9fAlPXaQ3qMT0wqmm8uKDBRhTNbzNJSwm2lDoeY5QjK0B//MpjTCl9ydj5R62996gVzXencKwhS5QfVPD2k54+yIN6uzOgxW1NGRLHoMLhL40pPVZCFjTtql3tlW+2CAIa9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by DU4PR04MB10911.eurprd04.prod.outlook.com (2603:10a6:10:58c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:30:03 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:30:03 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Andra-Teodora Ilie <andra.ilie@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v5 4/8] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
Date: Tue,  9 Jun 2026 16:29:50 +0200
Message-ID: <20260609142954.1807421-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|DU4PR04MB10911:EE_
X-MS-Office365-Filtering-Correlation-Id: cde6ffef-9f4b-484c-c6be-08dec6339822
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2l+g4asPG+rq7ccIc6HosnPUETzCvLVSYDxELk45JdDkw1ekdmE31ucIX/kc9IPMP2dp51vmyZ/vvTOG7jq5Zk/t4bMcCAaIoJJkr1cibHydhnPL1UNB0sDSTvPg5+TnxbQs7cjugYU5jNtJz68qxQlM1mYr/t+DbqNwMQ1ADL8wDdA/G7KFWiQpQVT/r8rrjSUWCVNt5XvZTKJKobCMdVVjnYIedN9qfFlaP8CTr5T91ta+xYxY5BxBxtESXOPgJlBZqpOhSxhy8o6G5Z63slJ65b9W78LHN8LdFogS22Wm0bEVS37tsfNP06s+XGgTMkAJh2BIcUleurlVRVclqO2i+sYblFax1YW8jDEuLZQHMayOKavM53EzXJphCRLqPq8A3f4YgNs819rZofYLJ2/2Y76byGAwuznPh7n3uJbd49Zko6+RgpLA1arNxBtQDElxNHzMdnXANeyOSb+qsYpDMukS4dfVBp4SbRgfkEyPbPBRK+rcWPBnwnNRf2LW/hJox/S4y82pzPOOk4aypAmc15xxKJQ0NVRT4ws5nYibu64NUiOxSIQdbJHPv6LuQi1KtOpRBaGPotvq/rE+79hVNFNSJ3uNylP06kihT4QVhpihver29y35QLXhNZcU5hZvGl15sO2yxFR0aQJOON6wSO/nQPkELa0FpFlNa3mPzfUa1lKY1zngZs+HOGvF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU1OQUxQYis2Q29uRjhzdzhuWEV5c1BhY05LMTlyVjMrVVFZUW5tZkg2eXd4?=
 =?utf-8?B?WGJRY0NUQVEyTlFFOTVpbFRqK3dCUGgwbTRadE9ON3hxa1dLb1U1WGhZSURC?=
 =?utf-8?B?MjR2RlVkYmUxTTZ5Tk84U3ZLN0pva2N4Qk90STFGUVFjK1ZKVFIvbmVmN2Fp?=
 =?utf-8?B?V0V3Y0luazRxWDNaZkdzRUlWRFZwQTBSalJOd3pTWWphZlFWM1REcGZYQjVZ?=
 =?utf-8?B?a3REa2Q3SFRRUzJBdFNuQlN6RjU0Z0czRTAwaGtRU3daTzBFU3dmYUNJNnpD?=
 =?utf-8?B?Vk9hcThROVZOMGh4RXFYeXllaDBxZEZQSkFyWlFMWjZNdlozem5HejZ0aCt4?=
 =?utf-8?B?R3Rlck9sekZJcm9TWXJQeHg5S0dreXpYOHpWWWRPUTVaWG1sVXdWUXFNeVBT?=
 =?utf-8?B?dWtSYnVsdXJNNFczaHRDQ3lKUHdTVEZJd2lIY3l4UHdEVWZycjRTRHZOdEFt?=
 =?utf-8?B?eFJRR3lMYncrVldsM0xRZGVvbjRVRVkraDN0ZnNXVHdvR0M3VGRwc2s1cmZ1?=
 =?utf-8?B?eVhSQmVQVG80ZXQ3RkN6M3RuSGVuYUNXbGJTRGtvUWlEWmljc1dVRlQ4ZkRT?=
 =?utf-8?B?M3k4bnFKZWNGRUNxMUlacmtUMkE0em1iTGE4bTdwWDRvT1FMK2NqUk1Ud2hw?=
 =?utf-8?B?RXB2RE9xOXNhQ2s4b0RjNkdaR255TXRYVXFoSTNMbHVVcWJBSzlSalNCVlZJ?=
 =?utf-8?B?ZmdxbjhYWm5HazRCZ096M2syNktnaUFNN3B5czdyRTlOMHJFM1g5SS8wQUtv?=
 =?utf-8?B?dnVuU2sxOUp0OThseE1hNjd5aThzd0RaUnZST3EwaE8zSTdpaTR1cS9mT1RN?=
 =?utf-8?B?WmlIMVp2TFFaTUxtRGFoN2YwUmlQNVdGYzl4SjJ1V1FjUnZFeWlNMEdPeXo1?=
 =?utf-8?B?b1c5NXRLTzhKY2tNZURSdktGYkdINUhhNTNqMEQwYjVhaGVXWXdLSFpiRmpM?=
 =?utf-8?B?MjR2M3pINlB3T0FkbHJYUm5YZFdPaHNPQ0NsNUZnU0RFOUM5TVFqVGFDMDg2?=
 =?utf-8?B?bE9IMXhIaEVoZGtXSlVIS1ExU0JkRUFicGs5Mmh1OFZlVkgyNnVnTFBFbWV5?=
 =?utf-8?B?bXV6dXJ6Z0ZDWnNSTFYxUmhkTGwrcXFqWFQ2SFNMc3ByOEc5SkNzMTkvc3k5?=
 =?utf-8?B?bS9JTDN1UGhVczhWbzZoYVh1dEZGTmd2N2w5Vms4UGRyS2NadjBzVE9oR3JH?=
 =?utf-8?B?WTBMYUZhYS9Ra1UrOGI1NDFmTDBnVUhneCtXeXdhS3I0dVNqMXUxeGJLOGFm?=
 =?utf-8?B?NGhJZ2oyWm83QUZoMjVRYm5nM2Ficjd1RjZERVBnTW1ZSDRtbzcrM0ZtamNE?=
 =?utf-8?B?eWE2QjY2VDN0dEdzZWc5RVVBYVhIME9MSVBDZVJTTWhqRHNoQTNyUTN2RWs4?=
 =?utf-8?B?U1hoelJKeGcxamVNTUx4eFZxanBOTkdaUjFVcTV4bmx3N3dUWGczT0F0anFs?=
 =?utf-8?B?ZzF5dTc1Q0JsMVYwM3BBT2xKRkNLR3hZU0NFTi92OS8vQjFUa0lQaTBqcDFh?=
 =?utf-8?B?NTNFYW9zV2M2MmZ0SEZUS0J2bXFqVVdmblRhVWFZbFNWbS9lL2x2VnpPdHdW?=
 =?utf-8?B?dDd6QzFkUVgxcFVRemNBWnNOd3V2L2g1VWFxUWxqMDlDRVNJa2FudVc2a2FY?=
 =?utf-8?B?SHpEWk1rVHhuenVEZGZlbjNWRTBWR2dxU2JzSDRIVjlyRDFzQjB2d05uZVU3?=
 =?utf-8?B?NXdPRE9LSXBUMWZkL3ozcVlBK216UlZqUGY0dWxWRzdFcHM0WGlqcy9QTWFU?=
 =?utf-8?B?VUd4SG1DeGVhU2k3bFd6bzRabWg5RkNWZzFld3krcGRTN1JvV2JZdkF0VG11?=
 =?utf-8?B?ZUk1UCtFOFUyTEg0cmxsZlhoR2tuWll6OVpLV3g0dHVtaTVocGtoZXlzaEw0?=
 =?utf-8?B?WHF1SHBoVmhieFk5cktYbDc3T0c0VllKdWlET2ZwVDMyT3piV1VaU2xrK1Vn?=
 =?utf-8?B?VGg2WEhtTXRLdVJwaHdzMDdyajIrTWI3QStHdjZNVFJ6QXRqOFRYcFFKajFr?=
 =?utf-8?B?TjkyNzhadXhGVDdtbzVwNmV6ZmlXTnphM0tIa21PV0FOM01HZE8rOUNTU3JC?=
 =?utf-8?B?QlRvem04S3BJUEpXRHZ1cCtFVjZhQ2tUN0N2NWFnZjkyZDV4b0xLYk9GWmdp?=
 =?utf-8?B?SDBSMCtZN2ZaZXhlVGFzRnN1Q3Y2UjF1QWtwOWlWVjlIR09jS3VaUE5tSDhL?=
 =?utf-8?B?ZWIzYVFwY1NRQXlmRE9BVjNFSGNwVUJPTW92ZktTa2M1cDMrN2ptU0Q4THZy?=
 =?utf-8?B?YUx0aVpBZUFjUFFYVjc2N1Fob0hLTGNvK3FaQWZockloazk4ZHRTZjRTTGpz?=
 =?utf-8?B?RXoybEhiR0g5UlNyOGtFSVo1YVJBZWJNb3BzVjlRNFBnWXBOKzZkcTFYdWFi?=
 =?utf-8?Q?jwqeDFWqMZhGLMHA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde6ffef-9f4b-484c-c6be-08dec6339822
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:30:03.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIaaGpHcRSMNs601zt1wdMXX0nmuZ9wLaiTyQSZ/dmmS3DqRg4r7akKUnP2qnqOBCTDvn/jK1ly1jYFAXfZdEhNyUu/hVutT12AzNKTfU3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073010_026824_0AE268B5 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add NXP S32N79 SoC compatible string and interrupt properties.

On S32N79, FlexCAN IP is integrated with two interrupt lines:
one for the mailbox interrupts (0-127) and one for signaling
bus errors and device state changes.

Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 .../bindings/net/can/fsl,flexcan.yaml         | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
index f81d56f7c12a..d098a44c2b9c 100644
--- a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
+++ b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
@@ -26,6 +26,7 @@ properties:
           - fsl,ls1021ar2-flexcan
           - fsl,lx2160ar1-flexcan
           - nxp,s32g2-flexcan
+          - nxp,s32n79-flexcan
       - items:
           - enum:
               - fsl,imx53-flexcan
@@ -173,11 +174,38 @@ allOf:
             - const: mb-1
       required:
         - interrupt-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,s32n79-flexcan
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Message Buffer interrupt for mailboxes 0-127
+            - description: Bus Error and Device state change interrupt
+        interrupt-names:
+          items:
+            - const: mb-0
+            - const: berr
+      required:
+        - interrupt-names
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - nxp,s32g2-flexcan
+                - nxp,s32n79-flexcan
+    then:
       properties:
         interrupts:
           maxItems: 1
         interrupt-names: false
+
   - if:
       required:
         - xceiver-supply
-- 
2.43.0


