Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D00FC5933
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUYMcTE8HMMhg0pJaMPfss9pk3eC+qk9Z7ujoHFd7CU=; b=n4lPvbN9cJHsJss8VET7C3A26H
	kUeDYfWhsbhrRfVili47xFPUDAVXWZQsxxFpZBKqsXv8nVqRC4PGpFGOxZNmsA2/HxVidqFpthfas
	o/xa56efCKcvy53IKyaUR887nvH8LYcOA3wSWZbymYLgr1OBKdoV+wnC/+Kcah6zx988APLuJSCq8
	SvJhvzL4h3EXrRXJgtFZ6HdOkf3gbJj+UTWxtIJuxjpFfr92+MPCtn4kdh/Y6Rl4tplBEuxBYJAE4
	D9K7kGVGmQ3KEMDwjob6WQBRTipJCLD9KWtViKMdRDu3VXzfHtDgoopf/aBpVH+ryLSz0mc2DlqF6
	iJf4u0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZYL-000000062rb-2r7O;
	Thu, 26 Feb 2026 11:29:09 +0000
Received: from mail-swedencentralazon11013005.outbound.protection.outlook.com ([52.101.83.5] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZYJ-000000062rG-1HZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:29:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxm/WLelgTZjFs+CUzV1l98qCYmeMdgXRcL/+xTAPOqp4LF6tGMwrGKGGRt4NAUTG4mEcwnPfzwv5K5MF4v05SrmfysHBL75KOS4Hg6uZFMvdroJhKOaZPwt8SP/GXJOz/7RisIdPmX7H3y8Bun5VZa9WOnBZutn6pYf7VGx1FtphU6ZAakjN2M1ZMJrXiNdQjMsnBcGnoTDH4RFl5ZjZaPTTDVK0EjHH7hgbK63eSwzUk5Zu4CED8e753M12wD+g7+lga9gqMNRGNZluXR2ITgb5JIJiSSpjvjF4SOHBi+X8PFTpLY8Hhf4WyEM98m8gSD0wxHec5P5+Txn8gJ3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUYMcTE8HMMhg0pJaMPfss9pk3eC+qk9Z7ujoHFd7CU=;
 b=CCa0oFTpt46CJ7b/ZNwPXcOE5RaleatLGHPsuaZ2PMVRHgY7tHv1ePSZIsNNeOIzz4151/l5s7TjrYP/GcV6mpkGPQHmXBoufnVGU2+ZCMuJQiCD1nzU5qMd6x1wjjO6fej7XMledHO63NZwXVoGsJcumunuXaz+J5lw+DVcCVgEk4IRC67ZSfMNsbVMVJCV+IAXXMmmNMBQHbRkF16gAON0Y/pARzOhRYlZkDOQuPdhh6bRuRAcBuv3+l/lE14S7yj6/NsrLI5sE8RTVA/aStfdFQ4zvQdxsEZS7yN6GxzljFz58zThO/ADm1sVgeIzYd0ydrM7LffwCt8TQJ5Uyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUYMcTE8HMMhg0pJaMPfss9pk3eC+qk9Z7ujoHFd7CU=;
 b=DWH44pBTIhdM3NJqYKSHIssM4eC0mTx+I3RrVnSnhy2f9zVLvUd2nSUViR9cx2D6FDf+r3h3jPlxfmWl8L1PqK2JFV4F6A/f98VhNcvfoEiCqJQ34MP08IEUB3nJerCctpVkLIA+sS4LJNNjPsy5o5GBrngbBovMy5fMlCx0oQBpJaDlaygiXPVt8S1TU+N9ZqGk0h7dQZYTIB2l4yLtFLujLkz/JleBIjQEYz5IhCIcZ++DkZeU+f5xDV4UJFypR4mcvVE8xJoRviX9w+CEtIXvDOlBNQlUnO33jmVjn0HxUFaVnOVG2iTp81DekNfp+70+t6th7uoFYgj3kTrxag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 11:28:59 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:28:59 +0000
Message-ID: <977f814b-2e17-4c75-b955-82e4e46a7794@oss.nxp.com>
Date: Thu, 26 Feb 2026 13:31:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1 panel
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226-imx93-9x9-qsb-dpi-panel-v1-1-de51c2d2ed30@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260226-imx93-9x9-qsb-dpi-panel-v1-1-de51c2d2ed30@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::37) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6cbb80-6689-48de-97f0-08de752a3bf7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 66KY3CxH32Ro58pZr/4Hc31VWdoqt8/6QCkuaxluB495fJjxz0hzXhx1SFkLgU2/Fnh3IFccasEYHxJn5ko4X+Fhnv48s7jpVjVgWerC8Avk6Wdwqs7qrtxsVVorBg83d8/HEhjx4q8+kL/5hXvGF5C1PVr2lizz7K6aNIbYJ8PT7BrG/DV2t+EV7ajtxVM2sU1LfP19QWO+jnpOmDAeSFkgqRMAYzAtwfVJaajLtyrQtjiHU1tWeRdpqLPXIvqAGVvCC/12l5e/WbnSygZGNMnhrJ1tyz3cK0+fQjqZkzOFUKqxa9dia8/U7OQ/oJqFbmYIHqLpnicgtKkzoBfqXEmAruBIojUHeRPMPThaKZttDNaIFEBGlk169L4h1UWG/kcdsrmpiucE8PzWSAcWGrAbARqSGRLpPd5kkDyvwU5QUG/Qv+jpUeh28l6DGy1ol5PxFke12xP+JgL+qp2bOLDygHVVV7G5VFTeWv76PH7t/itS2p409EmMHCvfI5UlYrjwej/PJyaZXoQtXqA44MwnaRzLc/63+sd/QoEclteNsvtDTmMOQVloNq1FOqn+ZPQlrDwwelDEFU2rjMssnLIrPy9QqnB348jjvUdomKk6jIBL6hqb4m7eCBTBSvxoBNsaLsv5h8lgbvYRnFxD8Tsv1LUn/rYnyCtdh/jZ8PFsnuqxAmWJKPNMjmJnqe1RRJoSSagoqvlDU6eb7umuTMNCh8lUqQPXa09W7iTOYPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SS9vd3Z4WDdQSGdMZzU1QVQ2dTJmY2I5cjE4Q25JcU5HWit4YThqaEkvbmJk?=
 =?utf-8?B?eUZYK1NMMGJpV1RVMDJnc1VqQTgvZVd2NHJWdFAyWXp5U3lYK1BBUVYxREVE?=
 =?utf-8?B?VHE1ei9SYUMvbkk0MkQvdkx4Slg4QnptMUVsU2hMTUM0dlpnSzlXSWx0MTN3?=
 =?utf-8?B?cWorZ3lZY0RNMjloN2pMQjZNQ0VGdUM4N05LeHcvc05MbGZTcmFrOEh4aWVm?=
 =?utf-8?B?bjBOd2F0c1dSNTZqaDQwT2kxMHA2Z0M2WURtSzZrVTZubmt5bUlrY1N1aDkx?=
 =?utf-8?B?a3ZSQ3VzTW1weFRobU5JSmZRRWFRQmFuUFA4eG5XS3ZYMlFFdGNLdjVHUkdV?=
 =?utf-8?B?YlFHZUdhL2dLR1NDd2Z3S3JkdHdCbDNyZmdZK040bW1JNFArNHR5Q05zOEdF?=
 =?utf-8?B?VUtsaWJsNWdBbWlwc2w1aFRBdmJIdDVLYitkbVRlZHhyK0NrTnUzNkR2aTc5?=
 =?utf-8?B?cnZVc0ZjeVhVdHBXclNhbTR6Z2tFOVpIV2RhNXUxcStUSTR1cDNHSE0wbHIr?=
 =?utf-8?B?cFhCWHNkTUFVY3ViNkxPQ3I4Unk2d3BSaFVsZXlIeEpjK25YVzdWTWZMbW9Z?=
 =?utf-8?B?c2QzQ2t2djY4dVdRdXkwRVVrR0lyZFF0RUVoay9wV3VLS2MzN1dmUTFmdkZq?=
 =?utf-8?B?bkFTL3lKUTByQnV1VWVuMS8xcVFEeXZJMm51ZDlFcDhuczRLbVNuTklpbjFW?=
 =?utf-8?B?OHoyQ2hGeTZEaTcxYm9KUEF6bGFsSDhEcjFtdFNqQWdUaVA5Y1A3VEZQMFJZ?=
 =?utf-8?B?RTJnWjRSSlBSU2I1VXNhbUo4cTh3bDU3ZVBnSzZ0b3V3L1Nab2lPWlNlUUNx?=
 =?utf-8?B?OXpFcG02ZmF0bFgvM0crYStGVnNrMGY1NDIrenQxOXJybkpDNFFJam92WUJU?=
 =?utf-8?B?cmJmM09Zd3p6cDV5azZvVUZiTVdrUnN1cHpaTlBRaSs1YjMzZmVIL2I1MGg5?=
 =?utf-8?B?THA3cnZ1TkllNFovNjBZWE13Rm1JQldRMzZUNmdNenNJb2dlVUJkaEFYaTJi?=
 =?utf-8?B?N2pNYTZvN081dzhLekwxaHRrbFRRKzcwUWI3MVZRbmVRRDI1VmpVWHhsYk9l?=
 =?utf-8?B?M0EwQUlkcndCeEJFa2lweVZxYjNpcUN3SkJHS3ZpbUg0MnlleVd2MkJrb1Ez?=
 =?utf-8?B?SWVseHl6c3ZDMXc0YmwyNC9razIza3lzZk1tOGROZXV4ZCs0T0xsNmV1YXBo?=
 =?utf-8?B?a1Vwa25aQlZDOEpsdDBYMCtESWVKZzBqYUhhWmUxcS85cGl1Z3YvdjVBYitM?=
 =?utf-8?B?ejZ3eXRaRHYwcVc4dzRSQVpFUHhjNEVEcnpVUk1ocGxFMTRXeVUrTXEwZ0F3?=
 =?utf-8?B?dGlpU0paY0pBVWkzbDJMLzVWY2xFcC9FdUJoM0JmVHY3SGRYYnNhVzdCcXpr?=
 =?utf-8?B?aTIvNkhuSVE2amx5Y0tCNVFzbkNUTGRpTUptWEVMUmZtd1BzOVVHV0VlNFBR?=
 =?utf-8?B?azNtWjhsZGVDMXM1Mi80OCt1VDBybW1Rbk1hSk82eVJ2WGRTcktQYURCdGEr?=
 =?utf-8?B?eVJVWCtJZnRTeVNDWWxvZTE0QSt3VGhqdk5ZVHNUbjFEVjBHZU5rbFNqU2Vx?=
 =?utf-8?B?TTdaUU9zSDE5Y3VPZ2xqYlpEc3JjN0R4bjlTM0lHS09WQWdMcUJZVHZ5eGZS?=
 =?utf-8?B?T09oY2tHck1FS3NZVHZuTU1hdnZEemJ1Vnd3REhlY24yZ0kzZDkyaFZkOUJ1?=
 =?utf-8?B?WDloKzhNSlNFak5JUHE1YTdmMmtJY1dLNEZPaUlhaDMyNWF1VjFLVUVHWFVl?=
 =?utf-8?B?TCtITC9makJnZmNNbFNwRGtQYU1Rb21wUU5BL0c4WGxFQUwvRlFQWWZMbTVZ?=
 =?utf-8?B?VXhrQTJnTDZmbmcrNXRWMzd3QjNuVXV1TjZvVjJVRXNiajdLVWZGK2Nkc1lK?=
 =?utf-8?B?bHN3K2tFNm5hOTYwNlFkT1RBNDhHRFFNRHB1ODZYUnFYaytSeXh1aE9EMStL?=
 =?utf-8?B?cTZCSDA0cit4TVpFUXJCdSt2ZXE1QVc1MHJLYVdsNnQvQ1J0bXZWejZLQjFy?=
 =?utf-8?B?bUZjWjlxekZXTXhqcmhGVDE1aXpVdjBEc1NXRUk0R0Q1aXprTXkvMTByL21y?=
 =?utf-8?B?QTZxU2tHaU1jb1ROZHZpM0hwSEVBbTZQS1VpS1JzSkRwOUVvN3FmQ0VxWDcr?=
 =?utf-8?B?RHRrcTA1OG1QMHp1QWJUaXN6d1lsWU5TNVRsMGVLVXdKbUpHM2pDeWV6QkVF?=
 =?utf-8?B?NW1lYWx5bWNHTkZyaThTTk9EcjhjNnRGbkVDQ0pxOUYzSE5ycm8xYWE2aG5r?=
 =?utf-8?B?c1IrRjVrN1d5cGM5M21IdEF4ZStSeE1VRVc4enp6bEQ0eSthd3ppZytRSk1N?=
 =?utf-8?B?UWlFQjZYT3RaeTQ1QU5EUTJjRWpGc1pvSkYrMW8yQUcrTkd2YkowZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6cbb80-6689-48de-97f0-08de752a3bf7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:28:59.1110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOuTBRO3LmVD90LfqWLM52jQtXyq5EsLiImJ5DyCkwhCNYfP/ZAA+gxk2NM5DYZQNMZdwe0rSm9KK3vfxdhi/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_032907_353229_37B84A67 
X-CRM114-Status: UNSURE (   7.39  )
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

On 2/26/26 11:52, Liu Ying wrote:
> +
> +&sai3 {
> +	/* disable due to pin conflicts */
> +	status = "disabled";
> +};

Please be more specific here and mention the IP in conflict with sai3.


