Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54482C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtQOlTsq2aqW/cqChizVEMSjtzIiau0H6QNSNzAE6yY=; b=Q6HFpdb4reBlG+pPhEPkH8r5Gg
	fidHn8kaK8ZuPuOhZRIlRRn27fpc/+W48TM5CMd+4ZBVxMZ9vswgpjq0csNd9hxLFJtgFk59UEn+b
	rVsSxw5DgOh6ckoSI1N51O+kVBHx4Z6EJopDYxNRv6vg9njaaVI0YRNj34RpWfGJtIlHrjxg59zIr
	qTOPyggKhTYhjKGtPYYCLRI2rNvHAzuzuQZIOjQmg/TM9B8uRD5ULzVHuumAtQjpRl/WIDyxLLixJ
	v+I4/vBp6vVfWblWhSUHwT1UhOOC1pm1MmLP4XBVAx45zexhzHRcqrlTwfQ1KNTNEfCCWrsP675V+
	X/eZFtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEm5-0000000ECOy-1gxz;
	Fri, 24 Jan 2025 08:10:45 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEka-0000000EC8w-0pTs;
	Fri, 24 Jan 2025 08:09:23 +0000
X-UUID: 7b79a466da2a11ef82ff63e91e7eb18c-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wtQOlTsq2aqW/cqChizVEMSjtzIiau0H6QNSNzAE6yY=;
	b=ZqFDjqvYmguzkUGRUHq74fz6Mch1t5s/y5s2RWGc4BkR8APshFBdEGd2rbUAzWbevCeWKESXcCt2RjMPJfRxOD0VWS735G/hNlYi63LVuglXm6GcfJqH48SEh4TwSSTljg3Z24o9IrB1V7rMqNtXkturAKZLE0hdqXgDnHren7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5478f889-3d4a-44d7-87bf-71a9c445a4f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cbcebcfe-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7b79a466da2a11ef82ff63e91e7eb18c-20250124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 598676198; Fri, 24 Jan 2025 01:09:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 16:09:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 16:09:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfFmUfjKbi3GlA98w0GUSKTtpq6VtRIGWRPDRazjK28rTqfu+UkFliRK2t6W1W6ba+h8FDqvkSk2yQ1G/lT1TL4Rn/tEK8VTjr4V3Qpu6LifiD/Xntr7xYNQbsIM9ikpJlfjSt0EiKYVPtcTjsGrew9wV8MWEyv8MUgyWcI62v66Rlc7oZFlPxpntaAPSbJkszAdS8kVaqqe/kkZglXtR2sqGUq8LEVCf8DAEB9hHjoNTlbuSZ/DowVXvWrDg1IVfta4k2gmbPnDtTHemKQEucLJ3y+yPlerHhyGm4mclW49uJ5GDhqKYT6/2Z2NIY1mASndL8dbbvk3WU8dlqY4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtQOlTsq2aqW/cqChizVEMSjtzIiau0H6QNSNzAE6yY=;
 b=FT0qdOcsfSWV26n/LK5JlbHsQ/oeCfnq6K41cIYXH6NKrcqqCffqRMyLOEdWkNf+1SFNrRngP/b0diexj7vLH4SqoT1TQPsvNL3GNS9eYK0ipIv90arM/d2xhA+IfHEKfdi0TUiE+i8PetlRZhq7+Xs0wK7viObcXuPI+aAdmMuCYUvkLNm+oO+RiCsp+eAcV2Gesbd4c0+3LXSTPHjF6uzm2ZUQqmBhDk4c2+45aWkEosDfcg0U+LHBlA1yodgViMDR6IYKgtpVjuZ0qmzgiAUKhdRoFIMX1GTzZtkywFXFJwP9Zx4vMJni6jlsOi95xlnG1K44dPU4MP0e0P2S3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtQOlTsq2aqW/cqChizVEMSjtzIiau0H6QNSNzAE6yY=;
 b=Xfh/kwvdpYpVVvhCcDNn8BXLv26GxxjX/mlJ508MFcGUyZTpNAtVx4nsk78QlsFx4PwiYE7espPRDkznemLlI2a3F/p/6g436TGdCmxjFENNuO5/e8gA5e6kKWSv/OfRnZfZeRgWNyanP9tqGp83+b0sC2Gk1lLG+GC+PlzDNzg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7467.apcprd03.prod.outlook.com (2603:1096:990:16::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 08:09:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 08:09:00 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 16/34] drm/mediatek: mtk_hdmi: Move audio params
 selection to new function
