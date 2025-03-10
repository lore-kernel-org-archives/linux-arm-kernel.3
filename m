Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06C2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:Cc:To:From:Subject:Message-Id:Date:Content-Type:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGCEjNLk84A2mvz6bdof30fwKaKgjlROox6RtIQnx2g=; b=T7kUdC3vxce1YVi/1CXRfJ+Gs5
	Bc9QenE1OBlLgRgGxVToFoypRuePZMFtPcvom9Uvq7+jHiP0E5arWpSmXsoKQvL+dJbnlZFDmk2Ue
	KEZ2roVag5jRLyfoC7xwjdIAtJYIcd5M3x0XdzBk9fPxY/q66OLRNh7MNlPme1mBYbbxkdBuugUu+
	QEkFJ6reyLDbXeKZ8zL9UUWB9qa1WHt5yAsC2L1GrEpENdaT5v4mMDTathnP+pdsHA8QEiioyv4eY
	q5a2nYBLQhYQzRaVuXACYyNYBjlTgPg7SLxYMoY8L/NjvDVOJZKmrkb+U+iUriUD4uxn4HGLkC0Qn
	tRq3zLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trizp-00000003kcU-0DLt;
	Mon, 10 Mar 2025 19:41:05 +0000
Received: from mail-dm6nam11on20718.outbound.protection.outlook.com ([2a01:111:f403:2415::718] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triy0-00000003kR6-0g8x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 19:39:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5biTWJOHWad1Ksub+U7uDlQY9idfbXct5Yoy2Z13YelLZgcjb6F7PuRkEZJBUlp0qMFI3RVFdXZU+rlr4Z01ggyoHUxzRoZRJ5cKZ6wimTseELqRWE7opjRnsbSfrTUNNqVsFyzXpT+pwZQCZXH3IrnSAZpoINOKcDZPs6hUkhF2fdwrvvnR1vQyVB5U2wnnziMMz/edRiF9TO/9OAJyCsMpjfQn0xtW4ovrB/A+5qg/GYf3xMaBgWXO7mTwpZzmgKwI02YytQYWyRcaEPxN3NPYOdx82/2IruCwtZ2yvMQwBMQxdaB/vyT7KCviWjILnVX9nplp9k+yD9XId7iLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGCEjNLk84A2mvz6bdof30fwKaKgjlROox6RtIQnx2g=;
 b=v5wGQ8fCPGBM8wu3pvlCzXaexDKqAahd2CizN44YAGECmxPyn6dfFMBfEYFzQmfTVJUk8oAfLvm8PZt5hfJXMz0ySxMO4+BGEneXTjpf6i8RfM90TguELINyoD8jb3dGNH1TEXo0B88Uw217WDESugfBPBYeBBMq1cDpM03SohbxoeMeCt+FutLMvaPEujMvNO6+KkAxWE8ZGdN1E5Cz9wJFHr3+0kTYEcoJj7tP8MAff9krT4AzoCs5jVQ9i5SlLp3cRoJ0pygow7keyQxuNiM4jpG//23UK+PYo7+zzaM1TIr5cV5f9pwQeiDmwVxtziz2EsHBQqywi9bYrPmTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGCEjNLk84A2mvz6bdof30fwKaKgjlROox6RtIQnx2g=;
 b=HImhpGOWueFBYPsNXaXSGo/WOViCPIacBZAqkJGmR+mkr94XVngZiGMODIc6hqk8CZ/MODGmRfesoC+1B4hpbt0k2p8ufYcGRYAPpIJKbM8NBd7TqaTN1fxJXTfB6QL7ePIpG82wjnbmUw3chsr9RYlu3n0pfQWtViIg+TPeczE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from CH0PR14MB7306.namprd14.prod.outlook.com (2603:10b6:610:186::18)
 by DM6PR14MB3551.namprd14.prod.outlook.com (2603:10b6:5:1ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 19:39:06 +0000
Received: from CH0PR14MB7306.namprd14.prod.outlook.com
 ([fe80::8bfa:1131:30b1:9295]) by CH0PR14MB7306.namprd14.prod.outlook.com
 ([fe80::8bfa:1131:30b1:9295%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 19:39:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Mar 2025 15:39:02 -0400
Message-Id: <D8CU9UT1XQV9.3NFZ4OAQOKQG0@d3embedded.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, "Abel Vesa" <abel.vesa@linaro.org>, "Achath
 Vaishnav" <vaishnav.a@ti.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Ard Biesheuvel"
 <ardb@kernel.org>, "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Bjorn Andersson"
 <quic_bjorande@quicinc.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
 <20250213101903.GH5888@pendragon.ideasonboard.com>
In-Reply-To: <20250213101903.GH5888@pendragon.ideasonboard.com>
X-ClientProxiedBy: MN0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:208:52c::12) To CH0PR14MB7306.namprd14.prod.outlook.com
 (2603:10b6:610:186::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR14MB7306:EE_|DM6PR14MB3551:EE_
X-MS-Office365-Filtering-Correlation-Id: 05416320-21ce-4386-822d-08dd600b37ef
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ty9EM2lVRVNKWVE1a09zc0RrTDRFTG8yOGxBUVBsaEFGNmhnTzhVeVZqRTZC?=
 =?utf-8?B?ckJ4eCtSZGpnL1JjRnI3WGNpTFVXVGVTTkRMbXhaOWN6TSt1ZmFhZFVkYlRY?=
 =?utf-8?B?ZGpiQ2hwLzdqbG9CdTAyWlRYVzV5WS9TNGkzUXluZzh3a1BjTGg2bzNKR2g0?=
 =?utf-8?B?Znh0SW15R1pJK04rUHNKTC9ZSXVSSU51TWNFaHNmUWRMM1N5SExwbmV1cUFu?=
 =?utf-8?B?a21CUGpMYnFyNlJLaGNKUmltaVorOW9LL3IrTUVWVzVBS2xaY3V5N0NKd1Qy?=
 =?utf-8?B?Nm9vMkp0QldPUDM1WWx1Zm1USllVWFBrTjFpT3RVdHY1TXp6enpiQzBGUzFZ?=
 =?utf-8?B?NDJna01XSDQwT3ZjVlVzRUw5dGd0OVBFeGVsOG1SSFJjVHVDcHJVcERuZGU3?=
 =?utf-8?B?aXN5NWhCeFgvRmM4Z3E3ZWVieU0yaWNqVVpPMVlwOExadmt5UXorUkRnUStL?=
 =?utf-8?B?dlRkZW1yNHNDanhyeWFVcWR5Znk1empMS05LLzh2QWNOay9YRjluL2UxRU0r?=
 =?utf-8?B?Rm5ibEI2RFdZUStCSXZJNFcvNnU4c3diU0tZR2ViMmFGclpETEt2b3JiU2JC?=
 =?utf-8?B?MGF5VE9yK3NYdDJ2VEpZV2w0b05SWk9RcWRxbDhyYmVGOHRkeS9jaWR4OXM3?=
 =?utf-8?B?MzlNZGdLcE5NL0U2SWkxdS9MQXh2MnZYMzdJd3BMbVBaY2htSml1ZDk0cXAz?=
 =?utf-8?B?TG5odjlpUXV2R3BIWlc4amF2RUxwVFJxY2p1SDlIR0V3eUZlRU0yZFVBSUVD?=
 =?utf-8?B?R3IrRldrZlhuNXl5eG8wa2J5eFIvcnFjRHdxWVoyamxIaDNwS0pBZnRTTHVz?=
 =?utf-8?B?R3RwSEpsRU1GR0U4eHBZeTdlVm9QSXBFVmFTeFZ4RzVCQmZlUEFaV3hzMjh2?=
 =?utf-8?B?aFdKUEc4MEVtdHhDbzhPNzlLaU5hblFxNU9Md3F2VFVhUGNuQU4zZDlIdnhk?=
 =?utf-8?B?RXlZa3ZMK2R2SVQwRDNSUzhZUFNJTWU5MVkvVGlwVWw3UFh5bkVIVVBGdFpp?=
 =?utf-8?B?c2xaUEJhWlVRZlh5dGV6cjhQTWxUMEJ3VE85WGZ4QS8zb2NicWRPMmpXWUQv?=
 =?utf-8?B?U2tpb1hXNzhHUUEzRk5OQnA0SE8zYmRwaUhFeWdEd0haT01wamw4cHFCTWpo?=
 =?utf-8?B?aG1zQ1E1cXZkZVN3QU4zYUV4WjFxZU5IY05wS1g1cVpQSFlIY2hpaVFnNHV6?=
 =?utf-8?B?NkRQVGFFcFNnWUxhWjM0MWI3QVpXTTNWaElsTVpmd0tEK1ZzMkhBVHNIU0J1?=
 =?utf-8?B?Zi96WC9neXQ2R2FBQzhwcHUyamJBWXpaWFRtQzh3OVNHV0pDM01tOEdTZlFK?=
 =?utf-8?B?aW16ME4rY0hXU05FZ1hNMnNpalhqZmJhcVZ0bGVyWTdFMjNrdE9YUGNCTjl6?=
 =?utf-8?B?Vll5d1dFY1gzRDE1cWNBMTI5c1E4RmJVVjkza29rMHFLU2p1Qy85THNlWkcr?=
 =?utf-8?B?aXR3aStUMkJoZkQ1QlBGeEt4ZGU4Y0xNVmJrSmp3M1pTb3RCVnlOOEdSWnds?=
 =?utf-8?B?cWtyVVB4cmFQNzNibUd3bDFXT0M1RVJqZ2hzWno2clZWN20rRE5PcCsrQ2pk?=
 =?utf-8?B?MTJ5LytFVkdvRm05RDkyZ3J2MThtRC9lZTBZRDlnRzQ0MCt4MGFsTEdwbnpx?=
 =?utf-8?B?M01RcjJpTXlqZHBDSnYyNkg0bWliU3JXOGg4MkpzUDFXLzJudnZxeUdWb3FK?=
 =?utf-8?B?NFgzMWQ1cWdZMjNwUkNDQTg2UTVzU1ZyOVAwLzhIbzFoeXpEazU4NDZESi9W?=
 =?utf-8?B?aFlCdGdrRVFIR3JteFB4cXRSQlRlZ3ZoN3BaOHQwemI4TGZpRm56b3d0RFF2?=
 =?utf-8?B?Vm9FMWdVSmJRdmt5VXdIT2U4ekl4cDRrSnQzNjhTbVFJeFBPT0ZSTG1MMHlH?=
 =?utf-8?Q?xWQrual/MPI8e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR14MB7306.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWJ3MlJzY2VBbTVqR0laai91U29WUWd1blFJUEZyMTJLd1NMN1BuUWtrR2RW?=
 =?utf-8?B?UEg1N0NLZ1FtajVaYVlKSWlvYmlER2xRMFVZZFcwS2VoRjVaQitWRTdEenM2?=
 =?utf-8?B?azRCRWpOdG5uWmVNVVdPSjFYYVVtZEpuN1BYRnJWb1ptTTJmSE02b1ljclQ1?=
 =?utf-8?B?T3hzaC9xODhOYjRSejZkTElOa3dwUEpzMlB3YTdzYkhmY0xiOWNBYmszUCtY?=
 =?utf-8?B?QTQreTY5RGZuQ29rWUFyRTZQZVJWZ1c1RFlxS1piTjBUcUJPMUpIRm44bFg0?=
 =?utf-8?B?cHM3WmdSY0xtWURTL1d2cktVZ2NBcDdQd1YzRXp5ZlNTNVhEeGFsTG5qWHpW?=
 =?utf-8?B?NnFwanJOT29oYm1jQmhabVpRUFFSLzRSdDVCWWYwSU5CK2Q0WTBDNUZaTndh?=
 =?utf-8?B?MlJiZFpWL1BTUUQ5RGV4bHloc1RZb1d3OURTOG9UaUxIenZJeHRWOTFrYUtm?=
 =?utf-8?B?SWtoRDlhcGtDUDBLaVl5ZWZHTlZLRGRzOEloRnREdU5VQUs3YWl1Q0NnaXRQ?=
 =?utf-8?B?M2xoUDVCOWlsKyt6NTZWSWdhODBGRzVlakY2VldscWVwaklZbkR5amdyN0hh?=
 =?utf-8?B?blNLRE90MTA1dUc1UEZEZGE0bjh6UGF5Qy9mRUt1bUFBZmVzRmwrYVI5RjQy?=
 =?utf-8?B?ZzlkOHNOajRGZEpNNThWOWZycXRTMDg4MmFORkFHc2x5WUR3OHpkbEM1Nisy?=
 =?utf-8?B?eElubDhGMUpsWkpIQVBQOU1yTWxGN0FiVmpRcW9JTXRIbGs2ejdDZlNsYkNH?=
 =?utf-8?B?L3AvcVUrNXlEaEVLSE9IUkFDVjh3TmV5N2l2NG5iRUFaTExoMTJzd1BtbTYw?=
 =?utf-8?B?UTNFeitYemFBWEcvVTdtbE4vZkd5cjJJcWowbStIYXhHZGpIeE1wZU1XWU51?=
 =?utf-8?B?K0dheXIxNmV2U1k5bW4yd3duS0ZhRmY4MWw3SUt2SUhBbnNOVkxFZ3NtaDZN?=
 =?utf-8?B?V1E5L2xnRENFNlJNMWZKbmhtbFIrdGhjcEhOVjBNb2wzb1hpTWRGZFlzNTZU?=
 =?utf-8?B?Sjl1WXA4WDhvVjg1azZCQ09lNHR1UTJzMFc3MFpuRVdrbElJQ2c1SzFibzlD?=
 =?utf-8?B?aEgvUy8zMXdNNnBTRkQzcjl2QmhWaWQzTlNQcEtEQWlNSkw5bGNTOHFRM29a?=
 =?utf-8?B?WGM5VHpndGxYTVNTeDc5dGVSSVdyaUVEN29hS1lqaVdEdmJvdHo0SGNDRlQ3?=
 =?utf-8?B?SUV2bzFxbXlPbGo4V3RnM1FOZ3k0c1p5dDNmamVqSkZjT3dtT3NLU1FXV1RL?=
 =?utf-8?B?WmN6Snp6dHR4c2YwaUwyZldHOW1uTmpkRFFvZVdzak0xRFV1akdBOGt3cFNO?=
 =?utf-8?B?dXU5djRnbElMNndSbDdRcUZYNEd3cTZ3aytLK1pOWVdkcVlxbnZkUzNxSUth?=
 =?utf-8?B?OWIza0d2cG90bGltMkIrYkc5bFJkbjZXOHpLR2dMUjBDUWZlb1djS3BpbFlH?=
 =?utf-8?B?UXZBdnRSd3IrUldmcTVGYStBKzU3c0ZJUmFxK3ZKeHl5QTlDOUZxdjArTEdn?=
 =?utf-8?B?cE4zSGJmcVNwMFRWQkFMTWo4ZjVidHRzUEF2bThaQnpRbFNCYUJQM0JKckw2?=
 =?utf-8?B?bFAwVit2QUQvek5sRFRFUTVJT0Mya1lhcFhnVHlNVlFEL1IvM1F4SEw4M1hY?=
 =?utf-8?B?a1QxSk10U2Jnb0cxbFlQTEQvelV0VHFCQ3VBbVc3eTlEcDdmd25YVmZRQ3Ru?=
 =?utf-8?B?b3pEMG1hQ09pVkNGQThlVUR2RjMvTjkranFDOFgvb09vcXVlSUw1Tzh5eG9t?=
 =?utf-8?B?YmxRa0NVazcreDZ3MGRrMjVwVmpObFNSY05KeGhyUGkxaUVELzhSWUVBQksy?=
 =?utf-8?B?SWl3OUlvejhocnRVc2R2NkFSYU9LVlFWUjlZZVRNbExvT0E1RFRPTU9kenZs?=
 =?utf-8?B?U3FGbGFJT280NmVHWEdtOVhCMG5hSCtudmk3UUdYTllmdzJZSlpjRWgzb1Q0?=
 =?utf-8?B?a003VnhUajY0am1TSHF3Vzk5UFNhZjJzK0JramxabTVxbUhjYmJId3k0QWZ3?=
 =?utf-8?B?bUZzY3FlaHVacWVwU3hpSk5raWVldVgrM29uU2VxQU43NmJ1ZnRrNW5xT2JO?=
 =?utf-8?B?V3hZYTc5ekVqUEF5dHpDanBUeUNsMS9GUGhlbFg5Q0I1NHFNaGR3V2NVS0Rr?=
 =?utf-8?B?SkxrLzVoc2w1MnM1czkxdHUvY3IvLytOaEdGK3BrK1dJdTFrUDlhUjd5N2lK?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05416320-21ce-4386-822d-08dd600b37ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR14MB7306.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 19:39:05.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02V/J2U2NjCRsFl95w5572EugtHQGgtMbpjdrRxoJuqO/lKhx2x9FuKD+xBcjg7Pw9jLPpcRjH02XWELd074xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR14MB3551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_123912_196256_16D3B4F5 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu Feb 13, 2025 at 5:19 AM EST, Laurent Pinchart wrote:
>
> ...
>
>> +static const struct cci_reg_sequence imx728_wdr_12bit_3856x2176[] =3D {
>
> This table is way too big, with over 8000 entries. Some are even
> duplicated, with identical or different values for the same register. It
> will take more than a second at 400kHz to program this.
>
> At the very least I would expect a way to compact the table and make use
> of I2C register address auto-increment. Default power-up values should
> also likely be just dropped.
>
> I haven't checked in details, but doesn't this table also contain tuning
> data for your specific camera ?
>

In my testing, it takes around two seconds to write this table to the senso=
r.

I can investigate how to condense the table further, though the
registers for this sensor are more complex than just writing values to
addresses. The meaning of certain address writes depend on previous
writes -- thus the "duplicated" writes you mentioned.

I do not believe this table contains tuning information for our camera
module in particular.

> [snip]
>
>> +};
>
> [snip]
>
>> +static int imx728_get_frame_interval(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *sd_state,
>> +                                    struct v4l2_subdev_frame_interval *=
fi)
>> +{
>> +       struct imx728 *imx728 =3D to_imx728(sd);
>> +
>> +       fi->interval.numerator =3D 1;
>> +       fi->interval.denominator =3D imx728->fps;
>> +       return 0;
>> +}
>> +
>> +static int imx728_set_frame_interval(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *sd_state,
>> +                                    struct v4l2_subdev_frame_interval *=
fi)
>> +{
>> +       struct imx728 *imx728 =3D to_imx728(sd);
>> +       u32 req_fps;
>> +
>> +       mutex_lock(&imx728->lock);
>> +
>> +       if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator =
=3D=3D 0) {
>> +               fi->interval.denominator =3D IMX728_FRAMERATE_DEFAULT;
>> +               fi->interval.numerator =3D 1;
>> +       }
>> +
>> +       req_fps =3D clamp_val(DIV_ROUND_CLOSEST(fi->interval.denominator=
,
>> +                                             fi->interval.numerator),
>> +                           IMX728_FRAMERATE_MIN, IMX728_FRAMERATE_MAX);
>> +
>> +       fi->interval.numerator =3D 1;
>> +       fi->interval.denominator =3D req_fps;
>> +
>> +       imx728->fps =3D req_fps;
>> +
>> +       mutex_unlock(&imx728->lock);
>> +       dev_dbg(imx728->dev, "%s frame rate =3D %d\n", __func__, imx728-=
>fps);
>> +
>> +       return 0;
>> +}
>
> The frame rate on raw sensors is controlled through h/v blanking. You
> can drop thse functions, especially given that imx728->fps isn't used
> anywhere else.

Okay, I will drop these functions in v4. Thanks.

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

