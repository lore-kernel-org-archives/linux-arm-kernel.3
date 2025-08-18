Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E34CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8YjD0I8eJXYcJBrcA5EtVAkHOGNwm/d08RkROZGbGs=; b=bW+YDQqdh+0YwWq+pQyeNTVykE
	yFHBZRfeQ7DwRcaXpvzI09e9uISYt+hImkvQ8TWWdB6XECWzFZB+gMmYLFk+cYtHPd1i4DfEwBz9P
	eWBPARJCZpEjs1lMyTqxlr/aZ2Aciu2TtM1Tt0llq72e7Q2R+brm7jb2sy0Sn4Rxh2d5LDHG496Go
	lMqUUfonC4M2f+Om/Z8t/h1r0y/hcxwsKVyVspUbdQ0toDwI/YvopklKkWtEwYf0WQ4+FpNDstoio
	3eAstrAurwEb1R/uPVpwV+2VAOtSSxQWptgj/nd/A6NbNBfQ4j6Yh4xU8XBDXRHCfcY/6DEbBRsYV
	r2nkOIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7y5-00000008no0-2RQA;
	Mon, 18 Aug 2025 22:04:41 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6mc-00000008f4F-30EV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNELWP/Kcp/eynhewWfSZ0NHeYZYvz6UnCDYQjilI+MkXtcYd08QCBBLhE5vyPSA9uZcDJKWyJs3RbYhDdDPRjjJI1FVwY4iXjmmj2ryZ/ChuKHEskHqQXVn3LWVDnvIPOMQuqHUg0dFViUDMhRq0iNuI83cRA+eP1uz1I3TPP9zkbZt4pAmv/zfCcIcuYaJuD2DCKqnflA9nH1IqGFmIGdNyHc42/36fvc7I9PqSFquXU9au0nzOsSwzD+zgt2svGI/7kJfTI0pR0QxJBzGJll4FSyedT81mwuhWrSkinNLdL82yapTWztBuoExrWWRiySHgg4k8U1hI6o8z5yGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8YjD0I8eJXYcJBrcA5EtVAkHOGNwm/d08RkROZGbGs=;
 b=WU1SsgK36o2+jf6GCmJwM4vkAJLxkgumbfX/cfBmS2cW/oemGdgGtRluMN07CDvOuJpkbftvEzloQxvd3uGmghSBQAjlNssZzEIWFfgun/EfyJ0Qa6oIc+xvKSos/1wRnOgUy8H0Etuv7j+//UcdElBbIl0efz66SGZ1N/fILA/dggniNeP2RQfA+Csl/OZkReW6jo5M+3qjeinJMjX69DYDpv+UZ4QZtUMtfEV7gpnZbH4u0y9Fu7N0aHmEIfEx0Jji8KIj/as+JFG9/uv+00Tw5NfbthGTVo3YehyqA2hL7Ywhkz4kDNgKmVT1UiM7s0hmHLvyNwm/U+mPEg/QOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8YjD0I8eJXYcJBrcA5EtVAkHOGNwm/d08RkROZGbGs=;
 b=LCvTjTH7ZgREUegA5GNilo/ThcWu0W4ON3bGIe3J0xSPleBRXCPo9nj3oRibEDpd/npw/iucNK4aaCJhQwW/RcezDILbVUwh0pztB0cHyVjVUqWxQEB90oj1Cxenm0O7EqVOBHfBvm5bob3DfIFXFFjnGoUNbRvt87V8xUCvQPcmizvEf2foJoKvgylg9bZSdvfw+f29aDkaC31kDa1xDEdqbHKN8H/1cXWAqKAkXrF23iWcVLVPCdMbG6k2tjoXb+U/1yOtPyB5N8fT3T5n1wKu+wjIjM0EMHmZsx6hBl6fc6w/+9OqimCgF/yObcXioQuhFzyIrpWj7I91p1mDew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9009.eurprd04.prod.outlook.com (2603:10a6:20b:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 20:48:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:48:43 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 18 Aug 2025 16:48:19 -0400
Subject: [PATCH 08/15] ARM: dts: ls1021a: Rename node name power-controler
 to wakeup-controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-ls1021a_dts_warning-v1-8-7a79b6b4a0e2@nxp.com>
References: <20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com>
In-Reply-To: <20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755550106; l=1271;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7D/h5bkRXrvGtvqu/tRKtkDVUwnVbzJSZ758OdyLtNo=;
 b=2q+zbH7tWLKnmT/I47eFvxAPjKbZTmjf+rBdGKPacxnWUtV7ydmTGl2Fx9T5ZdsR1NbVLRlFZ
 Oa4IVV+BZCBCJ/GKN+QOQewrJmwDTRqBUBug9pgQL+9R9UeCc4fuQvz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d425648-5e38-41f8-a716-08ddde989e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1lGN0M4U0lPTXJBdTZRbEUrT1BXbzcvYVB1dGc2MUNVL0tXZjhHMmVidkUv?=
 =?utf-8?B?dzdKN2FLOEJJeHNuMHJORURIR05PdHpGK3duRW1kSmJ6V3gyK0ptdUVSVGJo?=
 =?utf-8?B?WkFOdzlNZzkrRnkxeG9tUUlBRFVYdm8rLzNBVGJnSW0wQndmZXdPb21lYjdH?=
 =?utf-8?B?ejQyVENxNXhLOXpzalVLbk9sZW04UDE4MzBpTGt6T0hsNGNoL3N6R1hJTkpj?=
 =?utf-8?B?cDJzQ050TWRFeE1nQVlxT1prS3JtL01wRXVIYWJMU21mKzB5bEtXNzZaNFcz?=
 =?utf-8?B?YWQzcmVKUk1IOSsvWUdCajdicjFtNWNMOXN5cmlDczFManA3REY5SnVMc3ov?=
 =?utf-8?B?SHVGZHp3TlZkMFF3WWV0TDhKRjlJb0JUT1pMcndVTlpnZC9neFgzRTJLUXR6?=
 =?utf-8?B?VllaYllFdDNHRXZ1VHhmWmlaZVJmU2VHTjJZa3JIbDFha29FYURRVW1EbUNn?=
 =?utf-8?B?eGtuN2FvN3BxOVFxRU1UMmwvRWROZjJCWkFLRHNVNWxRSXg5bHRLU2puSnUw?=
 =?utf-8?B?T25IV05MclBrZE5heUhaNFlVYkhEc2tIakQ2QnNzTGtiNDBoc0pRbloybCsw?=
 =?utf-8?B?K3FiWGIxbi9PZkJOZmhSdE8zZktET3luKzFpZHUwZVhaMDRwWGhrRStZTGhy?=
 =?utf-8?B?L3ovMmZ0Q2hhN01KSGFlbUR3eDRJdkl0cHZxcjZJd0hJSThPbUQxMWo5WEwy?=
 =?utf-8?B?ZG80OWR2cGpRaXdaSldNRWRLQm9kUmtrcEYzbU95RUw1NjllZHV3QUpJdDlN?=
 =?utf-8?B?QVhlL0NJRFBncTc3d3NVMHBQbHQ2d3RycXRaRTRSUmtxNkh6N0szSGpSNHNV?=
 =?utf-8?B?ZWhmTXc2N3k1eGJwaHVPYWNtMVgwb2MyY1pGTHZWekZoaWI5SHRrdnpmL0lR?=
 =?utf-8?B?bUFqVCs4TTg4RTZUamoybE92cjRXWDBwSGlOQkc0YXZKMmRmbjVTb0taSkxL?=
 =?utf-8?B?NE0zekdTVy84QzVtb25kMlc5T3NxOXVoZDJ3Q3BkMnp0NHNVUU1GbW0xN0dp?=
 =?utf-8?B?R0dWN0gzQVVwRXMwK2ZrS29DYm1pZkxRWFZ2WVpaditTT0I1aXMxMThvRGFs?=
 =?utf-8?B?QjIxL2JSRW1uekVtcjg4RW1xRDZYSU5LR0hwcm5iazdTcVBNQmtNd2l0aEFl?=
 =?utf-8?B?MDJzeXoydTMwZUV6QmNvWVpFcVM1TldTSVFuWEs2N0JJdjBPM21qWnhpR0Vm?=
 =?utf-8?B?S1ZmaDN4TEkrb2FTaUlOMXVhZGtJWHVPQnNCSzBueDRRNXJRNlZOOFYrZGVa?=
 =?utf-8?B?MHRZZHExZUlWSFYvRi9aNjVhdDF5UTk3a2crL21meWZXVzlVS01QTmYvczF6?=
 =?utf-8?B?OGhRWFArbW5ieHREVzN5ZnNHVEVxeHk4SGljbEhUUzhpRkxzRVUxZmNBYm5M?=
 =?utf-8?B?ZE1oUWNXSkdNL3lqR0g5Z1JXRTZpQStCeGVXQkNocUlyaU0vaEZ6cnRoQzhI?=
 =?utf-8?B?MytyRVlheGlpSExTK2lhTlZXcTVBOE5LNHFUN3F4OVdReXJoRHBNa0ZnSWEx?=
 =?utf-8?B?cGNNT2xoak9YOFVvK3R0QUJRWUcxM3JRdk5FRVhKKzRFT2xXM0EwRDlrRklT?=
 =?utf-8?B?MUhNVFYyUUtLRDFvcE9Bc2lLOHRRblB4MkVQQklwR2ROVUxFb0pjK1RQZXlU?=
 =?utf-8?B?RGp3Q0xwVk9vajAwL2doQ1djTk1sRCtRakNtNXZGZE52UGp1MjNrR0FhY081?=
 =?utf-8?B?ZldITVJHazFzZWt3QUFYWUZaU3dZRG5scVljalAvaENSZEtpcVZ0d1V2VDFO?=
 =?utf-8?B?R3BRZ1lzK2tzd2xURnovQlR1Q3o4cmpFeFhXMHBOblI1N2F6cGwyZzlNTjRk?=
 =?utf-8?B?SFY4bTN4Unp3NDMyV3dPb2xTaGFzdzlLOEU5R05pTWJ4a29QT1ZwU0ZoVSsy?=
 =?utf-8?B?VlBnRE5KODBMQzRMUHZWNXgrSm1rMFYxWVZISG9oZVk3b2dzejdMMHpwSTlq?=
 =?utf-8?Q?x2ucfCpIeSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFdPZThxUzVVdmh1cERNdGREZG5MNUtPbDZiUDhybk5uaEJ2dkFpa0tYRTV5?=
 =?utf-8?B?OVlkVStrZGZIU3B1RjNuNVJ1Y1RKOXpRNit5UXBkcDZ5c2QvM0RheXJzaVpq?=
 =?utf-8?B?L0oxbDhqMkNKaExYUFA0cFFnN1d3dUwvMTBqWk9HbnA0bVpmdHFEUnpicTFr?=
 =?utf-8?B?NXRFSmkxdUFTZUFoZW5SSW1UMkNVbkNjZHBsejA5UEV3ai9NNDdUbVZVMVZy?=
 =?utf-8?B?bFNrdmFrWUVYbjhUYzdycGlGWTJTVVB1dUJ2TFg4elBMVWdIamlpVWMvZnVi?=
 =?utf-8?B?UHJrVFdrdTdGK0hMdExBZGlHNVFFZjRpTGdLMFNhRng0aFQ1TmNyRmw3OXdX?=
 =?utf-8?B?MWVzYkpsa2RHLzdhVytHSkovTlhKdU5qM0FZMTU4cFJRM01tdDVPK3BZSlhv?=
 =?utf-8?B?YkoweHBTaGh1cDh4QXNzVXhZdVZ0WkRDSEpmU0hhdWVFVjVNQ0dPeTIwOHA3?=
 =?utf-8?B?aU4yY1hvNVVsdGJtOXA0VXlGVnpqVCtJMm05MUZIclZsaWlqY0pZeG1XMDBz?=
 =?utf-8?B?U0s4UGVDY1JQb1cwSXBkWm03Vkt1a2N4NDlZcGdhOXc1NzhjYzFoTlNBdFB1?=
 =?utf-8?B?ZURNS2lLeFpMbGhsbG1JYTgyQlNzZDlxSjFQeHErditqWVpRcjNMOG9nT05i?=
 =?utf-8?B?TXhHZXdGRndPVU4xSFNNK0dQbDl1ZHREaDFWTS90OFhYRWRNYllZSlIxR0RG?=
 =?utf-8?B?SmhWT3JmVWlkS3lkQUtQZkY0bnJxb0hrMjRHSHAyT3g0akF6ejFXNEpuc3kz?=
 =?utf-8?B?YjZPTTBXZVhlanpFTUJ4NlNjazkwdVBHMHBjbU1qcm8zdytoeC8ycVR2elpR?=
 =?utf-8?B?Zlg0YXVyQ1hSVlBSM3FMR0krZW1jS3J5VnNYbXJuR0V6V2gvektBR2hqR1Q4?=
 =?utf-8?B?QTFuUThWYVRLY3p5N3M5VnVnWU9oL2ZCeVJ1ZmNHem85OWpKcXFWN0piR1hT?=
 =?utf-8?B?VEZLeStzbnJNNDZMbEpJWHcvMWVYUlJmRG1yM0Y2TEpSTmljSVphUmRyTWNX?=
 =?utf-8?B?czBRdzFMN2lnRzR0bXBWZ1E4YkFOUVlTRVJ0eEY5VS8vd1BXbi9YY0ZlVWda?=
 =?utf-8?B?L1BmajNabkE0SUZ0TUFIVTFmNzYyT2tFeHozNXJ4bmp6ZWZpMnBtZHNqaldS?=
 =?utf-8?B?WkdYUkFPdTR6V0RvWGhXdGM5Q3ZhSHhNaTRiZHYrVXlFb0lxYk9YeEJtOElz?=
 =?utf-8?B?V2pBd3FkZkR5VitHSGlBa1BaM3hJSUZNa0FLZkgxaDJneXlpMEJ6RVlrMVVC?=
 =?utf-8?B?TWtaK3lEbW0yUUtOcmFLbzRBMkwrNmQrd1pTY3JndkYwZ0J4RzFkNzE5TVhH?=
 =?utf-8?B?dmdJRlBuQ3cyRDFJWHAxT2dJZ1RHbElzTzZtUWtLbXdoUGlUZlhOeU9GTHJI?=
 =?utf-8?B?UjNkMEkrQ0hGS2ZXU1pIeEp2YjRuZXJHMzUvTTBMZndoNlBzV0ZDSDhBbnBD?=
 =?utf-8?B?aDBrT2ExNW5Zd3JiQkFpNUZaVFlGV2JHM0kvNDVybVVtMDUvbHdZZDV4Slcv?=
 =?utf-8?B?amVhdGI0MnBuNTBUaHhKQkhkNHlrMHdSbmZkZm16VUxpUTVWRHVrMDlDb3di?=
 =?utf-8?B?eGZhbDFxZ1JMYjBJeDFWWnpsL2tiempzRVFwcFJEV0hxeUE1Y2JNZnV0M0xR?=
 =?utf-8?B?Z0pkSHBmN3VYaWFNa3QyRWlpV2gzM3VYNEZydlMxR1lQUE1PWEg0Z1pOUzhP?=
 =?utf-8?B?N3BaSm1TZ1N4bEliQkQ5a29qQTRTa29sTE9vbVl0SDJXMFBnYXVMRjc3dnNQ?=
 =?utf-8?B?a2t2Q1hIallLbWZYbFVWVW1lQXBvVklJRnlmQ0l6eWdvYUg2VmJJbitIZEFt?=
 =?utf-8?B?Mm56REY1UFBpV2xsSlFWdVJxdFhHbkM1WkN4SHZ5UUt5cjd3QXF1ZEErTnhD?=
 =?utf-8?B?cnl1bWJobUJjR1BRWWtPOW1peVB1ajZtZUw3ekY3RE5lRE1rQWMzd04yQ1FU?=
 =?utf-8?B?N0tpWTBuOEE3Q1dGZWw0cGZnSlF4ajJScGxnWmJvZkdFcFBVajVsYzF1VnBF?=
 =?utf-8?B?M2tqdVlpbW0rcUVkZXNRckRXUHIyZndGb05FbGttMngzM1dlSTg2SHlMTmZE?=
 =?utf-8?B?OGhtVE5zNG1ISExxdlJMQ04zdTRoUEJhU1B5VHdjYjBjTHJJYWQxVXdTWmZI?=
 =?utf-8?Q?VNS8yWIYUzhX27YX3DvOKQ4qZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d425648-5e38-41f8-a716-08ddde989e77
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:48:43.2946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qswhw2SMlg2BJiUcp2uX94rf3V/dtEwKHmFXP2mxY1O4ogvreIhs1qKIl8Dac98ENcfWZ2XWuV6N6ZNi/uQvig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_134846_761341_E9DF08B5 
X-CRM114-Status: GOOD (  11.29  )
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

Rename node name power-controler to wakeup-controller because it is not
power controller and enable/disable a wakeup source.

Add remove #power-domain-cells.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtb: power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 3921d9c4912713064dec1e10ac00cc0916d8974e..e16f7f2e3878372f3e622c57705cdbe9f5c7d15b 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -923,11 +923,10 @@ qdma: dma-controller@8390000 {
 			big-endian;
 		};
 
-		rcpm: power-controller@1ee2140 {
+		rcpm: wakeup-controller@1ee2140 {
 			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
 			reg = <0x0 0x1ee2140 0x0 0x8>;
 			#fsl,rcpm-wakeup-cells = <2>;
-			#power-domain-cells = <0>;
 		};
 
 		ftm_alarm0: rtc@29d0000 {

-- 
2.34.1


