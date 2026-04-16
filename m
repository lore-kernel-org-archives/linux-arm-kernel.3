Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4FFF433DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 03:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIB+8qp0uWHHGX2QcwjdpwhYAqSoayseP+8JHJIHOvg=; b=eenaZi2OXpfExSinIqGRTrAkF6
	HojXzYEdZFjBIoKjIxVKSZ5Ck8WTk0LmXwCctGF+u3bYmM3RgCg/FIpEGwPaMjpIhiIbyjGllTqlY
	6+B0aCBHgf1JNUJrkNvkx2ShrQ8GKKspEgYbx6aywnCHwvNrfvuKeyaPRxVHwXHERlvfUNBqcBTG7
	GmoVY865AH1ZsSUUprPfzKiTfw+nSVL5v7eE5SUKDYPNQNP7hJBJminj8VH5qbx9ruHrM3ERKJ2FS
	qXgsbeqTmlX7L7FExVddf9XR/h9eoTnPbyYnKS8UzRaruxLGrRbbY/31RNdFRtRxyQrxXa5aqmUgE
	VM6CHfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDg8-00000001wFN-39J2;
	Thu, 16 Apr 2026 03:46:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDg5-00000001wEs-39NE;
	Thu, 16 Apr 2026 03:46:06 +0000
X-UUID: c628d6fe394611f1a6de359d7043e138-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lIB+8qp0uWHHGX2QcwjdpwhYAqSoayseP+8JHJIHOvg=;
	b=nXOpSjT35Onc6iXPemof2Jiq/gfpa8ZyE2gORQs5oYS0VZGqBf5VAHw6NA92NbIkai1ApKGbpU55jszCIMdz2BAWtYPkHgnZvkhYU1u36xZNafbi58IPcg2zvhFs+HsdKN/ZYYzY4Rnf3JzKp1Y+xkgd2sIxWyLcnfkJ4YD1F9k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:56d14e62-111e-4cb4-9fcc-2b36ef9c3e15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:af6efe94-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c628d6fe394611f1a6de359d7043e138-20260415
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 164918922; Wed, 15 Apr 2026 20:45:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:45:39 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:45:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpIyQEuTo87RQ7qz7Ry4cV8kIjh8ED9sE2VsX41rokGb/LFhoTRTwmCNBicO6Vdh9FLvoJ/2mQKOdOvH+78RpX28I63/xsrWowbWJJIxrify3WuJYVGprGT56voOIZBZC9ZeCPj1GoOXrvb30U7L8bRlHGTlaxIZKn6fG0V1rNKZzwsRSQAlj687p1RDlO9smJHbwipAonsPwO+y5jwZ85GoK3RBjq6v/t2kpcr0Epk4tn1PTXryJnzqcm5tuWrZ+54eNBp93JMJJ01UFLPLkw9CGIGtNjbcKtJtvBz3zYIcrJ3GAUCM3PGwbtJaidappVCsozdoiazEJP5pGvTv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIB+8qp0uWHHGX2QcwjdpwhYAqSoayseP+8JHJIHOvg=;
 b=roT/pj15YCXU0NyYAQ8320IvzmqRREAlMlyyv75A6OmTC0jqjPW5sK9I+0jqP60HreV/1tUo2c+Q4gejCU4YZij2MNnqGk00weKmJaMk1yNB4x8vYQidNKOZuna/wTYGuYj/zfq5adWwHL+rldAqJOZ2C/ypR4KoaqkBM0mHvY59f4cM7o5KOFomz0dPmN2hFGxnDADMEvYL6UcZ0IeDq6FrS46T9v654tGxxVRC/I+Q5mALP8E11Nnx0b3KjVXkLrBxSvSMUpjUzYFctf1AX5HDwHTHZH6r7S4KbZotg4DLVutlkrp5yXSHdyiF0zg/xfCpoG0/4yz7OrtXjWx1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIB+8qp0uWHHGX2QcwjdpwhYAqSoayseP+8JHJIHOvg=;
 b=a1FiZYm7djENJ5T0n4dwK9LiSs0tSh6yiqsJzgIhSmSGVE13Vsbn4j0A+O3hUeicRrAk2ICFisyPXZIltsINWzKoLo8ju7saTXRuGLeVrVWSV4pHTMjM881Cg65Yfd67NijEVFTUWbr4HVjqBA03AVjqQAIcOt3kJl5pBYqct2Y=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KU2PPFD33A87D41.apcprd03.prod.outlook.com (2603:1096:d18::427) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Thu, 16 Apr
 2026 03:45:36 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::bca6:6e1d:33c7:b8fc]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::bca6:6e1d:33c7:b8fc%4]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 03:45:36 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?WGlhb3NodW4gWHUgKOW+kOaZk+mhuik=?= <Xiaoshun.Xu@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
	<Sirius.Wang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>
