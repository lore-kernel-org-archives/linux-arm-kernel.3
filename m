Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85193C56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc/GV3b4mxA+P7H796YrbPibV07TVwvbBw2380YVMHw=; b=HKXq5hNlxOPZxuxxI7CXxKfcip
	IoyRyzX/TunvJBTA3afTVUs0p8N+Hu+2gBkHYwIw11gdUukPRtCXjTXrQb5rY3NlCTJ8SHDlRXpJC
	EgJTXq+cdcNxyNMOq48xXVttlGuQnJLWA8FnHW6SNyJZ8DAMt909V5EO//usHDOF2q/aGaOPJ80Ka
	NTH+A4z1an8BlWO4hFX1gT1lGXMkR6IN2cfdM8wdw6xz7emmh7z6VfsYYvt6BfbfVoUlVIKyX6W3B
	gk5txM+nqpFoCthNxiF6XJa75HQjpVXSniYUcD4m19Ms3+xJoFw42V1Pfm1Csrd/Bj0lwp2eUqRbm
	xn5diYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRTO-0000000Entk-2cPt;
	Fri, 20 Feb 2026 14:27:14 +0000
Received: from mail-westeuropeazon11010018.outbound.protection.outlook.com ([52.101.69.18] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRTL-0000000Ensb-2gjB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:27:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OYsXausTve0l0YPJmGRK/Cn+CfbJLPzWkjRHIoguyHzn/MpuwzT179n3QCVMk1RahEijupaYu+eraIyEUBbO78BJo2JJOdM9/xZN9XuW09PVcn7w9WbCDeNZpn/kqOw0tSNkJB7A0u2jgICu9XMfjAV2wzWh/GSu3yPKTN4vwQ9+NF32Xm2KdiwvUWby7knOxUIF+THOduVRJfI7oGtV5ZdHyRqtgbRjRwx8tLkq196Ldv2i+RKppzopb7Anu5Ns/p6XyWO0swngYjkeLydzt/xl1i2kqNH5Wk67gwe6CMqGuNWguZ72LEHEGsE5WuNsp/O8hCFzjf0gBkCHyKicYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc/GV3b4mxA+P7H796YrbPibV07TVwvbBw2380YVMHw=;
 b=ffIdvBg6oeuVFBCDZ8nBb2OVuGsP4Y/BKfqmLW/LtSeTf1sibDIGw6bVoKDXgmgGJzyx3/Aawke8hX20Cs20fVwUtluxiveFGVDdtcQFRcOZ0YSzP1snz0WtQTvOhc2YliOxMWmuUd+vK5TcquOxB6kHZ847fOSPMIlL12PZBNXq+32mj5fYtc5CgIEQkz3bsSMe7hKOC3/Q0AGRkSpOnGfwnqpDfuG/58lrkswmm2pJqBXiQyYdIUz661Q96aqiInxkE9n1V9LNQxqI5FyWtmuLL+wfPMrhBxfLnLB0/uS9D8jBABDq8dPPPuCNG5GPMyVPBCRzm/YfARPQ4qwsnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc/GV3b4mxA+P7H796YrbPibV07TVwvbBw2380YVMHw=;
 b=V/0ysiI+WOKL1DSzQrlhswScxYgJ6PaPbB7cuzAe4qEb7XDrgBpuf/mpyNvxY6QvCMocw30YViGkPXceIbzCaN523ZC6qltklOwNnpRSqr2vlqCwKlmcvniCPnorjMo9mKVMWvMO8q5oNe6O+btTk/uak/6Vs38KvssK7NYbg4c=
Received: from DU7P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::9) by
 AS4PR08MB7879.eurprd08.prod.outlook.com (2603:10a6:20b:51e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 14:27:04 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::a6) by DU7P195CA0002.outlook.office365.com
 (2603:10a6:10:54d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 14:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 14:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiIU07+IvMkqmwRQVokqJcmbuTBvDJJCx9vpOWWqWiy+G5aKqdRmNr/EzRvZn9skStAACXbGUAqRCIqz3wpB7nZXATPuoGgWhzw7yEr4GAGFGmbN3SLU+/ql80UGVetf8Sk7HrwAd6g1WC7iIYUt5sJdjqfnjbd/3rAc21UlAovuAvXdxbvACtsziJpqzNTfoMTKKsDrGNEJqd2j1sMDBvE8puCpcu7nUAQfGeD7fLd6XwPdi9Vx6QlvWQVq8g+Mlq1jk9I0gWOPGa7l4/Qb8VD2n5qAzqANHl+fNhU9lrXwWXYPjITLi6rOfNxqtxuuvHw0jsMhk8y6/ag7g9HaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc/GV3b4mxA+P7H796YrbPibV07TVwvbBw2380YVMHw=;
 b=NADkwJ6B2EDt1AwtRWnNRsdUfAoxCLdBi5Xt8/wTClmSrXYnZ8uzPrZ79NwGB4R2jZsPZeHLSshd7UerAfEV5vJGVQvSLq3R2Kluz2eFDYxR3q0ecM1MNZlHruf7+ZblsGcHwQc9yNFmJmgL4ZkwjEoX3Jo6R4dIDzeEfT2/21QB33r6zQTjE83FR3bhz/TT94C5IaNGs4XAaAc/o8gsJSVu0FwrN23OdkbUgO6cjyjBXPrdGfFL9xKaOPBkaxuU0ssMRBcVCYN/fJ1T5Fa1EcxjvISTMf7xf7J6qhtXoeX9g/GOCahUk1E8Xk3iiABEEYkB3EXgcm5PXU0m8pZDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc/GV3b4mxA+P7H796YrbPibV07TVwvbBw2380YVMHw=;
 b=V/0ysiI+WOKL1DSzQrlhswScxYgJ6PaPbB7cuzAe4qEb7XDrgBpuf/mpyNvxY6QvCMocw30YViGkPXceIbzCaN523ZC6qltklOwNnpRSqr2vlqCwKlmcvniCPnorjMo9mKVMWvMO8q5oNe6O+btTk/uak/6Vs38KvssK7NYbg4c=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by GV2PR08MB9160.eurprd08.prod.outlook.com (2603:10a6:150:e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:25:58 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:25:58 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tingwei Zhang <quic_tingwei@quicinc.com>, Yingchao Deng
	<yingchao.deng@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH 6/8] coresight: cti: Remove hw_powered flag
Thread-Topic: [PATCH 6/8] coresight: cti: Remove hw_powered flag
Thread-Index: AQHcme4nSyzLxycdfE+pr1R6gqyvIbWLtZ9w
Date: Fri, 20 Feb 2026 14:25:57 +0000
Message-ID: <PAVPR08MB9674796955152629879C77948C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-6-db71ab4d200b@arm.com>
In-Reply-To: <20260209-arm_coresight_cti_refactor_v1-v1-6-db71ab4d200b@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|GV2PR08MB9160:EE_|DU6PEPF0000B622:EE_|AS4PR08MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba961e9-9dc3-498e-ce41-08de708c1e4f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bzRUTlRhSFdhMmVkVmllbGxoVGwxbEZ6TEhSTmpxYVRuN3F1ejRXSmUxZEN3?=
 =?utf-8?B?cEt0N1FBODBBN1BHK0tZa3N3QWV2a0hhTzZxVnVFZTV6a29mb1JmdHRGSkh3?=
 =?utf-8?B?LzA5eS9wZFJZa0djeGxRM3MzM3luZkJ4aUc1ZnliYVBnOVJoZy9aQjR2Q2FZ?=
 =?utf-8?B?U2dLRlRBUXdmYWFUWHp0MmgyTDBBQzZGS2VZblhYN2ZUbEZhOHVheDhIWVIv?=
 =?utf-8?B?Z2lZZmdoRGg0T2FJR0EwR2hlMTkwc1hqLzh1cHBCMjlGY00vZWVNdnhaY2x2?=
 =?utf-8?B?R2I1RVJMRk1JT3ZHRzFJZlNibTlPVmFxVFZZRXdwMEUzUnJYSEVwY2QweWVr?=
 =?utf-8?B?SU5BQUxDRm9mQjFxaUZyYm43ZEhpWXIwQU9hdlFKRXIwVHZUY1dFWDJUMWww?=
 =?utf-8?B?OTZLMlRic1djeVhPdzQ2eDZqVjBsYW5rc0pKSG5XQ3BMNE9ud0RiWjFrc21B?=
 =?utf-8?B?UlFBUU9lNnFMaHo1ZG1XcU1KRXBVa09GTjFQVEJqeDgvYnF0UmdRREFkcE1p?=
 =?utf-8?B?VzVyQnR6RUIxTEN1M1Y3ak5QTUxtY256NU5jQ3R1aVJyNkIxbVNnRlY4VVhV?=
 =?utf-8?B?SW9xR25QY0lRU2YzdzJNN1p5Rk1adm0reWY1RG9iRmNKK3NPUzJPb015UnRa?=
 =?utf-8?B?QlpHajVZc0xlYTROYXk5OFdZc2gzRnQ1bU91YTVvZEZDdzdYZm9jTUEvOWhX?=
 =?utf-8?B?MG8vKzQ1a0xsOFhYV2o0bFB4T2MvLzNTSGFaMVZhQ3YzaVppNXUrMHFzV2ZY?=
 =?utf-8?B?c3Y5aHNVY1V4TC84VERvYk9kVkswR0tqRHNMcG1BQmhqRmVwbFM5a1cwSFdh?=
 =?utf-8?B?UjU3NnpYVDVPM2RoZjhUdUpmRzIyY1l2UFV3UkZvd251dm5IT2paMklaaWQv?=
 =?utf-8?B?a3JwQWJCdzRDNWdaZFRNUUxDbmp5bkZNdmR2V0JSbWxRczBFK1VjeWx5TWxj?=
 =?utf-8?B?YXdSSk5JNDFHcmg0OGRKNDNoQlBaS3hJMUdsTHVDWDBpU1NzL1pRQTFLWGF4?=
 =?utf-8?B?SDdnd1hGeHN0ZXRrcHJnSnVBK1dVSVpqTmx6RDRxd0NNY2VEaXlZZkxuaG9U?=
 =?utf-8?B?YnREQW1ZajNxOWhHOFZJZnY1ZkQ3RHVqencwaUZpYUxBcFd2WW1ldFk3Qm1a?=
 =?utf-8?B?ZEtDS2tsb3R3WWVMOVZzbjFSZjlnSHdNNXkrVnlyYkJRcmpuRGZ5Q0ozc2o5?=
 =?utf-8?B?emN0SzV6Z0NpWlc1czZ2Tlh2NnZyWE1Xd29ISUtJUGltMkFRMEhUUTVVbFZi?=
 =?utf-8?B?SmhmS1B6ZytVM3RhZkpOYVR1eGh3SDdJTHU0YVZ6YWw5WXpkRi9JQkladmtJ?=
 =?utf-8?B?TytJRFdES285cVBHdGV1ZllRdUZqaE40b3I2VVp5U1Y1TlFLTWJ3enVqaTBM?=
 =?utf-8?B?dmUwZXN5ZTZ4Q3NJYUZRZDR3TFdVZFRYcDRvWXZpWEI2dC94V1VCUTJPTXk3?=
 =?utf-8?B?NFUrVS8yb3FadlBTK0VrUHlrR2o3UjlHMkNmdGJST3BlSnNESW9lT0tYZWtX?=
 =?utf-8?B?bzRHRnZGczhsRGpiZU1ZVklOUUhCWFE3bjVXREhtZVBvTXZNeUNGdDYrWStI?=
 =?utf-8?B?Zi93cGVvWXRZTkJNOWo5bGRRYmVEQ2g4TURucVpMcTRGZ2ZoV2FtdFRhdVdL?=
 =?utf-8?B?aXUyQ2dSRWhBV2duSWF0WFhHeng5ZDlvZ0ZNVUR0aHhpbXN1aWZGYWRFNFMv?=
 =?utf-8?B?Mk5tRGJPVTh4WUlvTmJDcVJINnNmWHk5citZN0EwL0tYWllsWHpzWENQRzBu?=
 =?utf-8?B?T1BkejIvV1lPOURMTWZ0VzhJanBncXlOZWRGeUo1MzNkRHkrTHdiVkhJeGY0?=
 =?utf-8?B?bnArMHhVWm9uQzE0aWVMcU15bDJXeVhlM0U2cndQVUt5Qm5ISWhUVWIydUcv?=
 =?utf-8?B?aU1YWVZRdzh6b1JQMm13Sy9NSlA4c0JtVFFyaUt0QTdvWDk0UW05clViWHdF?=
 =?utf-8?B?amJRQkMvSWVEQ05veUcydjRXZjdnR3ZKTHVObXUxN1hUVzdaeExRSEtDdGZP?=
 =?utf-8?B?dFBTUTExTUc1Y0JSdU5SSndDYmhXbVY1RmVuenhIOUZMZDhFbmQvRkgzR2Jk?=
 =?utf-8?B?VkRLV2RxNnJOaEl0TmFGcWdIUnZBNzdBZGxQN2hhWUluVUtBZWltK3h3c2xj?=
 =?utf-8?B?bDZCVnlqSVkyT3dwT3laaFYvNUUwL1FTeEFBQlhZT0Y3cFNXUDZMVW5mU0tT?=
 =?utf-8?Q?ls788OOKfHBorRnpefqE7qU=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9160
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9b432001-e46f-4d8a-3325-08de708bf6fc
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|36860700013|14060799003|82310400026|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXI2amhDMEwrcnJBVmt5cjArNlJqMUpFUGdnU1RSUHNNUUNZQW94SFlLdFFT?=
 =?utf-8?B?WUJpUG9RUzVmTmNWSTVYYzRnczBzTWhQcTIxZERqZEtwSStLaEtMMDRxMFpC?=
 =?utf-8?B?bEh3YkhNZzN3Sm1FbFIvdHMrZHhlbWdEeitaT3g3ektZMU5nRWZ5SXFqT2dH?=
 =?utf-8?B?QWtIUldQVENoU0xhSUk0MXE0TmwrSHBkWGtyQUg2SHh4YUtrclVISTR4bWVC?=
 =?utf-8?B?SWFadFk1UExNVzVzbEJNdXZEMDNxeDF1Qm0ySmdBNVBTQnAyNG84VUh6SjNR?=
 =?utf-8?B?NmxJbDY2ZjZFNDVKRHpLMWxwYW8zWFVYUFg3SDhIQ2x3QXBlM2tzaEIwbFlo?=
 =?utf-8?B?b3RidTR3VW9CVmRlbER6S1UrL2NvZXZEa25aWTQraUN5NmcvNUdtamRKK3pN?=
 =?utf-8?B?Ti91TEZUNkVJaUFEa1owNmxTK3Z5RGZHZXRVK2ZYeThkVy9EaDQrbzdqQkxj?=
 =?utf-8?B?Q1VHV2dYZ0xuQ1F4OXlkVUlnb0Z4MjFRSlN5bm5Va250ajd3VUl5QTJmQjNH?=
 =?utf-8?B?ZFVsT0NWVWU4L1JtU1lwSUhvaHg4d1c2QmtYb1ZzRFZDZVBiYUNNQ3NsTXVs?=
 =?utf-8?B?N3locVVPREIvV0Z5TjZRSkdwaHJiS1R0a2plZE4wOVFSbFB0WTg5Yk5QQUJx?=
 =?utf-8?B?cS9pTGZaUS92ak1pMm5DNFB1YmNIRnpxSUNydFpaNFZFbnVtU0ovaDhCY0lV?=
 =?utf-8?B?blYyRDdUQ0dLV2RaSWQzVE9HK0FCbEx5VGpKOHlVSWNlcTQ5bUN6T1orckNB?=
 =?utf-8?B?WVpvUUcyRXV6ejdwK3o5TS9wK1hVcHF6Q0NQRUcrUVVTMGRrOXFUY0JnYk01?=
 =?utf-8?B?c21rUFVLV0tTNFJ2MDdVank2ZnVaQmk3Zmtyd0o1VTYwOExFYXAweE1YbmFT?=
 =?utf-8?B?T2VzU2RPSXd5WEFha251Y0pVaG1STTJFVWdoWlBNV1Z3UWZRc0ppdFZMVTZx?=
 =?utf-8?B?U290ZlR3OVY3K0FjK2JVMVNxdnZOeEIzVVVmWXhRSXUrTEQ2QVI5T2xPR0tO?=
 =?utf-8?B?KzNsY0hOcnEzSlE3ay9keHh4YktyU3ZQV2I5T0xrRXFQT0dyYTE1RWNKdHRh?=
 =?utf-8?B?bE1zdDVYVk9kN1U2aWhLNUxJZ25jdktlN3hvKzMra3BERS83ZnRuM0N1Sm1M?=
 =?utf-8?B?NUhKWXBvY3AyeGlLZUhmZzNvNUs3VHVqZjJ0QW9rak42Vnl3SEhFY0R2U09j?=
 =?utf-8?B?RmVwSm5QYktTNWhqdUorSWlRWVpRekFUTnl5WExoblZWbDVZd3RIcWFDblUy?=
 =?utf-8?B?aTFCcE5pdEIybTc1aDcxZjlnWFZtUEZ6M3haMGNnS3JBZkpVVGFtTkRkWDUw?=
 =?utf-8?B?OVFJbzZ2TTZDd1NrRXZUWTY5d25vQ1hpZWIrVnZzMmx5WS82VGZrNWJoSzZE?=
 =?utf-8?B?YzIyV2JKNG00S0tFSUZ1MXp5R3BqT2pDQm9BMGpLWU01eUh6MURnaERTdjJE?=
 =?utf-8?B?ZHViM21heGVvYnFEejVuVWp0UGh1UEY0RkpIWGRnT3NwbFB6MEkwK001SG80?=
 =?utf-8?B?bmdJVWlYSzRSVERlWmR3QUZ4cTF3ZjlFMmpmbTJrK3dTMFkxSERGNEJEQWRF?=
 =?utf-8?B?ZWx0VFFYRmtsZWwrZVpCbVlRRjlxbm8zWGpRa0RKMG5oWTBFY2tWNTFraS9h?=
 =?utf-8?B?eW05aTVxUHQ3SGg3ejFrQ0dVODFRdHVXdUJzZlpIWFBNcXpERk1pMDhzWHRI?=
 =?utf-8?B?TlFxNy9XSUJYNUx2WkZmUGt2enQ1djFGKzhMUjhhOCtRd3MwWk9LSitZNXRi?=
 =?utf-8?B?YnViVXZXRTVEWCtnM0VxVElJM1U4MnR1RFNxSzFvZUtnVitIdk1mTldrRkZr?=
 =?utf-8?B?d3hOdUtaTE9SVlRRZmZPOEUvcWUyZ2cra2s3MXM3ejVWaW1seFlsb3RzK2lz?=
 =?utf-8?B?MUNyM0JDTHZUbVNnOVlyNWprbzR4K3pMQzNnRHFITEhYYXJDd0VoN05ZR25Y?=
 =?utf-8?B?cndiL1dNRU11N21PL0xianQyZEJ6dWhGRGVYN2o5Z3Ivcnc5bm5JNjArTTRj?=
 =?utf-8?B?NXV1WS9DMnQzU0IrNUZmMzgwbzQybkx3Q2JQdmQwS0YzcFd5WFYzN0laVjh1?=
 =?utf-8?B?QXRISlpieTBpT0pwcWhUQzI5RkRyRmtmcm5LQTRBdytTVGVpS3dHWkNNNXBt?=
 =?utf-8?B?cHIzbWFyNE1TUTZ6YTRuWmxnaGduZXlCR2d4eHJYUTYzb2xLTmNtSGpTcmIv?=
 =?utf-8?B?TEZwdFFRenNjYU5FZFpmeXU5L1JEVUd3WVJ6SXFFK21zZ2luZEpyOERLeGhN?=
 =?utf-8?B?YitxbVBSR25kd2w5RFlDaUx3L0tBPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(14060799003)(82310400026)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H1Ec2XyTROTr/r/i+bDByCwfv9DuK9psaz7MRdgzipFkpjsesBo9urNAnPWVSvcrqbDKXJTGMk6CS44h9BOPpEadPhDbnZM11LbXptQ6vrknP//I7SXnXgMYAa6FQMqeiexFadWonAWgrtdu/LQ+KdsDzI8rxSgmOga8BWDybyA8hNZrPl2eh9QHMNVHgy0tbVTQt5UKzYKvSHA4JNHPxQB1Tja72z5Yx9hkTUAm3Zy+VuY3Fu9++xSFVvwG024sJ7L9UNo0nSgABkVnWXwqd2hWwlwdDWJ7VlhIvAwtAlk03m81A04tJaYouPEs9B+/AwjrcuxWBnmczBs+Wf94uNBoOueAvSXCVPDG5wCOZ/TuBwvU0I/6gbPqW/2fGbPGr/57aEc0hbwQa9PeqeXLQCsX19gbtEnPhgVBMeq4fb/d9c55k9x4v4xTdskbGVNJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:27:03.8380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba961e9-9dc3-498e-ce41-08de708c1e4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_062711_888353_F241D86E 
X-CRM114-Status: UNSURE (   5.64  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvIFlhbiA8bGVvLnlh
bkBhcm0uY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDksIDIwMjYgNjowMSBQTQ0KPiBU
bzogU3V6dWtpIFBvdWxvc2UgPFN1enVraS5Qb3Vsb3NlQGFybS5jb20+OyBNaWtlIExlYWNoDQo+
IDxNaWtlLkxlYWNoQGFybS5jb20+OyBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJvLm9y
Zz47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVs
LmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
OyBNYXRoaWV1IFBvaXJpZXINCj4gPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgVGluZ3dl
aSBaaGFuZyA8cXVpY190aW5nd2VpQHF1aWNpbmMuY29tPjsNCj4gWWluZ2NoYW8gRGVuZyA8eWlu
Z2NoYW8uZGVuZ0Bvc3MucXVhbGNvbW0uY29tPjsgSmllIEdhbg0KPiA8amllLmdhbkBvc3MucXVh
bGNvbW0uY29tPg0KPiBDYzogY29yZXNpZ2h0QGxpc3RzLmxpbmFyby5vcmc7IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IExlbyBZYW4gPExlby5ZYW5AYXJtLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDYvOF0gY29y
ZXNpZ2h0OiBjdGk6IFJlbW92ZSBod19wb3dlcmVkIGZsYWcNCj4gDQo+IFNpbmNlIHRoZSBDUFUg
UE0gY29kZSBoYXMgYmVlbiByZW1vdmVkIGZyb20gdGhlIENUSSBkcml2ZXIgYW5kIHRoZSBkZXZp
Y2UNCj4gaXMgZW5hYmxlZCB2aWEgcnVudGltZSBQTSwgcG1fcnVudGltZV9hY3RpdmUoKSBjYW4g
YmUgdXNlZCB0byBjaGVjaw0KPiB3aGV0aGVyIHRoZSBkZXZpY2UgaXMgcG93ZXJlZC4NCj4gDQo+
IEFzIGEgcmVzdWx0LCB0aGUgaHdfcG93ZXJlZCBmbGFnIGlzIHJlZHVuZGFudCwgcmVtb3ZlIGl0
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVvIFlhbiA8bGVvLnlhbkBhcm0uY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYyAgfCAx
MSArKysrLS0tLS0NCj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3Rp
LXN5c2ZzLmMgfCAyOSArKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGkuaCAgICAgICB8ICA2ICsrLS0tDQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0K
PiBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0KPiBp
bmRleA0KPiA0OGRiODdlMmZkMGYxYTY2OWYyZDIwYTAwMTQxMDhkYTIxNWUyNmZkLi4zYjNiODUx
YTAxODg1MWE4NjU2ZQ0KPiBiYTY0ZTYzOGM2MWYzZDA0Yjk5ZiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktY29yZS5jDQo+ICsrKyBiL2Ry
aXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0KPiBAQCAtODks
OCArODksOCBAQCBzdGF0aWMgaW50IGN0aV9lbmFibGVfaHcoc3RydWN0IGN0aV9kcnZkYXRhICpk
cnZkYXRhKQ0KPiANCj4gIAlndWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSkoJmRydmRhdGEtPnNw
aW5sb2NrKTsNCj4gDQo+IC0JLyogbm8gbmVlZCB0byBkbyBhbnl0aGluZyBpZiBlbmFibGVkIG9y
IHVucG93ZXJlZCovDQo+IC0JaWYgKGNvbmZpZy0+aHdfZW5hYmxlZCB8fCAhY29uZmlnLT5od19w
b3dlcmVkKQ0KPiArCS8qIG5vIG5lZWQgdG8gZG8gYW55dGhpbmcgaWYgZW5hYmxlZCAqLw0KPiAr
CWlmIChjb25maWctPmh3X2VuYWJsZWQpDQo+ICAJCWdvdG8gY3RpX3N0YXRlX3VuY2hhbmdlZDsN
Cj4gDQo+ICAJLyogY2xhaW0gdGhlIGRldmljZSAqLw0KPiBAQCAtMTIzLDggKzEyMyw4IEBAIHN0
YXRpYyBpbnQgY3RpX2Rpc2FibGVfaHcoc3RydWN0IGN0aV9kcnZkYXRhICpkcnZkYXRhKQ0KPiAg
CWlmICgtLWRydmRhdGEtPmNvbmZpZy5lbmFibGVfcmVxX2NvdW50ID4gMCkNCj4gIAkJcmV0dXJu
IDA7DQo+IA0KPiAtCS8qIG5vIG5lZWQgdG8gZG8gYW55dGhpbmcgaWYgZGlzYWJsZWQgb3IgY3B1
IHVucG93ZXJlZCAqLw0KPiAtCWlmICghY29uZmlnLT5od19lbmFibGVkIHx8ICFjb25maWctPmh3
X3Bvd2VyZWQpDQo+ICsJLyogbm8gbmVlZCB0byBkbyBhbnl0aGluZyBpZiBkaXNhYmxlZCAqLw0K
PiArCWlmICghY29uZmlnLT5od19lbmFibGVkKQ0KPiAgCQlyZXR1cm4gMDsNCj4gDQo+ICAJQ1Nf
VU5MT0NLKGRydmRhdGEtPmJhc2UpOw0KPiBAQCAtNzI1LDkgKzcyNSw2IEBAIHN0YXRpYyBpbnQg
Y3RpX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqYWRldiwgY29uc3QNCj4gc3RydWN0IGFtYmFf
aWQgKmlkKQ0KPiAgCQlyZXR1cm4gIFBUUl9FUlIocGRhdGEpOw0KPiAgCX0NCj4gDQo+IC0JLyog
ZGVmYXVsdCB0byBwb3dlcmVkIC0gY291bGQgY2hhbmdlIG9uIFBNIG5vdGlmaWNhdGlvbnMgKi8N
Cj4gLQlkcnZkYXRhLT5jb25maWcuaHdfcG93ZXJlZCA9IHRydWU7DQo+IC0NCj4gIAkvKiBzZXQg
dXAgZGV2aWNlIG5hbWUgLSB3aWxsIGRlcGVuZCBpZiBjcHUgYm91bmQgb3Igb3RoZXJ3aXNlICov
DQo+ICAJaWYgKGRydmRhdGEtPmN0aWRldi5jcHUgPj0gMCkNCj4gIAkJY3RpX2Rlc2MubmFtZSA9
IGRldm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwNCj4gImN0aV9jcHUlZCIsDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1zeXNmcy5j
DQo+IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYw0K
PiBpbmRleA0KPiBhMjJjYzlhMmJlZTI0ZWI2MTE1ZTdhZGI2MTg4MGNjODZkMDNlMTJlLi45YWI1
ODZhNWM5YTRmZDJhNjRjNTQNCj4gMmFhYWFhNjI1ZTIyOTllZGQ2MiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGktc3lzZnMuYw0KPiArKysg
Yi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1zeXNmcy5jDQo+IEBA
IC04MSwxOSArODEsMTIgQEAgc3RhdGljIHNzaXplX3QgZW5hYmxlX3Nob3coc3RydWN0IGRldmlj
ZSAqZGV2LA0KPiAgCQkJICAgY2hhciAqYnVmKQ0KPiAgew0KPiAgCWludCBlbmFibGVfcmVxOw0K
PiAtCWJvb2wgZW5hYmxlZCwgcG93ZXJlZDsNCj4gIAlzdHJ1Y3QgY3RpX2RydmRhdGEgKmRydmRh
dGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJlbnQpOw0KPiANCj4gLQlzY29wZWRfZ3VhcmQo
cmF3X3NwaW5sb2NrX2lycXNhdmUsICZkcnZkYXRhLT5zcGlubG9jaykgew0KPiArCXNjb3BlZF9n
dWFyZChyYXdfc3BpbmxvY2tfaXJxc2F2ZSwgJmRydmRhdGEtPnNwaW5sb2NrKQ0KPiAgCQllbmFi
bGVfcmVxID0gZHJ2ZGF0YS0+Y29uZmlnLmVuYWJsZV9yZXFfY291bnQ7DQo+IC0JCXBvd2VyZWQg
PSBkcnZkYXRhLT5jb25maWcuaHdfcG93ZXJlZDsNCj4gLQkJZW5hYmxlZCA9IGRydmRhdGEtPmNv
bmZpZy5od19lbmFibGVkOw0KPiAtCX0NCj4gDQo+IC0JaWYgKHBvd2VyZWQpDQo+IC0JCXJldHVy
biBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCBlbmFibGVkKTsNCj4gLQllbHNlDQo+IC0JCXJldHVybiBz
cHJpbnRmKGJ1ZiwgIiVkXG4iLCAhIWVuYWJsZV9yZXEpOw0KPiArCXJldHVybiBzcHJpbnRmKGJ1
ZiwgIiVkXG4iLCAhIWVuYWJsZV9yZXEpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBzc2l6ZV90IGVu
YWJsZV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IEBAIC0xMzEsMTEgKzEyNCw3IEBAIHN0
YXRpYyBzc2l6ZV90IHBvd2VyZWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAJCQkgICAg
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ICAJCQkgICAgY2hhciAqYnVmKQ0KPiAg
ew0KPiAtCWJvb2wgcG93ZXJlZDsNCj4gLQlzdHJ1Y3QgY3RpX2RydmRhdGEgKmRydmRhdGEgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJlbnQpOw0KPiAtDQo+IC0Jc2NvcGVkX2d1YXJkKHJhd19z
cGlubG9ja19pcnFzYXZlLCAmZHJ2ZGF0YS0+c3BpbmxvY2spDQo+IC0JCXBvd2VyZWQgPSBkcnZk
YXRhLT5jb25maWcuaHdfcG93ZXJlZDsNCj4gKwlib29sIHBvd2VyZWQgPSBwbV9ydW50aW1lX2Fj
dGl2ZShkZXYtPnBhcmVudCk7DQo+IA0KPiAgCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCBw
b3dlcmVkKTsNCj4gIH0NCj4gQEAgLTE4MSwxMCArMTcwLDggQEAgc3RhdGljIHNzaXplX3QgY29y
ZXNpZ2h0X2N0aV9yZWdfc2hvdyhzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYsDQo+IA0KPiAgCXBtX3J1
bnRpbWVfZ2V0X3N5bmMoZGV2LT5wYXJlbnQpOw0KPiANCj4gLQlzY29wZWRfZ3VhcmQocmF3X3Nw
aW5sb2NrX2lycXNhdmUsICZkcnZkYXRhLT5zcGlubG9jaykgew0KPiAtCQlpZiAoZHJ2ZGF0YS0+
Y29uZmlnLmh3X3Bvd2VyZWQpDQo+IC0JCQl2YWwgPSBjdGlfcmVhZF9zaW5nbGVfcmVnKGRydmRh
dGEsIGN0aV9hdHRyLT5vZmYpOw0KPiAtCX0NCj4gKwlzY29wZWRfZ3VhcmQocmF3X3NwaW5sb2Nr
X2lycXNhdmUsICZkcnZkYXRhLT5zcGlubG9jaykNCj4gKwkJdmFsID0gY3RpX3JlYWRfc2luZ2xl
X3JlZyhkcnZkYXRhLCBjdGlfYXR0ci0+b2ZmKTsNCj4gDQo+ICAJcG1fcnVudGltZV9wdXRfc3lu
YyhkZXYtPnBhcmVudCk7DQo+ICAJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiMHgleFxuIiwgdmFs
KTsNCj4gQEAgLTIwNCwxMCArMTkxLDggQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIHNzaXplX3QN
Cj4gY29yZXNpZ2h0X2N0aV9yZWdfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiANCj4gIAlw
bV9ydW50aW1lX2dldF9zeW5jKGRldi0+cGFyZW50KTsNCj4gDQo+IC0Jc2NvcGVkX2d1YXJkKHJh
d19zcGlubG9ja19pcnFzYXZlLCAmZHJ2ZGF0YS0+c3BpbmxvY2spIHsNCj4gLQkJaWYgKGRydmRh
dGEtPmNvbmZpZy5od19wb3dlcmVkKQ0KPiAtCQkJY3RpX3dyaXRlX3NpbmdsZV9yZWcoZHJ2ZGF0
YSwgY3RpX2F0dHItPm9mZiwgdmFsKTsNCj4gLQl9DQo+ICsJc2NvcGVkX2d1YXJkKHJhd19zcGlu
bG9ja19pcnFzYXZlLCAmZHJ2ZGF0YS0+c3BpbmxvY2spDQo+ICsJCWN0aV93cml0ZV9zaW5nbGVf
cmVnKGRydmRhdGEsIGN0aV9hdHRyLT5vZmYsIHZhbCk7DQo+IA0KPiAgCXBtX3J1bnRpbWVfcHV0
X3N5bmMoZGV2LT5wYXJlbnQpOw0KPiAgCXJldHVybiBzaXplOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGkuaA0KPiBiL2RyaXZlcnMvaHd0
cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gaW5kZXgNCj4gNDAwYzE1NDViMjJi
ZmU2MzExNDRkMjRmYWNlYjM1NGZmMmQ0OTE2Ni4uYzg1ODg0N2E1YjgwMDM2ZmI0ODE4DQo+IDBm
ZjdmYmJmZTY4NDAyOGNiODkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1jdGkuaA0KPiBAQCAtMTIyLDcgKzEyMiw2IEBAIHN0cnVjdCBjdGlfZGV2aWNl
IHsNCj4gICAqIEBhc2ljY3RsX2ltcGw6IHRydWUgaWYgYXNpY2N0bCBpcyBpbXBsZW1lbnRlZC4N
Cj4gICAqIEBlbmFibGVfcmVxX2NvdW50OiBDVEkgaXMgZW5hYmxlZCBhbG9uZ3NpZGUgPj0xIGFz
c29jaWF0ZWQgZGV2aWNlcy4NCj4gICAqIEBod19lbmFibGVkOiB0cnVlIGlmIGh3IGlzIGN1cnJl
bnRseSBlbmFibGVkLg0KPiAtICogQGh3X3Bvd2VyZWQ6IHRydWUgaWYgYXNzb2NpYXRlZCBjcHUg
cG93ZXJlZCBvbiwgb3Igbm8gY3B1Lg0KPiAgICogQHRyaWdfaW5fdXNlOiBiaXRmaWVsZCBvZiBp
biB0cmlnZ2VycyByZWdpc3RlcmVkIGFzIGluIHVzZS4NCj4gICAqIEB0cmlnX291dF91c2U6IGJp
dGZpZWxkIG9mIG91dCB0cmlnZ2VycyByZWdpc3RlcmVkIGFzIGluIHVzZS4NCj4gICAqIEB0cmln
X291dF9maWx0ZXI6IGJpdGZpZWxkIG9mIG91dCB0cmlnZ2VycyB0aGF0IGFyZSBibG9ja2VkIGlm
IGZpbHRlcg0KPiBAQCAtMTQ2LDcgKzE0NSw2IEBAIHN0cnVjdCBjdGlfY29uZmlnIHsNCj4gIAkv
KiBjdGkgZW5hYmxlIGNvbnRyb2wgKi8NCj4gIAlpbnQgZW5hYmxlX3JlcV9jb3VudDsNCj4gIAli
b29sIGh3X2VuYWJsZWQ7DQo+IC0JYm9vbCBod19wb3dlcmVkOw0KPiANCj4gIAkvKiByZWdpc3Rl
cmVkIHRyaWdnZXJzIGFuZCBmaWx0ZXJpbmcgKi8NCj4gIAl1MzIgdHJpZ19pbl91c2U7DQo+IEBA
IC0yMzcsMTAgKzIzNSwxMCBAQCBzdHJ1Y3QgY29yZXNpZ2h0X3BsYXRmb3JtX2RhdGEgKg0KPiAg
Y29yZXNpZ2h0X2N0aV9nZXRfcGxhdGZvcm1fZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiAg
Y29uc3QgY2hhciAqY3RpX3BsYXRfZ2V0X25vZGVfbmFtZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAq
Zndub2RlKTsNCj4gDQo+IC0vKiBjdGkgcG93ZXJlZCBhbmQgZW5hYmxlZCAqLw0KPiArLyogQ2hl
Y2sgaWYgYSBjdGkgZGV2aWNlIGlzIGVuYWJsZWQgKi8NCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBj
dGlfaXNfYWN0aXZlKHN0cnVjdCBjdGlfY29uZmlnICpjZmcpDQo+ICB7DQo+IC0JcmV0dXJuIGNm
Zy0+aHdfcG93ZXJlZCAmJiBjZmctPmh3X2VuYWJsZWQ7DQo+ICsJcmV0dXJuIGNmZy0+aHdfZW5h
YmxlZDsNCj4gIH0NCj4gDQo+ICAjZW5kaWYgIC8qIF9DT1JFU0lHSFRfQ09SRVNJR0hUX0NUSV9I
ICovDQo+IA0KPiAtLQ0KPiAyLjM0LjENCg0KUmV2aWV3ZWQtYnk6IE1pa2UgTGVhY2ggPG1pa2Uu
bGVhY2hAYXJtLmNvbT4NCg==

