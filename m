Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF08D2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMidoRwBIand1VLFdLXwnSwv4B1KC6A/+qhU7Ef8k30=; b=mlMOipFijCWDbMxHrPc04Ut1kz
	nswZbjxkCgh3gfUVBJVXXSADQ7+OSkGNlgo7nY3keDJwsiX+vdWiE78r+lfplYT5IjVCrKPxf5Tm9
	rDLHRphEeY/daQ54R3Z3P5IkGmdPnc9n/UMzTokNbKMy995jS8J9ktdT4aUM4vjf9CDeVEK6cgBLt
	Ax7ABgZMf65yKh/xKdqytE6d8zqiD73v2GcaR1nmU7EGJs7YDQPuEhCbUBy1Y7i+OcZ0EWqeJXWD1
	MOUB8XAhLj/dKVv6dChM64wPk/qj0NbaUfye6Z4gcwTrLVFT3jKFhjgYQ3xv4imAgJAjRiqYPLzPd
	0RkQcv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0e8-000000032jU-1mAk;
	Tue, 20 Jan 2026 01:35:04 +0000
Received: from mail-koreacentralazon11023105.outbound.protection.outlook.com ([40.107.44.105] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0e6-000000032iF-1WKB;
	Tue, 20 Jan 2026 01:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U531DMa2gAZiC/VqfCvGjo0Zqk/Tzyx7oSreGImu18AgAK9rUrfegeuKIPN0z987ACRpTL/H532HxMXAGZCn9x6VSqZy1721bichlaR4kKI1MnXojfbwO1oyxG489WrwkjynRdEfoV6YSIVsWWLzlNWTF0zcsA4XCWGYxWWMlqIRdre85+BQXDzk03hW1v0CBsGLwNkLu2H5mMwP+d16eB1xDGokRJgCixcPwQxuIBS9QPpRCP/hFnt9mWMl6HbJy6OEUcEEdLGM6lb018c0kzuAHOZZI9iogeJbrS7zmSEItzt2Bo3dXnPbCs9tZLpYnMUx2ILPrEUBaeN8qKNOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMidoRwBIand1VLFdLXwnSwv4B1KC6A/+qhU7Ef8k30=;
 b=xbqFZuBcDbkOTIeDj8nAMRNeiq8JPCbb7LZs8m14HMPw0hbej3wLsbmpSau6s/LZQEoRhhT/ocK8jT/ewNDHHTvsVQyvri87us23sfD4o/BMs7ViLbFBuRfrIdcSRgPs4NLtonJ2NEjL1VPD7pviGXxEz6NKldSB5rO1m++1zwffQb72RmwQj4lhSN4Bj7CQSn77mNEOiPputJYegoDs2k+GQUFdBqhTYV17RU3n3RkI4RXhS6uUQNwxGJ2IukzvF571Xa7gn1bv6OlYsPMKG+1CMV6R1gbyXRsQfvvJclXbDujzGDVybk9c62Brw4EZUwukoCLlDyBqE7uYmnakLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by PUZPR03MB7255.apcprd03.prod.outlook.com (2603:1096:301:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 01:34:51 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 01:34:50 +0000
From: Nick Xie <nick@khadas.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "xieqinick@gmail.com"
	<xieqinick@gmail.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjFdIGFybTY0OiBkdHM6IGFtbG9naWM6IG1lc29u?=
 =?utf-8?Q?-s4-s905y4-khadas-vim1s:_enable_SDIO_interface?=
Thread-Topic: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
Thread-Index: AQHchpFOFql/4zlCHkSQcMJuxt5KZ7VaCyiAgAA9VXY=
Date: Tue, 20 Jan 2026 01:34:49 +0000
Message-ID: <PS1PPF62EEA9B1D468A8845F947D26A387BAE89A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
References: <20260116023900.2036657-1-nick@khadas.com>
 <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
In-Reply-To: <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF62EEA9B1D:EE_|PUZPR03MB7255:EE_
x-ms-office365-filtering-correlation-id: a01a36d3-a876-4bc0-ae50-08de57c41a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZVpoOEl2OTVDeGt4Rmhqa3dPVFZBTzRydWhHSUkwa0Mwd3hYVTdVNXhqWUVB?=
 =?utf-8?B?SGJqZ1N3Znl6NU16bUtDVXI2ZDRMbEVzUGRBTGJQYm9QRC9UdTVZQXdybitt?=
 =?utf-8?B?YnpwM1NJNUx5VCtKUGdwTTRqOExFc3BwL0tublZuY3NvMlc4bmtrVlBLbzYr?=
 =?utf-8?B?Y0g0aEJla2w5alVoSmdoSEhlZTBOQXg0NzBjYU1Qd3I0OEFzcmlPTlBoRHRh?=
 =?utf-8?B?YXFMNnAxcktYbGY4QnpMajF0TDc2NmY5ZjMxd0tqeUZhbHE3RXFQUEVMdEw3?=
 =?utf-8?B?TEhITXVyQWpDUkpVU0Ivb3c5Wm1lY3JueWRTbDlyKzdtelcwSFRBazVvaHBO?=
 =?utf-8?B?Vm1jMU9vOHZOdmxENW0rK29yWkdiRTg5NjhrOUowWDR6b2M3d3E1MHZJMkJL?=
 =?utf-8?B?ZnhWT1htcDc1bTV0REY1VlY5NG44QllET1kyWXBvS3VFNmxZa2ZFQ1lSY1Ru?=
 =?utf-8?B?QkUySjlsdXA3ZzlDdlRjZ2NrSTl0U2dpanpSUUt6Rk1mRk9SR2d0R1ZSOUZU?=
 =?utf-8?B?OUdxeVIxeUxhQ1laOVVQN1VGekVhR3diYmVYUS8xVHRGRFhJb3FlZEQ4eE1T?=
 =?utf-8?B?MGh0eHVKRlNDQ0tkV3BKK1g5ZVd5QmxoelNPMGlzSE1JalhyaGJGTUprTG9W?=
 =?utf-8?B?bWxNNDEzRUsvSkRDa081eTl6REtsU3I4NW9rRWFyUmNHNlVBOGZDR0x2QThw?=
 =?utf-8?B?MWZtVkNTTHNMaWw0eHM1a3BNZzRocjcycW9TRFJsL21FUDNMTGNWRTYxZGZ1?=
 =?utf-8?B?UW1xenl5OE5ZQ3E0VTJRaDdSdVpiYXMvZW9XbzNqak1JSTl6Um1wNC9NdDE3?=
 =?utf-8?B?OVBoaFZIREg4SWF2eElib0dLVmRmNzBCcUJvb2crTHlVbnF6TlhiT1ZKZmRz?=
 =?utf-8?B?UW9DbyswUmJyYm5SZmREMDQ1Mkt2d3pTSDZYb2p5S0ttSFBrUkFXUGs1aHlF?=
 =?utf-8?B?V1luUmpnVGpHdEZHc3JiVUtWM3hLMXBwUGJuZEFGSXpJS01sazVTSXlvZ1da?=
 =?utf-8?B?aFRYK1R0VEFpVmVxUkcwWTZJYTFkWThibUZybGFSdllIZEFxV042aXBLODMr?=
 =?utf-8?B?V2pqYmx5bVB0VWZGd1BnRUlYUi9qLy9ra2NCWFhKSkVXelBzRnJVNGcrRXZ2?=
 =?utf-8?B?UmVoNEM5aExsU0orRWNuQWZpYXFRU1BLTUNYRk5SWkFaVFlodmJSc1VKRFo4?=
 =?utf-8?B?WGFDQTRTRDdVVnVjdkVwUzlnc2pYU3Yva3ZOUTNpNEpqYUV0WXl5WExPT3pV?=
 =?utf-8?B?SXRveFV3aGE5Uml1VzlGa2tPWGNzdWdpOU90SkxCb2xKdlBhNzYwY0pxU2p6?=
 =?utf-8?B?OGVrb1IrdDlPcWl2c3FtTkl6S2hHSVF6NDYwY3pNbU5VN1lnSnRrUkNwQjVJ?=
 =?utf-8?B?SkZ0M0FROUNqSUc1M0JHWDhlbGo3UlVLZzJTREVyTEVZN1lxcDk3V29nY2RI?=
 =?utf-8?B?K1FzaHMrUTNGblc5bURGWTVtM2h0LzZlWWhvR09BRTE0WEFKOXJNSGxuRm1o?=
 =?utf-8?B?SkVyZWk0elJnZ21pR1N0UVJxM0tOQk5VZ3V4ZmlXVERXak4yUjRqS1JFaHFT?=
 =?utf-8?B?cUQ5c25MZndtSGtuV0MzNjR3dTlKMUlaaDFmZ1pJejAvN05ra042b3NOaE92?=
 =?utf-8?B?OVZEVlorUW5mOVNQcEtGd2FwaDU3ang5ajJnSk5UNEo5KzExNEtHd3VpVzhw?=
 =?utf-8?B?Zm0rZkEwTTB3M3dlVDArcnNmZ0NIK2xvdjh2dnJlSlJHbDFRN1kxKzBWYUZE?=
 =?utf-8?B?N3VUcjRYdklmbG55QXJ1dDVTVTZuS3VwVnNwRUtuek91NnZzYThmd0JSeEov?=
 =?utf-8?B?ZGpHNlFiWEN4NFR1YzNDcTJTWXlRbmVuUUh1WllNNGp2N0QvZmRrR0ExSm0y?=
 =?utf-8?B?V1BRU29KNStKKytwOHVicmw3RDdNMWFFWU5PUUpzT3VzVmIxV3A5RVhGS3Np?=
 =?utf-8?B?RktMdE9vNXBWc3grdDBISHM5dkRzTExnSURsUXBhRDliTGpjSlJFU0xDV2gr?=
 =?utf-8?B?WlduRHJscVZKajNSc0R6ZWF5N0V2NmNuOGRvZWpMQW9tNGZpS2ViVkdjMkNj?=
 =?utf-8?B?NFdRMS9ZOUlMc3kxWjYvRzFxeXlYNlFJa1dxeG9pdXUwRWNqTjlhbEJzdlJy?=
 =?utf-8?B?MTdySzY2cXpiUXBwcmNZblNKemV1ckF3R3RPenA5c3l5ejNhU3ZMOUR4MXl3?=
 =?utf-8?Q?RfNgAB+ik4jJcM1FFZxdXpE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzBITWdoMjhWOEdsaDZRRjduZVRGMGNXRXV6YVk2eGlTcmV1N2FmVjJxS2VX?=
 =?utf-8?B?QTBvanhtM293THBDZTR1NEc4SnZ3WU8wYjVyd3FMVllNQUQ2WHljU3I5Z1pE?=
 =?utf-8?B?RVVwTzVKalp4V0w3VHVzM1Izcmk4V1BmTzhlVGlKWHlVWnBvNzM4SnhUeFpS?=
 =?utf-8?B?M3QwVkJqbzFRSkZXMUpnSmRBTlF0NG5DT3Rvc2NSdWQ3bzN6VVRDMXlXRXNk?=
 =?utf-8?B?WjBBT0ljNEl2WWZSTnVmRkN5VU9MdXFZbUZ5MmxSK2ZLZTNmUEJIdDAvRFZE?=
 =?utf-8?B?Z0htNGNIcGJ4bFRRcmg2VGhkbVZGSS94THllUWl1UERjdzdXSm9oYVpyZXBw?=
 =?utf-8?B?TUJCSlFZbGJITVh0aUlIVStKcUZhTWdiWjBBQlByaVk0all6WVFNUGZiaVZw?=
 =?utf-8?B?WXRLQ3ZoL0I5dW5ZZjRWNVkzU3QrODhFcUNuNnR3OXArdEJxMjZIa0FKMmgx?=
 =?utf-8?B?Q0RmZExrd3BIcTlRaERwSldxbGxHbUdmV1pXRWZTbUZPeU9NMlhNQmlDa0N1?=
 =?utf-8?B?TTJ1QXVDMnJLdEcwMy9JT2ZhSVZ3M1UxVkNWcitsSTFQVjNmUkJhSi8rTUFM?=
 =?utf-8?B?Ung5YjBRakpTeG9mUkVLREhLeVdGM0xoMDZQZnRKOXVFSUY4OVJmbXQrWGpL?=
 =?utf-8?B?VVNhMHRTM0lHeFVvN3NRSkp1Uy8zRUNCb25ieHBVNi93UVVIdUdFL2lwbXlY?=
 =?utf-8?B?M3BkYUFEbzFVeXRRK1pHcXlDZk1IK0Mwcm41RGc5VmF4dWZvc21WcHM5eGhu?=
 =?utf-8?B?RWxRcjhtbDdYYnl6aXVCQ0xLMGs5dGxWN1ZCMHF4dE54U1A5WXhaM3MwQXBu?=
 =?utf-8?B?VXJucmMwRG1ibklpT1BUSkpqdzM3TWI2YXE3WDM1R09CSEVGbiszd2VOVkYv?=
 =?utf-8?B?TmZQMm5yRHhXN1FsbWRSWnY0MlhhYytwQUk5bi9SNUZtekNjQWxGYk8rS3k1?=
 =?utf-8?B?SU9xN285QWU4VWNrNVBhZlFTWG9LVWRmS1lUY1BBWlhkM1h0NGh5aFFERDN2?=
 =?utf-8?B?TVk3ZGNuV1ozWkRoZG9VQTE5QzVLVkV2NHBBNFU4cmRQM2xLRll4Qmc1eWZB?=
 =?utf-8?B?L1NmckV5UUNlOGdQNzMvcG9oU1NiNlMzdVR0VFM2b3R3MDJWQ3RwWm14Y1Jj?=
 =?utf-8?B?SEtUVVU3Z0VGaE9EbytoTTRxWnIrRW1URkswcG43ZnlWZ0xhRTZqZU82cjYr?=
 =?utf-8?B?NC81VnJGeEhVS0c4T29RVGwyYjJXeVBBM2xKYU1Ga0g4bzlBQ29vcVFrS1R3?=
 =?utf-8?B?N2szUnFPclptZW53OEdMRUtBbVg0OUdLcWoyM1FnclBlOFB3a3h6SVdGY3Nt?=
 =?utf-8?B?am1jNlhIOWxwaDlpTGJ0NWtMYlJqSTNFaHd6eXoydE5ITXR2MmJLTTlieUUz?=
 =?utf-8?B?eE9vWkFDd0h3SCt4UHk5a2tPcDZsWXNBV1FkV01hMmE2b3NDcWNyVzlpaDN3?=
 =?utf-8?B?dVZpcUJ5emRKeDdBQjI3ZGtCaEc3ZC9KSk1aQTRuZ2JkaWhNRTFGT1QyQzRv?=
 =?utf-8?B?cTlIbjBRT2xRcm1UNG1GR1dGMjU0WHZYb09yVVpxM0FxZVpyZmtVK1NFTU1H?=
 =?utf-8?B?TmxqWWQwSnc5RnBkcks5TkV4dGwrTU9EeWEwenAxU0tUbS9xbFhFL2Z4MlR0?=
 =?utf-8?B?SHc2QzVvRkJpMWdQeWR5dExXaTZJNk1YTjBuYlA5cEZ3UUxxOXhldkJkMk9q?=
 =?utf-8?B?NzcyS1F1YlZ3UldqdU16bTdyVW9nWnFGZnpiYmJ4Wnc3K2VqTlpsNmhlM012?=
 =?utf-8?B?b1o4TDFPOTNPTlFBRDVDQjVkeDVpakM0YytNWHZhQkxqZlVhVStXR1BvMGcr?=
 =?utf-8?B?S2tlSitYY004SUgvbzlCbElvbUJlOE5MVXdFdk9Tdk5kbTB6VVF0cDNreG1t?=
 =?utf-8?B?NmhhNW5GY0V4NmhTL1ZpeDJqRWp2d3MzbTFUUUhacWZ4ZlV6VTVmeEVtWFB2?=
 =?utf-8?B?aU1JME0rajJVeTczQ2pqMWkwbTFIL0oyZjJudFBpMytjc3FlcFFhTkd0bHE3?=
 =?utf-8?B?RzA4NjczUlFSZzRtYVVlc3pEdnlXVk02dVlURThldmJndjJyZ01MRERqM1pL?=
 =?utf-8?B?NW80b0J4U2VNa0dOem1uTUNhRUxMRFl3Z2NFOTJXRnpGUHJYa0FIR3RGWGtR?=
 =?utf-8?B?TWEzWEtFekR1UnIvMHI4K2lwdUZaMTExQi9TSloyVmw5N0l2c2ZaQU9uNHFl?=
 =?utf-8?B?Z3dyQ1U0SHdkdW1jdG4ydm5tY0djUWJwZzBrUkQxWnZVRW9tMmhlNytnQUp1?=
 =?utf-8?B?R0JQOStPNTA3ZFQ4RmxkSzFDMC84V3VONm9NSmsvVmV4TElHNDJ2c3BLNW1q?=
 =?utf-8?Q?nb01Os7wb4ykJpbQfS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a01a36d3-a876-4bc0-ae50-08de57c41a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 01:34:49.9890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zky0YhSCV9S1b4kIoi026PcOY55LL2Gan9KHD5/k/lp/gau2Ewuu6mVjARi3vJi5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173502_531735_E0C014BC 
X-CRM114-Status: GOOD (  12.81  )
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

Wy4uLl0KPiA+ICsmc2RpbyB7Cj4gPiArwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPiA+
ICvCoMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZzZGlvX3BpbnM+Owo+ID4gK8KgwqDCoMKgwqDC
oCBwaW5jdHJsLTEgPSA8JnNkaW9fY2xrX2dhdGVfcGlucz47Cj4gPiArwqDCoMKgwqDCoMKgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJjbGstZ2F0ZSI7Cj4gPiArwqDCoMKgwqDCoMKgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gK8KgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsK
PiA+ICvCoMKgwqDCoMKgwqAgYnVzLXdpZHRoID0gPDQ+Owo+ID4gK8KgwqDCoMKgwqDCoCBjYXAt
c2QtaGlnaHNwZWVkOwo+ID4gK8KgwqDCoMKgwqDCoCBzZC11aHMtc2RyNTA7Cj4gPiArwqDCoMKg
wqDCoMKgIHNkLXVocy1zZHIxMDQ7Cj4gPiArwqDCoMKgwqDCoMKgIG1heC1mcmVxdWVuY3kgPSA8
NTAwMDAwMDA+Owo+ID4gK8KgwqDCoMKgwqDCoCBub24tcmVtb3ZhYmxlOwo+ID4gK8KgwqDCoMKg
wqDCoCBkaXNhYmxlLXdwOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBhbWxvZ2ljLGRyYW0tYWNj
ZXNzLXF1aXJrOwo+IEhhdmUgeW91IHRyaWVkIHdpdGhvdXQgdGhpcyBwcm9wZXJ0eT8gVG8gbXkg
a25vd2xlZGdlIG9ubHkgZWFybHkgRzEyQQo+IGFuZCBHMTJCIFNvQ3MgcmVxdWlyZWQgdGhpcy4K
PiBUaGUgbW9kZSBlbmFibGVkIGJ5IHRoaXMgcHJvcGVydHkgbGltaXRzIHRoZSBTRElPIHRocm91
Z2hwdXQuIFNvIGl0Cj4gc2hvdWxkIG9ubHkgYmUgdXNlZCBpZiB0aGUgc2lsaWNvbiByZXF1aXJl
cyB0aGlzLgoKV2l0aG91dCB0aGlzIHByb3BlcnR5IGl0IHdpbGwgZ2V0IGFuIHdhcm5pbmc6IAoK
bWVzb24tZ3gtbW1jIGZlMDg4MDAwLm1tYzogdW5hbGlnbmVkIHNnIGxlbiA5NiBibGtzaXplIDUx
MiwgZGlzYWJsaW5nIGRlc2NyaXB0b3IgRE1BIGZvciB0cmFuc2ZlcgoKPiA+ICvCoMKgwqDCoMKg
wqAgbm8tc2Q7Cj4gPiArwqDCoMKgwqDCoMKgIG5vLW1tYzsKPiA+ICvCoMKgwqDCoMKgwqAgbW1j
LXB3cnNlcSA9IDwmc2Rpb19wd3JzZXE+Cj4gPiArwqDCoMKgwqDCoMKgIHZtbWMtc3VwcGx5ID0g
PCZ2ZGRhb18zdjM+Owo+ID4gK8KgwqDCoMKgwqDCoCB2cW1tYy1zdXBwbHkgPSA8JnZkZGlvX2Fv
MXY4PjsKPiBJJ20gbWlzc2luZzoKPiDCoCBjbG9ja3MgPSA8JnNkaW9fMzJrPjsKPiDCoCBjbG9j
ay1uYW1lcyA9ICJscG8iOwoKTWF5YmUgaXQgaXMgbm90IG5lZWRlZD8gVGhpcyBjbG9jayBwcm9w
ZXJ0eSBsb29rcyBmb3IgdGhlIGJsdWV0b290aCBub3QgZm9yIHRoZSBXaS1GaSA/Cgo+ID4gK8Kg
wqDCoMKgwqDCoCBicmNtZjogd2lmaUAxIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlZyA9IDwxPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAiYnJjbSxiY200MzI5LWZtYWMiOwo+IElzIEFQNjI1NiB1c2luZyBhIGJjbTQzNDU2IGNo
aXA/IElmIHNvIHRoZW4gdGhpcyBzaG91bGQgYmUgKGFjY29yZGluZwo+IHRvIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvd2lyZWxlc3MvYnJjbSxiY200MzI5LWZtYWMueWFt
bCk6Cj4gwqDCoCBjb21wYXRpYmxlID0gImJyY20sYmNtNDM0NTYtZm1hYyIsICJicmNtLGJjbTQz
MjktZm1hYyI7CgpPSywgSSB3aWxsIGZpeCBpdCBpbiBuZXh0IHZlcnNpb24uCgpXaXRoIHRoaXMg
U0RJTyBwYXRjaCwgdGhlIFNESU8gY2FyZCBkZXRlY3RlZCB3ZWxsLCBidXQgd2hlbiB0cnkgdG8g
Y29ubmVjdCB0aGUgd2lmaSwgaXQgc3RpbGwgZmFpbGVkLgpTbyBtYXliZSBleHRyYSBwYXRjaGVz
IGFyZSBuZWVkZWQgdG8gbWFrZSBXaS1GaSB3b3JraW5nLgoKWyAgICA1LjkwOTg1OF0gbWVzb24t
Z3gtbW1jIGZlMDg4MDAwLm1tYzogYWxsb2NhdGVkIG1tYy1wd3JzZXEKWyAgICA2LjExMzE2MF0g
bW1jMjogbmV3IFVIUy1JIHNwZWVkIFNEUjEwNCBTRElPIGNhcmQgYXQgYWRkcmVzcyAwMDAxClsg
ICAxOS4yMDYwMTldIGJyY21mbWFjOiBicmNtZl9md19hbGxvY19yZXF1ZXN0OiB1c2luZyBicmNt
L2JyY21mbWFjNDM0NTYtc2RpbyBmb3IgY2hpcCBCQ000MzQ1LzkKWyAgIDE5LjIwODYzOF0gYnJj
bWZtYWMgbW1jMjowMDAxOjE6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciBicmNtL2JyY21mbWFj
NDM0NTYtc2Rpby5raGFkYXMsdmltMXMuYmluIGZhaWxlZCB3aXRoIGVycm9yIC0yClsgICAxOS4y
MTgxNzBdIGJyY21mbWFjIG1tYzI6MDAwMToxOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgYnJj
bS9icmNtZm1hYzQzNDU2LXNkaW8uY2xtX2Jsb2IgZmFpbGVkIHdpdGggZXJyb3IgLTIKWyAgIDE5
LjMzMjA5MV0gYnJjbWZtYWM6IGJyY21mX2NfcHJvY2Vzc19jbG1fYmxvYjogbm8gY2xtX2Jsb2Ig
YXZhaWxhYmxlIChlcnI9LTIpLCBkZXZpY2UgbWF5IGhhdmUgbGltaXRlZCBjaGFubmVscyBhdmFp
bGFibGUKWyAgIDE5LjMzMjExM10gYnJjbWZtYWM6IGJyY21mX2NfcHJvY2Vzc190eGNhcF9ibG9i
OiBubyB0eGNhcF9ibG9iIGF2YWlsYWJsZSAoZXJyPS0yKQpbICAgMTkuMzMyMzI3XSBicmNtZm1h
YzogYnJjbWZfY19wcmVpbml0X2RjbWRzOiBGaXJtd2FyZTogQkNNNDM0NS85IHdsMDogSnVuIDI1
IDIwMjEgMTc6MTM6MzggdmVyc2lvbiA3LjQ1Ljk2Ljk0ICg3YmI2YjE0QFNZTkEpIChyNzQ1Nzkw
KSBGV0lEIDAxLTJiZGZiNjRjIGVzNy5jNS5uNC5hMwpbICAgMTkuMzMyNzMxXSBicmNtZm1hYzog
YnJjbWZfc2Rpb19yZWFkX2NvbnRyb2w6IHJlYWQgMjMyIGNvbnRyb2wgYnl0ZXMgZmFpbGVkOiAt
ODQKWyAgIDE5LjMzMjk4OF0gYnJjbWZtYWM6IGJyY21mX3NkaW9fcnhmYWlsOiBhYm9ydCBjb21t
YW5kLCB0ZXJtaW5hdGUgZnJhbWUsIHNlbmQgTkFLClsgICAyMS45MzkwOTBdIGJyY21mbWFjOiBi
cmNtZl9zZGlvX2J1c19yeGN0bDogcmVzdW1lZCBvbiB0aW1lb3V0ClsgICAzNS41ODc0MjJdIG1l
c29uLWd4LW1tYyBmZTA4ODAwMC5tbWM6IHVuYWxpZ25lZCBzZyBsZW4gOTYgYmxrc2l6ZSA1MTIs
IGRpc2FibGluZyBkZXNjcmlwdG9yIERNQSBmb3IgdHJhbnNmZXIKWyAgIDQ0LjQxMjY3N10gaWVl
ZTgwMjExIHBoeTA6IGJyY21mX2NmZzgwMjExX2Nvbm5lY3Q6IEJSQ01GX0NfU0VUX1NTSUQgZmFp
bGVkICgtNTIpClsgICA0NS42OTY5MDFdIGllZWU4MDIxMSBwaHkwOiBicmNtZl9jZmc4MDIxMV9j
b25uZWN0OiBCUkNNRl9DX1NFVF9TU0lEIGZhaWxlZCAoLTUyKQpbICAgNDcuNDkxNzY4XSBpZWVl
ODAyMTEgcGh5MDogYnJjbWZfY2ZnODAyMTFfY29ubmVjdDogQlJDTUZfQ19TRVRfU1NJRCBmYWls
ZWQgKC01MikKWyAgIDUzLjI5MjA5MF0gaWVlZTgwMjExIHBoeTA6IGJyY21mX2NmZzgwMjExX2Nv
bm5lY3Q6IEJSQ01GX0NfU0VUX1NTSUQgZmFpbGVkICgtNTIpClsgICA1OS44NjYzMjhdIGllZWU4
MDIxMSBwaHkwOiBicmNtZl9jZmc4MDIxMV9jb25uZWN0OiBCUkNNRl9DX1NFVF9TU0lEIGZhaWxl
ZCAoLTUyKQoKCkJlc3QgcmVnYXJkcywKTmljawoK

