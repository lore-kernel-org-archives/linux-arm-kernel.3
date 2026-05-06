Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF02CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvm3MJPlHfQAmHzSt+2gioOWSbn3IGUtsYeIbMw8k1M=; b=m4n36wyJUnBbbUYDVenz71oyqY
	G6ssfsTIXYO5qqZykHH5iZ0ptZTiCfhQZKlhkh2hQWG5YRfxyyi4ax/jXK5yvPh+vqtwpepDVFLWz
	Q5Vg+wCaYswzyh+YdRInsiAwu0Q1Z6vQ1QDrcA6PWYXK3nVs7CZwxfA7pE1jN+qBJBLXttzmn5s4S
	8JkJuWqLQn4i9Xi1i/LDRxcuO7V4qQ9KA1ZOsjJ56pYGJJAnbbaLYCyksYPBul+GoXY3qhAOvAKZV
	brRxzRUpBvJvj4gK2uNv9hMgawhUjwRJSFJ01fdguKEil+9CBrXrErRhfZXDy+FW/paJN9fkYHf7w
	C1blK+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYgo-00000000Mmq-2dKi;
	Wed, 06 May 2026 09:37:10 +0000
Received: from mail-francesouthazon11011010.outbound.protection.outlook.com ([40.107.130.10] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYgm-00000000Mlq-4BXh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:37:09 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vxuEJOU2ErxCw4doGNStmz/0Avl9nWx95tOMcDiLn5JJXN1o/zCRgHTm25eFBh2idQUs+DLmhWbSPfUyy+nkfH8g3RdmrTrpvzqKvLL8/mwL5j1/KeHtSoyM/frjgZSwx6nVVzBP0fh3L7LyziMZGfuUW0ratOkykYv0Pv9VVg3W+QSznU/SPKvIWjau2M97ybwGNF1K0vpuotnlHE/secMkCtaMoynKC57TYqqDyMAI9uNFpol1OqpB2X4mBvvUK47tqnlI56ORElnGSo97KWbCsGZ2r6a4GCgJXxMLQqKftCPWqFamG3ryLMwZc0FhVJfc3G3HlfV6iSySWc2ATA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvm3MJPlHfQAmHzSt+2gioOWSbn3IGUtsYeIbMw8k1M=;
 b=swBwkGKsiZzdM8lAtU4vEV8jdFsUJy6f98pmaP2XDBYjQZuHDgWNvD4RMiRdypGDgDyD6bWvCsXzDI3NortdOMrkbz+/bJ2ldTs32uKsN85BdN4PfnSTkmUQhc9XQlgSv8a3pLApRKKn+3sRgp42bvwdFWx36I9TZ8wVwmRxDoxhDhRiOCCkUbMq8kSun3MJ9jp83e+7CEeOkbcbRQ60t+NWUwFP9bu1V16K8XBMRReVwkRjLENzAlTukpG3QGte7XO+AJxCRSMnODClA2WjIWF8hvM184wRKh/ZdhhcyHubJ30MIthPidTRMlkbzVKJzb9SJ5dSgHMFKXp2stY8zA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvm3MJPlHfQAmHzSt+2gioOWSbn3IGUtsYeIbMw8k1M=;
 b=ersl0Py0YX5i3B1A6lgo5YBQMMD2Z01UX0Pw0SPxv5+5Oijlvb2MaYb13E+F/UKIQCwEGrsqJGUm8hvYKoEwTMO2w34D76pv5XwRbgj+MQkGQyO10ZNFcp5FdCJA17mfUr5C47r/MpaXBmCJCT7XqCGTflLACdbJTpqmQuD3VPw=
Received: from CWLP123CA0189.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::14)
 by DB8PR08MB5401.eurprd08.prod.outlook.com (2603:10a6:10:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:37:01 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::e0) by CWLP123CA0189.outlook.office365.com
 (2603:10a6:400:19c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:37:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvvnCgh/HjSdcpUv8L1JR/qo3YyLNcCVzLKNsIJrFMegHdoddv6mHBmZWMwXKvL0osCrLkHH7qNmnhDI31fCcPdJd4H8y53ltk7kGnth8aePHJQ6PPFexAY7JNytB5a87TDzwy6yH81xovMz2UdrQtg1Asp4V9fs+0hfGN6/4OMMgIR++06UTX6owG2PL/OZM7UM1Oj/PCyKbDna1abAnNhshnu8szrw/j5hKx5jtBwBUYlKjuF03+o4sy1A3rSLEb0ERTuA1wjRdNISTPeUMiaWwg0DtuNOTR/4v3ioByf5jZHYVt5ikpERxOVhJr6rVHjPVdmpYA01CUx81LMkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvm3MJPlHfQAmHzSt+2gioOWSbn3IGUtsYeIbMw8k1M=;
 b=hF4QC7Nf/K6vELOcChpeTGl724Cj6v/ahCUxEkUYvaZuZXPMfz5UKEIRFH0KaJThv/zbuuiFoTed0q3kuntRyKyC+p9MXbMte0jgvUwQYs2n2NMC1fhEhpV21atCQdIRz6hqzLWWIUIOX5h8b6z89UbZjLVHfzSQ9NiH3Hy4ownbFMqtPQS3YZ2csGly/DkABE5m7NOQN/5xOooXI4W8cs8gKPa7d+MeCtzi1PoxEy0SBMUMTlnc6jyCzB8ja3CcDNYET351qTu23uPtKVujnCD6B+0L460WJW0MMSVmsVdAtnPbLgtVS3sZAihBoIb+iMsP6BLXMa2qY/P6/d+tiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvm3MJPlHfQAmHzSt+2gioOWSbn3IGUtsYeIbMw8k1M=;
 b=ersl0Py0YX5i3B1A6lgo5YBQMMD2Z01UX0Pw0SPxv5+5Oijlvb2MaYb13E+F/UKIQCwEGrsqJGUm8hvYKoEwTMO2w34D76pv5XwRbgj+MQkGQyO10ZNFcp5FdCJA17mfUr5C47r/MpaXBmCJCT7XqCGTflLACdbJTpqmQuD3VPw=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:35:59 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:35:59 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "maz@kernel.org" <maz@kernel.org>, nd <nd@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: Re: [PATCH 2/3] irqchip/gic-v5: Allow for nr_irqs > 1 for LPI alloc
 and teardown
Thread-Topic: [PATCH 2/3] irqchip/gic-v5: Allow for nr_irqs > 1 for LPI alloc
 and teardown
Thread-Index: AQHc2Lbb0knNe6Mm9U2QLy3yD6nFRbX/5JKAgADhfAA=
Date: Wed, 6 May 2026 09:35:59 +0000
Message-ID: <65160b862fac218084902d7cfce44c76459def3a.camel@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
	 <20260430153352.3654325-3-sascha.bischoff@arm.com> <87zf2dwre0.ffs@tglx>
In-Reply-To: <87zf2dwre0.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|DB9PR08MB6425:EE_|AMS0EPF0000019B:EE_|DB8PR08MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf1496b-37d1-4479-c99e-08deab530696
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: LPZZRuVDg3hU6PCinfCKz3Y+z9oLJ58tIoiB+LlYajS1vGiFuIGwzJSUDajZ4y2jAoel39qjbCkm6Mg71NmcbErmg+Yj4iOW6JHqOQTfI5a2/L3+7qixgeCVnvuJSqGGCAlGN1EY735jzVA/rn3HpaOknj+nwyllt+6owUIX9cOMI4Cpo9Ui6cSB/bs90gGR7uD68os2Ag45rqmZDaltjvn3Ks7F/iQN9rdmMvF33rJhuiYVVRO3xFj24RP64x88WQCXWIxum4GmVGdVQCnU+FJJ7K+BRMMZCiAVkvCgtMJM0hu07ms/Qbl/+XnIgsYRfnvVAwWzWza7rvbvAOeVRzVsv5Q0Rf5gRcraamYtyTwmCq1NTTA0LevjRadDxnC/tAU1PpEK/8E5cGLDSeZvEulIgmSnwio8lNIJNH4Rjud1CiMXNf/CU77/5UX0azSlU2Q4YryckGEe6MfjQNEmMSf3u9/q1i1c6s4Im7QqzpG2EBRs8R9u7IqgdRv5JNr/JPKArx36OHHb2s8x8IbsDLpLE1UxHYSDP7g3KBRJikrV3ji14NSUCGD5kaBmt80+CRfaDugwTyzKaVmBuVAwmfL2kMlrKkWDGLWEdcCGXvHPAUIRx6+hAxOc2KG52P7wJ86PBD6A756/hCnWH7WAw/zuELlMFTNd2sByWNBIHS1sG1tHYKtjjph9mnXRZbh158Z7ayAl9zvvjXRob/brj33TxutFMwSJp8RFD2Fjm9BCOkhIwOj5xJ0tDPHqCWFJ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F85919FDAB0D434384C5FBCDE5A39C4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XWWR8L31z8AsJEs96E8Q74bv5cEx9uspEO+61TOaUUeiO3DbU38B/ZxsY8b53ZjcyZjrbUMihcPnnhhMrI7Hucb34P6PKQHMvODxgRr/DVKr7phay1qymvqGQn5hL6+Us+FJfqvfxEX6KgG/kROESfFe4xnV0PsmGjvw7nma92r0zufsbY1nGUoWkumF7Uw4kGs5rqqdCFmhXiIUIS+v/7JelUz5MSCFxBUwgsOmd/IMW3EUerBz34o96dEm9HNuMGpFSy/K78EzHjc+JUbtrmIrWhhyIrZ3cBUZGAax6j3BI9NsKKjZ6/4IibLVJCEQ6dzmqdZwKGNtAGs9EUTrBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9198d4b5-6455-48ef-9284-08deab52e174
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|14060799003|35042699022|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: gcl5zT1zv1TVH98cG4i5jS5J2lmGqeaDFKNI1mYsHHFNVNS3RmWnQMp3HbcfuJ4kVPv0iSSfHiMOXaAFXNUdufXLqaTlVsfE4si2Y+l4gVOJIi0Wn+FKfgG00WFnXDRJAvh1MIwpNevDZWgr/gadBcoXyUD+AVO1RvBwsJLIVPSRUeLS7iTPmBXMX5qCix1Xs+TpOUoSVVLeb02xQeI9l3yD0B9EXnND1rm1ycm3N6GsDPXItZDKFAzyzvNqw4UFnyjjlJpfQD0J3VfJT+oYX3vSVFPVOyH3ueAKeVqvwwB2I+i71rcwJQyN8bsSzy/zLpnSGnKMBpbWlXYzndrqGeXdlULhx4SKj0z+OI1FoIPIumt9L9jcs/08jdoj8ohJTOhMpuvRT2vbOdgu1ubDT7Xylxmo8/YQvBZ1FbV8BiOMiGxkTpV8d4R5S5mvvXo08HDSdjpnwbquzZZ76OFlWItwN1XW87+q9PamaHt0Si+Vyhdm2+GDD+9JzgScZvScrlUKXQl0+8y8CzWkWwUzN4TWPP2kD9qzDw4BwbHklMGSZiy2spyRI1dT9FLy/cuLW1+3+A8j6MVgExNr+xEXNO9Um/fbftvRiqOq0sF85jaA5G+hgTGcQHKaf4F7PJNrjsTP0sLyxkbu4DMzudjRvSbv6U0FNxyLjjQhMMgcvCTzBLW9TXJPOmLu58VF6jr6m/VSSfxqdXB8tCrCyiS0N+nGOnNfTC5n50JNp6/c/Qs=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(14060799003)(35042699022)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IpTKSHA1LpCxL6FX9AFY2jXdSz9Z8sbNXlJbjv7CSRh3bicRYyMqWaLyLmVfx2ovqdFAoQtpTfn3x9zj5DG2CGeG6LrwkQ4FR2G9uZIugMnxyFEK2oHhbkkQBOhp6BcKgUFyA5zL9YMuvLM8Tg3TpbUJUO7kvpYvGpObrjlQXz0M6dbjxM1gTgOfJRpzy4eTFSn6rKr5abGfKDrgnjbG8K5W5yfKxTDnLN1PI2VGKMlSyLxoRIe+5UAFGauim4FYCZThKB53zpQokr9O6S9a8yUQuIZSxTCOm2yM5TawSQF0IWhuF/MMhaoSn0tmW8icTQb7wgUo/08x+kZx60kn+La9ToIcRHuiInw0cNPrGcDZZgqUmp9Rbp9sGsDkiVUHkdq4iCMrsmwlmW2FELsAOopCfXzxZHwBHHWtBInhsUZ+312d662VgodSGhRHFY3s
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:37:01.3444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf1496b-37d1-4479-c99e-08deab530696
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023709_529412_13FCB35C 
X-CRM114-Status: GOOD (  31.33  )
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

T24gVHVlLCAyMDI2LTA1LTA1IGF0IDIyOjA4ICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
DQo+IE9uIFRodSwgQXByIDMwIDIwMjYgYXQgMTU6MzQsIFNhc2NoYSBCaXNjaG9mZiB3cm90ZToN
Cj4gPiBGb3JtZXJseSB0aGUgTFBJIGFsbG9jYWlvbiBhbmQgZnJlZWluZyB3YXMgaGFuZGxlZCBi
eSB0aGUgZG9tYWlucw0KPiA+IGJ1aWx0IG9uIHRvcCBvZiB0aGUgTFBJIGRvbWFpbiwgYW5kIGhl
bmNlIHRoZSBMUEkgdG8gdXNlIHdhcyBwYXNzZWQNCj4gPiBpbg0KPiA+IGZyb20gdGhlIGNoaWxk
IGRvbWFpbi4gVGhpcyBtYW5kYWRhdGVkIHRoYXQgTFBJIGFsbG9jYXRpb24gYW5kDQo+ID4gZnJl
ZWluZw0KPiA+IHdhcyBkb25lIG9uZSBhdCBhIHRpbWUsIHJhdGhlciB0aGFuIGZvciBhIHJhbmdl
IG9mIGludGVycnVwdHMgaW4NCj4gPiBvbmUNCj4gPiBnby4NCj4gPiANCj4gPiBOb3cgdGhhdCB0
aGUgdW5kZXJseWluZyByZXN0cmljdGlvbiBoYXMgYmVlbiByZW1vdmVkIGFuZCBhbGwgTFBJDQo+
ID4gdHJhY2tpbmcgaGFwcGVucyB3aXRoaW4gdGhlIExQSSBkb21haW4gaXRzZWxmLCBkcm9wIHRo
ZSByZXF1aXJlbWVudA0KPiA+IHRvDQo+ID4gYWxsb2NhdGUgYW5kIGZyZWUgTFBJcyBvbmUtYnkt
b25lLsKgIFdoaWxlIHdlJ3JlIGF0IGl0LCBjbGVhbiB1cCB0aGUNCj4gPiBJUEkgYWxsb2NhdGlv
biB0byByZXF1ZXN0IGFsbCBMUElzIGluIG9uZSBnbywgcmF0aGVyIHRoYW4NCj4gPiByZXF1ZXN0
aW5nDQo+ID4gdGhlbSBvbmUgYXQgYSB0aW1lLg0KPiA+IA0KPiA+IEluY2lkZW50YWxseSwgdGhp
cyBmaXhlcyBhIHVud2luZCBidWcgZm9yIElQSXMgd2hlcmUgcHJldmlvdXNseQ0KPiA+IGFsbG9j
YXRlZCBlbnRyaWVzIHdlcmUgbm90IHVud291bmQgb24gYSBmYWlsZWQgcGFyZW50IGFsbG9jYXRp
b24uDQo+IA0KPiBTZWUgcHJldmlvdXMgcmVwbHkNCg0KSGF2ZSByZS13b3JkZWQgdGhpcy4NCg0K
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgQmlzY2hvZmYgPHNhc2NoYS5iaXNjaG9mZkBh
cm0uY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUuYyB8IDcw
ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ID4gLS0tLQ0KPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS0NCj4gPiBnaWMtdjUuYw0KPiA+IGluZGV4IGEzYzllYWE4ZmY0ODYuLjYxYTcwZmU0OGJj
MzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjUuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LmMNCj4gPiBAQCAtODAwLDE3ICs4MDAsMTYg
QEAgc3RhdGljIHZvaWQgZ2ljdjVfaXJxX2xwaV9kb21haW5fZnJlZShzdHJ1Y3QNCj4gPiBpcnFf
ZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGludCB2aQ0KPiA+IMKgCQkJCcKgwqDCoMKgwqAgdW5z
aWduZWQgaW50IG5yX2lycXMpDQo+ID4gwqB7DQo+ID4gwqAJc3RydWN0IGlycV9kYXRhICpkOw0K
PiA+ICsJaW50IGk7DQo+ID4gwqANCj4gPiAtCWlmIChXQVJOX09OX09OQ0UobnJfaXJxcyAhPSAx
KSkNCj4gPiAtCQlyZXR1cm47DQo+ID4gLQ0KPiA+IC0JZCA9IGlycV9kb21haW5fZ2V0X2lycV9k
YXRhKGRvbWFpbiwgdmlycSk7DQo+ID4gLQ0KPiA+ICsJZm9yIChpID0gMDsgaSA8IG5yX2lycXM7
IGkrKykgew0KPiANCj4gwqDCoMKgwqDCoMKgwqAgZm9yICh1bnNpZ25lZCBpbnQgPSAwOyAuLi4u
DQo+IA0KPiA+ICsJCWQgPSBpcnFfZG9tYWluX2dldF9pcnFfZGF0YShkb21haW4sIHZpcnEgKyBp
KTsNCj4gDQo+IMKgIHMvdmlycS8gYW5kIHRoZW4gbWFrZQ0KPiDCoCANCj4gwqDCoMKgwqDCoMKg
wqAgZm9yICh1bnNpZ25lZCBpbnQgPSAwOyAuLi4uOyBpKyssIHZpcnErKykNCg0KRG9uZS4NCg0K
PiANCj4gPiDCoHN0YXRpYyBpbnQgZ2ljdjVfaXJxX2xwaV9kb21haW5fYWxsb2Moc3RydWN0IGly
cV9kb21haW4gKmRvbWFpbiwNCj4gPiB1bnNpZ25lZCBpbnQgdmlycSwNCj4gPiBAQCAtODE4LDMy
ICs4MTcsMzggQEAgc3RhdGljIGludCBnaWN2NV9pcnFfbHBpX2RvbWFpbl9hbGxvYyhzdHJ1Y3QN
Cj4gPiBpcnFfZG9tYWluICpkb21haW4sIHVuc2lnbmVkIGludCB2aQ0KPiA+IMKgew0KPiA+IMKg
CWlycV9od19udW1iZXJfdCBod2lycTsNCj4gPiDCoAlzdHJ1Y3QgaXJxX2RhdGEgKmlycWQ7DQo+
ID4gLQlpbnQgcmV0Ow0KPiA+IC0NCj4gPiAtCWlmIChXQVJOX09OX09OQ0UobnJfaXJxcyAhPSAx
KSkNCj4gPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArCWludCByZXQsIGk7DQo+IA0KPiB1bnNp
Z25lZCBpbnQgaTsNCg0KRG9uZS4NCg0KPiANCj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXJx
X2RvbWFpbl9vcHMgZ2ljdjVfaXJxX2xwaV9kb21haW5fb3BzID0gew0KPiA+IEBAIC04NzEsMTEg
Kzg3NiwxMSBAQCBzdGF0aWMgaW50IGdpY3Y1X2lycV9pcGlfZG9tYWluX2FsbG9jKHN0cnVjdA0K
PiA+IGlycV9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgaW50IHZpDQo+ID4gwqAJc3RydWN0IGly
cV9kYXRhICppcnFkOw0KPiA+IMKgCWludCByZXQsIGk7DQo+ID4gwqANCj4gPiAtCWZvciAoaSA9
IDA7IGkgPCBucl9pcnFzOyBpKyspIHsNCj4gPiAtCQlyZXQgPSBpcnFfZG9tYWluX2FsbG9jX2ly
cXNfcGFyZW50KGRvbWFpbiwgdmlycSArDQo+ID4gaSwgMSwgTlVMTCk7DQo+ID4gLQkJaWYgKHJl
dCkNCj4gPiAtCQkJcmV0dXJuIHJldDsNCj4gPiArCXJldCA9IGlycV9kb21haW5fYWxsb2NfaXJx
c19wYXJlbnQoZG9tYWluLCB2aXJxLCBucl9pcnFzLA0KPiA+IGFyZyk7DQo+ID4gKwlpZiAocmV0
KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gwqANCj4gPiArCWZvciAoaSA9IDA7IGkgPCBucl9p
cnFzOyBpKyspIHsNCj4gDQo+IMKgIGZvciAodW5zaWduZWQgaW50IGkgLi4uLg0KDQpBbmQgZG9u
ZS4NCg0KPiBUaGFua3MsDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCB0Z2x4DQoNClZlcnNpb24gMiBp
bmNvbWluZy4NCg0KVGhhbmtzLA0KU2FzY2hhDQo=

