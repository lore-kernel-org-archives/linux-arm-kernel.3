Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6E1C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mgujt1+i8jZP3+8iFA9oTHgY16sT0MQwSU9CTv8xuu8=; b=arzhgCguLWDoBph57XhcgRyAAD
	iBGlTc41dj8AWJHfvDnzDBbrlCUv4IRSzIYahQsTwRnkw7XGlNZNoT3YeZQDQzVJemYxQ9jk3kSxK
	kImb2Zq9lbLhVhD8aXx2T6fq6hlnK7zBJSLqbr1AynCmrPBY1vIcHMbSTGU5cL8YCKWISXlTdNCCI
	pwZnmhNrFuC6FXrpWPg0OCyYYS4pDOO+EI0qzNKnTyxhMA0MNup2yeQ0sSkA7zPekHFKv9TM5vktL
	zcUuakKET3pmtTALt7qVdurAqAzk2EMXxmmEAiLe/CjMar8/CnBQHT4aceAWh7fge8Ck2bu+g/Gc2
	x4xIkn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubw5A-00000006wHI-1JiJ;
	Wed, 16 Jul 2025 06:57:36 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvmA-00000006uJW-2vTc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvXp5BgIrjn0CFOtxl/FemPzDbfNnGjHOJ00cQo2uZiCLfPdHsYmICRFCx+ef3KOQxlohT4U961AniUPFBrUFV0JUwpqrxiFDj4t2KVinb0lKd+7Sy+eUVEHEAFaFTC7FL/8AOvd/XvXY1WT9K2STiocJvlyFcGzFkgC0zKsbECIOttWL2CH1MxhGJQs+rSK4uDuglqqQGgOTiY0IT5BbhObk18iBMCZG+3IKF+gKGceekNKhSPIe67B2a7C8WRZX6BQdCoB7455j52xeQR/bB6hgWDKmpYVu0YrBRDPiWFkRHcSy9LrP0V0OHGpPVFQszEx+d+2994/lMC96rWKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgujt1+i8jZP3+8iFA9oTHgY16sT0MQwSU9CTv8xuu8=;
 b=GHlv97jbbAyNyJUcAKQ6NrvCXRMErYtcNGtaebziPsizsrwXasUW8XtQ+7HHqL/gkKI+aSRHDu6oYEa+k31QYlamoxLZqY+siJlOOi6VKTb4lrKKEFuTMwZYH0Lg3rwFp6km6umEmqqP9lVw6TFhm5BNPFg4vCQSnMkKAS3G3OHFG8/tu8OEeI2RRHm79ELeF7W2YCCjpjXTAONmHPcnENVS30eel6FN2OyLhIx/yPcJ3uqWEtaYf9GTl1QA3tNxIxS9osgEnSd/AurM8nCeG2k/FCDecCukd7IfyPGS4dhFemdd1nMaw5ePCPrAWh4XpRhGu8wBvOMEgQWkFZMWkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgujt1+i8jZP3+8iFA9oTHgY16sT0MQwSU9CTv8xuu8=;
 b=feJtp2f+/7qpEshBMLjCVW4jL7fhRAE1wS+AZVz71M+Z/FUPHxRG83Q/g8/EdbFh1OntBWqcLyRor52+Ew9YT4/cnQcgH1HtXNUKjM9y97Az27ZpeKzN0ImV7EC2T3jfKnDTJrORNtFXpAR0o9TVFXnkmmaYKBUrUe+3/w8HAYj1i83+R3sEHmmiQygutp+Jkt/o51Ax2Y/qhZmfJ/jaPNUT0NOxygeOioxKNsfo9VXephdv/tyJuQiQpvqMQjgXlhju1wh3pkaFfTy/vlm4q/jxAPpTR5uUNj5b3YurkFhD8fqTVjYI28Pf8ZPAs93QsW9x25u7K0U2J0mR6/jv9A==
Received: from AS8PR10MB6993.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a4::10)
 by VE1PR10MB3805.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 06:37:48 +0000
Received: from AS8PR10MB6993.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::380b:e782:af48:75d4]) by AS8PR10MB6993.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::380b:e782:af48:75d4%5]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 06:37:48 +0000
From: "Li, Hua Qian" <HuaQian.Li@siemens.com>
To: "s-vadapalli@ti.com" <s-vadapalli@ti.com>, "krzk@kernel.org"
	<krzk@kernel.org>
