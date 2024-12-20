Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B7EE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 03:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh6PQZujgLv+qRl+QaeMaWMf/6YgjC3ffyWiTzZ/WLA=; b=t+jfxpQaEuLBaLzGW9g5QBKszI
	bJU9viG6L3RiZpXfT7eUbY1LUcC/IPZA6eeYf1FYaiWqaO7R2J1nQ/W9DDEtuLbev24iwObXLjMhI
	fLH74/+VwPmsSy/1DGom4ovlw6MO3noOEte9w+1bxvz9YvFeDGE/tzISjUpTTIzXAVcMPXA0IQvu/
	HBqknsY1OpHgsM8YqSG4ewA9E4CuAD6Nx4NT7gLn3RAvp/3JpVobNZzwzUTjvxQGnPGZGdO1FpMpG
	fznqWgEZg7Ok2WU8TTAGpldb/JOUCkOqWED+cMWJe488plPJ8n2YTccEn6FKMMXP3HexfMmunGmsL
	7PTJb5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOU02-00000003pN7-3I57;
	Fri, 20 Dec 2024 03:48:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTyt-00000003pHC-1FEN;
	Fri, 20 Dec 2024 03:47:16 +0000
X-UUID: 1918448cbe8511ef82ff63e91e7eb18c-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mh6PQZujgLv+qRl+QaeMaWMf/6YgjC3ffyWiTzZ/WLA=;
	b=i0GovzIn0SuNYa6Stk7jTzxB6CJq3h1c9QN8kTQoaT7M2jvcv6/ctKj+g7SQP42cEPuRgGLwUotwPmFt/hBaRqvVYzpA26sOxTk+VWyj398MtHpUcG9aR7HlaRpMHmJGTNH2bOkv4ueZM9tSonB2xCOoA35rRcV0iTtwHI/pVhQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9b2233e5-bc4c-4759-ad19-cd9f48ba4e1e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:8b911094-0286-4820-a24e-6305e82d1261,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1918448cbe8511ef82ff63e91e7eb18c-20241219
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1757510154; Thu, 19 Dec 2024 20:47:13 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 11:47:10 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 11:47:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGZkiWkC77YNlKzKHaXugeekkxmLRlgD9WCSRXjB8js1PeercpYOU6tjY7ALctnckqIHWuhvNpHKU48ZCKjXmKB4nLACTu/bIwDMUQQ1NfKRz3DEYvd3fvN7VZX7Evwr6hoSINjFERL46dZxrMZae1XVwCiUPstihIsYtdj6vdA+jClhPYOPrUoed+MZAsMcoUDFwMESIMJFkA0NEgruXwWDSYyda02MKONvxX4Pj9NIlwvzsqGGUKpMeWuHUiGutyhDCPmIw52uWKePNHxoJxkhGdJ8/HxhjOwiZsSc0DGBiTABbVkyhmK7yYN4lbIVOi9pdOYj8eXKao68o3IPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mh6PQZujgLv+qRl+QaeMaWMf/6YgjC3ffyWiTzZ/WLA=;
 b=WvDJmsDxPwQ8O6thjDixB3KbQe5CYhzVIy0/ZnnASnNhCbZdxTU1sSlqOzt7DwK5vfxffVPH3n1VYfgfodQ7ViDOwSP3qbipz60CjwfT6HXb3qCoTvxbawyiQ5xemF0cyKeYKEw3peG3J0LFecqIUv3XWQ1CW7vWxvBQU0bVOhbbC6f/wcj/5BZjmwlCxeI62cPQCn/DcePTIEyHnAxqafjJrJ/fEVVM5v0sNyqWYGcRmcZ6AiUvcAZNDy5JWWVgFnlBsXoXzQ4jT7dhVQ1oQHWzB8z3ZD3E/e4wobMQxa1XLhencAkSs5SWErTA8dR3VrSAHYFvkG2RlZXBpMJ8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mh6PQZujgLv+qRl+QaeMaWMf/6YgjC3ffyWiTzZ/WLA=;
 b=mTcF0Jfdu1ZQ8slHkGjRdAM0JecSugabSYLl/9P7ESG1bip85/dA76Wi7bKrcOkKed34Bb3UUGnmjHNpR/nhqXle511lSz3x/SH71KHBgqveosBbbixZwrv+i85nVdmuPKDpKnikjLQZ1J3vbBM7CB3z+5nfwYWq3z5V2jN/zog=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8246.apcprd03.prod.outlook.com (2603:1096:405:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 03:47:08 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 03:47:07 +0000
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
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 14/33] drm/mediatek: mtk_hdmi: Move audio params
 selection to new function
