Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C742C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=; b=2dZZzdhU8k61F84e34iuZTvRTQ
	9CidpOFI/jsyBO5nBQBW1UMO+WBFDAbVm5M99hLJXjxh4i78pm7nlGZez3Ak2ecwe/aH8yDlDJPdY
	TOW2gCiVFJt96zssdWFArdBAzRRvZeT+hZixrQq7we0iHUxi+E+BG/H0NrqELYtltB4evn6fw4gli
	vp3Ww4S82VBZnpKPrjq1XdZQk8VdoU+iCLDMKYNTD5CoWjQ4EkHSwAoQHadrh+d1s2WxcIETF+VzG
	Y/AqcioSzdGPsXeJMgFvheIZhNbUtL+p2q0ocbXAVgxHBS1mjRqElX2HLlLsCKCPMXaxONFQDMsSF
	Ijl7Vxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAaO-000000076iG-1KDG;
	Wed, 12 Feb 2025 11:07:20 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAW0-000000075tM-1pDI;
	Wed, 12 Feb 2025 11:02:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pdvzGcFZfSuE8smwQbf83L6CKcXEJlg+NiPnP5U2jVxD1Ukd32U2u282hU2IGK6QRu4ZrjGUpBHR6hGZPgs+uIHycZHlZ2IcofeZ015F7nnHNYk2gmpZxQYCacqg7ccbRPoEfbpAY2Oxh9ohPVu5aonZZgugUVoCnn3YqWGRhH8G9ptLXgjDxbKtEBaN55+KV6nhu7tsfvgtmTF9zQzET1wcyYFPejYNvQdsoNi1vvj6Yrv7i1bjUHSOlXkQjYUr0922ouEa03S2++KqFzEq4IjpO8z8QwheVOPeySRpvuMXrVsgpqglw8+8UJ2ftKyntupYl6R7/QQw7P6mXWXU0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=IW0mPuK06E4ng8W7VuoqMUhsG3dW61C9NhF7uO5O0jbFlCTACjCTKn41XSUZkKmecizj95y/BUtu9h4cL4ecRZihNRJYo4zl/b5tSnNg+NxbyiT9DHJzjumP5cyA5EsHf7RToH7EoAOitUQrBXy1kOYdigPfd/eo4fJ+wjcAccOcaKr7fpkO4ZS1r5AEuHEgSGCuOuzsKe/8vO3UWnovA9giGHj6w19EJql6015o+OpKEh1qcrUS/Hj12nreOuGFKvNz0ilNb6Z9q9sx3dhk/Ty5JPDo129HIuw+1SUetBt7odYhWm//Kak3hJO8En2GDXiPoKDrTJgSRoLg6QNXTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=nroQu+x/TA2OpWTyb+84W6NdMc5GBoBtvVhWvACHnyqyicZwB+ToUzj3mqKMSkXBjtBSFFA2Wt7edE2p4cRmCXsym/MeTqvTLkPvRB+F/j25zEsA6An4F+WUZ3/+aqiX2B7uRi1QKpaIL/MH2g5dy6iFKPiEzlcd0wsF+3LuIG0=
