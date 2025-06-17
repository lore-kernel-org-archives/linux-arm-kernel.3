Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB4C71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVXpPf0bQ4Clx0+cvA7x0pdgh7oaT/LiGuQr4JoELXs=; b=r2iGFX5gOhw8vCgyxHJNqMAC7w
	UfLHg7xrodJDLeyEZVz7ooyTiKm2IfctfnzkhIpk5vnJvJmBqcTmfS0M/X+vzbcZwPGF0Z9qwcgdf
	86dCW1ZKMNsGZWUx39G7B1ViUbUGFHIMl6cz7tnv819SUXDCsJ1CrwzRVuAW22BzyF7lq6CwEgsL0
	qsGNH7JDlR/W2sabPJzZi2G04tcmubsXDsSnW8PeEG2H/NrETB8cSd69z+S0a8FJiUJhBs/Fxry5J
	XemuDjlzchfe9ayaNhSRgKu+s8kPDThoBHE/2pMCOGCIUmOw7pCu2w79ejiuYHKIQhsE++cyuCI0E
	3BuVRurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPZO-00000006Kfh-0pnx;
	Tue, 17 Jun 2025 06:13:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPTP-00000006Jnz-0QSH;
	Tue, 17 Jun 2025 06:07:08 +0000
X-UUID: 48b983e24b4111f09eb0dd999d3936bf-20250616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LVXpPf0bQ4Clx0+cvA7x0pdgh7oaT/LiGuQr4JoELXs=;
	b=FEvV2bgTSYyJYKld8/ZtW/i2NMMfzdsZXt0V2vaJ8Pp3+bMoKZzCZSZZGPUl1giBKLngI4ibMwkxXYbFEHT8jnjnsuD1hnggLAlPYW2aRjcyjpSWUYHSYeHBrjCJScIvuo4Xyi7jJgW8z/XDvB9tStT/rEQHKer1odvnT1jCPm8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:ae2b5c5d-29d4-4cd9-b8c2-a821b3b31bba,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:25398a28-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48b983e24b4111f09eb0dd999d3936bf-20250616
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 338745819; Mon, 16 Jun 2025 23:07:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 17 Jun 2025 14:06:57 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 17 Jun 2025 14:06:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfjlkvB415mfM9k2HWL8IVZn5M/2tIzuSxnr5sKS2wSha/pCJVFcDmQHuMAS68U9kOHPuxESWkpQ+bl0yUXjoDlIS7rVGq1aAhC3vFVMrWnBr3OJsyGPZ4IWpc/coq2G291o7R+qcUJghw93O13gUXlDJ6bKEBXo186SrM+dNIa8z4mogLi3Lk1UuAafu8uox0rtoSq+YztY35ghCKzwUy/Fk6JbS3LwI6l0uNmiFxXJ2uhK2g66/834yKlxZl6EKEcAWI/SF03WODSGPNcYv5lDRJMXPztgo+2RRxXTX1EBja6yh5lQfgXGrLS9FaZV3EX1fnc4zM24eYcGP5a0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVXpPf0bQ4Clx0+cvA7x0pdgh7oaT/LiGuQr4JoELXs=;
 b=AhFsbikaXlcxxt8gL01PFqzv4BcC18rDejPmgulfiNkU85gzlgB8CLsDKPEQVyJ2zMvWXZG+rIoz/uno0ugSDICgBsJM813zZevSsWGgD++2irPvio8aKZgmT09rbeP5g4OZOL+WjiJcsVXZnLk1DcmVHPrueDIaI2pT7Sl7OlkT+zGORDQC9xErLW+yJFWyGF0ReAcwEwDKESShGRL/K67rh7LUKZ9fXBUKF0ZBmBwAqQAe6KSkZbL6iFlpBNDMh6oKsOEb241ewWQ7LXTYMNXB1OI4RO5zyUgINjFa/b31VROwDO0s/QoCJ0CFsqyIjlkruHDc7AbbqwXcZIo9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVXpPf0bQ4Clx0+cvA7x0pdgh7oaT/LiGuQr4JoELXs=;
 b=kW+TT5NOiBdAQqmGGdSaaHVDIastqrYkwecKwRDDajE5cgpqNyhkDy2CFXaALzv2+dsDCYvEPpdQVqvW27EbxOoLf4GT91W2Q0CEiKkIyPprtagr7WfRqwuhNjJpQnjG4eJ1MwGRAoFHLQnuH5tMZkmVjbYgGRmHjqga72Sg85Y=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8561.apcprd03.prod.outlook.com (2603:1096:405:63::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:06:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:06:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v3 11/17] drm/mediatek: drm/mediatek: Export OVL ignore
 pixel alpha function