Subject: Re: [PATCH v3 1/6] soc: mediatek: mtk-devapc: refine devapc interrupt
 handler
Thread-Topic: [PATCH v3 1/6] soc: mediatek: mtk-devapc: refine devapc
 interrupt handler
Thread-Index: AQHczU8I2LC2DaxlekSb8EMJ9ak2MLXhDFiA
Date: Thu, 16 Apr 2026 03:45:35 +0000
Message-ID: <e63f462b3db415f1a3380e72734c269608f9a36d.camel@mediatek.com>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
	 <20260416031231.2932493-2-xiaoshun.xu@mediatek.com>
In-Reply-To: <20260416031231.2932493-2-xiaoshun.xu@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KU2PPFD33A87D41:EE_
x-ms-office365-filtering-correlation-id: ccc49317-a391-48db-c704-08de9b6a9e5a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: L6SLYwxAf0Cz9YFT7YTCCBm/7Lsz8B/fY2fc4CkQED3SCde8p6uobM7RQAONeU1DjMj+rLbSeGKoKa6CbRSg+mM8XnHKJ0Q8gBW5rTVWUh73X5AyJ9rMILnOPMyUOihU7v3mF4iJeZpt0QgeKI7qONbhdQuO3RebL13Km6YdlBmffHYZW7nW40iC6AeYBKaKNEcfo1hcQN2JL6KEm+aQRAIVxhcEIXbVvtVVzWktsHdQH0bgvZWMG3iyqEQSJbaNqt0HeREXxllojSOZAxloo4lvwQQEXeO6V68VF3twg3sDwUEFsIfgPzMbNZj8E6ofYOLm1jrCOBiI/X50ZYxnJVFXW+q+s1Bk35PGt+kivBzo3ZRnYMooGjwkJ5VqXux49erQYip0ac+Uv++4YIzktPoKaow0z1m13hVyl90Rfdck4h9X0xwY/7xwklEbNrGobYaPMRHlN9X81XMZnFQ4csxOi7dK40lnt6mflycTDE3PBtTPAU0r6UMEQVOjoylqD8AKRyo1yXL5sUhahwhWmqMC8yhKGsTQMe1xMRgX2/BH70lAONIIyVwl1vROyLdIIAP7Jyv5e0DipFjIi1kMAihFzBcCZnyOGm9z9TvZLd/oYMamhb69yF15/ZuShK4oCTmOVrgWBDEk/cRnKa00+0S4sZQW7cSVwHhD64OqpYp6sBVJkZL0TZRXlqBz7v8kpKi6v+z2/KxMI/5+0fAw6Gw8O+lhF06CHqnh/VpQNAifmF/5LfqUHuupyKGfWkz8X/5hbVAy5BsxmI1gJnZT85JAl7Gm0O1vZyD82H6TFPY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1NYYm4raHRtWjMwWExJMGUzR3cyS0w3OTJIN1FWUm9oRm5OZ1lwVTRTc0Uy?=
 =?utf-8?B?WXRGVXJsTS9aVlRIOG5aYjgwaUtCY0lGb1AybVlwMlNoN2JCWGlsT3Jib1F2?=
 =?utf-8?B?c2h4Ym9kWlFqcnU4cXNRcDNMZ2NNL0l4amJvL09kNWRMcXJhdDFlSnZ2NEpt?=
 =?utf-8?B?NFVGMVhJN0o1M0sycjdIbWp3aTZwSkFDcHgzQ1FoeGtuYnhOWDlpZnQzN0x4?=
 =?utf-8?B?UG1RalAyZE1VRzRLc1B3b2hxRXhNb0JQQmY4VlkwVVl0eFNuZjU0eWpmaThK?=
 =?utf-8?B?bHJscXZ5NGhNTkRJYXAvVWh2ck9CdFFuZXN2UnFmMnJFQTVadGY5RGNhS3Y2?=
 =?utf-8?B?MGc5aWJ0eUFWS3RNRXZkcDcwN0JoOXBBZVlOeVdnRzVMRWd6VUtjNXRmdTRK?=
 =?utf-8?B?UGwrbzVKdkpnY0doY1JudkZMbW1GZ3hIdHRMZVlHQmFGTisxczJCV0lISUE4?=
 =?utf-8?B?TUw2bWtsVi9rWnZ0TVZJQVFFMjliVWgvTEFiRWhHckZWZ3VyMGw3YjY2WDRs?=
 =?utf-8?B?eldSckRRRVhJRE1FVm5nQzU5WlZpWFpKNFlZSk15Y0twZmNwMytHSXdJYnVP?=
 =?utf-8?B?eGRrNHlOcWp4UU1KUnN5UklPcnlqWXlIMEEyTDdOaUdhb1ZPMm03bnFZcjlL?=
 =?utf-8?B?V1hhN0dXZzRqcTBLeEtBMzl5RUhLQkF3TDlBQXo2UStRQWhyelQvaW5hbGJQ?=
 =?utf-8?B?TldRNUx1MmFyVmVFTTZzcjlzT2JqeFVmV2h2dVBjLzAwdGJ5bitSSXJZSHhq?=
 =?utf-8?B?cGRQT0s3eTkyR0xwaG1leHkyblRNZ0Fkdml1eGJQR1hUMDRnQVJPY1owTENy?=
 =?utf-8?B?L2FycEYrZ1IwQUhMaytEYlFCSDdsYjg2T2hlTlpJNUZLbDc3VERWVXlQcEtp?=
 =?utf-8?B?ZEJzQUZOdTEyTUQyakoxYXhicnFFN0twZ0YrRy82YTUzTmU5QUczeUlvaXZn?=
 =?utf-8?B?ei9Ha1dPZkFRWVdSekFzN1hPU0RPUC9ueTdhUWE0MVdCeGpqMmd3ZGdSenE1?=
 =?utf-8?B?OUhaN1l2VEhSRGhPL3pzYWN3VDI1ZE9aekpUNzQ5YXhZelU2Q0ZVcFFxdzhX?=
 =?utf-8?B?d2FRamsyUmVPaWl1L0VvV0RxcVdaeXRNaTY1dW9GZmtNc3pSMGlZYzVXVXBU?=
 =?utf-8?B?ZG54VmJoTHlXa2tncmZCRUpySmtIZ0JCeURVRkRGTEFXSWsxRkV1eXRDZDRE?=
 =?utf-8?B?SjhCVVJ4Qjd1R0s1cnFxMkp2SUZ0RVd3TzV4R2NzYTVQdzZTeWI4V1p2M09D?=
 =?utf-8?B?NXM2ZUdPNm1YNXhiTnI1OFpCd3hPKzFURU1SOXBvMlRmZVJJTHdtazhXUTJS?=
 =?utf-8?B?alQ3R0xSNk1VbzNiQ01xMkpNWjlKeDJEdlQvREJic0lPbC93bkFsNmpjWUcx?=
 =?utf-8?B?OG5DSllweFIydmFKbVNTSGFzMkpSQWRvUkVIei9HdEkvaFdlK2dObFJ4V29E?=
 =?utf-8?B?dWk1YkR6Q3Y1OXoxaUMzY1JvdFA0UEU5cWl4YTlzRW1ldFpVaisxUHNYbUpt?=
 =?utf-8?B?QllkS0tHZkFpNjB1Yk5oWVZRVmVPcVE1Z2s5NkowcVdvQmljTTRocG54czVQ?=
 =?utf-8?B?bElaQ29lV2pHUjVmUldVSHlST3pzY2gyRFdFaWlQTmxBNWxyQk9HdnRPRmxy?=
 =?utf-8?B?a0NIN3ZzVWhwVmVCamx5ZWJPWmpyWE9HaGJCRGoyNlZWWmlHaDB1OWRQdS9S?=
 =?utf-8?B?R0dmMFpwYTJWNGZGeVo5ZFZ0QkU5a1gzTnptdWkxOVhvdTN0am42cW9Nem1M?=
 =?utf-8?B?RW5Ka2VZTjNpdVE0cTVFNzJtOXpSRzd5ai90Sy9wbmVRWTN4V1Q3SEppbW5Z?=
 =?utf-8?B?SE10a3ZCZk9ubUt6Z3NiTXNUd2I0YUFXRWNjUExsb1hkdTVxM01JVHdhc1NZ?=
 =?utf-8?B?R1J5SkNQQjZySWJtU2ZZaUZHRmpwUEllaUVhWFFuUVZyS2U2OHArc1g1L3Jp?=
 =?utf-8?B?SXpqRkNqZFJqNzhZamc2VnM3YlJtQ05nSUgzZVNLdlVvNVN3NzE3QXZ3L2F5?=
 =?utf-8?B?S25pYkZnbnoybW9UNGx3dTdBMmhlVXBmaFRqN1NNWTVrWldNKzFnSVV0ZDBT?=
 =?utf-8?B?QVFaWWJtYjMxdkZlS3ZvSGhIOEdDQ3BWTEFhSzhRbWxCZkhFM2FFRkFTajFr?=
 =?utf-8?B?S0RXbFV4L2tuSnc4MmN1eTB2Vm8vbGE4ZUJPbmN3UHpGQ3lsRFhNOGtqSXFT?=
 =?utf-8?B?VEh2RUN2SFlMR1lWd09PSlgwdEdZZUxNWXcxaG10WjZVRmVlMGJFM21ncWJh?=
 =?utf-8?B?Wk41OVh3d2syUzlRWmRTR0svSGZmRjV4M3BycHhKMlFtanhHaEtobUpMbHFH?=
 =?utf-8?B?NG1LNnNMV05iQ003UVZab09Jd3l4U3hrbDY1REIrQmJTdFVzWW8wdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <254A11B1646E1047BBE015EA9A4C4EDA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oaYTZ6m2hiaGQQbgvFh41InXfA9r9QectCVGDW3fBi1g2L6yqlKwiyUSFBShK5YDM/hsJolwjIQVWtIm+BEVg9JhRsdzO+3ZUD+zSmQi0raTzuCymEp1IIAHig7mXdPW2nAGVrJL45he8EChW8TWhY/CGPf9yse+EHhYDPlM6CQCb+C9Kg4qrwRaIdqhdOGBnUP78Q8MKESskQiZe1y8LABhss160OdnYFhcpB9JGTCC5EeyGtYOPYVQL/oPgskDxWVEFRSsa2DmU3YGlblPnFFgRfGGG2BFX/40waC4lLsnhnVEk5Z6J63jeNNCwCnf0pIHY2gT5p12xnP8WExhNQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc49317-a391-48db-c704-08de9b6a9e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 03:45:35.7771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3zk9xPILP++pGCQD49RVATbGFJd6i2x2cLnUzXX80t6KQceQ091Xy1yU6DnCNZK+6N7NvjeZYZXdkoLyACJoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFD33A87D41
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_204605_807494_FFD75454 
X-CRM114-Status: GOOD (  19.67  )
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