Received: from DB7PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:36::40)
 by PAVPR08MB9433.eurprd08.prod.outlook.com (2603:10a6:102:319::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 11:02:38 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::33) by DB7PR05CA0027.outlook.office365.com
 (2603:10a6:10:36::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Wed,
 12 Feb 2025 11:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 11:02:36 +0000
Received: ("Tessian outbound b77899637302:v567"); Wed, 12 Feb 2025 11:02:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af1fad98ce884740
X-TessianGatewayMetadata: cjxJMYIdFIm1RAYDYHeThFIKxxel6JDLnkKIwapc6Qlbfl5A9drIjz2IsVxYbiRbzleSLZtqKiKwBPSJDpqO03WiqSS/3fAAL6dELtv8YdVWkvIUUCh3DMbvSDq2D1z+pnDppXBTQkpDBw2/Wxd5jubWMSXE8SOcZNi9BWYZvcM=
X-CR-MTA-TID: 64aa7808
Received: from L8579d43c2f8c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D69DE8BE-A08F-4C91-9B68-448EDF8DED3C.1;
	Wed, 12 Feb 2025 11:02:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8579d43c2f8c.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Feb 2025 11:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mME+wIeLFLHWvdRBdXD09eOqWvZpFNt4XNVem4eZNIX7mnCM6sluP/mq36gB9C9rXxVpDt4ZTeZku0Wl0kdqnzpwiWg+1cWxt1J5WTWx9yhw7nqC55vxzF20h0SMGkRhJuCP0jqs3rm+02JUFXpESeW/nW5hvEn41qSnGSmS5sWKWgK5GWi6p7F8v4EtxUwzXO0qfbupt8PS8Jai4FC6METlABVRx37WPhVNPvJ7NypGo7ipA34/r4Jeix///w5cLtpSzTX0f/jzV0EwUjGYLcDDo0+P8JyJGo+/wBcPStNovs9vcVOmTSB98FtH2FZZPzZUEOPnGomLlyFSQ35peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=JXMkjPwv8gTJxbqwFjag+8WYxcJxhuudmtTmX4AGNf1xD8HvN7tWtQLNpZ3HN/eZ9lNOxo2VA6Gs6svS8OUWqObFjgZTua7qUB0kPZafEGib+U8nQYpAEOb13g9+zLjBHjOUBpqksnxNdInD6ONh6I5CioeY3hnR7HJi3SI3AuDkYn6D7EE9bFUADhPU7iwUj3WDIU0W2GN9NThOOn/pPFyXY2rWVpmk0PnU8zwKVEA37DaK+2AMkbvwrInu0dim9fzbbGJCWFXuzS2kqxwkfCAhb67rbGIRtQc58EeXgnG5OF/p14S2LToX7YocLzKM1zCsM4E9/qze+H0ChpgWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=nroQu+x/TA2OpWTyb+84W6NdMc5GBoBtvVhWvACHnyqyicZwB+ToUzj3mqKMSkXBjtBSFFA2Wt7edE2p4cRmCXsym/MeTqvTLkPvRB+F/j25zEsA6An4F+WUZ3/+aqiX2B7uRi1QKpaIL/MH2g5dy6iFKPiEzlcd0wsF+3LuIG0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by AM8PR08MB6530.eurprd08.prod.outlook.com (2603:10a6:20b:315::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 11:02:23 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 11:02:23 +0000
Message-ID: <96136918-fd44-493a-bac5-b4493f6c0d71@arm.com>
Date: Wed, 12 Feb 2025 11:02:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
 <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
 <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
 <8ee8e684-0164-4e70-b42e-3827c7885685@arm.com>
 <20250212-sweet-nano-penguin-e85e7d@houat>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <20250212-sweet-nano-penguin-e85e7d@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::13) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|AM8PR08MB6530:EE_|DU2PEPF00028D01:EE_|PAVPR08MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e0def5-f5ee-4199-33e9-08dd4b54c286
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SjV1VGY4MW4vM3FYWjdNOGNxZUduSTBoSzFGZVNVazhFQmcxcW9hSnNDRVMy?=
 =?utf-8?B?OVJlWVZxZkRjOFVJOHYwR3BNVmhTWkpTeVRpSTdsekxDclA2OXVHek1LaVAz?=
 =?utf-8?B?a1EvRTFjUDJBN0k0RjNaOUtzaUdrK0xPMmRHUllKOGFFVlJKTjBNWi9jcXhW?=
 =?utf-8?B?MW9tNmdSYjFhV05Qei9rb3hmTXdEYUZGQy9JaXBOS2ttNEhpRVJ2ektaclhE?=
 =?utf-8?B?L1E3ZERFZWc3NGtzekxvMWxrcEdGYkxoU1BWc3BadVdVOFI3UjBLeEF2N25x?=
 =?utf-8?B?U2VDU0RpQmw4TFlYZW1JYm9CcmtLVndIYWZLYXF6d3BxcDVSbWloYWlhRlZ3?=
 =?utf-8?B?M2pJZ2hGV3FDcUFCNEc1VWZFZDNXdk1QL0tOZjhYeUhwejQ1eE9YcUV0NDFu?=
 =?utf-8?B?dkZENklEK2JaNXhxaGZNN3h4aTd5cnpLWlRNWkwxWmxWdnBlaHJWNUxYYnFZ?=
 =?utf-8?B?dnBxRE50b0luUXU3K0ZlZzVRNTJvTHZGcGJlVHBZZTNCeXVVT0FQL2h6MWpx?=
 =?utf-8?B?ZVZWR1JXbDE1UTZzd3VVdE5LZDRDeS9lYjVZWXBOVXM2SVptbXVBR1FCK3pY?=
 =?utf-8?B?U1dKVG0rZGo3eENtRWpNYStQQTZ3b29jMFhxS0RyNmptTzk1dTlKT2FqUGsw?=
 =?utf-8?B?aFZ0NlFhTU5yUnFvNk5yeENwMElZakI4V1JsOGZubklXcFdhcjVrRzhvUnNI?=
 =?utf-8?B?ZVF0cXRhLzFNWmE3ZG9Ka3pLbEEzcldQblg0VVEwUjRaajNBWFAvMUl6SE1a?=
 =?utf-8?B?Q3UxdXFQS1BVSlRxSng3ZEZDWkU4b0NyS0FieG5jalR0Zmw0eHhUL1VRWVk4?=
 =?utf-8?B?a0xhWW9lODZsOTd1UzYzRjV5OU5HM29xS3FZSnVoakZMNHNPU2VxcDNhQVU5?=
 =?utf-8?B?ZFA4U2p0K3NiN3NtUWM1QXZBK29LdmwrdUtlVk9SbGhnU0t4UkV2bmpQb1dV?=
 =?utf-8?B?eERwais3ZkREUXhwcHI0b1doN3Yxa2dQRndPTU1ZQnRYQk11azZQQVlSMFBz?=
 =?utf-8?B?SWxENkdsUUdnbkF0Z0V0ZGJ2YS9OQ0FmRkwzNDBnNnJOc0tTVFpabDcvSDU2?=
 =?utf-8?B?M2ZlejNML1BGM0lVbHFEWGNVV0dobXoxY09jalozMUV0aXVhRVZpVEJJUkRh?=
 =?utf-8?B?OStqVVMzTVZsY0FJRWVaUTREQWJYc2l4TnBrLzVscVJ3REdlb0k4UVpjVjZI?=
 =?utf-8?B?eUxEcFcya2JkdUdlaEdVUXp4YjlJWUxEVmQzWUkvQ0RONVFxTFI2T3ZtTDNT?=
 =?utf-8?B?bkU0cXYyOE5mMUpsYVl1blpub3lRSGNuY2lQZGNTM0hJa0p0TWVUcFVnSEto?=
 =?utf-8?B?UVJIenVpYXl6eWhKT3QvVVBRcFdOanZOVHlRbGZKelhsLzE1ejJJZTlTVEYy?=
 =?utf-8?B?VTNoZFVIRy82Zkw2MlZnUkJINGlxdFlNNXJCMTJ2QnMrUmRpUVRYaFpvZXdn?=
 =?utf-8?B?THhJVmtwWmVtczVaWEVNazhGV2pNcExRVlRyUmdzUms4RFdIclVtSzRKNkt3?=
 =?utf-8?B?VXB3ZlRzcU1Cdzg4OVlycFdRdklxaE0xWENTSDdCUTR2WW5zT3Y1b2tQNU5G?=
 =?utf-8?B?aWdma1gxNFhYaE9zWGM5S2Nxa3hwcjlrbjVod0ovNlpaRDFtOWw4NFE4c1pO?=
 =?utf-8?B?cFp3U20xZ2Z6bms2Uk96S3dzMDBqTUtmaGRScVJsVjNNMzFYZ09RdFErOU0y?=
 =?utf-8?B?dnZEZkNuSTI4Yit4SFJKeWorUGpmUmdNd1A2c1BUeGtrc3BVT1Evd2Z3RVdM?=
 =?utf-8?B?QXM3a0VHazk5eW9JNmNpS2I4OVI3Z21qbUUzL2FyODRFRDA0VjhpRmE1cXFo?=
 =?utf-8?B?ZTc5MVlkVEpBazB4QWt1YVdiUEQ5VTJodU1DTmd3V1RUMFdYUnJJVGo1SlJn?=
 =?utf-8?Q?/URTtWyH3LNk1?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7925.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6530
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d9fa6be7-b642-446c-6ed4-08dd4b54ba23
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|35042699022|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHZrWXVJejhhWEZZbmxkYXJvUXQ2NEtoQXNZUWQ3bmRqVkNBM2RPU1NaV0pk?=
 =?utf-8?B?K0ViMVBmYm5mREdzSHltV0FWR055VGZkU2FZWUtUQit6WlBzYXBzcUVKc2lO?=
 =?utf-8?B?OC9jbWxhd1d0SFFKOFhuUE5mTm5PZjM5dWUyV2Z6Wm9QRno5NEhPcHdRWjVK?=
 =?utf-8?B?b3gyVHdJUUtHTXlSVjBUekNiRWR4c05TcXRzdEV4MUk1ekVuRGx3czFtS0hi?=
 =?utf-8?B?TE91ZDl5Q3U2MmhsR3hmMXNiUVBwRVVKVkdpRDY3ZWI5aERnZGc1YmErUzhG?=
 =?utf-8?B?bi9Hek4zQkRBVjVFNW14QmpCRWdVd0FlUklsblhVWHZISWluN2ViS3BkU2xG?=
 =?utf-8?B?RENxb1pMeGkzVnFtakNzalp1eGttaVFoTlVOU3BOUlhra2c3SHhEUWpobndQ?=
 =?utf-8?B?SGphdVdra1Y0T1Rpb2JJeDBBVU1sZmJDTkhWRzBNelFVK29CNGQ4MDNLYUdK?=
 =?utf-8?B?cjkvS2ZPcVRZeUZlNWcwSStiVm10WHZEWDlKUjhoaFl1Q0t4V0p6UHUxQzB4?=
 =?utf-8?B?UXpxVEsxZCtwb0RvaTVSOExvUjhTbFhmcHYzTTRKZ2xMQmpDTkpDUXNVblFh?=
 =?utf-8?B?U0hhdy9Cck9OcTYxYkhNcGpGSGtOZ3hrUml3QStQeDdzSXUvS3dhZGNBckd1?=
 =?utf-8?B?SnRXbFhsL2NKdDFSaDZETzhiYWVMOHJpMXZ5SFREc213M0p6VlQzTlh2MTdm?=
 =?utf-8?B?MmFyUVNrWGhENzQxZElBRTgzUis1UG42Q2dRNlAva01Cang4SlQ5T2NvRUxN?=
 =?utf-8?B?M01FWThnRFFUbjBVRjA4MmNpM25VaXppd3lqNUlJWUZ3anRSOVBxbUZxV2Nw?=
 =?utf-8?B?a2U0SXozbHdreUptUFlPVWxBWTBLR1FiM1U0bG9aNk94aFFZVWdobXhPNWFW?=
 =?utf-8?B?aDBObWhXN0h4UHAyenA3WVR5MGxFbmZpSVE5K1FUbDc4dWpER2lCdkc3Z1Jj?=
 =?utf-8?B?WXMwYjdFcm42MUhTekZoOU9jVXEzbXRxbGw3V0RqSFg4bnFEbS9HK2J0WjFS?=
 =?utf-8?B?cFZyaTZOejBXd29vRThRK0pMS2NOOTZTWXpIZG9PN0NhSGlsK0EzQklLeFY2?=
 =?utf-8?B?QnUzczRoeDlLWWNqM2tWdnRDSWdCYitUYXZuTmExVEdLN0xnYjJrdDlHb3Vn?=
 =?utf-8?B?WkZOVlZiU21zeWEybTN5bVVBVzFnSjBkcUVqRFNmNTJQUDMveUdDOElHS3Zx?=
 =?utf-8?B?SlptTk9TcGltcVUvbTM4dzhBeEhJNnA0UlJRV0dQd2NFZnVrVzZoMXdnMTRs?=
 =?utf-8?B?aklTNTI1V0RmM1RjeUxsbkIzcDBLTWVEK3lkaTRvYnRXZXpxL2hCTGIrY05B?=
 =?utf-8?B?T1hmeEtmb2hFWFlDbG9td2tWZ0hveGJzZHdnWlpEYXZ3blV3MTBoVmhBRDg1?=
 =?utf-8?B?WmErdUY3MUEvOVMvS3FGZDJhMlNHS2pxdUw0dWhOMFVHdzY0REJTMVZSTXFy?=
 =?utf-8?B?aWEwWm1YSWM3bWdLQ0dPUlhHUEJsblNWdXRRSlZRSWxsTmlsWEhxOFNQV0FR?=
 =?utf-8?B?M0lzVUdLY1hCVVFPTjNvUHZKYURDSnpsSlhhSDVpVEI0UC84aG1vdjdpRFpz?=
 =?utf-8?B?ZjRjck9ZdGM4ZEg5ODVYSkpZdzRsNE5FaDZHbEJOamUxVmJ5UGRtL0lWMEhX?=
 =?utf-8?B?amtURk1lTzFqb2VvbGdsYURZd0lWaGx6ZGYwdk1WYUw0YU8rckN3Wm4va01q?=
 =?utf-8?B?aEF5Y2JmRm01a0NKQXNqenVXRmJjVi8yZGVBOXQ1RXBYenQ3TUdodUNBZWp6?=
 =?utf-8?B?eFFjY3BvQzJKSk9pZWcvTGZmUU9hMmZMR1hYanc2dW5aQ0dNNDVWQUJTajRQ?=
 =?utf-8?B?UjZVekdMY2xqbEk0UGRrc2F2OS9tOERyeVZKQUIvcC9aZGZDT25BN2Zjdk0w?=
 =?utf-8?B?dXVDNDR2RElyTGN5SjRiQjJ3YVFBN2tmakorZWVvRE9DVkVEZ2VlYnNYVXRW?=
 =?utf-8?B?VjNtYU40bDhaUUxua08rcmpYVEZlank1M0tXRUpOdlhvVXh5OUNzSWJ0eCs5?=
 =?utf-8?Q?cePL8jhrP1vvAJ8cvkq5Y9zXPPJppA=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(35042699022)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 11:02:36.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e0def5-f5ee-4199-33e9-08dd4b54c286
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_030249_337759_9469BC6E 
X-CRM114-Status: UNSURE (   5.08  )
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



