Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5463EF5862
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUDBGfO5nVZBE5Ampm4vyh1pq/Qu7UOf3g1j8cIugcM=; b=t6K/04xK87wdM4A2BF5rNINBlG
	YgWRIfa7/2msIqOalQRUnkQ6YE/MKEpRzI3Fg1oudbeb0QHqxOQkxfk6GDePgy2MTIy8kp4lva/4+
	MJMCfNYf9m3FQ96kyCnF+nxOraCYN4aG9RV7tIaNyhRFm6pv1nCMxHaJZWqBtuOYhNObmbVSJBrx6
	TxBniatHsOvCRdbhHXD0A3ftq0LWBvAob2Cd4D0bFqOGYA9/YVdocpDQOIoSY2+hbkAgSCMYAf9iT
	ivjOLR7YH3m32PWKAvZnUkBJ1ogpBRarR6gjwYmw1uwm3fSpbwjpElGF8WrxwwB3eJN8pTqCnphC4
	v8bUxChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvgI-00000002QkW-02UL;
	Tue, 24 Feb 2026 16:54:42 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvgF-00000002QkC-3XQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 16:54:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQNl4xgWfuIbPKWGBb82/sQTxWJhsuzOyqGQKlVyKPgLP2Fc5u2Wn6IU6gm2Z17TXgZbgpFU0v5IH0giHV5ZhMe5mRVTbxTzngD8w2+D1R3Lbm6r1ISYpy8Bnv+QEJeoxhyVICvxWs834Ehx9P33C28bIf9gphTbZ5fWuCDlWeR2Hp8PxjsS3Gr4Hn7DYwusEOVND3XOy4d7PU6aJqDgGrlkkbqXLPgK7oWHWjkSWm9f4LRX1+Ei+KAp/mUeeu877XhdmzxfelJD11NQYc6rROeMej6Gwhvk8QdjR+SLVKQEnXO0AkbumLA+7dSyw7tCqoCcYBazY9P5t+JeqSOCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUDBGfO5nVZBE5Ampm4vyh1pq/Qu7UOf3g1j8cIugcM=;
 b=s75gCnIjP6enaa0DxBGn1Vksxr8u9lFCsGGP6fQN0/UTHBzEOchUecTkZfY9+HUJx7ozNS0GOeJCZZwqXpklG/eZO36TBa1QyQZaiVShXTKSXrWvabpcXhrNmpzWrNBzmxmPLe6zuvntLKZTzJsSc3zNq4GKD3vd/gxT8RDdV2NLpUyky6V8f4vS9lVxUAAlxWzCUNS/64+OHk7TWzBAZGVaZDDK1YqQsvdcQVrG0oicZ+tkENnwuifrn+ixRXv5JAiAnLKRWEpw59inIqsAX2E65sziHwEUeR+TU2kZbX9pTuZDi0t/QoUriKTtybN5NE87DCL0M5XEIH9ZHrtv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUDBGfO5nVZBE5Ampm4vyh1pq/Qu7UOf3g1j8cIugcM=;
 b=dcoGPEo0mwfKj6UFjl5NpBBZdqqt61fzJF93f8gSgALMgKw+wVcAx/HUvPCZk9LUs2/pzQickjpEPTjMKdi33SeeBJ7nVtvzGpwGDK/hLs/5JeNfrmG2jKHCIx3DaXfACD8kOGQG2C8IBIxZldPDk7zXVc+MtEYCve6tfi9y5S0VjLEYJOxvypTNV/6ENObi/7yBx/dEEHdRfeik00ejNUUNcR3tploRDMA6q+uYzOaZASDL4JM583ElZzVv+XMrZ4fKGrWDvx/baobqn+1lR6PhQHH3qAV0wMyXtPci4FxQkIXgCejJiw2rNYbNC7W5RcyFe2q4o9+ZkhDPDEvlLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV1PR04MB10155.eurprd04.prod.outlook.com (2603:10a6:150:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:54:29 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:54:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-14x14-evk: enable lpuart5 for Bluetooth
Date: Tue, 24 Feb 2026 11:53:48 -0500
Message-ID: <177195200550.2906681.3810964499805873366.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120025205.1485551-1-sherry.sun@nxp.com>
References: <20260120025205.1485551-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV1PR04MB10155:EE_
X-MS-Office365-Filtering-Correlation-Id: cce8834d-6c44-4854-7440-08de73c55719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3JHNWhadXNtb0pJR3c2bXpDREpBQzI0bS9UYVlUV0ZlYmxMa3Y5Q1RUenBw?=
 =?utf-8?B?RW4rNXFuSVBRSXU5WXAxNXBxdFMzaVpwNGVZeGlLRnU2Uk5aWDlaRjdGU1U1?=
 =?utf-8?B?ZEtzQklMQ0picW9CUzlIUVFFUjVlNGI1OGV6cEVMR0hBWVdhT05VcDhqWU81?=
 =?utf-8?B?a05KcGlDK0FoYVlGUys5RTV6WHZxcUo2S295S3NTUjdsZWErUHFTVmhCanZF?=
 =?utf-8?B?SEExeUdYQzhPZEJGUkUzNmpMNzltcWppUVhLR1lTT3h4clBYeUF3b3pqc1Jz?=
 =?utf-8?B?c2hLaXVzY2hTdHZCcGpabDRCaUU4N3RJeEVGYWIrd293THdwdGRCNkV5NXp5?=
 =?utf-8?B?VlVialVzV3Y4a1l0MUMzMG9IWXNiektqY2NiVFphQTk3UGczdUQ2Y01OWExD?=
 =?utf-8?B?Y3ZzbXNBYzBuYU1jL3pCNm9rT0hDQ045c3BWRUc5ZUk0UWJUT1YvNmROWjB3?=
 =?utf-8?B?ZUVCeU51OWRWQk5WZUhDaG15Rm1Ea1BPQWQrN1llQlBMSVlvVzhseVQ1TnRH?=
 =?utf-8?B?SXVkQzFIbkxMdVZjSmZMTEppY3pvUlVSVmVQaThUNE1ZRDZDb25odWJtL000?=
 =?utf-8?B?aFQrYXJuSWhwRjNlTE9zWlE0SjZGckxNR3d1N2dTWlJlM0xRMC9MY1huZHdR?=
 =?utf-8?B?YnZLVUQ1a2tBZ0lWZmJWMkhsKzdhKzd1bklTZytPUld0bGs5N1VsZnp5UzJu?=
 =?utf-8?B?clR4VUlmcnpmWkNQV1U4ekswc0V1UmlDb2hlL2NybDg5YVYrUUxPSXBIZURB?=
 =?utf-8?B?azlxMldPYVh2eWhlb0NTc3VidWRwTFNpUFA2eVpITy80SkJsTUd1Rm9tMGFZ?=
 =?utf-8?B?aXJKT0UxMnpPMktZYityaVIxVmE2bDJIL3VCdFhLQ0FCeHJVb3lYVUNSWFdl?=
 =?utf-8?B?Y1ZpRXFxcHZrc3d3NVRCZVN1TWhtMWhIbjVLa0gvajJBa0FjU0d3YTVNTVhH?=
 =?utf-8?B?elVmaHJvTHcwcWZmb1VaQ2ZjVnhGR0V4bnAwbXNycStVTnB3NTNlQ2NLa3pm?=
 =?utf-8?B?MkRTK0x1WXZjQ2o2QkF4VEFSVDZjbFJvaTN2QWpicllEZUFQSTVmdTdIbnVa?=
 =?utf-8?B?STBwQ2NTMVJOdlJTdkRwNER5eE1UamRKSlkwQkQvelpTUnVBdnZjcTR0d2F4?=
 =?utf-8?B?K2hyTE1PYkNOL0J5UTJ3RGlRMnJOUmlQeXd0ZlFKZUJqaGxHZjRTNzNQeHo0?=
 =?utf-8?B?TkRwNVNJMDhEQ0c2emQxUlhwaXJrV3lEeVFGbHZnYmIyV09oc2EwcXJIZkJp?=
 =?utf-8?B?ZVBYZnRwYTREbjRtU1E4cVlubk1jYmpDNjR4M210bDR2YVozZUJPQ0RmTUw3?=
 =?utf-8?B?YllXOVdlUlZjUkZwVE9OVkZQU2RRcXZCY1Y3WVlZY0M3N1diSmFWbEV4VW1N?=
 =?utf-8?B?SHpwYWhhamRxSHR5UEcvdFZjUkZYMXBYWGNoTk1CSUxZclZQZGU5Vy9nK3I4?=
 =?utf-8?B?WUFSRGRhOXNnekljbCtBb2NPQkVYNmRId1Q4TmM0YVkyS0ZsMkVrL244azgv?=
 =?utf-8?B?aksySGprSmQvMmFSeThiMGxESHFxcFNCeXhkWEliSHJ2VXk1bkNUUUdXWHkr?=
 =?utf-8?B?RnlDYmlzbWlDT1Zabm02UmFCZnRGNWhSNXpwNjBCTHVYUkQzNFJZK3VoNEhw?=
 =?utf-8?B?amVnTzhwS3Nva1lLck5ZUHdyVWNxQjNheHl1aGR3VE9pRStQSkEzenJsd0dZ?=
 =?utf-8?B?b2cza0NFWVFSTDJ4V0Z2RGpUOE9tcmRaejdrN003ZG05V3YwRjYwbUU0bWU1?=
 =?utf-8?B?a0ljOXhFNFlBUkxKZE9FV2R2Zkd2dTdIandHV0hEeHg3MEVXeStaaGZBNEVL?=
 =?utf-8?B?NytzYkc5VTB1NkxqbWkxb2dKKzBhdnZuNWZsU1JFbXZnTlhlV3ZPVlVZa1Jl?=
 =?utf-8?B?Unk0bnU3K1JTRXJZL0REdkU4dHFKTmE3ME9zaHhIUjlGSTl4VlNsSGZ2SHZp?=
 =?utf-8?B?OWJNN2VwbUowV2RDWmgyQThJeXQvRHk4SlQwTjloMHdPZ3FtSlc1dUlQczZH?=
 =?utf-8?B?aGdXQzJDMVlGalQzY0lBZ1RZcmovdGljVjNUdUY0citIS0o4a29DaHVXRXBU?=
 =?utf-8?B?V3lQQnVOMmVzT2pnbDZMaVczcndoU0NTaXQvcnNxL044ZWo0R2R1Nmh0ekZJ?=
 =?utf-8?B?Q0xVS1J1ZTc0N2ZXTkZoUzFybnpKS3pKcmx4VTFQMlQzVjN0ZTdWQzQvV0pw?=
 =?utf-8?Q?pckWCg/VXrM2pIxS16tt+ec=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MndGRVhWbFdmTUpoVmFOVnhFQ3hsNlgrRFhYVEQ0YlROcTdCZUl0ZnNFT1lF?=
 =?utf-8?B?Sm12cHNINndDeUNEV2hmR2VURC9NVFFBU0NweVdQeksrVHd2eUtROUM3QzFp?=
 =?utf-8?B?VjJYMlBCdDhOLzhUR2ZScDlXOEtaS0lZc083Zm10b1ZuQm5lbVJJYjVUeUtq?=
 =?utf-8?B?SWptblc1NDlvVU9haE1uWWR4bm1HU3BMUWZScmgyQnRHdktZakNQNlZIeFdM?=
 =?utf-8?B?VW1WVVl2V09HTnloY1diVUEwUEg0VEwrcnFCUXpFeC9xSm0zc2RwMWpGTEw2?=
 =?utf-8?B?TkpCV3J4dmVsS0tzSlJCbmtmMmRFeEZJbE5pRW1OU09OQm5UZC82U2Z1OXRa?=
 =?utf-8?B?cGRNN0t2TUQrOUcrbyt1SDV3TjFhaFlacVFNdVUzckd2K09FelVuZWpFV254?=
 =?utf-8?B?TnNJVm03THhWbFdUOExGK0V2RWF1bTRxOEV1VndDdEdIbFR2eUVoU3RqSk9I?=
 =?utf-8?B?b0hxcFBSSGV1bzNGS1gyOWxzZUlCRThVZTJPa1hFbzM0L01DNm1qaGx5SVh3?=
 =?utf-8?B?Mzh3cER0NnYxc2pXaWM5ME01NUdlVmlFME9iMzk2TnB6MUdDNFZhaHQ5K3Ew?=
 =?utf-8?B?alhKb3EyTGFzNDV2S2luVlF2NkJ6ZTNwQ3VoM2JGN1BhajhaOWZ0ZUJZNkFD?=
 =?utf-8?B?N2UxWitIYlFrOUhKSGhkcEE1Q3hUNkplb1hTbUtkQTA5KytXRnArb3A3SkFC?=
 =?utf-8?B?MUthcnh2Z0pzNjloRzAxWUxkZ0V2dllQbExEckhEVTNQZ2JsZTdWby9jTFhC?=
 =?utf-8?B?MVRxeDNKQ2I3OTV1MWc5bnJ0ZU1LUlBzK0lSTk0vYkhkYXlpYVdsNVdMUkxC?=
 =?utf-8?B?REJoZXNjYVYrLzhxU0VqdEhKV29lUk5Zb2lqeCs5bU0vcEdvZVdJWGFGUDNt?=
 =?utf-8?B?dUVsaUF3MjE2Zk5LazlCQ2xLalRXWDVkSzJNVHNaVmgwenAvNzJrZFR1RTRC?=
 =?utf-8?B?NjMzMC91eGdNSFMyb0JDSEYrZk5KeFBEY1ZpS0Via2FBSmtoSXQ1L3QxdW1J?=
 =?utf-8?B?MWVFMzBsQ3NxOGFuL3BtaHBneG1jNG1PY0dxNlJTU1pNNE5ReHpLcnVDRVZI?=
 =?utf-8?B?a3NvUVdqakVWVHlvQ1BpMGpWM0Z2cGp5cVBOVm8wUVBjdjRsa3BsRkNlZzRH?=
 =?utf-8?B?cTRGMUxueWVTSktJVENkVUNvNXRuNUtSUEtIZXZ6cWNFc2IxTW5mNzltNk9k?=
 =?utf-8?B?eWJLdkJCNUpETWowa0dOTkwwZ3hVa3ZnNU8zUUtqbWI5blFhSnFYL3Nkdlg1?=
 =?utf-8?B?S0NMK1ErQ2N6SmRNMTBpSEsvVE9MNnIraU14dFdJMTAwUGdkN0hqZzJKQUxk?=
 =?utf-8?B?UnVMMFlFUWs3WkN6OEM4aGR6MVZqa2ZXdjlBdjAvLzV1RnQrMFpWaytnaVVw?=
 =?utf-8?B?ZWhCRlI0Y1V3YnpzRnZPK3RUb1dWUWRROHd3cGJqVSt3cUFnUEZEajNFNXpP?=
 =?utf-8?B?ZzMxMk5EeGNyaVhEWHFWNmZCZ2NteXhIMlVLOEE5N01pNGtLeU5ySzh1Rzla?=
 =?utf-8?B?NGNOREhDWHRRNkZwL2RlR2hZekw0bzBvaWRGTGRwYTBPdTdKaXA1NHJvZEVZ?=
 =?utf-8?B?NENNYzlkOHcvMGhwc0xUTm02SElRMUVDZEhkakJSR1o3RStZRTFmSm1jS1ZH?=
 =?utf-8?B?S2xTeHFaMmlhMjhqWlJwZFZ2cUtPays3SGhlVWRvN0RUT2pvVkF6c2w3T1Fz?=
 =?utf-8?B?Ym9jekQ3RzA2WWZ1NE9maHlneXdTRFUrT3NCbDdqanRMNHdlcVVlakNraWts?=
 =?utf-8?B?VitpcU1iU0lPRWtjNmpUTmJkcnlZcjRNQjNSS2JDRTZjS09pTjU4MERPb1Rm?=
 =?utf-8?B?NjdLYXZGbldSZ0pVUkFsRERCSk9takF3K08zK0pkay83d05KNFVxS3pLV2d5?=
 =?utf-8?B?Nm1kM21IdUo5UEVTbFFJZVB3RmRNL3JOZ3RHMlNQKzZNUWM2UE1NTTVha1oz?=
 =?utf-8?B?Qmo0emhKRWhVZExieG02bktyb1oyUHg4SEpNL1Rxb1liaDZnRC9lb0xqdkZQ?=
 =?utf-8?B?djk4KyszZ0RyRlFqRGtTcUNkSk5DVVM5U3BNenU0VnEzUWlhdXFvSWJBZjdi?=
 =?utf-8?B?L3FmeUJyRU5JbGd0ajZrTnZZeFBuVUptRmdUdmh4SVpPTVhqRDRUbjlwMzFF?=
 =?utf-8?B?Mm1ZS1dqdGZJM3ZzNkNyTmc5T2RQMXV0WGc4VnJwaFRaUENrSVFNVElQOUZw?=
 =?utf-8?B?WnlCZkI3ekRWTFpSV1dQeFdoRUFPbGFneVdxaCtRN0ZHMGY3aERaT0ZSbktx?=
 =?utf-8?B?Zi9ub0JoRWxCVjlPMTdFTERWRmFWUDdwaVFVOUpGS3daNTNCV1dUSlFJMVRQ?=
 =?utf-8?B?UURhbEFYeWpHQ0RsVVRyRkV3K3lySmdFbzYxUDNUUVhSMEE5dGZDZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce8834d-6c44-4854-7440-08de73c55719
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:54:29.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuBaUqwy9Som1sRSsBGClR3io7wm4v6IWVtPqKxlXffLop4KpUSexgjMU2RrAQ0JlvxD1qV/MIH2m5LD+dsmoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_085439_906264_92D9E57F 
X-CRM114-Status: UNSURE (   7.60  )
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


On Tue, 20 Jan 2026 10:52:05 +0800, Sherry Sun wrote:
> Enable lpuart5 for Bluetooth support.
>
>

Applied, thanks!

[1/1] arm64: dts: imx93-14x14-evk: enable lpuart5 for Bluetooth

Best regards,
--
Frank Li <Frank.Li@nxp.com>

