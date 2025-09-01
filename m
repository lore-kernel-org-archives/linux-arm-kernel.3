Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6F1CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAWfHB28cNWYu7mshk9sXO6vqqMbq8B1yZOACQ9sJFI=; b=YircX2PZyO/os8UUCEjqfyOEuj
	qNhVYR63Cttrb1ezdAIoIXjFn3yNr2dOoPlrIqG7SEJKJPHJGqMEUBNMFyLmJ6wq0zbccFQeOY9C/
	OrnxU3GD5FtR6wtgo1YwAwhvoUu0xuSqwmIFuJ3V4vO90MmEeFIXKQAdTBhNfLq7VMMjXcZXDJSD3
	61/t70OBaNnUulRewOvdsJhm5RlMoNM8Ybl1i3QDk9V7uAKN/7Y23WnRCOBghJy2MIx22Q6Vwxs9i
	KqtmAKK0WOGUPnBcKHSsq7pVcCbEN/pCOdlUZt/MTTH3uAQGrkIgPB2qtsRmxZe5jG803h/zIKqc7
	ctSHPEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut05a-0000000BcB4-26k8;
	Mon, 01 Sep 2025 08:40:34 +0000
Received: from mail-koreacentralazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c40f::5] helo=SEVP216CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszfn-0000000BY3g-23XD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:13:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpJMCwsy72UB4m9pwapo3m8vkprcPwK3soYq99PLOFjxbNkupWn2XJgds43S4WGxmWzZnsAbJBIMOhoDiTpC7cLNP1bkCLjMIzi2bIOxctWfYxtPTrrYKJJ89btJyEuUesvFOefUei/Q/NoTeovMRiYLsPLP7FafktVjr+KOy4lW08D7wlSy5HFRnLlYPmD/uIsOAr+ESV7h3vKyt4oihZvxM/p6FcTf6HcMRHQLSqkYilUF7kinE7t3M9D6Xni2otzHgsdBIx+vIdW5ksU83JxxmadhOycw4jtQqTxjYTcWOcRBR/8qAdogCN2LUzQrzctI9Mwq3vgW85FxNbczCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAWfHB28cNWYu7mshk9sXO6vqqMbq8B1yZOACQ9sJFI=;
 b=DQctCt+RlPv2RZvySct7k35DvxeLi9bcXW4jFubzcCe/1uaN0iG9ImtfYhQWMpA2FnCg1Y3oFI+pilp2u5DULR+V9meUFGUbGPD7ixYtvw7E3OvylvXdoRcb0sWEIqSCNhli0ZLR9JlGOcZK568vN6o4ZYkal2cJvOUaaKgqLqacDUl6fix2ep2DndlbLA2dFojO8wnTLCTqAfLKzRgeOM8WrXNj6Kj1rhFOJJSMxgtPohpN7H60w9t6rJ9y9QxrqqK5ouRjaLMI3CBBE/8jbi8r7DsIpeYMxdzy3z47C1eIgGqlTyv0Ge5Tz5NKlCoGT/uM8seOwDsDNr5e4KVIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAWfHB28cNWYu7mshk9sXO6vqqMbq8B1yZOACQ9sJFI=;
 b=aDEZkyaLmaOGEmQ7dGuPuA+RvyB9WpDjXpiC9OFscYFgp/lvjZZ3pW2Yhzw5Xr4eZYngf/fhccxBa9om/fSYUgJ2q3zRlZbAe84szIU9ruMM1wnzhXyaGIMUM2EEIk1C9G5L/dfMJ36AWPyGlCvGx0wOsEIevnvou9K6lO7fhUw=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB2010.KORP216.PROD.OUTLOOK.COM (2603:1096:301:131::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.15; Mon, 1 Sep 2025 08:13:44 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 08:13:44 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>, Ming
 Qian <ming.qian@oss.nxp.com>
Subject: RE: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHcGMGMGgJ5jqNL+EGIylnEfbTZRbR5qpcAgARN4LA=
Date: Mon, 1 Sep 2025 08:13:44 +0000
Message-ID: <SL2P216MB1246A048955A09A5A4D15CA3FB07A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-9-nas.chung@chipsnmedia.com>
 <5502f52d-d302-4479-93b8-1da47731cf1d@kernel.org>
In-Reply-To: <5502f52d-d302-4479-93b8-1da47731cf1d@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PU4P216MB2010:EE_
x-ms-office365-filtering-correlation-id: 99ff1b54-d6fd-4363-5586-08dde92f7810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VSZ2UyOD/GFeR2J2Yjawr4CObD7t3HO+21112taQk1PrwNpPJzgeKYeTh1ak?=
 =?us-ascii?Q?9B3CVcWNkck8h5lviRjUqxTbRh03/nGbKsa6Lv/XIiyqNpemNLFTNBfEWn5g?=
 =?us-ascii?Q?9V5Mae17OavT+48CPRJxnzBxrCnSgReMpvFhRlPKZPkHc2Lr7bXB2l4PZABO?=
 =?us-ascii?Q?C7pQHSZl2j7DFG2vBtHRAB+o455/QdUXzIoQ0GEk35kAqldPqlsDOORDyaEK?=
 =?us-ascii?Q?tFamh7Ao5H7uTN0lJCtuU1KeoywK8ALIIjFfaUq8loOmG3HG3hAHwJGdVAaU?=
 =?us-ascii?Q?fGxh16hX9IfvqR5bUZHADSBe9Q3QMqt2WJ2HwmIfTd++cvHhiq1oFigWTxIj?=
 =?us-ascii?Q?OGF5q/P6vxzhQFFQUvKdeXDe8IBfgRo95ZmJJ8E03u30+pBqjhPwS/2E2501?=
 =?us-ascii?Q?66U8BQyfSB0VG35arkCK6lM+uudVPc4u7KtVw4T0b8oNiaWe49oZFdCdDlg9?=
 =?us-ascii?Q?IUYQ6mcGXM0o8e7kNU/i+MpuVWhy4W0YmF4jNbsjAzojPNy4Nvzf39QGisMt?=
 =?us-ascii?Q?r2vPbX4lvPAGhlhATiQZV8296ZvrwQbh7dmBOma0fniWBXFKccxZoiUcdeOi?=
 =?us-ascii?Q?/CKu8lZsCf9sJhyca3VULp9wp5A/84WfWGo4dGd9yWebOH8VBTRwnGHQCbuL?=
 =?us-ascii?Q?+q1ICx/beBjTMajc6GTbh1h7ff67wh6M0WjzEJLeOu6a7TulJJf/fckeLPnZ?=
 =?us-ascii?Q?xfV+93/T9C5nCMdJMKIPP8GEeEM9KmndtdOVwE9cfSKfU3L23sZyUzz1TBKF?=
 =?us-ascii?Q?BLUU0/zvpMSn4DUKHnw95pMPKSxoaur1MRPKK4Q9qpkRF2voszMs0NAfWRaQ?=
 =?us-ascii?Q?Jn1EGNAYAnFDZ3fO6PxD0f9ELC92uZMmtjAYz2hjzfikGKdbr7nChwr8SHbT?=
 =?us-ascii?Q?xSpz5NDnLVfuxx0RyIYqrCCqqvUJJxQHzFx8O5ihbbVzI7iB3MskAPcw6V95?=
 =?us-ascii?Q?KUcSeytdepNfiUSwoJwW6xcHSzlXChp92HXtLvrVqdtHoKPI2EXr/JX32AVr?=
 =?us-ascii?Q?uMiBXMId3jzMbsjj2kXvVllVKN1cICGW6LsspwgyBAS3k1zAOJ4oz1+6pysZ?=
 =?us-ascii?Q?5OAKM4GKecS6wniiBaUuPjLJq/pJhWBEnaR78QoS/j5sjCiIiQv16Pr4q0fP?=
 =?us-ascii?Q?+da84d5rlVbFkmXGxwI5EAP5W0Vwd//jjqm3rgeRpaJFQLtcJyHl96ZUqaiL?=
 =?us-ascii?Q?iDUny6fnWnTbA4Lxw00zNOlG7L80A8BIsy73KsaaxyEVJrGMilgS6XmhT2Ht?=
 =?us-ascii?Q?61naHzVCXoJSP58mlet6cHd6Q9SrO3d5TnEJTSz7zQn+qEg8S4623KdKivyY?=
 =?us-ascii?Q?HU3mc7Bt9RlNEiL4kgy/cY5KcucSJnj6uprVP1ue2CB1fd4/gZMvRq1wOpjm?=
 =?us-ascii?Q?M6La8+2RmSpLzjiphPrG1pc4a3SOAdbDtZA9ijBCLSXHhrb0nWhyUkPPCPkz?=
 =?us-ascii?Q?NiCVVTz4VcIFJcvF6a+VRHsR6sdRm2HORjd+KHJwyYiAVMblOCHdQw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8GVJqBmRQfASvdrEjmYECqauKbWem05ANAapKQ7DTOLIFDAsr7AOgx4ARCih?=
 =?us-ascii?Q?HyLVDE1Hmt3GRJsjQCS2058slrLsKhPIxN5UO8s6h2kKJGxAM+/pjAkI3K8K?=
 =?us-ascii?Q?AuOlZNPr2Jy2QdVQC9DiInpu/pwpcmUP5f0LU4nqJY64skn/9CNKC1uZS1Um?=
 =?us-ascii?Q?KrEoailP99kslCThdq/cyDhWRFD6anhX6j6kKcVKGMIv1lx90e34lzZHcSV5?=
 =?us-ascii?Q?5YTJc5VetZEchf7Nh9QWkUcYv8KWKEqFQtKGHOEcK9LUK5KFgEyevsSSSBPR?=
 =?us-ascii?Q?+9Y6XcCovIKrA+i04DUtb1Bls4V6Xh1/7J3O9av/QSqJfak9HohEuDtxW8eu?=
 =?us-ascii?Q?O0N5Ao9aMjBORFAzT/hYzHyj1K1ATdSlma6IPALJoZTdGn1dA4YT7oBxC8wM?=
 =?us-ascii?Q?WsFRV1+dMLr+GT+tLaW/AnYzIn3dJwThaNhoLqQojBzecCACfrHAHzGHYgA2?=
 =?us-ascii?Q?HbqDNF94eB2PeWahFXl4OpMEdux0Sfr1/DBmEbNuURIvcHKBjnu8HzP8OQBJ?=
 =?us-ascii?Q?vFWWqWGrOUFAxl6sJq1QXxPCF4h0TXp6xrv0QJT/PNJNGQAWRZAN6T0bT54V?=
 =?us-ascii?Q?NnpPHDc+o4lJtsgiwItv11a+PG80NpM4TjF2l5IbH8jyD11NK12ZJfJ30ugg?=
 =?us-ascii?Q?2w9GzfFTvDU2SxeZK/B7pmixKpo6ebv0jhLGo9RwQOjHSLi159mNdfY3jsph?=
 =?us-ascii?Q?v22njNyB3RTraq0SuXyB9/4RCvCD/YsWvQ0TC/QijECWwrCuaLYIkr1zokOA?=
 =?us-ascii?Q?gNmnruza47pqGYmq+iJM3Y2iCetjsmJ/5iw/ogC8vIVuN2uSdEJfC8bC2Olm?=
 =?us-ascii?Q?MIaoMtClVtOpdlCibykg9rRikqpmB380/qN9NlTnB0Cw71vXEJsZFkNQcJ0Z?=
 =?us-ascii?Q?HoJWenGiPtYgZMMBQvF+dyM+peiql2caD8TxauV9yS18D8v9b0lMAqTuX7ZA?=
 =?us-ascii?Q?EQMMmrXk/XuIIGOZ/8W6ZeS6fP1Vszn7sVGoUqRbmHs2Z/WZeQ/3pTPT0Jup?=
 =?us-ascii?Q?1BYxJB+9War0I2v7W2rBdZ72M0lrKkkrAoDajwA8giUDmZCYlUgO5UQ+7Whn?=
 =?us-ascii?Q?BpGctFNmLF8H+eMJBNUuJSKz+2U8XuHWFpj5NDKbpSdcaUhy6/5mTU6c5TS5?=
 =?us-ascii?Q?9JRFw2P+ynwGbYmJqr1F9ReXuSDpmqKQU71SrHPW1xzzuEIoovzRfyTQQbEj?=
 =?us-ascii?Q?TtWBeoA3gLtHiXdwS5WizSfcEtdk7WF4TbXFb8tx0YYT84E1ZDO/2HYNpXcP?=
 =?us-ascii?Q?U9E7hjMDB4I9sArsTpEPuQGzilHvNt9ayHbNsfcj3as4FXLpa+i+i2BfAK9c?=
 =?us-ascii?Q?puQvSGVSBGq3NsM7OWnNqWda7xhaDOqL/nbZ+wJ7Z8/49tir6iqDp+wMSqin?=
 =?us-ascii?Q?oWE2VKmaAPJKZIhjMjN3huuuJt5nqogKezZpTAKABU6IaCaZOhj8nE2v1x0z?=
 =?us-ascii?Q?Q+OqqLH5D3WTGKT60HnIOn9p2ExLeBqvT26Vg+gYNdY5ibeVk1v9uU5j8Fzy?=
 =?us-ascii?Q?Phmjl7Nyh3B9+lBOrjX4Ma40l/2eHBBw55f2u7CefL+Gi7vjW/VLY0+KbNU5?=
 =?us-ascii?Q?iJ6a+EZ5r6Ttgr03Jn7nVCp61SYmyAChBLChTkye?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ff1b54-d6fd-4363-5586-08dde92f7810
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 08:13:44.3151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7jqsliURPfgYzZFHF1ShxpcGOGkNQu9H4D4etPjFNmOyJUd+mAwOW96CT993FWJA7BzIBDeVj1aZZDx8pcMjg3lOqaUQFVqugohA+FPsdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_011355_533110_70D971D6 
X-CRM114-Status: GOOD (  11.95  )
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

Hi, Krzysztof.

Thanks for the feedback.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, August 29, 2025 11:06 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>; Ming Qian <ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control
>driver
>
>On 29/08/2025 10:46, Nas Chung wrote:
>> +
>> +static void wave6_vpu_load_firmware(const struct firmware *fw, void
>*context)
>> +{
>> +	struct wave6_vpu_device *vpu =3D context;
>> +
>> +	guard(mutex)(&vpu->lock);
>
>Why? How could this be called in parallel, before the probe?

This callback is called asynchronously via firmware_request_nowait_nowarn()=
.
In practice, I observed a case where the callback was executing
while the device's release() function was being called.

>
>> +
>> +	if (!fw || !fw->data) {
>> +		dev_err(vpu->dev, "No firmware.\n");
>> +		return;
>> +	}
>> +
>> +	if (!vpu->fw_available)
>> +		goto exit;
>> +
>> +	if (fw->size + W6_EXTRA_CODE_BUF_SIZE >
>wave6_vpu_get_code_buf_size(vpu)) {
>> +		dev_err(vpu->dev, "firmware size (%ld > %zd) is too big\n",
>> +			fw->size, vpu->code_buf.size);
>> +		vpu->fw_available =3D false;
>> +		goto exit;
>> +	}
>> +
>> +	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
>> +
>> +	vpu->get_vpu =3D wave6_vpu_get;
>> +	vpu->put_vpu =3D wave6_vpu_put;
>> +	vpu->req_work_buffer =3D wave6_vpu_require_work_buffer;
>> +	of_platform_populate(vpu->dev->of_node, NULL, NULL, vpu->dev);
>> +
>> +exit:
>> +	release_firmware(fw);
>> +}
>> +
>> +static int wave6_vpu_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *np;
>> +	struct wave6_vpu_device *vpu;
>> +	const struct wave6_vpu_resource *res;
>> +	int ret;
>> +
>> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n",
>ret);
>> +		return ret;
>> +	}
>> +
>> +	res =3D of_device_get_match_data(&pdev->dev);
>> +	if (!res)
>> +		return -ENODEV;
>> +
>> +	vpu =3D devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
>> +	if (!vpu)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_mutex_init(&pdev->dev, &vpu->lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	atomic_set(&vpu->core_count, 0);
>> +	INIT_LIST_HEAD(&vpu->work_buffers);
>> +	dev_set_drvdata(&pdev->dev, vpu);
>> +	vpu->dev =3D &pdev->dev;
>> +	vpu->res =3D res;
>> +	vpu->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(vpu->reg_base))
>> +		return PTR_ERR(vpu->reg_base);
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
>> +	if (ret < 0) {
>> +		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
>
>You need to handle deferred probe.

Got it, I will address this in v4 using dev_err_probe().

Thanks,
Nas.

>
>> +		ret =3D 0;
>> +	}
>> +	vpu->num_clks =3D ret;
>Best regards,
>Krzysztof

