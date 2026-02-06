Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF70EB28C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 05:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMJV6Tz/25oBRfz2Nz7Q4/PE3MnV+Z8g0Zm4WzM9Jws=; b=rp8nmg+mCDreoJewaeCGDSdER9
	CPIHgbqd27c9WU7ZSDEbwOZ8nW6+w2+J2/mCqGVsYc2TVxCvLbYEIidA/ECAzHnCTGoZOgIEl3iUh
	F/hbvYHibZAHbizjySCzHBo1DRH4o/0V03P6ob8Ci6FAcZyl/r7smCNM5sQ0/F7Y9CTuK9QRoQ15K
	hQKTNQF8u0yJ1A4UOnnnwoWA/id/JaSfR7gh5toNtlOayyL/obFastxbDFobjGXLbzJ39xu65W0AE
	iFF4jUeXey3JLOaC+WUdb/LIGPlsHvWYOPfVU7DQo+VXPsf2KGQnTNNeal7bRP7jHwom3rEJF4iCK
	yKzi9KOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEbl-0000000AuI9-1LOk;
	Fri, 06 Feb 2026 05:42:21 +0000
Received: from mail-japanwestazon11022090.outbound.protection.outlook.com ([40.107.75.90] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEbg-0000000AuHJ-0TTm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 05:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq5PylFfbKdtEx8/73Az7YrK9ZtdtATewxhdmgcy8KD9Gv3dYzyEhyQKoYTb8mb+PJroChrP4dJd7kzd+KdfD18FW/ZvKfjmsTAI3xe+XPBoa/XBvT+6ax5iJ9+uq+rhXIUVvhyRPKgP99v39KF8J5H+oEx9ERlyJgv1ZM+evpalh0e/7xPFlMM3yB9ytg8VFvzIVSurkvp45jZxxUClArcOy5rkqUFfVqalb8qxF+uvkdqifVMelgBONVnoh4Rt4+V+wiTiq9AoVLeelRLkQLhKP8NeaXoaPnJqnP/pUNVl+g/V5lxjN4FZDG+Mnkbf3yA1rb9F1gfq7Ba+JgVDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMJV6Tz/25oBRfz2Nz7Q4/PE3MnV+Z8g0Zm4WzM9Jws=;
 b=WXwa3umFgnEBRyRcP0E7I+ZHNABiUD2gsZFYvY5AHmv/XKuWrPvfSwqKt9nGLpTlWo0DyDwOtTm9zU1SL1I/KnNZR+PExxDwz8ypCG+SUutjT0Iq1Vj/ncinq6ZQjT0JGgF9xxXXiECJdXxewXuWMx40W3dN4KArBpGcF+Bwvr0V/PwhpPDseqGi4XVJPZkkft4rEqxZ6hr8wYq1MCaxs2kjprP0KaVrkNEW8FILN6cOunpKLwaFwPWUk6XobAekXvf2TV+SFeE7QQTQxLkT0dKJM2VTdAVBRHDiKpZZ1IaNmjrhcMRXbtmVtNqlFjPBYvQN3CkrFeAadjgaZ5eguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by TYZPR06MB5483.apcprd06.prod.outlook.com (2603:1096:400:288::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 05:42:03 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::f320:58f6:4dc6:b908%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 05:42:03 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Peter Chen
	<peter.chen@cixtech.com>, "unicorn_wang@outlook.com"
	<unicorn_wang@outlook.com>, "inochiama@gmail.com" <inochiama@gmail.com>,
	"alchark@gmail.com" <alchark@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2NyAxLzNdIGR0LWJpbmRpbmdzOiBz?=
 =?utf-8?B?b2M6IGNpeDogZG9jdW1lbnQgdGhlIHNpbXBsZS1tZmQgc3lzY29uIG9uIFNr?=
 =?utf-8?Q?y1_SoC?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjcgMS8zXSBkdC1iaW5kaW5nczogc29jOiBjaXg6?=
 =?utf-8?Q?_document_the_simple-mfd_syscon_on_Sky1_SoC?=
Thread-Index: AQHclXrrewrnwC3gtEqZNCvf3astaLVz1EwAgAAGp9CAAJ0TAIAAsp3w
Date: Fri, 6 Feb 2026 05:42:02 +0000
Message-ID: <PUZPR06MB5887AA9C68D11448A3125E58EF66A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
 <20260204020644.155094-2-gary.yang@cixtech.com>
 <20260205-noisy-fabulous-bumblebee-e0cb32@quoll>
 <TYUPR06MB587652FD43724BE26B15975DEF99A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <f8ac62ad-5b04-4148-aee6-cd401a2143cd@kernel.org>
In-Reply-To: <f8ac62ad-5b04-4148-aee6-cd401a2143cd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|TYZPR06MB5483:EE_
x-ms-office365-filtering-correlation-id: 87dac5ec-0d8d-492b-a72b-08de6542749e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UzI5dVU4aVFId0hjbTJlQllVL2VORzlWUTVuSkRJZCtKbzNrSkJwQlAyS2Jo?=
 =?utf-8?B?dDVBdktGa1BuVVlJNHhJS0l2L0d5RXk1U0VyWStJWTdvNUdBWDRFWEZyNW15?=
 =?utf-8?B?NkRXSXFvSGFjclQzMDduVnZuNktiaVZhbDQ0em1CYVluaDg0VW5JYitwN0dS?=
 =?utf-8?B?TWVxVTlKdEhDcmprU2RUQ2dnRCticjQzb3NSaVIwdWcxc056Wjk1WVhYK1ds?=
 =?utf-8?B?aXVvZ2hDaURnZTBTV2hSZU1DVnY5YWQvcWJCVVhORHJmTEtiVHBuV0M5bkJE?=
 =?utf-8?B?bFVYSmUrN05HZW1zcE4vRXNINHo4WHhwRHR4QkdqVS90eFNlUmJoQVBDR1k0?=
 =?utf-8?B?YUFSYk5kSXZlcklmU2NMUnIxbjFsa1RSVW1MTHdhWGluOCtMV002UmRwSDM0?=
 =?utf-8?B?NnRNbE5Sa0J6QWRWSUxZZ1FIc00vaVViY3dLOVhsc2MzUHdPU2RzTTkzemdH?=
 =?utf-8?B?UkRabG1xQmFmMVZ5Z1pzbmsrdGpKcFo1Z09ZN0RjbW9Gbjk3MGNGdlBmVjRk?=
 =?utf-8?B?Wm9JOGVCMzBwa3JBa3lDcm50Ly9laURaZmY3YVJaN1FkT2ZxWXJob3FGYmQ5?=
 =?utf-8?B?U0IxNDVVWi85VG1KR2dDNXdRcWwzb2RXVjZNOTlUbVJET0xYelB6c2xGbEJC?=
 =?utf-8?B?NXFLbEl3NUJHQkhROUVPVzVLem52Vi85SjRwMTIzRkVHb2JxZzF1ay9uMHFN?=
 =?utf-8?B?SkhTdnNrVCt3bUhta09RTW5MYmtIalpab1U3ODZMSWhpOCtKcndSYWtrSmpR?=
 =?utf-8?B?TEhoOEdUMXNYWFRJWVZjNkpiS1F3U0pUWWFUaFNKQlV3eEtPMHFFR1c1UlNz?=
 =?utf-8?B?WFFmZkI2cE5mRW5WWGM5OTVWbEVGUTFuOS9QZEFjTkdjT1YwVTFwdmE4SXFo?=
 =?utf-8?B?SmlOdkl4eEYyZGhnM2twLzl4cVkzenpjeE1tQTk3RWk5bUNPclQxOWIvUzIr?=
 =?utf-8?B?MDZQYnA5cERLRFZkSEVhTWZ6ZkpqVDhhUExxalludnJKU3Y5djBXdElYMDV4?=
 =?utf-8?B?YmxyOVNFczNYVFNqMks5QndxL0NxbkgxeEN0K2ZpSGVRWmMxZ3haK0xGNWQr?=
 =?utf-8?B?M0hEZE4wajVTekh6bm1hQzhucTFnODNlNW0rT2p0SlRqVGx0eHVielRBQjNs?=
 =?utf-8?B?TEhaRXZDMDE3N2ZVd3hsbWFQTGVwK2FjcDl2a2VMclRqNmY1VDBINHVLWmxN?=
 =?utf-8?B?TzRGQzJyODA5MGE1RjUzakhrd3NOTEs4RjhxOXJtSVM1S0dYOUFnaUcwOXhP?=
 =?utf-8?B?OHlLU0NRWjlUa005QnhCeTVSZ2RzWUMweUNYbjNSbUh2dndnR2hpVlRVVlYx?=
 =?utf-8?B?TEVjckRMUFZNUTk3WHJ2aDUvdy9pOGEwOVpmSzFXYkZIdllFY0U5bGJReHJG?=
 =?utf-8?B?TWswcGlyYWlXOGVDay9jb3hERVFFckViNzkrSGlNYW5COHd2MlQ0Y1BMaUFF?=
 =?utf-8?B?WmFwbUd4TGJWSFdHbEVUejdCR1dZR3cyQjRxY3pOLzFUVFdUaDRXTlpzd1kw?=
 =?utf-8?B?T2VjUm1sQytoa3ozdi9oMEdzMkNtemJYVVhtVzdqUnJZVnhkSjY1NldzVnRV?=
 =?utf-8?B?TytLcDdSWDBlWW5rSDFYMEhLdWJzZ0dNRElWRmp3b04zMm81SldXSGpWVE5F?=
 =?utf-8?B?UmV1bnVjMFBtUXNsTHlKemlMaEhhNHF6UU5tUFRaYytZSVUrcG0rNzJQNkNV?=
 =?utf-8?B?ckZISkRLckxWN282eDI3WVpDUFdubXdoMHdWNVhLRkZqY2VFTTlZN3hib2pJ?=
 =?utf-8?B?dHJXeVBHNTIrb3FpQ0lqWVlsSzREOVQyWkF4TjhZZ0dsT2hTUm52UnFWak1q?=
 =?utf-8?B?MisxNUNNYjZuZWk3S0dJclBQcW9PNkJhTER5WkpDZXlrQ3Q4TjJ3Z0hLQ1ln?=
 =?utf-8?B?TVdOeEpMaWxwTS9KZEc3NHJkRWN2dHRvSSt0aG1vRHBWTXhRTFNYRTJMWUpk?=
 =?utf-8?B?TXlhOHVpdEl1TTBMWmdZVGJETDNPVzcvcHhUVnk5b1lDKzlNS0ZLNkN0eTVm?=
 =?utf-8?B?NHZWWHU5MTBOTmdNU1J2NjVEVFUwOGExNE9VVGtzSktlQktKWnZSTTQrUmd6?=
 =?utf-8?B?OFFGU2hDVzlTMzJraFZiMXQ4bTk3Mk9lb1h4R2lVakM4RUJFTVdlbmNKRlhZ?=
 =?utf-8?B?VldpNHNyY09sZ2FLemQ1K1FTUGQ2V1d0TTV4azRpcEhjYWpGNnhUb2NDU2Jp?=
 =?utf-8?Q?c7Bm2zbyKOBolhZMRwvZUqBe1RwofbFkf+DVrwwUs3tv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHp0a3hsWVJzenVVaGdhUnJwMjc0OFpUMXdFNmpZUmpyc1pqOEhjMndwdmx4?=
 =?utf-8?B?ZEI2K0o5Y2E3bDR0UDN6b0ErMytFckF6R2N3Q2drRHJNRmxGaStwcUVEcVc0?=
 =?utf-8?B?ZzFveEczbHlLQVRaRDVBcTdqNEN4eFZLUm13UVZLSDh6bjNxRzFYZ2FUVEJx?=
 =?utf-8?B?M1VsdXUyMnBvTFhnQTgwajhjcXNwdS84alNHcDVPa3A1T01pNmZiWitZVWhh?=
 =?utf-8?B?ZkdIc0RMdWZyd0lxMjQrSXhWTWdrL1hzcS9Vai9pTWVwWUJEdXhtRnRwdVZL?=
 =?utf-8?B?QVE2WWF5Z3VieHJhOWlHNGhBOGM4L0c0N1pqajY3NXhkMlM3U080eU9QQ1E2?=
 =?utf-8?B?ZlR5eTF2dEJKMnMwQlVGZXY5ZFY1UnlXdzhMenh5eGpSQi9WUzkwTkNEMXNk?=
 =?utf-8?B?YVovdy90bUppSjVxSkVYOHpEbStvZzNhQy9CTDc4Y1RYdGNRbTZ2emNGTHdM?=
 =?utf-8?B?SVdOWTJBaHl0UmUyaTRwZDJKN0l2T1RtdXZGQW9kR3Q0SnJMaUdDWlk5dzA4?=
 =?utf-8?B?ZWxyMTE4eWhyRk9yblpoTXBKaWNrajNJeWNoZTAvMCs0Ri9YVmZUV2RUR3h5?=
 =?utf-8?B?MnBRWFZvcGQzT05Na0JSU050VmhRZzZxbjdKbkdiK0I1TDF1SC8rMzNsdFdI?=
 =?utf-8?B?endTajVlT1NOdVlBSms5b29zZE1hZVo3WFFpREVuOVpVQTFRWHZ1QzdBVFEv?=
 =?utf-8?B?SXg4NW44aVM4UTBxYWpwbDFIMW5VUG01TEJCT1lJQm8rdTJRYjBPSzZkcy9M?=
 =?utf-8?B?SGEreWlXb3FMTmpDbnRYTlZnbHcwZE0yM1JpWU91ZnN6dHJhaTd3am94cTBy?=
 =?utf-8?B?VlIrVVVMQTl3c2tIRXltSmtZSmE5RmNCN1llRStuVjZtdmJEdnY3aFJkekxx?=
 =?utf-8?B?SGdnbStYblFnY0VqQ3htczZmSjg3S1BXVjVraTNFcW0zNDR6RFZIVlNwdjFp?=
 =?utf-8?B?ZDBXZkkyWGtrMUNNSEh2TjdyM2NmTFRDTVhDaG5wWitCc3J4OUNtUW5SNzhN?=
 =?utf-8?B?c0JtUGJyeUt0cDVCR2pWekkvMGFiL0FZVzI0VGQrRWQzalVHZGhVNGloMW5u?=
 =?utf-8?B?K21SMXFmMlEvM3dmZDdDdnR6ZlR5c0twWHc0dVBrd3dtNlY0dWxCd29QZ3Rh?=
 =?utf-8?B?Tkp3TTBRRXhybTBxc3VPS2ZpL2JDQ2dQM0lIakhvbTdScnIvVXFBbkJ3cEFX?=
 =?utf-8?B?SGdMR3ZwelVTNkYzNUczdFJHdmpLYmRYT1JTRDY1djFZemk3MFRtdk43YTBJ?=
 =?utf-8?B?RjhNQmthdlQwaDZONzNnQnBzWjJnVlVSOXZvS3ArTVlZVThRY2ZNWlNPM1Vs?=
 =?utf-8?B?bVg5cFdpZmVjN0gzZ3k1djl1Z1RTTWo3anFYcmpYeTR5MnlHRDJPdUNWOGt5?=
 =?utf-8?B?NERtSm1KblF2S2J1KzM3OWlGZVpmb01lOFVJVk14dnZlR05RRW9wMkV4VnVQ?=
 =?utf-8?B?WFFLamV5OWVCQkNIWTc2K2Jta3h4dTNMZHNOREVVdkNKajUyT1NzR1dwRTdD?=
 =?utf-8?B?ME5CenRvUjFRNnMwK2JsZ0wyRi8rZXhlVm4wU08rbjA3MDlRNGJEL2pDSnFZ?=
 =?utf-8?B?TUorTEFHZ2ZIRjlBZWVKZjlGenBkbzJaNnE1dHRSMFZzQSs2d3Rsa1ZXeGpn?=
 =?utf-8?B?d1JwdytzRkNVTnNTRjFzTmk5SkNlaVpzamJwWGpCT1hjN3dVMWZrMktVRWdF?=
 =?utf-8?B?dHloOFBNejZkeUJzOEsyZ2xVLytOSlR1SHR0dlVjWFZtd1dvM0N6ZlA2K1hz?=
 =?utf-8?B?VDJISzROa2JKRzQyVXc2TVdOZHd5U3Z4OFZHdWhqYnFUVGlYZGhEak5QRU80?=
 =?utf-8?B?aUcwLytQMVR6UWtZZVZpQkxaOTFBdDJkYlBKdGYxZFQrbHRMeXJ0NUh5VWtM?=
 =?utf-8?B?U1R1U3J6NGg1Rkk4NlhmaXE5S3BoMFdDb2kwRE5uQmVKM1FMc0hsNFlkd1Vq?=
 =?utf-8?B?K1F4bXJFTVFKSzRmeUNQV2hWdU1vbDNlbjlhZ3dkZDNtSytJanJkY3dZU3RH?=
 =?utf-8?B?VWtnZEk2TCtFQUppVmxNZ2J6a0RZUnF3YWlQNDdJbFVrenNYOFBIYmJnclhR?=
 =?utf-8?B?dzE0Q2FNYTdSVUtCSVhxSVBwbE5pS2NhSWhuL2lCY1lMSnVYZTdMNWdnQ2Yy?=
 =?utf-8?B?aitOayt5N0o5MEJoTVo0OFRYQVJscEorVG1rMGc2OUNLVjNrNGJtS0JnNHBF?=
 =?utf-8?B?WDNYaldOTkNGQVlPSXRlaGJBSDMzKzZnRmxuY25hM3pJWklFZExNcHlta0tk?=
 =?utf-8?B?K3hKTnptYlVPeExXeXNZTmVhdGVMSWNHbjcrcmJURUNLRVB0YmZ4dmwzTE9Z?=
 =?utf-8?B?TFp4d2ZvZWltdVQzT0locHN4M3RKWlg1ZHlaL0czUUJHWEtRQnpVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dac5ec-0d8d-492b-a72b-08de6542749e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 05:42:03.1346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgP+Bk/gdmUg4ymxkBFEKghGwsGWIWSg9wpw6BoAmBwGpYXLsh/4fPBzDC5sZxWUheEo6R3EoxDYvIshX3pCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_214216_269995_66ACA7FC 
X-CRM114-Status: GOOD (  27.55  )
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

SGkgS3J6eXN6dG9mOg0KDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBPbiAwNS8wMi8yMDI2IDEx
OjM5LCBHYXJ5IFlhbmcgd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mOg0KPiA+DQo+ID4gSSdtIGds
YWQgdG8gc2VlIHlvdXIgY29tbWVudHMNCj4gPg0KPiA+PiBFWFRFUk5BTCBFTUFJTA0KPiA+Pg0K
PiA+PiBPbiBXZWQsIEZlYiAwNCwgMjAyNiBhdCAxMDowNjo0MkFNICswODAwLCBHYXJ5IFlhbmcg
d3JvdGU6DQo+ID4+PiBUaGVyZSBhcmUgdHdvIHN5c3RlbSBjb250cm9sIG9uIENpeCBza3kxIFNv
Yy4gT25lIGlzIGxvY2F0ZWQgaW4gUzANCj4gPj4+IGRvbWFpbiwgYW5kIHRoZSBvdGhlciBpcyBs
b2NhdGVkIGluIFMwIGFuZCBTNSBkb21haW4uIFRoZSBzeXN0ZW0NCj4gPj4+IGNvbnRyb2wgY29u
dGFpbnMgcmVzZXRzLCB1c2IgdHlwZUMgYW5kIG1vcmUuIEF0IHRoaXMgcG9pbnQsIG9ubHkgdGhl
DQo+ID4+PiByZXNldCBjb250cm9sbGVyIGNoaWxkIGlzIGRlc2NyaWJlZCBhcyB1c2IgdHlwZUMg
dXNlcyBpdCBieSBwaGFuZGxlLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEdhcnkgWWFu
ZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL3NvYy9jaXgv
Y2l4LHNreTEtc3lzdGVtLWNvbnRyb2wueWFtbCAgICAgIHwgIDQ5ICsrKysrKw0KPiA+Pj4gIGlu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LWZjaC5oICB8ICA0MiArKysrKw0K
PiA+Pj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtcnN0LmggICAgICB8IDE2
NA0KPiA+PiArKysrKysrKysrKysrKysrKysNCj4gPj4+ICAzIGZpbGVzIGNoYW5nZWQsIDI1NSBp
bnNlcnRpb25zKCspDQo+ID4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4+PiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvbC55
YQ0KPiA+Pj4gbWwgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0
L2NpeCxza3kxLXJzdC1mY2guaA0KPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXJzdC5oDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdA0K
PiA+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2NpeC9jaXgsc2t5
MS1zeXN0ZW0tY29udHJvbC4NCj4gPj4+IHlhDQo+ID4+PiBtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJvbC4N
Cj4gPj4+IHlhDQo+ID4+PiBtbA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNWZiNmI5N2MzYzAwDQo+ID4+PiAtLS0gL2Rldi9udWxsDQo+ID4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2NpeC9jaXgsc2t5
MS1zeXN0ZW0tY29udA0KPiA+Pj4gKysrIHJvDQo+ID4+PiArKysgbC55YW1sDQo+ID4+PiBAQCAt
MCwwICsxLDQ5IEBADQo+ID4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSAlWUFNTCAxLjINCj4gPj4+ICstLS0NCj4gPj4+ICskaWQ6DQo+
ID4+PiAraHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc29jL2NpeC9jaXgsc2t5MS1zeXN0
ZW0tY29udHJvbC55YW1sIw0KPiA+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+Pj4gKw0KPiA+Pj4gK3RpdGxlOiBDaXggU2t5MSBT
b0Mgc3lzdGVtIGNvbnRyb2wgcmVnaXN0ZXIgcmVnaW9uDQo+ID4+PiArDQo+ID4+PiArbWFpbnRh
aW5lcnM6DQo+ID4+PiArICAtIEdhcnkgWWFuZyA8Z2FyeS55YW5nQGNpeHRlY2guY29tPg0KPiA+
Pj4gKw0KPiA+Pj4gK2Rlc2NyaXB0aW9uOg0KPiA+Pj4gKyAgQW4gd2lkZSBhc3NvcnRtZW50IG9m
IHJlZ2lzdGVycyBvZiB0aGUgc3lzdGVtIGNvbnRyb2xsZXIgb24gU2t5MQ0KPiA+Pj4gK1NvQywN
Cj4gPj4+ICsgIGluY2x1ZGluZyByZXNldHMsIHVzYiwgd2FrZXVwIHNvdXJjZXMgYW5kIHNvIG9u
Lg0KPiA+Pj4gKw0KPiA+Pj4gK3Byb3BlcnRpZXM6DQo+ID4+PiArICBjb21wYXRpYmxlOg0KPiA+
Pj4gKyAgICBpdGVtczoNCj4gPj4+ICsgICAgICAtIGVudW06DQo+ID4+PiArICAgICAgICAgIC0g
Y2l4LHNreTEtc3lzdGVtLWNvbnRyb2wNCj4gPj4+ICsgICAgICAgICAgLSBjaXgsc2t5MS1zNS1z
eXN0ZW0tY29udHJvbA0KPiA+Pj4gKyAgICAgIC0gY29uc3Q6IHN5c2Nvbg0KPiA+Pj4gKyAgICAg
IC0gY29uc3Q6IHNpbXBsZS1tZmQNCj4gPj4NCj4gPj4gRHJvcCBzaW1wbGUtbWZkLCBubyBjaGls
ZHJlbg0KPiA+Pg0KPiA+DQo+ID4gWWVzLCBqdXN0IG5vdyB0aGVyZSBpcyBubyBjaGlsZCBub2Rl
cy4gV2Ugd2FudCB0byByZXNlcnZlIGl0IGZvciBmdXJ0aGVyLg0KPiA+IElmIHlvdSBmZWVsIGNv
bmZ1c2UsIHdlIGNhbiBhbHNvIGRlbGV0ZSB0aGlzIHN0cmluZ3MuDQo+IA0KPiBTb3JyeSwgeW91
IGNhbm5vdCByZXNlcnZlIGl0LiBCaW5kaW5ncyBzaG91bGQgYmUgY29tcGxldGUgKHNlZSB3cml0
aW5nDQo+IGJpbmRpbmdzKSwgc28geW91IHNob3VsZCBwb3N0IGEgQ09NUExFVEUgYmluZGluZyBm
b3IgdGhpcyBkZXZpY2Ugbm93Lg0KPiANCj4gQWRkaW5nIEFCSSBmb3IgInJlc2VydmVkIGNhc2Ui
IGlzIHBvb3IgaWRlYSwgYmVjYXVzZSB5b3Ugd2lsbCBoYXZlIHRvIHN1cHBvcnQgaXQNCj4gZm9y
ZXZlci4NCj4gDQo+IA0KPiA+DQo+ID4+PiArDQo+ID4+PiArICByZWc6DQo+ID4+PiArICAgIG1h
eEl0ZW1zOiAxDQo+ID4+PiArDQo+ID4+PiArICAnI2FkZHJlc3MtY2VsbHMnOg0KPiA+Pg0KPiA+
PiBEcm9wLCBubyBjaGlsZHJlbg0KPiA+DQo+ID4gVGhlIHNhbWUgYXMgYWJvdmUNCj4gPg0KPiA+
Pg0KPiA+Pj4gKyAgICBjb25zdDogMQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgJyNzaXplLWNlbGxzJzoN
Cj4gPj4NCj4gPj4gRHJvcA0KPiA+Pg0KPiA+DQo+ID4gc2FtZQ0KPiA+DQo+ID4+IERvIHlvdSBz
ZWUgYW55IHJlY2VudCBzaW1wbGUtbWZkIGJpbmRpbmcgd3JpdHRlbiBsaWtlIHRoaXM/IFRoZXJl
IGFyZQ0KPiA+PiBuby4gRGlkIHlvdSByZWFkIGFueSBvZiBvdGhlciBiaW5kaW5ncyBiZWZvcmUg
c2VuZGluZyB0aGlzPyBPciBhdA0KPiA+PiBsZWFzdCBteSBzbGlkZXMgb3IgYW1ueSBvdGhlciBy
ZXNvdXJjZXMgZnJvbSB2YXN0IGRvY3VtZW50YXRpb24gZnJvbQ0KPiBlbGludXgub3JnPw0KPiA+
Pg0KPiA+DQo+ID4gVGhpcyB5YW1sIGNvbWVzIGZyb20gbWljcm9jaGlwLG1wZnMtbXNzLXRvcC1z
eXNyZWcueWFtbCBhcyBjb25vcidzDQo+IHN1Z2dlc3Rpb25zIG9uIFYzLg0KPiA+IE1vcmUgaW5m
bzoNCj4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYXJtLWtl
cm5lbC9wYXRjaC8yMDI1MTEyNDA2DQo+ID4gMzIzNS45NTIxMzYtMi1nYXJ5LnlhbmdAY2l4dGVj
aC5jb20vDQo+IA0KPiBQbGVhc2UgcG9pbnQgdG8gYSBzcGVjaWZpYyBtZXNzYWdlLCBub3QgZW50
aXJlIHRocmVhZCBvZiA4IHVudHJpbW1lZCByZXBsaWVzLg0KPiANCg0KUGxlYXNlIHBheSBhdHRl
bnRpb24gdG8gdGhlc2UgYmVsb3c6DQoNCj4gVGhyZWUsIEluIGNvcnJlc3BvbmRpbmcgZHJpdmVy
IGZpbGVzLCB3ZSBjYW4gZ2V0IHRoZSByZWdtYXAgcG9pbnRlcnMgdmlhIHN5c2NvbiBBUEkuDQo+
IEFsbCByaWdodD8gQnkgdGhlIHdheSwgSG93IHNob3VsZCB3ZSBkZXNjcmliZSBzeXNjb24gaW4g
eWFtbCBmaWxlPyBBcmUgdGhlcmUgc29tZSBmaWxlcyB1c2VkIHRvIHJlZmVyPw0KDQptaWNyb2No
aXAsbXBmcy1tc3MtdG9wLXN5c3JlZy55YW1sIGlzIG9uZSBJIHdyb3RlIHJlY2VudGx5LiBHb2lu
ZyB0byB0aGUNCmNvcnJlc3BvbmRpbmcgZHJpdmVyIHlvdSB3aWxsIGJlIGFibGUgdG8gc2VlIGhv
dyB0aGUgcmVzZXQgY29udHJvbGxlcg0KZHJpdmVyIGlzIHByb2JlZC4gWW91IHNob3VsZCBiZSBh
YmxlIHRvIGZpbmQgaXQgaW4gbGludXgtbmV4dC4NCnNvcGhnbyxzZzIwNDQtdG9wLXN5c2Nvbi55
YW1sIGlzIGFub3RoZXIgdGhhdCB3b3JrcyBpbiB0aGUgc2FtZSB3YXkNCg0KDQo+ID4gSWYgeW91
IGhhdmUgdGhlIGRpZmZlcmVudCB2aWV3cywgcGxlYXNlIGdpdmUgbW9yZSBpbmZvcm1hdGlvbi4g
VGhhbmtzDQo+IA0KPiBUaGVzZSBhcmUgc2ltcGx5IHdyb25nIGluIHRoaXMgY29udGV4dC4NCj4g
DQo+IElmIHlvdSBjbGFpbSB5b3UgbWlnaHQgbmVlZCBpdCwgaXQgbWVhbnMgeW91IGFjdHVhbGx5
IG5lZWQgdG8gZmluaXNoIHRoZSBiaW5kaW5nDQo+IHdpdGggbWlzc2luZyBwaWVjZXMuIExvb2ss
IGRvIHlvdSB3cml0ZSBzdWNoIENjIGNvZGU6DQo+IA0KPiBpbnQgc29tZV9wcm9iZSgpIHsNCj4g
ICAgICAgICAuLi4NCj4gDQo+ICAgICAgICAgaWYgKDApIHsNCj4gICAgICAgICAgICAgICAgIC8q
IENvZGUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSAqLw0KPiAgICAgICAgIH0NCj4gDQo+ICAgICAgICAg
cmV0dXJuIDA7DQo+IH0NCj4gDQo+IE5vLiBDcmVhdGluZyB1bnVzZWQgY29kZSBtZWFucyBtb3Jl
IG1haW50ZW5hbmNlLCB3YXN0ZWQgcmV2aWV3LCB3YXN0ZWQNCj4gY3ljbGVzIG9mIHByZXByb2Nl
c3NvciBvciBjb21waWxlci4gV2UgTkVWRVIgd3JpdGUgc3VjaCBjb2RlLg0KPiANCj4gDQo+ID4N
Cj4gPiBJZiBtaXNzIGFueSBpbmZvcm1hdGlvbiwgcGxlYXNlIHJlbWluZCBtZS4NCj4gDQo+IFll
YWgsIHBsZWFzZSBwb3N0IENPTVBMRVRFIGJpbmRpbmdzIGZvciB0aGlzIGRldmljZS4NCj4gDQo+
IA0KDQpZZXMsIEkgYWdyZWUgeW91ciB2aWV3cy4gd2Ugd2lsbCBkZWxldGUgInNpbXBsZS1tZmQi
IHN0cmluZ3MgbmV4dCB2ZXJzaW9uLg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZXMuDQoNCkJlc3Qg
UmVnYXJkcw0KR2FyeQ0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