CC: "ssantosh@kernel.org" <ssantosh@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "kw@linux.com" <kw@linux.com>, "kristo@kernel.org"
	<kristo@kernel.org>, "Kiszka, Jan" <jan.kiszka@siemens.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "Su, Bao Cheng" <baocheng.su@siemens.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "nm@ti.com" <nm@ti.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "Lopes Ivo, Diogo Miguel" <diogo.ivo@siemens.com>
Subject: Re: [PATCH v9 0/8] soc: ti: Add and use PVU on K3-AM65 for DMA
 isolation
Thread-Topic: [PATCH v9 0/8] soc: ti: Add and use PVU on K3-AM65 for DMA
 isolation
Thread-Index: AQHb9hAFJ5NEbeQ83EGiVyWxtmNDVLQ0QmiAgAAJvIA=
Date: Wed, 16 Jul 2025 06:37:48 +0000
Message-ID: <96ab9e8603f2cbee6310d282ecb5ef4df38bb94c.camel@siemens.com>
References: <e21c6ead-2bcb-422b-a1b9-eb9dd63b7dc7@ti.com>
	 <20250716051035.170988-1-huaqian.li@siemens.com>
	 <60e2cfad-e6f9-4f87-8a07-a986b6647a57@kernel.org>
In-Reply-To: <60e2cfad-e6f9-4f87-8a07-a986b6647a57@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6993:EE_|VE1PR10MB3805:EE_
x-ms-office365-filtering-correlation-id: 264311c7-3900-4b69-ecc2-08ddc43347ce
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFI5dkdpK3VDeHpkN05rNnZMcWMzU1JUdGVkRTJURVQ0QlQ2Q05mSFJYbFpS?=
 =?utf-8?B?YXB1V1RMN3JXUC9XK3lGbnZ0S05RWHM3ZHhuQVlkeUJiTzROUmlTL2NzVVlU?=
 =?utf-8?B?S0k1Zk5sazMwM29nWkI4QVp6REVXYmE3cFF2V1pzdHNRVGJLdDN0aUlYQ3Va?=
 =?utf-8?B?VlEzZURiUmdWK0JqMXdQRmV1SGlHMGV4VFJYZFl3Wkw5Zy9hbFJjRGJaRDBP?=
 =?utf-8?B?K1UvaEF4WUxwbDRsQTRjd1lBam5FcEs0NzNXSHZpOSsyc2M4dkpQN2VJODlP?=
 =?utf-8?B?Z1pSclBYSU53SUNyNWFkQlg0RDdGNHdiNUtmQzUrT1AxdXVEWTNEUkhTRUhk?=
 =?utf-8?B?QndkQXNwZFNuaDlNMTVOT1h6TUdVbVF5eG5HQzhZS1VELy81d0Nka0VPQnlD?=
 =?utf-8?B?bHg0MGl4ZkJ0Wnh2VndYTTh6eVBlYVhycHpvbXY0QW9QcWU1WHFhUTM5RVU3?=
 =?utf-8?B?SDMvdlp6STVOUUptSnoyWG1CQ1duTWtsbG9qamEydU8vTEFrQUw3T3B2T2JC?=
 =?utf-8?B?VWROaFhMbFo4OUpvYkdXaXdKdGQxWmc1ZWJMT0NyeTlWay8weDFZemJHNURl?=
 =?utf-8?B?NEpSdXR4RG8zM3d0NGZrUWFOaGk3Vk5pL0R0Z0QwTVJvUnZiMXdoaWNBc3FW?=
 =?utf-8?B?QUNXay9GR2xickFjYk9CRTdDcTNvemhsOUR0VUpaTGo2QnVOZ25wdjVvVDdJ?=
 =?utf-8?B?M1FxdnFZMEVhVUlGeFUyb2IzMEczcWtwMjl1eGkyT2txamNLUkIyWkVRU3Jn?=
 =?utf-8?B?UzFOOC9KQ3NzNzNscTNidXRDR2sxQUJTVHlPeDRZbFYwcTJmRzRlREFSVm5i?=
 =?utf-8?B?Yzd1SnFtQ1JWSDdiemNUcUN4UDFqK0Y1S0o0SW1tK093eC9PVk4xdHZ5UGsy?=
 =?utf-8?B?WGNJMTRKY2tqL1lYYU5mSjRXeUM3bHBXcDIvblBEY283Y1BVbmZodGxRWG5n?=
 =?utf-8?B?c0s3alZEaFl4UUZYT25RNzdTeEt2TWY1QUgrQytxU29Hd1V5TlpjWnhDMlEr?=
 =?utf-8?B?KzczSHFZUkxOTnl1WllhYnNFdXFjbkdlSzM1RGFzaEFSV1VHUzBFeXBrbEhl?=
 =?utf-8?B?MmVySFNWV0pMQzlXSW5ydmhvNGp5NitwUXhYQkZSclNPaEtCRDVmOU5XeVpn?=
 =?utf-8?B?UTBVUm9LRDVmeThwb3h3WHVYMGlRTjltSGNKU3VkTkRhc2tEcEc5UFVrQ3hm?=
 =?utf-8?B?RldBalZsM1gyRHpqa1NiQ21SVHdwSkoxbW8zL25RTFdCeFhSUW1QR0ltSWFG?=
 =?utf-8?B?OTdEUlNYNE1DVWp4R3VsSy94WVAyREU0aVlJRVNtZUhWSzNZQkZNdHZzVUxx?=
 =?utf-8?B?TTNwNVl0Ui9PK1Ntd2NlVURhZHFxeW5xeFk2SGk2RlNlVXY1Y2VEeE5nVyt5?=
 =?utf-8?B?TlpEejZ2VW9WQllVL21aUE5sUkpkdm5lYkRLWjB0ZHc0cmZZSzFabFpGRnRv?=
 =?utf-8?B?eG9ZRGxrVUlFNHhPc3NmWnRtYzVtUFg2MzdndzAzbExqRGdpYUhrUVVzTzB5?=
 =?utf-8?B?RXJyNWt3VDZ0NXhvNmNVZUIzdkZacXU1MjBiWE1GRTFPeTZIelRNQUlkRzRU?=
 =?utf-8?B?RmZUNlBSejRnOWZRNDhqTUZ2NmRXNDVEbWRGK1VXaHpDcWh4aWF6ZWFUajJ6?=
 =?utf-8?B?d1VFT3ExRmkyV0d5YXU2Z3BLamNWTmMxVzF1SDAySU90K2UwZ2NHV1h2LzB1?=
 =?utf-8?B?RUhTNmZyeWJKWjZ0QlRscjBNZU1CSy9zTzJRVjcrSFlxZnFWL0l0SGI4MGJM?=
 =?utf-8?B?dVltNks3TnJrc0dVRkczNk5tS0dJSEJpdUgwMkNxb3NTMlBnMlNSZVFPQjRt?=
 =?utf-8?B?dFdhTEpWSjJHN0hKblF1RklUQ0pxc3EzTldJMWluWmNFVER0UDZoYVNHRjJU?=
 =?utf-8?B?ZTEwdnFGMVRsV1FhUk5mQ2ZLNXVNdFlUaGlyNXc4RHVRZzIrWUovV1dRUUZl?=
 =?utf-8?Q?vnpe094AlSE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6993.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjM2ZGc3dHAxZzUxU0NOWkFYSjVpelNGdUlCVDFvVVhRbjJlcWZPVnMrZzRo?=
 =?utf-8?B?Z1Aram8zRlo0OFJ1TFRTVzVDK3VjRGQxVXMwQ1V4dnpHSSt0Z25YZThyS2ox?=
 =?utf-8?B?KzBpNW90bGUzb2ovSU14NHpwN1ZiK0lXQ0xSOXNyNDdkSnhwc0ZjdEdTU0VJ?=
 =?utf-8?B?ejhkaTQxUFBwSnJGb1A3L3QrNTdWN1FLYzVhK1gvQzlUZEEwQ3d3UHg0N2NQ?=
 =?utf-8?B?UkZJWndhOEVHRDJhWjlGNjVFYTVYUnl4c2tYK2Mvc3FVWTVQNHFsTDVvOTJG?=
 =?utf-8?B?c1ExOHB1bys1bDV0MnQwWlFabFhQdmtXRnhybXp4K295ZkZORnNWSVpvdElS?=
 =?utf-8?B?b09rbGtOdU8wRFBpbXZBZDNISk44eCtZaTM0b1VKTTFnQ3p2Nm4vejhDNk9Z?=
 =?utf-8?B?Y2pUZGJ2WE5tM2Y2b0tFeXUwY1d4MFFTN042SW1OS2ZEZ01mczQ4a0tuR2FV?=
 =?utf-8?B?NmUwVi9LaHdWNmwrdmEzY3g4NkhNS2dUbFF5Mk9McXE5OWhIUjA1UURvM3dY?=
 =?utf-8?B?UzdqN2Q2a3FKSXMzSWcwZGtQa0NrMkVvTTY2U0N4UGV4c1dSeWtrTkJmekEw?=
 =?utf-8?B?Y1NCOGJJQUpoUXAzSE93R0FTcDJrV21USTk3aXBmZ1BIekgxRnBWZjF2WWVs?=
 =?utf-8?B?eWtwTG96em45RkRnc0RoUURINjYvME1XUS9vZDZvRWZNRU1nWWFwUCtOMGY1?=
 =?utf-8?B?aHEvaHl2aEErait0Rmc4dzRrNFdVL0RrTGZoMHVyeFpWLzRqeGg5RWtQK3pu?=
 =?utf-8?B?NUpDdFhNUTRRT0xweFdDRXVUbEswbVdzVnQ1TWFOR3dtYURZWlVxY3c0eGwx?=
 =?utf-8?B?MUdscFBYZWxIUzdLOStKazZZTUR6aVNwMGcvN1gvOFdOQTRpTUZHUDZrNEh0?=
 =?utf-8?B?UGFLSXdmSXRVSnBEOHJ5NWNsNXg3SzFHSnh0ZjdrVEt1Y2s3dVFYUDhRRlpm?=
 =?utf-8?B?ZWVJaHRrWkNNVVNDL2swQlFzWFFxOW50WWVKbGIxR1Z5RU9CNlg1TEYwc3du?=
 =?utf-8?B?SzFKVXNhZ3JNckZiaVd3ZWkweVMvZmJjUjV5bHA0Ukxtd2UzclVHOVJ6c0oy?=
 =?utf-8?B?TWdCOVBSdk9MRlJtd1BndmpwVjk0RUdYRkNZdVU2RWpHWVMyUy9OSkxQbjB1?=
 =?utf-8?B?U2FFb3l2VUVNTlF5S0Q3bVZiNnYzcDZlcGhFUzBrd1pGQ0Izc3QrTUdYNUI1?=
 =?utf-8?B?WmEvTHVDUlhOajkrRFpWcWRZRThGNFhEMmdDOUtJbkRkK0k5YkR6T09DenR3?=
 =?utf-8?B?U2crMDZBZlI4dkR6MHJxQm1hQ1p4OFpnN1diTy8xTm4yUE9tYm1oNXE1ZzVU?=
 =?utf-8?B?SlhlYktRdjF2N0Z1UjRzb29NRkkzdXFOMXc4eFRnYkNOWnhma251cURLMExu?=
 =?utf-8?B?U2crYWx6eUJmTXVqSS95QXdaL0pQVjBJeDd5WWtscFBnSVhqc1VKVVYram5T?=
 =?utf-8?B?ZjN1Y3JxQlVMYVhPbXFIbTkySG5DSkFnV0daN3lQNWs0ZWRnbnV5UThDZkVl?=
 =?utf-8?B?YTBMQ3MxSVhyeHV1MGlieUNxTlpERUcxZ0JpdEd3RWZkUkgweTlZMnVUeTNy?=
 =?utf-8?B?bXZ1enFaeUVoQldhNDRSb3Q4M0RSclNHcXBZVFNrT0NHWGJDQVRqUTd2R28v?=
 =?utf-8?B?enJHVFFQYmR1Q3lPeHdZMm1xQ0lPcmhpaXBUdTdVUGR4STgrellpNWxodVFv?=
 =?utf-8?B?S2c4QTJNR3JuZ3psTWlxRWdab2s1T3pOVUtxbmd3cnJxSy9vRUc3b3prZWR6?=
 =?utf-8?B?UFJacE5GeWZRdFBHM2pZS1JxcXZtR0tIMkVvcXB3cWYrc21ycnFRaUZDd1Yw?=
 =?utf-8?B?Qkc2bHgwdHJ5bnVVaFdEL2drY0djMXRpY3lXWWs0V3JKc2pRWWVzYkxOK3Ja?=
 =?utf-8?B?dmtSbzBXSUNYNm1oSG9xSkZ0bzdvdEJObEdaM2VCOTduR2dpRnkxUlNGNG5Z?=
 =?utf-8?B?Y05keVRMVWV2NFd5TTArdWNxS2o5cDZVOHJiWFJtZkNFOXBPVnRjZ1dHVjZu?=
 =?utf-8?B?bjlSRGJJL3Y0VGlWcE9KOW9BNWJKalU3QUpzaXhwOXFNaUErV2FzQlJuUlFp?=
 =?utf-8?B?Z2lTZVd5VU5EUHZheDR6SEg3K0F3SnN0MkVVbUwwSVh6eWZFaVU4eW1sSm56?=
 =?utf-8?B?SURxZHAzbW44bFRzY2hGbytjcU54eGdkRDNhbXdHakdPZEZoN1E0YnN5ZnE1?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <156CF6EF41E0504B90C29140204EE7BD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6993.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 264311c7-3900-4b69-ecc2-08ddc43347ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 06:37:48.3021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ed9gKRvkxOmYxO0IW9VoSGKMf/J6l+2Kq8pNkDDplkWkO/ONxCk/l244QBkL6LHZZKjSSjwSbefgC+v7zkE5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_233758_742572_A21782C7 
