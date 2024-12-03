Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7112E6C619
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ovzw4oVBxKJdsVrMXlBe6NPWdDKNTyRgcuLxZrCYR0=; b=Hcp6yewBt+0jlgPHfACzlyJmIJ
	TlDCQCfNLxXT0HOyAO5NfkuszpcvUv9Or4MO04x2DWpsNXQFRAdCccOcAVrM4LVOnzKYteVwNK1Rq
	wqnbaOEcXJ1nGb0cZf0RghG8XvF2l5SYDrT37vGlnvyeof3tP6MiLkqk9JcD4hjVlJ3oXaMJlydjL
	XrY4SzWr1v/xpm2yjgd2sn44PWhEoMK2uv5HpQs94ociPdO3LAY6iNhCrhdyYLDHVchFJVlrssnfA
	+qbc8DwF/Se7ubBnrH5bLUUYqwSlgrdaAivDTbOBnVmuCml09VQaKp3hd5UqxaSQrIeizfjyPy1cV
	5kkOY/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOLa-00000008i15-34UN;
	Tue, 03 Dec 2024 08:33:30 +0000
Received: from mail-vi1eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2613::61d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOKP-00000008hpL-3BiL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:32:19 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bHMZEERT6idGlU/WN2Dn+7xrpR3Mj1zfXeQaXQUYuJqRygkicAfqaQr0rQSWJRXQleuy/fYHIGBtE1ruM5Br3i4tq2hh8+DsvF/SOLTRpqQr58A3ZemfuTAkm3U2brGFqQ9sSLzlepQpXKo1X/e/Itre0jG3VcfXM02SwMvFT1oYVrqBL2q8tCkvs/TwTLNi5L97OU9DR2W46QjjZ+d3Bckx18vKtj+MO/c7FQi6kVHFa+xK3clNnu6f0Uk65i7JjLL49ZJUuFkKZRFTgKbFeUANyyzY64DzYChG+WjsLz85ZWlOKNW1s0rTN647h8QG9KHac7KEehRVNVhqAdbkzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ovzw4oVBxKJdsVrMXlBe6NPWdDKNTyRgcuLxZrCYR0=;
 b=Y9O9NL4/syvOcw1WpkmvykKs42qqM9gq4yLvqHXOMgWUCbN2Y/frgjGWuW3/Cur2yV+CWAxSBE6zF1IuUppfgPRgteojf7f5qbDgj0qGICGdJytukyUVyinzf8BTl2UE8go6U1Up6S9nP7EFcUH1e3e46ePXl2GkwceKZwrmg4CJD8v+QCu0WdAYu0z1PBPrGzyi/QHeM4IcxEeqWVQPuZD3HXWzc1wnRMtQWN6oukZfTHkRnnwrC3yy4xxUB5JiokNzVMsXBzT9AkJX2V2LtY87vZS3Bms6/NianjKzmFymfiqu9Gp15gCCHVAb+JOXMCsowar/9nPJeMDepvXeLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ovzw4oVBxKJdsVrMXlBe6NPWdDKNTyRgcuLxZrCYR0=;
 b=p/e5Qn7q8ZDKF9+XngsrqC7fQgGL5KW0GP8qfjN0s9eYqNq6M4bbjJSkuJcf2ER3WcYezZ+zwQq/bd91bEkQIjT6Iw2mfCO4W5mMXltIVc5+UfYh+J8SceaO/4lmezRvNgZXhkowOBoF9szUoh5vFoqfhQQiF+MRu66AC5Q/HPg=
