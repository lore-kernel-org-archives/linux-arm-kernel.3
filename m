Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284B4D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZrynDGjo316G7UmXyYWJItrqt9eow4i8UUvqv7ugKo=; b=dOiT3b/2oP+qDXvqmETFIrDejB
	i7GYlLk6JEMTRvq1nK78x3pARxhMM3DOokFQBWYdua7HoZDSpwLZtRXsTsbSqOUOlngva/6iHb8oQ
	KNC2z4Pj6GEv2eOv8lRwi3mWYPgNfpY9uepxC/IXaY7YZ7JDQcNe51ibKr3AHAuYyLgPdhfEy0GRh
	H1e4qp8wujl2SGnxGTZ/kl6gP9zIdxttM7iRoDW5QGNjUN+aImHi5Iid3yugmR4hO0VoHjXY+Aq6s
	IS0mG78Vkolqhc90UtEmc0VNqWqX6fRSRtyaqGXfXojN1/qLrSRof9iozS08ORoV+dbnsZ8gZTlCz
	xtP11fNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxZN-0000000305O-2pug;
	Mon, 01 Dec 2025 06:39:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxZK-0000000304s-1dvB;
	Mon, 01 Dec 2025 06:39:31 +0000
X-UUID: 798673d2ce8011f09f706fa2197c6ceb-20251130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OZrynDGjo316G7UmXyYWJItrqt9eow4i8UUvqv7ugKo=;
	b=D3lLFwpASWIMFdAOM2s2Etfk/Ry7zZxCryqVjZCCeUdP0r5AWzog6jbLt6wZCPhoYqomRuR39l6jpBhocQt9lwCa7kuDYVlrD8VQqITg6R8mwKgt+91fne09gN2XRZdNmjs8EzMsxrVuVVDTxpIet8p8umYzM809u1jvU0tXf4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:78bd4fe7-8a78-426f-aab4-9e67577c0723,IP:0,UR
	L:0,TC:0,Content:11,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:11
