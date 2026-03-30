Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D529B1061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnxRG69fTKxLidfRKjQRdRF5vIUXpDVM0Lj4Moddq6A=; b=pr2XF1BQpU4V4loP2ZkEzEOKr6
	wy589LMUP1HSX84t/oxupzzWS4QkzmmU0bt1K1aAgUNVXHzyV3grnL26F3tHTwGv/24sHYPaQ550G
	XpEKKrO/E1evBrbm4iTK3uBqZ0B57ohbOXDLOzZON+CdkJqM90ekLi2kXSIknue/zJ325EkDdXayq
	NEVXCx9v/MP1YAYkISm2UshnxMNDUxJaAbaa/fcX9pANMSxUNIdlCy+ruJ6/U7XYtT6N1kcbSYTV3
	DzhfpEXcUavUhFxLTKLJ6vQmu09792KWEGfNDqk7lzO7U6G4pR/ge9t6sVWhHXwrmWKLHpnES8S1n
	QYHIhRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E06-0000000BWJt-1z3Q;
	Mon, 30 Mar 2026 14:53:58 +0000
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dzx-0000000BWGw-3BsJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:53:56 +0000
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAYwrV2306706;
	Mon, 30 Mar 2026 14:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=wn
	xRG69fTKxLidfRKjQRdRF5vIUXpDVM0Lj4Moddq6A=; b=DlGDf0LegMusfeWgCJ
	HJLvuzAXu6JxEsxL56rk8lXqDF/+NKWKqvNQfSiA1XFViDDxRBtmWjUOdmfbJuNY
	+bUDZOn46Ytt3La3K+T9K83nT2hpx5tJo9Q3dtAjArsvD1zUOAgX0RZHn8Jsanjl
	tItSGQQiypc/yLWF9d2/SyNjx00bdq/hGYvO7Cxjf6LgYpxxVVcjCjFDO4l8JDC5
	y5BcVDM8f8/rhqUCoN8UDj9lMdrtcgvGOhYCtt7UQMDwDFvG/ZmeIKvLwj+tpunr
	DLymQS1ynOmzFtubm1/uhP3/3vLhkKhc/FTulwMK1Hl/Ghp/VMq8JmeMKZa/XtBq
	9n9Q==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d7qj2jynv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 14:53:30 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 7463F24C;
	Mon, 30 Mar 2026 14:53:29 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 30 Mar 2026 02:53:18 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 30 Mar 2026 02:53:18 -1200
Received: from BN1PR07CU003.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 02:53:18 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwxP2JUbkXSEeBAk2FfbtmOM13d/xyF5YDfGK5+tFL1RMBxU8ZZp9ALhZoI7yUrhR5xR2DPlVCHrhXA7otqSwAHMAI3yz2CPJsiKEmUfq9jjyeMbE5AOgVxlQGvwu0hTs4/S/3Yt25QiJdTro90ovY+7k8eHh5bjIG+cV29ETrkUPGV0fYs0TqhGLV6fJEHrWDFtAiFa/bow8NoDxF6BZOcZiXcrwXL1QMskNY1L4m2k7VLEF67kp15XDeAd8MmwTSPLCiJwpEm1hv7tToDYGU2ci6yntFHLZpgnZLO8HP8bSF6kDldPtodbiZ++C9QHzMWfFkxn3eNIP2t3NhM45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnxRG69fTKxLidfRKjQRdRF5vIUXpDVM0Lj4Moddq6A=;
 b=BiFzGkFy2xMcVDr23axq8L4zH+9vKzSEowImQ8Q+v0xB/FJFZKHBykgweeOyo2Zz/VtipeqfJefGNjqkax6DyfFvSRuyAqFnxqXDnOAybOCELAuIE3puk0bPh4xiYHxPkBeXAQBP9jbHj20xxjgb4B7+qEmejFyEZW9XeAdIfNluN3jyd+q655n4SJW3avJ6vZej2+ERhnZd3RHmHfzvTNcbHETxPXtbYblcSwVa5CK3ZEuCE0CCKeRJlL9mbvaTkgBPdS5kUI1pZIPtX7uBboo+fxC9jNVwy8Ha8lfGzOlK5dkkXEsZj+4afPMum1NGNH2cDtFNviXfJ7NdZXbq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 DS2PR84MB3997.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:2ad::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Mon, 30 Mar 2026 14:53:16 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::a85b:624:a74f:e211]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::a85b:624:a74f:e211%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:53:16 +0000
