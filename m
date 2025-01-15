Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B1AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 04:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uL0Zc3Wz+z7UmU7MUI7Pc2sfU3YUZ7fJeFFpF7bQ4G4=; b=YtVAC3FhTY7YULazWkb9QPRkzf
	upcBOD+zXrb/om7Guh/+iYz4jJo/tXvW1EmWDjbIbCgW9kYKPU46RusyBLlkvTyvki0FO89/I12+A
	7SFfJJjAz6EoDiXIRBK8BNegFiUOqjAPGygJ3EdhASNgg58Tn6nkWr7Dd1ytntSnCp+VZvS5LI/VM
	DyqpCHfe2agwru50xzMkzZ3p/m236I8JK4APPdQMrktzMnENmr6GHl//uohmW1v1PgviZ8pFxyB1L
	Cq4bigFFkfEyRqH894qLe83FpnG2jMOMr9mHU3LBZfQFfXd8qYTGi4AYgVdyIw0rsNUoCbKEHNH4g
	G126ySug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuxr-0000000AbMk-1ce2;
	Wed, 15 Jan 2025 04:25:11 +0000
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuw8-0000000Ab9i-2ORn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 04:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736915004; x=1768451004;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qXf7IZdVJyUrite+xqwlVpvngojc/8D7usSweB4EGqw=;
  b=WDannQC46mKHguEtfV5qgRECweBGc32fFa8OeCv2SWOy8ptpeUO6jJvQ
   PGfA4Q6Psz0g9fe0B01RhCiUi51cQl6rGpjKBuRODsZEFIz5rrSJ6qOuE
   Sv+EZmSNS6YR+c4HRWzPXRHj724sWIEL6el/eJ+RUNO4kYZzZfc8hYXJG
   nOGlNxtWqV8y1ZZpLb2hbxLDg3o8epaBNhvfC3kbw3FOhjDN0+YzCL4Kc
   BDpszNPWJhvsLbVASTe0KK2/bD9uAC1w/NeccMc+/URnzwOgE/g+uDsAM
   bP4gs4Ii76+6CyulxpfCnhLakL1OvI9h8iF/4zBGq7/GORDEU7TXdhhgK
   A==;
X-CSE-ConnectionGUID: hmbecxdhSnC0VqLPZFWEng==
X-CSE-MsgGUID: P6Zy1qrQR+Kd0yeQM2EPnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="53975663"
X-IronPort-AV: E=Sophos;i="6.12,316,1728918000"; 
   d="scan'208";a="53975663"
