Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48858FD375F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JseeBAqhQoc8tjlmefoNYPMIWK9MS6SAEVo6FYrBrZw=; b=2a1VRsKULmlSgMbi99wrsIxgFA
	3Ft0wmq4EA7qYtr4qK7EljUU5HROwyFR1zvaBaTNODWoTylC1J0mXQQC1SzkS1810FcnkMz5e+AU5
	1S/UZBVh14GS9Yl7sK23fXVbqyVhk0mfhukZjnGFBlwYecNVY33f1+Px3le1TfOUvErUaFENi7rAC
	3RiIEKtcX7mMx+hd4mmqPSgqdfKBrj6j+Dvp2WRSFWMj2S0EF1J9PcpjlCi9yURqxIEsYrMqRqo4I
	3PfdgoET4dsu4VTERScj3aF4cNtYndAayELlyWCEGWYFlG+E0H6ouZrU4ff5dyB9sMcgY7qP+FUQO
	sPiuML5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFHM-000000048to-1OCD;
	Wed, 25 Feb 2026 13:50:16 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFHJ-000000048tT-18QO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 13:50:15 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SHb5wABV0TLE64umNUnmBok0UyFJZqyo8jzBdUEaz8WQnN5qC+TLX8/h+SErkvqP8pAMj/3mjsP6Ad8DmIwoFJTWZ9chGEa+h2kWUyiWeFuZJCADzjJNNOYSdViMUn3Yubf24ksFrAgvV7J/M3TUKySOvI+z0ko8XgjdjjYCABTopESyqJIk3FHrAs1GpXGXvD8vJQiIEX6dmG+uTEl6I507PxIM0WtjCVAFKTzP+u2Jw2H9Qre0lPOlGZWqOlRpVSALp28hVhxDHR3IuUO3ZDZk385SpP8k/18rSELvytqs2zH7Ptt4E33WvHJ6gX0OO56z6n+tGxl4ftqZbtB8Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JseeBAqhQoc8tjlmefoNYPMIWK9MS6SAEVo6FYrBrZw=;
 b=hXDjv5EoF9hqHAeJoR2KT6dh98JTvfXsDKWMoJ1aKJ6DzXRi3J7rRbNScxRKkGq5GKRsYzOktMx9r7w30oT09NE5zAiredIjoQ1cKUU3xUwCMowyaFcJQrREreutjbLK6wdSKxUXm2Ey1D7uy9ViaHNHf6BLwvJlmGxvayYTha5vVxJYtZii6kd1dFIh2lBw62sms8VggmREuibG9V28orzj/4a22icQYBf7wAOuqSV7JHIpU8PuhcIC6a7xpnlkIG/Mqp9t2bSPPBI1ZlltKD9s0UK0byGlFgtD3NtGFj+kX/IInYHT4UITDfxZA1yCGPcKwLm2YsCY7YxGMS8LXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JseeBAqhQoc8tjlmefoNYPMIWK9MS6SAEVo6FYrBrZw=;
 b=LWtFz35q8p/GFAZhKSuWGBoEfXcqlsNfmuB9526hRqp8+GBwWUCD+YtaN2cWFkLcNbCyOqdfSvc8qOzbn3muvWlHPHP2AFbJc5o9SVXkH8YglpK5JlBw6UzzVJS3hRGnVxlib7F/4kFB3LQoaSSi7FZ2Xo44cBFGrqzzE5Xxp2U=
