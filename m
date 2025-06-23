Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540A5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+O7/+7Ai9m0OqsHin5+SL6BcHhcdoVf98qN7WrR5QYc=; b=ql+TxJVcUDXsiAnsWdlQfBItl/
	1WI/UUL9nFfuFjwRXrLhDnKizOHkV09anoqH+x3tW8qu6KtxCc0Qaj9/bDXplLcH0Yb1zvPpdvJpX
	We/l+QwE0ZmeUqzbLtEnu5eXrK+lh0k6SBBjTX/OQJ7i55buMslMTPHX/kbHQdRtpbZJOIvAmq3EA
	1nJqZg9VcnFEaPTulyF6URK0cOO839xgaE3XTDSDte7F3PF6cQDnRbncY8hbBSwzPM3lorME9+54c
	C7Ig4CcEOsAKt6IIJ/9Ze4KXoOGBEH6NXx1yGNjqgR2CI/E3z4aTeY/Y8pNVFMtgpfWUJy2QwSQu+
	d1tNcTnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnnG-00000003vbN-2uVh;
	Mon, 23 Jun 2025 20:29:30 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgT3-00000002jIU-04JD;
	Mon, 23 Jun 2025 12:40:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Muki1GNT0gRtSRX5oLhYfcCDxp9pQh92lbI42tVOQ4J8vQaZgCKiTRl66EnLXps1qirj1SxXpoxH8KYUhb2utqmZFRfZXDb2HaNvMi3SvTXwlHImIT/bNsfgZmWGFjPcLfQoBjUp3rqYq4FyPAD81Aov8dV63zFTKHfFMhFdpQNWgBDTdPHtzIuph3BZ5xvyuhYdq8qwzKgbWHb1hcLtklRjmUZwvhIy/ycOLRwFx6lIstEMKLcAaDn6iGz6Rr7PJIUAdW268mIoorjoUDLOQ1sM7aBkY3J+Vq75dwN0TtaAJ4v7+pSfm7w2AGkOLiZqmoJo+/irisxt3hbHljVRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+O7/+7Ai9m0OqsHin5+SL6BcHhcdoVf98qN7WrR5QYc=;
 b=VtEKOsONaR/u4rWwlNNZg0Jh4RbmU23WJsw6P89CNkmLFRX6POjuzjKJwRpRWrywqJoWzZ27irzy7fI2cJKdGyq2eAYM0c2302mt1gOnqLDBmTmOuliAoXnM0EHnJ1IbbM7P8k8rxyIkp8lL//UgucbCQumMDneva0iNwhOzLvpbRaN8slbKS6cKZfsH98uiQk6Fii/Fk6D5wPDJA8RUDUUrk6sd3i0e4z2WYaxZlPMXAZtvfeyqbwOTvvmf91Lj/IRE9lRW5uqj7jjHraGmI8/dB880NArwnhrqenIvX8DjXRj0PMu1Bs2I4dZX45r50PBxsI59Zus2PhhNwpWo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O7/+7Ai9m0OqsHin5+SL6BcHhcdoVf98qN7WrR5QYc=;
 b=XWIDW0/W7lYb3cTk/W7UEldMCY58dRlVkQG/RItDeyeTJD7eyQokuVBsI5ymX6JyZD8Uq+gcmEYb2eYmVuxI9YNBmUTEuv7RdpQX43t4vivpb+f0FiXgyjLwI/qxhddJIn0czPI60YkUXLfZmnshcJ1RkfHZf+ppGezPiL83ZGo5fjv8nM1eionRLb2BZ/BHXiCB3LYkWnTlIpbAmxZ3E5EChRDrv+ANA9CAE3qED8l1VHDQlwSFEUsZW7qyd/SNZi2inEkfcw+mGeWHdHPSnM24ZA7xgWqy/dnrGeuUbDmtEqYqfVdgnAVHwYKpRLzVkWaan7edFmK5a5yN424nxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by SE3PR06MB8096.apcprd06.prod.outlook.com (2603:1096:101:2e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 12:40:02 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:40:02 +0000
From: Pan Chuang <panchuang@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Julien Panis <jpanis@baylibre.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Yangtao Li <frank.li@vivo.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v6 15/24] thermal/drivers/mediatek/lvts_thermal: convert to use devm_request*_irq_probe()
Date: Mon, 23 Jun 2025 20:39:37 +0800
Message-Id: <20250623123940.474310-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::6) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|SE3PR06MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3d9859-341e-4d70-8e5c-08ddb25312d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDBCN2lRVnpXYjBIajJPWUNnYUJWbW1hMHpmTWhHZFE5UnRBNTdRUzNYQUZY?=
 =?utf-8?B?WDBJbUJuRDhQR0JkYW5NMzZDdGdITkEyNDR0bFgwT29HdGdPMjdiK2o5YWs3?=
 =?utf-8?B?VGMyaXFqZ1h0WW44WTNORnl6SGExYjVJdVk0bnBBVmhYWVN1S3RRMVdmSFRr?=
 =?utf-8?B?TlMrK1diejFIcjFVdXdXTHRhYkwzbUhEaGNBVzRjMEtBbkd5cFdRblZhdDEz?=
 =?utf-8?B?UU1YZmdidlAxU2orMG4wSXp3cmhYb0QwL3pvK0NEajA1MkxyQTVEeGo1SXZN?=
 =?utf-8?B?TVk4Um81alJEejFSNDFNelpaUjVHTkxIRDgrbXU1L1NoOGRHT24wWjN0UFRs?=
 =?utf-8?B?RXVyZmFpRTloZ25NNWZ0L1BhYWxiMDJpS09IWUxESmRJU3A3RnFFd2tHR2U3?=
 =?utf-8?B?YVB5bElhdXhMdUZyRHQzM0s0Vk5xTGFraW03blljZE9PSENHTUdEZjQ0ZlF4?=
 =?utf-8?B?MDBQbHFzQk91VXoxR0Y5dUd3eUdGNzBSQjdIOXpoVzRzdmlweTV6WnNuQzMv?=
 =?utf-8?B?cWxTbm5sLzM1c2pGQzJWSU1yUzQrV3N0SWlFQUREOHExRWhhclNLNEZZUGtR?=
 =?utf-8?B?MVduQUdNRUY2NTNtMHNTVEh2TWMxY3lSTVVYT2F0aWFtZU5mNzdrQ1JENnNh?=
 =?utf-8?B?Mnp1d2dLMDF5YnZkbU9naXQxL2ZXcGxFOWswRk1tTnZsaE9LL1Z1Zm01eUIw?=
 =?utf-8?B?QUZSSHcwQStFYTBHdFhTU0JhaE84WHFRWmRVMjl0VUplZEhTeE5xczh3QURn?=
 =?utf-8?B?djMwQ1h1WnJmNjFDZFlOZTBnUEwzYW8rdmZZOW55ZWpOTFRDSWJoUHJuTzlZ?=
 =?utf-8?B?QUZLdmNMNzlqT0F4bzJ4YUlvUXpLQ05pRlc1WDNkakZnK1o4bVZXa3FBQWJV?=
 =?utf-8?B?aFZ5Z3k3UkNJVFRRQ0JDbHRwYlEwRWJwelh0UHowclFtUHVGTmVmSW5oL1NQ?=
 =?utf-8?B?SkJ3Z3gvaFhDTzN5cXJuUklzd1pIZTBlTE9RSFllT2NrV0JRczc0eVZ0c21D?=
 =?utf-8?B?NzRKTUoxRkZuNmpwYWNIMm9mWFVOc0hxeG1LdWIrUjlwQ3VLZkxRZzNRQkl4?=
 =?utf-8?B?amdKdFl1dlo2QlVrQVFJdjhOWEthT1VDclkvNDRQWHpUbjFhUlM0NEorWTll?=
 =?utf-8?B?UjZ2STNvQTJ1aFV4bWZhd2FUWkl0YlVRNXh6QWVhb2ZvdEJ2aUhEQkpKRTNi?=
 =?utf-8?B?YXRha0piQytmUmZFK09uSEJ6Qzc4eGFDU1creXNCZ3h6ajRGOGxaWGNuUXRK?=
 =?utf-8?B?Tkx2UnpQWFNpQTgxc0hxUUdtWHEyTmN2aVYxOTJhdVYxSjZhOGR0Q3ZwRThr?=
 =?utf-8?B?WDFkUnFIR2NmbWdXV3U4MlFRWDc4YURLTFA0TkNoZW5rQWxPbklOL2gvS0dP?=
 =?utf-8?B?SUdjZkVpS0pkV05RWmJLeExnOGplS3p1TDA0RkxFS05ZZ3lLWVlNVStqcmMx?=
 =?utf-8?B?TjR3UlV2NHF3Y1pQdzdldFA4QU5nNVBaNGNWckZpdGJoa0Q4VEJnMXo0NHMx?=
 =?utf-8?B?Wko4VjRlb3BFRTJsZ0Z1eTBpV20xSFJtSXFLb0FoRGdnczdIcHhtRDcrUENM?=
 =?utf-8?B?YXpCSGRmMFl5SDlBQ1E1RUVJdTBjQ1FsZDc1dSt5aENMdFNINFV2eUJFSDRo?=
 =?utf-8?B?dHVWRWFDZzkwcTZ0OXFycWxOZ3lHQ0pNK1hwWVovRTdRNzA5TXVyeDFjQzA1?=
 =?utf-8?B?Nk9aekhLQytsWmhkckNBYnZsY2NpV3hpd2pFRVpLNFV3RC9sdUpaVVhzMzVP?=
 =?utf-8?B?bUZUOG5iMzdGRENGUWVlNyszS2pZd2dVOWM5LytOVERhcVptcWFTdmhidVZ2?=
 =?utf-8?B?S3JjSDhPTkRVWUZqWitTRXdZOFI4UE9qQXNneVZVV3VJclcxa2lvRXJrWnRv?=
 =?utf-8?B?RFNaUS9mYjJEcW9MRkpmK05hekkzYjZhVUgwNzZJYk83QnBoWkJYbHJ6U1Zl?=
 =?utf-8?B?eVc5Tk5TcEpsRUlhUUtXTzlJKzJvdUF5NTAwc09vTVBFV3VvekdVYUk3L0t6?=
 =?utf-8?Q?H1tyTz4hdtBEjF7yqxZyZTH3SRSKg0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xuOTUwWkJVUnJqR0JMekxqUVBsRjBkM2g5ZzNuVUhwYWZORmZSTUxEQ3Ay?=
 =?utf-8?B?NnNsVDZNNVljUXhTTkpzWDBoV093bGVDNitpZUgwaGtXaHlPbHFOU0xjQUwv?=
 =?utf-8?B?WWFFT1dlU3VldTNlVUNFaHRNTExkNTlHR3ZGMElaRGNWQS8zdUJZRFB6QUZE?=
 =?utf-8?B?WUtNVWJvbkl6OE9nSzB0MHM1STY2SzdKUi9udWNUNlFZcVNqZlRZcVhHbkZH?=
 =?utf-8?B?SGpHSGFLclM2ZDM0SndJY2tpTTEyRUtISXBiZ2JJaEVaODdyV253Y1RkVkR6?=
 =?utf-8?B?eGFSMURQUXAvNUdSbkxtcllUV1BvcnQwOE1XajBQVXIyenU0S21jbG1DNmo0?=
 =?utf-8?B?OHJKL1VUNjdOZGNnZjREWGVOK3E0b1RTTnZsc1k1M29EaW44UHBITUtZaGIr?=
 =?utf-8?B?cU5iMUxXSDNvZjVZcm5xTXNlL1VWYktPUzY1dUpnL2dGWWloNjcrcDhSOFJF?=
 =?utf-8?B?bER4Yks1U3NYeFdCRENUMnRIMFhmVHA1WjJSL2s4Vm40OHBGUUNiUkg1bnZR?=
 =?utf-8?B?QS9rdnRLM0Q0ZVVCbzkzK3dGNXBaNjdOZHhHMzIzc1Q0WGpnRXVUM3ZoTytQ?=
 =?utf-8?B?VytKZW16cXNST0VUZmJQOTYyU1dOeFJhQm5NaFBOVWszWFlNWkxvYTlmT2FL?=
 =?utf-8?B?N3d1UDRmQVNGR2tKRXc3ZlFGVXZEL21FbXJ0U2ZyM0IzZTRONHFvSGFmU002?=
 =?utf-8?B?WFFVUkptQXduNHp0VGlVdTFCekZDY2NCd256eWZlaC9iVWRqeU9tYWtxYU5Y?=
 =?utf-8?B?SWs5RVlSWlBJMmpDWFEyNGZ1WUU5MHhQRHNLU0hEaTc4TTRzYVdWNlF1b20r?=
 =?utf-8?B?TWswWmhrT2hIM1o2NmVmMDBIN2M4S2VkR2xnd0pQTDFOczlIcXNLREtBN21m?=
 =?utf-8?B?RXhyb1htVm05ejhDdHZvajhzdjhXY0hmdVlkb2VXd0xuUHRXQmhMY1JScFYw?=
 =?utf-8?B?RFNrN2FjSkxSTWFiTHJacHNGQUloWDNwMkhuYldnVXZtRnNaV2E1b2M5TEpv?=
 =?utf-8?B?SGtWN2k4Vm5WTm5LckxTVmZFQk9hL0J6cXhURVFzZzllWDY1Um9QZXNRaXY3?=
 =?utf-8?B?NVZHNHF0b3VreEM4KzNjN0c4S0xCeStFcVdWbVhJTlJScmlzZFQwaXdTcWxE?=
 =?utf-8?B?NzE0Y1drcU5HSlFQcUxReXA5UDZZa2JBY0ZLZ1QvUURIZ1BEb3NxSnE4OUxo?=
 =?utf-8?B?ZG9HUjNjY0UwMXZ4RUN3amhDQWlKWVdxSnpBS2hFckwrYWJMYkZwQVFjQVBB?=
 =?utf-8?B?VGhQSmZSMTBFeU5HSHBFRWEvOFp3SS9NMGlaRnpXWERUWXVCdnM3SDBndXZv?=
 =?utf-8?B?bzJnSzVZWm5pYTBnVmNla0RCUmFtU0JmQVQwaGJIOTZyZ2dydEoyK0hOUWZ2?=
 =?utf-8?B?THhVKy9BQ1NkZG9VbXV5TlVyaVp2MWVNNnJsRUJKWnhLdDlRb0pZMk0yWnZF?=
 =?utf-8?B?am5UdlduZmNHckhwMVI0dGo3SEQ5T1dkLzdBT2NvSDJsSWk4V1h1VUZ6K2Q5?=
 =?utf-8?B?M0VpMVA4dUp4UE15YWl0WHgrdnpTcG1od0V2Q1hIWmRTTWdNUFNRRlhLWmRX?=
 =?utf-8?B?SjNiRnp3d0YxaTZEOHBWeG1PYWhYREJ0c0ZGQmdWR2lzb1pMZEpqamhvSjhV?=
 =?utf-8?B?dVNzMW9Kd043Rk9PY1c1V0FoOWFmaERiRlpHb09mY3RtSFpwQ3ZES1VZT2RG?=
 =?utf-8?B?SjJBNmdhYzkxaFpyWDJ4MjBhL0RPcloxVWVCQWRZemhqMEpzWkNJd29tT1hj?=
 =?utf-8?B?N1plNGFBQlROMVBPQ2NUQWpUdkdqVVY1Y0h6UzhVY2tndTFUd0ZFRURocHdx?=
 =?utf-8?B?SmNUUEdsQWxzalBZdWNEcVFzTjJEYVVSck5WcTBpU2xmbDRIajVORXNFNngz?=
 =?utf-8?B?Wk1qUlNTam5JU2gyYzhhS3FyM0djR2x1aVlRZjJrWVZHWllHa1VMRlNDMENM?=
 =?utf-8?B?bGVvRnVHSUxyUU5ZY0VoWXhEaVVZNTRwWUNra0h4QW5yai84TTZhOXFoMVVS?=
 =?utf-8?B?UWszYUUwTFpxcXlpNnhlRFV3TDUzdEVvVkg5c3BFaHlTWDV2WE93NkJzTlE5?=
 =?utf-8?B?aWU5b042QW8xcFRjNWRZd3pSQ2ZQdDNQZnpxODh2VUpHTnptVUpRWEYrMWdh?=
 =?utf-8?Q?oH8d9MtqnIrM82NRO8ZWYZpIo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3d9859-341e-4d70-8e5c-08ddb25312d1
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 12:40:02.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf3PR5JLSougv548Xft8ZTASGjk5kWjgQUduVVaWbqKIkbygiiXaM5McPgMREaFKc61xxcttJful2nnqOcfilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_054009_070700_A5A5963A 
X-CRM114-Status: GOOD (  13.77  )
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

From: Yangtao Li <frank.li@vivo.com>

The new devm_request_*irq_probe API prints an error message by default
when the request fails, and consumers can provide custom error messages.

Converting drivers to use this API has the following benefits:

  1.More than 2,000 lines of code can be saved by removing redundant error
  messages in drivers.

  2.Upper-layer functions can directly return error codes without missing
  debugging information.

  3.Having proper and consistent information about why the device cannot
  be used is useful.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 985925147ac0..459bbead3095 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1355,10 +1355,10 @@ static int lvts_probe(struct platform_device *pdev)
 	 * At this point the LVTS is initialized and enabled. We can
 	 * safely enable the interrupt.
 	 */
-	ret = devm_request_threaded_irq(dev, irq, NULL, lvts_irq_handler,
-					IRQF_ONESHOT, dev_name(dev), lvts_td);
+	ret = devm_request_threaded_irq_probe(dev, irq, NULL, lvts_irq_handler,
+					      IRQF_ONESHOT, dev_name(dev), lvts_td, NULL);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request interrupt\n");
+		return ret;
 
 	platform_set_drvdata(pdev, lvts_td);
 
-- 
2.39.0