From: "Hawkins, Nick" <nick.hawkins@hpe.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org"
	<will@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
Thread-Topic: [PATCH v3 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
Thread-Index: AQHcvhGAKC44M00pYk+D5E+7BJ0ZlLXD+koAgAMxqXA=
Date: Mon, 30 Mar 2026 14:53:16 +0000
Message-ID: <DM4PR84MB192724F4949F614E3965E60A8852A@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-2-nick.hawkins@hpe.com>
 <20260328-chirpy-sturdy-emu-9eb0cb@quoll>
In-Reply-To: <20260328-chirpy-sturdy-emu-9eb0cb@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|DS2PR84MB3997:EE_
x-ms-office365-filtering-correlation-id: 585a03c5-c699-4282-08c4-08de8e6c1334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: WAlBSMseF41lI3BUSMH0WjQA8nhzPi2WUvBeTL9ywtP7+e+bBnhQchD/rCuxlEAZ1T6IaRV7GRJ3TCb/Djk0vxwM+0LCZ1xQLB9jbbCuWYaLXuncLzh+7ulSjGP7HgvyCzsHs5QrO21xH9IIzIGALXp144BCxUEK0L6sTLJClExDMkbVSKKbn5cewrF49E5S7QmAWhme9pDPaRRn+lbAlQWEK249JsKlXnXE/f/8AX+9Assl7kNHUD6cENJBxdsFVKQXpy+7Bmx/b5HH85XBUke9hU9RzFz1suSx6l/kwIHw+6nEifObt8c0SDcPhF7AQrV6LkNIDjPBZdkgutkiiz2szhF1qEy2s5Mno93b1PoDfxjzJWEyuDRA1v2lsAqmd0UcDdDHOD0duNgNvMyx9eZaN9nwWY0vx6zfYSEdIhEwb/m2jLdxLXq7zfFkYbQHzLGpBJkJav96HrNz4VCMkzyTuvg938qTDt7pvI/RRPLIi+zmlZvbJQ5R/eI2lO5E8huc0IkmyjktMfOUjfkun04oAZr0MCejF13p4gzJ678MoLBJrORn4PDGM5C6Wvr7v5xUSmQizXbxw6H3OUiNT490sXuEPWptgiD6V32hMonv5y9sX9+6+zjGuScroF1evRV3v9eQ8uoekDoTSbMCKcxQIULTSM3h/+w6VeDsBPAYGxuhULMhJxWA+xZGD+3BefOJdHcGxe8P+yIml3K/FhAupKEB5k8X6fS8SPtChOLlZa3Ypt9JP0H+4lXgHodgV14IH73kBolQMlFnPh40MaTaimbniI2UQsDihedyrgU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU5aYlZPN3phT1dML1lpcThoSnNNMnlhUWsycks0ZXZDNmNIUEwwNG0zb3ZK?=
 =?utf-8?B?blNBM3FweTRoZ0NnWmRiZjhkYWVQdjdsZjBhREZ4TVlwOCs0bW1vNm84Tmgv?=
 =?utf-8?B?ZFArUFpZYzdLa2xpUFJqditLRjBNMlhUYnNlT2Ivb0VKVU5sbThMMG9GZmlE?=
 =?utf-8?B?c1pPK3JpRWtlNmtyZDYwK3Nva0N3WWpyc3RreFR4aXdMNWhySi9nQUxrc0VV?=
 =?utf-8?B?RkNIMWtKNnRONzgzOTJUUnc5MkxvTjR1U1JXRjZNYnZ3K3poalNkd0FKMjBP?=
 =?utf-8?B?cWViYnpFU3dUZEo3ZUVVbEZxcUhyYXZQdDdNcDgwb0N6YmF4Tms4YU5zVEJy?=
 =?utf-8?B?cTlnMStZUzRGOCt3dmM1dnBydEozb00rNGIvTkZkcHpsblBXYURxc0J0M1VS?=
 =?utf-8?B?NWhjQlh2cWw0c0RrRU4wdlhWZ1liKzVkLzBsQkZrcDJRQWo3VnNZT2lDRmRE?=
 =?utf-8?B?Nk8zeXAvdXpLb1FhZEtBMHA1ZEp2aHBVMUJsdndsamZ2NUp1NHRsS0w1V0kw?=
 =?utf-8?B?WEorUUtkaHE0MWJReU5JVGJGWDVjWlFtOUVQNitoLyt5VGpOMk1UWEZrTEpo?=
 =?utf-8?B?UU9vUkZxaXpQcy8reVlZZXJWOCsvcS9ZVmYwNnBMaUdqRjZxUHdYTHBoWUhO?=
 =?utf-8?B?WEtiM3Vtam1HSHMybklZMm5kZlIwWS95RnRrQ3ZnNUQvZzJyY2NoK3RoS21I?=
 =?utf-8?B?YlBvbmZ2SXJrRCtKVldDTHlQTTdQdEhkOU5qVjRVNjRLcXp5V3dTZGJxQU42?=
 =?utf-8?B?TWMwVjVhVlI4VTNhekhMQ09FMmROMXFFdWM2b0xDZmtmc3RmTVJrOWc2ME94?=
 =?utf-8?B?a1gxejFDcTBHQ2ZsM0JoNVpRVExrMkhYdnlkbHg1Z1A0SjI5bXlwYnVrWG1F?=
 =?utf-8?B?QlVhWnVQdkRSdHRZdWRwRFJaY2h3Mm9zOC9JVTJLOHE2NUZBY2hHTlc0K1Yw?=
 =?utf-8?B?UGkrNWVaWVEzdzVJRGFhdTVPUW8xRDVNaEQ2Rk9uczJrWFpYZVpsV0VrYjNa?=
 =?utf-8?B?S2JBK3dEZ1E2aGtNY0x4cDlPMXZFd01USVR3SmVnQVV4YlRicTUxWk10ZFpU?=
 =?utf-8?B?aGREbVBTUm5nR2FRemVKb1Y0ZjE5VzN6YnRuY1cxUzBaOUQwNkJvQk9iT3ZV?=
 =?utf-8?B?VHpqTnREZ1I0YUFzV0t4YzhtM09iaGJndU0vNEFJMExQRG95WVh6UVUwTi9o?=
 =?utf-8?B?bTlOcE1QRUMxVm5VMjZJd0tRVEZzTnZxTkFyeFVUWk5kUnhZd1YyYXJqbXhG?=
 =?utf-8?B?Q2gvMVUrZkViRXlIU3dYY2hnQ1dpa3dYeEdGdU00ckVnUzZGdHdYTHBHTlhS?=
 =?utf-8?B?S3I0OEs2SmlSWk03VkN3M205NVRvdDI5YzN3RU1wVnVMMFV0bzJkekRnSTZt?=
 =?utf-8?B?Znl6TGZ4TFovT29yVjZJL3dOUjhUWmNBN2k0bHpDSVlTaDVZUjdmaWpodnVU?=
 =?utf-8?B?MjZqRGR6S3pvNFhDdU9ST0pvZ2o1b3cyMGdpSjFPc1J0QkdiR001cFZDUkVj?=
 =?utf-8?B?Vi9JTHNRRWQvVW00SlZING1WS1phWUYvWVZtZDljN09ZUWlIZTYyTUZqSHRK?=
 =?utf-8?B?cy9rNElraGZGeDBsaEN1dVAzcmR1SG9oQWNvekhLTmM1ZmppN3V1aHlQckZp?=
 =?utf-8?B?WnVUTjhuZHZOeUZmWEx3NGpRbmgrOGdjTkQzeEgyVVhTUjUrQ2JGQ1p1c0hp?=
 =?utf-8?B?RDdvV1M3MzBkUGNOc1N6Yk90L0crOTg0UWFkUllNcTlHYU9URTNIWDNvRjJ5?=
 =?utf-8?B?bVdnRlBacFJpR1U2enVtQ3dodkVJNkhuZ2luQjZXVGFuV2w2TmlzaXhQQm55?=
 =?utf-8?B?eEZna0RkZEl0L1ZrQnFOK3p2MWpYcmVYMlQrM29GNjV5aWdCOXlTQktkTkZP?=
 =?utf-8?B?d05GMVRhbEVyQkdKVU9sTk9CdVIwUmc2UFBhSGlPRzBuRm9FTWQ4VndUdFJC?=
 =?utf-8?B?T3hPMEszQlRiRW04VmY2TDZkUk42V0RuSnlpenhOb0FoL0ZZdzdQcHpBZTZY?=
 =?utf-8?B?S1ZUSGc2b1Avbml6dHpicEMxSFFrTVltK3NFTVNNckwwVE1iNTZZY1VXSUFw?=
 =?utf-8?B?T0doYXFsMGZXaGNRaUNuZGhwU0JmVm0vb2RJWnNHZW4ycTVOUytlT29mRHor?=
 =?utf-8?B?eFBEenc3b2lOdC8yMXNCYTBlRkZEdzlNaEtwSEhTbEZxWDltUisweXhpQlFP?=
 =?utf-8?B?R2FQQTZ0VjNUc0xLQnBCWjNXT2NJMm1LRU9hRDF1UlpIOHpqZFZpblFMUWNl?=
 =?utf-8?B?SzRoVlFST0pseDlsbGpUWGJlMEtjTHlHMERPOGwwUWMyVEpqYmlBakxQaDB6?=
 =?utf-8?Q?6fQHaH78RJ/+mMON5b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: abdH0IUE0vcxJbxC+kmLFNtLiY8nDtZMDvy/ow20SVaGVQDzPMm38V0w83ANj4O+QyparJqub8oVAU2AVb2U8Yap8zQ8bVa+r3nrtNW3aPhKO6AF5fhP344pCcqHk7hrC4BZGu9BtRnFxOaSVYKzPYJESbmVJf6RqiZEPdZnPSuCziPQh0Vq7vpTpWTrTd3Hhex5BOwEFHCuNkK3TXosvck79MebwDgkFzwkA3ta4e5+HIK4PsmjCDD4I5d2yy4A2rlvOXuFBou8/C8KizQ4wO+tou71d7Ws+delkpQe6wBtQQEGNwkjYEHY8z+W8sMUNOQCXc4lMJ8HLFs9HUB0WQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 585a03c5-c699-4282-08c4-08de8e6c1334
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 14:53:16.2461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: buCjq5Y++NEvx3I0xQVZiArF+BtA8PUfRz0IUbxfgKJDMatgaxWJZnA4tBmc24QuwrvqZXMAzxZbf0hJbQ5EMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR84MB3997
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=69ca8e6a cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=RtSn8ETxjE2H05FtM2s8:22
 a=MvuuwTCpAAAA:8 a=f3VnoUzet_RabBBAIw8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6Q-LSscDqV7SI2YVlUQfdtjpSGzX5jr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExNiBTYWx0ZWRfX4k01iJnLSsZL
 I0EOm+5wBT6I3A2nw+z70rG5A7p5VzxXdaXFPQguB7bgmrIBTIxzm2ol+r6rbUnsacqv6KBjBqi
 3bPQxmXN/pjE/TyNqgEPhXMDEDB5mbRgOCM+TuOFo2HuefznpNGYSUQUm0/7bSGI/g1ZBHBA2Hv
 DOgIxyJ0KxVxoWzVRkLebOWG7TQt4RaiEybAs1uzB6L4xbBxBL7l21C3i2Fme4vQXDkO2a+XwgK
 RG1qDtPnnPvjyjNYjClBzuFFZAACkXomSsKv4eGH/mPTPKdYBVKOTTdzD8ZrSzUrxjgRRLyR+WN
 MAxn8yovbxmcYBBktxo0bYvKKWWzojRvt0HTpzBFsIYwTjcdprIFogGO2C3Sk4CcOXi4dfWksJH
 KlmTM5Rt9feZ9bJgNEhCPg04O0ECShy2pHS6bv5xVW7cPn+ElvTICp4s1hCGrovHl4ShjxUYw3X
 +hWHy4INYRhXYeiY/+Q==
X-Proofpoint-GUID: 6Q-LSscDqV7SI2YVlUQfdtjpSGzX5jr_
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075353_003419_C61A42AC 
X-CRM114-Status: GOOD (  16.69  )
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

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiA+ICBtYWludGFpbmVyczoNCj4gPiAgICAtIE5p
Y2sgSGF3a2lucyA8bmljay5oYXdraW5zQGhwZS5jb20+DQo+ID4gQEAgLTE4LDYgKzE4LDExIEBA
IHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAgICAgICAg
LSBocGUsZ3hwLWRsMzYwZ2VuMTANCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IGhwZSxneHANCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogR1NDIEJhc2VkIEJvYXJkcw0KPiA+ICsgICAgICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gaHBlLGdz
Yy1kbDM0MGdlbjEyDQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBocGUsZ3NjDQoNCj4gV2hhdCBz
b3J0IG9mIG9yZGVyaW5nIGFyZSB5b3UgZ29pbmcgdG8gdXNlIGluIHRoaXMgZmlsZT8gVXN1YWwg
Y2hvaWNlIGlzDQo+IHRoZSBmYWxsYmFjayBjb21wYXRpYmxlLCBidXQgSSBzZWUgeW91IGhhdmUg
Y2hvc2VuIHNvbWV0aGluZyBlbHNlLiBUaGF0DQo+IGlzIGZpbmUsIGp1c3Qga2VlcCB0aGF0IGVs
c2Ugc29ydGluZyBpbiB0aGUgZnV0dXJlIGluc3RlYWQgb2YgYWRkaW5nIHRvDQo+IHRoZSBlbmQu
DQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLCBqdXN0IHRvIGNvbmZpcm0gYXJlIHlvdSBs
b29raW5nIGZvciBtZQ0KdG8gZG8gc29tZXRoaW5nIGxpa2UgdGhpcz86DQoNCi0gZGVzY3JpcHRp
b246IEdTQyBCYXNlZCBCb2FyZHMNCiAgICAgICAgaXRlbXM6DQogICAgICAgICAgLSBlbnVtOg0K
ICAgICAgICAgICAgICAtIGhwZSxnc2MtZGwzNDBnZW4xMg0KICAgICAgICAgIC0gY29uc3Q6IGhw
ZSxnc2MNCi0gZGVzY3JpcHRpb246IEdYUCBCYXNlZCBCb2FyZHMNCiAgICAgICAgaXRlbXM6DQog
ICAgICAgICAgLSBlbnVtOg0KICAgICAgICAgICAgICAtIGhwZSxneHAtZGwzNjBnZW4xMA0KICAg
ICAgICAgIC0gY29uc3Q6IGhwZSxneHANCg0KVGhhdCB3YXkgd2UgaGF2ZSB0aGUgbmV3ZXN0IGZp
cnN0IGFuZCBnb2luZyBmb3J3YXJkIGlmIHRoZXJlIGlzDQpzb21ldGhpbmcgbmV3ZXIgd2UgYWRk
IGl0IHRvIHRoZSB0b3Agb2YgdGhlIGxpc3QgcmF0aGVyIHRoYW4NCnRoZSBib3R0b20/DQoNClRo
YW5rcywNCg0KLU5pY2sgSGF3a2lucw0K