T24gVGh1LCAyMDI2LTA0LTE2IGF0IDExOjEyICswODAwLCBYaWFvc2h1biBYdSB3cm90ZToNCj4g
QmVjYXVzZSB0aGUgdmlvbGF0aW9uIElSUSB1c2VzIGEgd2hpbGUgbG9vcCwgaXQgbWlnaHQgY2F1
c2UgdGhlDQo+IHN5c3RlbSB0byByZW1haW4gaW4gdGhlIGludGVycnVwdCBoYW5kbGVyIGluZGVm
aW5pdGVseS4gV2UgYXJlDQo+IGN1cnJlbnRseSBvcHRpbWl6aW5nIHRoaXMgcGFydCBvZiB0aGUg
cHJvY2VzcyB0byBoYW5kbGUgb25seSAyMA0KPiB2aW9sYXRpb25zIGZvciBkZWJ1ZyB2aW9sYXRp
b24gaXNzdWVzLCBhbmQgdGhlbiBleGl0IHRoZSBsb29wDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvc2h1biBYdSA8eGlhb3NodW4ueHVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
c29jL21lZGlhdGVrL210ay1kZXZhcGMuYyB8IDggKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstZGV2YXBjLmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
ZGV2YXBjLmMNCj4gaW5kZXggZjU0Yzk2NjEzOGI1Li5jOWUxNDAxMzE1YWQgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1kZXZhcGMuYw0KPiArKysgYi9kcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstZGV2YXBjLmMNCj4gQEAgLTEyLDYgKzEyLDcgQEANCj4gICNpbmNsdWRl
IDxsaW51eC9vZl9pcnEuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+ICAN
Cj4gKyNkZWZpbmUgTUFYX1ZJT19OVU0gMjANCj4gICNkZWZpbmUgVklPX01PRF9UT19SRUdfSU5E
KG0pCSgobSkgLyAzMikNCj4gICNkZWZpbmUgVklPX01PRF9UT19SRUdfT0ZGKG0pCSgobSkgJSAz
MikNCj4gIA0KPiBAQCAtMTg4LDEzICsxODksMTggQEAgc3RhdGljIHZvaWQgZGV2YXBjX2V4dHJh
Y3RfdmlvX2RiZyhzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpjdHgpDQo+ICAgKi8NCj4gIHN0
YXRpYyBpcnFyZXR1cm5fdCBkZXZhcGNfdmlvbGF0aW9uX2lycShpbnQgaXJxX251bWJlciwgdm9p
ZCAqZGF0YSkNCj4gIHsNCj4gKwl1MzIgdmlvX251bSA9IDA7DQo+ICAJc3RydWN0IG10a19kZXZh
cGNfY29udGV4dCAqY3R4ID0gZGF0YTsNCj4gIA0KPiAtCXdoaWxlIChkZXZhcGNfc3luY192aW9f
ZGJnKGN0eCkpDQo+ICsJbWFza19tb2R1bGVfaXJxKGN0eCwgdHJ1ZSk7DQoNCm1hc2sgaXJxIGlz
IG5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2guIFRoaXMgcGF0Y2ggY2FyZSBhYm91dCB0aGUgaW5m
aW5pdGUgbG9vcC4NClNvIHNlcGFyYXRlIG1hc2sgaXJxIHBhcnQgdG8gYW4gaW5kZXBlbmRlbnQg
cGF0Y2ggYW5kIGRlc2NyaWJlIHdoeSBkbyB0aGlzLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+
ICsJZm9yICh2aW9fbnVtID0gMDsgKHZpb19udW0gPCBNQVhfVklPX05VTSkgJiYgKGRldmFwY19z
eW5jX3Zpb19kYmcoY3R4KSk7ICsrdmlvX251bSkNCj4gIAkJZGV2YXBjX2V4dHJhY3RfdmlvX2Ri
ZyhjdHgpOw0KPiAgDQo+ICAJY2xlYXJfdmlvX3N0YXR1cyhjdHgpOw0KPiAgDQo+ICsJbWFza19t
b2R1bGVfaXJxKGN0eCwgZmFsc2UpOw0KPiArDQo+ICAJcmV0dXJuIElSUV9IQU5ETEVEOw0KPiAg
fQ0KPiAgDQoNCg==

