Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E8E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 02:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jv23q/i6/wIz2pUXJpHo6rKl3ctr2GOQpPP69HfG1lY=; b=Js8Pc+kIafKyT0p0HJRqCVMFdt
	eTX4hJ4TL3MdgJiz4+J/lWBiXtOmX49FTLUzLRv/oH57Fvd0QOYOJ0Hvp6Ug7ksH5aFeN149ULcwZ
	F/1DAjAqwT5d+pV2RQek08oXxnTpL6svhVosUmUjEEslG1C3ty8olFAnZJasXUv/qJcF7UfQBq4fB
	9aGx5o5esOwolkln7M4f/59iz1PRHwxCpHHsiYaHOiMRe6+VdV3MBYNMqwu9LPNZhDi2NIa6l/iJp
	eGMWoPux3tx12AD2PqYVhOW+XZoyBKtDc2v+5XecRkHK69F8LEyaL2oUCBSvHIaRMFv8eBu9LD1lG
	dcp6kutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOT8b-00000003kbo-2AV0;
	Fri, 20 Dec 2024 02:53:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOT7R-00000003kSI-15h2;
	Fri, 20 Dec 2024 02:52:02 +0000
X-UUID: 5a98eccabe7d11ef9048ed6ed365623b-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Jv23q/i6/wIz2pUXJpHo6rKl3ctr2GOQpPP69HfG1lY=;
	b=gVq8E5ZcXXg3tcLNLaH3xpTJNF6A7uTHEHccWZlkpdy2W93zFDs7nvGQhOZbyL5r6SaSg8jMS828H88eNpZ/Z+poZPqRwAmiK0Ydaen1o8WCe5JyXVA6LKuVxRDEHeuAmwyEDuhLFZw2o43q8puPed/eIYKxsL+01Bxmw+0npr8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c3e6339d-f4f3-49f4-a5d4-1192bdb9f698,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:630552e6-8d52-4d8f-9f93-b258cf7bc333,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5a98eccabe7d11ef9048ed6ed365623b-20241219
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1914798025; Thu, 19 Dec 2024 19:51:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 10:51:44 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 10:51:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFpAyxDDsUGaYjNekXoBhpR9PIeQXGUcMu2Upkw0VEJ6wy6DysZ7dXNWQP2YYE4nglDBiw7xNQh3fBNkMYeF72/KT4pKxXdPcoEZuem1kvioNamaIKKBdh1ABk1r9joMrl5ZdHzpGKKqcHdFuS11Si6LsmKFGlFy9sT1IzQMBMcJGV+Djjk5DxX9ncNmfDJmFgleCIfqthkAcoilmgs/QVcIa2EMdaooCuZw+twzsAe1BC5IeIJs6A47jZcRZYfJRN9MjNlk1fw5tege47RzuK7cjNBhZ2K17tl4G8sEuPWuHAigWPv3BlIFePXpHyCrf88gH7Bpfqv6D/XFc1a00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jv23q/i6/wIz2pUXJpHo6rKl3ctr2GOQpPP69HfG1lY=;
 b=lG9YYaGju6ApIqd4r78uXKR0e8f5JM0TuOsP+rD6WnQ6oJ2FRnO57wntcuDL5mfl6N14m4LOctB7aLMA+sbD1f0jig1Q9GonL7QWkSqErkR8UdW79QyHSVT6fC1Qn/7P/lsqMWyW7Jaf7huRw56fqWBYHqD5WyL61zKiWyRw/c1sdIfyExOYdK3xi8JiDx6pMR/KhxfzGwp11OtppbtFh303JSOuZ/zE9osZ1bZ/Mdkdv7NEJgkAaxZFQLay8TvWwf8nv/PBxLnOuXZkH0e/ByWkZbApU/j2+Xj0ELWa6hGYu4LGHj6kDwxMNX8DKEf7bDvOK/flFu3Sc6Gw+quYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jv23q/i6/wIz2pUXJpHo6rKl3ctr2GOQpPP69HfG1lY=;
 b=RdyZwxhUOBkQIP6V2hY68zmevns+E7tzONZ/lvUnp39lnkeNbnr7rX6t1ixvEuPFVe+ypjI5Y3R3f9WVpc7n+F1egKLOCjUPoteYhCkLYDbe1EGUzPXXTkbiI2emcZuox5ediWS85v56wT30LldV+jR8W7q5N2ebqyT7/FQQ1MA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8745.apcprd03.prod.outlook.com (2603:1096:604:272::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 02:51:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 02:51:41 +0000
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
Subject: Re: [PATCH v3 13/33] drm/mediatek: mtk_hdmi: Fix typo for
 aud_sampe_size member
Thread-Topic: [PATCH v3 13/33] drm/mediatek: mtk_hdmi: Fix typo for
 aud_sampe_size member
Thread-Index: AQHbUJqlCZb7Z3yJekan1FyQAxP0f7LucvoA
Date: Fri, 20 Dec 2024 02:51:41 +0000
Message-ID: <37b5aac8e889ced47af3388e1439050c53149de9.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
	 <20241217154345.276919-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-14-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8745:EE_
x-ms-office365-filtering-correlation-id: 8ee5920d-22c7-4968-62d3-08dd20a13b57
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dG5HZ2ZFRVNndDQ0TTJPRER2cjI5UDZnRkZsTVdRUVVkd3dvS3VwQ3pXV1Zm?=
 =?utf-8?B?TjRRNFFncVAwMjQvQktPUjhmSUhMcE9hYytrRVRqZU91T1JUMll5dU51U0Zm?=
 =?utf-8?B?L1BBSElRYzJ3OG45UmYzRUg2MC9DQzVmUS9jbWJxV0JEbTZvdDBieDhaZWl5?=
 =?utf-8?B?K296Rmc1eTY2Q2lRYUZtK0lNNHlaYmpTZzhBZnZhQ3dIRkNsT3hEeWlld0dH?=
 =?utf-8?B?NjBFa3VEZzlDb0lRSDRFdW84MGZBaHErNWNZY21tcUsvZGJmbWlxdjlOZWV0?=
 =?utf-8?B?UFMwYzFUZGE0QjU4OHdGWmVoTjd5Lyt0Y2FVMFBlWDhjKzdHcDNzQ2FCYlBs?=
 =?utf-8?B?aWgwWjBQelVpSTI5UHpveS9EU1crMFJNbXoyRXBxeXVHMDVwV1BDSW5lVDFv?=
 =?utf-8?B?anQzVXlHTzQyRWwyU1FYZC9DUlJ0QWhsVU5VekpDdjhsdE5ncmVLNGZ4azJQ?=
 =?utf-8?B?UjRkaWE0ZU1xUzJEQjNIclJYVGlqQlNrUGlPaWlKM1hpbjBhZmNQQXVrKzkv?=
 =?utf-8?B?Z04xaXpxeXBEN0tvSVZjVXdiekloQTBqUjRkd00xWGtSNjBObno4UEF2dW15?=
 =?utf-8?B?WGJwMWV5ZXkra3FzV3NZYXUvOEkwZnBPb1pVSFRBYkpXNEhpdktSdGNhTndY?=
 =?utf-8?B?Q2JYeGpWbi9TVEpib0JSb1hZdjJOZUVNSWtHbk5xWGJ2aVMwUllyN0xVRkY5?=
 =?utf-8?B?Vk02Uk9VdForbTVqdGNlUWFhN3l3YWY1RGJxbWQ1R280L1ZGRUY2RGtwTTgz?=
 =?utf-8?B?Z1JIQzQvd2M5OTBGcEd2L0RMTFZ1OUZlSTQxQnhLQnF3aTlFd05IMGxrNXFa?=
 =?utf-8?B?aDBmZjN6UDZaTHhBOFpwak5xT3ZLUXl2U0tMZWVqRStKQWtmN3FUU3NLNzQz?=
 =?utf-8?B?OGtiRUEvU1pVRXdNdWYzUTJOMVovMUZraEF1RVV3dWhwR0ZYQ1ZJQ3Y3UGw0?=
 =?utf-8?B?NW4wcFpEbzc0MUduWVpQU254Y1BZNmhkK2hJS3kxWHk5cVhsb3pwNnZlbjMv?=
 =?utf-8?B?d3hoQlJheFBaNENudG5CaFBVN3ZZRDNzYVVKb1pwZGZVZ3V5bC9QY3Y2Tjk3?=
 =?utf-8?B?Zm1XeW9FMXFmK1NpMFFQQitTMXdINjJCSU9TU1lvWnZrY1JFQko4cTgvMFlO?=
 =?utf-8?B?eDFYTXBsNTErRVhEQkI3Z2hTMzhONmdhN0JpUkxWNlVvcnBtMEpLc1NXME5w?=
 =?utf-8?B?TDR2djQ0MUx4L21tU0tWTk4rZVdqRWJ4bjBFSVJ0WHBVZ2RmeTljRGVNd3Nm?=
 =?utf-8?B?TUpacEJFNG1OblFObzYxVHMyOHhpME5sa3hLbmxnbWRZdVFjRzNybmtXUnk4?=
 =?utf-8?B?ZEF0cWY3UXYwUVRWek84VkZxdTBDeU9BV2I2dWFJOVd1eTBEbXRBNHhsb2pK?=
 =?utf-8?B?dFRtRmRiOXI0TkYwNlF2V3lEMnh2czRYSUtRWjRMckpLNUhHZEM4UEZlMFVB?=
 =?utf-8?B?amdIOHZ0Tk8rM3V1M3UzaEIwZHV3MWpCc1g2cnE0UkxvUEpwRnVvdko0dlA0?=
 =?utf-8?B?d285MHdUNlhaT29hdE12NWcyaU05clZERTRua0tYczZNTkpXVitGQVp3WHM5?=
 =?utf-8?B?Tk1NQ0pBYVgxa1JYN2VzV0tUbHJUUDdLekdoWktLKytHTjBpY0tKUnJUUWFW?=
 =?utf-8?B?QXozUDVQd0RVTmE0VWg0Z0lqTW1Od0JoWFcxeDhoSllEY2VXdTJrS0hzaWJw?=
 =?utf-8?B?TWdMQ1FKUzkzWGNseDRZQW56Z20rNkxWSGZUYlNMUmh0alZxcFlnR3J5Q2Ur?=
 =?utf-8?B?K2N6SEZkU2pFeElQaEtKdjVudVRhaEpPaE9RS0hiR1NZOGhEaCtFMnp6UUYy?=
 =?utf-8?B?THFxYVNSeDROQk5QTTAxZyt5THJ3ZXdCRjRqR1ZkVjQ3OXpZb2tnbkpmc210?=
 =?utf-8?B?U0VlVk9HRE16c09na0ZqdHc0UDBvT1VGdzZiQnBCU1pPclJpdE5lV3huNHdJ?=
 =?utf-8?Q?HdjjZDP83lyMZndzTBfkyNfFqte6aViH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y05tc1NqTWRpU2hvUTdURHJENndPWW1EbGVBKzluaTVmRFIrSy9TUXB6UGVp?=
 =?utf-8?B?ME8rTUUxbVhJZVdmWUNaNVErR3JmcHU2SXowQ28yTVpKTkZaR0cwTHg5WjY4?=
 =?utf-8?B?eG02SXhiYmVoRzNKMlkwSmNvN3ZaUTBjYVJZNktLT0c4YnJkaHhRRlFnOWRx?=
 =?utf-8?B?U3Ywcy9qbHdoQS9aZnJ5TkJJS2sxd2E3d3kzTnA0UGkvUE1BSGt2NnRoSW1k?=
 =?utf-8?B?YXRmTnh1eDhUa25JZko0TExMTm9PTE9SbWYvZ0FBQ2F2emJWcWU0bU9wME9x?=
 =?utf-8?B?bW5pTGpHdmZoZk16OWtyZXRBeURrMDg3WDQ3SmxmN05GNEJ0Z0ZsaFBVUk9I?=
 =?utf-8?B?R3hBeXpPRFNQTEFkVWsrY2JDQ285MkhDVk83ZHpRcXFZZDc2bGxZTGxZVjR2?=
 =?utf-8?B?V2N2M2paU3BQYWQ3NHJORFh0UUY4RllnL0p5RHdmR2NndmlGbkpwcEJNbUhG?=
 =?utf-8?B?QStreHpSdFVpc2cwTStwSFF4UEh5VTFINmdzaEFuTEpmVWRLT1poQVcvVVB3?=
 =?utf-8?B?eWR4U2hxWmR3TWpiTFpWdTV2anUvMFZJTFJJVDdGdjdPQTErdHJvK3ZxVmha?=
 =?utf-8?B?eTNHUHZUaXhxME5zV1IyQi9JMmdsYXNZS1Q4Si80Y1NRTmcyaEVBTkx5YkZp?=
 =?utf-8?B?WHVjcDltdTA0bWtZQUJZOVkwekViYlo3NTBvMmMvVG82bkRDSjFvYzJJVXRj?=
 =?utf-8?B?NlJvT3dWejhiTVNoTkdGME83bzkyNnk3OWt2aUVFdTYxdFk5c0N3ZjVPNU1r?=
 =?utf-8?B?WnQ0ckhTdlUzZzRIL3pXc2ZRNmRlTms4Z05yUU1YTWo5YzAvMXIxRHowWVpQ?=
 =?utf-8?B?amh3d3ZwMmxraXorRXc1cXR3dHBzZmY4VTVqVnMyWFFIQnFERHFISWlaUnlw?=
 =?utf-8?B?NVZ0NWJxUGVKdjBtUWlwTndGSGdwMUVsUFpXcGlYaDYyd3hkQzR3Z01wQ3Z6?=
 =?utf-8?B?dHJoSE5wYm0wZEcrcmVPMEV5dlBuK1U1QUpkbllzVVd6bXMzV0ZkdUt6TFJp?=
 =?utf-8?B?VUJVWUNjUmY3b0R5Y053c3E4Y2ZSeFYxSXhFd1NrejhFczY5SEFNcnVZMHd1?=
 =?utf-8?B?K3ZaaTlkNjFTWXZROW5jTmpYWFJOaDFhRmkrQnpCcDhWMFlidEVwNnFxbVcx?=
 =?utf-8?B?LzI5YW1yaWYzcHRkeC84azVzV2p0cHBhTVJBdURLNk9wZVBHZUVENXd3ZjZ1?=
 =?utf-8?B?SnVJUGQrb0FTTnZYendLdkpBengvSldYU0VxNGVyOGNiZEVtN3ZTQlh2WmlW?=
 =?utf-8?B?SElqY2xuRTRIYlJYd3QwbS9qVDNrSTVQOGltL3puUy9YUlhmQUVjVDRYTmZT?=
 =?utf-8?B?UXVYenA2SlBzOThncFVzWHlBd2NxcjNKeUxSVTNOcko1SisrYUFCWWlsa0ZL?=
 =?utf-8?B?UHdwaVlrSkw1RXJmVmlWeTB5YjlBT0NPeVl2MGYxeFhtMjhBOG15VjU4N2lj?=
 =?utf-8?B?ZUhTQngyTjZUSEQ2Tll4bWRoWGdkNGpQWUNqT2VCa1lxKzlvU05xZUVMZklS?=
 =?utf-8?B?NmdUaVRneURJZXVoRXVzVEZGcXh3dStrNG1HdUMvbVhBTUFWTDhzMjFnNGlU?=
 =?utf-8?B?TUhOeDVhU2dET09Ec3R3VU5rcWtsNlluWjhMZCtaVkhiaWtXWmlkNkQyazNi?=
 =?utf-8?B?eFVWbzB6SkZhS0lTbDZ4OUdQajRCYnl6N0Noc0lOcXJlM3lSUURBcmhjdkFv?=
 =?utf-8?B?ZWRBQStRZEhHVmwxaWRFM2hackwxNldvTWRkek5Hd3pKanBHdmhaWkNQU295?=
 =?utf-8?B?NXZiSHFCZnZNa09ZT3dHNWhGVG9rR2ViWEgwSlNLRmlDanoyQmMveG1YK3Ev?=
 =?utf-8?B?WTA1YUNmdzJXaGxwQjFET3VWdlU2ZzN4YVU0bmduaVJFeml2akZSeWlWMHdx?=
 =?utf-8?B?clY4czRTUEtjWGNLbDdILzg1b2ZBTVNIanVDa05CM0pLQWlpUEhMN0p5eWFQ?=
 =?utf-8?B?MVA2YlBqZ01zQU9CL1FXSy9Vdk9DRzhKU3hSaDB4cDNDa0UvRUxJWENRTmQ4?=
 =?utf-8?B?dEd6Kyt3NkNKT2JRZG1FOFF3QzFXUkhUVzhUWWRFeU9OeVgvdUkwQ1NObHZK?=
 =?utf-8?B?Smp1V1N1RGxuY3dZUmNnek43T2lCaUhxL3VHUTNodXJCVG9NMVhVeUp5MkdJ?=
 =?utf-8?Q?09u4U6Nufjq5S7/lGAvyBlEZP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4C649C7C2A94B49A2F1651E3E98E606@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee5920d-22c7-4968-62d3-08dd20a13b57
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 02:51:41.3485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMo5rkxJsTgkUwGpWEzgX8iMHgKGJ/odFYwbPZuxQ64FZ9Bgqc3F0DlOK+JFqcr3W+vSmU826NeOICisJDuU1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_185201_305537_8DE22F35 
X-CRM114-Status: UNSURE (   8.30  )
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

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBSZW5hbWUgbWVtYmVyIGF1
ZF9zYW1wZV9zaXplIG9mIHN0cnVjdCBoZG1pX2F1ZGlvX3BhcmFtIHRvDQo+IGF1ZF9zYW1wbGVf
c2l6ZSB0byBmaXggYSB0eXBvIGFuZCBlbmhhbmNlIHJlYWRhYmlsaXR5Lg0KPiANCj4gVGhpcyBj
b21taXQgYnJpbmdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiA4ZjgzZjI2ODkxZTEgKCJkcm0v
bWVkaWF0ZWs6IEFkZCBIRE1JIHN1cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCg0K

