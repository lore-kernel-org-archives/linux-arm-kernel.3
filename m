Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92626F9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/qDId5dz1urJjvQFQzTPcIdIqDaCMMc4HGzCkkKgtc=; b=IQ3MEYDlggM7d19G2cdOu6XHzn
	y6+3XcvZGu2ZVnktGoMqsRTcLVYSYnVKky4317JJExDarEc9q8pvsODS0kb0kx0GiZIT6tZzbrFDr
	ojJLOL2wuXKZxkOfDm448ug1LJM06RDTeoxOLtD6FxL6UIsmT0mfwG8hKAnT0TCSvijcT/26eRizg
	RoRadYJIdEkYL8mw45trDQvVCrSVGvpkpjI/G+PXnikDAHTfivZfnqaseG3OZi7hjUSdChUZpBOHY
	rjbvorhMzzgYK05PCt1yWowvgXiX6bTSrB0t+9AaZP5Ns+oaZUrJHIPnm+WUeD8ysMw2yZ4jFbsdq
	F8o+HzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoM-0000000HNJQ-0RYK;
	Tue, 14 Apr 2026 13:28:14 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoJ-0000000HNHT-08aN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:28:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qxnD312UZZsQoN5bCTgEveHgjbaW5CAVlfGPDn066hoJLozatbhcFv2xoAvz3TPRSgd0zdYns9snech3v/CCRG+I7XQhck5OVGJznm2o7wNrk7RZ2S81gr83jU88AQj3U6+nz/LyLRfbEGDlLDrsHCbC3b238kdJj/gZdfGDFenmzW/oGUO8L0Zranu8cNjfYBudrJKDXJ3ccNuRFmWC34UZeapYSH9hExJ/MT8jfqiYLjN0IglHLyjjHAZfoOh2XrK9PulVXUm/q8BKowP17p4xRrmangAK5YPtnfqRYkhzNqmAqEghTSfm7KBqtwBZalx95V2OZH60kItqn679BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/qDId5dz1urJjvQFQzTPcIdIqDaCMMc4HGzCkkKgtc=;
 b=yEB3DpQauGnGVVpHVdJQxi4wNDDh8y1QWzGmWTy/0E6kM+mY6LOnXtFeNz2yT3wDp6Ij4wN7wz+h8tvJ1NcEwbX0zbMbutUm1aFAhbElxASuIPLR8mBHui7beRBU3QqksBC+XU41NEHTAnY6OvnL7HGyzFi7Ou3ah/EhbvF+cE7ieIQwL96e2dTg+JP7Xp2lgo3iNflFAfMjJBnoMNGVe+vMRRzxJgkUaPPA+j49Oc2WQEV0mhEWVpT4/wZf77nmG80JVoI5GpsScyJ2k6C0zld33vbzNQAzAOo/ofX4AbHthDMUBkiK1PlRPsh2VLnlCwsFfM+zaSfUHGUsiMm67Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/qDId5dz1urJjvQFQzTPcIdIqDaCMMc4HGzCkkKgtc=;
 b=baLk9A+cUS6mZOveIGZKUpGLf+uUDT08+PGg/iHRgJNcXmhCHESkhD6dBpyjfirQ9cc9b5wvHUID0vKqQQPB0gPf+fxvBISJc0nVK/FOUPJP8kkJVM7jIcDgy2tyTf9iM1Ju5z0Pn6Z5TkNU2BghZkISBEnR7OR2d2zRcYgTOCM=