Thread-Topic: [PATCH v5 16/34] drm/mediatek: mtk_hdmi: Move audio params
 selection to new function
Thread-Index: AQHbZcr9c6IKooICMkq1yJEEF0RF5bMlotwA
Date: Fri, 24 Jan 2025 08:09:00 +0000
Message-ID: <5b4ed77cb84445f2bd4ce49cb210af902f5b1c9d.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-17-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7467:EE_
x-ms-office365-filtering-correlation-id: f4cf69ff-fa1c-4bd6-6943-08dd3c4e5c17
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MGIyZmVaekRhbmdRQjlveGlkVG5kWHpMaDhrZlBEc3ZaTU1vT1lIR1Z2Sm4y?=
 =?utf-8?B?UEhWUTNqNFpDZFNyeGpsMy9LRGJjQWV2cWgyQm9CSHBuWkZEQjNYcUFPaXA4?=
 =?utf-8?B?ckE1OEtUOEMzY2hpY1RCZElNRmdtS0JVNk5KMXlXeWlmVHlUMWwyMUxLRTZL?=
 =?utf-8?B?M05UUk9VOVUvcnorUkNTZjgzZTZJaDhEZGx4bm5ib1pycWFBbUlZTzJ4V0dj?=
 =?utf-8?B?ZEpPUEs4WFJiM1R5OW1pYW1mUmpnY1hYbGhDbmtKdU5KeGQxTks4OUtHNzNk?=
 =?utf-8?B?SFFmNDA1MDRoS3lUSEh4YlFTNHMrMi94c0pIZGhUQU54SnVyWWVwTUc2L0FS?=
 =?utf-8?B?Z2JPN2hsQVczTHR0QnFYdHRKUi9DUGJmY1pVT0xSZW1hQVRWS3pyRmVIbHN6?=
 =?utf-8?B?RXppS05Lc2pBU3lHc2RFTDJXL2ZLcWd0TmZXZm55TDZZL3cxSnBvd1BXMWtJ?=
 =?utf-8?B?bHptNHVsSHNSSlFOQnlwazF6Y0UzeVRXcVhOQ3h3UUFZbE5aUmRRSWpyZkdK?=
 =?utf-8?B?YmN2bXgxS01mQ1lza3RjanJybEJWcWZmTnBrd0tRbnNaYlFHZzI2YTNTR0Jq?=
 =?utf-8?B?TlVGTWIzQUJmZjE5ck8xSnUrcUdCVEFrS1NnODlzT2NENERWUUV4SHBjNWNK?=
 =?utf-8?B?SlRrb256SEZYMk5CWnkvZXFtOVdWQ0xRSDk2RzhadWVKSjNCQjdsa2UvSW14?=
 =?utf-8?B?VTc0UnR2SnhYeWdRQ0hQMVd6RmtlUnR2UjhTL21JK0RubnpkcldtY3c0a0R3?=
 =?utf-8?B?eGNmZmdSRW9vSThLSXZyVEtPOUl2aSsycHlaUlZ4eVpkRm5RQnZMU1NSOFcz?=
 =?utf-8?B?aHhnVExtcW5WVElxWTlMbENyTklsWnF0a092M2NuREVSem5nT1FyYjV2MHBM?=
 =?utf-8?B?NlJNVm84d1ltenFkWmR4bHJpUVBnSlB0YjE5REgyZlVDbTB2ZDdVaXNRU0th?=
 =?utf-8?B?SWFzdFN6RVcxSFBNeXhWRjFOc0kva012dGRaWmJ6bWlYVm04VG5wV0YyN1g3?=
 =?utf-8?B?OHM1ZTI4cjY3RU5ybkxUckFXV0JOanc4NlVPV2dsUTl2RmY4eXdZVjN1MUNW?=
 =?utf-8?B?K2V1WkZFQ05VeTJoQjRzRGxVRFZISjY0NS9IVWZielBFSXA1VUFDSGV4ckRr?=
 =?utf-8?B?Y09jNUdrampxZXlVQjhjSlN5TUtWOXhIbVNQYTAyYlVaVHhHRUZFdHVVTXNW?=
 =?utf-8?B?MlhEQXhKQVRJeVg2VTFNK2lad1I4ZHFVRXNRQ2NmVE1vR29VNDUzM0ViRkRP?=
 =?utf-8?B?Slp3d01yc3BuU2tBN3VoNGhlNDlMWTNBUDcxTnljUWhlOHgzaHU1RzdYTS9W?=
 =?utf-8?B?aHZhaDZzaWhHNS9DVXYwbXpGSTRwdjFnWlNwTlpqb3llR1JvN3oxR2VDNThy?=
 =?utf-8?B?R2s3ejZQKzM1NUhLWkFtbVFDYlF2N2dMNGpndE9SRTUvcXdIYXRSWEk4UGpu?=
 =?utf-8?B?c1h0STF6NjlDYnhoNDRuM1ZSeDk4ekd5VkZnN1RDdzJKWE5mUFVXTkhiR0xR?=
 =?utf-8?B?VjhaenJqR1hDWmNzNDJXTzJJbnAxY1gyTlRJZ1Q0NUtYbkNxTzY4TkNLdkV5?=
 =?utf-8?B?dnBEMVFsbnVTQ3Z1M1JhSjRTUVBpQ09VU2VjQ1ZiWmVWd25FTjRFaEN1ZW9P?=
 =?utf-8?B?azhqSzg0ejNMMk9LeTViZnZHcGIySThXWndkbnhrVS9yOGxIMCtCTmhnaFIx?=
 =?utf-8?B?SllpMDArSnA3ZUEvTjc5cDlkWGZNY3RnRlloZHBKeDhyakdwRnRkYUhaUVc5?=
 =?utf-8?B?V3JoUFFiclpGQ0EwRnJFRGIyWTRBZnp2cSt5UVpkc0pEdFJSQm9vWnJHNWVw?=
 =?utf-8?B?U1pvVU8rZ2t2REhiU29nRWFHR0JGNC9rNDFVczlKejVCcUdBa0tmYlpUeGsx?=
 =?utf-8?B?Q3VXWkJpdTdqek1wYkVHSWg2MzZ4QS9SSnl6ejNCU1pzbWV0ZGpMVmRqZlQ5?=
 =?utf-8?Q?4TvjJvNOa+RsNoYsJd2jZi9YvMxITELX?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGdsUytPQ1NmSEo0dWQwTXdkTVJ2ZnYxVmF1QzVONXlZWU9FaUtRcFNPeC9P?=
 =?utf-8?B?Vk54cXFhTXN2M1Zwc3REWWljR2ZUZlI5YXFtbFVsaTFPVTBucjgxOVZCdFFy?=
 =?utf-8?B?ODNTenlvREhHZUZhbTE5eFZIQWFiM2t6OFZIRGhPaXdpSVR1RlpOOXNsMWRQ?=
 =?utf-8?B?eS9nVFhnTHZVMlNLSSt5bVNvaHFMQVZqTEJpZkFNMUFHdWk1UEFITnlYQnY2?=
 =?utf-8?B?c3d6bzlOZTR3RE9uSzN2U1l4SXpHRXk1Z1o4TVVVYTlKNXdxWnJWUkVLSlVT?=
 =?utf-8?B?Y2ZBWWxLUG05eUcrRGs4ZUNJU2xuT2N1eVJKR3FnY3AxZWZYeW4zRHdNcjR5?=
 =?utf-8?B?V0I1YXBHK0UzODVBR2lmVDlLUDU2Q0Roa0FjN21ZeUNyVm9LYUpzWHhVRHZJ?=
 =?utf-8?B?RmducDFMS1JXVVcrd2JqaGxCT0EzUnZtYjRlUWt5b25ZZU1FTlB4dFJqSUhq?=
 =?utf-8?B?VnpMcER0eU9CR1NORzdXd1ZQd0I3Ym82bVZ6d21uNFhLYllKNTJlRDl1VHk5?=
 =?utf-8?B?dSs0UjF3R1BaTVRHaUI5V004UWpJTWpvSlR0dE42V1JDZnFxTlJkQWNPVU5w?=
 =?utf-8?B?U2hlSzJ6ejJDcUhKVGxOSS9GZE5ReEJHc0dRKzF1R0x1Ri9oMzhDVC82dnRT?=
 =?utf-8?B?SExYTGt3QXpOU3F0UEJnVEUvMENDdjBOa1lpR1JhRUROa29RUWR3WG9Pc3hO?=
 =?utf-8?B?MEl5WkNEZjRsNWlkcUUwREhLRm8rczBuYU1lMlZtTG4waUROYmpBUGVkdFRE?=
 =?utf-8?B?MzA2VlBFNlpPTXJvdVhTVFRCWmVlZ2l4U0k1Ry91elZ0bVoxOEZVU21GVzJY?=
 =?utf-8?B?NmkrNFNNQ3hSQUdoaDN0SHJhdHh5eTllK2x2NHNRNVZTbG01Ri9hdHRlcko5?=
 =?utf-8?B?dVZzQVVQbGVtRVQvbU5xd0NnTnNlYlZrcFJBbUlSb2JUZjRpcitHV05lUlhS?=
 =?utf-8?B?N00xYTRkaEZMVFN1dkh3aTd2N0NNalBtWW5TRkJLMXVvQU1ISG1BNDYrMEVp?=
 =?utf-8?B?RFVXdU9IdW1ianFscVJnSDlFakFSOFpUbWpHaThBOTlXUGZTRmgvWDZMODY0?=
 =?utf-8?B?YVQ2cXVCalVnaWdHcGVOakhoY2tkdGUyT2V3WEJCRW1vS0hSQU10dzRybVB0?=
 =?utf-8?B?YVhrZWN2Y1ZXUUVIckdhZmJPSFFQWmhoWlZLNWIwdWZNSW5GRjc2aytuYnRn?=
 =?utf-8?B?TmphRnRIWCt2U1JkajNTZmdIWXVvMDNJMVArY1Z1cEpjYncxa1JaanZwaGtK?=
 =?utf-8?B?bFBXajhGSGN5cDl4ak5GMDNjb3p2UysyWmZ2bjh2elJKeGJYa2Npc0FIeWQx?=
 =?utf-8?B?bG9udE1RT2lQSTRQTDc3Zk9IZzFXTlhHNkkwVVc1MEt0NGpiQnlZMFp5Nk1q?=
 =?utf-8?B?anhXSVNUSVFMT3BUMjNIUlgvY1pmQ1Y0UTNGTVNPckdNVmQralkvV0diaWtL?=
 =?utf-8?B?bDROS0hiUGFwM29nbGE4OUVRVFk4MUxicXEzTHh5QlRLOXl6T1I1UHd4ZFFi?=
 =?utf-8?B?YXkrTEZOZWFyUzZGWHRBWmNRNXNNZHNheEhiZGJDcXhiUDdQRE5aeEZnVDVa?=
 =?utf-8?B?MmFQazlMdG1yUkhnZEZDTmtaUDJPWkMyOHZhdkROMXFhRlgreitSTmFya0tj?=
 =?utf-8?B?UjYwT0lBdFc2dUtJSXNTUjJhRDAvYmx1bTZKRzJFVll1Yk9CMDRZQlFMaG40?=
 =?utf-8?B?WE0vZ0Y0VmhnUHBvb2RVVWxTbGpmd1R4b3FVcThHYmNuSXNKNmFiSXpZWUFu?=
 =?utf-8?B?emZ0UUdYcFVHcDBsbWJtK3g1T2N2SlFYRHJnY3ZkRlNzQWx2VWl1N0pndUlJ?=
 =?utf-8?B?RmZ4QnFSUlVFMStyNUxDSFVXc09OZFkwZnU0Yi8rRTd2N2ljSmc1bmI3bm1t?=
 =?utf-8?B?N3hWamVKcTErWG1nWE44dVZGRmhveklvTFpJUTYwcmQwUGp0U2tqaG9ucWpE?=
 =?utf-8?B?cnBvZlduUmgrWnpqZWdZZWZVbnMzbDZaWU9STFZsUDV1ZjdmU1Yxam42bmVW?=
 =?utf-8?B?Z3B6eE95YWpIOGRvcHFNRVRRMUw5c2o1cFBPZ1FiTUNxNFdmYm5GNERibktH?=
 =?utf-8?B?R0RSdk9aN3RwWGlROUpFdVpTZ3UyckcvYm9ReHBEeHdyVU4wT2ZxYXJxQ3k0?=
 =?utf-8?Q?ZiuWdjv9jJetajIXLMVEGsz8P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B375065F9D8204893D768E236C80E2F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cf69ff-fa1c-4bd6-6943-08dd3c4e5c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 08:09:00.6097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blIBdjfWdu/Nhga/LHYmRrjx9rCe/EbOx8UMiWXa57HeZdQSdVR/WAFw1pteqev9u+nKH0RdO2QEKwcy2VxhqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_000912_247824_76E28327 