Received: from mail-japanwestazlp17010003.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.3])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 13:23:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFseW4fWj28WP62VfGIFLM8aTHI81gAXGVkk/r/6WRY2+pk/QlBFZosDaXqAuvDPlBoORw/hzsy/dLY58boxrc/OCT9R1dtRe+4Xvq45fk2zVLQolZW45obrtQ/mEVk2GkBEpEXBZLrmBzOH36QQqqs8PB0VKpKwf1jl8av4R/a4zuHo1aeSIVPwd4hRTTW1rXJdr0t3QpcjozTpZz1GUW2XZ3RJAQ+AQbrNQnjs5y/i7rS3izdvgB39Uv74n9ZvRCmcyXSMvisNAXk1+wLz7r2HmSfhkx5BjTkurM1kNVYKH7lSQCP9alxxCSGcqgi5ByqyeBbRlyU6DVyiiG7hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uL0Zc3Wz+z7UmU7MUI7Pc2sfU3YUZ7fJeFFpF7bQ4G4=;
 b=yoe9Cymg1sBr/+E53MZ65dY5XRjJBXtW+wnzRjrsVstexLw8YsnxK5Dg93OSs5+XZxCo5CS9faIuET8eifCu9SXs9D2PxPpTqN929bHxwrHpqQAU42g3Bq46iACSpSG4GhwIa1hiy5OE8OqqG0dVTiUI6E3a+t2KYn9VNpuCSXO/qYjdNswHFuB9cEaOCqx9T6bFMqSlUl10kaxYz3TlQepSDLijI3sfmXY3uIPq1+fj8ios1aSUMXyV2mwB98p3iPTR3dXTbdZZPS+eD+7IJEJGzLdoSdMDHd+1Ax6Krt15OCogS+fd8+YDdu3jCbfy7spHLacAroqeAWu26yk7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY4PR01MB13777.jpnprd01.prod.outlook.com (2603:1096:405:1f8::9)
 by TYWPR01MB9276.jpnprd01.prod.outlook.com (2603:1096:400:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 04:23:07 +0000
Received: from TY4PR01MB13777.jpnprd01.prod.outlook.com
 ([fe80::60b7:270b:27c7:4fcc]) by TY4PR01MB13777.jpnprd01.prod.outlook.com
 ([fe80::60b7:270b:27c7:4fcc%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 04:23:07 +0000
From: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, Russell King
	<linux@armlinux.org.uk>, Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Subject: RE: [PATCH] serial: amba-pl011: Implement nbcon console
Thread-Topic: [PATCH] serial: amba-pl011: Implement nbcon console
Thread-Index: AQHbYWdP/BV+GPA6/U6eirwXO3ZUArMMh4MAgAEUEkCAAoCpgIAFS9kA
Date: Wed, 15 Jan 2025 04:23:07 +0000
Message-ID: <TY4PR01MB13777765A086DD98887F91C13D7192@TY4PR01MB13777.jpnprd01.prod.outlook.com>
References: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
 <2025010845-deceiver-imaginary-ea04@gregkh>
 <TY4PR01MB137779148D6C8C537E7108071D7132@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <2025011031-lying-spirits-e326@gregkh>
In-Reply-To: <2025011031-lying-spirits-e326@gregkh>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=d5ac3089-6eaf-4c61-95a0-72c98ccc0bdd;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-01-15T04:20:25Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB13777:EE_|TYWPR01MB9276:EE_
x-ms-office365-filtering-correlation-id: 409618a5-583d-4911-ffdd-08dd351c4ff3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|1580799027;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?cmJvcUVMSWl0ak1veGpoNnBabFF4OWhtNVZQMk1oNXhnUW9WNmhtZFhS?=
 =?iso-2022-jp?B?UHQwUmc4RFJxMWhZNG1mTzZCcUV2TU1SalRMbUVER0xCVHppeVYwKyt3?=
 =?iso-2022-jp?B?S2pvaTNUVS9tOWRDb3UyODA5UUFkdEo2QnR4OUxHdTZtQS9JRUFjd3hW?=
 =?iso-2022-jp?B?cUNxRWRqZGJiaVloRFVTRi9MVkJJeXpCRDczSll5QnNndjR5U09waHdX?=
 =?iso-2022-jp?B?UjVnSGRpYXJPZVovRldwcS9qeW5ZdWNFVEJ6NmxXQlBraHlkSklRMUlF?=
 =?iso-2022-jp?B?ODZ6V0pDUHNkTCttSjNGTmR6bXNRUWVPcXJ0MXZCcXIwSUJvTkFLdGoy?=
 =?iso-2022-jp?B?dGp4UHhoZ2ZRaUEwWmlKWng2OUxRYUFkdGYxYzRZbzFTT0VHNEI4TmVn?=
 =?iso-2022-jp?B?VTdwbi90S2RFMFpBcG90NFBndmtWaFF3Rmt3VUxuWHJ0YWZOS3NxL09F?=
 =?iso-2022-jp?B?VjdkcjVMczFUV2t4cHFReVJjazM0ZnN5WEp6dkV4L0VnNHM1S2NGeUYy?=
 =?iso-2022-jp?B?L01xM1NDVGYrbko5d3c4c3FMNk1OMlljUStMa0wxeFp1QTF2bEJRdW5G?=
 =?iso-2022-jp?B?a09xMDhoQVVVbm9kR0RVRTk5ZnAvbmJqMjM3emNENGRpODZDc3NlSDEr?=
 =?iso-2022-jp?B?SS9obUVza1VwUnMvclZhUVcyb0gveEp3MzREdStZb1NuR3dLUkdRUDNy?=
 =?iso-2022-jp?B?b2Fub2NmNDhPN1dSMDM4TTlqaFBOVmRtRFhhSlpyUFpLZ1lJMjNxckdE?=
 =?iso-2022-jp?B?c2M4QUhmTXZxVWZpL09xN3NMYmc2cG1NMFYwNkhYN1QrT2NrUkNzMEhN?=
 =?iso-2022-jp?B?S3FUUUJtdWV4MndqeklEc0tQRFpQaStQT0VNSzRFWFpZTVphRlp1ZENO?=
 =?iso-2022-jp?B?TUdISmF3Y1prM2RGTG1DOEZsMjBhNUEycDNUcDhvVWd5NFZEcUNIcThO?=
 =?iso-2022-jp?B?ZjkxOXdzK2I0citzVTVpUk9QMXlEd2E3QnRpb3RsK1E0eE1MeFZGQzhq?=
 =?iso-2022-jp?B?clYzSERQOGVGeE83cUtEYzZpMWkvV0FaRHFjc0xRSlIvbnhJYmxSbWVW?=
 =?iso-2022-jp?B?OGE4WVlmUlBpL2V5aWZoZ0tYeVNjT2tkcCtCaS90TUZFVWNId1FUaTdB?=
 =?iso-2022-jp?B?bGt2SGNHTEV1dVdnUkw0UnlKdjRiRzRoUkVpSXJseC92eVpscjZvc0Vq?=
 =?iso-2022-jp?B?SWRQdENDRHMyVkhXOVVLOXl2SHFaMWt4OWxpNGVXMmlKdkozTEE0RTJr?=
 =?iso-2022-jp?B?ODJCNXlXTk4veVdGWEZvOEJJMmMxd2xvYVA5VDA1QWt1aENEZ2R3dENi?=
 =?iso-2022-jp?B?Mm1ZSndNS0pXOTNoV2tXdlM2UE5vQUtPeXhFUlpKRTVZVHpQNFVraGVC?=
 =?iso-2022-jp?B?VW5wUVRNUjVvRlE0dWN6RVJzbTRLcjFwN25tclVUTHZwTnpIdC96Zy91?=
 =?iso-2022-jp?B?S1JzbUl4VzcyWVduTjhSL1oraFgyZGxSZWRJNFJyNTFubDkwMktxc0ZP?=
 =?iso-2022-jp?B?UmhadGhDK0NRT1pwZXlzMXdraEd0Rm5TMEJGRkR1clZDRmlHK1c4Ylk2?=
 =?iso-2022-jp?B?cFRhZitVRGw5SUs3ZDdIT29iYU1CZUdzYzZNNURaWm5CY0R2Vzc1dXRC?=
 =?iso-2022-jp?B?K21OUkpienRaVHlEQnVuc0xsWlNyOHNmdmIxdDc4alBvd2UzSURwSVZ0?=
 =?iso-2022-jp?B?SVIzYTdOTHFCc1FuSytjMFZydW84elAyRFh4eGpRdjdYZlFjdGRkUUtV?=
 =?iso-2022-jp?B?UTlHa1JZOCtaWUkrU3dCWGRsU3RZeTV6UUUyTytSb0pEaGlNVjdoUlUz?=
 =?iso-2022-jp?B?bzVTaUxuZmQ5SWdwODZ4V25TNlFjem9WRmd5d1loOFNtLzVoT3ZqWHBK?=
 =?iso-2022-jp?B?TzBxT3lHM2hvTmZUb2U4WHlxRW13UHhlN2hIVUNhRkF1TS81bWlDcU8v?=
 =?iso-2022-jp?B?NVZFNHowSFkvRDdEZExwRkNvajI1dGphQ2hBTmlmTERZd0M0NVJRaEtx?=
 =?iso-2022-jp?B?UENUckRLcUcrcGQrOEZ0MkQ2R1N6YVBSVWtiSFlNa1NtV3V0eXJ6YkIx?=
 =?iso-2022-jp?B?V2ZwckF2a0VhN1VNSlhsMFhicStYK3M9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB13777.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?NnJGdml0S2ozRjZYVCtMTVJ1dDRPWjdXc3duSWlRVkdTVkI5M2QvT0Fw?=
 =?iso-2022-jp?B?Q1dvSHhrbkhNUklKSXVpMjNpOGs0aVA1STFpUFd5TUtIR2N5VFgzSU5O?=
 =?iso-2022-jp?B?Z0dDZXNrUERpbWF6Wi9TckJ0ZWJXVDYvR0NGNThHWGJudzEyQWt0OTI4?=
 =?iso-2022-jp?B?cFRBTGdNS3lJRWdJSDBPK1VQWitkcDRtaWh6RlV3SFhHZWxuOWFhMHBw?=
 =?iso-2022-jp?B?bFB4Y1phT0NkVEdsUE1nbE96YlBuaHJtbUtJc1ZvRUxjbDdzQkZ0Rldh?=
 =?iso-2022-jp?B?d2RTdUl4QnIyMXBlQ3oxekQ4VGFWd25ja29ZV2ExUXZYYmptaktHa2FB?=
 =?iso-2022-jp?B?MTVaSUNxSzlCUlJsdlkzbkdkTndRQ2E0RkNFVld1RHhNVjhTcDlnOVEw?=
 =?iso-2022-jp?B?NE9tRHVHTGdibFA5MWRvdkVBeXMwTm04YjI2ZUt0TnNnd2FxSmdKQW5N?=
 =?iso-2022-jp?B?djZrOGhQQ3A0UHlUS25wUGtGOEZwSXRxQ1lZdWhtU2gxYkRINm8vcFdx?=
 =?iso-2022-jp?B?c0YvZEoyUjFNTWM2NCtKK3o3S1ZXVnoyNlNZeWdZWkQ5bmI5c1hVcWRT?=
 =?iso-2022-jp?B?anExc1k4UkMyYjhCQmRQYzNTZitRRGFmaVZlWGNKdTNjZjhHb3VPTzIz?=
 =?iso-2022-jp?B?cEdYNTc1aU05V0dCSlNTTHAyK2FLOUcycmtGbUsrRk1YYUpvc2ZZb2t1?=
 =?iso-2022-jp?B?MWxuVW1VMHBGbWJZbUYwWVlmbVdwQ2NnL3ExVzR0SjhUd1pKeEtONHlQ?=
 =?iso-2022-jp?B?Rjd6RHFZN1pkaE9OVEtmdWlXbGhRRExoY0pVRGdYYlpoWHB1OUlCTEtM?=
 =?iso-2022-jp?B?TVBDWUZjb0Z6UEhwYTBmb1p4dENLOEkzcnpucVlwUGJTSHZ5ZGhaaEpS?=
 =?iso-2022-jp?B?M3Fya1BpSUl1aUo3ZkRMN01aRE96Tmk0NVJwVjZQUGM3VytJNk5VY254?=
 =?iso-2022-jp?B?MnFhZnM5YXA1ZFNQVW54R3l2bWxrYW1IYnFYUTExaitVVzFOMzRDOCt0?=
 =?iso-2022-jp?B?ZzBoUFJTTlV5Uk1yNHJ0RGlFYnhsenpYUzBZZkUzSUFiUExhRWloNkc5?=
 =?iso-2022-jp?B?YzNxUjA5Z28zU2VCZFFpbEFUY0QydG90dUMvdERQZDJ3MFVPT3Y4T1pi?=
 =?iso-2022-jp?B?bVNVTE1MeStBK2FyVVlpbHd1UmhYbDBWYmpEcTdOWUtsaE1saC92dktQ?=
 =?iso-2022-jp?B?bjFRYndzU2YvRnRMTlJWc01TdlU0WGEzand6WlNrdi9QMmdSU3FJRG4v?=
 =?iso-2022-jp?B?QWhTUTVENmU1aEJvQnNneTFiZzhyRUhpandURzE1VXJGSkExcU83TnJx?=
 =?iso-2022-jp?B?U2xpOHBKNmExZkhHdDR1a2E4cWNKY0RWYjBBS3VQUFNGMUhoSFpvV1hF?=
 =?iso-2022-jp?B?eHI3emJKSWFZdXVrOG1XeFRUSjNJMjZ3Tkl2T0JGYXMvQTFOZCtQK09h?=
 =?iso-2022-jp?B?SUE4MExURU11ZEphb2VCL2lPWnV6U2JQVHdJNm44ZWFLdTNabkhCZFFO?=
 =?iso-2022-jp?B?YkQ5STMrbU90akpLYkxHU2c1S3dZTDBnQ1VqdVdhNTYzc3F3RHhDOWJm?=
 =?iso-2022-jp?B?VG1iVnFWd2svSGRPdzZJMDJ6TGxtRi8wYTVXZytrTjB3Snl1WW1xVGYx?=
 =?iso-2022-jp?B?SXVzQ1RidmZoaVk0bkZSZi84U01MWWZ2ZGJ6dTRSQnpLWXZpNkZMTTFK?=
 =?iso-2022-jp?B?OEV0YXIzcXBXTTdLU0psVkhvMzI2UGFaeDF2ZDUwSVpJdkI5RnBrdHBY?=
 =?iso-2022-jp?B?Y1drT09VUHRtdDhpdURSMmwxOTBuVmFjRDZ6bU1Ja0tWcFZHejhsdFM4?=
 =?iso-2022-jp?B?blZvSjZCcFhIQy95N3RXS3pLSUF4c0RSQllzTUZpWnNuNUZIWWFLVVFJ?=
 =?iso-2022-jp?B?UWl5aVFyZFJ3dVpPR0VqV2U5SGhPQ28raFp0NjVuaWc2VG81a2dzOXlp?=
 =?iso-2022-jp?B?RVJqbmJ5Umtra1A4RHZlVS9tOU1vYy9GRWY5dVhlckRWTlZVY3p5T280?=
 =?iso-2022-jp?B?bGJQSWpkZVJuTldDTnp4dWdDMytzVnl0d2J2L1pHenFDSkdKMTdIUG9o?=
 =?iso-2022-jp?B?RzVPc3FBU0FNTzhrT0t6Rkt1Skd5c3QzUUdyb3NXSkRBS3JDb29nM1Zv?=
 =?iso-2022-jp?B?VFJHV2s5STJvdVVIYWszN0VGcy9mZ2JoTGplNy9qRkhLemFPRFg0RGNq?=
 =?iso-2022-jp?B?aWd4bm05NUJtenNoajhuRmJ6dXFWblZtaEx1OUFsczVNeWFwanVGVlUz?=
 =?iso-2022-jp?B?b1lXZEtLcW5PVWVWUkNvWFRJZWI1R2FjRWNneWkvVzFqdGY4d1N1RFFr?=
 =?iso-2022-jp?B?dXpNc040MjNnR1piYjdBdk16NnlCNEZaR2c9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: X7pDhLzg9q6v0V6iIe+jpuUL5nd+QnSvMFARKCuoQg5lAoVcJ+0mPpmU6hIq7KWQzuXCNwbE8kiIj26DhZ42WWUiAIGrs6zcoVvrKNts6/8voj3b0jDL+5tJwH6yjCk2Y0Rn0tgOJi8KQRI/R6RGvQDFZUH4vEtZPccA67KwP5yVJWBvdMiT/aO32dRzfhl7PNuMaeMwQ2cSsA28kyPHGG6wKiMiCh33+/CpfGugqBURjkEV+Lb6V/sNUXZpRrq0HcXhSwlXA3dOM8wGrG7yrI0kUgSeF3sMPLS9TjV2ifKjZAV3q+ViO9zwaHmCGOa3bWifAnFLgTLC7TaMN7iUyPYceulYteoAw8gvhLbi+/bTg7QVJvPiIuCdflbuZ1wxDF5fk3QhaVw0vvejBk1T5J8YMi/wgC8JkvSoQ4MCxzVVE3XB2QpmT5rTgfX9qInuLp+C/OQwpoWFSbnkHBJfDRzAKjiMQL1QmR9K5OGypcZQ1kjgEeWkeb5nGHWDIdFKWlQdBEveOnfvwdLJsXInIqCVD77WLV+uiEDKLhgJiERgykYA2k3ylLV+oE3pyI5vz1/rLOQh99s8Bl/X8Ctz5rGNvn0bUWCRt/AqnCI3pydljCCqIJjI7i2JgnK4mZUo
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB13777.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409618a5-583d-4911-ffdd-08dd351c4ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 04:23:07.2766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPMPGTM/Aeqmi+H/FK5JoCcTVEGWf+DrREbdOXlVQNdRXKevL4OU6WUM9CDuyFWPt9VHFo5FVFHezTU0GnBzNFPL2IoN4pIL+qeYn8xTwHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_202325_206845_FE66AAA1 
X-CRM114-Status: GOOD (  27.96  )
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

Thanks for your comment.

> On Thu, Jan 09, 2025 at 01:04:36AM +0000, Toshiyuki Sato (Fujitsu) wrote:
> > Hi, Greg. Thanks for the comment.
> >
> > > On Wed, Jan 08, 2025 at 12:47:30AM +0000, Toshiyuki Sato wrote:
> > > > Implement the callbacks required for an NBCON console [0] on the
> > > > amba-pl011 console driver.
> > > > The codes for legacy console are retained, and the module
> > > > parameter (use_nbcon) allows switching between legacy and NBCON.
> > > > The default is off (use legacy console) for now.
> > > >
> > > > Referred to the NBCON implementation work for 8250 [1] and imx [2].
> > > >
> > > > The normal-priority write_thread checks for console ownership
> > > > each time a character is printed.
> > > > write_atomic holds the console ownership until the entire string
> > > > is printed.
> > > >
> > > > UART register operations are protected from other contexts by
> > > > uart_port_lock, except for a final flush(nbcon_atomic_flush_unsafe)
> > > > on panic.
> > > >
> > > > The patch has been verified to correctly handle the output and
> > > > competition of messages with different priorities and flushing
> > > > panic message to console after nmi panic using ARM64 QEMU and
> > > > a physical machine(A64FX).
> > > >
> > > > [0] https://lore.kernel.org/all/ZuRRTbapH0DCj334@pathway.suse.cz/
> > > > [1]
> > >
> https://lore.kernel.org/all/20240913140538.221708-1-john.ogness@linutroni=
x.d
> > > e/T/
> > > > [2]
> > >
> https://lore.kernel.org/linux-arm-kernel/20240913-serial-imx-nbcon-v3-1-4=
c62
> > > 7302335b@geanix.com/T/
> > > >
> > > > Signed-off-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
> > > > ---
> > > >  drivers/tty/serial/amba-pl011.c | 113
> > > ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 113 insertions(+)
> > > >
> > > > diff --git a/drivers/tty/serial/amba-pl011.c
> b/drivers/tty/serial/amba-pl011.c
> > > > index 69b7a3e1e..52fab3170 100644
> > > > --- a/drivers/tty/serial/amba-pl011.c
> > > > +++ b/drivers/tty/serial/amba-pl011.c
> > > > @@ -41,6 +41,7 @@
> > > >  #include <linux/sizes.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/acpi.h>
> > > > +#include <linux/moduleparam.h>
> > > >
> > > >  #define UART_NR			14
> > > >
> > > > @@ -263,6 +264,7 @@ struct uart_amba_port {
> > > >  	char			type[12];
> > > >  	bool			rs485_tx_started;
> > > >  	unsigned int		rs485_tx_drain_interval; /* usecs */
> > > > +	bool			console_line_ended;
> > > >  #ifdef CONFIG_DMA_ENGINE
> > > >  	/* DMA stuff */
> > > >  	unsigned int		dmacr;		/* dma control reg */
> > > > @@ -274,6 +276,10 @@ struct uart_amba_port {
> > > >  #endif
> > > >  };
> > > >
> > > > +/* if non-zero, the console is nbcon. */
> > > > +static int use_nbcon;
> > > > +module_param(use_nbcon, int, 0444);
> > >
> > > Why is a module parameter needed here?  That feels wrong and not
> > > scalable at all.  What happens if you have multiple devices, which on=
e
> > > is nbcon and which isn't?
> >
> > This module parameter is for pl011 driver.
>=20
> Yes, and module parameters are from the 1990's, let's not add new ones
> please.
>=20
> > With this patch implemented, only one type will be usable, depending
> > on the value of use_nbcon.
> > I thought it would be more user-friendly if legacy operation could be
> > selected via boot parameter.
> > Would it be better to make the patch purely nbcon-compatible, without
> > retaining the legacy functionality?
>=20
> Why would you want the "legacy" functionality?  Aren't we converting all
> consoles over to use the new stuff?

As you say, it should be replaced with nbcon.
We will reconsider a v2 patch that supports only nbcon.

Regards,

Toshiyuki Sato