X-CRM114-Status: GOOD (  15.58  )
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

T24gV2VkLCAyMDI1LTA3LTE2IGF0IDA4OjAyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxNi8wNy8yMDI1IDA3OjEwLCBodWFxaWFuLmxpQHNpZW1lbnMuY29tIHdyb3Rl
Og0KPiA+IEZyb206IExpIEh1YSBRaWFuIDxodWFxaWFuLmxpQHNpZW1lbnMuY29tPg0KPiA+DQo+
ID4gQ2hhbmdlcyBpbiB2ODoNCj4gPiAgLSByZW1vdmUgcGF0Y2ggOCBmcm9tIHRoaXMgc2VyaWVz
IHRvIHNpbXBsaWZ5IHRoZSBwYXRjaHNldA0KPiA+ICAtIGZpeCBkdF9iaW5kaW5nc19jaGVjayB3
YXJuaW5ncyAocGF0Y2ggMiksICdtZW1vcnktcmVnaW9uJyBtdXN0DQo+ID4gICAgbm90IGJlIGEg
cmVxdWlyZWQgcHJvcGVydHkNCj4gPg0KPg0KPiBZb3Uga2VlcCBhdHRhY2hpbmcgdGhpcyB0byBv
dGhlciB0aHJlYWQgY3JlYXRpbmcgdGhpcyBtb25zdHJvc2l0eToNCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwNDIyMDYxNDA2LjExMjUzOS0yLWh1YXFpYW4ubGlAc2llbWVucy5j
b20vDQo+DQo+IERvbid0LiBFYWNoIHBhdGNoc2V0IGlzIGVhY2ggb3duIHRocmVhZC4NCj4NCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCkhpIEtyenlzenRvZiwNCg0KVGhhbmsgeW91IGZv
ciBwb2ludGluZyBvdXQgdGhpcyBpc3N1ZS4gSSBhcG9sb2dpemUgZm9yIHRoZSB0aHJlYWRpbmcN
CmNvbmZ1c2lvbi4gSSBtaXN0YWtlbmx5IHVzZWQgYW4gaW5jb3JyZWN0IC0taW4tcmVwbHktdG8g
cGFyYW1ldGVyIHdoZW4NCmNvcHlpbmcgZ2l0IHNlbmQtZW1haWwgY29tbWFuZCBhbmQgc2VuZGlu
ZyB0aGUgcGF0Y2ggc2VyaWVzLCB3aGljaA0KY2F1c2VkIGl0IHRvIGJlIHRocmVhZGVkIHdpdGgg
dGhlIHByZXZpb3VzIHNlcmllcyBpbnN0ZWFkIG9mIHN0YXJ0aW5nIGENCm5ldyB0aHJlYWQuDQoN
CkknbGwgZW5zdXJlIGZ1dHVyZSBwYXRjaCBzZXJpZXMgYXJlIHNlbnQgYXMgaW5kZXBlbmRlbnQg
dGhyZWFkcyB3aXRob3V0DQphbnkgLS1pbi1yZXBseS10byByZWZlcmVuY2UgdG8gYXZvaWQgdGhp
cyBwcm9ibGVtLg0KDQpUaGFua3MgYWdhaW4uDQoNCldpdGggQmVzdCBSZWdhcmRzLA0KDQotLQ0K
SHVhIFFpYW4gTGkNClNpZW1lbnMgQUcNCmh0dHA6Ly93d3cuc2llbWVucy5jb20vDQo=