X-CID-META: VersionHash:a9d874c,CLOUDID:92080328-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:3|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 798673d2ce8011f09f706fa2197c6ceb-20251130
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 903771256; Sun, 30 Nov 2025 23:39:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 1 Dec 2025 14:39:20 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 1 Dec 2025 14:39:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgbDzWb++OGA5o4n39CqM1NGJQsCLZHZbtf+mxzHfNSGcDlNopGnnkOL/hsq0hpXX58m7h4t1gb5p8bV08A8+B4DWFFEI/2fJrQnZrEwInJxHOD5VY/WpQpr5OkYvdul5yMKJ4901pFBPxzu5c47e2MoezQNfXUYbRtOm49vPg3NDLKnZxTps3lIUmjgXvBq5T7m5gxlyeNqvQvOXfNsI4iyRgwHe+5MschvRnP62W5EfhpX3CsdpTvek49ao6YGsuuCCzLBmf0P3XNq9smDW0fOH3Nlng5nm1YerVZmg/NCoXAMgFDlQbkCITTsUFgcE1d3Eg5H/0cHnxskivpxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZrynDGjo316G7UmXyYWJItrqt9eow4i8UUvqv7ugKo=;
 b=gNX4z4yS8gHOGZEQacd6JgkhPhp4eb6tyvoziMIWwbBzUltVSWQ8f5UfAuHo54ayFqTRjXEUjLHypTGDQTIK7wt32AXxbihLWLmUQ4vC7GsW3OOaFOH7nepKcvAJFrYtMNk1ftZpY6R5SJOPzGIf2ZLp/9JyWIpNC0orWBxJwVjP/84F7AxTz7VDLpmXCGgLSJt7eM74TXJlqx1/Z+6BJLW0DrLj1Xp4Xz2Ci4OtvIuh+X1xbqhnK3vWqx1Vk35CzSLsnZcNwADWdC0DWaWUiFUcAuMvwC8QcMx/PIAGszZna8maBR9nOReEp2EFkccpE0vDgFa1F2WKIIVlK2xf7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZrynDGjo316G7UmXyYWJItrqt9eow4i8UUvqv7ugKo=;
 b=HFCzqDRWj+gPF8nUjUZOL1V/t62n8rIgcsJtq5IMhicE2XGtXtfJjJhyL3fb97Ti4dPGCAKre7MocjnD/894p75zax/T5n2bqu0USkMQypkiwaNnHNWWgjctuokDfFpm7SNkIAHzpoEHHcEqV7UJ8dLqenQmfeK9YwCgiFs+pa4=
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com (2603:1096:400:70::13)
 by TYZPR03MB8018.apcprd03.prod.outlook.com (2603:1096:400:463::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:39:16 +0000
Received: from TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13]) by TYZPR03MB5760.apcprd03.prod.outlook.com
 ([fe80::7a62:8e4a:b62a:3c13%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:39:15 +0000
From: =?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
To: =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?= <Peng.Liu@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHcTWmO3OYFqtLGQ0uUopbs6IX/eLT5z/+AgAfanACAAr9QgIAIFauA
Date: Mon, 1 Dec 2025 06:39:15 +0000
Message-ID: <f4e8ba2e9f9a8e5fd4b35afe25b9874c64c6ea17.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-2-liankun.yang@mediatek.com>
	 <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
	 <dfd8767809d52efee2e7592e4b45cfd2425334b8.camel@mediatek.com>
	 <54b075b4ff6b9aa7cd916bb65e34e5edae3642dc.camel@mediatek.com>
In-Reply-To: <54b075b4ff6b9aa7cd916bb65e34e5edae3642dc.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5760:EE_|TYZPR03MB8018:EE_
x-ms-office365-filtering-correlation-id: db84a2e8-5dad-43c2-2edb-08de30a458fa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?NG5Cejd1bjRwL3NRU2JNOGNSblpRYzI2ZkdrbU5SOGZ3QXVaeDRwb0pwQ2pn?=
 =?utf-8?B?bzJ2SlV6a1R3a2lrWjk2d2RRTDM1bG9VWkxhdWdGdGFQYzVmTTVqL2UzMElj?=
 =?utf-8?B?bmFrWHhyTTg4MGFLd0xhSEo4VWVDNU82MXdLeDVUT2cxallJL0MrZllGN2Zj?=
 =?utf-8?B?UmpzR0FOclNxWnh0dG1LQjBmcjllaW0xcmExWG1qaXYvODRHM2x0QnUzbEhw?=
 =?utf-8?B?azg5Yk16NWIwZ0lmaFEvZlJqSTE1YjBER2JCK0dPNmZ5ZEUrbkZiQ2RON1Nk?=
 =?utf-8?B?WDJCSEhNcmlOWjRSUnVTSVVGYlJ5NHJHcVZrRk5XdzE5MFQ1UnFkSjVaK1FH?=
 =?utf-8?B?OHY0ZDZBSW5ZejE4VFVWTVVFSDg0bG1sSVFWNXVXNkl3a0Y4ZGJva2sxeE5G?=
 =?utf-8?B?OEsvYUQ5TnVnMjJiUmtBREpEclZUUVNrbEx1aG9lZzRwc1FoQ3VSY2xpbEdV?=
 =?utf-8?B?Yk1abnFTRXVpMS95QVEzNUpsYnNzNUtId3QybjhHKzZPcit5Q3REUzRvZHdE?=
 =?utf-8?B?TW1WZFNxcDJmdjM5cHdIZytQb1JyMEwzMWdVVlF3ekJnSW51bjFleERybzNR?=
 =?utf-8?B?dGtkWWJ0bXo3V0NqeGg2b0s1dmJVUFB0eVJ4a2Eza0VkMUN4K1lmcjJHa3g2?=
 =?utf-8?B?N1pnMkdXdnIxLzZiMWxhQjZFNVArT3Q3Z1djaG5SS29xd0UrRkVndmZya3cr?=
 =?utf-8?B?WXlIZmRzUWkzeDJGVXJONmcwQ2JBSldIMXlNVzlXdXR4bkZlYXpVT29tYmNC?=
 =?utf-8?B?OFNKQncrM0U2elJUWUhwV003c2dIbGt6blJ6SmswckNtamd5aGlZc2d2alFN?=
 =?utf-8?B?TmxiSFdpa2tkSXQ5ZGx5OEM2V1ZUWEFBbW0wcXY4aDB2ZFlMSmg4NXRpWEJl?=
 =?utf-8?B?cm5EbU9ZU1IvTFJheUZZN3ZTTDBDZkVxWG5UdlFFSDVLVVg5WWRmWXVhL21U?=
 =?utf-8?B?U0FiY0x1VncrN2Uxc2pvTTZuOUZ1VmpROXNWL054cEE4V0hLcDd2Vi9xakJ6?=
 =?utf-8?B?ekNybWZUKzQ3VEU5Z0Fzc29RajZHbnQxa0xuSzN3ck04NFZjRUtvVHEyd2d1?=
 =?utf-8?B?NjdNM3hFUWlOUjRQS0tVQzFvTTA3Q3pxTkxIbXY1VzNyUmREZmxXUzNJNEo2?=
 =?utf-8?B?YXRWRjFSbFZFNC8ycFlwcVhtM2tqc2hMdmdFdlU3bUk2WE5SVVZhTUlsMHhx?=
 =?utf-8?B?bkpTbHlIZjNmTGlMb2VEbGJOM2hyWkpTS3ljZ2gyTlNVY3BwSnlWVC9xdkFZ?=
 =?utf-8?B?V01VMXBiNk9scVV2aXBqOWhrdHFJSzUzQXpYRkhvUloxekRyS3pmZ2xCM3Iy?=
 =?utf-8?B?YUpCZ3ZLMkFjSWwyOFlEMTV0TnU5L3hCTTJIL3g5bllHTGJnSEhkdVg5ZUJV?=
 =?utf-8?B?TVpRR3U2MjlVRzZVTGh3cEhiUXhNWXNXNEFRVUcyTzJhcnVqYWJiZ3NSZ1Ur?=
 =?utf-8?B?Z2xqeWt4NEFFS3h1UURaMGpqQUFYeVgyT1dKbHVpSUpzcTFxVkVDeFgyOTBR?=
 =?utf-8?B?WWhjQ2tNQTBvMFNBR0U2bkhpYlloNkxoaVllWXU4S043ZlNvdWppNllWNWVF?=
 =?utf-8?B?TVMzWkU5K1NnVkZnekF2U2JTQytVbGcyaXBnYWxvd3p1UEcwektiM0k4K0lM?=
 =?utf-8?B?Z3lvaDRrTGpqRy9mTjc3TzMxYzJOUVpGaU1oM05sT0ZIL2NWaEp4cGVwUFhn?=
 =?utf-8?B?R0wzckxUeFBzUm0rREdQRHdYOXQ4YkdXZjhLVVFJZ29tVHdHb2tXQ1k5ME1P?=
 =?utf-8?B?eWFhWmNscUw2SktJTk1vb1VoelZuMVFiT1pJeTJEL3FYSGl0c3VsRHhhaGZQ?=
 =?utf-8?B?UTdybDlYalpOZ1NyMmpwSXZSS1I5L0RzUkw1UVZqUXFQR0NibTBjVG4rVnNR?=
 =?utf-8?B?bktYRkV2R0wxZVhEQ1lhTHV2aktiTFdlRFlpRHJkdWpDMTVpZUpaejJvYTJW?=
 =?utf-8?B?ditxTkNuL05KUFdJaEV1VSt1WnJsWDRDdEhUb1FrRHEvMnRabm9FV1NYbmM3?=
 =?utf-8?B?dHlBaGdZZ2kxYmJ3Q2R0RFlnYzBYYkhLdzUvUksya0tQaDNNYnptMy9lOVNr?=
 =?utf-8?B?N0Mva3NneEQ3dnlhbTlYb3g3M01nNmhqdFFpZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5760.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEFyR01hdzZsdHJLdVdUaWZHWm1WVkRVdHFKY3R3Qmw0dEQ3NFdPTkU1TDlK?=
 =?utf-8?B?K1NVRTYxNHZFNDlOZHczeklUSE1GazlrdWhmWWNKNWkwZ2oycm9vczl0RDhH?=
 =?utf-8?B?SFVpS3dyK0RRS0tLdHMxYjNqWGloNTRXNU94K04xdUNLWHdveG8wOURDTVh5?=
 =?utf-8?B?NlBHSkZQYzhKZ1FJdHg3RG9wMlcvdGVzMXdIaHZ2Nm8reThDeWFQd25YdFBJ?=
 =?utf-8?B?NExJNFh5UXlDV0dHYjVtOVhCWTJFdHE3YVkwVzl5amd6QzVzOVBpeUR4a1pQ?=
 =?utf-8?B?cUJMSVIvRzdMRXVSUmJqbnB1TXNLanlycStscDdWRHJvZklqNUxIVjJXeUow?=
 =?utf-8?B?VTVLYnlTSW9WWHI5NS9qM1JNNzErYnYvTVlHeHQ2aVFUdk1sbDNBQ3h1YUZx?=
 =?utf-8?B?VnZ1RmdDYmJjN3VuQXlhZlBsaFluWVFUS1dVd2R3YU9NcjlzVFRGNHJtdUFq?=
 =?utf-8?B?eFJEazRXOHJYUE9FZVB1alY1ZytDaVRVUGc5OGl3NVQ5RS81Qm84MFlGRjNF?=
 =?utf-8?B?NWpoWWJTNkJJUWtSQWQxZ0dza0c1VzJXbVBrczA1VlpteFhTbHl5ejZQbWZS?=
 =?utf-8?B?dittKzhjNmhyUUFVaHQ1TnUzaldXTVQ2ZU5UVDFVSnN0Q2h2V0U1OWszblF0?=
 =?utf-8?B?Sk9HSXQ2Y3BxcWtQSVFJNWZuYWlkUThJdEwrcWJnckxZcTZpWjJhbTBYRWlL?=
 =?utf-8?B?YkV0MVdQNysyR1Nyb05zM0NKRUNVczBKdmo2V2ZrMjVWNmxpQXNGVU1teFZt?=
 =?utf-8?B?QTNpL3VkZkxweloyaGJXZEdJN1BwbitzQmY4dklBYjdrbnJIL1V1T0hmQ2NZ?=
 =?utf-8?B?bEEzN3h1SDZnVUtBdWQ4VWthdTBLUnBQZ0dCR3E1aWVtU3lsdnZqdHRuTG82?=
 =?utf-8?B?SENnNEJ0UlpIU3hQalcrZHkrQjZBS3ByZzRrUU0zQ05HVVd3SWRZZlh3L1Zh?=
 =?utf-8?B?Q3RlQXcwRGF1aFpXS2xxdHVzalVYQW01UEtGV3J6K0ZxUW92WmVpNkx1ZWVP?=
 =?utf-8?B?a0JxOU9xMWl1SDUyZUxkMEZMUnlNT0tVMnZ3MUtUMjZMQzdpTCtJSElKYllp?=
 =?utf-8?B?SjJzTFM3TldJZFlvZ2V6TG90Ynhua0l6TDNWdWNwSEVOdVpzY2VrclNJdTVt?=
 =?utf-8?B?L2hvMjFPNzRvOVBhdmlJZVN5aVJlRmFBT3YzWDl6YWRHelBleldPdEJ2WlNh?=
 =?utf-8?B?bE83eHpKUGFaaUFNL2tkV1pZNEN1NjR3TTU0ZHptRy9EVTFKNWFZaGFxNnRp?=
 =?utf-8?B?QkluaXhRazhxZGtGWFd6MXhjdDBSSVlKdk5ZeVpPTzFUZ0lPN2dJdnR0Ky84?=
 =?utf-8?B?RjFQTFBqZmNrVU5NeFRBaGlaZFRnb3NFdEFHWDc5NkxEQ3NkdFVES0dqNjg1?=
 =?utf-8?B?ZGRsV1k3NXJLUS95aHU1Wk1GTHhzM1RnUmxoRCtlMmVjTTVZbHc3YU5ZOFQz?=
 =?utf-8?B?NEJyK3Ixa3FHOWZrS0hwNWlTcWxJT0UyVHZmaHlNQmhUbTBjSHgzakVtZW1I?=
 =?utf-8?B?QVRGWU1WS0VuR3E4aVBQWUxvbGI5M1pjQzllL3BOdGcwNlhSL3ZOSjREbkV4?=
 =?utf-8?B?TmZaYmNxa3RyZnFTZ3Q1V3ViRktBRnE2SVdneWZEc3FUYmwwdzdhVFVzWFl3?=
 =?utf-8?B?cUp0bWdPVGF3TnE5aUpJbjQvZTVLU3VaWUt1aHVOVlQvNi91VkVBRlRPUjJD?=
 =?utf-8?B?dTJGVlprMFdGbk8vMElYMlA0RGw3Wnp1TDZaWXBjVlpST0NxUW5iSTdwYWFz?=
 =?utf-8?B?RDZQa3NHei9takFNbW80eHpHbWx5cUo5cWV1QnF1Q2lvOTZpeHUzY0tMZ2Ex?=
 =?utf-8?B?KzR4YUg4RE8zNHlXbVUyUDVtdmkxWmVkOUNxb3JWQkl2YldVd2RRbFU2RXdD?=
 =?utf-8?B?aVArcmIwMzhMSkVEMTFwZWg0aTlJVTlDd0xRT3JLbGg0MWR3bU9VdS94azV0?=
 =?utf-8?B?UVJBbEJqUElGVThrVG1rdVduNDZGS0p6YTQya0V4TFhVc3Z0bGcwUlEreXpP?=
 =?utf-8?B?TFRIZ3RxU0NuZmUwc2FzNEdqMXJzbDlRSEtiWHBmY1lPOFFHOWR1MkQwZmRs?=
 =?utf-8?B?WnFJaFppZmwrbnMzQVNDVjVqNlN2OVpBVWVUWWE0K1ZvVENGOUlaN2JZbDlp?=
 =?utf-8?B?bExFUjdUZ2dHV28reVdtVW1USk1SbjRCNUxacktPY1VENFBFdmZtZjcvajVM?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96A1B35A9239B7438EA67BEADE564881@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5760.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db84a2e8-5dad-43c2-2edb-08de30a458fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 06:39:15.8594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7978wUoHA3xRjCEZGQrSTWoE00P+z7OTEE+sPbixBLJQdcJcWSVlBoGVX6WIhoUbOUjZ3vtJMII+hjBUcTdKnQcwa6xyt0zQkfWgqPDJMcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_223930_463721_EC7A8059 
X-CRM114-Status: GOOD (  23.53  )
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

T24gV2VkLCAyMDI1LTExLTI2IGF0IDAzOjExICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gTW9uLCAyMDI1LTExLTI0IGF0IDA5OjE0ICswMDAwLCBMSUFOS1VOIFlBTkcgKOad
qOi/nuWdpCkgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI1LTExLTE5IGF0IDA5OjE4ICswMDAwLCBD
SyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgMjAyNS0xMS0wNCBhdCAxNjo1
NSArMDgwMCwgTGlhbmt1biBZYW5nIHdyb3RlOg0KPiA+ID4gPiBCeSBhZGp1c3RpbmcgdGhlIG9y
ZGVyIG9mIGxpbmsgdHJhaW5pbmcgYW5kIHJlbG9jYXRpbmcgaXQgdG8NCj4gPiA+ID4gSFBELA0K
PiA+ID4gPiBsaW5rIHRyYWluaW5nIGNhbiBpZGVudGlmeSB0aGUgdXNhYmlsaXR5IG9mIGVhY2gg
bGFuZSBpbiB0aGUNCj4gPiA+ID4gY3VycmVudCBsaW5rLg0KPiA+ID4gPiANCj4gPiA+ID4gSXQg
YWxzbyBzdXBwb3J0cyBoYW5kbGluZyBzaWduYWwgaW5zdGFiaWxpdHkgYW5kIHdlYWtuZXNzIGR1
ZQ0KPiA+ID4gPiB0bw0KPiA+ID4gPiBlbnZpcm9ubWVudGFsIGlzc3VlcywgZW5hYmxpbmcgdGhl
IGFjcXVpc2l0aW9uIG9mIGEgc3RhYmxlDQo+ID4gPiA+IGJhbmR3aWR0aA0KPiA+ID4gPiBmb3Ig
dGhlIGN1cnJlbnQgbGluay4gU3Vic2VxdWVudGx5LCBEUCB3b3JrIGNhbiBwcm9jZWVkIGJhc2Vk
DQo+ID4gPiA+IG9uDQo+ID4gPiA+IHRoZSBhY3R1YWwgbWF4aW11bSBiYW5kd2lkdGguDQo+ID4g
PiA+IA0KPiA+ID4gPiBJdCBzaG91bGQgdHJhaW5pbmcgaW4gdGhlIGhwZCBldmVudCB0aHJlYWQu
DQo+ID4gPiA+IENoZWNrIHRoZSBtb2RlIHdpdGggbGFuZSBjb3VudCBhbmQgbGluayByYXRlIG9m
IHRyYWluaW5nLg0KPiA+ID4gPiANCj4gPiA+ID4gSWYgd2UncmUgZURQIGFuZCBjYXBhYmlsaXRp
ZXMgd2VyZSBhbHJlYWR5IHBhcnNlZCB3ZSBjYW4gc2tpcA0KPiA+ID4gPiByZWFkaW5nIGFnYWlu
IGJlY2F1c2UgZURQIHBhbmVscyBhcmVuJ3QgaG90cGx1Z2dhYmxlIGhlbmNlIHRoZQ0KPiA+ID4g
PiBjYXBzIGFuZCB0cmFpbmluZyBpbmZvcm1hdGlvbiB3b24ndCBldmVyIGNoYW5nZSBpbiBhIGJv
b3QgbGlmZQ0KPiA+ID4gPiANCj4gPiA+ID4gVGhlcmVmb3JlLCBicmlkZ2UgdHlwZWMganVkZ21l
bnQgaXMgcmVxdWlyZWQgZm9yIGVkcCB0cmFpbmluZw0KPiA+ID4gPiBpbg0KPiA+ID4gPiBhdG9t
aWNfZW5hYmxlIGZ1bmN0aW9uLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGBtdGtfZHBfYXV4X3Bh
bmVsX3Bvd2Vyb25gIGZ1bmN0aW9uIGZhaWxzIHRvIGFsaWduLg0KPiA+ID4gPiBXaXRoaW4gdGhl
IGBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZGAsIGlmIERQIGlzIGRpc2Nvbm5lY3RlZCwNCj4gPiA+
ID4gdGhlIGBtdGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb25gIGZ1bmN0aW9uIHdpbGwgd3JpdGUgZnJv
bSBgYXV4YA0KPiA+ID4gPiB0bw0KPiA+ID4gPiBgRFBSWGAsDQo+ID4gPiA+IGNhdXNpbmcgYSBm
YWlsdXJlIGFuZCB0aHVzIHByZXZlbnRpbmcgc3ltbWV0cnkuDQo+ID4gPiANCj4gPiA+IEknbSBj
dXJpb3VzIGFib3V0IGFub3RoZXIgY2FzZS4NCj4gPiA+IEluIHlvdXIgZGVzY3JpcHRpb24sIHdo
ZW4gRFAgcGx1ZyBvdXQgYW5kIHBsdWcgaW4sIERSTSBjb3JlIHdvdWxkDQo+ID4gPiBub3QNCj4g
PiA+IGNhbGwgbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCksIHJpZ2h0Pw0KPiA+ID4gSWYg
c28sIHdoZW4gSSBwbHVnIG91dCBEUCwgYW5kIHBsdWcgaW4gYW5vdGhlciBEUCBwYW5lbCB3aGlj
aA0KPiA+ID4gc3VwcG9ydA0KPiA+ID4gc21hbGxlciByZXNvbHV0aW9uLA0KPiA+ID4gdGhlbiBt
dGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKSBpcyBub3QgY2FsbGVkIGFuZCBiZWxvdyBjYWxs
DQo+ID4gPiBzZXF1ZW5jZSB3b3VsZCBub3QgaGFwcGVuOg0KPiA+ID4gDQo+ID4gPiBtdGtfZHBf
YnJpZGdlX2F0b21pY19lbmFibGUoKSAtPiBtdGtfZHBfdmlkZW9fZW5hYmxlKCkgLT4NCj4gPiA+
IG10a19kcF9zZXRfdHhfb3V0KCkgLT4gbXRrX2RwX3NldHVwX3R1KCkNCj4gPiA+IA0KPiA+ID4g
SW4gbXRrX2RwX3NldHVwX3R1LCBpdCB3b3VsZCBzZXQgc3JhbV9yZWFkX3N0YXJ0IGFjY29yZGlu
ZyB0bw0KPiA+ID4gbGFuZV9jb3VudC4NCj4gPiA+IEJ1dCB0aGUgY2FsbCBzZXF1ZW5jZSB3b3Vs
ZCBub3QgaGFwcGVuIHdoZW4gbmV3IHBsdWcgaW4sIHRoZQ0KPiA+ID4gc3JhbV9yZWFkX3N0YXJ0
IHdvdWxkIGJlIG9sZCB2YWx1ZSB3aGljaCBtYXkgaW5jb3JyZWN0Lg0KPiA+ID4gSWYgdGhpbmsg
dGhhdCB3aGVuIHBsdWcgaW4gYW5kIHBsdWcgb3V0LCBpdCBzaG91bGQgZGlzYWJsZSBEUCBhbmQN
Cj4gPiA+IHRoZW4gZW5hYmxlIERQIGFnYWluLg0KPiA+ID4gSWYgRFJNIGNvcmUgZG9lcyBub3Qg
ZG8gdGhpcywgSSB0aGluayB3ZSBzaG91bGQgbW9kaWZ5IERSTSBjb3JlDQo+ID4gPiBvcg0KPiA+
ID4geW91IHNob3VsZCByZWNvbmZpZyB0aGUgd2hvbGUgRFAgd2hlbiBwbHVnIGluLCBub3Qgb25s
eSB0cmFpbmluZy4NCj4gPiA+IA0KPiA+ID4gUmVnYXJkcywNCj4gPiA+IENLDQo+ID4gPiANCj4g
PiANCj4gPiBIaSBDSw0KPiA+IA0KPiA+IFdoZW4gRFAgcGx1ZyBvdXQsIERSTSBjb3JlIHdpbGwg
Y2FsbA0KPiA+IG10a19kcF9icmlkZ2VfYXRvbWljX2Rpc2FibGUoKS4NCj4gPiBXaGVuIERQIHBs
dWcgaW4sIERSTSBjb3JlIHdpbGwgY2FsbCBtdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKS4N
Cj4gDQo+IA0KPiBXaGVuIERQIHBsdWcgaW4sIERSTSBjb3JlIHdpbGwgY2FsbCBtdGtfZHBfYnJp
ZGdlX2F0b21pY19lbmFibGUoKSwNCj4gYW5kIG10a19kcF9icmlkZ2VfYXRvbWljX2VuYWJsZSB3
b3VsZCBjYWxsIG10a19kcF90cmFpbmluZygpLg0KPiBTbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8g
Y2FsbCBtdGtfZHBfdHJhaW5pbmcoKSBpbg0KPiBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZCgpLg0K
PiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQoNCkhpIENLLg0KDQpUaGlzIHNob3dzIHRoZSBjdXJy
ZW50IHRpbWluZ3MgYWZ0ZXIgdGhlIERQIGNhYmxlIGlzIHBsdWdnZWQgaW4sDQphcyB3ZWxsIGFz
IHRoZSBtb2RpZmllZCB0aW1pbmdzLg0KDQpjdXJyZW50IHRpbWluZ3M6CQlGaXggdGltaW5nczoN
Cg0KbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoKQltdGtfZHBfaHBkX2V2ZW50X3RocmVhZCgpDQoJ
CQkJKGluY2x1ZGluZyBEUCBsaW5rIHRyYWluaW5nKSANCgl8CQkJCXwNCiAgICAgICAuLi4JCQkg
ICAgICAgLi4uDQptdGtfZHBfYnJpZGdlX21vZGVfdmFsaWQoKQltdGtfZHBfYnJpZGdlX21vZGVf
dmFsaWQoKQ0KCXwNCiAgICAgICAuLi4JCQkgICAgICAgLi4uDQptdGtfZHBfYnJpZGdlX2F0b21p
Y19jaGVjaygpCW10a19kcF9icmlkZ2VfYXRvbWljX2NoZWNrKCkNCgl8DQogICAgICAgLi4uCQkJ
ICAgICAgIC4uLg0KbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCkJbXRrX2RwX2JyaWRnZV9h
dG9taWNfZW5hYmxlKCkNCihpbmNsdWRpbmcgRFAgbGluayB0cmFpbmluZykNCg0KDQpQUzoNCjEu
ICIuLi4iIHJlcHJlc2VudHMgb21taXRlZCBzdGVwczsNCg0KMi4gYG10a19kcF9icmlkZ2VfbW9k
ZV92YWxpZCgpYCBjYWxjdWxhdGVzIHRoZSBiYW5kd2lkdGggdXNpbmcgdGhlDQpjdXJyZW50IGxh
bmUgY291bnQgYW5kIGxpbmsgcmF0ZSwgYW5kIHRoZW4gZmlsdGVycyBlYWNoIG1vZGUgdG8NCmRl
dGVybWluZSBpZiBpdCBzdXBwb3J0cyByZXR1cm5pbmcgYSBzdGF0dXMuDQoNCjMuIEluIHRoZSBg
ZHJtX2Rpc3BsYXlfbW9kZV90b192aWRlb21vZGUoJmNydGNfc3RhdGUtPmFkanVzdGVkX21vZGUs
DQombXRrX2RwLT5pbmZvLnZtKTtgIGZ1bmN0aW9uLCB3aXRoaW4gdGhlIGBtdGtfZHBfYnJpZGdl
X2F0b21pY19jaGVjaygpYA0KZnVuY3Rpb24sIGBhZGp1c3RlZF9tb2RlYCBzZXRzIHRoZSBjdXJy
ZW50bHkgc2VsZWN0ZWQgZGlzcGxheSBtb2RlIGZvcg0KdGhlIERSTS4NCg0KNC4gRFAgbGluayB0
cmFpbmluZyB0ZXN0cyB0aGUgc2lnbmFsIGNvbmRpdGlvbnMgb2YgdGhlIGxpbmsgYmV0d2Vlbg0K
RFBUWCBhbmQgRFBSWCwgYW5kIHNlbGVjdHMgdGhlIGxhbmUgY291bnQgYW5kIGxpbmsgcmF0ZSB0
aGF0IG1lZXQNCnRoZSBzaWduYWwgY29uZGl0aW9ucy4NCg0KNS4gRm9yIGV4YW1wbGUsIHRoZSBw
bGF0Zm9ybSBzdXBwb3J0IERQIDRsYW5lIDUuNEcsDQpidXQgcGFuZWwgQSBzdXBwb3J0IERQIDJs
YW5lIDUuNEcuDQoNCiAgIFRoaXMgaXMgYSB0aW1lIHNlcXVlbmNlOg0KDQogICBhKS5QbHVnIGlu
IHBhbmVsIEEuIEFjY29yZGluZyB0byB0aGUgcGxhdGZvcm0sIGl0IGNhbiBvdXRwdXQgNEsNCiAg
IDYwSHouDQogICBiKS4gVGltaW5nIG1vZGUgc2V0IDRLIDYwSHooSW5jbHVkaW5nIGluIG10a19k
cF9icmlkZ2VfYXRvbWljX2NoZWNrDQogICBmdW5jdGlvbikuDQogICBjKS4gQXRvbWljIGVuYWJs
ZShCYXNlZCBvbiBwYW5lbCBBIGFiaWxpdHksIHRyYWluaW5nIHBhc3MgMmxhbmUNCiAgIDUuNEcp
Lg0KICAgZCkuIEZpbmFsbHksIGR1ZSB0byAybGFuZSA1LjRHIGJhbmR3aWR0aCBsaW1pdGF0aW9u
LCB0aGUgcGxhdGZvcm0NCiAgIGNhbm5vdCBvdXRwdXQgNEsgNjBIeiwgcmVzdWx0aW5nIGluIGEg
YmxhY2sgc3JlZW4uDQoNCiAgIElmIGFwcGx5IHRoaXMgcGF0Y2guDQoNCiAgIGEpLiBQbHVnIGlu
IHBhbmVsIEEuDQogICBiKS4gVHJhaW5pbmcgcGFzcyAybGFuZSA1LjRHDQogICBjKS4gVGltaW5n
IG1vZGUgc2V0IDJLIDYwSHooQmFzZWQgb24gdGhlIDJsYW5lIDUuNEcgYmFuZHdpZHRoIGxpbWl0
DQogICBhbmQgaW5jbHVkaW5nIGluIG10a19kcF9icmlkZ2VfYXRvbWljX2NoZWNrIGZ1bmN0aW9u
KS4NCiAgIGQpLiBBdG9taWMgZW5hYmxlIGZvciBvdXRwdXQgc2NyZWVuLg0KDQpCZXN0IFJlZ2Fy
ZHMNCkxpYW5rdW4uDQoNCj4gPiANCj4gPiBJZiBEUCBwbHVnIGluLCBzcmFtX3JlYWRfc3RhcnQg
d2lsbCBiZSByZWNhbGN1bGF0ZSBiYXNlZCBvbiB0aGUNCj4gPiBsYW5lDQo+ID4gY291bnQuDQo+
ID4gDQo+ID4gUmVnYXJkcw0KPiA+IExpYW5rdW4uDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExpYW5rdW4gWWFuZyA8bGlhbmt1bi55YW5nQG1lZGlhdGVr
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcC5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gPiA+IGluZGV4IGJlZjZlZWIzMGQzZS4u
MGJhMmMyMDg4MTFjIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cC5jDQo+ID4gPiA+IEBAIC0xOTc2LDYgKzE5NzYsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QNCj4g
PiA+ID4gbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoaW50IGhwZCwgdm9pZCAqZGV2KQ0KPiA+ID4g
PiAgCXN0cnVjdCBtdGtfZHAgKm10a19kcCA9IGRldjsNCj4gPiA+ID4gIAl1bnNpZ25lZCBsb25n
IGZsYWdzOw0KPiA+ID4gPiAgCXUzMiBzdGF0dXM7DQo+ID4gPiA+ICsJaW50IHJldDsNCj4gPiA+
ID4gIA0KPiA+ID4gPiAgCWlmIChtdGtfZHAtPm5lZWRfZGVib3VuY2UgJiYgbXRrX2RwLQ0KPiA+
ID4gPiA+IHRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbikNCj4gPiA+ID4gDQo+ID4gPiA+ICAJ
CW1zbGVlcCgxMDApOw0KPiA+ID4gPiBAQCAtMTk5NCw5ICsxOTk1LDI4IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdA0KPiA+ID4gPiBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZChpbnQgaHBkLCB2b2lkICpk
ZXYpDQo+ID4gPiA+ICAJCQltZW1zZXQoJm10a19kcC0+aW5mby5hdWRpb19jdXJfY2ZnLCAwLA0K
PiA+ID4gPiAgCQkJICAgICAgIHNpemVvZihtdGtfZHAtDQo+ID4gPiA+ID5pbmZvLmF1ZGlvX2N1
cl9jZmcpKTsNCj4gPiA+ID4gIA0KPiA+ID4gPiArCQkJbXRrX2RwLT5lbmFibGVkID0gZmFsc2U7
DQo+ID4gPiA+ICsJCQkvKiBwb3dlciBvZmYgYXV4ICovDQo+ID4gPiA+ICsJCQltdGtfZHBfdXBk
YXRlX2JpdHMobXRrX2RwLA0KPiA+ID4gPiBNVEtfRFBfVE9QX1BXUl9TVEFURSwNCj4gPiA+ID4g
KwkJCQkJICAgRFBfUFdSX1NUQVRFX0JBTkRHQVANCj4gPiA+ID4gX1RQTEwsDQo+ID4gPiA+ICsJ
CQkJCSAgIERQX1BXUl9TVEFURV9NQVNLKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgCQkJbXRrX2Rw
LT5uZWVkX2RlYm91bmNlID0gZmFsc2U7DQo+ID4gPiA+ICAJCQltb2RfdGltZXIoJm10a19kcC0+
ZGVib3VuY2VfdGltZXIsDQo+ID4gPiA+ICAJCQkJICBqaWZmaWVzICsNCj4gPiA+ID4gbXNlY3Nf
dG9famlmZmllcygxMDApIC0gMSk7DQo+ID4gPiA+ICsJCX0gZWxzZSB7DQo+ID4gPiA+ICsJCQlt
dGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb24obXRrX2RwLCB0cnVlKTsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArCQkJcmV0ID0NCj4gPiA+ID4gbXRrX2RwX3BhcnNlX2NhcGFiaWxpdGllcyhtdGtfZHApOw0K
PiA+ID4gPiArCQkJaWYgKHJldCkNCj4gPiA+ID4gKwkJCQlkcm1fZXJyKG10a19kcC0+ZHJtX2Rl
diwgIkNhbid0DQo+ID4gPiA+IHBhcnNlDQo+ID4gPiA+IGNhcGFiaWxpdGllc1xuIik7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKwkJCS8qIFRyYWluaW5nICovDQo+ID4gPiA+ICsJCQlyZXQgPSBtdGtf
ZHBfdHJhaW5pbmcobXRrX2RwKTsNCj4gPiA+ID4gKwkJCWlmIChyZXQpDQo+ID4gPiA+ICsJCQkJ
ZHJtX2VycihtdGtfZHAtPmRybV9kZXYsDQo+ID4gPiA+ICJUcmFpbmluZw0KPiA+ID4gPiBmYWls
ZWQsICVkXG4iLCByZXQpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCQltdGtfZHAtPmVuYWJsZWQg
PSB0cnVlOw0KPiA+ID4gPiAgCQl9DQo+ID4gPiA+ICAJfQ0KPiA+ID4gPiAgDQo+ID4gPiANCj4g
PiA+IA0KPiANCj4gDQo=