Received: from AS9PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::25) by DB9PR08MB11531.eurprd08.prod.outlook.com
 (2603:10a6:10:605::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:28:05 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:542:cafe::a7) by AS9PR01CA0037.outlook.office365.com
 (2603:10a6:20b:542::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 13:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 13:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPDl7CE7UkwCcFlpESljTzeBRoKEdYIjTTEpDdSI9xnbVpXfqs0ybZsk8p048g1qjBlV32g8th5y4IgUXQanC5ZYRSCy8vkgQ0pyLuL0XNtlkbsMd3Ur9M3fjEYlWCL0X00RRm8FyC9wtkmHWyw8qpkBtt8VKoqTka5RkTcIoaoZD4EYQnV35ZxRu+z/ntbV+61hnyQSvzCsa9Qn7LxEAzywIQTmb0bXrnfkzr0Pv+jCx+Ai8d1dEW6TkZk+DkVDkpqBI+dyD091aoG4/m2ytJGo5MF4dm2bAa01ORuPuiyCKrpbQuh0f/Q5+CptU8SKm1hEC2bt7t19yPhA2enUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/qDId5dz1urJjvQFQzTPcIdIqDaCMMc4HGzCkkKgtc=;
 b=nt6xZ2XqGm3CwDUH0r9/RFs5+xCQUr3Af0KOPJXG3j+j7dIMIQOBD2GLnE0t6rqRxBP2ofLSn6eDowPPGiwy7H7A4b6frSg/bY3Q6db7nijR+Y8bor528BTaHrswweXxyxO0PhYLEZUNRt3BIrxWcyuiwZI8uKkSSUpt9ttsVvmPev3AXT0cUgIiD5VOwKqyrEHr4mSQIWOv3dK+aSIHBq3ckl9uzf9WM6nl5t5xxlM+0GD6Ych9XNGietWpVIb7qxuRUCRMkiDTbWGWBjAZ/I7JLGLbnb7n/cXTN5LffSANElSZ7WM5mDOX+/DKmlp3kpo8WoJBKxGp63EPeRYYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/qDId5dz1urJjvQFQzTPcIdIqDaCMMc4HGzCkkKgtc=;
 b=baLk9A+cUS6mZOveIGZKUpGLf+uUDT08+PGg/iHRgJNcXmhCHESkhD6dBpyjfirQ9cc9b5wvHUID0vKqQQPB0gPf+fxvBISJc0nVK/FOUPJP8kkJVM7jIcDgy2tyTf9iM1Ju5z0Pn6Z5TkNU2BghZkISBEnR7OR2d2zRcYgTOCM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:26:59 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 13:26:59 +0000
Message-ID: <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
Date: Tue, 14 Apr 2026 14:26:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sami Mujawar <sami.mujawar@arm.com>, Dan Williams <djbw@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, thuth@redhat.com,
 steven.price@arm.com, gshan@redhat.com, YeoReum.Yun@arm.com,
 cedric.xing@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Dionna Glaze <dionnaglaze@google.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Alexey Kardashevskiy <aik@amd.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260414122950.GW3694781@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0191.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::13) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|PA4PR08MB6160:EE_|AM1PEPF000252E0:EE_|DB9PR08MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e26fa4e-4064-43a1-778e-08de9a29a8ba
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|11006099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: m7FALv+sXHMjWHLkq4XPHVCLafINsOqauv9/8hM6UXFJ3lK6DA/WUv8tuA1Nmi7UjI1xIHkw/6fA29X4S/nSkun19RU5geRriPKD6BMCSN7MaPBPLtNiYeyIll5xAPg0IIk66UhLhSvZHanUqGyGZRIMJBq0//fWTGelRm+cBu/AZovRvHNQq/JFGqlM6ayc4Tg6RiNpGHeQcbNV4FiIK0lvc9mN6Tw58Q4e3PeGZ/yHTjK3huhz/Ch42Ex4sPZ01p+FOmhtN42ZqEUFpXQmYtNOTKja6ysTO24uZ4aO9sBeAAFn2xSy3T/mkQWAgk8GrGGZEZ033LJKexv3+vDke6TGskQHHT2GPkea3/EHOMe1aSkeET1fb316ZV0SbnMPUUlNcL5Ifx1Meveg2Dh7jfDYeUYORA7vblzbPUpE1r3DiPtL1YNwP7BvC2egLOBkQPJ/a6QvjZjnlWtLa2w0xn64somTF/tAL9/kKFlGHQ4FMX028jRGfKVvjIAXCpd3ZksQPxcEF7gRxIqirNdbqUqNJRbt+dcBffjqHigGXj1Cw0tzZilmNoqUsQUF2IZ1mIpukwzD7JvH98i4AXGmdrWTLrMWwuvb0C+vEthLN5PCrXcVcIG4N5EjPJyxK9V3lthWgwcFZ8siVP4AUx6bQlIS9Goxk083qaQNUA3lkSFdjPCiO7llqIaggywx75ooUonYEPrQCt1vaKzx5RyropRgyRZH0PIbbkufPTHZUxM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(11006099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: PyBeRZDi0EnMteNpoHH1jIMIhq2Ws8BjGKE3gVPAldzApCHQ3Cc+JC5Z9Y3MoIbZiP2btE+qpzq8qSGuNqK3u6jGnrdWEs5LodoZjOOBBJH4Ah/ZGIcv3XheGHHLLWG70Av8ShpcMaZGjEBMqXZA9f1WIm4o+10+kwaA3Lwf+4NpOwFNbNUHD302lzNLpmRSHQmZjY/hDTLoF+WqWG+USODCoXCWA0mLxMQ7o7/BvgpqJctAAF3Ceq4ExHIIrScL5sK+5xT29SycmYZBH9P7nD/gt7jfKc2RH0Q4okVudoryBbboF+WjX+WDNNmPSStyrEmRHp6ug26uUtXcHaaneQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6160
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc00b043-c48b-4c0c-f758-08de9a2981cb
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|35042699022|36860700016|1800799024|376014|7416014|13003099007|11006099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: tRuC+91iuL8GNecTfEV5HgXIhnfgySzZVf5r/5l6Mo+5Nr/P/JwlnDBJT5D7tNxMeQezisNSfFupqiAFz6h95ADxODwESRlk2kK84xXgYDAtmRQ1C1lJW8bl/DJqSNYBbL4lmtXx4xd1JMxofe2RH4tlXq2iSugUIQVf6OwSqn1h62O1bqLBNLBhoQBPY1QSt3/ti/VIfV9bXBIhCYZ614UUbZ4m6XXhjY2N0djPgTVFAi0b7Hu9v5dqI1trg7IM2koLLhHM8WjCWd3jTqQLfBdLkT0uzSCfzoaChxvIc68j7hQgB1vB1wuH5NL0I+rags/EkwwvjNpClRIUSz/wePwYxE29eZgWHf7X1Hkb63SUNcdovInBE2ij88bEKXKqM4wLvFU5ZRdN3YIzAO07Vlg28WEdzbQKCt5rCicqvdb357sDJBFfZGvwj7o6vZ2C9CQyI3wUoOPL9OpC7sLqCbMOgF0aeLvPLZaGkGdPscpXNHIBqxdOa1Vkts2wj8EqKhuMRTosjJGEwlybrYrfxFJ943gfmlb+fg7wNev0YM84ACLiy2smNO7UTXUbRdaRPfIv8mbplRQldpFv45qx7nZlbyAMhHCnX5j8nYD36lRt23CJh0oMuMS6KBkSpswSCxHCICVIkbirYyWX8KaLhTLhyocOy4+l3+PhU3lPVbcnLra8f6akiwI8GL7/qQEQxGzTp6jqlo/9bO+o9NajddcKbYb2QddsFMr2jDoGOCUE2ug0EiO1tMqXIH4K7tyLUw+9ZZoVKTDwGfNW4U2/Sw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(36860700016)(1800799024)(376014)(7416014)(13003099007)(11006099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mARTYMjUIy//juzv/dmSwHrqmNk+9Ubj55F4dFFKgF3BLEfkr0YDMQgc7mfVnbFPC8qih9XqiHWxhWfyNr23lKksnT701tkoL8LzE3nv/etU/tVBrc+dIlBkJA5wtO1a1gOOYo0xIeRvi0vlbByelQ9IndG7dF3O+vdz5bcHAlPLTXwNlnSUmQVJ5yjZqFYWtWiBAnxPNOEgNjzmZGNxh77V7HNWLFMOb70csy9kP92fGfF/jvaFjo16d7OWgLNqB9aVRlDgUmqHbMBR79iO5H9XY2XkYsw5RazvC6HCnEHnKhwaVp9b1rZRrLWJVwKfC7cB+nn6xuoNTlkMyRRQg22KnpeMHul+MX079jtQabOxLfXdms0zUleybVIggK0oiRF22E7z4KPFaKV8uJOhekF6vU5cNDemEbq1Lw1eVarLu41RLdsRVBLcPfL6Wh7r
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:28:04.7345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e26fa4e-4064-43a1-778e-08de9a29a8ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_062811_199168_802A1CAD 
X-CRM114-Status: GOOD (  14.40  )
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

On 14/04/2026 13:29, Jason Gunthorpe wrote:
> On Tue, Apr 14, 2026 at 11:10:51AM +0100, Suzuki K Poulose wrote:
> 
>>> Isn't this also sort of incomplete?  Doesn't anything serious need
>>> signed measurements? Isnt't there alot more data that comes out of RMM
>>> than just a few measurement registers?
>> As mentioned above, this series adds the support for Runtime Extendible
>> Measurements (REM in CCA, RTMR on TDX). The RIM+Platform Attestation is
>> already provided via the TSM_REPORT
> 
> Okay, but what actual use is this?
> 

Good point. This REMs are planned to be used for 
EFI_CC_MEASUREMENT_PROTOCOL as described below:

https://github.com/tianocore/edk2/issues/11383

At the moment they are exposed as raw, similar to the Intel TDX RTMRs.
This may eventually need to be connected to IMA subsystem.

> Extendable measrements with no log
> Measurement read back without signature
> 
> What is the use case? What do you imagine any userspace will do with
> this? Put it in the cover letter.

Agreed.

> 
> I don't think the raw rmm calls are sufficiently developed to be
> usable directly by userspace. They are less capable than TPM and even
> TPM has a lot of software around it to make it useful.

See above.

Kind regards
Suzuki

> 
> Jason


