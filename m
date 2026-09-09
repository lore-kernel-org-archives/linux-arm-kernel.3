Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FFBC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pJrEqWo0mLWRGOdSDClNeDqWhy1UIfKpehsrdXbgOE=; b=I+2VNIPijzMKLkmMixfS0UeW2/
	goYDQme+38IJ1OWPXFY2FVQ2hE9cm39QAF27gB6t22AyO7/0bpL39wyS5eBaWadhNWyhE/BuV3vbZ
	ub9fqlBF3rCsCNsyeoV3X1zSUkgt3g4/WfnXZxlJXjq6JwSVxLk+9yOba0bvr8H07v44tNE9Pozgv
	EscXhY9tZ2jeWGYAjK4jsV0DTnVW3Qi/8d/BPASmW7WCjpA0v0/z2pIfQLvddJhsKjqceNkWEVIXB
	hjrWzBd3rEJabAtKMLNhFTB5E79UmYtrXnbXm3ZVC9FgQw/T70hiSc4K39ztTqvRvf7fbX59gDlQz
	l0+Yg+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JSy-0000000C181-2qP4;
	Wed, 09 Sep 2026 14:40:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JSx-0000000C17a-1M2v
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 14:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6pJrEqWo0mLWRGOdSDClNeDqWhy1UIfKpehsrdXbgOE=; b=BItYd7ny5SN7VdU8ZQlRIkYsY+
	tLh/CWOeDzb57fOdXhiCoSruKwVKiSX1cEPWdsZwnjAC3TDgb/UR9xHsqo1G2U6WTQd6ckyRwV/dv
	uYwj8Fcff+GJ84LSDcp6pv7/Rxw+bZPdKWtk6jzkqfGVzgyMR1oYklzAIfoqPvehjulsDq7uTtXnF
	gRyx39tB05n0sMR8/ZJ78MYyBm0o0KkfPH2iWfjuCbA9NjeXtjCvHzR4zroWDfJSIz27J90mvIuBp
	eak08xIvDHF4/8tvWrqKQaarMagCUGLwceIWqlMSIVIL8UxrCy+Tl3aTXIQoyLO9KqAXFpL+JffT9
	rqC6wpCw==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4JSu-00000001JIK-006t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:39:58 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893mxEb584136;
	Wed, 9 Sep 2026 09:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6pJrEqWo0mLWRGOdSD
	ClNeDqWhy1UIfKpehsrdXbgOE=; b=MBRgwD4fapZQR4S7b9YTf+nki+lUjkYRsU
	wYeIEeVnltZ7jAAjgQyIDrss6P086PdowhWkQgHIEncArkeqdqeSr2LDLfjnf+eR
	yUV73uN0WK9UANczrqo9cercWFcxLxKIrvvJilYuDbMNtsYc5tqyeGcnDTxsp6q3
	P1vjHf6HJi8a9EcQJFrPHhnf4qCPmZfS6z+CRdZIeNjaJ2NPfbp8450MJK6RY5x1
	hVL3j57sk8b3OYcWN8n9pEZTC6LKOHkF44etu4b7tf+QhiCmSb5T9aA00FjphK00
	tgqRnfhv9adAyQPJdRJObFuls57V7B8f2KgxMtV12Tmlm4y8JuwA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021118.outbound.protection.outlook.com [40.107.208.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjw5pq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 09:39:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ms88K2otvIGb++fGCc/6FWWZXjIV7gy8uBdy6OQIKrIZ9jgK8g13tuyLi1lDgDn0T9JWF9c2ipvwsP+S+2GArwuZ1fkEGcLFyp3OuhyApeaNK+/D3y9lPD0YHyQTa+de9vPc2w077WVSIhuGKPaNuYgIO+5CYDXvkQmMnHSTxbl+Cv6ojYXlFWwEokUGEJD/y4evLYQMGhky41BsrmTggJOwohxAINSF0fz95xJSyE340BvAo1N8xAoH+Kn7AtT1INGPhhfqlUiI6al7Loxsv8RowLxh8QXgf6NOVTTUMwwIz758SsMAN6+00GIWwlIGHUAMf/De6PDAIj5z4d/bXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pJrEqWo0mLWRGOdSDClNeDqWhy1UIfKpehsrdXbgOE=;
 b=ffaGmWBxnIKE2GGuGuthLW3ERNrQvMGUQmeqG7QvKFr6qOed+VOIkmutNuwMWhqpzM4LlkLggNJyuGd8cTVbUQSEls9dUvfu1i31mcqhqKIoJf7VLFg2apMtjS2VMUh0lAzQd65gXNiFU2ReeNSTzQpixaNkdKhtbmi9nVAS9xmVTecHoLQ4ObjmUxjpcIx7fQC6DgoA+KpOEQSMi4HUGcRwJAT/AbKjZ1EjS8GrXnFdx5nEAUC0ev9LiM/GTOFOZs6tPodKUS/WDjlCfwiRsa5+S9iCQrYgv5v6sBf01VgrWL8VZzHV3ByoWO7ZP10QSe/W/E+uXBzN7vJD3YFr4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pJrEqWo0mLWRGOdSDClNeDqWhy1UIfKpehsrdXbgOE=;
 b=KtGaRaXx/vJnfbpCkjIQ/2VO6GcVbQMdMLvqXe7S0Zzed8rMIhQVzeCGUPj22fYPbs06Ao/s2X3X/5HBHuskc9Gg7JV7mesBH3krys9UJ4MBnHYhsxu+BgCEOMfM2cm1xQAqY/JFETLDD7VmsTbArzUi13t4sQuY959bQxyyyYM=
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by DS2PR19MB059743.namprd19.prod.outlook.com (2603:10b6:8:401::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 14:39:12 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::50) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Wed, 9
 Sep 2026 14:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 14:39:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 96C1A406557;
	Wed,  9 Sep 2026 14:39:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 82F0A82024B;
	Wed,  9 Sep 2026 14:39:09 +0000 (UTC)
Date: Wed, 9 Sep 2026 15:39:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Sebastian Reichel <sre@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: [PATCH 11/14] mfd: remove unused wm8350 driver
Message-ID: <aqFvjLMp+NpH8Ixa@opensource.cirrus.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-12-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-12-arnd@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|DS2PR19MB059743:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abe4302-c6e7-4934-04ca-08df0e801cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|30052699003|61400799027|36860700016|23010399003|7416014|376014|22082099003|16102099003|18002099003|5023799004|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: CjnWSTDnaPoG2LIh/5k9rzeVss2Qh8ANuWh+uPKVLInPXWloWtD5+VfZsMb1xIezrDPPR52oYzFpX5qU0Pa6zL/aOOh9n857KXUD8qmqXCxlll6zmLNg/6k8X5yijcy/JqzwGiTZ7Oyeory69q0sLN5OyvVf5BWRTWESv0GShAeVDZqSBVyKJcr7UI3EDY7a4IcrqKrvvrTjsj48zw292hH/gRxkQtMEt1SkcDhNmxOOEn8RjxS05tc5xYt50PzkVaNSZpOerRIV8FrAqnP9G+qIZdqx2wMb+0I8wBa2Y/NgCREtpNsgG2jKRPdbSW/Vp1bbZlN0vhQf1k0JaASOI/d8LxF3RljsrxOpD1Ey6puefN2jHDbQKL1la7/DivZJ6ZqM1XmkYItWoO8+p3U7dfUmaLFXo+kv3fz2EO1Ef1TGLCcLnHRYEofhLBVu/E6j2cZgFcBUxzNxKK5op8clIO+VNopHLOKjOCZWQm1zp+OkAV5nsPokarmvCov+jN0Wh4QLBlIW6WYdAq2O9AWCQxeBtJR5bNNXO8cILAnj7ZcRGnJqkU/rHnMwikooXoXUigLE3kGHYkyPoc2FNfyqNolICPZ3hgoSlesfKRoFzvOs7HlKn1CiU+VnYkTqZIdlGAVwesBo1KrMRoPvhV7xXEAv+4DlIMRXg3xfujo1keLYAI0Za1bjUijtALFGAnL5dYoK03tV7//A0l2i95ZY1Q==
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(61400799027)(36860700016)(23010399003)(7416014)(376014)(22082099003)(16102099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Dp6J0K8V8bwzYsrX6EtjW1JexDgYuzmoByCf4ADwn8D4ry6cFUAr0NJZ8NFIhbggTx0o+aNhQxQ/fIRDK/0CPesGojhk6fsf199yF36ZiLb9JHZFLyxkqi9c9KV3PqedsIgDFP9uHu1nN5yYFGeC09FDHyEA3+y0WpmwGBFsx7RWKJmGwzXkoG9W4V7U8lOWtgIw6yTL7UajI9gG5smLrYGH9lboPyJRqbZax8M9Qo5bG4FgZnuD7D68lKmcPYIeerSVTi2L5LIL/xNQdwgui8NGhgU3CaUTmgkvqASbBzd8/kGvRKkV1x7lsOJUTK471ci8BGG2hAKgw+kwLKCkv6NzrJ3TAQHlC6tOZ9S9qqG2RfDCOZmJsm5LmLyKT/tg9au/4D8SEhYhJz1Qfk0JWXmoI/0of7o2vQHP9wW6VXPJVAScLlt12JwyzPnF9Wgx
X-Exchange-RoutingPolicyChecked: OO7BmBkMvypYphj2ThprKYnqyZdH1kCjE+qYhXPte/N51DTCLeqniWsHQ1csDhrC+EzVytjg0ycvCvSoPkRtKFYyGN6OVW1WcKhD6XYYCM4pt/k6D+cCfU8AkV75zv9t5gmrO2xhcwKKfUVugt2dhn1srYReseaZ6HYTTceaVKKeyD/Rt27uvfulO0fEjMYmINh8gNkY9GaJ3euXULcUMTu6xhbpkSMh5vt0sH9ADRz7Z6qlqRt5dkEYahvYZVVlX02zgnM7umQa83NowziBwIfyx9OHM7KbubXKil4TuNGdp1uUj8zrkpcN66+pua0N8l1Zjklrep5SF8dCgE/J1Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:39:10.9901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abe4302-c6e7-4934-04ca-08df0e801cde
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB059743
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6aa16f94 cx=c_pps
 a=M/tNFvKf9qcYTEXzCPs7dA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=xo24t3wAf2OcpJBrjYsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfXxpr6vtb38lrz
 JHQh8AsZCrBA2Zzw6SbeOlctGrzgQihsOUvP5DEbyeSqDQQkjSVYgo5KULdka0D6fIv7eH9ISgB
 4g7a69XlgolKUVLUc6bm5i0q/jPBXsIMFQn8F3xTpMp8XrzSs8bJkHRg+kyqkgeBgT2/rFqAPre
 vu8G35ZX3Btr2r4Jv0rf1pON9s6ARTtSM56ndpJNf8kgKUx/44wuQbqqOAFXxyEDY4LmdAZKKo9
 mbPnkHV1WB61iZBQZn+ZOrF8wQw6vDC2b6PBcC/1ecPgu5UXA0KyfCr0Pkye/HtOYPoIO9FyDAJ
 aPz57uYx/LadBz0qHfQX+ydVkCcbFa6FojLVNNaMcdVA0UmHZkPm5uxXJdCyGYpe7Dt9R5FUT+u
 +NTeeiklKQWKjQfYidxj59jtRCdE5AJYJ6p+1RSzrPlYTIGAVvLsup8knaLelCHYKZjHKBkwuY9
 o8Bc67rcqnmeuvo5Tlw==
X-Proofpoint-ORIG-GUID: xGGMELUOrrSqA-l5XsinEeHFr4DsjBiD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX2yQ34r3LFjpL
 a2K/xG1Z/tvgptxD3XKM8ovGE5nCPN2h0w2UMXgrRH37Bi/nBMfbdta1ctXI0k6OSxsXx/R8LBz
 RG9IJ1GoVJ/ma+Vyi75id/7jgzQIWqk=
X-Proofpoint-GUID: xGGMELUOrrSqA-l5XsinEeHFr4DsjBiD
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_153956_400126_DE70AD56 
X-CRM114-Status: GOOD (  18.40  )
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

On Wed, Sep 09, 2026 at 03:21:48PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver was used on the i.MX31 ADS reference board from Freescale
> and the smdk6410 reference board from Samsung. Both used platform_data
> based driver probing and are now gone from the kernel.
> 
> Since probing with devicetree has never been supported by wm8350,
> it is clear that nothing can use the driver on an upstream kernel,
> and it is unlikely that anyone is still interested in a devicetree
> conversion, so remove it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