On 12/02/2025 10:49, Maxime Ripard wrote:
> On Wed, Feb 12, 2025 at 10:29:32AM +0000, Florent Tomasin wrote:
>>
>>
>> On 12/02/2025 10:01, Maxime Ripard wrote:
>>> On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
>>>> Note that the CMA patches were initially shared to help reproduce my
>>>> environment of development, I can isolate them in a separate patch
>>>> series and include a reference or "base-commit:" tag to it in the
>>>> Panthor protected mode RFC, to help progress this review in another
>>>> thread. It will avoid overlapping these two topics:
>>>>
>>>> - Multiple standalone CMA heaps support
>>>> - Panthor protected mode handling
>>>
>>> You keep insisting on using CMA here, but it's really not clear to me
>>> why you would need CMA in the first place.
>>>
>>> By CMA, do you mean the CMA allocator, and thus would provide buffers
>>> through the usual dma_alloc_* API, or would any allocator providing
>>> physically contiguous memory work?
>>
>> You are correct only the CMA allocator is relevant. I needed a way to
>> sub-allocate from a carved-out memory.
> 
> I'm still confused, sorry. You're saying that you require CMA but...

Adding to Boris's comment, the objective here was to enable
sub-allocation from a carved-out memory region. The CMA heap
was used for convinience. It can be any other heap driver that
allows allocating a protected buffer.

>>> In the latter case, would something like this work:
>>> https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@kernel.org/
>>
>> Thanks for sharing this link, I was not aware previous work was done
>> on this aspect. The new carveout heap introduced in the series could
>> probably be a good alternative. I will play-around with it and share
>> some updates.
> 
> ... you seem to be ok with a driver that doesn't use it?

I will confirm it once I have done some validation.

From Panthor driver point of view, it does not matter if the we use CMA,
or alternative heaps. We just need to be able to allocate from a
protected heap. I used the CMA heap to simplify the developpment of the
feature, it can be anything.

I will extract the CMA changes from the V2 of the RFC to prevent
confusion.

Regards,
Florent

