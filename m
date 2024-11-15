Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3FCD68BC8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79stcdfO2RHFSqtgGDB+HzYa1bWk+qTPYygxdKwWMI8=; b=aCZN5dsqbn4teSGXj2AD+JE9DD
	LR4W+b7wTaChMQkYbLFLRmPv7p4DaGTQ56FYFn9SenjXtf888bzgYRefpA5j2CSo0jVnCjFoiO6Bl
	KyhW1mrrI+kWBnrdcfsyd+kvP2t1PK7pLBmTmwkkzWU8GRsQyIfkBb0ZRWUOZdoIB/HPCdr4NaOAi
	gs15d3lfhAwx6Wf357sbp/+RncXBIA0eXjtpE84YwVq9KAZYKJIiGn+4d8sRJ/uLiwNTdF23i3LtI
	qwjMCT3kG4XecvgmMPN3AJvJylK6WQOtPe8mYOaYimpHm/+vNXsmo+u9ty/p+uHyaFQ0C+QuVBhpA
	IVJHLiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxqh-000000035Qo-1Lua;
	Fri, 15 Nov 2024 15:03:03 +0000
Received: from mx07-0063e101.pphosted.com ([205.220.184.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxmC-0000000347b-18nb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:58:25 +0000
Received: from pps.filterd (m0247495.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFEpvmU003841;
	Fri, 15 Nov 2024 14:58:06 GMT
Received: from pnzpr01cu001.outbound.protection.outlook.com (mail-centralindiaazlp17011024.outbound.protection.outlook.com [40.93.132.24])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 42uwr1sv90-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 14:58:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZNGFWWkXBrh0dFS0tuYm8Gkwu5FcSaxiDHdfPfKD42eaaIBWPcqct/ECMQo52sBkX34ZpCR4KdtoFUUwReZDsPfjukYp7sB+RJupP6CpMhGrnoqpL+uvUfWDtFUrzXJknUrPEgUkSKpEgajJW0cBiEaz86xgH0gNA+E8y9+7bH5CnVQZDD0gUMKoSiQXaewXTidRQdLEQbeU2TnoZqNEsCKeLbTd9DDg78UVfLWsoz/KZC2um5YjZGC6CUlPMMZaBVy0dwInbe3bnjLnPjRxsrjTWw3rbd5UUYKXTueQUZMWO26vEj2cCNFT/XrniXxB7DT1Z1tG1314FVvZGjvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79stcdfO2RHFSqtgGDB+HzYa1bWk+qTPYygxdKwWMI8=;
 b=p7tkSHtGwaxlTUiD+xze41EEtT3R6HkkD+LF0W8NG2F0BTvZtb0RU5nvzWjEIjB22cYoXb7hj7gHnaB6g4s607pQzeoLwhflZZy4IAO/cZ/3OXf4+EwEfvpLhc+vVuOJjxzmT88qR+ROs5jn2e/fFVwaU+ZllbUAtgjRX3OAIitdr/aI7kdNsd5gVlixY6X1xkVQN2eLgWZz6qFxKwynU4VLTclluQtpMrjhQ58wCKoyTzWclaAxdqn7R1f6Ua+8ffB/T0hkkfSIj3yPF4xsUIEOQ22RnjmtBVR5uV0VnG+Elj9UhytANd7V6SR1xaybhx1pTm7Lz5zqIVVzaV3bBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79stcdfO2RHFSqtgGDB+HzYa1bWk+qTPYygxdKwWMI8=;
 b=Mr9heIdv56dmKnCYRaME66C8UwVwrVn1aZ4lzhBpLMrh2boMD3Icl+t8PVQ7txTOpb2WOV45zVlUFEgp8ex88OkgkUz/o0IPoMMD50rD4dL4snnsFAJ1k+tIsSweeEnM7KOfIuSj4z+KEekkEQeokRD5ADESegdcZa3XeR4ATUY=
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12a::5)
 by PN3PR01MB9551.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 14:58:01 +0000
Received: from MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655]) by MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::309a:12cf:74a4:5655%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 14:58:01 +0000
From: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones
	<neil.jones@blaize.com>,
        Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "soc@lists.linux.dev"
	<soc@lists.linux.dev>