Received: from DU7P194CA0026.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::23)
 by GV1PR08MB8356.eurprd08.prod.outlook.com (2603:10a6:150:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 13:49:58 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::e7) by DU7P194CA0026.outlook.office365.com
 (2603:10a6:10:553::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 13:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 13:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBx65p8CZ82SZOG+2rtoSOpmdN0d7ZGkDCJ4+O0R2MxjBhQEB3EaXdIggGXEj0zqWGKSwxK5+efRE8zxBxhl4B9wS2C0rwYTkF4YHbR10hWyJoMlTUQm/DSYvB9YbsbEePTnbzAsLRZDCjii0nDBn2IEz2NP4+3tiFprrYRdIF1MXGLgYD3MofmNgfQlakR5MYuzQS79Z3FMtNpp/BgFN81auKzIUuFjJUrMP9HrKwKcyOQsSob+tK3F7BXlP+kwBQyQwMyvDmixL8lUM28e+OFDD6gy8vkbfu/fQdUHF4yMknn1dxgKmwuNcFzt57ZpNY406xGZ8EW6EUZ9cBQDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JseeBAqhQoc8tjlmefoNYPMIWK9MS6SAEVo6FYrBrZw=;
 b=xozYrGlJBsZNqpfg7JZRYiz+B8QKbqZQyemh2ApOlW9+CfCCokggNyCGUzAuBSbFBzKrIifC1Qt+0+W4x3vei5RFayObpRZnIq8Z/RGGk5CRx1s4wbJw8caqAS1I5L8t0jIWWKasHiKiCtRDiMkRqm3Oi5jWjpBH3iU1Pz75t+wFg8BiSCHL1gdGoacjN4BfBc3s0MwjdaoUwK0W0fTKioMeb2iO/++MNCmThu8pWlThgtEoyxsYmp8UwJtH7xbeSnssYSXk9FRmTQEw7Au4VEKjKICjhOgSaLqwyW3Tj8FSEUYrHORLEgGxkuUzuZ5ztIEoQJWq9qaPwO5zDb5xGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JseeBAqhQoc8tjlmefoNYPMIWK9MS6SAEVo6FYrBrZw=;
 b=LWtFz35q8p/GFAZhKSuWGBoEfXcqlsNfmuB9526hRqp8+GBwWUCD+YtaN2cWFkLcNbCyOqdfSvc8qOzbn3muvWlHPHP2AFbJc5o9SVXkH8YglpK5JlBw6UzzVJS3hRGnVxlib7F/4kFB3LQoaSSi7FZ2Xo44cBFGrqzzE5Xxp2U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DB4PR08MB8173.eurprd08.prod.outlook.com (2603:10a6:10:383::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 13:48:54 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:48:54 +0000
Message-ID: <29efbd9b-f83c-408f-b43a-20ccc768814c@arm.com>
Date: Wed, 25 Feb 2026 13:48:52 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] coresight: cti: Refactor cti_reg32_{show|store}()
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd@arm.com
References: <20260209-arm_coresight_cti_refactor_v1-v1-0-db71ab4d200b@arm.com>
 <20260209-arm_coresight_cti_refactor_v1-v1-8-db71ab4d200b@arm.com>
 <PAVPR08MB96744050482081B274E6E4BB8C68A@PAVPR08MB9674.eurprd08.prod.outlook.com>
 <20260220173549.GI136967@e132581.arm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260220173549.GI136967@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR08MB9674:EE_|DB4PR08MB8173:EE_|DB1PEPF000509F1:EE_|GV1PR08MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9451eb-ee04-4a58-06b5-08de7474c2b7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: yOTsdrpTkDS0k8cpcKsiC0P8j5wzR7ZqFoFF7CuhmTJdm7MqxhCT/9WL6X1qbN6epLTA1TsoGxarcE9NrkQmmt3P6/xfHK2/7SQDBaUZeX0rNZnK0H6IbtakRzyALuj3W6nLCybe576XDpWyd6fuZzEproTnCQV8sbP1RAETVZF+u4+DEOx/fEpymiy1DGpi2ZJH7i1xNtOPlqwt05feGvvUNLmyryGyyQ7Rre2o8jZFCNKiIbRUqKUrj2N5ZyYiqsy0+Lhc1V66dICij1Kk7gqfnDc/dTll+8MQfpwOrumua7AmqnaWlBkArtwIZC2ft6hLt0+8Qxcma7XiDKePHwCRj8xvbglaVj01w6t0lpoQGlCzJ7BTx2PxMsdvemXguVoqorFOx+Remu9OVSApScXqNt86kBblrfuEP3UK1D+wf0aJ1Z6dHGExxldtb/PZzDaH9XLht14t+iD0jrByRDKZIJBapnTgKgTbPXiZQozB5mKGMerSW7VL9gZwicm7Kr0YUQGXo6+EfNr9Onh/rWpj/YWnRUqwl6bZZj1YJv2b9FnmkJHnKAM7P61Rts5Fb6+EKfwwNpADQ3KQekFF9HlC3LB3HwpVy0I2TyJeDtYxXjIiZPxXabT/APqLhoMKmIIsh4Pid3OxtvKb/tlQUSRZAcxqOOzGOqM+0nLdpWU/sYksuxSOrIJCiLbeS/FO/DNFOzfzYI5hz0l0vR8TehiGxl2z0xmEZzFFLPKJ2Co=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8173
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3577ea73-c477-4ea8-5b83-08de74749d51
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|14060799003|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: Bvg+b6riffBUiCOyEFZ9om+p/TCaojNTqJpHcW17Exsfb+EkIaNk6p2yG8JE3XWMjigscuPQH5k9aeJJ+YXBpFwI0kt0oPg8USIyN8sEx5P0VXQn8w/4uXw5UaIu/LF+URgJHQo2pvMyuYcdPCBQm6hxduVfsUBbLr1iahqu7EjjpE+wMShS7HLk9OjPSA0P8UpZuPRnei9qEuEeBLAAPtHtO63tkPwxDR6B8tP+2q+iD7DgOOud+lupoTnc8wIwFfalG9Zd/6NOdttDamjEh2qjT3tGIi5EL23nKbfqC+omb/8izJvXm5B7LXP8dOBiYqe3kdFzvtw8X+AVnpslx71gbZUcS0fcQAa64IGk9tIL3fUE0TAc7AejnqKoFni9P2P2w4F5agKckh3kFeTEAWUQSeCwm8zzObN4aml67FkyhqCI5KuP5I1Covr5rfapn3RCuBa6E5oDrt5m56R3qIRdRidjRJ3VMPpsbh7Conqq+B1WYF/x7uFNe/HdTfFhDDCWICwp+vo737H9mHmBn4Wyrq53EHpSr7raJUfoAKyo7+6XOEJrc97BPlgwJlsIJvbueZ0do3g/8Njkdh4M8UVXsSRnKWdx+15mAhxfRj+MU96nVGr2ELQNHX35rAExPyWN4LKHRiveZZgM1M1YRscYQqflCy+MAsIIHFFxtzi3Owr4No6VtIZXtxG5UH2nlLvLzfxtEQ0fVzPUiaHAs7KKaoIVzRBcmB7EoNjXFQJ3dQMldcVupdbowZIYki49wsf/aHY+Q70GnTHgY7of15284HAilrV/iL2TmJpjhe+a7toRmHoOr4Gl6LkPuSDt5+k+R9W7GaeqLmzaVkvtdQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M9PIqgzADo+S7iZ0iFs2PYI4isa7tV6HCrzk27MZD6amVQq7ID11PrqxRQ7r95id1TnhS25ozlErOKuAHyC29Nka0s10DfyA8qzUQfI3DNmoN1L1yP4EH5DlaUJLsiIMwxrwf/PWmiIfC34mMmL50HYdapu6bd4hdr2spLUQTertl83z+Sefg0AEG26QsipQFHktrsT0tJJowS70pS54Dn2F0k404XIQKG37RSKF7JNUmOGpSV/Tx7CjM9uAJnaySPZtm6gRpeyRv/BhdeOPcKMrxhKCLfDDtO3isnT4adTo0s4+Xrt8dy4LSKYi1Eva6JrXar8x/jWfKmMe4msnEvke5cB7O3w/mXXSNFgBUN4ekC1XrflwlHqK09n0U8FROJIfj9olcOUG0QPWIox7s7QgDHoXHoCv22OQPFkv69OF7TITPhnFXPCvLX+cEGn9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:49:56.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9451eb-ee04-4a58-06b5-08de7474c2b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_055013_560867_490E9661 
X-CRM114-Status: GOOD (  36.20  )
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

Hi Leo,

On 2/20/26 17:35, Leo Yan wrote:
> Hi Mike,
> 
> On Fri, Feb 20, 2026 at 02:44:03PM +0000, Mike Leach wrote:
> 
> [...]
> 
>>> @@ -252,14 +252,14 @@ static ssize_t cti_reg32_show(struct device *dev,
>>> char *buf,
>>>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>   	struct cti_config *config = &drvdata->config;
>>>
>>> +	if (reg_offset < 0)
>>> +		return -EINVAL;
>>> +
>>>   	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
>>> -		if ((reg_offset >= 0) && cti_is_active(config)) {
>>> +		if (cti_is_active(config))
>>>   			val = cti_read_single_reg(drvdata, reg_offset);
>>> -			if (pcached_val)
>>> -				*pcached_val = val;
>>
>> I think we still need this. If a register with an none-zero default
>> value / status that can change over time is read when active, then
>> read when inactive, but never written, then the inactive value will
>> not reflect the last read value.
> 
> Let us consider below operations using your suggested approach:
> 
>    echo 0xab > /sys/bus/coresight/devices/cti_cpu0/regs/gate
>    cat /sys/bus/coresight/devices/cti_cpu0/regs/gate
> 
>    echo 1 > /sys/bus/coresight/devices/cti_cpu0/enable
>    cat /sys/bus/coresight/devices/cti_cpu0/regs/gate
> 
>    echo 0 > /sys/bus/coresight/devices/cti_cpu0/enable
>    cat /sys/bus/coresight/devices/cti_cpu0/regs/gate
> 
> If a user reads the "gate" knob three times in the above flow, it ends
> up having three different semantics.
> 
>   - The first "cat ../gate" outputs the user specified value (0xab).
>   - The second "cat" outputs the real-time register value after the
>     module has been enabled.

which for a non volatile register will be 0xab as enable writes all the 
regs from the config to the device - or will have been written through 
the cache to the device by the echo command if the device was powered 
and available .

>   - The third "cat" outputs the last read value before disabling.
> 

Still 0xab unless this is a register that can change do to operation in 
which case it will be whatever the last noted value is.

All of the above is entirely expected and required. We should always 
show the user the latest value of the register. If the CTI is powered 
and available then this will be that directly read from the register.

The ETM is not different in this respect, except that the ETM reads all 
registers back on disable - and registers are architecturally forbidden 
to be written while the device is enabled - unlike the CTI where 
registers can be written after the device is enabled, and for some 
registers it makes sense only to write them when enabled.

With the CTI we do not readback all the regs at disable. They are demand 
read for sysfs, which is more efficient.


> This could be confusing for users (even for ourseleves), as it needs to
> understand the meaning of the value under specific conditions and based
> on prior operations.
> 

That is pretty much the definition of reading a hardware register on any 
device. You need to know if it can change during operation or not, if it 
is volatile under the conditions you are reading it.

> To simplify the semantics in this patch, the "cat" returns the realtime
> register value when the module is enabled; otherwise, it returns the
> user configured value.  Since "*pcached_val" always stores the user
> configuration, it remains consistent configurations across multiple
> enable/disable cycles.

The semantics of the cache are to use it if the registers are 
unavailable if not powered.


> 
>> Relatively minor issue but does represent a potential change in
>> functionality for the driver - even if I cannot see specific issues
>> for current ARM CTIs. This is a R/W cache so should be updated on
>> both R and W.
> 
> "R/W cache" mixes the cached user configured value with the hardware
> register dump and may become inconsistent across multiple
> enable/disable cycles.
> 
> It seems to me that this is a bit overdesigned and complex. thoughts?
> 

RW caching has been around for a long time - not sure 2 lines of code 
could be described as complex!

Regards

Mike

> Thanks a lot for review!
> 
> Leo