Received: from AM0PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::29)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 08:32:10 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::ed) by AM0PR10CA0049.outlook.office365.com
 (2603:10a6:20b:150::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 08:32:09 +0000
Received: ("Tessian outbound 206fab1c37e0:v514"); Tue, 03 Dec 2024 08:32:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63d13b2edf158995
X-TessianGatewayMetadata: 6idn/wc1W5aPcQPxdEUmG7UKUYesjo3IgxIozACPB+rSudKWn4JLdzOxLeeQSN1qZgOzHKF83oAZmv+0jUCl6gTnrVre88T47QYzSMquvgkZFTp9Cfe4fIxPLO37KcR/GvD/nP2ZH6sm2HjYHuRz/UULgF+Qao0puW3FpvHmShM/BclFHYH/TANbjsiEngQXsvZrwZgIBPaT2vybvqxvFA==
X-CR-MTA-TID: 64aa7808
Received: from Lf171e610a83f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43CEDD84-68D3-4C8D-92C1-4940468DFC96.1;
	Tue, 03 Dec 2024 08:31:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf171e610a83f.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 08:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peoCTb3KHXFxbfhLFaaf+0Yamh0tl8nu9DvJPrp8u7X8LwJG9Jk8eWnWMFR+11yMxu0pmnZRLYjoBtgwa1lF47qMRRKqv5TUXzL+80TQb1rEFORLuzHIkodX3z8qYhW1STjhnHSvZc0veVG3DyYi3uNSOQN6A6tNamOKMscZl9Fs7y5a9Ka13ezGr9epcnEZAeRhQX1kcEQnDy1hkMURHwADtSsQetYM/cvXg6SZO9xRtjYTq+MFXV2Lizlwz/lQ2UgMUJn9xJQ2RiL8ERWMEGMH2OTwOopjOUz3hAH1lJzdgZOExloWAAEx8l0eStbjM9kB3fWKBeVWW3UEriJRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ovzw4oVBxKJdsVrMXlBe6NPWdDKNTyRgcuLxZrCYR0=;
 b=gV70LC+byJc4XWuLkgKByjnC7sMEJYTQeP/nv92akaYhXK0OB/+ve2lqYVHL4At4iLtycY+BMByZT5fci3LtWhpXNyfz9w/DUfDvIOc6kwVGw/mTPSzKki8sCmubetwGehlO1yPn9N71Ium7KH9Z3wY5DQDKnnjXH7MrXcwejkyNzsOs4X/0mKdIVf6nrQYvqcqJXVBbU4OwIkr/Cfwe5kWAy0TEhx2mZTpPbmc4hUyPOGDZzzYMeJCiwQ76/vmtuMsW8L/aGvaSBBqo8gv+sxPTfXrzgIQ90EZS10jZy4/knCNjvXY9mToSX0A6j6GrdMX1H7Mfh6skwU7dOouA1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ovzw4oVBxKJdsVrMXlBe6NPWdDKNTyRgcuLxZrCYR0=;
 b=p/e5Qn7q8ZDKF9+XngsrqC7fQgGL5KW0GP8qfjN0s9eYqNq6M4bbjJSkuJcf2ER3WcYezZ+zwQq/bd91bEkQIjT6Iw2mfCO4W5mMXltIVc5+UfYh+J8SceaO/4lmezRvNgZXhkowOBoF9szUoh5vFoqfhQQiF+MRu66AC5Q/HPg=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB3PR08MB8795.eurprd08.prod.outlook.com
 (2603:10a6:10:432::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:31:55 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 08:31:54 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
	<clrkwllms@kernel.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>
Subject: Re: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Thread-Topic: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Thread-Index: AQHbPx8vuTignQOEcE2iGTau3pde/LLLYBwAgADpbc6ABtjNgIABGYcA
Date: Tue, 3 Dec 2024 08:31:54 +0000
Message-ID: <GV1PR08MB105212FEF9251CA2B3AAF7FFFFB362@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
	<20241125094816.365472-2-yeoreum.yun@arm.com>
	<20241127120954.0facd34f@gandalf.local.home>
	<GV1PR08MB10521520ABD7B72D92FD60DE9FB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
 <20241202103853.26db0c13@gandalf.local.home>
In-Reply-To: <20241202103853.26db0c13@gandalf.local.home>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|DB3PR08MB8795:EE_|AM2PEPF0001C70C:EE_|AM7PR08MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f17f241-f37b-496e-3671-08dd1374fa6d
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?BMPQdsEu/sZ8SHA8VamLxwJfxC/Dhk8spbMAdE0AuGtONMADs/DjcZFzfk?=
 =?iso-8859-1?Q?xaZ1ZJXgq544uId+Ye4mZoMatEo2IccDSZ6mm66hiexBPaDvqykRHqwkSS?=
 =?iso-8859-1?Q?WLM8HfccNPvWxanYv0c01mbaGgCHzpIGv25bZ2nm37LQPezprI7DHpnIuV?=
 =?iso-8859-1?Q?s3wmUExlOQOkEG3b4ovpSDglziFy0Pm6pd4WGE9uVXbLXDzDIdZxAp0eHA?=
 =?iso-8859-1?Q?nwIoXBukYBnubHszXsUV01FU+WzgH3GIJHzp0RObVaBpuLkWYKu3KafhT6?=
 =?iso-8859-1?Q?74zIAS71Ttz5CR8jafzStrwXP/zat5A5gkKUYNSOCchS2qEIDmxmI+75/1?=
 =?iso-8859-1?Q?W3mIuDU4wxx6vMpwN3OM5D8aFcDF9K18MGgP/hNyBFPhuaAef8NBwgmEX4?=
 =?iso-8859-1?Q?KsCMxT0pwznp/yEDUkkhRGinHN0XqkC0JvOSydZwBnIyzFBqrpoKWud+bd?=
 =?iso-8859-1?Q?FQLDV5fwWV0FPDACYSMsp6Hs0AUUpSEpVDDqCQ1wnVY3+AYDqnl8SIIZDH?=
 =?iso-8859-1?Q?NJOEk/05Adc54/QbDV3hbPydKVKO1B6CHY7N6Ucg5X9z/yXJ6L7ToU7CQb?=
 =?iso-8859-1?Q?c4+ug1QKhWTG/xXbHfQYCGQrTzP4tor04hsRPEF2lX9YuObIbPqX+RKrzx?=
 =?iso-8859-1?Q?J3LGvRABipI/RTMosGMVZQs8BAH4t7k0zoEHiRgmzOHoYJewJYrAlbX79g?=
 =?iso-8859-1?Q?QBi/g9GwobiUAsC8LdHmbcW0BZAVQ1Ly0iqN9ooVHW1we/bB1+7I3FGSGI?=
 =?iso-8859-1?Q?V6VFiH+8lBqDzhGexU7sB1dETGQx2wJv1R9jcFkasHEZi2k5Lo2k8G9C2H?=
 =?iso-8859-1?Q?m1MnDSlR7Qu7+2ZSmCMUE+VBdPrqPmEVJZPu9lJcB3efivvRyROTyP0dcR?=
 =?iso-8859-1?Q?bKZJbZ4UJy8zcFCVUzXtCU3YdI0OGOPQZ3rUTWi3m+GmPR20bSkktk0Fpa?=
 =?iso-8859-1?Q?+A9bTYyQAW81qymNbtJGppQNl2Vf+Gr9oor9WPMqV2GixAf9yGIGP3uhOv?=
 =?iso-8859-1?Q?5DcVnuLSDE+bjkn/UQQICJ8vIOVX4C/l48ddd2CpGy4tpzQMrn0dSYQRJR?=
 =?iso-8859-1?Q?e+Kva36VWo5rJ2gy36VJp2ot4A+V5DuWbn39VuITdoK3uJ9kSRonu8TxPm?=
 =?iso-8859-1?Q?S2fsA2x6R5JHEjkRMdHWg4vaOe55sE5E70vnYIr0Ktio9DywYSYSm5yLgF?=
 =?iso-8859-1?Q?tR66JEo7ibARb/1VDZyKhT2KT4m+vzH+R55AP9fq7NxEuQKBW6or3uY5f0?=
 =?iso-8859-1?Q?6PZkKMDKouGTZDrGLyfLF2T1Kd7wgoJVLDr47AvPZwIJsCtvXEt2qTR7gL?=
 =?iso-8859-1?Q?M0br9lVjS8GPWmnH+2vkXCkafMtO9ZKaWYD1m+TA4vTQCylNu74c6MuUiD?=
 =?iso-8859-1?Q?0+3if/RHQHz6YABhzo0901g2RDTPiCsXuB+CrDQ1Vrr/D9jOkoSXRrrdpX?=
 =?iso-8859-1?Q?QszNhjPbottkhjhyoFUjlaV4jSH61ALUJuXYqw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8795
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b1c7170-b885-4190-890d-08dd1374f18a
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oCEz7XNjJBqneexE+0NHP1m0fhzuHZfz+RXw2pVCyIX3RaZGmmPu3TQq6x?=
 =?iso-8859-1?Q?E8/r/9OQOdprhPio9/BgQD14vK2w1Nze+4CdXnIcdaIdalHNYysn/j2RsT?=
 =?iso-8859-1?Q?gii8KDTlffCLEQG3SJrCskAe6Ecdtoxo7OjwVa0Ys0107i2vDpcuo/lf3y?=
 =?iso-8859-1?Q?Q8DIPp2gwhpr3SzJdrjamOHCR65dS1MzyJnugFdQo2F8LijHdoKUNCdRFG?=
 =?iso-8859-1?Q?NEmRlCVHcoB0+S/rbLsN68ck6bfq4QGDgVjt2sm4F8Mle0qGYYNsy++mnG?=
 =?iso-8859-1?Q?nXBWYFzHwCTER898p1KdHv29iraaukxEGvqXxntq25iaK/tY5cKxV7mAMk?=
 =?iso-8859-1?Q?NoC7XmKFuBQKD+2IAcBM97oQP3aEMQdpfCffTiIaXXUgjU3nyPwY0ik+ck?=
 =?iso-8859-1?Q?7+mvAIvP5iY0syPZ2jb6hCcatWtQToLAkLgAWVDeinNh/bVIzEDy95BEnI?=
 =?iso-8859-1?Q?j57TuwKy/m3IhkZvV3nsEt/G+SMgtR1Mtjf8JtbMrv2MFirXwhYEh2Q9nK?=
 =?iso-8859-1?Q?noeWkl0pRhT2wulxhC/lFqo7IPunzYyQRv1jSnAS5qcRmuy1XSGc+uMp9M?=
 =?iso-8859-1?Q?cBCtGky47i87ipu24ppPYNbouM7FZCWJSFvJheobAZRAEdna7qWV1FkFRz?=
 =?iso-8859-1?Q?pUoqIUpvzMjkSnRYRI3V63++bNYiFoquaTMgd5LE3BksTg4zQjw2iZol2J?=
 =?iso-8859-1?Q?dHTr5b6aruLV+hC22C+5LlN4I0jX83o+ln5a7qwZ5eYXVeIbQ8gfkwl41B?=
 =?iso-8859-1?Q?yIPVbFXU/wkxyJWmy146+gj0UleieYY/YbJ1S4RXfWytrRqn8wKXRGv2r6?=
 =?iso-8859-1?Q?SEl4eCPNucIrMTc+mvktpzwpYKygPZ1p9A5HBubJij3Ugn3d3KkIKpqnkF?=
 =?iso-8859-1?Q?7fVrzw7Y9P0uguXcEycBEqqaVlOSS1W/qZfy32NrLvOG4VCbCC8scnm6Cl?=
 =?iso-8859-1?Q?/Esp4xGcWkQZd/FAlpx6EKZ9oIcaNYMz8lJ7oOF8mfOhw+kTFwZXKM6Xbd?=
 =?iso-8859-1?Q?mfz/0ybaBlXlUowvCqGGo/erLEeKqVvKPwUTmJ3sG3ukUwt0FWJKWs0ZZL?=
 =?iso-8859-1?Q?GAjnpSmK+yEssnucncpwq96bmXNbYmjFLrMXcyi2DV1BI8lldyKm5vf4K5?=
 =?iso-8859-1?Q?CRBsbnKSqx9dmLcATyqwybwuyar/nwCnjjZJI7EyGf0KfmFK2dJ7ZhR2em?=
 =?iso-8859-1?Q?Fm1TcewTBVmGNXpm9MFUx4gRIyUJaE4LKwnAJ6sctXDnfTXk9e4P5NmTxM?=
 =?iso-8859-1?Q?Jib23GRuCZrM+Xf0D08mMUNRh+yW+ezhdHpKh7c0sUzCdp4lEATLYdcIbc?=
 =?iso-8859-1?Q?5Yq2ffJSgpi6O/sVVho15kjVoTFOf4YuY9CGaTrA5z2OGSs+yvjZu+xCca?=
 =?iso-8859-1?Q?6BfM/BOiQKBXIA9QMZkca6uP2elZxyRK8MliXOWszmEdTH6uLUdU4DG1rW?=
 =?iso-8859-1?Q?DGltlCRUo5K29Qr7BE+0S56lBM8d+rxNnvwPvVnKFeo5Ck5P0Eqr+PuBf3?=
 =?iso-8859-1?Q?1KIzRRfQ3LQBBJDWueyzTJ?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:32:09.4605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f17f241-f37b-496e-3671-08dd1374fa6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_003217_852704_4F82281D 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

Hi Steve,=0A=
=0A=
> Still should be documented somewhere. It should describe the maximum numb=
er=0A=
> of feats that will ever be loaded. If there's a max, it makes it back to=
=0A=
> O(1). With a 'k' of how long it takes to process the max number of feats.=
=0A=
=0A=
But with other patchset seems better=0A=
since not only this function, but also for other functions too.=0A=
=0A=
BTW, is there any example describing this I can refer? =0A=
=0A=
Thanks=

