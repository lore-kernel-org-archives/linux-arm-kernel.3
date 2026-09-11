Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE7AC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnieAUYm256V+y62DKdeIfHEWgUd/qCGSfQgY/uC8Yo=; b=5D0RdQ5GnBe9WffItgkgDVXCGW
	fwVHX7vFF1dXK2rG1Rl170m2Y+n140imBbm3REZBolZpvwY4UnPNXH+Y86DHqCkMfr9TE1ix8y7FY
	TcYSCXJQcTa/iIYbQ3hoQajXgqOqjBdz9e2H/+XKemE8S1L+A+x+zPwLHsRzA8sczOE1pd1cvGjWw
	kdbQVwfEI9jdvYLx2w12N9N0Ic+bVYqENNEI5VNxvGKMBBzF9o86gyJDntKrI/IyBbS3Ob8F1OCvQ
	dGJool5Uu4HxUpnOLfZCGh0m/lDZRin/iG2AqGE/Ff88uEq2BQgbbVP3fX1JpxBr/l93zf/zRMEok
	/uV5IFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vE8-0000000Fyu8-3xZv;
	Fri, 11 Sep 2026 06:59:12 +0000
Received: from mail-koreacentralazon11021116.outbound.protection.outlook.com ([40.107.42.116] helo=SLXP216CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vE5-0000000Fyt3-15nj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUIsjAJGvQrXd9FlhVSqApTOd3BfMzqSEDckikkzCuVlkYjEmb2hENIOtARIv270p5qUd5WTNFmYLvDjPxnrfYMst+OTleLc7pWeeJ/FpjI+6msUAR1VBife6hkBu4/aJNh51bHtPbcm9jcNEO8/j1DLAR7NON+wLBdLy6GO2RetVrldrnVP0WnOfuuGzyTroMyFeTWa1v4yNIXTyCQaHbkt8U3Lp18q9jCRIL1pI5DcI1A2Kj7udsEMvkQpbMDo8OEKUPyUq14t3IL38zsaTLRiGMwybfdONQZGF2azEtphcPEBXbNpuTB6CNrpakWIBE1XIXm0240zL7Qx3pbhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnieAUYm256V+y62DKdeIfHEWgUd/qCGSfQgY/uC8Yo=;
 b=e8iV4iH8WCBTlCPT/88f+fAblvE9XxzuuX7tWV9tnPBAE7vx7zHvzvYDkI71Y2+l3vnAc95KDVfw82kCLj9UQcnBRbhc+EPp3UkxDneWBIX+zisKd6f+QBDtFmG9z3JvhRrMlSiApYqp8dvRzxu44YokYI32vr8KHBIrr4LEbYNdZPUT83FfZlROb+3gFfrHP+4UsXnFHexGVsviKSHa/CBLVOf0PVBkmHanLxtaXmxdydG3gEQ0+lfrcF/mzkHw2Az6UibYdCPmXbKt4nwIwhUwSK0KN5nYG4R/A68tIiBzMECxz8eLZOyr2QC6x1f9lZkqnPe7y8DmZtZmzpO+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnieAUYm256V+y62DKdeIfHEWgUd/qCGSfQgY/uC8Yo=;
 b=BhPXTOQyuqV2+HUIms33Pqy6ELT/NkbN0xx9nIaEjHr0JOybt9Ley9Xl2rKw3SaT4rz35LmG2XlRwZwdmM/x3Y3c2WNLA74jIqUSCvzIaaH6PdD6BRT+eDMIL1G20QqpA5BWJgLFLmOdKo46et4VNii+xoJGeduLyqEmILBBbmpNp6hsecz+ozjg7ovUjOQaQQAVDx49QtbVX6TwfJSkKvlFBRFKF/9Uj2b/6tjkgPjOQCoJ2go8aTqKWNPw18ijnwInWGQ4lq/AQO8vs1KbqWLDYpbFBt7GFNFQsSI7yVH7dFjE+ksyZOVhCFmN5aTJtGwxhripTp7cC68YNsrn2Q==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PUVP216MB904769.KORP216.PROD.OUTLOOK.COM (2603:1096:301:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 06:58:54 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 06:58:54 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jackson.lee"
	<jackson.lee@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: RE: [PATCH v7 0/9] Add support for Wave6 video codec driver
Thread-Topic: [PATCH v7 0/9] Add support for Wave6 video codec driver
Thread-Index: AQHdPDkmfQ3Xxo7PEEOXc8Pb1Z3T+LbIRasAgACzPcA=
Date: Fri, 11 Sep 2026 06:58:54 +0000
Message-ID: <SL2P216MB2441925E3AAF6FC3141121DFFBBE2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <aqMMap6NHllxh1st@lizhi-Precision-Tower-5810>
In-Reply-To: <aqMMap6NHllxh1st@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PUVP216MB904769:EE_
x-ms-office365-filtering-correlation-id: 66af2433-6dc7-48d5-b975-08df0fd224d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|6133799003|22082099003|18002099003|38070700021|56012099006|10067099003|4143699003;
x-microsoft-antispam-message-info: xpXIa97OowZU77ZJ8z/4Zaovyuqwq9SNn9rQ3u4XI5+mzos+xeoCQOU6ncl3XcrD6Gk/TU/sBs+G6G5X/HpxNp5mWlo8gtqS4HxldgDN4T5fVvMOSMNL7/hUa3SsHh/2wNwJPPURy7X8+UFB0hjR93mbuX1cNbZJ6VRfqFYDGZ5+AMIP3CQuLLOuxDZKKzEzGYeFSJMN0b4r8uyPvY+T8D8w2gGJcWlVbwB36FGSRGFoJeJfSbHdgF5xzBk70R20MpFJGiqtqehpCHMkpP6WTcW3IHb/kYbKjf5NYUthaY1IenEMfxK3Hfr+HoZXLj9FOUMDiZWGRs8i6ICZarHuXqBW1fOeCf26xjuFscM7rkCoQtA/enPHDYX5v/ZfrlHlnsjPMEF3gv4GIQLqS6ECTNMkWQp4LWIUzSUwJ4m3D3/rbUykAlvBqBi8R51ryDAluyrV4F79IuOxqvmCj7TOscLG9nuZtiV6nzKf8k7/4Mh+AjY4pq6wQHHLZFqKiA/Sn7PKilhvpsOmJxWKv/cxGTdBEG6Zw6OYz5+qpv4jyKOt24zbZrg1Q/jyvbvSWSimOTuexoTP8PJAhgxzUHOSMEPjyu35Nr0lpPhN2aE5AWUOYfgDYRfR7Iv3+RfssNfq6e7T/ULYj/Xz++PWr8vw5XLcUvc9E/lkWAw8DR0um5+wpi+T7hFqbnI93+kHmgLBN9PS5V8pGU+nSCmuW4Vt3tEJ1CHy4ettHNVUxLhiN0o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5VUbXj8XmVh/RJxKNFXaURQLLwJkph8epBz/EYqEYkOwMejkmp7ZNR/tI0tH?=
 =?us-ascii?Q?8REeH/hvJ6gYLbF5bW9DRKYUHQtSfFrN7RQtCluVrr/7yjAQCWWIeb/+J6cF?=
 =?us-ascii?Q?c631lmV/uWrths9LAJW70Xyi5wOiy/OxKrQNuKGmmyLMWEsDX/x4zvuOL7gb?=
 =?us-ascii?Q?LN+hFV7zkKenmjxDjUKO53YFsIw+2DfZYAf3fQZ79VI5bAYdDhHpYjmV5iOb?=
 =?us-ascii?Q?pROHAc6Pb4HWvMWrWRJvkHfOIfXJq8pGrkUxnFtYLs3cA/hFCxYyCsrS/jMT?=
 =?us-ascii?Q?totQM09BBYi6eBQZ8pIgee/aIfgHypnyVBxQameHZ5DCNavUWrI4d9F7c/3g?=
 =?us-ascii?Q?HDbAK7LfT2DzaW4s/lCp2ZQQtgBw/RvCUAYskplIMwcK0HWqHlI57R1llSQ7?=
 =?us-ascii?Q?csWj4gNoLaaFP6OgCbh0t97u3tAgcqHf7ow0Lzfr+xiXUJEmbX5ycOJ+roRr?=
 =?us-ascii?Q?4CQVwHuRIs9PxgzfAKae7YBIWdO2OOvGO6mTHh1wbHlqdPjXm8/BnzQxJJES?=
 =?us-ascii?Q?+5aDZl6uV+Mxdmdp1Rwepn5eKD0NfFtA+8ikCaGk+BvB6c7cbEykStXto6KC?=
 =?us-ascii?Q?kjOk5ROmGPkL45S2LT5/5GxpdaUt8uZgWMCm9vqjgLcmILHeTzWBEB0sOVX7?=
 =?us-ascii?Q?YyfO6Ap5bC8uayT/h7mTcCb5yDpNYO1cA4iKJbJr29sKotuRS5wCS7POBgak?=
 =?us-ascii?Q?A5jbFJyfh9BmkcJkvmiJdU74I7VH69JzkjM+/f83JBfezouzGDf1ke8SyMYU?=
 =?us-ascii?Q?eiWbz/jMBhK5o4rsk2HVhoLfXqsrq/dTNYx7IvwQhKyNFXzmzi2b8h5ZcKMV?=
 =?us-ascii?Q?EaoRRjcwJl6c3OHELKjzYrnw2tI8DnccuLFh54mqjC6tm7s0sh3sr26rhaYe?=
 =?us-ascii?Q?oPgwk/2L6srlrDtQ1tok8X8M8+UkXyreEOiKHaLld78RcExtZIQrGEOzt9C+?=
 =?us-ascii?Q?kaAMjm6zhd7miLR9v4o4RiBb5OjTtZ5aSQz7VyqSJAytbQIfwBRtR8JoU23+?=
 =?us-ascii?Q?0a1PWcTTqNXlIZq25nJbBFq1nmj5IrtmnsDTrnDJt076f/NMbG0rzySxdGwh?=
 =?us-ascii?Q?tY3KVad+6hqlzr3Ca8upgcHJAdwRpnte9hTE4GIihkbTj/58bKcuk1hylGbl?=
 =?us-ascii?Q?g1JWY7T54Dh8hbV7eahh6UjxIzvmo07IauyMMxn2D2m7Gt+zsJRDR4m+4JMI?=
 =?us-ascii?Q?TOneQ3O4C19RGLCKWL79L2yUy4/Q/3dC15iO5aY5I8Pnbb4rYWnc6fOAHHXG?=
 =?us-ascii?Q?W3+o9iI64IZYsxRHVrYZ1cuA8rsxhBRvFFJsJJIQf6466GrkLWotahcWQLA/?=
 =?us-ascii?Q?Yiwdw8/yr1DLCYDEPt8MHfwhvdg7exEadvlZSYcXm45Z9acVYjePTN+Kcawr?=
 =?us-ascii?Q?RxK8vlWI7DN3Frxr9yyQ0i0KVh2aSKgUTVr3qSihTywuqEQtRMBlAuotIm7Q?=
 =?us-ascii?Q?FImr2cJ4SfRwoy32tLx+vveUBW5RkbL6fj+LNR9xmIhcHRRJx8+U763mi6pq?=
 =?us-ascii?Q?PV2z9xv/sjUTrT8ANOrufTSKaiqC4og/IV/cG7o0Nt0f/z9bB1XlTxhXrpro?=
 =?us-ascii?Q?bQXl+7dFFv1JEwEtEMBcRpApt/pyAoVWci7B9NqLGCZ3CRpvYfXEkFv6RjVO?=
 =?us-ascii?Q?YvvtYCT49E2TE+mCn4iWBuzwg4d0aOu5bY4bQAq2RlGTLgLC6HUqOu+maGdv?=
 =?us-ascii?Q?4jAhR+WyVIYXevfSh8Is9Tb5zB2/9gtT97G6i0EZPLr7UowkjXtyky8dfcqh?=
 =?us-ascii?Q?osSf7yjASQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66af2433-6dc7-48d5-b975-08df0fd224d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 06:58:54.5050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8+DBeRXkmtIGHQVOTredRA2LxDelrkhU3V00G8EYrvcobRGGNZOv0gthUoBCJn/uPdW2JnqSN5TNm6/Qxu2UVoBNxRAbPbr3mabih8Ijpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUVP216MB904769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_235909_648925_5820FDFD 
X-CRM114-Status: GOOD (  13.32  )
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

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, September 11, 2026 5:01 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org;
>s.hauer@pengutronix.de; linux-media@vger.kernel.org;
>devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-imx@nxp.co=
m;
>linux-arm-kernel@lists.infradead.org; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>;
>marek.vasut@mailbox.org
>Subject: Re: [PATCH v7 0/9] Add support for Wave6 video codec driver
>
>On Fri, Sep 04, 2026 at 03:46:26PM +0900, Nas Chung wrote:
>> This patch series introduces support for the Chips&Media Wave6 video
>> codec IP, a completely different hardware architecture compared to Wave5=
.
>>
>> The wave6 driver is a M2M stateful encoder/decoder driver.
>> It supports various video formats, including H.264 and H.265, for both
>encoding
>> and decoding.
>> While other versions of the Wave6 IP may support VP9 decoding and AV1
>decoding
>> and encoding those formats are not implemented or validated in this
>driver at
>> this time.

...

>> Nas Chung (9):
>>   media: v4l2-common: Fix P010 format info
>>   dt-bindings: media: nxp: Add Wave6 video codec device
>>   media: chips-media: wave6: Add Wave6 VPU interface
>>   media: chips-media: wave6: Add v4l2 m2m driver support
>>   media: chips-media: wave6: Add Wave6 core driver
>>   media: chips-media: wave6: Improve debugging capabilities
>>   media: chips-media: wave6: Add Wave6 thermal cooling device
>>   media: chips-media: wave6: Add Wave6 control driver
>
>This is quite big drivers. You enable build at finial patches, it is not
>good. Each patch expect built-able.
>
>I suggest split
>
>1. core part with simplest decode driver. "You use git add -p to choose
>which trunk to add"
>2. Add encode part
>3. Add m2m part
>4. add debug and tracing
>5. add performance profile
>6. add thermal cooling device
>
>Maintainer may pick subset.
>
>binding + simplest decode + dts can be merged firstly.
>
>Then gradulately add encode, m2m and other advance features.

Thanks for your suggestion.

I agree, except that m2m cannot be a step of its own. wave6-vpu-core.c call=
s
wave6_vpu_init_m2m_dev() from probe and wave6-vpu-dec.c needs
v4l2_m2m_ctx_init() to open, so it lands with the decoder.

So, your steps 1-3 become:

1. core + m2m decoder
2. m2m encoder

4-6 are unchanged.

Thanks.
Nas.

>
>Frank
>