Thread-Topic: [PATCH v3 14/33] drm/mediatek: mtk_hdmi: Move audio params
 selection to new function
Thread-Index: AQHbUJqmB9Xla3oTnE6kU63uJLJO9LLugncA
Date: Fri, 20 Dec 2024 03:47:07 +0000
Message-ID: <03d20d6d77b54c25b9d7e65899a67359fae6130a.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-15-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8246:EE_
x-ms-office365-filtering-correlation-id: 9e6e2c47-81f9-47d4-db58-08dd20a8f9d7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S1FDeHlBRTBrWlYrclYvZjF1RSs0dkNjdHlzRWZMN2liaUlyeE5MUWoxbWZ5?=
 =?utf-8?B?U01aM1hzL1ZkOXY2STNrSFB6VU9BTUVubkE5RDJ0UTZBdm5yY2xsMXk5NC92?=
 =?utf-8?B?RWJLbC9UR1o5SUMxdVBDODdLWHlDZ3dMb0tTNlZ0ZkdYbXdsREZJbUh4aTBD?=
 =?utf-8?B?Q3VmVWdWZ0JDblQyMEFTSWN4UVNJcFNEV2VOTEJvejFrUXNrblpLT1dZQy84?=
 =?utf-8?B?YXFwMldIMEc1ckJDdHJ6TDMrbnVtdG9IdSt1Yk9ZRmNVRDVkUUg1WEhVbW1Z?=
 =?utf-8?B?VTEyTWZNVHd0YjhZMzdENzJhZlk5Z29Gcm8zME85K1lWd0pDTVpkMm9vUE1j?=
 =?utf-8?B?ZDNYYXlXdlJneWIxRFlRTFJOdkluTTJTZmc1STM3c0RYUlJmbno3TXNaRzFR?=
 =?utf-8?B?cUt2UURVTWwvVURGQWNiUmc0MytpY2I5Y1U3dE9vWmFKNFRBZDROeDFtTHAx?=
 =?utf-8?B?MEdybnBnTFI4cVcwZFRNZlQ2NE1VbWdSbTlSdjFXMkZRUHRsYitiODN0TFg3?=
 =?utf-8?B?SFpoQ0tkYXNpME9YKzgveVFTSnJ4WHhZei8rWVNDNExXQ1ZCOGxkS001TmxY?=
 =?utf-8?B?NkVTbXl3NWNqMzlwUzdXODRPdDhJN1oweERQSDBYd2pWalMrdTQyTXMwMWo0?=
 =?utf-8?B?SEI5MFphYVEvOXRNUXRUYkExaFAySHdGN1p2OGd0cWl5Y21nTnBHZFRXQnVJ?=
 =?utf-8?B?eUwrUHh3L0Y0MmYwNHB6Vzh6cDJ0MVNrTGNWbmxFekRmZWNqOUZjTlBPUGZv?=
 =?utf-8?B?SVlFQWNvMFRzZ2VNN0NMVm5vTWZWNTJQTXM3R0NzRldSVnQvYU5CVDJrOXJs?=
 =?utf-8?B?MkhzeWQvdldsSUdGOHlLQ3hFUEhZbWtVSVQrcThsbVd5QmNDbTBKLzRuZzZV?=
 =?utf-8?B?bnNwWExhZi8vRHIrSVExemx4d0lLTC93dlZvZVBudE5jWmRYV05rSGxXTGda?=
 =?utf-8?B?STlnSkRHU1lqTDRJZXNDWnVBS3FMY0tSM042NnJWVXZlUU94dGROM1BXL0c3?=
 =?utf-8?B?dlVPTUlidzF6NTIydWdtaDBQSFFBWlBML1ordlF0cEVNNGcyYXloWlBTaDRq?=
 =?utf-8?B?OU5QWHdXemliOXJ0c29pcTUvYTcraExVMVBpbkFYY3k2RWdtT1MwM0hmQkJS?=
 =?utf-8?B?VWpoMTJyeDBEUlJzV1g4UHJNNlc2MUp6eWV4Yytxd295MTc0QW1meXJ1Ukd6?=
 =?utf-8?B?bG15VmRIR3JuV3BPTEJleCtWZ1QrY0wrSkVlT05qL2RDekFUS1d1NVJYdDVq?=
 =?utf-8?B?Q2t1Q1JSMzYrMkZRdkhhZWZFMkxxUU5KaVhmOWkzRE5Odmd3R0NqMzhCNEhN?=
 =?utf-8?B?empmdnpoWGgyQ1NFQWhuckYrK3dTVkdkdnE3Lzh5a2swUW5uZnloOUY1UWV4?=
 =?utf-8?B?VC9JWnZxMmFaOHNMbUVJcU1pd2RtaHh2VmdzWUNXMG45RS9yK1MwS3djbDY5?=
 =?utf-8?B?d3Y5OGtyZExDVlFQZVMwZURpMEl1YUp2TG15aTdLTXprazAyUEh5RTdJQTND?=
 =?utf-8?B?SXhMQ1JjbjVOMWtJNTI0WGIyem5zN3JzU2FrT2hlMzUzUlVUYW5ITlRkZks5?=
 =?utf-8?B?WjJBM0pTa0V6a1dCK0ZYWnlDNDUrbHFwclB6Y2RjL1RremliOWNXbHdZa29h?=
 =?utf-8?B?YUFJUWpkK09vY2dScDRRRTdJMFRzVXl4RVRnNmZtY2NObVVLdkN6bWRjQnpT?=
 =?utf-8?B?QWRvN2xHcFFIdlFFNUZUMlIxUTVZWjBQbVJtYmU2QVlnUDJBVGlvZHZESlVS?=
 =?utf-8?B?byswcjlFQkREMGswVUlNRXh6RWtGd2ltcUVRQ3N4Z2V3TER4NVBMMGhTZnBw?=
 =?utf-8?B?REhBS0ZQL2NEdldDdjNMenBBR0w1R3RFS3BObGE5amFoeXpCWVZYUFdhVU15?=
 =?utf-8?B?VWlhbS9Sc2N1RmYvZ3YzNEVDRGtrbUxNQklQdUR5RzVHVnltVjRZMEw2b2pt?=
 =?utf-8?Q?be0MZba7JCw8ND1T+eDgz0QNuR22Rxxk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTN3NnRTdDRvczh6OE9KVWdjQVVVcVRqY2xiREoxUkVZRTNkYzF5MGt5cFhI?=
 =?utf-8?B?Wld6QnhjalFMQ0hzOXpBdEhTMW5iWUx3WTRodkI2YzNKNUpyb2l4N0lxaXRC?=
 =?utf-8?B?RktBVFRBeWZQSURPRy9EWFZRaEhRM3Q1bHljOURrNFB6QTA4dEhDV1NvWVdE?=
 =?utf-8?B?ZUFTV2FKOGV5eTdqVjJrL3c0SldBRjB3Q0RVUEF6aStNSXFxL01VUU90Y1ps?=
 =?utf-8?B?NW50c3g2VUxUaGk4NXpLM2lIMXNDVlJpMDRuK2N6TGRnUXlNd1ZJLzBQbDRj?=
 =?utf-8?B?SXlXaXlydGdoNVBuZXVpM1BpYTczd1MzcXh6QXRodWdyKzluWCtncDU2TTcz?=
 =?utf-8?B?OXZZL3ZtZnlRa0lTM2JFTDVYSUQveUNFV1V6UWVtWmZ0aVlwdG5JWGd3emhE?=
 =?utf-8?B?bDRCUmx2dCtpdC9USkRIOWJJOEExY0ZhNFU5SS9SRnRKOFJuRjBTYjQ4UWlQ?=
 =?utf-8?B?eVlCTUNpOUQyK0sveGFJNzZ6R1U0bkF3OUZtNyt3UE9RdTdISm5DRjNVbjhH?=
 =?utf-8?B?bDlLeUFxa3RQVGcrZzlzbG9zWUZ0VktKQ3ZGTEljYzlpRVdmUEIveGJkMG4r?=
 =?utf-8?B?WnVWa3ptWnRJZDBmd2kyc21RUk9tMW9SMmJ4cHpEZCtLUENjdEhncndURlQw?=
 =?utf-8?B?UmM4amlQZXNCUnpZeHVNa0puRENkQ2dVbEd5aU82dVlaTWFyTHN4WXNYdkRS?=
 =?utf-8?B?VEo1ZWJ4VmY1RWxUOUZWSlhaUWdGbjM0bWwzZjJ3dWRralBWSXoyUk9FVnNi?=
 =?utf-8?B?bGxoMkpzRXVHdVhPV093ZVpjeWpJZG16RDRYT3NlOXZUWkRJbmlzTlBOV3VY?=
 =?utf-8?B?UmNkY1FpRkh3c0daUHZIOHUzSHptemIxeWhOdUNtU1NGaFpDRlUwd1g2K3pq?=
 =?utf-8?B?TCtVVXhoM0RnNzlWamo3NDdGOTRrUVNiVjByVG9nWW9BSSs1YzRyRHhibjg4?=
 =?utf-8?B?c2tUK0hlV1pLbkUwK1ZnNkVrNXhWMk12VzhvZHVrY0F3RjVuditZUkJMYW5T?=
 =?utf-8?B?N3JKQ3AxSTdRb0JJWWZwNGpQa0ZlSitHRHVRK0RHU3lVMGFSd1JVdVVZWDJL?=
 =?utf-8?B?SUp4KzRJeGZQVEdSSEZNbG10ei95Q2JoMFdyd0wvR1RnTDJLQnYyeWdaYzdQ?=
 =?utf-8?B?UFdSZHU1ejFBQkdMTEdaVGJsMkNwMEpwTnhYeVE5S2NSTkxPaCtUT29pdnhP?=
 =?utf-8?B?WXpoOTl2QVVobHkzdC9KellsVzBFVWdNSnBZL3N0NU9mckk1Tk5JMmk0ajA1?=
 =?utf-8?B?dzlHTHExQUlPU0dMWk53U3JkUWQwNnFPZ08yZ1BuQmh1czduVStoVmxqM3BT?=
 =?utf-8?B?RFZiVGN6QWZadkJsWk5CemZSZXRnbytuZnBRQzc0ZGF0b1ppUGFJOHljb2dp?=
 =?utf-8?B?ZkVQN2Z5dzJ5eFRDR24rVXBPYUhLNThpL0F4cnB6ajhuNFBHNVM3SW1XRUt4?=
 =?utf-8?B?SDl1dEJRa2xwRGIzdzJxb2FDYnlmcERyRzlSK01UWFJjTHVuS1RLNE45MkN1?=
 =?utf-8?B?UDZoc3JUK01YYitLSXlORXFIUWV0WC9iY2Mzc296V3kvT2NPSkdWZkR4bC92?=
 =?utf-8?B?QitrQjFweU1uK3hmZkFDVDFYNU4rL215Uno4Y01rM0M0NmE1aWdGRlhzbTlt?=
 =?utf-8?B?VVoveFlvRWJxTHBKYkl2UU5KdHVYbWxPQlIwaTZuSjhzSGxLa2ZKZHBFYkdB?=
 =?utf-8?B?a2htRkgvWXVsQVpmZHgwZnphN2FnOEVYRlJ0ZE1hWHNkTitjREdXekowMW9v?=
 =?utf-8?B?Z01sOFlRcnhkRWV3bGR3YXN2V1E5QVNiV3NtVitFTDZEZWxERUdnWjZZUTFm?=
 =?utf-8?B?Tzh6UnJMNHlsRmpNZ0xYd0MzcWI2blNmaVE0c3JLdWd6bmhYZDRwVGdCZlFk?=
 =?utf-8?B?NC9vWVpVeENZeHdGUHhGTUoyMVN0allwbHlBUWIzOWJrSzM3Zm5Oc1BuamZ1?=
 =?utf-8?B?dDE4em5RM2poM0laWjFGUUF3VE43QUU0UUVuYWVqTWJrOVllVHlKcHNMREFo?=
 =?utf-8?B?VzlZTTQwdTU5dlhCeGp5Z1AxMDFNNzBoTUpzd3l0VkMxZm1YbVdTNG95dHFm?=
 =?utf-8?B?LzF6YVRLcEVoOURpT1BuYml2UzRvejdPcG1QVUFLMWJSNmx3S0VpMndVaGZ0?=
 =?utf-8?B?aTFYR3E4L2lWblhZWUgzSlhTa2JlbGtIM0RiTUVnVUFleDBXVXgrS1NqU2tR?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8619BE49125CB4DA4ECA29436109A01@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6e2c47-81f9-47d4-db58-08dd20a8f9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 03:47:07.4504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FcJg/D+RAjpjgwgSHMeBM72KE0v/72C6/neqWP8g5+Fwkl+lFyId4WDNuLTf+GxytBJN7hAtG/LTB9zA86WUOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_194715_350747_7FBB6700 