Subject: [PATCH v5 1/6] dt-bindings: Add Blaize vendor prefix
Thread-Topic: [PATCH v5 1/6] dt-bindings: Add Blaize vendor prefix
Thread-Index: AQHbN27EvnDYYbBy1kyObLNwmao1Kw==
Date: Fri, 15 Nov 2024 14:58:01 +0000
Message-ID: <20241115-blaize-blzp1600_init_board_support-v5-1-c09094e63dc5@blaize.com>
References: <20241115-blaize-blzp1600_init_board_support-v5-0-c09094e63dc5@blaize.com>
In-Reply-To: <20241115-blaize-blzp1600_init_board_support-v5-0-c09094e63dc5@blaize.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB10184:EE_|PN3PR01MB9551:EE_
x-ms-office365-filtering-correlation-id: 42e5f60b-7c19-447a-03f9-08dd0585e6a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d0NNZTQza0d2MTc5UVUwMkJDcktucGJnWll6ZWdDVGxlQ1ZwejZzNmN5bjFv?=
 =?utf-8?B?eFZQRHI0ck5IREdoRFpXd3hYc2IyY2laeU5LUThzd0VzSzE2Z0N2Rk8rUUFW?=
 =?utf-8?B?VGxCMmZiZEhCWTVJMVVMRE1kSXZqdVFZakhqRFREbWxYU3ptNjNhNDd1ck9X?=
 =?utf-8?B?ZmE5cDBGM3VmblZiRk1Gcmh3VWFqUmtSOVI5QjY2cG12TTVOdHUycnBBZjQr?=
 =?utf-8?B?Q2RVV3RPL1pUZHowNGtFZklOQ1FTNkFIckdYYWFMK3NKTnV0RnJTV2NCak4z?=
 =?utf-8?B?STNSNGNDaG55RUppWjZnNmxiVzVBMU5scFZ1clExN0tnM2F6ODRaYlI0K0lv?=
 =?utf-8?B?U3IwNE1KTysrdFI1akxBL3BURDFyN0U0c0diSS94ZzU1RE1nWHBha1FWQ080?=
 =?utf-8?B?enZ0UXZmRTNoakswYWJ0UFJwTGRFMEJBOXFIVWUzV0YrUFFWdWdWUG5uWUJs?=
 =?utf-8?B?Z0t3cTgveWVpZWNyRXFTRUJCZVNXSytOODJWaHBqTCtTZWZkcHQwK3NLOUhu?=
 =?utf-8?B?bEYrYnppazZvZnNOZlQwQ2VKZlVWazAvaGVoeXNOakhmTkRhY3cvQXplYll1?=
 =?utf-8?B?SnRyZzB4Rnk0VE43dC8wQXVqaXJxU09ZYUozOGRGU3dyTHgrTUJPUnd5OVFW?=
 =?utf-8?B?L2ROelFlVEdoYWxRSEcrWWo2Wkx2QXpQQ0VyMzNSMnpIcGUxVm0rYzNuVmMz?=
 =?utf-8?B?Z2Z3azhHUVpBemhuOFdXc2VSNzBYRFJUNExhZ1BrUG0vbWZzRUR4Q0tOU1po?=
 =?utf-8?B?a3VkUHlMMVBKYndmMy9wcjNxUkZ0bzNYRXUrZEdtMDVneVBISS9GUnRvanlR?=
 =?utf-8?B?cTJYU0FzbkFtdnpzTkxya1lrUHpTUUhXQjFhaUZ4QVE0SzJrei9paDkwamd4?=
 =?utf-8?B?MGJlZmwyVzVIY1B1MXV5MWVGbUlHcjNvcFFnSWFnRCtLTEJqWTgzMVg4bVRZ?=
 =?utf-8?B?RE9lYkcvRGV4MkduL2N5S3I2QkhmRHlFeEJ6U1BodFdoTmQwNHFkMUpoVWZ2?=
 =?utf-8?B?MC9iOHRES01mMzNFejIzM0NQcHVFWGhsMS93ZkJCTk4ybWcyZkgvZUtrcXdL?=
 =?utf-8?B?eHU3c2tweHhIcStUNnRDanI3OFUrSHZxL01WeXppVDY3NXdYV0dMUjdPd2VQ?=
 =?utf-8?B?bkZZcTc5SmZXV2hGK2pXWTNxa2hLSFJMZGE3RlpRSG51cFd3T2JSRTVtL3hX?=
 =?utf-8?B?b2FOdnRYa3UreWVNNWw0emZpZGtNYlR1NFJYV2tzb1VoMUU4OEhxMk9kSk45?=
 =?utf-8?B?aTYycTNpSnNibzc4TSttWEt2L2FFZVNVbzlaRm00N3N6MlN4Q29TSk5Ja0lE?=
 =?utf-8?B?dTJBN2RubFExVEdBU3N6VnVVWE15TDRxdjloQ29WUFZNTnRqRkprLy9vTU9Z?=
 =?utf-8?B?TitaY0RkY1RjenJxWEN4dUxrMFZqZjNrdFIxUHVON2k5S2lnUkRxZW01U3Bv?=
 =?utf-8?B?ejVtZU8ydWpYVG5FR2l3a1Vvb1k4RmlXNHZOdEU4Z05CWUUzbWhnZ2hCaURt?=
 =?utf-8?B?TktlOS9kRHJnYW5OOFNMMDhEY09kd3lMYUd2dGtWVmp0S29wcFhPMkZad1BY?=
 =?utf-8?B?a0hqQUJWd1pUZjhRSGdpZE5SdmRVZERUYTVOSVc0Vm01RDlBNGJtQnhNZlB6?=
 =?utf-8?B?OUF3dUtJT0hPaTVjSFVJbEI0eHN6V0V3U040MzJiL0lHS0Z1VmdJTjVEK2Vu?=
 =?utf-8?B?QW1yUDJpT3RZUCtWeHJTSHNKT1JhKzBHbDJSYU1JMkRtMmV3bUxUbGZXSGlh?=
 =?utf-8?B?SzRQZndUU2ZSdW5ZRFhkdjFtZ1lzVnkzcGtaYWZpY3Uxd2hBYWZud2h1R3dz?=
 =?utf-8?B?YWhvVXNVQXZTMWw2cE00Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0I1aFd3cGF3ZjE0Mjg4b1hMbUhsVnRpNWt4Tndra3kzaCt1aUdSUVg5dklx?=
 =?utf-8?B?YnlyQ2tlSGdQbk1IL29ra1h3UkNUcmZRM25iQ29yQXlwSk9pMkJhY0VvOHF3?=
 =?utf-8?B?RGJRM2VnK0Z6Nk5DaUZwTk9EanAxZU83WExsZzhxVUU1VVBWV09heTl0L1ZR?=
 =?utf-8?B?QUZlOEpNMnpBNmF4eklrb3VsMy9STkRlYmdWOEkxb0NXaitmY3ZQeWlkWFVt?=
 =?utf-8?B?WmpyNUttc2ptM2NLNkJxakNpa1dFN3VuYnJWeG9IV2xYMmJPbVU1UkQ1Q1hP?=
 =?utf-8?B?RzQxUktuOThKemxZT0J2OHJheElGNUpzdXQyRXIvUDBIckNTUnl0MlEwejZP?=
 =?utf-8?B?c1BOVE1QWlMzRDNDd3lTaUN6L2N3ZWhweWZjSDQ3OGorUW1pUDBMYVhHMW9W?=
 =?utf-8?B?VUlGSVBxcVhKWGFZTWljWjErWDkwRDJlT0liU29JRDdQQXdRRGZxYitmdTIx?=
 =?utf-8?B?WGs1ekN1aldvTEJCaVJOWk9YM1dmbjRDbFNGaStpbjNzaFVyWWwyUFZZaU4v?=
 =?utf-8?B?THR1eGV2SDViK1ZCK0VQc054eXZEbnlVN2x2Wm5XZXBOOVRiOXhKbS9Ceis1?=
 =?utf-8?B?OHk3cXBOeVRCMEp2dUR1ekt2TEttaEFwbDRzNnl1V2pFRFlXTnh2RGlPazhZ?=
 =?utf-8?B?SDJYZlRET3VGditIQWcwa2RYTHAxZFhjRHFLSzNoY2hjUmU5UHlCWVBaWi9S?=
 =?utf-8?B?RlRTMkNYbnh3UVp0ckg3VkM5NHJ5Tjk4aFNWOTlZTnBJdUhlN0Zyc0NZdVlV?=
 =?utf-8?B?bVFYbnVKNVpDWG5SQVBqRTdudGQ1cTVtMDlQR25hekxsekd0MjRTeDJYM1la?=
 =?utf-8?B?YnNhVnpEMnpmNGtPSURSRVl5d2RCVk53TW1NcWZhVUJucXRLclEvc1dwVE15?=
 =?utf-8?B?MGdkVE1qRVhpQjlzOXl5aGFadkhoZk1EZGpwZTd4RFAyZmsxOEw0ZkFoSTVR?=
 =?utf-8?B?cy8xT3hFRnVHWWNuRzRtSUdQL3QrMmJ5UDMya1Q2Nys3WDRUYmtCS0d1R3N2?=
 =?utf-8?B?Z0Jvd0dhSW9uVXVHbHd0UDNZZnAxM0Z1S2xLRHNDR0NQRmRaMUtIYjVrTGhN?=
 =?utf-8?B?NzlseEhwTERZbStpRUgxTHgvVGVBL2p6TVA1cVNiWmpxdmVpUjFwVzVhZmZT?=
 =?utf-8?B?VC95LzlFWXV3ZkV2RmpQZ1AvaVhFNW1SQi8weTloZFEwN3B6aXBlYjZEd3lH?=
 =?utf-8?B?d2N4REtyaVVoZzZpT1ZSMGVQL0REOHRVbTF1dWRTVFRyZlVjc3diVkxnaElo?=
 =?utf-8?B?eVpDNmxxbE5CdTlDRXp6UHUvb2szY3c3QVRFcXlPZlpCWlV6cU96WEIxTXla?=
 =?utf-8?B?dGVMSjZxdUxWWnVrbVlydUhJamxEang4MzBtTXJGQUZBK3dJWXpzK3pSOStN?=
 =?utf-8?B?T3AzR1c4dUtqTmVRcE9zVGV4UUFxdjBLYjhvRDFpN01KQk9xYTRYQTdYb3lr?=
 =?utf-8?B?QnJnNlN0RnZvTFNyaExDNk1wL25wRG1YUTZscWl5bUc2WUdwR2dHVlJzRHpR?=
 =?utf-8?B?eStqSkJ3RnZrK3NzdFJuUUJhbUhSMk11azE0eGpWajdZZTVzNCs1Vm1SNjla?=
 =?utf-8?B?aUNmOWFBeW45RElUa09ZRlNabFBCRVByRlZXSHVqRWZuYTVybnBEemFYVm8v?=
 =?utf-8?B?RUhISWJkTi9SZEpSaU96SlF0cU9abENLMFpaOUVydUp3NFNBN3BPNTJEck45?=
 =?utf-8?B?NSsyMjFCWnFrbTFJek1lSVdtQU9jcXg2ZEkyak1zd2hsZ2Z0RlIzQXIybTlS?=
 =?utf-8?B?ekNlUlNXb2ZFZU8vTC9NQ3M1bGkwNzVNVTVMenhwakRPOEFoUlh1Y0hyT3ZO?=
 =?utf-8?B?WG5ad1p1UHpEaWgrcmphVW4ycURlNW9ncVkrSnREdjBIM2ptaXJkMy9FWEF4?=
 =?utf-8?B?b29YUFp4S2Q0L2huVTVISzU1bnVpMHlxMWhHN0ZKYStnZ2NDZ2hvcExEc0pt?=
 =?utf-8?B?b0ZVKzF5K21haWJsNi8zVE5NV0x5RzQ3RnhFRWFIV2pBRXVwbVNWM0VWM2Zy?=
 =?utf-8?B?MGt5aGM5dnlBbFI0dUZIZ203a2IzUzhDdlRsNnZxQlBuVE15a0dXdHhib2FU?=
 =?utf-8?B?UUZTaGVCUWxJeldFbGxueGlmcjA0QjBUbHZLSjFMbE9qMk1BUEwvZjc3ZG8x?=
 =?utf-8?B?S1lFODB4L2ZnYkphTjBWNzU1bVZTTUJ3UDBJc3ZLNm5MQ0ZLMUpRWDlaUjFk?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AB0D214383D3043806DECE3E0795514@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB10184.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e5f60b-7c19-447a-03f9-08dd0585e6a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 14:58:01.4315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3NJOjZIYFNteJS5igj7UWbw+GRFzJ9mRQPgrawapWTGJIC6sAIqETEzP13pdtuZMk555cv0vHCW4YuC4b6JAZg7E6QALMMmj07pfvxVZpyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9551
