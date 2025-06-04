Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5719FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjW1Hlp15mwGIy7vJPpb2lIhvxeHqMbsXMGOcY6AYIM=; b=rKZOIiYyzrCm0QUMwF4Y5kaMdO
	vbDBZqA1R9uqOD6TFC5M65eIxJ1ihh4jeh1gjoCTJ3H1lOXAW59qMBdp0J7w89oGeK/MGgsgY4olQ
	AOj+kECDUsZtCOtWs6PV9k19qKXS1lpqOIf4dJuFkAIanYwVVt658xBvBjVocBWwJtf0oIzU0is7B
	oLNWGBN0R+li4Ovsr5CZupIEFRRMEtgGfMJdWWg/r+U7RxX+Bpoo7oJ9t0qMAaxTuvplKjgJEhCdG
	pFeBjFgtWDPD2GmYqz4oyRn6b5HtwkIGoYx+mmVNlbzx0SrXn6u4zNxWveI/XhFqxX8U1NyaxAJbC
	jh2NOXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkIr-0000000D14U-3fI0;
	Wed, 04 Jun 2025 09:20:57 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkFr-0000000D0SS-37lu;
	Wed, 04 Jun 2025 09:17:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUoEvGmu7vif9XlKF7VdEAjqAtmZJlSqy5EgU+Mk4Q9M/Xt6TbiMkb3zWF7eiaDD5F1w7UKGVJgkzbiDan5VKvu0P7QCRYWskcuKmjxr0/Z92gsWxPiLfxJSYpd1+kdIowuP3LzKAmCxNt2qFDc0+fOq7ZRM8E6kGg71fV1eyVusseoAIde8lsZk07e4cQR0dCtxeOxyf/reSbj7nPAlO4CoXW/VOYWKbZYmq/BlVucBrFmf8+MEqAODZUjyyMdGc/lwxhFp5oyuB3nqsTh4Fayqkjnn/NoRt33oPBL3xcQPVhtoWN9r66H3qxOvle0G2BjuiXYapap+AMPqKuPvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjW1Hlp15mwGIy7vJPpb2lIhvxeHqMbsXMGOcY6AYIM=;
 b=sAc9tHCSXbmg8ZEkeVSqD4gVxD/d8yxQ9ouAYs4F47HxF18An5g5BWGYLmLqaOuUzGvTqdRHB4pN9M9tbzi0cY3kym1Up8hytcYpxjeCox6zkpwyzI/SsHTY7i44NTRQlC+fd04gtrV+N5R6QFon7G3TeA8EHSWXtgoJeXAULsombfMnmsal0i2nMBGL9/DFKbl/tkNFZb5roXR7+WZbHQg1PV+65jfKxc9qXhIwqii5MIbL/nFRSYRtaYAVVvIEzuUA+9gHPe0J2eSLRagkoMxQqJMCZJuTkWTaihhqL/vM9HDRqXuxdsRQOOqqZBjhJ6bki4XPNlkCvA/6feHQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fibocom.com; dmarc=pass action=none header.from=fibocom.com;
 dkim=pass header.d=fibocom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fibocomcorp.onmicrosoft.com; s=selector1-fibocomcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjW1Hlp15mwGIy7vJPpb2lIhvxeHqMbsXMGOcY6AYIM=;
 b=rLeVP/9ASRuVGNuf8ePORDcjd0LxKdEniG2QJ6AvBWZ9BNStFQM9Swgv+vnrysCN6YeSCrfTPws0eHg+l2sN9O+jiYSrCu4kRv2Nr0FGpxJKFiX2QVBGZOOy6Tq1qDF6R/9vv3/wI73c3rHzA/yupUVN0/KrjKjzVL2oLCdbyw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fibocom.com;
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com (2603:1096:400:1b5::6)
 by KL1PR02MB7740.apcprd02.prod.outlook.com (2603:1096:820:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 09:17:38 +0000
Received: from TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b]) by TY0PR02MB5766.apcprd02.prod.outlook.com
 ([fe80::f53d:47b:3b04:9a8b%4]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 09:17:38 +0000
From: Jinjian Song <jinjian.song@fibocom.com>
To: kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	corbet@lwn.net,
	danielwinkler@google.com,
	davem@davemloft.net,
	edumazet@google.com,
	haijun.liu@mediatek.com,
	helgaas@kernel.org,
	horms@kernel.org,
	jinjian.song@fibocom.com,
	johannes@sipsolutions.net,
	korneld@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	loic.poulain@linaro.org,
	m.chetan.kumar@linux.intel.com,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rafael.wang@fibocom.com,
	ricardo.martinez@linux.intel.com,
	ryazanov.s.a@gmail.com
Subject: Re: [net-next v1] net: wwan: t7xx: Parameterize data plane RX BAT and FAG count
Date: Wed,  4 Jun 2025 17:17:22 +0800
Message-ID: <20250520122141.025616c9@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520122141.025616c9@kernel.org>
References: <20250514104728.10869-1-jinjian.song@fibocom.com> <20250515180858.2568d930@kernel.org> <20250516084320.66998caf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To TY0PR02MB5766.apcprd02.prod.outlook.com
 (2603:1096:400:1b5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR02MB5766:EE_|KL1PR02MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a90758e-17b9-46f3-2d43-08dda348a60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|4022899009|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GJKzhkOIFWUt5PrcUiN8IK4ucnXURYyTi/W8qcAIoyfz/j5/6Vg1wsjBxDdr?=
 =?us-ascii?Q?qqVfAUtbkS9CwGTCh+m6Lii/Ds6ic17nnRV/hto3uTvbXIof5druJd+vvBw6?=
 =?us-ascii?Q?09f6KGGNnTsLfNUEG1IkvbxpX0Vc558kkSmAp38x/fC3MuEkVX8PJkA3OrTw?=
 =?us-ascii?Q?I0pc4MOUvuvZa7LF5F9wNf0e82P4DJGHYqW9L95uypnmctYrownAuwKv2xWS?=
 =?us-ascii?Q?CyqqbxO6iC1fUdZAbLPkJhv+yMfRxLbt2c1NgLZ28DvFLKMQXiyvz5QRLvpZ?=
 =?us-ascii?Q?gKwJBunI2OS790z3HkxRnL0DaHcd2ophDasxzfSZt606eJAJkXbFHF/2okkq?=
 =?us-ascii?Q?GpsWShqRbtxNo8vtTh8N+Yl2SW4cwCCoqmRelvWuLAtRmEV4DiLR/tDmPTrv?=
 =?us-ascii?Q?65j+ySixNhaAGKPWaNyBmRONGdSf9u5RadxIfZbzxohsNieuiO8G0eFouGmY?=
 =?us-ascii?Q?xlzvhbw44l017zTcVGjq/3n7v/y/jHqhTSKiLfifgeNEYmGBamTPWdpWRA9L?=
 =?us-ascii?Q?HLTVn5LNPzzwLRKc8lOqpBExCUNhQBPYZ5YTgqB0t4IRgun0aVIwMVEIEbDG?=
 =?us-ascii?Q?j51vIsj7YJOinAbkrnL85/BgYvLY6q7wkymiRvuJQatJrzy+kvYXuQC0qJdr?=
 =?us-ascii?Q?eZFkmH4fS1s62XH2NODhg9sIKflj2Hb0Ff8PR6nmCIhp8hV2mLP230/PQLko?=
 =?us-ascii?Q?6KgIr0LUHTrfIQ2isueNwWLniCxPiBLcDgJXFuKpgGvhKl3ira7kKIVgYf9u?=
 =?us-ascii?Q?qf6HhIRSY/EWCQzAjTW9UZEYCW4qRERe9wgrih5udnh3s4w/Vz1QeIGlvtRC?=
 =?us-ascii?Q?+R5WF1wpFZiAGTKmqRK5Kq+Ho79UmzImnpVCjfFlq/aSlhAAGFhgzqEL9XqO?=
 =?us-ascii?Q?rhC4WVD5By2zS+6DzSSZB2/GZ0rTnm1RcmULRMowIv8K1PQS+ENUYc6w+SLb?=
 =?us-ascii?Q?/zeN6Apn2ob2LKz9TV75ecFuOiORRquIYIy6m8CV6aT3DFWPEogwj5UlndYW?=
 =?us-ascii?Q?64FwpVxB8BDNrHQnLrarEPxGlkJOj8+xk9XMIz/MjM/n/VxxPNw402kRUU9+?=
 =?us-ascii?Q?XCERrCHp4uzeHMYBtse4f12ApWMS0a5T6CbDU+artINk1MaJS30hPlBErY/1?=
 =?us-ascii?Q?Ue9DEWHql3zhhpcI3GhD3QGpRsxKTgeZRbAqqWhWlZhyQlkOaxXnXrgED+ZR?=
 =?us-ascii?Q?syQ322P1Z4t0/Mo21WEYR2Yx2KDpi1B62IxdekqgnQzq5JYy0BAzQnWL1/KS?=
 =?us-ascii?Q?2x+xDuZ1HVHPrXhtvICPpvLLU/mQAPJ/N1tskxpytM2YdkF1dBvGaG3aT0t0?=
 =?us-ascii?Q?Ma4FWQVtcVz2iwRDciL9fOphypI0TyNbAssgN+0+D1MZPbG9fcI0Y6IC9WH5?=
 =?us-ascii?Q?KWvvoZgQoDDEGHLmW4MLGloC0olg+1v4icjUJHmKAyyURrWoZigyn5tMirz0?=
 =?us-ascii?Q?C0me2aGuwMkb4zlM2nKRT5qH2XnAjnxNjjneLjzDEWfLOaXdYo5EYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR02MB5766.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(4022899009)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yLJgQn+hp2O+czo+3JxNG5RV54CqodIoC7ptvIMYkfAHXIv23TAtSmtHxGlx?=
 =?us-ascii?Q?H7+Z8S/EOB2Z8nUhdRYw9xXyo9Zvq7ypiQwaeWhmM0uWcYSoHa2Ylqxcd5/R?=
 =?us-ascii?Q?JrdJ3SQDZNgL8Dm1k5HP3LpyCJeYwWApFukNIONh5S1TE7Nl7h7rADTdMVZY?=
 =?us-ascii?Q?9I0kAEnxik11wEnAkGRGa/4p5zLCkg7zZjZKwJd5KjkCd8b8apmlKLDZdNgM?=
 =?us-ascii?Q?6Paf3z1ttzNJ3WFHlcNBCsXVjI32Vlu5G/bYZ7ljZ7r18MC6vfdVPH52M1bB?=
 =?us-ascii?Q?UM9u6L52oMco8yue5GktHJkBhXXj8yDoj2wjAwFWY+lqMoBOAKncKifWqwMd?=
 =?us-ascii?Q?8aw9QT+QQMy+yrhbSv1GWNz953Psy92/RD49rH5fjs+PW7Q49uL/PcG137ON?=
 =?us-ascii?Q?QK05w8EdcmwDhUGYPqBGy57kGtWP16wweuWTCxIViC1OSoY4fphw7wc/FBqr?=
 =?us-ascii?Q?GQ2OqiLUwgBMa1sQywd6aHrpEdNaJIhmMrXvX+qW5yuQRs0lAK7o8FZUGrsA?=
 =?us-ascii?Q?3fY8Nsxhn8Tca4lx6hrlPCJ3bVuCQtVWfgrGBlii5rmGp+ZcIHWIXygg61Kp?=
 =?us-ascii?Q?eidKZvvBiylq/ATW8FEyXh7TzLRMVKVnmDAEWZNVsatXDAWv33/5Iu15AWb/?=
 =?us-ascii?Q?S6IgleQVBOfahR+aEciCmZezN+LjECMa05tbPtCguXoHJSnwgFoWWRoTongY?=
 =?us-ascii?Q?zmFWYCAQ15OBcme7qtRIktv97Hq6+Is0IOZUVVK0Ih7LNgKt5tYBSBM2cM+Q?=
 =?us-ascii?Q?65kdA1tx4AkUxX44XEzxJcnhPyZwaEcacLMHkQ11xsxCk3YCqMwOeCCYtTPC?=
 =?us-ascii?Q?w8Glp4MytqURudA8PUuGztHjurqHoW7SUTr9DwV2O5I0pd0sqOEIK/G4DZIC?=
 =?us-ascii?Q?PrEMkIIH27vaYeeOGOQrbkbF3+3aZJoHo63LhY+xi1aSlUYGC7+MdFqhjY/F?=
 =?us-ascii?Q?j7lCbbZdqZbmbtUj1kNOXcb543e/reJsIrYW2/XtzJ22HUMz7ZgcdKqQ1XA8?=
 =?us-ascii?Q?fEqV9zX0Q8kPkEUxbzhlJd5gfOESBPFRUny2YBPnUjUzdhjzw9ei9vuVmLvR?=
 =?us-ascii?Q?B9+YEePpeWoGwHqveFgcq50vDm2szd2MRykBU5VoxZOhzgPK1s+XTyYjUVdk?=
 =?us-ascii?Q?G9Odz5vVmqSYhQ8aSJoSTiXZsRITuJp+A5aRJ3r6bfVeEE16TCNsegZ5/a2u?=
 =?us-ascii?Q?X5lnNAdMR4lYvl+FfiqFZlYhtwgC6iV40QbuA0XOtRZUs6CthpVH+tjsEG0S?=
 =?us-ascii?Q?NaEYPBzZ929Y63F5k+ZrcFm5VM4hVw2xw7nGJZ4hOcqC0DMFVFHavouYplb7?=
 =?us-ascii?Q?vgJlIXuQBVEmxGZNRVQxvA6X2doC4LGkCRtPr965N3ZEL3FKjdGQ5Mgiyg/+?=
 =?us-ascii?Q?e/aeEiR0mGDH4pS1t/mxKjqG0xo1bK7bAPvkkbm85aW9M+Sj1Lilkto3cwph?=
 =?us-ascii?Q?csHq2VVNgRNMG8hedOmEfXeM7dvNw2clWhT263TP53lrm6RtUnPF/Dt/VfOw?=
 =?us-ascii?Q?O5s97sgs3Q7PXUYcs/0VoSxB2FRZ5CZgGd1SLs+qTB4cbkfOzGyQMDCr/boh?=
 =?us-ascii?Q?TyTXWqJ5HNeDJHrGHYvcnuaJok3KutUqL7iAw/Afv9GavekTDOanRUd+w3bZ?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: fibocom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a90758e-17b9-46f3-2d43-08dda348a60b
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB5766.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:17:38.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 889bfe61-8c21-436b-bc07-3908050c8236
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ay6hT6JfdqjAHvz0I0JlaiRlBRWvKf4iIVA0WHuhEKYBfz+EqV/LDn8Swk9OzkwusPW8oKzF1TmqqvDkJQBRHy+19H50LZG7r9hIi8lMLNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB7740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_021751_807749_9B4FA88D 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20250604091722.DOMCrhgah-93MT-PDz3ps-KTazO2rXUH8htFJpFqdKI@z>

>On Tue, 20 May 2025 10:59:34 +0800 Jinjian Song wrote:
>>   If it's not feasible to directly add parameters for configuring this RX buffer(BAT/FAG) to 
>> the mtk_t7xx driver, would it be allowed to add aparameter for a default configuration 
>> ratio (1/2, 1/4)? Or is it not recommended to use driver parameters for mtk_t7xx driver.
>
>Looks into devlink params then
>

Hi Jakub,

The parameters are used by data plane to request RX DMA buffers for the entrire lifetime of
the driver, so it's best to determine them at the driver load time. Adjusting them after the
driver has been probed could introduce complex issues (e.g., the DMA buffers may already be
in use for communication when the parameters are changed. While devlink appears to support
parameter configuration via driver reload and runtime adjustment, both of these occur after
the driver has been probed, which doesn't seem very friendly to the overall logic.

Thanks.

Jinjian,
Best Regards.