X-CRM114-Status: GOOD (  15.05  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3Igc3BsaXR0aW5nIGNvbW1vbiBiaXRzIG9mIHRoaXMgZHJpdmVyLCBtb3ZlIHRoZQ0KPiBhdWRp
byBwYXJhbXMgKGNvZGVjLCBzYW1wbGUgcmF0ZS9zaXplLCBpbnB1dCB0eXBlLCBpMnMgZm9ybWF0
LCBldGMpDQo+IHNlbGVjdGlvbiB0byBhIG5ldyBmdW5jdGlvbiBjYWxsZWQgbXRrX2hkbWlfYXVk
aW9fcGFyYW1zKCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgNDYgKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGluZGV4
IGQyZjFkNjI4NmZiYy4uOGY1YWI5N2EwMjYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYw0KPiBAQCAtMTQ3OSwxMiArMTQ3OSwxMSBAQCBzdGF0aWMgaW50IG10a19oZG1p
X2R0X3BhcnNlX3BkYXRhKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4gICAqIEhETUkgYXVkaW8g
Y29kZWMgY2FsbGJhY2tzDQo+ICAgKi8NCj4gDQo+IC1zdGF0aWMgaW50IG10a19oZG1pX2F1ZGlv
X2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX2RhaWZtdCAqZGFpZm10
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaGRtaV9jb2Rl
Y19wYXJhbXMgKnBhcmFtcykNCj4gK3N0YXRpYyBpbnQgbXRrX2hkbWlfYXVkaW9fcGFyYW1zKHN0
cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGhkbWlfY29kZWNfZGFpZm10ICpkYWlmbXQsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX3BhcmFtcyAqcGFyYW1zKQ0KPiAgew0KPiAt
ICAgICAgIHN0cnVjdCBtdGtfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAt
ICAgICAgIHN0cnVjdCBoZG1pX2F1ZGlvX3BhcmFtIGhkbWlfcGFyYW1zOw0KPiArICAgICAgIHN0
cnVjdCBoZG1pX2F1ZGlvX3BhcmFtIGF1ZF9wYXJhbXMgPSB7IDAgfTsNCj4gICAgICAgICB1bnNp
Z25lZCBpbnQgY2hhbiA9IHBhcmFtcy0+Y2VhLmNoYW5uZWxzOw0KPiANCj4gICAgICAgICBkZXZf
ZGJnKGhkbWktPmRldiwgIiVzOiAldSBIeiwgJWQgYml0LCAlZCBjaGFubmVsc1xuIiwgX19mdW5j
X18sDQo+IEBAIC0xNDk1LDE2ICsxNDk0LDE2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfYXVkaW9f
aHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gDQo+ICAgICAgICAg
c3dpdGNoIChjaGFuKSB7DQo+ICAgICAgICAgY2FzZSAyOg0KPiAtICAgICAgICAgICAgICAgaGRt
aV9wYXJhbXMuYXVkX2lucHV0X2NoYW5fdHlwZSA9IEhETUlfQVVEX0NIQU5fVFlQRV8yXzA7DQo+
ICsgICAgICAgICAgICAgICBhdWRfcGFyYW1zLmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FV
RF9DSEFOX1RZUEVfMl8wOw0KPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgY2Fz
ZSA0Og0KPiAtICAgICAgICAgICAgICAgaGRtaV9wYXJhbXMuYXVkX2lucHV0X2NoYW5fdHlwZSA9
IEhETUlfQVVEX0NIQU5fVFlQRV80XzA7DQo+ICsgICAgICAgICAgICAgICBhdWRfcGFyYW1zLmF1
ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9DSEFOX1RZUEVfNF8wOw0KPiAgICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ICAgICAgICAgY2FzZSA2Og0KPiAtICAgICAgICAgICAgICAgaGRtaV9w
YXJhbXMuYXVkX2lucHV0X2NoYW5fdHlwZSA9IEhETUlfQVVEX0NIQU5fVFlQRV81XzE7DQo+ICsg
ICAgICAgICAgICAgICBhdWRfcGFyYW1zLmF1ZF9pbnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9D
SEFOX1RZUEVfNV8xOw0KPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgY2FzZSA4
Og0KPiAtICAgICAgICAgICAgICAgaGRtaV9wYXJhbXMuYXVkX2lucHV0X2NoYW5fdHlwZSA9IEhE
TUlfQVVEX0NIQU5fVFlQRV83XzE7DQo+ICsgICAgICAgICAgICAgICBhdWRfcGFyYW1zLmF1ZF9p
bnB1dF9jaGFuX3R5cGUgPSBIRE1JX0FVRF9DSEFOX1RZUEVfN18xOw0KPiAgICAgICAgICAgICAg
ICAgYnJlYWs7DQo+ICAgICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgICAgIGRldl9lcnIo
aGRtaS0+ZGV2LCAiY2hhbm5lbFslZF0gbm90IHN1cHBvcnRlZCFcbiIsIGNoYW4pOw0KPiBAQCAt
MTUyOCwyNiArMTUyNywzNSBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2h3X3BhcmFtcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+IA0KPiAgICAgICAgIHN3aXRjaCAoZGFp
Zm10LT5mbXQpIHsNCj4gICAgICAgICBjYXNlIEhETUlfSTJTOg0KPiAtICAgICAgICAgICAgICAg
aGRtaV9wYXJhbXMuYXVkX2NvZGVjID0gSERNSV9BVURJT19DT0RJTkdfVFlQRV9QQ007DQo+IC0g
ICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5hdWRfc2FtcGxlX3NpemUgPSBIRE1JX0FVRElPX1NB
TVBMRV9TSVpFXzE2Ow0KPiAtICAgICAgICAgICAgICAgaGRtaV9wYXJhbXMuYXVkX2lucHV0X3R5
cGUgPSBIRE1JX0FVRF9JTlBVVF9JMlM7DQo+IC0gICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5h
dWRfaTJzX2ZtdCA9IEhETUlfSTJTX01PREVfSTJTXzI0QklUOw0KPiAtICAgICAgICAgICAgICAg
aGRtaV9wYXJhbXMuYXVkX21jbGsgPSBIRE1JX0FVRF9NQ0xLXzEyOEZTOw0KPiArICAgICAgICAg
ICAgICAgYXVkX3BhcmFtcy5hdWRfY29kZWMgPSBIRE1JX0FVRElPX0NPRElOR19UWVBFX1BDTTsN
Cj4gKyAgICAgICAgICAgICAgIGF1ZF9wYXJhbXMuYXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJ
T19TQU1QTEVfU0laRV8xNjsNCj4gKyAgICAgICAgICAgICAgIGF1ZF9wYXJhbXMuYXVkX2lucHV0
X3R5cGUgPSBIRE1JX0FVRF9JTlBVVF9JMlM7DQo+ICsgICAgICAgICAgICAgICBhdWRfcGFyYW1z
LmF1ZF9pMnNfZm10ID0gSERNSV9JMlNfTU9ERV9JMlNfMjRCSVQ7DQo+ICsgICAgICAgICAgICAg
ICBhdWRfcGFyYW1zLmF1ZF9tY2xrID0gSERNSV9BVURfTUNMS18xMjhGUzsNCj4gICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPiAgICAgICAgIGNhc2UgSERNSV9TUERJRjoNCj4gLSAgICAgICAgICAg
ICAgIGhkbWlfcGFyYW1zLmF1ZF9jb2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0K
PiAtICAgICAgICAgICAgICAgaGRtaV9wYXJhbXMuYXVkX3NhbXBsZV9zaXplID0gSERNSV9BVURJ
T19TQU1QTEVfU0laRV8xNjsNCj4gLSAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9pbnB1
dF90eXBlID0gSERNSV9BVURfSU5QVVRfU1BESUY7DQo+ICsgICAgICAgICAgICAgICBhdWRfcGFy
YW1zLmF1ZF9jb2RlYyA9IEhETUlfQVVESU9fQ09ESU5HX1RZUEVfUENNOw0KPiArICAgICAgICAg
ICAgICAgYXVkX3BhcmFtcy5hdWRfc2FtcGxlX3NpemUgPSBIRE1JX0FVRElPX1NBTVBMRV9TSVpF
XzE2Ow0KPiArICAgICAgICAgICAgICAgYXVkX3BhcmFtcy5hdWRfaW5wdXRfdHlwZSA9IEhETUlf
QVVEX0lOUFVUX1NQRElGOw0KPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgZGVm
YXVsdDoNCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoaGRtaS0+ZGV2LCAiJXM6IEludmFsaWQg
REFJIGZvcm1hdCAlZFxuIiwgX19mdW5jX18sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRh
aWZtdC0+Zm10KTsNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgICAg
IH0NCj4gKyAgICAgICBtZW1jcHkoJmF1ZF9wYXJhbXMuY29kZWNfcGFyYW1zLCBwYXJhbXMsIHNp
emVvZihhdWRfcGFyYW1zLmNvZGVjX3BhcmFtcykpOw0KDQpZb3UgY29weSB0byBsb2NhbCB2YXJp
YWJsZSwgc28gdGhpcyBmdW5jdGlvbiBkb2VzIG5vdGhpbmcuDQoNCj4gKw0KPiArICAgICAgIHJl
dHVybiAwOw0KPiArfQ0KPiANCj4gLSAgICAgICBtZW1jcHkoJmhkbWlfcGFyYW1zLmNvZGVjX3Bh
cmFtcywgcGFyYW1zLA0KPiAtICAgICAgICAgICAgICBzaXplb2YoaGRtaV9wYXJhbXMuY29kZWNf
cGFyYW1zKSk7DQo+ICtzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2h3X3BhcmFtcyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX2RhaWZtdCAqZGFpZm10LA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaGRtaV9jb2RlY19wYXJhbXMgKnBhcmFtcykN
Cj4gK3sNCj4gKyAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gKyAgICAgICBzdHJ1Y3QgaGRtaV9hdWRpb19wYXJhbSBoZG1pX3BhcmFtczsNCj4g
DQo+ICsgICAgICAgbXRrX2hkbWlfYXVkaW9fcGFyYW1zKGhkbWksIGRhaWZtdCwgcGFyYW1zKTsN
Cj4gICAgICAgICBtdGtfaGRtaV9hdWRpb19zZXRfcGFyYW0oaGRtaSwgJmhkbWlfcGFyYW1zKTsN
Cg0KaGRtaV9wYXJhbXMgaGFzIG5vdCBiZWVuIGluaXRpYWxpemVkLg0KDQpSZWdhcmRzLA0KQ0sN
Cg0KPiANCj4gICAgICAgICByZXR1cm4gMDsNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=

