Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4075DD59D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CT0rdKRL6Kk4bnlP/fufetzLbtpI/fko12BrLXxG58=; b=WOvt4/f2PAsSsZf7M2VUoe7VAS
	+fL7i3OT1BqPOMNLxLFskB+jRGDDq2P4xrTT1RV6mfdeGuJ9DBU/fbihnqwXwwI4AJ/+mTzIigtpo
	TIols1hPrxIZmpQ/SF07k9o0sYBDmai+gFVms3yWiBrh7TrOA+OdvIe2q1UY2SZ7O+DjNnvJNbCwL
	pyC8ekSjmxDUrMyzy6hvkexOYz4L3OKgiZMSzdoPPvPjSKQqYACBFNL6UTmc+fNPBd1JbFyGeRZhB
	uOhPSNPG6Tp73f3fJSJHk3+xinihwgUzAyDeT5OK5Av3Y8I6QmrryEtdUZI/N4WP4+tZrgz2b+Top
	VvXppFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhxy-00000009Fhh-0u5y;
	Mon, 25 Nov 2024 22:54:02 +0000
Received: from mail-dm6nam12on20700.outbound.protection.outlook.com ([2a01:111:f403:2417::700] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFhwz-00000009FbU-3vTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 22:53:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkjZskfNWrpuAKMYr60P4a4T3g6RYcUOQfn4ppziDM0Odo3jEwot+Lc0+PT/3E8mBlGOFPgC/aGIg3+eA4lgxmMCar9D4V4pdkH74IIXMNeciYZQ/2V/LvUu4CWW+2IJ3A7m+oIwwPE2NnHlyoubz7gtXP/p72SB3LcNO6WFaRneDhHGLoWbSVgNPnFwoMbR7JBYsGbV5HvivmNIz+2L6Z7JGYJRgmkzlCTMpdYEJDj0K/oaJhv+3TpRUM+xd9++afxC1HhGEhm2qROVeoIPQdzpuRiQ8R77F3MBd+Ad/q3ibau/ut+ueV7maVkRXBrtAywe0Po0ZLEAm0MfXa9d4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CT0rdKRL6Kk4bnlP/fufetzLbtpI/fko12BrLXxG58=;
 b=ek4mjNm0c88V0LXnjCZ5Qw74RJQdOzpdU6wduC58OFtkYO8QWs8AF+SyNfpbR2VOBvV3AvnYH8iNT1uZtDK/8zyxf94/esCFIZpsKRBPgdh4kSJ0QydEmbvYikoIl4GzfAjDxtDAoJRd+9cwQfPM7hwsWuhGtZJGjdeMCCmnZkRUyzL0R0bL4A5puM27lAp4hxJyyH6bu+a5ZxSSidOmsVsFPQEW39187UcnxQUdqQvvbfzHzqJrQ+82nRAxLKJ4s6Se3oFUdJjRetPyRau6xHSDC3LCS3m6EtMXR3RMejzMqJfIR+EXhmHQ/Mst2QtvOIjl5TO5sG8vkRiSywi/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CT0rdKRL6Kk4bnlP/fufetzLbtpI/fko12BrLXxG58=;
 b=kYj6VCx2EJMI2HIN3Fq9y+2OW753/Wljxuby3fHa1KcBDup2jY9xpNmEMLQHHRTgTN2GulJKpA/9w0A/8dydDUQnZJSoh7zPd1/Sa7s2ruA1ptnd1AjFPmTimQp9BXatKiLq1GzqJyeUE3qIVTqGCJUEfK3KSS+87ZLs9aa4egY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA3PR01MB8501.prod.exchangelabs.com (2603:10b6:806:39e::18) by
 CH0PR01MB7155.prod.exchangelabs.com (2603:10b6:610:f6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.12; Mon, 25 Nov 2024 22:52:51 +0000
Received: from SA3PR01MB8501.prod.exchangelabs.com
 ([fe80::f7ae:9cc3:b435:c49d]) by SA3PR01MB8501.prod.exchangelabs.com
 ([fe80::f7ae:9cc3:b435:c49d%4]) with mapi id 15.20.8207.010; Mon, 25 Nov 2024
 22:52:49 +0000
Message-ID: <627d2a20-3af3-4993-830d-741af2c13aa2@os.amperecomputing.com>
Date: Mon, 25 Nov 2024 17:52:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Support optional Arm SMC SOC_ID name
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20241114030452.10149-1-paul@os.amperecomputing.com>
 <ZzXrfV3uDGRkBD2L@J2N7QTR9R3>
Content-Language: en-US
From: Paul Benoit <paul@os.amperecomputing.com>
In-Reply-To: <ZzXrfV3uDGRkBD2L@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To SA3PR01MB8501.prod.exchangelabs.com
 (2603:10b6:806:39e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR01MB8501:EE_|CH0PR01MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ac5315-7d57-4e07-b018-08dd0da3e2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUhoTDc4NzZQMS9QU3g0ZXdJamZmNWJTZkNmT0d1ZGg0R2lqN0FGaGlwQnNQ?=
 =?utf-8?B?RlpNWHpiTzl4bENkY0Z3OTJMZEJwUldWRHJEcmJlKzdpS2d5RXhQZndqWHJh?=
 =?utf-8?B?SlFrUXhncld1RUs0Qm1uUFRwNGZnQmdrUklKRmttYWpSY29wQ3k5dVY1dWdZ?=
 =?utf-8?B?dnA3VnMzODRXbkxyeVArakJnSkppK0VxMmRxMEV3R0pUVVRZMWwycHJMNnJw?=
 =?utf-8?B?UFRDSERTTGpUb2svNWZmWHJmTG0wS0wzUWYzQUx4cXA4ekMySDgwM0xLV3FD?=
 =?utf-8?B?N3Z3cldxMmlXNEZKeHpiZTFtanRSaGM5TVRiZVg0cnpZL2xuWW5yZUxBUEcz?=
 =?utf-8?B?OUtEdVJhdnNNOXN2K3F5WldnbzNHUEZrMTFvWmphdlNjUnZkL1RqYXJXeXky?=
 =?utf-8?B?K0xhWndFbjF0bGl3ajFGM1RMWmUrYlp4b1RzY1FJeTBTelVvUkNXUTRlTjRv?=
 =?utf-8?B?YmhTSmdTSnZ1VWhnc3d0dHhGU1FPcXJmUmJqWS8ybG5ZTTJ3Vnd2SDNXSFlM?=
 =?utf-8?B?Mzlxd3NlV3l6MUFUYkNtTzUwUkF6b25YNTNOelN2WlM0MHB4U0xDcGlCMFRH?=
 =?utf-8?B?UUt4dU1GUDdkdVVPWlc2b29xelppSklib3Y0cFZQdE13RFU2MWcrb0hyL0dV?=
 =?utf-8?B?cUxjS0VnUmNFNm9wMHlqR0c2K2k3OU02SlJLSDNoTmliOG4rYkRseXBLbFRW?=
 =?utf-8?B?clpoVllYZHo0clZmZW1qOUpVUmQ4QzJuZkUrN1F5d1M3endRZmEyTjJxUGd1?=
 =?utf-8?B?V2t4SHp4aHc5Tmg3dFMvV0V4blNMa3hCSmxEMnRaZDRFdUZqRG9PY1ljL0d5?=
 =?utf-8?B?OGlYOExRWXo0MmNVQzFyalJxaEpXQVAxSHRoMTZJSFdEQVo4amtEd2Nxb2Ev?=
 =?utf-8?B?UUJuaU5TbmJ0ZlNIaitZdGVQcUJKcDZpK2JYRTBqTjZ5TFhUdVNYeVNxOHln?=
 =?utf-8?B?UDgxL2w2T21EVnRIOXRJZUlyVHZhVkx3WmFZQWNkVklPazI3SlVlNUp0Q2ta?=
 =?utf-8?B?anFHVy9wK3RiU1N0cHZOMHdlU3dxRzRka295cG1kQ1dMTzVoMVJVaURqdjNZ?=
 =?utf-8?B?U2E5Ym9rUkkxbFFsWnhWdGJCU0Jjemt4bEJzV3QxVG56YkVoSnJDQUdpc3RK?=
 =?utf-8?B?S2I5OXJpdWN1YUVSZDB6YkVHazlMZE96UXhJMFZxb0E5UTNzZW1HNVRoeVdk?=
 =?utf-8?B?ZFJpK2xiMXNVOEEwVHgrWWZDOFlFNGRPaTU3NnEzTG5lM1NvYmdlbzZEb0sx?=
 =?utf-8?B?SCtWVlFuZjZkeVRHN0NjL21EdFF4L2s0WnNCVTF1VnlRZlk0aVRJVHptZ1RO?=
 =?utf-8?B?ZVk5Q3pRTUpWcHJ6U0tSZW54bERPU3RWTElZODZPam1SdFdvSlZZeUJvMVlR?=
 =?utf-8?B?T05pVVI4L0p1cXFhRW5pM0xWVFc3MDl5VmkrRFcyVHNEdWZkVExrUFFRM25l?=
 =?utf-8?B?dmUzOVlQekFVNnd6aXdOSmlGYzlWQitrSWFaSjU1RU4zRjNTQTBSeC9HOTBm?=
 =?utf-8?B?VStrcnJqaEVxcEtBa3c0eDlYNnFJcUg1ZUNwbTR4ZXZWQ0pNM084cU9wZWU1?=
 =?utf-8?B?RXY3MXRPZDBQNGVDZ0ZFMmpXVi90WEFFK0s2MDRva2UvbDdXYU0wMmxJWE92?=
 =?utf-8?B?OEtrM3hzZWpwUXJxL0p5cXpGY3R2c0FJUEI0b0RJU0JsdkQvYm1SVzh2eFRI?=
 =?utf-8?B?MmtFc05MRmFQc1ZpSngrOEo3QjcwWi96VzRCcCsxR0VJZitlTm94VDZPbVQ1?=
 =?utf-8?B?QWQyK00vc3NrSUwvb1RzQ0YydVhhMGFuM3M0dkIwc2gxWXNRZlU4UFFPUmdk?=
 =?utf-8?B?TStaOGU1T21TdVQ5cDBKazhkV1FjMTFzWEJiNjJJOGZEZEZHM3U2REVyd1Yy?=
 =?utf-8?B?MUhjcUh5Y2h5KzI3K1ZQUnZSd0VYSFR1Mm1PYjc2cEp3UkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR01MB8501.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZSTTBHb3Fub0FWQzJXcTV3UVpabWt0WVV3T2dOc3loU0FoS3FUV21ETit3?=
 =?utf-8?B?bHZGc1ZOZFF2R2xuelh5MGRuOUpxeDBxVG9ER1U0aEpyZ3BaMllDRzkweVNF?=
 =?utf-8?B?bU1JYVJBVk53QVFYdHdiS1djZW81R2p4UFJMc1RTdW5JQ2dLSzNpUGQ2d005?=
 =?utf-8?B?TFlIbktDZGRQN2J1ZzRIUTNmSnhtRXVsbTNPc2I1cU4yV3J0LytaV054MWY4?=
 =?utf-8?B?K3hBUjVkM0l6T2FvOEJncm9UQmg2VFBpQVYwTlpVcVRHL0dXNkQ0eGFQQkYr?=
 =?utf-8?B?NUNsRzJKU1ZuYTZJK24vU0dsTHoybS9SYXlINWRMSHhZZ1gzZWNQZkl3VGNR?=
 =?utf-8?B?RlRQWGdLOGl1Rkp1eXl3alRzcklWTkxxYUxIMW1yZGhkTFBTNE5nNGxSaUJ6?=
 =?utf-8?B?by9GZVFCR3ZML2d3MVJHcytXcmhjWGlEVzFnNk9rOGUwYy93aG9qWGZKZits?=
 =?utf-8?B?U2g3cDZ3c0Jsb28xN3M5eGd5ZXc5c1hkalZWdEF5Q1RndVZSTXNITlZOK0VQ?=
 =?utf-8?B?TGxyZUkvekFMYWozLzFPWklSWjRPR0kwMHN6TWpmdEVETVlPZ0c2NnBBOG1V?=
 =?utf-8?B?QnFmU0FBaUZiVzNUbkFFSGpSck1tc01xazlpVDQrRVlXNjRLR2VnL1BhMWRL?=
 =?utf-8?B?aVRUaVhjSjNkamhxOTNYLysrYkc1L3BVOWxjTkYxNWNtL0FGTkF2czNHQk9x?=
 =?utf-8?B?Ym1WR3Z0WVluUGhKRXRidGozbWZhV3BlcURjN2hjZXVXSW1NVUdjcWlpQ0lt?=
 =?utf-8?B?OHNkZXVoZWJubWVDYUlGVTZHWUxjb09FUmRYTXJlMjQvV2EzdW0vSXJRWVlL?=
 =?utf-8?B?WlNhYUx3SzlINHNSNGNvL1lmMkgzR3dFaW1vRnAyUFhGMmpOcnc4WStSVnVv?=
 =?utf-8?B?SnR6cHVkL3ZUdjJGcWZKdEZsUkhPTUpmTlNVYi9IZ2VHVyt4TG4raWFYL3Mw?=
 =?utf-8?B?L3N1SGkwZGMvWVFleFVIR0ZHUWFpcFUrSExEdGUyZHZMZjhtbGxndGZ2ckMz?=
 =?utf-8?B?VjkwMTlOejFJUG12QjZ1QkFERVFhNjFVNEozQ1BzeHhQd2Zxa1FCWjAvY2lh?=
 =?utf-8?B?N3V4dU9mNDRQQ1ozY2NseCtRL2JndEV6RXdwYk1xTFByKzR3Wnp3SGwxVFRP?=
 =?utf-8?B?RStPWWUxQ2xmRy92aXNGUGtzSVF1L3pucVVKY2FNWjJubklMT0lIdmxHWis2?=
 =?utf-8?B?ZExFVWRJZnFRcGgwYXREdjFCcmN0V2dRVGJwR25IZUwwZTZsK0RLMjFkRmFQ?=
 =?utf-8?B?a0JUUlNKalY1WG9SSUhLaW5MbWswMTJkWkt6R3Q0SEdqT1Jsd3ErMHVPNWUw?=
 =?utf-8?B?NlMrTEJ2WnZRa3o3eXIwa2h3bGl0eTU5eWM0ZmNMRTRaSm40aHh1ZVlEQWcx?=
 =?utf-8?B?NTFTTGZWTlJBKzFieWZEQ2FUWEJKZWlXcVpCcGNGK3BFZFRTemtubjNWai9l?=
 =?utf-8?B?TTNWL2NvTTdWZ0duM0hySWgrbVlCT295MXU4eTVwQUd5ajhMWENkQjliMlZI?=
 =?utf-8?B?dHpYbS9QVlZQcStWdVJpT3ExdndkT09HalorbzZpREFpekRvR0xQS2krZW9Q?=
 =?utf-8?B?amZsYjZrUkxVeFNrK2RkVXcveWtsTmlXNSttQ2dTZEtITnhLclI1dmx4Ynda?=
 =?utf-8?B?VGU4aEJYVFBRT3pWdnhZUmhrVllmS1h5QklaQjBvSTdEdDlLcFM2WGNxRmhi?=
 =?utf-8?B?dEtlWFRtaXRRU0kvWlE4MkxDcEtoT3lqNGEwdTM2RkJySWRzZXBzU09XZENB?=
 =?utf-8?B?c3ZmZUR5d0V2N2NPNi9MZThiOFpPL2hseFVzWUp1Wmk0YkFLQnpsRHYzUWZM?=
 =?utf-8?B?WDJqV2VraURYZmxxaHg4TEhuMEpKRytCMXFvazBGVUJQMndxZmhvT2hPbzFX?=
 =?utf-8?B?dVJXbEs4anhvS2YvcWVQRmxUclVpaENKKzgySGFyd2ZwcnpqUDl6cC9ITjlv?=
 =?utf-8?B?YUVTdkRYdHhmaGVKdkZsWlZWVUl3NWhSVHpYdExldDBBZFh4NmdaWGpHcDAx?=
 =?utf-8?B?RjhXQzc3SGg0dWUwYkQyc3FsTmxBYmkwNlpOcFRYbzJOVVp4aFF3b2hwdGVm?=
 =?utf-8?B?TlJOeFh6REhvZjBHcFlSN3VrbCtjbDQ3Y3FrU2dyNVV5WWMxNDlCUEpjWXJh?=
 =?utf-8?B?R28vU1VhM2FoQkxaOVNhdlVJcS9nY0tCek96dUJVbndDV1Z1U1hUUCtYamRx?=
 =?utf-8?Q?gaIgvILrbar9q5ezhn7xXrA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ac5315-7d57-4e07-b018-08dd0da3e2ab
X-MS-Exchange-CrossTenant-AuthSource: SA3PR01MB8501.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 22:52:49.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6Ni1/Ug7PLF6h0OiuCJYi+rq4MLeVbyLxJ/hgj83PjZ26iuFPr1qpgWCOoQW02PG/uESQmUZm/u0gFLyzMFpSG4fkNydRFEpsJS+F75Q30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_145302_050756_35481938 
X-CRM114-Status: GOOD (  40.89  )
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

On 11/14/2024 7:22 AM, Mark Rutland wrote:
> Hi Paul,
> 
> On Wed, Nov 13, 2024 at 07:04:52PM -0800, Paul Benoit wrote:
>> Issue Number 1.6 of the Arm SMC Calling Convention introduces an
>> optional SOC_ID name string.  If available, point the 'machine' field of
>> the SoC Device Attributes at this string so that it will appear under
>> /sys/bus/soc/devices/soc0/machine.  On Arm SMC compliant SoCs, this will
>> allow things like 'lscpu' to eventually get a SoC provider model name
>> from there rather than each tool/utility needing to get a possibly
>> inconsistent, obsolete, or incorrect model/machine name from its own
>> hardcoded model/machine name table.
>>
>> Signed-off-by: Paul Benoit <paul@os.amperecomputing.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   drivers/firmware/smccc/smccc.c  | 70 +++++++++++++++++++++++++++++++++
>>   drivers/firmware/smccc/soc_id.c |  1 +
>>   include/linux/arm-smccc.h       | 10 +++++
>>   3 files changed, 81 insertions(+)
>>
>> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
>> index a74600d9f2d7..1c7084b0b8d7 100644
>> --- a/drivers/firmware/smccc/smccc.c
>> +++ b/drivers/firmware/smccc/smccc.c
>> @@ -18,10 +18,12 @@ static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>>   bool __ro_after_init smccc_trng_available = false;
>>   s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
>>   s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
>> +char __ro_after_init smccc_soc_id_name[136] = "";
>>   
>>   void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>>   {
>>   	struct arm_smccc_res res;
>> +	struct arm_smccc_1_2_regs regs_1_2;
>>   
>>   	smccc_version = version;
>>   	smccc_conduit = conduit;
>> @@ -37,6 +39,66 @@ void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>>   			smccc_soc_id_version = (s32)res.a0;
>>   			arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_SOC_ID, 1, &res);
>>   			smccc_soc_id_revision = (s32)res.a0;
>> +
>> +			/* Issue Number 1.6 of the Arm SMC Calling Convention
>> +			 * specification introduces an optional "name" string
>> +			 * to the ARM_SMCCC_ARCH_SOC_ID function.  Fetch it if
>> +			 * available.
>> +			 */
> 
> I think the code for the SOC_ID name should live under soc_id.c, since
> it *only* matters to the sysfs interface (and will not be used by other
> code in the kernel to identify the SOC). That should be initialised
> under smccc_soc_init(), ideally factored into a smccc_soc_name_init()
> helper.
> 
> Nit: comments should have the leading '/*' on its own line, e.g.
> 
> 	/*
> 	 * Multi-line comments should be formatted like this, with a
> 	 * leading and trailing line.
> 	 */
> 
>> +			regs_1_2.a0 = ARM_SMCCC_ARCH_SOC_ID;
>> +			regs_1_2.a1 = 2;	/* SOC_ID name */
>> +			arm_smccc_1_2_smc(
>> +				(const struct arm_smccc_1_2_regs *)&regs_1_2,
>> +				(struct arm_smccc_1_2_regs *)&regs_1_2);
> 
> These casts shouldn't be necessary, and they look suspicious.
> 
> Additionally, this should be using whichever conduit SMCCC happens to be
> using rather than assuming SMC. As with the rest of this code using
> arm_smccc_1_1_invoke(), we should add a arm_smccc_1_2_invoke() wrapper
> for that, with this looking like:
> 
> 			arm_smccc_1_2_invoke(&regs_1_2, &regs_1_2);
>> +
>> +			if ((u32)regs_1_2.a0 == 0) {
>> +				unsigned long *destination =
>> +					(unsigned long *)smccc_soc_id_name;
>> +
>> +				/*
>> +				 * Copy regs_1_2.a1..regs_1_2.a17 to the
>> +				 * smccc_soc_id_name string with consideration
>> +				 * to the endianness of the values in a1..a17.
> 
> This indicates that we have to do *something* about endianness, but
> doesn't say *what* consideration is necessary, which is rather
> unhelpful -- it would be better to describe the format of the registers,
> which would indicate what specifically we need to do.
> 
> For example:
> 
> 	The string is packed into registers a1 to a17 such that each
> 	register contains 8 successive bytes, and within each register
> 	byte N of the string fragment is encoded into bits [8*N+7:8*N].
> 
>> +				 * As per Issue 1.6 of the Arm SMC Calling
>> +				 * Convention, the string will be NUL terminated
>> +				 * and padded, from the end of the string to
>> +				 * the end of the 136 byte buffer, with NULs.
>> +				 */
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a1);
> 
> If you used cpu_to_le64(), you wouldn't need a cast, though either way you will
> need a cast on the return value since 'destination' is not an array of __le64,
> and sparse should complain.
> 
> This isn't really an endianness conversion since we're unpacking smaller
> elements out of a larger container, so I reckon it would be better to
> handle this explicitly, e.g.
> 
> 	void str_fragment_from_reg(char *dst, u64 reg)
> 	{
> 		dst[0] = (reg >> 0)  & 0xff;
> 		dst[1] = (reg >> 8)  & 0xff;
> 		dst[2] = (reg >> 16) & 0xff;
> 		dst[3] = (reg >> 24) & 0xff;
> 		dst[4] = (reg >> 32) & 0xff;
> 		dst[5] = (reg >> 40) & 0xff;
> 		dst[6] = (reg >> 48) & 0xff;
> 		dst[7] = (reg >> 56) & 0xff;
> 	}
> 
> ... and then using that:
> 
> 	str_fragment_from_reg(destination + 0,  regs_1_2.a1);
> 	str_fragment_from_reg(destination + 8,  regs_1_2.a2);
> 	str_fragment_from_reg(destination + 16, regs_1_2.a3);
> 	str_fragment_from_reg(destination + 24, regs_1_2.a4);
> 	...
> 
> That way we avoid all the messy casting, and we can more clearly align
> this with the way the spec says this is packed.
> 
> The generated code looks sane (with GCC 14.2.0, at least):
> 
> 	// little-endian kernel
> 	0000000000000000 <str_fragment_from_reg>:
> 	   0:   f9000001        str     x1, [x0]
> 	   4:   d65f03c0        ret
> 
> 	// big-endian kernel
> 	0000000000000000 <str_fragment_from_reg>:
> 	   0:   dac00c21        rev     x1, x1
> 	   4:   f9000001        str     x1, [x0]
> 	   8:   d65f03c0        ret
> 
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a2);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a3);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a4);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a5);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a6);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a7);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a8);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a9);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a10);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a11);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a12);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a13);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a14);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a15);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a16);
>> +				*destination++ =
>> +				    cpu_to_le64p((const __u64 *)&regs_1_2.a17);
> 
> We probably want to check that the string is actually NUL terminated
> here, and log a FW BUG message if it is not.
> 
>> +			}
>>   		}
>>   	}
>>   }
>> @@ -67,6 +129,14 @@ s32 arm_smccc_get_soc_id_revision(void)
>>   }
>>   EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
>>   
>> +char *arm_smccc_get_soc_id_name(void)
>> +{
>> +	if (strnlen(smccc_soc_id_name, sizeof(smccc_soc_id_name)))
>> +		return smccc_soc_id_name;
>> +
>> +	return NULL;
>> +}
> 
> As above, I think this can be folded into the probing routine.
> 
>> +
>>   static int __init smccc_devices_init(void)
>>   {
>>   	struct platform_device *pdev;
>> diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/smccc/soc_id.c
>> index 1990263fbba0..6f698c703868 100644
>> --- a/drivers/firmware/smccc/soc_id.c
>> +++ b/drivers/firmware/smccc/soc_id.c
>> @@ -72,6 +72,7 @@ static int __init smccc_soc_init(void)
>>   	soc_dev_attr->soc_id = soc_id_str;
>>   	soc_dev_attr->revision = soc_id_rev_str;
>>   	soc_dev_attr->family = soc_id_jep106_id_str;
>> +	soc_dev_attr->machine = arm_smccc_get_soc_id_name();
>>   
>>   	soc_dev = soc_device_register(soc_dev_attr);
>>   	if (IS_ERR(soc_dev)) {
>> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
>> index 67f6fdf2e7cd..5935cf636135 100644
>> --- a/include/linux/arm-smccc.h
>> +++ b/include/linux/arm-smccc.h
>> @@ -333,6 +333,16 @@ s32 arm_smccc_get_soc_id_version(void);
>>    */
>>   s32 arm_smccc_get_soc_id_revision(void);
>>   
>> +/**
>> + * arm_smccc_get_soc_id_name()
>> + *
>> + * Returns the SOC ID name.
>> + *
>> + * When ARM_SMCCC_ARCH_SOC_ID name is not present, returns NULL.
>> + */
>> +char *arm_smccc_get_soc_id_name(void);
> 
> I don't think this needs to be exposed outside of the SOC ID code.
> 
> Thanks,
> Mark.

Hi Mark,

Thanks for the quick response and detailed review.  I'll soon be 
submitting a v2 patch that addresses the issues that you have identified.


