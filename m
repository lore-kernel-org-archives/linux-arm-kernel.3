Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3B5CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBMGEjC4S+OOFv6qI+KY/QPsuqaLtaiQYbRHFAuRiy8=; b=P03YMhRUlQ8WpWR+04vmJ9zyl8
	IlfpvL2vVEMRUY9TCPqBJMJQg0Ljmpbov3RscI0ULygKsH0Cqzx4wnoj0UVOG4wnMlNqFQu+hccqf
	wG6h2qVzSCNeOYlCMpatN32tnTdLSwf33NbPhEKMyKbOMTmvevo98GDAkuTLrwFHCkpcw3ZzOEF7w
	BQADkhdKWSNM/Uorp+ugKoJPAKIveJl5LmyXH0t2EmmHueS4wmyOF0sAa4dbiFMGAxhT7HK69xHis
	jdX8lYExNnJxfiV+00qZXCbbEupg2P9XawSHbkGk1ua7X/5/9MbosX2v2xKcyb8+WK7CQg6+e/asV
	6hM3RE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzos-0000000Fhzx-2Ekd;
	Wed, 14 Oct 2026 14:19:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzoa-0000000FhuW-0K86
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 14:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EBMGEjC4S+OOFv6qI+KY/QPsuqaLtaiQYbRHFAuRiy8=; b=jLQwm0KVrErqwzHLrM8GidvnvM
	U+uL9CezKqYn8Ig9Yve/thB3mNPvvFk9I4bcewWvIcFxFwTCxiXSaKWKrwMxuJ1uMOLSuYbgL5Hgq
	P9YlKbMdL4Ij2feHITe956jrvCdU/x6N7JCbf58K2Ke0yDOw4dwHE3OR6mm7UwocmxTE1qqLJOrOx
	3GSApWBf6P1C4QPQo2tNJAl9PQ38mhMJKpfQSpjXivyN4ysrGO0XpTmG5POeSbgZx3vW7SUwwKhAK
	gChYFXD/y4q61nvqGxtU0RD5z2WTBdHhbcb1/Twx/pTDAeON5rB9TVLwUcUxfCTuvSRAn0727Kddh
	t8R2tvAw==;
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzoU-0000000Gs69-43MJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:18:42 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDuZJc2737369;
	Wed, 14 Oct 2026 10:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=EBMGEjC4S+OOFv6qI+KY/QPsuqaLtaiQYbRHFAuRiy8=; b=gVXXi50
	oW8xDYUJRaQSmkRW7tnONUvAChRp/KpbZUeqn8pVJLGxXffNWPMMRVNcrTxUDT0p
	ptUxoeeokDLnP1N+S3t/iw19eKvv33BZKIK87GV0STkL4PLHIaTONxSPPo1FuBDG
	dT/i4yYDUVf560qoQ07d5BUQrnFs7kN6j8XCpQ2xJyfhzrw9iT8ZdsHqhY70CNIk
	ye1EgFdtohjKNLzyyRx4MObuJ/Yc2nkYNNLxLeNiB6/bDm6yOeRHIoaxOmvKvZc+
	aq1firUbrDG2wsVCx5+EXIAn6RDHFfcdmjvJtRmFRYHvsIinQA8snpM0ikX6QeKN
	yJIYHrhAUCLxjVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EBMGE
	jC4S+OOFv6qI+KY/QPsuqaLtaiQYbRHFAuRiy8=; b=XPZcel8tqz+TL0HnEBNNZ
	vU4F3TiVdoNfci+BouOEw/k3oxF8FXN+B937UTQ0Qr8creFMQHgdQviU0kjAYqcM
	nAlvoByVo9G2pPu5A6Ts95aDK0zZHCqKEMPwSWvkSiquc+Leg/i4TagcK8wk1uiS
	J+K/3/MbTlzUjkHdNlm1KRyhRhExdusREe0RnjkFH9qfxsZUNyOv7QRc8HYMz1eS
	FEoBWwW12ZMVKDRfJotetYpvTguWo8SvPGRIMINyV9k5iY1pty/cE+vN1yP8ckGJ
	zJNkSbpEVV11Lzc8QZiH0+rONbPYTqAKwe+JMlOXuf2CQt8hcbQhRfV41BgcuXJ8
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h9xnscd1d-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 10:18:20 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1mttbijxPZRPnpCe0WthT43V+z8vtnaT2x3yU9ntdRGakBFGPIy5fRWSCa65xJg3zXk5+nxN0tUIPSGz8Qp4Jn615w1bwuphPrjVCJBuVPSVaGyq7P/g9cMsiMDFnunk0P/c8qMThFYnow+cW9PhbxWD3BsAR32gOxyO4kOheMFrjQNztR1y/ZDjrN6RdXf0VDps4n3SUJdJAspvR8sahSZQTalj48hLreWz+lMREld9YoPmFIAgx258YxvIb0MRonXTD4twk/kzHC6a0dpZO5kPk2e9JG+pjXqBmqHLYItFjxFTUp7k+mEEWl7uDZ2vS5NV8d1167bWBfL9tyFow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBMGEjC4S+OOFv6qI+KY/QPsuqaLtaiQYbRHFAuRiy8=;
 b=HWDH3joW5HEVps+fmXAxp3qKECi22RRPRqXYQCSNXNQ6EUeasTR4v5wOs8pOWvHm5iI6E+jFubWwZ+0Sld+i6s+iq3KX47Cxu4j3UXBeThjsI2CcTe4imQOMh7oAR2/xCBdQg5vsq+hy/UgZI08Mp97KRaTweswfTm48WC9x+sjFgRag5YmXrQqSGFTRAB1FTQQOy9X1yCrImPDwpizZkMrzASQ/PD4M/8PK+2A98MbFHuG/nTpepWSZhp127U3fO8ny4c46KZz8If8iKkdjoW6xZBrYOoflhLQ5EsGblviAwFp3gNkJPCjiBFrm5gq6KWkwWyrE1/qqlsDl3X8bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DM4PR03MB6857.namprd03.prod.outlook.com (2603:10b6:8:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:18:16 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 14:18:16 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Wed, 14 Oct 2026 15:19:16 +0100
Subject: [PATCH v6 6/9] iio: buffer-dmaengine: Use dma_slave_caps bus width
 accessors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-dmaengine-support-wider-dma-masks-v6-6-5b3ffdef8191@analog.com>
References: <20261014-dmaengine-support-wider-dma-masks-v6-0-5b3ffdef8191@analog.com>
In-Reply-To: <20261014-dmaengine-support-wider-dma-masks-v6-0-5b3ffdef8191@analog.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-spi@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Frank Li <Frank.Li@nxp.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791987554; l=1714;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Z5ERUDAAZfbsfXx8lQLB+q6hxJ3sTYaOCqF/mo+WNEA=;
 b=aRZ8Ile2IeahMGXpUkTJzi90ggjuHXKN6hCQhVj9VzFT5v3nc/uvFe+HLN7O+GXu5R05yZw2l
 2LL+HcOgZvOD53PdcUSjF9v1WVIEzhAy+baSuSestrDXnQIDwrSE5nF
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::23) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DM4PR03MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: b2facc05-da67-4c04-3a15-08df29fdfd81
X-LD-Processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|10067099003|11063799006|261009223027099003|261009221227099003|261009220027099003|261009223327099003|261009221727099003|56012099006;
X-Microsoft-Antispam-Message-Info: t+HEfmg7WN28p+soC+enwIul7tuENoS5Y7m61qkctEV8G1l0HJHI1PjEvK4GxqdcnJyk1Y6PEOQiV3WK9foW59tJOKVJrPrND8TLUo+hWxlK1sEhF7jDC/AKAP7DpE9hSOBBaxTwfj73GfBB7VwiRhIbF9tql/WZcx3ZBNowPQSSYV1MelyHL5xOImfYBzhZVrN/0Rfhp/PB48loTSolBJ3XMgPhvtkqzPJroAxDDfG4+huiKdsk3aMzYzZ6brHATtfc8mVeKeQfI3eSUBLYlpBuKp9XtgeJWmn8ccxWwFfF+XFqB7fA3EbJx/mqBA3QIJyR6LFkHm+dJ/AQiL/tQK9x8pa6JF9oBgIUQCLFAbz97m04ENhZD6+hMJ8kJI7bCDpeuNl2enUNi6mDbGHrroJgg7QvZEzUVYawqJTF/Za/RzoKgiZAs3dAj8UzymnHr2mnt06Fg+auIw2MRzmOP3Z0/oyZiUP/mN4sL1zn5JBTEaL/Tak+1IChMhMuSDH+1/T6B+Oxf01P7aqJ+Ff7b0LMa/vvCquRE8+M3BjDeHxau7aSaKsK6HjjQ5mwwdWwcqa6xX3sF0u1lUZNNaDUTttEjSNk0KopJRhgJAd908DVvKJSt5k7VW6JRrNz3JbiwIA0DW/1JZENEEyDvUPuDrFfnX69uJlhtCfyorH7nU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(261009221227099003)(261009220027099003)(261009223327099003)(261009221727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE55T3R2QU0zdVcyZ1VpVW9EaWxZYis3SFI5UVNJckpsMlpLV0JJcmp3Lytl?=
 =?utf-8?B?MUFpZmhXbzZES2g4WlU2bTJ4SEIzOEp1K3plVW16Ny9JaDc3cEVVc0hpVzNl?=
 =?utf-8?B?UkdZd1Y4S0xZWHJEZk8vQ2FtcUpKRXo5dE83STVjM3pKNG4zbHk5MkJ4bzlL?=
 =?utf-8?B?UEFpUzZXVUYxUVFNK2w4UmhHaSs0QTJiWWZmWlVJRVdvMlFKSlRod04vU3Fn?=
 =?utf-8?B?cHJGL1pxL1Bpc21Qc0dCaUE0MGFDdEpQMWdFckhYSGdMSVZsS0JRbXo0U1Nk?=
 =?utf-8?B?cThjc3czakxtVFM0YUo0eW1KSzVnaVhxUjJHYnBHbjJWSHc1UmhhV0JKV2ZL?=
 =?utf-8?B?SjJ4bnpEV0tIcmJuemlYSlQ3aFdkY2ZNeVYweWx5aUlXSXBKSFhFSlFqczVq?=
 =?utf-8?B?M2kxQW5qMXE5WVArd2g2T2dONFppQ2JpaE4xa3FMb3VNNEFuVVR5eVM2NllV?=
 =?utf-8?B?enE4UWFqQWtreUpkU2NxSzg4dVAvVGhkemJRQlgzSVkra1NobkNyMHF0K1Mv?=
 =?utf-8?B?VEdRejhuR2hBWWxBeno3WVdpbFRMOHNMRllyaStFUFlRczR5VDN0UG1xeHUx?=
 =?utf-8?B?R0NqSm95ZU5jS1UzSW90MGZXdks5K1ZNOG9RN1pMOWpIVFoxaVJxN3IwblBN?=
 =?utf-8?B?Z0taSThXNUViZndqdXd5aW9KT1BncEFzYmxlelNqRWUzdjRFNnA3RE1tOTFq?=
 =?utf-8?B?c21iVUt2R1ZRcWdnYnptSDVhbnhGQXFtaVFMYklyeG0ydEJKam13ZW9MQm9j?=
 =?utf-8?B?VVdtZTZPVytybDh1Z2RBc1EzWm8vdGoyWGw0eWZiODFaV1M1NUN0QjRNQ3pT?=
 =?utf-8?B?Y0p2UGZpM3BSRjJPUWZGS0lucW9GV09rS2dQTnNkYS9wSVZIVDZJZENQd3B2?=
 =?utf-8?B?dHM5ZGhVYysvTGw4YnFJTEo2U1g1OUdWOTN2bWtCQ1FuclF2bE5TcitVQTN2?=
 =?utf-8?B?eG5HbmxBTHBST2pRL1BXSE03M1FPWUVtQ1VxSmNyZ1libG9CWjlDSTdaZTdQ?=
 =?utf-8?B?NEU3RFlsZTJyL2tNOVFHOHR5RnBEdmZlc2VPNEhhWWVMVVRKL3JGWlhPL0dV?=
 =?utf-8?B?c3gzQlJERmVvWCtPNTM0SUVKVmNnUzNOUXZDdlZmMDZwSVdBckhybnZxaU9w?=
 =?utf-8?B?WW5BelkwNzQ4YWErcVkzc014SzdvNFJYeW5OeXREVHUyVlMvMlVwVjJHWU51?=
 =?utf-8?B?NEJQNjBhSjlteGw2d1pwdWVtRlA3eXRzbXBCbmdkV2M5MjhCdzNtaWM4WlpI?=
 =?utf-8?B?d1RUamZ1Z2ZuZ0h2dnZvdko0SUd4Y3Y4dDZsZVpoOEZ4ZCtodS9XR3BwRVRQ?=
 =?utf-8?B?L2hIS0dmM2c5S25rOU9ncTdyV2o4OVFFNVRYSUVwRWcvTEQxTDc2djN0cnZS?=
 =?utf-8?B?WXJhRTFSZ0F2TTNnRXRXM0YxbkNHaDNXRFN0d054dWRja1A4OTlseGlxaENj?=
 =?utf-8?B?QUp1b0s1ZmVSL21UYlFIUHFaWVRvbnBJaGg2c2V1SkxLZFlnNStwcGRRc0s4?=
 =?utf-8?B?bjJkZUd5MjV6TW1LRHY4Y3V4THhyNlY5d25hUkVnM2N3R002U25UMnd2ZzFp?=
 =?utf-8?B?ZW84bmE2ejQ1ZXR6RUYzeVlHMUg1YW9TUUFOc0tLNk9BSE5uSFN0TjcvcVE4?=
 =?utf-8?B?d0hhYXU2RmptNThMUkVZZW5ScVc2bmNxNU4vYk41Z1FOVVhrM1BhYjNGaHYw?=
 =?utf-8?B?TFMwc0p2enhlNm5SQVVMbmhnTXh5Rllwd21GNllWbXF3ZDdJQjIxQUhxRnpK?=
 =?utf-8?B?TXoybHRyQldEenJQSm1UdEQ3TFlkdnVhMzlub1BxMVRyV05XL1Nvd0hvVFd5?=
 =?utf-8?B?VnFoZXViQ1hBaFh3clU0MFZLZkVJSlFKRk5waWdIYm5pVGp3empZM0JRSmRZ?=
 =?utf-8?B?ME9RQ0RMOWlWb0ZLWlo5KzVEMVlURnpQSVRDK1ppa1A3aEdZYTJoYU1WMHd4?=
 =?utf-8?B?dFJsNnIvQkJJcTc3N0c4eEx0endpYmhPdHV4ZFUxU0xnalNlYzUyZUhLQzZn?=
 =?utf-8?B?N3Nhb0llTVdqaU5kckozaUxPa0R2dU1wVWpScURnd1h0WkhYRHdHZG0xMEpo?=
 =?utf-8?B?OEhPYk10a0FabEJQNGxkZS94WURUNDFRYnUvZHVqaWhmdDNnS1daL2ZKUFpR?=
 =?utf-8?B?NjgxdFB3Rlp1ci9MdEJ1NHVueTZnL3NnZHN1bXlzbUkwLytXYnJUT3J1UW9x?=
 =?utf-8?B?Ni9uRW5KL3hYSGNyV0JEQTZVeHIrN1pOY3V4TDFLOUQxWGljTkUzVkVXK1pl?=
 =?utf-8?B?MVJpeTE2ZHpVcWF5NmtBaHh0Mmg2UXM1RXBVZU5HYWpoRTJhN0VXVXpZQ1JF?=
 =?utf-8?B?OGNkT29uc3FqTEVsbGNRMENkNXN5M1NHOG5HNVNDbUtTRmpaT2Q1QT09?=
X-Exchange-RoutingPolicyChecked: mnr8VlfuWTCtfSvPPxFJBpCyaTYEA9xP8bnmYe/THxnz5SzwVPgbSvtIo7yZFkeiWISDhPhoG96W1mE2rDi/S0gMaWOFTIc1yc8DXQqw6SL1ZiE4fAqQRg3t7mJq8Oixns6IveGprpx1z1yZNm5m1SNd9LOTZ+zoIbVV4Rf6FD5A+ehqM1Z5b4H3WG+wem/KrSd4CtixgyTd9gcPjQ3XBBvj62Sde3hs4UpkwyJLNbAJDgxsMvE0Yl0ze+8hRaSexp2ehdtO6TB216jB8YyirkL8hb1Quy2LZi5LHai0homq4xAR3vIcHa7aUoceW6MEqyRzy9sqOoGj8OuIplfjBQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2facc05-da67-4c04-3a15-08df29fdfd81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:18:16.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3sNCPdg8lPUmFIqZcn7UpnhhlDLNnoHN8bmxzyO7QeI3IcTAgE4NSnEt2cUkZ1NexfDC1+a3p2pZiJfU/l42g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6857
X-Proofpoint-GUID: HkplGtTaBvY5JUZXhNpv3A8t0mzbO5rJ
X-Authority-Analysis: v=2.4 cv=MIr1C8Zl c=1 sm=1 tr=0 ts=6acf8f2c cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8
 a=PlQVE8PmvpCE9iZECF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX14uokXB3ClOQ
 FDqUO7Jb/EOCbop7OoPxpJHNY6eYeW7GDcMt4+WsV0WVM0dnaE98fHIR+GR1mImzWA4WFA4Opjx
 ZGJhV0xN7nbMA1exHPOIqUGGpICPBbsp2KrG3i8Za4Xue7WAEKEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXwOv4KsTOOZhO
 f9l3NmGMIF1wqPtRJlJPjY5CgIoasy5vVQyy5dPyxxwjAN2gEvBGI9ppP3rJ1CIJMonXOktEc8G
 QWIPTkXFuB2VF5aVQzD2JMk4bYMEO155l6lNvunamS0CbxNcts5vMy09h3VWxM/NcsE5h7IJIf6
 LYZVKa0LCzTCKGZFqRQGjCIK5YjIA0WPAa86Xnv/OZ/pEhY3x8A2nh3e8OhKS4Wz7fiF6eG0+mF
 jtqVkueVv47S38FyM/Pp7PHC1X/IXoBl8TzTYb5Ut5Fivq1Wi/8ttUFpNTU1Kedp0b59eLVHOZa
 hT0EVGBeVNdz1AP0SmUJiFDmomcboqmHmgXIA95cDb+xot0+uDibXYlLxzHicwj2aYYtaf8KYUI
 Br562yLG0fG4I4I5OP9VIV3VWlAd92kqP+3dRZfC2QGtQo0gvPuGBOJ8MuVcyh8fZ5AiWiniYoS
 tVlrFja4En6RrAO6eHw==
X-Proofpoint-ORIG-GUID: HkplGtTaBvY5JUZXhNpv3A8t0mzbO5rJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_151839_389362_F2DE3523 
X-CRM114-Status: GOOD (  11.84  )
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

Query the minimum supported source and destination bus widths through
the new dmaengine_bus_width_min() helper rather than decoding the raw
legacy u32 width masks. This keeps the buffer working with DMA
controllers that advertise bus widths via the new bitmap representation.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/iio/buffer/industrialio-buffer-dmaengine.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index ecc02a427b92..24f952f0482e 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -265,14 +265,13 @@ static struct iio_buffer *iio_dmaengine_buffer_alloc(struct dma_chan *chan)
 		return ERR_PTR(-ENOMEM);
 
 	/* Needs to be aligned to the maximum of the minimums */
-	if (caps.src_addr_widths)
-		src_width = __ffs(caps.src_addr_widths);
-	else
-		src_width = 1;
-	if (caps.dst_addr_widths)
-		dest_width = __ffs(caps.dst_addr_widths);
-	else
-		dest_width = 1;
+	src_width = dmaengine_bus_width_min(&caps.src_bus_widths);
+	if (src_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
+		src_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dest_width = dmaengine_bus_width_min(&caps.dst_bus_widths);
+	if (dest_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
+		dest_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+
 	width = max(src_width, dest_width);
 
 	INIT_LIST_HEAD(&dmaengine_buffer->active);

-- 
2.56.0