X-CRM114-Status: GOOD (  17.25  )
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

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3Igc3BsaXR0aW5nIGNvbW1vbiBiaXRzIG9mIHRoaXMgZHJpdmVyLCBtb3ZlIHRoZQ0KPiBhdWRp
byBwYXJhbXMgKGNvZGVjLCBzYW1wbGUgcmF0ZS9zaXplLCBpbnB1dCB0eXBlLCBpMnMgZm9ybWF0
LCBldGMpDQo+IHNlbGVjdGlvbiB0byBhIG5ldyBmdW5jdGlvbiBjYWxsZWQgbXRrX2hkbWlfYXVk
aW9fcGFyYW1zKCkuDQo+IA0KPiBXaGlsZSBhdCBpdCwgYWxzbyByZW5hbWUgImhkbWlfcGFyYW1z
IiB0byAiYXVkX3BhcmFtcyIgYm90aCB0byBtYXRjaA0KPiB0aGUgbXRrX2hkbWkgc3RydWN0IG1l
bWJlciBuYW1lIGFuZCB0byBjbGFyaWZ5IHRoYXQgdGhvc2UgcGFyYW1ldGVycw0KPiBhcmUgZm9y
IEhETUkgQXVkaW8gYW5kIG5vdCBmb3IgSERNSSBWaWRlbyBjb25maWd1cmF0aW9uLg0KDQpSZXZp
ZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyB8IDYzICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYw0KPiBpbmRleCAwNjU3NTAwNzVkN2MuLjVhM2UwZjRlNTUzZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gQEAgLTE0NjUsMTkgKzE0NjUs
MTMgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3QgbXRrX2hkbWkg
KmhkbWksDQo+ICAgKiBIRE1JIGF1ZGlvIGNvZGVjIGNhbGxiYWNrcw0KPiAgICovDQo+IA0KPiAt
c3RhdGljIGludCBtdGtfaGRtaV9hdWRpb19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
aGRtaV9jb2RlY19kYWlmbXQgKmRhaWZtdCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGhkbWlfY29kZWNfcGFyYW1zICpwYXJhbXMpDQo+ICtzdGF0aWMgaW50
IG10a19oZG1pX2F1ZGlvX3BhcmFtcyhzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX2RhaWZtdCAqZGFpZm10
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaGRtaV9jb2RlY19w
YXJhbXMgKnBhcmFtcykNCj4gIHsNCj4gLSAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLSAgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSBo
ZG1pX3BhcmFtczsNCj4gKyAgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSBhdWRfcGFyYW1z
ID0geyAwIH07DQo+ICAgICAgICAgdW5zaWduZWQgaW50IGNoYW4gPSBwYXJhbXMtPmNlYS5jaGFu
bmVsczsNCj4gDQo+IC0gICAgICAgaWYgKCFoZG1pLT5hdWRpb19lbmFibGUpIHsNCj4gLSAgICAg
ICAgICAgICAgIGRldl9lcnIoaGRtaS0+ZGV2LCAiaGRtaSBhdWRpbyBpcyBpbiBkaXNhYmxlIHN0
YXRlIVxuIik7DQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gLSAgICAgICB9
DQo+IC0NCj4gICAgICAgICBkZXZfZGJnKGhkbWktPmRldiwgIiVzOiAldSBIeiwgJWQgYml0LCAl
ZCBjaGFubmVsc1xuIiwgX19mdW5jX18sDQo+ICAgICAgICAgICAgICAgICBwYXJhbXMtPnNhbXBs
ZV9yYXRlLCBwYXJhbXMtPnNhbXBsZV93aWR0aCwgY2hhbik7DQo+IA0KPiBAQCAtMTQ4NiwxNiAr
MTQ4MCwxNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+IA0KPiAgICAgICAgIHN3aXRjaCAoY2hhbikgew0KPiAg
ICAgICAgIGNhc2UgMjoNCj4gLSAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9pbnB1dF9j
aGFuX3R5cGUgPSBIRE1JX0FVRF9DSEFOX1RZUEVfMl8wOw0KPiArICAgICAgICAgICAgICAgYXVk
X3BhcmFtcy5hdWRfaW5wdXRfY2hhbl90eXBlID0gSERNSV9BVURfQ0hBTl9UWVBFXzJfMDsNCj4g
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgIGNhc2UgNDoNCj4gLSAgICAgICAgICAg
ICAgIGhkbWlfcGFyYW1zLmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9DSEFOX1RZUEVf
NF8wOw0KPiArICAgICAgICAgICAgICAgYXVkX3BhcmFtcy5hdWRfaW5wdXRfY2hhbl90eXBlID0g
SERNSV9BVURfQ0hBTl9UWVBFXzRfMDsNCj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAg
ICAgIGNhc2UgNjoNCj4gLSAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9pbnB1dF9jaGFu
X3R5cGUgPSBIRE1JX0FVRF9DSEFOX1RZUEVfNV8xOw0KPiArICAgICAgICAgICAgICAgYXVkX3Bh
cmFtcy5hdWRfaW5wdXRfY2hhbl90eXBlID0gSERNSV9BVURfQ0hBTl9UWVBFXzVfMTsNCj4gICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgIGNhc2UgODoNCj4gLSAgICAgICAgICAgICAg
IGhkbWlfcGFyYW1zLmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9DSEFOX1RZUEVfN18x
Ow0KPiArICAgICAgICAgICAgICAgYXVkX3BhcmFtcy5hdWRfaW5wdXRfY2hhbl90eXBlID0gSERN
SV9BVURfQ0hBTl9UWVBFXzdfMTsNCj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAg
IGRlZmF1bHQ6DQo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGhkbWktPmRldiwgImNoYW5uZWxb
JWRdIG5vdCBzdXBwb3J0ZWQhXG4iLCBjaGFuKTsNCj4gQEAgLTE1MTksMzEgKzE1MTMsNDQgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9hdWRpb19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhLA0KPiANCj4gICAgICAgICBzd2l0Y2ggKGRhaWZtdC0+Zm10KSB7DQo+ICAgICAg
ICAgY2FzZSBIRE1JX0kyUzoNCj4gLSAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9jb2Rl
YyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiAtICAgICAgICAgICAgICAgaGRtaV9w
YXJhbXMuYXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0laRV8xNjsNCj4gLSAg
ICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5QVVRf
STJTOw0KPiAtICAgICAgICAgICAgICAgaGRtaV9wYXJhbXMuYXVkX2kyc19mbXQgPSBIRE1JX0ky
U19NT0RFX0kyU18yNEJJVDsNCj4gLSAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9tY2xr
ID0gSERNSV9BVURfTUNMS18xMjhGUzsNCj4gKyAgICAgICAgICAgICAgIGF1ZF9wYXJhbXMuYXVk
X2NvZGVjID0gSERNSV9BVURJT19DT0RJTkdfVFlQRV9QQ007DQo+ICsgICAgICAgICAgICAgICBh
dWRfcGFyYW1zLmF1ZF9zYW1wbGVfc2l6ZSA9IEhETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQo+
ICsgICAgICAgICAgICAgICBhdWRfcGFyYW1zLmF1ZF9pbnB1dF90eXBlID0gSERNSV9BVURfSU5Q
VVRfSTJTOw0KPiArICAgICAgICAgICAgICAgYXVkX3BhcmFtcy5hdWRfaTJzX2ZtdCA9IEhETUlf
STJTX01PREVfSTJTXzI0QklUOw0KPiArICAgICAgICAgICAgICAgYXVkX3BhcmFtcy5hdWRfbWNs
ayA9IEhETUlfQVVEX01DTEtfMTI4RlM7DQo+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gICAg
ICAgICBjYXNlIEhETUlfU1BESUY6DQo+IC0gICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5hdWRf
Y29kZWMgPSBIRE1JX0FVRElPX0NPRElOR19UWVBFX1BDTTsNCj4gLSAgICAgICAgICAgICAgIGhk
bWlfcGFyYW1zLmF1ZF9zYW1wbGVfc2l6ZSA9IEhETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQo+
IC0gICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5hdWRfaW5wdXRfdHlwZSA9IEhETUlfQVVEX0lO
UFVUX1NQRElGOw0KPiArICAgICAgICAgICAgICAgYXVkX3BhcmFtcy5hdWRfY29kZWMgPSBIRE1J
X0FVRElPX0NPRElOR19UWVBFX1BDTTsNCj4gKyAgICAgICAgICAgICAgIGF1ZF9wYXJhbXMuYXVk
X3NhbXBsZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0laRV8xNjsNCj4gKyAgICAgICAgICAg
ICAgIGF1ZF9wYXJhbXMuYXVkX2lucHV0X3R5cGUgPSBIRE1JX0FVRF9JTlBVVF9TUERJRjsNCj4g
ICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgIGRlZmF1bHQ6DQo+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGhkbWktPmRldiwgIiVzOiBJbnZhbGlkIERBSSBmb3JtYXQgJWRcbiIsIF9f
ZnVuY19fLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBkYWlmbXQtPmZtdCk7DQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICAgICAgICB9DQo+IC0NCj4gLSAgICAgICBt
ZW1jcHkoJmhkbWlfcGFyYW1zLmNvZGVjX3BhcmFtcywgcGFyYW1zLA0KPiAtICAgICAgICAgICAg
ICBzaXplb2YoaGRtaV9wYXJhbXMuY29kZWNfcGFyYW1zKSk7DQo+IC0gICAgICAgbWVtY3B5KCZo
ZG1pLT5hdWRfcGFyYW0sICZoZG1pX3BhcmFtcywgc2l6ZW9mKGhkbWlfcGFyYW1zKSk7DQo+ICsg
ICAgICAgbWVtY3B5KCZhdWRfcGFyYW1zLmNvZGVjX3BhcmFtcywgcGFyYW1zLCBzaXplb2YoYXVk
X3BhcmFtcy5jb2RlY19wYXJhbXMpKTsNCj4gKyAgICAgICBtZW1jcHkoJmhkbWktPmF1ZF9wYXJh
bSwgJmF1ZF9wYXJhbXMsIHNpemVvZihhdWRfcGFyYW1zKSk7DQo+IA0KPiAgICAgICAgIGRldl9k
YmcoaGRtaS0+ZGV2LCAiY29kZWM6JWQsIGlucHV0OiVkLCBjaGFubmVsOiVkLCBmczolZFxuIiwN
Cj4gLSAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9jb2RlYywgaGRtaV9wYXJhbXMuYXVk
X2lucHV0X3R5cGUsDQo+IC0gICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5hdWRfaW5wdXRfY2hh
bl90eXBlLCBoZG1pX3BhcmFtcy5jb2RlY19wYXJhbXMuc2FtcGxlX3JhdGUpOw0KPiArICAgICAg
ICAgICAgICAgYXVkX3BhcmFtcy5hdWRfY29kZWMsIGF1ZF9wYXJhbXMuYXVkX2lucHV0X3R5cGUs
DQo+ICsgICAgICAgICAgICAgICBhdWRfcGFyYW1zLmF1ZF9pbnB1dF9jaGFuX3R5cGUsIGF1ZF9w
YXJhbXMuY29kZWNfcGFyYW1zLnNhbXBsZV9yYXRlKTsNCj4gKw0KPiArICAgICAgIHJldHVybiAw
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2h3X3BhcmFtcyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX2RhaWZtdCAqZGFpZm10LA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaGRtaV9jb2RlY19wYXJhbXMgKnBhcmFt
cykNCj4gK3sNCj4gKyAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsNCj4gKw0KPiArICAgICAgIGlmICghaGRtaS0+YXVkaW9fZW5hYmxlKSB7DQo+ICsg
ICAgICAgICAgICAgICBkZXZfZXJyKGhkbWktPmRldiwgImhkbWkgYXVkaW8gaXMgaW4gZGlzYWJs
ZSBzdGF0ZSFcbiIpOw0KPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAg
ICAgfQ0KPiANCj4gKyAgICAgICBtdGtfaGRtaV9hdWRpb19wYXJhbXMoaGRtaSwgZGFpZm10LCBw
YXJhbXMpOw0KPiAgICAgICAgIG10a19oZG1pX2F1ZF9vdXRwdXRfY29uZmlnKGhkbWksICZoZG1p
LT5tb2RlKTsNCj4gDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K

