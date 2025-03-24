Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB0C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUZAS/OfLOTbrx56dHbF4PXeFBORinz0mbR2pIs8QYk=; b=C6yItfgTO64ma91YphQp+KZaR5
	pR5cXzy6D6kJv9QkqE3WVY9jTSweROMMcnsvil5ODTTpBR1XoLmZKcjTaJcfYKmyWC0cFhlCkewiH
	+t1BwPRdLzUEGscQ5ep40VlSBH7r/7qbhXkR9DueqCoNYTxGSRgVRTKekrp1HufBWFqSRdnw8zrfk
	kc7CVMINUfgYe5oCJsBEJoJdPwdrsNUZ4UTQ3ZWiDy3tzPe6H5K0b/z/YSrme+rOkoZc9nL6dNZhJ
	EjeoKuuFcP8w9fqFSC032zXSYpZv9JJJXOZx1qci7g+58RNNleTJ0bEminYNdya3STKXCyb4Ebwgg
	atNqiEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbiD-00000002NSj-0ux9;
	Mon, 24 Mar 2025 06:55:05 +0000
Received: from mail-dbaeur03on20604.outbound.protection.outlook.com ([2a01:111:f403:260d::604] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbc7-00000002MeY-1Yzr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlInP5ycrKAxmivrhthWle13EtqhdDqOcSmG8cSFxfqa5ffmzEBLYvVRn9+Vc1bBenzP/r/HubcoCmcRb/0sutDu7pvjX5VlW3yvX/ozrjCHZwCwxdWrCELjcQcwBSCVAcAv9XgTKWkhrnSsDGWxlq55CtIlk1PufxSY/h5pBNcoMDMNXAB2vjz8PiUhfRSP491Dg7pV+HlJVPhhwDkTz7NLjRuXEWiZEdH2Np3NkqGUoFYpQzf6GkCvmUz0NGeOpApp/15yMwrrJXX+SWGf0beXVaMKAyOcu1ZKt0l9AcJAzwvu0HolZXTUC1DLKm1TK6lrdq7oYWJ834qFU/kXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUZAS/OfLOTbrx56dHbF4PXeFBORinz0mbR2pIs8QYk=;
 b=OK95gDo3cCD6IMDlsTabzm4zTE0HFM6MNOMWqghKnBNkDNCqZAZ4ebpxZ2axcO6UDA2NQe0LNVnmcoalpz41S//47sWOWZwtN7eJHazjYowR8uLikMipJzCx2R75ZyAAWQg62cyh4ZvFv16Z+wk0NlwqOxYX8Xeeg/7SQ6EWjHNDUZW3xrV/Xb9Uq+Me7927l8ICBu2ULLwmlv4ngNje3IpOhg+Jvy0andRVUWGLwkNeuUlD2Cq0DBfFe25fSha3vtHTBYjG+OKbDjSjtx7oH6yDiojmnnU8D6Vy9DuXFiyUfZi3TerFFrE+zQzjF0cSpHk9sc0yDq4DVOPRiPr/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUZAS/OfLOTbrx56dHbF4PXeFBORinz0mbR2pIs8QYk=;
 b=g8qFyTO2RPn5myGn5MOfHzOLuHyM5IPcBgBXNa11I6hvVvBPNQ6KfpHDWAgVHplWjxLq6BKRELxPqfIKBFciqF5jcQvbWfTXBMSylhepVxRJcVlVMMwfgy9yzLcGD7xD45JZ6MipjYqWnfSZeBNLmtF6OY8NczNfV6IydO0ea4L51F9cl19jpW5QhWceK6TTZYxJRAZH2D5/kPDmmtpN+xSjmJItk9jlQi95PCIlrG0BGktPwdhO9q37jykK9b89TprOFQ/A2mi05AlnJxd2GKJhhmCyjwDTY24xhIC8WK3QRzl55dR/fqWkae6KJ6VbBpG6vZcmEtfrhfqRCvWQ7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:48:44 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 06:48:43 +0000
Message-ID: <7139ce39-c089-5932-4d99-93e9dcc7d321@oss.nxp.com>
Date: Mon, 24 Mar 2025 08:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: s32 architecture upstream tree
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, chester62515@gmail.com,
 Matthias Brugger <mbrugger@suse.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
References: <2f686d68-4852-4aff-a551-51e8515de6e7@linaro.org>
 <fa9d57de-9eb3-d317-3d39-3940248ca17a@oss.nxp.com>
 <c16c69eb-a5c6-4b3e-a849-3b1719d26dc7@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <c16c69eb-a5c6-4b3e-a849-3b1719d26dc7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::7) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c97dab-b166-4c92-4d8c-08dd6a9feb5a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFVBQUhtTXQwNm5ORXNnSmNJVmVUVXVHTGErbkU4bmQxaTNOay83R3g1Njlk?=
 =?utf-8?B?bUtiU2lLMkQ3QTFaZVF4cUlQVHdhY2ZDdUZXdjBWdHlGSWswRTlLZUhTQ2tk?=
 =?utf-8?B?NWlzQ0NiYndQc0VOL3pwajUydkJ5Y0FzSGpLeUxqZnJpYXg1MFRWL2NJVE9M?=
 =?utf-8?B?N2V1cHRvWmErT0RYYnBIOTNZekYvbHFzdktEeitldnQ2bjUvNXVpOGdVWERT?=
 =?utf-8?B?dmVCVnRaT0dNZmJ3dHZYVjRGRU1SNnJmWEF1clMyK1g1clJHeDZHcXJTdjdq?=
 =?utf-8?B?WUVkRDZGb2NIQWtOTmxTKzk2d1JUWW5DN1FZbnhTdndvOHBHS3UyWUJsSzhL?=
 =?utf-8?B?bWxzSTRXMElwcVRZaC95SFBBa1U2b0ZZcjVwUFduajcvRUdid2poT0MrM3hR?=
 =?utf-8?B?OHd1V3pERndWeU9JUWZ4ZmNBYmxzNkxhdHB4QVBlMFJIdU82eTJ1dUxQSExF?=
 =?utf-8?B?TkNmUzkwNDJ6b2xRL3pibXI0MmxlUW4xdmN5dUdncVd3bXV4OVVJVGNPVXNO?=
 =?utf-8?B?SjRsZnF1angwQ1ZEUTdzZlpqWWQ2YXdOUjZ6bC9TbThxN3NPZTZYSXU5Ynow?=
 =?utf-8?B?dXFyNjhhcjdLRU94MFpyQXlxRTRXVDJXVUZLMzJUd000VVo0cG5wMmNqK3RJ?=
 =?utf-8?B?N283bDQ4L2tXOHFackFQU0FSOGJLcXZnbjhEbkxpRkd4c042RXVwMXJNOFlt?=
 =?utf-8?B?Q0MvdGtEaUl5cDZjMW0rZWoyTmsyY3VCaldCM1hMQzNWVkpZUTI2MytPcG5F?=
 =?utf-8?B?NjkyQWtuREpTMEVHclc2Ky9CaU5WYWkwWmdDeUMvQ2JFUFlXUjlJVDJPQTFy?=
 =?utf-8?B?NmJ2bDBHajZ1THFyS2dEazNLU2FBRSsyTTlsdm42YXpaTklVcFMzVzExTTlI?=
 =?utf-8?B?WHpPVlJzUm9PTnl6WWVVNHd5TTBubXZGZHZoTmJ3eURubzk4a2plTkVLRGVD?=
 =?utf-8?B?ZG5lVEM5MzhuNm9CbGlmUjdYYmFRRTR6SURnL1p4QXQ4dERUVGVZQ1YrTmJE?=
 =?utf-8?B?MXJZazJ6VnJMcUo1Tmplb0VNNS9ZYzVsRDlVclBKaHdxeWtOM25aeWIxTEtO?=
 =?utf-8?B?ejJ2ZkFWTFpVR0VySFhDZEE2VXpUM1dWQ3k2MFdQYkE1Yi82dzV4RlpranNR?=
 =?utf-8?B?V01uYm55SnZ3VmJrbUQwTU1UcDBnM250c3lvZSt2bE1Dc25KQTZubkVhOTl4?=
 =?utf-8?B?Um1RblhCMU1uWjFNM1dUVkxPUVEyZU1ZbVlVbGNRUzNlVnFXUVhTbkdrem1Q?=
 =?utf-8?B?S2FrN01WUVN1Z3pCc0cwVUdyUk5sTzFobko4aGxVZG9ScnI5NHdUZUNXejZv?=
 =?utf-8?B?c0JnMzljNWtncGgrajBPRXFGOGxjaEQvNjBtMlFzRDJXYURPTXM2cjJyU21B?=
 =?utf-8?B?OXNzZDYxZGZlSFc4MXpDYkZ5YlM2TGY4d3RRR3BwTzVzUklONzZ1c3RoWWFk?=
 =?utf-8?B?S3BhWWxDbzJ4VENnUmNLcVBJMmVzV2J3cU1MVWNYcnU4WnI3WHd1VmY5ekwz?=
 =?utf-8?B?L2dzV3lBUDljdTJwSE00bldjZ2E0TDhnK2JjSVJxQVRRQ0dQblJjdVZ3ZHln?=
 =?utf-8?B?SXR0cVhnWU9YOUVSVTlSVVZtdU5PUUoza3lWOFdVTU9UdTE2WUluR3dKcnVa?=
 =?utf-8?B?QXA0azB2QjlQaDlaTzMyZDBESVFjOTFNV2ZiRS81U0hKR3JYbUFJVVI3SThR?=
 =?utf-8?B?L1liVXo4M09sN1dPV3dFZVZmN1VDR1JxY2U3a2NKNndlTGxmdWZaL1o1bEdx?=
 =?utf-8?B?MkRYMDIrYTc0ZUNBdmYwMUJYYVdycmVSa3AxSDBsMC9DTGVtb09SaDQ5L3Yr?=
 =?utf-8?B?S1B6M21vSzJVVGxUSndBU09La2NhKzVmU25IMnBldndnL3htMGxQNTFnS0F6?=
 =?utf-8?Q?+yfmTM5EXyBGU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEs1bHd4RVNHRWZNWGM0a2wxVG9zRHViVWVZUlBlRndrOHV1OEJvc2FUL1ZX?=
 =?utf-8?B?SmVWYkN2a2lxaHhqMmVZdFc0dFpaQWZqVTcxTHJwN0p4K01CNThiT3JPWDRE?=
 =?utf-8?B?ZWZ4MSs3YndDVUc3WTlXY213YTJ6dHF4aGtUYXljS1dkYVg1SzhjQlYwR01C?=
 =?utf-8?B?NDMybkhJUDhiYndZUjhmR3FnMUoydzVSc05YMCtBN0dtNjQ5a0NnYTlSRHBM?=
 =?utf-8?B?NHlDcnJ5aXZOSWQxektuWXhWdEhEakRWc2F3N2cxY2RnRVBBeTEvS0JlZGQw?=
 =?utf-8?B?YVk3cGJhdG14VFNoVEJRdkQxbEVZNW02dTlhTTgxcjhrdzhnOENuZURyMlho?=
 =?utf-8?B?S0dGUWQ3V2lTUWtTOUM2d0wweXUrakpWRWQrVk50ck5aUXRmL1o5Ull3cHNJ?=
 =?utf-8?B?RlhaSGVQNWRWcGpzcHl1Q3NGb2xhTXJGLy9hSVBNNkhXcmVabENKeTZCMVFB?=
 =?utf-8?B?TjUvWHJFdkZBRk9LaUs1OHlHVnhJY2JGSmlIbXBqdDluWDM1enNHM2lPUE5r?=
 =?utf-8?B?czN6dTQvMTUyaGJpaWNvZ3F6SXJmRDE4R1RSR1VtOWFlK0dRcTRrRVBOL3Jr?=
 =?utf-8?B?SUY3U2Vhelk4LzNSMC8xd1lCaFJKWGR4cVp6ZWx2NGNGcG1hSnBBa25YbnJk?=
 =?utf-8?B?TEQ2N0F5Qm94NWpRODNZNmx4citNbjlPd2QxaUU1MVpoK25FSzlBOW1JZHNX?=
 =?utf-8?B?anpTNGh2aEpQQjQ0RjJiYkJwNGdPOUZrek96bVRBY2xDc1hDRGRkaXJnaUtL?=
 =?utf-8?B?dmdBTkVZbVJBYklDbStadXQxWWkzYzFzN3dYN0FFaW8xd2lZdmg1eVRQNFpE?=
 =?utf-8?B?QUxFK1BlUlNyYkczM1RFZWp0cTlZb2szTmxZUVRmaWVkTExTUytzbzFNWktG?=
 =?utf-8?B?Q0FmOE1udmdHRFpiVUtDQnpKRHNYcWNMT1QybGs1di84ZTA2ZEFSL3MwWlV6?=
 =?utf-8?B?cGhjRUtpWksydlRXMDhqL0NSbUlwalhuQVRPYW83ZEd0bnJVUEJvS3ZmTW1z?=
 =?utf-8?B?RVI3Y3VUL1dyV3d4N0FOelRYNTdmV1NEUXFkeFVJRUM2dE9yamtIelhUamlv?=
 =?utf-8?B?WjZTTCsxTjR4U0ZpN2N1R3JTYU1aR2d3TE4xTENndVBRa3YxaXg1V0J3UkFy?=
 =?utf-8?B?aElWTnlLV1JIaEFrRG56UGcrQTA1dUtwUFltaFNMeVgyUk5PK2xGNGppV1V0?=
 =?utf-8?B?VDhXUy9KTmVCakpFTW1NMG4rdDUrNkl4bTM3UGM5emp4M2xYbGN2SXpsNzll?=
 =?utf-8?B?TStiU1dQeDZuTkxGQ1VhdUdLSFJKa2s3dklMS05NL3dzNGpDSHd3Rm1SM0JN?=
 =?utf-8?B?bHIzZmtVRGtPVjZ5dFNJNWp2V1pWN25sMGxyNzBwdzRRaDg4NTNoU1pYOFZZ?=
 =?utf-8?B?SW1raTM3Z0Jjb3huQTFQcjlEQkdKT3UzelZqZW13RnI1ZU1GTkpoQlZIL3Ju?=
 =?utf-8?B?MHFkTzlNc1gxRGNJU2tQUThBUXJaQlc0bmUvL2RURjJXY29VK2g1c09JS2Zk?=
 =?utf-8?B?YmpJY0I5K000cWJ6dTRpQ0hCTnRSK0IzNjBIanlLWmljWXgvVllzVHBQM25u?=
 =?utf-8?B?cXcyV01IYlNhSDBoakN5U0ZqUnp5bHVCaGpXRTkycStmSnhZaWp6MWdzWnZU?=
 =?utf-8?B?V1cyV3JUNHRMaVBMdkR1QTVvY0dUREtHL0FiMVNON3RoSVRycHlGWkh4RS9E?=
 =?utf-8?B?M2JWVnN0ZytWYUdLZzdBcTFsREV3WEpGM0h5Mm1aQ2gwTm9qS2ZuM2lVZHds?=
 =?utf-8?B?Y2ZSdjFhN1gxcUtJR2pnTmVENDdkL3NsWFM3KzdhWER3UWZqTGk2SWdycVVr?=
 =?utf-8?B?OUx1cCs1Z1FVc3FLQ3NpN0xRelNpSExWT0lsM1YvaWZaRkhXNzRoZmxnNmds?=
 =?utf-8?B?RUFWNm9OQmZ0aXVITHdtRUU1bUxKSUIweC9nY2VENE9sbVpYMlQvdlRSa0xu?=
 =?utf-8?B?Q2FWRXk0Q1lSUks5cSs3UU9ycFFmdDc4M29TNWpJaEtzeDVZTDVsdThORTl2?=
 =?utf-8?B?VHlVeGNPNi9sTS8xSDRuMWt0OVdnWUpFa0kvUHByVk9SOUZUWU93bjZPUkk3?=
 =?utf-8?B?YmFvWlpXVUVQVGdOOUlQMUFTRENBS3kvTkRVclk5MEkxbU11NUFsMlJ0bW01?=
 =?utf-8?B?WHZnY2JMdzdEWURpZ3JmVXM3aWxNT1BGdlZiYzZHTXBoM2V6dUVtMTdqUldE?=
 =?utf-8?Q?iMX7JXJhk0JZpASQgJbURmo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c97dab-b166-4c92-4d8c-08dd6a9feb5a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:48:43.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfwmlugOBa4Iinok4VVHNU90zleSvXIkddDzJERvMrgxYVz+WMuYoOkMcDo76Sx6oHWskT7tw/D47Z9fLTqdq12Lb0b/dUIxihPyyrmT0AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_234847_415537_9CD00284 
X-CRM114-Status: GOOD (  13.48  )
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

On 3/24/2025 8:43 AM, Daniel Lezcano wrote:
> On 24/03/2025 07:27, Ghennadi Procopciuc wrote:
>> On 3/22/2025 1:39 PM, Daniel Lezcano wrote:
>>>
>>> Hi,
>>>
>>> the MAINTAINER file does not give the information about the location of
>>> the repository for the s32.
>>>
>>> Where is the repo to base the work on ? Especially the device tree
>>>
>>> Thanks in advance
>>>
>>>    -- Daniel
>>>
>>>
>>
>> Hi Daniel,
>>
>> Shawn Guo's tree should be used for the device tree patches. Please
>> refer to the 'ARM/FREESCALE IMX / MXC ARM ARCHITECTURE' entry in the
>> MAINTAINERS file.
> 
> Thanks for the pointer.
> 
> I don't see the SCMI clock bindings. Who is taking care of that ?
> 
> 

Hi,

If you're referring to a header in 'include/dt-bindings', it does not
exist. The feedback was to use raw numbers [0], making the header
unnecessary.

[0]
https://lore.kernel.org/linux-arm-kernel/20240121-statutory-endurance-6d03d7e734c9@spud/

-- 
Regards,
Ghennadi


