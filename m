Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759CCCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 06:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=114J8kcduI8g6h/l3AI6EdHGjuVwPAZIb/NkRXcEpPo=; b=jmSJ74D2y+YQOOzs6Su34vTG1g
	dSUBaMN/ZS6rWB8j+zgZAkI4+rP6FiMlXQX6awckMmrz1iJXND6ZDhG29W/+mJkQu9qqv69fYQFXR
	8Ih97S+iX4YPkpqLdyg7NdreydnAOWf5n2MiJ3qU6GhW87wYL6f4Tbmmnw3y203cxMo7Efv49XTMa
	3fm2hdBXxi+qwE+hSXYF0BTO0Q1FZhn3d5Vu3a1z3t/ZaQCjem/BNGnKFpjN116CnzJ6henxur1Lx
	ikIRwpIBp1Hk1YBwQD2kP/84ez+66DUPhRaOHvJDDLBTkbedZP+Si4ljYgtowSjFQ6EeTi6BkgtBc
	b2nuGJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEj3L-00000005UzC-03Fg;
	Fri, 31 Oct 2025 06:56:03 +0000
Received: from mail-westus2azon11010033.outbound.protection.outlook.com ([52.101.46.33] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEj3H-00000005Uyu-3IHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 06:56:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo5GbrH8ODvBqxADvEDCV93rWWX+FqhdDkeSCoIAo/7XN+/u3S69DwXsQgxi7MP5rlnweLXcnlH8QD8Jd+SaUCEfVeiMqaq4nq15hAsgeLcblRQGTmSH94vRC4ABru1OPTOrJPkR8ZGMrN6u8KT+FakdAaotc4FEYbf39+pKu93YeQ3ACtM+f9gbUBYDbDNe59+iR1YvxhTZlWDXd9knRvWZcmYweoJ5hlR7D5UZOHPg97xyVhuV/gAC/38Y3g088cmaOtaBsw7xjshIrXv2RY/kROYJIYZ4ERXceJ0Oc7L+AXZBdaTkOz6GsuMAJrzQpdFIDXhA6+Dxmc2BPdN+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=114J8kcduI8g6h/l3AI6EdHGjuVwPAZIb/NkRXcEpPo=;
 b=p1DN+yEYvFoyqWTBes9jViKgbzt1Wq5frfXwPkgOrVrG/h+Xg6N4ABVAxMyrml67FKwkMHByIhzis3qU03kp0w5hWmZiWfjACL//pp1k9as5aYhFY4bR+kWV8kpdRP892WXMwhEybspd7MScdNHgR0d1KDt7cllS2IeaO76RvXHkOe8J8vmKPFU+igJfZ+OKxFo58m2sKb6Fqyi0FdkOlseHp2meYCgO73weQhyqQVSfxtMYKbh5UGw54gZjMqA9QBT0KeOLuQIMO+jOPFa7rlGpKxjQilrxj5u9lrkSOrWe2DWmmw06B2jFth3TfK3khENHVauwipldsMpD+hOghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=114J8kcduI8g6h/l3AI6EdHGjuVwPAZIb/NkRXcEpPo=;
 b=p3NjFAvQFAW6o3pUKTNe+VBH78umAzcp8l4ebaETnMUIXv66WDn/+GIpaW4d1Q7HUNfYlAv4toHBTETaAB/A3rymbGEizpRkOfR++uxEqYTvvN59QiTPSGIsvsa8Zq+urhaA2m5QO2GTVfLUxt82KqgXG1WIglRUTCNFT4MrVJI=
Received: from CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 06:55:55 +0000
Received: from CH3PR12MB9171.namprd12.prod.outlook.com
 ([fe80::4c1:7aaa:e0b2:ebd0]) by CH3PR12MB9171.namprd12.prod.outlook.com
 ([fe80::4c1:7aaa:e0b2:ebd0%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:55:55 +0000
From: "Joseph, Abin" <Abin.Joseph@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul
	<vkoul@kernel.org>, Sinan Kaya <okaya@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Stephan
 Gerhold <stephan.gerhold@linaro.org>, Md Sadre Alam
	<quic_mdalam@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>, "Pandey, Radhey Shyam"
	<radhey.shyam.pandey@amd.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>
Subject: RE: [PATCH 6/6] dmaengine: zynqmp_dma: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Topic: [PATCH 6/6] dmaengine: zynqmp_dma: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Index: AQHcR0YxNInsNBeqXkSmakap4gB577Tb1yZQ
Date: Fri, 31 Oct 2025 06:55:54 +0000
Message-ID: <CH3PR12MB9171133585BB0178E21DA8FAFCF8A@CH3PR12MB9171.namprd12.prod.outlook.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
 <20251027133232.392898-6-sakari.ailus@linux.intel.com>
In-Reply-To: <20251027133232.392898-6-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-31T06:53:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR12MB9171:EE_|IA0PR12MB9012:EE_
x-ms-office365-filtering-correlation-id: cadc5ec4-e58f-47a9-15a1-08de184a89a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?x5yRnLaiFKCueFkCx61anLikT/7waga7RFi9cCIFcIws6qjKI2lFS2OsPm9R?=
 =?us-ascii?Q?aobiaD/H+31uPrby3dZrLfApeqLkaWfLRWbt24H1ZMrh+iKpp2WINVOtThIk?=
 =?us-ascii?Q?fsARPtlVo6qLRfX8iAE09Ad5szRt/rf1FBF2fphBfq6PIpg9InXoqlRsUUBK?=
 =?us-ascii?Q?dS1O8x3VM3MaYQx/dHv+WfwjRqZ4RjRxW6ZpHiBLnUorAoV+015D4ENzFQxc?=
 =?us-ascii?Q?ysSghGus9sw8RLdb/l6PuVLh7bsYV/8jz468bJTc1x5DjWOVWgUGmEsk9kAS?=
 =?us-ascii?Q?UQpGGX9OrA09RtZ6C8/zx6XQNAXrkR54K+2dgrSRfHHmouE5abrW4tt3Lr8T?=
 =?us-ascii?Q?0csJFy5qT2KFqT4/EyjjvLSJXlm5SGnuwj1wLbDBw5I4DCpE4YXMVtND5JOz?=
 =?us-ascii?Q?vKU5PqKIcOzqFb4iTl4Z9cIqVqlq+qeE6m4LQlt8cKoDT6U+RurioyMcfax/?=
 =?us-ascii?Q?Njk+JhHrz9rBy4TVDRhi2qUyIKsZuyplAmYMj/8sEtKufvjIVcOGBJsDd471?=
 =?us-ascii?Q?RDKZALIIdRGMCvi5sZZEIkNWE+sb76uTrYyiETYdUQU64jPNbLwe/kDVxFqp?=
 =?us-ascii?Q?pzZkD4k7SW+HO7CHV4sst7puOOQccFLNq4a8s6y23/GZpgihantOjwtiuc52?=
 =?us-ascii?Q?NmkiqgYiBaViegeEQed1PKB3Sy0Rn5F2Sap40ls/o1qzJCKpcPfHfph+aCMp?=
 =?us-ascii?Q?QTw8BsBXBAYdJwENVLuehrzGi/5qBPUzkbWLzKrUusMFTm5VYut1ISpiNpdd?=
 =?us-ascii?Q?kEKrO8umqxE+1HQ9Oj11nwCPlS/GR15INitzEP5VjjAhI/oA2vfJZD5huLwQ?=
 =?us-ascii?Q?GIF6ssUhscSgSur0GogdtT8F2KxHz0UGZs6T8++8Kd3BOJDYrVstIdCHYvYt?=
 =?us-ascii?Q?NM42CIgOfEn/jVMuDB8+NSR9936HFwxIGvGgIwWs37DCNgP3HVgsH6MNx0RC?=
 =?us-ascii?Q?NxE3pWJB6erjeJ4aLKDwKIYRjBZZGzoaP1kkegnJBbBBanVD8qc8U1zUAkHu?=
 =?us-ascii?Q?00Ux7h+qipuzd+qrvKRud+35e1+7JtjPbR39hJimsXq40zbiSAikAVduclw8?=
 =?us-ascii?Q?zQKeOD7mWoh/VSa7/DmYPzrzQZYreAnA+B5skr85Vji3wnc0WBOzTM6rM3Ct?=
 =?us-ascii?Q?LcwAisgFKTJ5gYLHZueJiHK61X5aPSztex0KAppb09ddGcyoe9fWUmpsx5Cy?=
 =?us-ascii?Q?Euh0x5LeH8MlAG8yL2/NxDwl8GQemFktN4Y/8tt5lNJjXq0Ja1qX21gIsN3n?=
 =?us-ascii?Q?TRqW5xh5BHDFIwIg7INNHGOCqQvATHntc0AK+osmEM6TM5SC02o9ZCyly+sJ?=
 =?us-ascii?Q?BRofcTpWSRfpb8dPAIGNKbsyIooudej/JyHQdK8j6YEpctUJ9P/yQqqU38bN?=
 =?us-ascii?Q?jLua+osrLripnQYKAF0EUIvPlFxtDPokMzSgNt5W5Amu9RQMEnCMjLL3zQzC?=
 =?us-ascii?Q?KHT3pk6bzJirUiFbfcvctNsDd9GPYP24nTqXogW4VNMWnxCvZPkcGSM0bfHj?=
 =?us-ascii?Q?StCRB3iYcTiKtaYZV9lrVaNFTIfx+n1wT3DY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9171.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QCkv6r5teFCTSC4Tm5BT/v1obTMBeqtiUVeMoO/Oiimg14gqjoo5m7FifK/B?=
 =?us-ascii?Q?90tFP0RSfF0u/hgZiCaNfyywzAHnJ/MIMjvVratJ2S2HTFXwQPlG8015J1LS?=
 =?us-ascii?Q?WBs+ApsUTxA+00g3h3kW2BhVdBsZ0Ly9+V/MUnUvl9BJsx/egQ0twAYID1jK?=
 =?us-ascii?Q?o73E4LOd86Tv94Vf74ZY1LrVbmspqxaDIgQnc/QUPZr89+kOHBeD92Gl62Wr?=
 =?us-ascii?Q?k4gX2PRnWPnZXGjmwz+qL7TnA6Q5X61+Ljg2l8Qtp3Q0SBBVfRu1KO+/v7ko?=
 =?us-ascii?Q?zr+A5SfICwPKN1PzUPjB1Ktcfpmp2ZCDkEWrUpCqE9C0cTtY+MIa6F4JWG/s?=
 =?us-ascii?Q?NLT8V6+kdIGOgFI7YxMwZgUmbuCaU5GXSYKAcN/bA3uwSOxKVAh0lSXTHW9O?=
 =?us-ascii?Q?5+jsXM77qLHfuOLRcBww4QOc6mKPR4y7klSP8j+H+hwcPfPIQzAJbNb5luMU?=
 =?us-ascii?Q?M1Vn9Z23+LCCtcarW54Wh0rZ/rrl/G6ZTzUtn9Y8XRMhY3BTbCGWbctwQ/+X?=
 =?us-ascii?Q?NNopjvsoTmbK+/EOj1ifv/Nk03JyTUL81SRK0YJhVdVGOLxbQsME1Njhh5jS?=
 =?us-ascii?Q?kNBpKRu95ygvBOPqPhTRRR1vc4TnCqWL++zhTRJ3T1a+N+MCLhmk66XUPNfk?=
 =?us-ascii?Q?XdQ4Yq/MF2zM4wKP7aOkhKO2dbUFQ93Temk/OCmcNz46sCQANBGRZrNx/meg?=
 =?us-ascii?Q?0sVXOjeLwmXpt9viR6fVwaOx4uetiYmT9/a7yalgIwM/56e84WwI/n4xV3If?=
 =?us-ascii?Q?JBrlw8iRdMry5LC67v/wr+I6Mm8BtHm/R89YNbgizItDqC2e+2inVqcNu6GA?=
 =?us-ascii?Q?azSe+JaQScrNJQ+X1+imQ/yqdxgNEabYqucnAeCo+iemXIaUFd2Vq3N8A3ST?=
 =?us-ascii?Q?qQBwFz61Bf5bGddNCEg11PJ6hvpIRSEyWevTWDo0dYOsvz/Z+Ipm76U22ET+?=
 =?us-ascii?Q?fX5OVkXA3w48m/Z/bzo/f97D5AfLpSYYGeuX/ts2ZASyCmbOlwIH4/XDPq+V?=
 =?us-ascii?Q?i/me1uwwpRCtIduK6RE56gWcLRtxRq26dBE8AeoTGv3mV1m3svJMZSLQ9yMW?=
 =?us-ascii?Q?13lpzZzIG4uPArbHcpC88lF+iPKM60orqD2/7LIugam+901mbsSCxlh6zC/x?=
 =?us-ascii?Q?E4sxf2sMROQaLbeTqr/O7Jsjq1raN4A1TKq4Nb0ShPrrNqiASAY8oX5IJ0BT?=
 =?us-ascii?Q?AcnimpmSpuHWO0FVpWM7/r3RmBd8TS3WL5IwhJNpQSP4tyIQ4ZgUTtaKDb1g?=
 =?us-ascii?Q?LbVl2gUvSvmsj5D0xwmt22cmbtmkV62RKHt65rgNpNjLP8OsqDZOKUuDCi96?=
 =?us-ascii?Q?hcu+9Yxm/Dz/xhEhlUnp3w+qDI1TYOaJJo+QA0LogY9txgyfCws+FtqjSL62?=
 =?us-ascii?Q?gZt4U1d+nrICcCs23c4/xAkIOJRL39CnNnLU7Cdsbe9Up6VTUUPZEh51jHub?=
 =?us-ascii?Q?AULQLX6nchltIxcCgWj2mZPVf6aKiaqm59tRtCSajYfpE6wA1u6xwDeI3IQ/?=
 =?us-ascii?Q?nOd2q4OE09Qe+N2BA1CSOkqG/00ctr9Ah9VF0/c+eg7iDtkPe/pWMGjUAu5I?=
 =?us-ascii?Q?1w3KhxGO7SbtUK/loQA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadc5ec4-e58f-47a9-15a1-08de184a89a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 06:55:54.8851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tm/pUVm20troyUI3zPVbedoswdr2eJNK36CkeM7dqaMGRvbfg00jzJkm141H7uqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_235600_133772_7373C1A5 
X-CRM114-Status: UNSURE (   9.64  )
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

[Public]

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Monday, October 27, 2025 7:03 PM
>To: linux-arm-kernel@lists.infradead.org
>Cc: Ludovic Desroches <ludovic.desroches@microchip.com>; Vinod Koul
><vkoul@kernel.org>; Sinan Kaya <okaya@kernel.org>; Linus Walleij
><linus.walleij@linaro.org>; Simek, Michal <michal.simek@amd.com>; Stephan
>Gerhold <stephan.gerhold@linaro.org>; Md Sadre Alam
><quic_mdalam@quicinc.com>; Konrad Dybcio
><konrad.dybcio@oss.qualcomm.com>; Casey Connolly
><casey.connolly@linaro.org>; Joseph, Abin <Abin.Joseph@amd.com>; Pandey,
>Radhey Shyam <radhey.shyam.pandey@amd.com>; linux-arm-
>msm@vger.kernel.org
>Subject: [PATCH 6/6] dmaengine: zynqmp_dma: Remove redundant
>pm_runtime_mark_last_busy() calls
>
>Caution: This message originated from an External Source. Use proper cauti=
on
>when opening attachments, clicking links, or responding.
>
>
>pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
>pm_runtime_autosuspend() and pm_request_autosuspend() now include a
>call to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit cal=
l
>to pm_runtime_mark_last_busy().
>
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Abin Joseph <abin.joseph@amd.com>


Regards,
Abin Joseph




>---
> drivers/dma/xilinx/zynqmp_dma.c | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/drivers/dma/xilinx/zynqmp_dma.c
>b/drivers/dma/xilinx/zynqmp_dma.c index f7e584de4335..7bb3716e60da
>100644
>--- a/drivers/dma/xilinx/zynqmp_dma.c
>+++ b/drivers/dma/xilinx/zynqmp_dma.c
>@@ -695,7 +695,6 @@ static void zynqmp_dma_free_chan_resources(struct
>dma_chan *dchan)
>                (2 * ZYNQMP_DMA_DESC_SIZE(chan) * ZYNQMP_DMA_NUM_DESCS),
>                chan->desc_pool_v, chan->desc_pool_p);
>        kfree(chan->sw_desc_pool);
>-       pm_runtime_mark_last_busy(chan->dev);
>        pm_runtime_put_autosuspend(chan->dev);
> }
>
>@@ -1145,7 +1144,6 @@ static int zynqmp_dma_probe(struct
>platform_device *pdev)
>                goto free_chan_resources;
>        }
>
>-       pm_runtime_mark_last_busy(zdev->dev);
>        pm_runtime_put_sync_autosuspend(zdev->dev);
>
>        return 0;
>--
>2.47.3