Thread-Topic: [PATCH v3 11/17] drm/mediatek: drm/mediatek: Export OVL ignore
 pixel alpha function
Thread-Index: AQHbxXzRHWEk/o0nC0iYtNqVKOwx2bQHERIA
Date: Tue, 17 Jun 2025 06:06:55 +0000
Message-ID: <5fc19e0e92ab9e68da097077367f0a9b5b59a343.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
	 <20250515093454.1729720-12-paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-12-paul-pl.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8561:EE_
x-ms-office365-filtering-correlation-id: 5ab3ebfa-9ec3-4abc-bb33-08ddad652997
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QnhKeDFTdmJ2MTFmUW90OWRLdTFtZ1ZsMytYVzlldENRRFQzQityRDZlSS93?=
 =?utf-8?B?MmVqMkl3RXdWSUhPSVpDeGZaQVducEJKcDl4ekpPU25WcytPdW9xNnBJclE0?=
 =?utf-8?B?M04zSDQwOXdPRkpseTZ1MWQzeFQzV0dWNFRIb25zcmlaUE13M2dqM3hhbkNL?=
 =?utf-8?B?R1ZJeFo5WVE4U1lldFFkRmFXVkVXU2xkMkRTVHJCK29vL3lJeURjQnZkSGxP?=
 =?utf-8?B?TXZCTVVJSDFFWVJUcXp6azVCT1QrSXVGTTY5NGlGTmg3NDhVM0ZsZ2RUVDBR?=
 =?utf-8?B?U3BIWnNCVWd4WTlNbzRWVzBkdUJycTFLZHlOVklHaVhLVm4wc08ydWhwM2xw?=
 =?utf-8?B?RlpXQmlhV1RLQXpldGpOR1dDY2pjcEVSdml5dG0vQnVlQ0hDMzhERUhSaTRa?=
 =?utf-8?B?ZGpDNC9rV0ZNbGRVZStadnUyWUo1NGFxRVhGMjY2S3hiK1pTSzYwRFJhYXhM?=
 =?utf-8?B?cEhHZ2JtbnZJV0VEby92THN5UmFWM3lrb3d2SlhUeDl6L0FPOUYrOTRkUWtQ?=
 =?utf-8?B?STVEclJObVQ3TnYyWUVKdmxocVNxRnBZQS9pWU1kL3pJKzNrK1hlZnNyUk9Z?=
 =?utf-8?B?bWRjMWlkdzhIMU5hZ2Z3STU3T2UvUjE3Nis2S1loNm5oU2lRTGRSV0o4RXhu?=
 =?utf-8?B?Y2UyU1FhUG5wNGYxT1c2WnltYjArM05UWXgxckdhZGthMlNGcDBkNmRxYWtZ?=
 =?utf-8?B?Ui9CcnZTblJtdER4UGxmMEZXa05hYUpETnlXajNaeWhMR0lIZjVYQ3ZFbXli?=
 =?utf-8?B?ejZJdzE3VjZDUWJkcmQ4eE5Hbmp6NTd4K0FwTzAwWUdEVlV1UDZXdjJIQlRZ?=
 =?utf-8?B?cDJCVHhKS2VtOHBHTnkwSFpXUGVZK1hXV29DZ0pqWWRScTkxbTd4WjFNZDRm?=
 =?utf-8?B?SkFnR2xlTng0a2xQY0NJVkRxcTFGMFlBak4vaFR2aFlOenI1NGlIaEgrWnkv?=
 =?utf-8?B?OGJhRWNmZEJ1SUpyWkZpVXpQWWQ0cFhJSHM2ZnNFaXlRYzZCalRYcjJmeGk1?=
 =?utf-8?B?WW9BSyt4U0dvZURCbU42aSt5VnJQRTNwbDJhQW4ybjRoK21Oa2xKT2Nac2pG?=
 =?utf-8?B?NjR0WThDRS96UjJXditkblQ0SW1maUwwOG91T1Y3QkV6UGhDbkhYQjlqNFBr?=
 =?utf-8?B?TVpWVk9nL1BzZllOSjNhdlBuaklUeTdXSHJrM2lVMzRqS0FCWUhLR1JGY21E?=
 =?utf-8?B?bHhMem9jWUJwYWdPbFVBbGRNS2dNaENWTkhaKys0MGM3dlhiVmpoQjhqU2Mx?=
 =?utf-8?B?N3VxR0dSbFRKWEZXL3EzbndzUVRPSTJFdmJsczJyMzdYWXhCQ0VHbzVmckhm?=
 =?utf-8?B?VGVMOGJtUzBKWFFtcnBMQnVKdDJpRE1OSytzZUJMZHRBN2pBZURuMm91UDN6?=
 =?utf-8?B?VEwra2M2bWtRODJoVjNxZnJEWEc1MzQ2UzV4R0pwWGVLZGMrODhTWGh5VnBp?=
 =?utf-8?B?djNRcnozb205eDg4VytJYzRtdFlCWHZsMXZ1aDc0eWlVQnhuYkFpMkxDSnBK?=
 =?utf-8?B?TXlaMVQ0akFKUThGaWRRWStTRkM5c1RSNTZydEc4cTFNSTVQazNLV2xkWFBR?=
 =?utf-8?B?TlE0RERXZ21nbzVzS0l6Q1pVbk5iNVZ6ZWpDajVZSVdKN29adFhLbCsrZUZD?=
 =?utf-8?B?dmxVUlIxeE1NeHROd09FanVKbWYrNE0zbkI3VXV3ZHhVZ0psVWpoNVpQWkp3?=
 =?utf-8?B?VHN5dXhKZ3kxcUl1N3NHKzlub0hVWTlQRXB0dkxJREtaT1AweG1LcUpKZUFP?=
 =?utf-8?B?MENSWWJWWnU3MitYdC9rSHhNUmhielVSc0JKMUtIc0pTKzIzcEpiNjA5ZDRT?=
 =?utf-8?B?RFpzM05FQ3RtOGFVb3hyTFJnSktBUVVpcWxWNndOM2pYTGlsZmJNYTB0NW03?=
 =?utf-8?B?N2pDdmUxYVN4STdiNmsrTVhzTExDL3p1Z241aW5QWUQ5UTFpMENsSTA4UHY0?=
 =?utf-8?B?d1FKR3J4QWkwQitOdmMxZUJOUURCSGhVL0RsZm9wTCtqSk9tV2ZOOFRGOXlZ?=
 =?utf-8?B?V09NSHFxbnJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW9hKzFkZXIyNHh1MHZWaDB5OGdxYlVSMERZbmQrQWpCOWdaTSthVGVGWGRZ?=
 =?utf-8?B?a2VHQTVuV3JtTUVCUHRFT2lZRWhRYUpTZ05WU3V4dDVjK0NLbFFzQzBKSEpS?=
 =?utf-8?B?bXg1ZVdMQnp2ekdKWFhzbGZsOVFmMUVJTHYyY3IxYm1yZE5RVUc5ZnVGUnIr?=
 =?utf-8?B?NkE3ZUdHcHVBOHhNbnUrNk54ZVdiajZKZTJ5RS9ST3R2U3RxaXVVKzlxVnJY?=
 =?utf-8?B?UjdQMXNXL0hQaEE4Nk5rTjVVaUdETmNWeFVpY3YrOGl6K0tRcVlDQklLeXZ5?=
 =?utf-8?B?TnI3dnVONVkxQndqSHVVNXlqellxZ1F0Z2hKYzVIOWdPWlVKcGxKVUNyU293?=
 =?utf-8?B?bXp3ZzFMQUh1VW5hZmljK0V4cFZPTkdWYk5lZTcvd01Iby9IN25ZZFVCY0hX?=
 =?utf-8?B?bGhRT1kySFlnRVpUWktuUllKVldFdlhiNVIra2QrUUszcm5wUGs1ZjVRM1JR?=
 =?utf-8?B?eFVSWXZRczQvejJ3dWxJaDFoV1BYSTh3T3pkZHBZMlcvQi9CS2Q0SUovSkdk?=
 =?utf-8?B?Zlp3NE11YWJPUkdjT3EwbmJnWWJzd2tQSTJtUFVmM2NxeFRwcWNKSW9WK1ls?=
 =?utf-8?B?Q2pUalNBd2Vma2kzVGJuMWhSNnQzRTUrOFBpVHNpWHBtNFRvZkFzK25ZTTht?=
 =?utf-8?B?V1RZdkxrSXNXUmZUYTh0OHR6a3YyZnBqd0Ewb0ZtNkxYWG5FcExkM01PcjY2?=
 =?utf-8?B?R2RzSUlGcFc4eWoxVndNZjk4Ni9LRXR3dGVldTV3VWhTa3BrR3hhbzNzRCs5?=
 =?utf-8?B?U2FCbDhYTVpQMmJhbFp3dWtBZ2VwQm9jVlVOcm5WN21LZHJjNys5TGpyeWNs?=
 =?utf-8?B?dDV0eTJxVnk0ZVUyaGZBRGxnWXhNUVpJVXBLaDAzMUZlZHBiVHEyKy9UZFRP?=
 =?utf-8?B?VGdhUGYxaFNVbHVpb0Q2RVBENUE1MTNhUnRXMm9WdGRIV0crSlBxenZqQkZr?=
 =?utf-8?B?MldXWUlUMTdxR0hMTm1OVHA4Z002YkYvVGgwT0VLU3NUaE9STGM1TjM5MTdw?=
 =?utf-8?B?SUdwR2E3NkZsM1pVemVHTkFiWmZ4c2pQdXAyVUF3a29jMld3L3hhWTZFOGtX?=
 =?utf-8?B?MGhqM0JPdE5rUDZxUEVTWEJSaEc3ZlZKUmxrNHcxMFU1YTZpUEpmaWxMK3Nx?=
 =?utf-8?B?WWdVR0ZIUnpScWpjNkEzcjVsMmE5cUFmVVNtcUcvcXliUHJhbW9KVWdxYjVQ?=
 =?utf-8?B?OUF5a0NPMURDeG9FcU1PRWlXZko1dzdLRzJ1dSs1QnlwY2xEamI1SWE4RzVY?=
 =?utf-8?B?TEtCOG1rSHlPdjdkWFcwQ3h5aWVQaE14Q2w1RWhFVEtQNTNjdTY1amRVekxW?=
 =?utf-8?B?aDNDS0FLUzlvOW5ESVpBVEppdFRPSzRaR3hEN2JicVh1YWU1dEJ4Sjl5dkFM?=
 =?utf-8?B?cjQ5eDY4VmNNS0l1QXRtZTFpQ1VvUWJwdjlOS0djZlc2MjhHRHNmTU9uY3ho?=
 =?utf-8?B?cDNsN3QzQ1RvL1g4ejNhRFEwZ0NCS1JnQzRmcXNQYW9pZDB2UTBSNCtzM1NU?=
 =?utf-8?B?c0ZGc2YyZU11b1F5YmRaSmhMZWZMd3F2OUx4NlFvUlJibW9HUG9LcGNVaU05?=
 =?utf-8?B?NDhML0FTYVk0Z2VQbHIwWGdNQVJnSCtnYVZ5d0lIR1J1SFpTeHdUVE14cW5I?=
 =?utf-8?B?NHp4ejZyZDlJODdPWTJ3Z3NpenpIWXdoU2VkUHlmbU9YOFdNZ3ZmYy9ZYWhQ?=
 =?utf-8?B?eVJCSVorSjgxR2d2a0pZM2JyaHBZanQvV3FvSi9VaGJvbmRYbXNDa2lseHU2?=
 =?utf-8?B?RTlBZWFHWDNLLzlFcStJNm91YWNVa0VKY0paQmhUUFlwWWdMQisrQmhSV3NM?=
 =?utf-8?B?ZUxRdDhnUWdyWkNiVVZrK09vSllmVWpWQ3Q3NUgyeTFPUDdZWmpuaEdJdWFS?=
 =?utf-8?B?K2RxS2NvZUhsbWlYT0Y0WmNmYXk4dFRXYU5NV2RJWEc5dGx4MFl3WjNMS1g0?=
 =?utf-8?B?SHR3enZGZjhrakxZNE9CREZFaHVPYnBMNXNjZXNjcjk4cmhUNzJpaVdmYmt3?=
 =?utf-8?B?MlFScVVpSkN1MnRDeG9mTWI0WXlRenNVbHhtcDJscUM1NFAxOTMwZVd4Wmw5?=
 =?utf-8?B?TGl5RTdOVVdjMlFNNFUyZ0Zwb1RCMW10K3B4eEVqb0pYZzR4UjNLSWNoVG1S?=
 =?utf-8?B?cVJJN0hzWXRVdGFIVHhwM1Nyb05tRmdBRDJHK1c2V1Z1cHNNUUpzYncvUjRV?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDB0770F7835B743B184F80A850718ED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab3ebfa-9ec3-4abc-bb33-08ddad652997
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 06:06:55.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dDasVvqfXMLVPGJ2hDFwY2I7PvAOzasHHzshd8E6HyxadyDgSfEWNPgn+h47kEPrhGSPiSNseIqbP1B2wGapjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_230707_479798_CE14A1EB 
X-CRM114-Status: GOOD (  19.19  )
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

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVsLXBsLmNoZW4gd3JvdGU6DQo+
IEZyb206IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEZvciB0aGUg
bmV3IEJMRU5ERVIgY29tcG9uZW50LCB0aGUgT1ZMIGlnbm9yZSBwaXhlbCBhbHBoYSBsb2dpYw0K
PiBzaG91bGQgYmUgZXhwb3J0ZWQgYXMgYSBmdW5jdGlvbiBhbmQgcmV1c2VkIGl0Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsLXBsIENoZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgMjQgKysrKysr
KysrKysrKysrKysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmggfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+
IGluZGV4IGE1MTZiN2M4MmI1YS4uNzQ3ODk4YTU3NGRhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IEBAIC0yMTEsNiArMjExLDIzIEBAIHZvaWQgbXRr
X292bF9kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAJd3JpdGVsX3JlbGF4
ZWQoMHgwLCBvdmwtPnJlZ3MgKyBESVNQX1JFR19PVkxfSU5URU4pOw0KPiAgfQ0KPiAgDQo+ICti
b29sIG10a19vdmxfaXNfaWdub3JlX3BpeGVsX2FscGhhKHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUg
KnN0YXRlLCB1bnNpZ25lZCBpbnQgYmxlbmRfbW9kZSkNCj4gK3sNCj4gKwlpZiAoIXN0YXRlLT5i
YXNlLmZiKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJLyoNCj4gKwkgKiBBbHRob3VnaCB0aGUg
YWxwaGEgY2hhbm5lbCBjYW4gYmUgaWdub3JlZCwgQ09OU1RfQkxEIG11c3QgYmUgZW5hYmxlZA0K
PiArCSAqIGZvciBYUkdCIGZvcm1hdCwgb3RoZXJ3aXNlIE9WTCB3aWxsIHN0aWxsIHJlYWQgdGhl
IHZhbHVlIGZyb20gbWVtb3J5Lg0KPiArCSAqIEZvciBSR0I4ODggcmVsYXRlZCBmb3JtYXRzLCB3
aGV0aGVyIENPTlNUX0JMRCBpcyBlbmFibGVkIG9yIG5vdCB3b24ndA0KPiArCSAqIGFmZmVjdCB0
aGUgcmVzdWx0LiBUaGVyZWZvcmUgd2UgdXNlICFoYXNfYWxwaGEgYXMgdGhlIGNvbmRpdGlvbi4N
Cj4gKwkgKi8NCj4gKw0KPiArCWlmIChibGVuZF9tb2RlID09IERSTV9NT0RFX0JMRU5EX1BJWEVM
X05PTkUgfHwgIXN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtPmhhc19hbHBoYSkNCj4gKwkJcmV0dXJu
IHRydWU7DQo+ICsNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gIHUzMiBtdGtfb3Zs
X2dldF9ibGVuZF9tb2RlcyhzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAJc3RydWN0IG10
a19kaXNwX292bCAqb3ZsID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+IEBAIC01MzksNyArNTU2
LDcgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2ln
bmVkIGludCBpZHgsDQo+ICAJdW5zaWduZWQgaW50IHJvdGF0aW9uID0gcGVuZGluZy0+cm90YXRp
b247DQo+ICAJdW5zaWduZWQgaW50IG9mZnNldCA9IChwZW5kaW5nLT55IDw8IDE2KSB8IHBlbmRp
bmctPng7DQo+ICAJdW5zaWduZWQgaW50IHNyY19zaXplID0gKHBlbmRpbmctPmhlaWdodCA8PCAx
NikgfCBwZW5kaW5nLT53aWR0aDsNCj4gLQl1bnNpZ25lZCBpbnQgYmxlbmRfbW9kZSA9IHN0YXRl
LT5iYXNlLnBpeGVsX2JsZW5kX21vZGU7DQo+ICsJdW5zaWduZWQgaW50IGJsZW5kX21vZGUgPSBt
dGtfb3ZsX2dldF9ibGVuZF9tb2RlKHN0YXRlLCBvdmwtPmRhdGEtPmJsZW5kX21vZGVzKTsNCg0K
SSB3b3VsZCBsaWtlIHByZXZpb3VzIHBhdGNoIGlzIGFib3V0IGNvbG9yIGZvcm1hdCBhbmQgdGhp
cyBwYXRjaCBpcyBhYm91dCBhbHBoYSBibGVuZC4NCllvdSBhZGQgbXRrX292bF9nZXRfYmxlbmRf
bW9kZSgpIGluIHByZXZpb3VzIHBhdGNoLg0KU28gcmVtb3ZlIG10a19vdmxfZ2V0X2JsZW5kX21v
ZGUoKSBpbiBwcmV2aW91cyBwYXRjaCBhbmQgYWRkIGl0IGluIHRoaXMgcGF0Y2guDQoNCkluIG9y
aWdpbmFsIGRlc2lnbiwgYmxlbmRfbW9kZSBpcyBvbmx5IGNoYW5nZWQgaW4gbXRrX292bF9mb3Jt
YXRfY29udmVydCgpLA0KYnV0IHRoaXMgcGF0Y2ggY2hhZ25lIGJsZW5kX21vZGUgaW4gbXRrX292
bF9sYXllcl9jb25maWcoKS4NCg0KSW4gb3JkZXIgdG8ga2VlcCBvcmlnaW5hbCBiZWhhdmlvciwN
CkluIGJlbG93LCB3aGVyZSB1c2luZyBibGVuZF9tb2RlIGlzIGNoYWduZWQgdG8gdXNlIHN0YXRl
LT5iYXNlLnBpeGVsX2JsZW5kX21vZGUsDQpzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gaGF2ZSBh
IHZhcmlhYmxlIGJsZW5kX21vZGUuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICAJdW5zaWduZWQgaW50
IGlnbm9yZV9waXhlbF9hbHBoYSA9IDA7DQo+ICAJdW5zaWduZWQgaW50IGNvbjsNCj4gIA0KPiBA
QCAtNTU3LDcgKzU3NCw3IEBAIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmlj
ZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0KPiAgCQkgKiBGb3IgYmxlbmRfbW9kZXMgc3VwcG9y
dGVkIFNvQ3MsIGFsd2F5cyBlbmFibGUgYWxwaGEgYmxlbmRpbmcuDQo+ICAJCSAqIEZvciBibGVu
ZF9tb2RlcyB1bnN1cHBvcnRlZCBTb0NzLCBlbmFibGUgYWxwaGEgYmxlbmRpbmcgd2hlbiBoYXNf
YWxwaGEgaXMgc2V0Lg0KPiAgCQkgKi8NCj4gLQkJaWYgKGJsZW5kX21vZGUgfHwgc3RhdGUtPmJh
c2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKQ0KPiArCQlpZiAoc3RhdGUtPmJhc2UucGl4ZWxfYmxl
bmRfbW9kZSB8fCBzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpDQo+ICAJCQljb24g
fD0gT1ZMX0NPTl9BRU47DQo+ICAJfQ0KPiAgDQo+IEBAIC01ODQsNiArNjAxLDkgQEAgdm9pZCBt
dGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgs
DQo+ICANCj4gIAltdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsIGNvbiwgJm92bC0+Y21k
cV9yZWcsIG92bC0+cmVncywNCj4gIAkJCSAgICAgIERJU1BfUkVHX09WTF9DT04oaWR4KSk7DQo+
ICsNCj4gKwlpZiAobXRrX292bF9pc19pZ25vcmVfcGl4ZWxfYWxwaGEoc3RhdGUsIGJsZW5kX21v
ZGUpKQ0KPiArCQlpZ25vcmVfcGl4ZWxfYWxwaGEgPSBPVkxfQ09OU1RfQkxFTkQ7DQo+ICAJbXRr
X2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBwaXRjaF9sc2IgfCBpZ25vcmVfcGl4ZWxfYWxw
aGEsDQo+ICAJCQkgICAgICAmb3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLCBESVNQX1JFR19PVkxf
UElUQ0goaWR4KSk7DQo+ICAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBzcmNfc2l6
ZSwgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuaA0KPiBpbmRleCAzZjdkN2Q1NDQ3OWQuLjQzMTU2NzUzOGViNSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuaA0KPiBAQCAtMjAsNiArMjAs
NyBAQCBleHRlcm4gY29uc3QgdTMyIG10ODE5NV9vdmxfZm9ybWF0c1tdOw0KPiAgZXh0ZXJuIGNv
bnN0IHNpemVfdCBtdDgxOTVfb3ZsX2Zvcm1hdHNfbGVuOw0KPiAgDQo+ICBib29sIG10a19vdmxf
aXNfMTBiaXRfcmdiKHVuc2lnbmVkIGludCBmbXQpOw0KPiArYm9vbCBtdGtfb3ZsX2lzX2lnbm9y
ZV9waXhlbF9hbHBoYShzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZSwgdW5zaWduZWQgaW50
IGJsZW5kX21vZGUpOw0KPiAgdW5zaWduZWQgaW50IG10a19vdmxfZ2V0X2JsZW5kX21vZGUoc3Ry
dWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUsIHVuc2lnbmVkIGludCBibGVuZF9tb2Rlcyk7DQo+
ICB1bnNpZ25lZCBpbnQgbXRrX292bF9mbXRfY29udmVydCh1bnNpZ25lZCBpbnQgZm10LCB1bnNp
Z25lZCBpbnQgYmxlbmRfbW9kZSwNCj4gIAkJCQkgYm9vbCBmbXRfcmdiNTY1X2lzXzAsIGJvb2wg
Y29sb3JfY29udmVydCwNCg0K

