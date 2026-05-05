Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83324CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiYB1kUd40Fu1zrzgagkRP40liocZ9B+pdT6FPJ2Rfg=; b=mhw1aYbNNtHxJ09ooKxRZDcZOK
	dUaJWcmudF1M16G9Maj7J9gYCCMRNaq5Cd1CEJLzRLbu9OEZEHUo6pbTxofNacDyRhfr8PWEHXsDZ
	UWc3g1b53V7CR7drC8hs39EWKlCenIboMmtpsRWlRx888u3UB8l1TJ+l85dMUDUyCRkAKQrXTo3Fq
	5+itAT/wblofERRTYdbkWAQ4CmZHYIJvEVdeFjb/XnfcKUQfxT5+TMY4XPUwF8hBnpiIjP6H5aJqA
	VwadMYRqMXxtqnAmTbXT/kyCVFsjvvilyPwDk3Hw6LoNuOTprTMDAX9yBF8TXJXP82ZZHsjnPnpMk
	DPMjq7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBiI-0000000Fbtt-3pmX;
	Tue, 05 May 2026 09:05:10 +0000
Received: from mail-francesouthazon11011070.outbound.protection.outlook.com ([40.107.130.70] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBiF-0000000Fbt3-3HmF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:05:09 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SY+dlA7HDKBAjU/TRR8eLa07naFVRytgm+udZmcu/MWdswZPK2JlZJnUInpMixZOnnUuqx7wFFwavfT8+dLK4Ay/d7hD79vhN0ml7Mm4XxEMVE0iPx5XEHwY0FC48OwZf7y39wHae7PL1emRVR+1EjrHgCmFE5yRYScF4KfUUu5L4cuvvHMUN4417JZQp4N5sBb6ZyqYtX+1jiBY1jUshenRIDi9bDPhabqut0UXGwBAMmO1IILDIsJm7kmjOBz4QnWSPRCD7iMbHDCYRPRL/3zqjoXsFWWwOW1mNRN1BKTaUvnHFlYd2VqXi5FhSYhL+2xeQMFGuXbsdlfA4tNR/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiYB1kUd40Fu1zrzgagkRP40liocZ9B+pdT6FPJ2Rfg=;
 b=JTmtKxZaIxAZgwAcCVG3T+mfkAArJjKLTo1N9OGO2+1qX3tjXL9TJQDDt/2D3+0iOuFX7WlQEF1aen5CmrAMNFI5Aw5lMUqSe6+PEGswh+Zpg5NmduWJnGCxu/41UxdqW/vlq6HrAQ3MTZtiA43rfXc5hVb7Nkd5KzWvDVJcoiDIdOJmlT/4kkKzjtr3Z/YplkihMQV7+Cy+loIYV3JEtyU9+HgXZ7y2ZfvQRw3Y7WaVx4lbfCwvhkZVe81OiGBXdKLRE1J6mkTaav1jstcwEeEtCHeLfUQ0n0FYuV4725IN2FEHZhrsiAUGiVmCNP72cXecmoRRsYQOS4+M34XZTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiYB1kUd40Fu1zrzgagkRP40liocZ9B+pdT6FPJ2Rfg=;
 b=MYAaQJHxvV7VXg9CBh7rGRe7H9yiVgA5wVjFuGzJcv9nTP/mBRrglDaya+RHjFG7bGSG0FpeilmeCeO4B0HsCB3GvDjfn4Iyzhep/Ujz/u3bY95VK2Ux84h584z7EvrkokevX0DMod2CrftdsTYMnPL3oBKrDTDdllbiNHt3RQw=
Received: from AS4P189CA0050.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::28)
 by DB9PR08MB6393.eurprd08.prod.outlook.com (2603:10a6:10:25a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:04:59 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::fa) by AS4P189CA0050.outlook.office365.com
 (2603:10a6:20b:659::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 09:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 09:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koA+562H2IXAy6N1mylsAvtHv7gp5MENeitlM5z8xXWd8yoU3ec0dj/MRPJ21aMaEqliC6EQtzxJ3WCICTIQRbSwIfiguGh4XuTEmaQ2VZmzek3Kv3xmAUhLaXhfbdfFDxeGUIrc0AoBsh1x/SjboZiVaKg0QExD2RU0gox203dJeXvGktCbDZnkbIyXSgKeVXkKzEBYPLxM1WCvEu8CS5oudxxh5onBz5AQ7XaCOo3CTOFrm0jT9VylcP31u6hBfc3Pj/32ISvpPjiGsGGLCdkj+4RsB7BKjjWcPhnIM74D2vUl78COyo6Ze0QNS2qqX5dBUF0LwtRg5c9wZYKs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiYB1kUd40Fu1zrzgagkRP40liocZ9B+pdT6FPJ2Rfg=;
 b=Ud2bJ8gqQEjXU949MwPOqjvpCKuXDfJZwTYuPwCMM26/9gwgSb3gwK8nf/s9S1PxO4EdptGVqyuWDFw/cIS5QJ80vOI/7jLKJ8ukugMy7Up4jALz46elyA+IBZxUKLDfcOkmDbCaPZtAL2mpkck2p8iHqXiq1P0R9uJqXZXz8VCHkq8OzHfnS8+dp6L02wN41fYzD9pUPRQS4IHZoMIDtjD4W/VXWnTNfVjSfDFoD34G0Tu0/m7/3whnOL7zFYns8Ll2MuUYV6FrGcj1xzWDZpex/IkOGmA1nuM0gSzioxbWwND/Bl0sz+pvcj+5ofPPK1cu7xJHZE7y7xxi1RlcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiYB1kUd40Fu1zrzgagkRP40liocZ9B+pdT6FPJ2Rfg=;
 b=MYAaQJHxvV7VXg9CBh7rGRe7H9yiVgA5wVjFuGzJcv9nTP/mBRrglDaya+RHjFG7bGSG0FpeilmeCeO4B0HsCB3GvDjfn4Iyzhep/Ujz/u3bY95VK2Ux84h584z7EvrkokevX0DMod2CrftdsTYMnPL3oBKrDTDdllbiNHt3RQw=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by GV2PR08MB12001.eurprd08.prod.outlook.com (2603:10a6:150:369::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 09:03:56 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 09:03:55 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "maz@kernel.org" <maz@kernel.org>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd
	<nd@arm.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v5: Tidy up LPI allocation
Thread-Topic: [PATCH 0/3] irqchip/gic-v5: Tidy up LPI allocation
Thread-Index: AQHc2LbDts5X6/KtBEa8jzb7QTCJYbX6jqsAgAMEvoCAAZdbAA==
Date: Tue, 5 May 2026 09:03:55 +0000
Message-ID: <f1b8c1285cb44851f8cd8046d3cf20ff3e67db98.camel@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
	 <87cxzeayd1.wl-maz@kernel.org> <afhcw4u4413uZeUM@lpieralisi>
In-Reply-To: <afhcw4u4413uZeUM@lpieralisi>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|GV2PR08MB12001:EE_|AMS0EPF00000198:EE_|DB9PR08MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 041645a1-5e6d-40b3-90bc-08deaa856250
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: kxWzRjv7TzPFNV60w50XqGdPXqYRZJkCZFhbDeKw7Ur/COsFdcqxCFE0TYK0zdrdAx9A5u492LDtRGssDBgvo367aWrXMG81aJjVe/AS8ZWlc4RSibQJk4/mSZq0DmjUqp4JxtkewlCWoDvbavoLYhisTnsgqylE8jXNayGOJumtqoRG0nothvIfYzn3rup72wHlu+6XR+oWSpv1488vCyX34n+cZ9TzGdqvcenRrgc1AK0uDZQHxmvpHw2ozGui1tsAXtpKnkrf8W+r+OtRx0hB8b0yjZX8AQM3QP5k3e3WWTYuknPfb3T+S2Mf68d+M2uBT1GkS5AbuALsUOtjnvv+e9polENYZsOORAUKTPHdUYhgEgCPQ1rwmTcE0p26NTpGi7dcAsw8NUXv2e/Soa2cUEP6F5ltcEvD1RlAi3osRddqgIeZf6mx1KvJuwZF9GwYphKXUeyu3Pzl6X2NxXBxtvSuvLtCgJvJbHzX1lVc0ltWsfS8kRWqsoMMLYrtYUpp+5XiXY0NjfNpXtYyfn6xr0Kx6HHlZBwDKEKrVphn8D8ibZ4ATVEScs1ybAnruf4kbtOBeSn4w6jWObn4eA8iRUhUqbXgyTjIz6Xx4PdShtOv0zrQThqFNWHulswgLDhwDzNdX8cE30vq+Rpy1/7dpA+hZGCNPrHp7hsTYQogivZh6AWVLlv9cWmYhuq09/v0OC17Ej/YuqMOP5TKBbfJqZ+F2OBQKKFubfNUDjKjOdL/rqvzvPYqYEfFR8BD
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6042267604B3784FA300B5A50DF2290F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: URfPejwcXnyIrePomQFGg1r8o/uLk6yqC07AMwyd8lxGV3hUKYZvVqqGwYz/AIAuL+Ui9lkginY0ncQ637I42xO8SR0GHSmqvrNQGj2RU1XlcWhNwIgdfslhm+GscsmK2s+xfyYD3DR09PD9s5YCGkUKHC95VtkzlTWZmHm655CRXm0BFZD9/hgh+4Mx4MjO6dwQ5NjZ/QbdYiyg+ZC70vCISD85iCauhvMqzTEiNJLAPJgwZGczZ5KEVMmKOFFGD438HZY+hQV29B/jx++OcEjs0R9JK4m6Nj1TXEA9eS6S4Oby6TsKzcguWObKMKz0f/fopdWcQIQxPTLvqcS9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB12001
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 84319575-f9d4-4876-1a67-08deaa853c87
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|376014|36860700016|82310400026|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: jbF60ISQ7YXwqSzxM4ofXRiF9lJNlxTAECWHo0BetPZ4VN2G57eGqfT66B2aQyPGXHl6Cj/AeWmXZ39K1lpkBky3kFxKxYylEJbfTafn61X3DynL0yIomaWg28YVldbzVRlL8scDEliM5h2afPbyoTGegUb/qWlxLl/wS3nxcdCRHoRQNA0S3z/bzyw4trH/JCXxGnbFQxPuhzKe9Ql4IUhED/t1t6O1jnk4Wectljm66Fg9avfUsHEGnOuNPqjk0eT2v45o0eUogZnZz4RcEeX0MQRkZ4tVoCdQElXkM3c5zAsLHNMQDiwT7zFdNSjPif27gssuII7r8lDtAS6hQpBXRGHi9tOKwnKejtV7j2yNtqwhibP7vt6RmkEU8J4VnJyc5JGdEkgqiT7/wcnQ6jjcm7LT5mcsDik4xZgogtpgrHo96F6QtY2x7DUgZpUD962z1SWpXlMSuW4VCDswFGE1s+2EbjiiQbOvAbuelGGy+9z2X92crxVxlFrOTpEfIuPvr+6YS0PS0pdTMwfqQa6AMU5sP1Q0/JNwgim8opT7CCghnE63eJ91FFtjTVmREDPukJkRXV67BLufpc0AEWodkj+qFMqk+z3JAoeP0M/8EPfA7k1UemEroFlol0J0ex4RE0nSrakileMWCB7LQRc75YeDOVYXEK7vmNe75ULwFeWJxAMNpq4hjcPNudUdzHewRA3965eC0WXfX94vVz5vQH8VqlJw7pGK5lflzuM=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(36860700016)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lUVMz4B+N52JofjRkDU0+LtosliD6ATeM72Gf3hYxGSH3DAY2sVzidugMlpbMUVnCN2KT+bzt25Jul2QmfUgkB5g/lLz3qkFKw/mVc6vsjq490x89nAjqO7trnb/YBI2vhVCgBiXpDWrhadYzErp4Wok5KLbYRoWYvgflii3OfoWdhNYV9bGRFYonYSSNrVbA9g8YkH+MhODfJkEwbC3fkHZ/DzN5BWoHG0WfUqxSYuQn7m76g2ndx6Isl807COtnB2B97tLjBCUedHjsZsnFaG/wiN/S7g2laMEyNuUVECimu5RBrnkSbkJAzRHJFcCbNymEzAavXX8qGIy4kkTrKKb1y8PGDSgrmgGUkx2vsdfqOIJJTtfbcW3J827kYh93stEJeTprsPwKcCYuV0lOErMFwvcZhakLzO0RXfsiUYWvOwnBjerhfA6bZsyPQTQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:04:58.9002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 041645a1-5e6d-40b3-90bc-08deaa856250
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_020507_847316_D1B4C7F2 
X-CRM114-Status: GOOD (  31.91  )
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

T24gTW9uLCAyMDI2LTA1LTA0IGF0IDEwOjQ1ICswMjAwLCBMb3JlbnpvIFBpZXJhbGlzaSB3cm90
ZToNCj4gT24gU2F0LCBNYXkgMDIsIDIwMjYgYXQgMTE6NDA6MTBBTSArMDEwMCwgTWFyYyBaeW5n
aWVyIHdyb3RlOg0KPiA+IEhpIFNhc2NoYSwNCj4gPiANCj4gPiBPbiBUaHUsIDMwIEFwciAyMDI2
IDE2OjMzOjU4ICswMTAwLA0KPiA+IFNhc2NoYSBCaXNjaG9mZiA8U2FzY2hhLkJpc2Nob2ZmQGFy
bS5jb20+IHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBMUElzIGFyZSBvd25lZCBieSB0aGUgTFBJIGRv
bWFpbiwgc28gYWxsb2NhdGluZyBhbmQgZnJlZWluZyB0aGVtDQo+ID4gPiBmcm9tDQo+ID4gPiB0
aGUgSVRTIE1TSSBhbmQgSVBJIGRvbWFpbnMgd2FzIGFsd2F5cyBhIGJpdCBiYWNrd2FyZHMuIFRo
b3NlDQo+ID4gPiBkb21haW5zDQo+ID4gPiBzaG91bGQgb25seSBhc2sgdGhlaXIgcGFyZW50IGZv
ciBpbnRlcnJ1cHRzLCBhbmQgbmV2ZXIgbmVlZCB0bw0KPiA+ID4ga25vdyBob3cgdGhlIHBhcmVu
dCBwaWNrcyBvciByZWxlYXNlcyB0aGUgdW5kZXJseWluZyBMUElzIChvciBkbw0KPiA+ID4gaXQg
b24NCj4gPiA+IGJlaGFsZiBvZiBzYWlkIHBhcmVudCwgYXMgd2FzIHRoZSBjYXNlKS4NCj4gPiA+
IA0KPiA+ID4gVGhpcyBzZXJpZXMgbW92ZXMgTFBJIGFsbG9jYXRpb24gaW50byB0aGUgTFBJIGRv
bWFpbiBpdHNlbGYgYW5kDQo+ID4gPiByZW1vdmVzIHRoZSBleHBvcnRlZCB3cmFwcGVycyB0aGF0
IGFsbG93ZWQgTFBJIGFsbG9jYXRpb24gZnJvbQ0KPiA+ID4gZWxzZXdoZXJlLg0KPiA+ID4gDQo+
ID4gPiBXaXRoIHRoYXQgZG9uZSwgdGhlIExQSSBkb21haW4gY2FuIGFsc28gYmUgc2xpZ2h0bHkg
cmV3b3JrZWQgdG8NCj4gPiA+IHN1cHBvcnQgYWxsb2NhdGluZyBhbmQgZnJlZWluZyBtb3JlIHRo
YW4gb25lIExQSSBhdCBhIHRpbWUuIFRoaXMNCj4gPiA+IHJld29yayBpcyBleHRlbmRlZCB0byB0
aGUgSVBJIGFsbG9jYXRpb24sIHRvby4gVGhlIGxhc3QgcGF0Y2gNCj4gPiA+IG1ha2VzDQo+ID4g
PiB0aGUgSVRTIE1TSSBkb21haW4gcmVxdWVzdCBpdHMgcGFyZW50IGludGVycnVwdHMgYXMgYSBz
aW5nbGUNCj4gPiA+IHJhbmdlLA0KPiA+ID4gbWF0Y2hpbmcgdGhlIElQSSBjbGVhbnVwIGZyb20g
dGhlIHByZXZpb3VzIHBhdGNoLg0KPiA+ID4gDQo+ID4gPiBBcyBhIHNpZGUgZWZmZWN0IG9mIHRo
ZXNlIGNoYW5nZXMsIHRoZSBJUEkgcGF0aCBub3cgdW53aW5kcw0KPiA+ID4gZWFybGllcg0KPiA+
ID4gcGFyZW50IGFsbG9jYXRpb25zIGNvcnJlY3RseSBpZiBhIGxhdGVyIGFsbG9jYXRpb24gZmFp
bHMuDQo+ID4gDQo+ID4gVGhhbmtzIGZvciBjbGVhbmluZyB1cCB0aGlzIG1lc3MuIEl0IGFsaWdu
cyB0aGUgR0lDdjUgaG9zdCBjb2RlDQo+ID4gd2l0aA0KPiA+IHRoZSBleHBlY3RhdGlvbnMgd2Ug
aGF2ZSBmb3IgaGllcmFyY2hpY2FsIGRvbWFpbnMgKGRvbid0IG1lc3Mgd2l0aA0KPiA+IHlvdXIg
cGFyZW50J3MgYWxsb2NhdGlvbnMpLCBhbmQgd2lsbCBtYWtlIHRoZSBLVk0gbWFuYWdlbWVudCBv
Zg0KPiA+IGRvb3JiZWxsIExQSXMgbGVzcyBhd2t3YXJkLiBJdCBhbHNvIHJlbW92ZXMgZ2xvYmFs
IGhlbHBlcnMgdGhhdA0KPiA+IGFsd2F5cw0KPiA+IGlya2VkIG1lLCBzbzoNCj4gDQo+IEJhaCwg
c29ycnksIGl0IG5vdCBvbmx5IGJyZWFrcyB0aGUgSVJRIGRvbWFpbnMgZXhwZWN0YXRpb25zIGJ1
dA0KPiB0aGUgY3VycmVudCBhbGxvY2F0aW9uIGlzIHJlYWxseSBicmFpbmRlYWQgLSBJIHdhcyB0
b28gZml4YXRlZCBvbg0KPiB0aGUgSURBIDEgYnkgMSBhbGxvY2F0aW9uICh0aGF0IHNob3VsZCBy
ZWFsbHkgZGlzYXBwZWFyIGFzYXApIHRoYXQNCj4gSSBjb3VsZCBub3Qgc2VlIHRoZSB3b29kIGZv
ciB0aGUgdHJlZXMuDQo+IA0KPiBUaGFuayB5b3UgU2FzY2hhIGZvciBjbGVhbmluZyBpdCB1cC4N
Cg0KTm8gd29ycmllcyBhdCBhbGwuIEZyYW5rbHksIGl0IGlzIGEgaGFuZ292ZXIgZnJvbSBlYXJs
eSBwcm90b3R5cGluZywNCmFuZCBoZW5jZSBteSBmYXVsdCB0byBiZWdpbiB3aXRoIQ0KDQpUaGFu
a3MgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgdGhpcywgYm90aC4NCg0KU2FzY2hhDQoN
Cj4gDQo+IFJldmlld2VkLWJ5OiBMb3JlbnpvIFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwu
b3JnPg0KPiANCj4gPiBSZXZpZXdlZC1ieTogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4N
Cj4gPiANCj4gPiBUaG9tYXMsIGNvdWxkIHlvdSBwbGVhc2UgdGFrZSB0aCBpbiBhdCB0aGUgZWFy
bGllc3Qgb3Bwb3J0dW5pdHk/DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+IAlNLg0KPiA+
IA0KPiA+IC0tIA0KPiA+IEphenogaXNuJ3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuDQoN
Cg==