X-Proofpoint-ORIG-GUID: 6GK992nHSY1JDEFM3fG5fMgUy0zZqFe-
X-Proofpoint-GUID: 6GK992nHSY1JDEFM3fG5fMgUy0zZqFe-
X-Authority-Analysis: v=2.4 cv=YMvNygGx c=1 sm=1 tr=0 ts=6737617e cx=c_pps a=RRW9qgVLUv3Tpt3ACdNssw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=4MthsM0t3ikA:10
 a=-5LYVjoNHPMA:10 a=SrsycIMJAAAA:8 a=VwQbUJbxAAAA:8 a=_EF-DDfaELcfUD8t5moA:9 a=QEXdDO2ut3YA:10 a=zapPnUM7SFj2ezx6rUw-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Reason: orgsafe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_065824_619749_37D9F429 
X-CRM114-Status: GOOD (  11.96  )
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

QmxhaXplLCBJbmMuICh3d3cuYmxhaXplLmNvbSkgaXMgYSBTb0MgbWFudWZhY3R1cmVyIHdpdGgg
aW50ZWdyYXRlZA0KcHJvZ3JhbW1hYmxlIEdyYXBoLVN0cmVhbWluZy1Qcm9jZXNzb3JzIGZvciBB
SSBhbmQgTUwuDQoNClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwu
b3JnPg0KU2lnbmVkLW9mZi1ieTogTmlrb2xhb3MgUGFzYWxvdWtvcyA8bmlrb2xhb3MucGFzYWxv
dWtvc0BibGFpemUuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92
ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92
ZW5kb3ItcHJlZml4ZXMueWFtbA0KaW5kZXggYjMyMGEzOWRlN2ZlNDBjZTRkOTdlZDNlYTI2NGE1
OTcxYTM0MjhkZC4uODA5MDg2MDYxYTE5OTI1NjdjYTZjNWQ0MDRmYmNlZThhMzNlZTMwMCAxMDA2
NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4
ZXMueWFtbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy55YW1sDQpAQCAtMjE2LDYgKzIxNiw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KICAg
ICBkZXNjcmlwdGlvbjogU2hlbnpoZW4gQmlnVHJlZSBUZWNoIENvLiwgTFREDQogICAiXmJpdG1h
aW4sLioiOg0KICAgICBkZXNjcmlwdGlvbjogQml0bWFpbiBUZWNobm9sb2dpZXMNCisgICJeYmxh
aXplLC4qIjoNCisgICAgZGVzY3JpcHRpb246IEJsYWl6ZSwgSW5jLg0KICAgIl5ibHV0ZWssLioi
Og0KICAgICBkZXNjcmlwdGlvbjogQmx1VGVrIFBvd2VyDQogICAiXmJvZSwuKiI6DQoNCi0tIA0K
Mi40My4wDQoNCg==

