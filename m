Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F72105F79C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ww5us1W7mMaMokHEpRijsKCnE1hMmKFu0jJyV1FvEo=; b=Z4oBuMvX/Nc+oXH1GeLjuWxj3T
	O/0LJRRTYDObq14c7bSTZpI7h5BW0BjcMB3qKuW8+8pDRfXQa5VIjgeJIcv6PNts+YudD0Btvnai6
	r4xSf+4ElWmSOAD++GCm9N6VrtkIbx2aRO5VbGIys6Z+DxWJT7Dhx7RNhOvzFT4RK8Y/SM0DTK/0k
	QXcBI3FrvtaaRkwSVCVSxaXyE7gYsTjeiBGZlmcYPWMK2yWFlEzbKUPCh6NHJiG7RFGBCQP4ir57q
	Ohw2nC9lKhYXszc3pXdG/sMb0qIBFP/yVbzhoS55dyCE1jit5e+HnCH5nEjUJ2ECD3iM/yeKakOQ5
	NKTdXxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10ks-00000000286-08Cu;
	Fri, 13 Mar 2026 11:32:34 +0000
Received: from mail-northeuropeazon11010007.outbound.protection.outlook.com ([52.101.84.7] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10kp-0000000027i-2exh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:32:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VS05RJLPBl3bYf675D453Yu2a4kUTY3vBW3JFJnxtU6KTBy2KxndEyJi5ovwMvh2XXiGbGqUl/OeKGzlceYQicpBnioE/MHjhkpPFRmhmsNpr9v+nbevQEekGV5nIKT9i6DIDotECYLjgOPqmCptqsoJ3B8Iyf1RakfCXCUK60S9e7aG/1rokxdMf4Z94uk/CMMp8xToVLa2gQEV5tLnV0XA/7XWHePzPng5SIURJb6mrBoQJncH/zZTKBw+dXFGPMlz/BDUe0yeqTY6wua3i91SJqohxVzJ/dmTISuS+2krdX8+q4pYCrYnAfmfL3+q620QulLwetqkshfW1nlhqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ww5us1W7mMaMokHEpRijsKCnE1hMmKFu0jJyV1FvEo=;
 b=baVQUHUbfyl4ytABvazT24oNbpfKkLoiFVShUW2K6yFBJjkpgDhLhj55cJjdtLI+KdaYk7HWQu0vwiLQUihPYczsbvn0Cb+TDrrR9toe5JmNDdc9uJMq4gPIiWJdoGHJ6OX0zFH6BTmSTBU+wZ6t/8Y5dgOEZauGqWfOWSr4oBE/qUINc00fVVHwFYyYTTr5XGYb1DqBiXk+PoF1N5OWa6A9VPmFgHYIveB8Kglnz1zMZ04Vu6wJQ7Te6a5vHoP8yyKRyxyYCPxWlvQ1AQlgeHqWsnpgS2OPQtZsZ/N3CJTK1KKTaCTKuJ/W97CsT2iBVMmWWhfh3g+rK9xr7WOiuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ww5us1W7mMaMokHEpRijsKCnE1hMmKFu0jJyV1FvEo=;
 b=OR9+m+ixk9wCtHlyFEVzAUvkGDfQrKEBX5Mx3jmVp6IFesnvBkh180SFK5SKBUT14xIlku7KuQ0z8a/qn9eLDn233zPzDpTjW5xnjMIbiwiMiTfB90le64VI5jda3p1MnMUvVN+aCdGGK3XVyR+33aQb+l6SPZjtxmUBhZbGTCA=
Received: from AS4P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::13)
 by DU0PR08MB9077.eurprd08.prod.outlook.com (2603:10a6:10:471::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:32:24 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::a4) by AS4P189CA0026.outlook.office365.com
 (2603:10a6:20b:5db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 11:32:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 11:32:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9QFa8SsZq74OirTT5nvf85iEZ7dwOGG0hklUxn3d63ZEii26zBhcwcp0JUbtDSPuFtIAtP5DeiunveLooIugtO8QBi45xMHrjgcBOT8Mst9P9Oj7c/YAreOCiMnYE5VIhvIr7oGcXiIH/3Ap5PKqrHnZa+0CrQ/rPbdcYoI74TI4kTluUjpuyTHnIT+i1by7s+tWyVhLwDKQuan8X908aWhE+7u6w1eACYzrxlfet22/sw6OFXEmk/4eutIy09nxDaEsbXxU2Stx/EZU/NVm+NuHhkhUnhGHjjFRnHtH2euvjsHtnPb9vk7r0z1/PCuxDdS0Vq1uJo0r3QOl3Tylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ww5us1W7mMaMokHEpRijsKCnE1hMmKFu0jJyV1FvEo=;
 b=A5nz8W/xk+A2A//A4VCgqt853y70YufH/hSXBwpTyJuy5hhkYujQop5OIX2g3mvHsftAVoYTugEvqooIbdnH4onEsyd3jAIW2YC+5m8pEybEIs2wgn5vX2Vqwc7T8V6+hrz0qnQiaBFmw1uFgLognz1LI73eDOCOJU7lHZ5mpJgj3Rp28aIBhGEGhtIbRReU05rBMNw5fK69+gTEdrQI+8XZ/VUE94p1VBns2JI+gxYhCbEgrpyZL5jP7f8olBU7cdsLZgWcW/YJdysGiKtwwRSeKD/bQ7UlUTFvEJll3TiXl7PRMlvn/BdoiaIRWdu1G2MmWwcbP/49E8DP9e8ADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ww5us1W7mMaMokHEpRijsKCnE1hMmKFu0jJyV1FvEo=;
 b=OR9+m+ixk9wCtHlyFEVzAUvkGDfQrKEBX5Mx3jmVp6IFesnvBkh180SFK5SKBUT14xIlku7KuQ0z8a/qn9eLDn233zPzDpTjW5xnjMIbiwiMiTfB90le64VI5jda3p1MnMUvVN+aCdGGK3XVyR+33aQb+l6SPZjtxmUBhZbGTCA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by PR3PR08MB5594.eurprd08.prod.outlook.com (2603:10a6:102:8b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 11:31:20 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:31:20 +0000
Message-ID: <a997c89d-d87b-409c-b8b5-c4711a2be83c@arm.com>
Date: Fri, 13 Mar 2026 11:31:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/19] coresight: Introduce coresight_enable_source()
 helper
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-8-eff765d211a9@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-8-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|PR3PR08MB5594:EE_|AMS0EPF00000199:EE_|DU0PR08MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 72dfa895-3ff7-48e6-25f0-08de80f43288
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|921020|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info-Original: u0n2uWloQ6Bfolv95Sbqz/+JP6uiNhT5EjAI6+xup3RPdigPlwB6aVr8Y1ET8X8NZUvXVQSfQafIoX6azwc1PVqNFborenaUwMcV0mPSXo5U1/DLG0bkSZqmO1SJR3s5VHZ4nzsulYsDoVjQ78ohbRYJmCaNCZZMams7hmrhKDmvfvxKRpciadGtR0gUaZi8m9n+YrI9sFi7ysvVMHRugC85cRW7SHfn3RLuODYBCDfH/WcX4AXLYWB5elSccd6uHGoRI/D5nJzHWpDh99i544f1/fZA0kWJvs59JSCvOu5zLiU00iPcf+lQY82YTh6QviU3x9dqOWFu3+WcK0TnJYW+KPymaXEfyPUaO3rhv+B45iSGS9YdB8advijItwJOjEzxvGuN6Pb4MK0EYJhiXd/F6SquA+fmL4S1xAnOZQVzjHIBExUqqM6NszVsuA/T9qX2x87955gAWCIlw0T1lUa0aj8DYpf91gtLgZ1+mZGu/d0tFeafHs1ovx+LQTfr8eBvd1RyrKK/zClKkM59pLYXw+m5WkjJyh8cQBy4kIVEb566ua3/8sEELYxKFul0FEIsDiEONJ7AtNInXpqUeiK6t0Xq/xLvbklxM4Fs+PP+HINIvUE7XbBSt0K9nE5OEjp9wpDB89migKbd/57Zf4k3gp4BdtgAHuKlWHuF7Av2jUORwZBEdByfDRpSxEiVjVD3nUMqK1i/NA/d+zAl5rVrbcWK2hrVXaGDCnHTSJ87KErz2bc3NYIpFNTMMyxI4OFTzBIF9KocMAxdfObh5A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: XxPOXKFV49++ScVMsbdcdF0p7HGDf2J3MGlBlcTFHwKBlPbVwlizR2cvAMsaNtO4ceim7ohH1tHAyNUGWhjBEaR4puFoSqqbD3grse2UQy5nTeGbSdPzvf4NjDMHAtMkyGdcHVdpCEIBP8q+GlZJhaxPqXrpkcfNGMlEHPezmcBZhQfZQ4QPBFA9O8z9iNLH9N93RZTbVCqL68JYUuLTn8ZIiO5TijtFxaPxNqikJYwv5jlwg6ZxlGncWV86Hkim7kSDbi9KQ9JMpmT6x+CxBCtbs6XXu3Be4Zth6Xc7DhQ1RyqLlUl7nAW6a2GYgvcys2ktTgM9DHEr3lOQjvqOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5594
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ae346334-04b8-423d-e26d-08de80f40c59
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|35042699022|14060799003|82310400026|376014|22082099003|56012099003|18002099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info: F7JxaqLfViIe8FRA09cMqJPfl3loLK07NrwZkzlEO7TXFyIJg5oOQhdRmvS/BHh4JfaK+A5rJmIMFkg2UkEoNgGAf2zmAHSZVMdziCnr688Awap4WkO5H09tzr3edz67MHba0/++U8c9TJfGUCh+51YShIxq50DvPaZdeLz48g5ukgBQ4WzuhyDU5nxiJHxkqBT9OJBdCvdocopU/Npap0Pl61OU68mbr1RjB0LFMKtbn8GymZ04hP3MqoRa94K+aTjRfcLw6RIoSTbMBTLryn9z3Dd7fweFKz/J3hkZRKZ8wujq1EUHpnVCTQlyRaa6I3q0C3r/WiHRT57DJrDdWnUmoaC1tNXmlaC0xLYkCkAP3YSUNE8N5bATGEyVbATBoDh4M5glRvwH1EAkXqIzfWgOLi8r8jnoYQNGwDcmyV+W55F0F3SFkkYgdukWBttFiGRrjRsqBRFdQ1CsyMP2Dtt0+j9RWreh1nKdujF1sXJzlg8WjsKaALtJtE2gY0MEEb9qOwdT4YXwQ8quzw5WbmSeOY8Nz9z16GYU1SnZNF97AYoAgY0o/fZyz1e9nLOAzdT7iRGss77XNjlQNdebgnIqw+Y7MXCe+xvW3JwO0KLRG40OdzJNSYzxB13LZnKEsZuT+j0VfudtCNWabNkI00MYQZQ2zgrZivZUhsb1FJ4F8y2Wyb6EIrIzAY0KWFA6dbzzrnVgH81wJZEtiNfN1qi3zoTnbQSCaurVS/epjcPUkfrJMMhliCyLp71pYBg6QcJhORmYZUFnYUZUOpgqWxPvWd+7OCeQVwt14lD0PhX0NKdPN827odTnu2mtXkMc
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(35042699022)(14060799003)(82310400026)(376014)(22082099003)(56012099003)(18002099003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LqIJC6x1QIzVJHRkqbknzwagyOWvoyeJlTwTiW1gxXlRAWl5MgmhP6vX5zv9nRqbPCPrYtE0pVMR/QJjLpfIyMxfj2AhCmOdOZsQECN/RZ++u7U4g2drov/Nu+xUbXTlSOK+oirkgBGjb87AMzeK6tlnSCE2PZPZCwBAXgzN8tp9eoV9y0/CiNsrp1tqsXFkf42IHrPpoAOLZtm62zyKTxCVAFr2D8mS7zF47sPu3kEFpTBWFu8KbqKRBQZNZYKBNIIi12wO3YXsicpPxQLGRhYMOGTTSKZ0AaTKDvxXZmewbDvjV8lW0Jze9/MMqiANWnZdBN/0FigDOEBP6mod48IkqkQ6EFFPZhipWwLRbP2YLjZFG/1oLHsMIc5uxSH8bTU5EQYBdwKskqVnJJ3XeTn6ZDTNSOJPH9NNnWc8FLPzIVbJJLp9MU6AfsVYRrd8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:32:23.9788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dfa895-3ff7-48e6-25f0-08de80f43288
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_043231_822581_BD5F4FFC 
X-CRM114-Status: GOOD (  22.47  )
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

On 05/03/2026 10:17, Leo Yan wrote:
> Introduce the coresight_enable_source() helper for enabling source
> device, refine the comment for the imbalance between enable and disable
> pair functions.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c     | 15 ++++++++++++---
>   drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
>   drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
>   4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6956429ca507d850c8b8c62c65de4b6fe1a1740c..8e22f0993631fa3749437175ecc984ccb1cffc13 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -437,15 +437,24 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
>   }
>   
>   /*
> - * Helper function to call source_ops(csdev)->disable and also disable the
> - * helpers.
> + * coresight_enable_source() only enables the source but does nothing for the
> + * associated helpers. In contrast, coresight_disable_source() calls
> + * source_ops(csdev)->disable() and also disables the helpers.
>    *
>    * There is an imbalance between coresight_enable_path() and
>    * coresight_disable_path(). Enabling also enables the source's helpers as part
>    * of the path, but disabling always skips the first item in the path (which is
>    * the source), so sources and their helpers don't get disabled as part of that
> - * function and we need the extra step here.
> + * function and we need the extra step in coresight_disable_source().
>    */
> +int coresight_enable_source(struct coresight_device *csdev,
> +			    struct perf_event *event, enum cs_mode mode,
> +			    struct coresight_path *path)
> +{
> +	return source_ops(csdev)->enable(csdev, event, mode, path);

Please could we double check to see if the csdev is source and then make 
the call to future proof this ?

Rest looks fine to me.

Suzuki

> +}
> +EXPORT_SYMBOL_GPL(coresight_enable_source);
> +
>   void coresight_disable_source(struct coresight_device *csdev, void *data)
>   {
>   	source_ops(csdev)->disable(csdev, data);
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f85dedf89a3f9e85d568ca4c320fa6fa6d9059ff..11c529fd4f3df973e5be9de2a7686163c1abceca 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -533,7 +533,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   		goto fail_end_stop;
>   
>   	/* Finally enable the tracer */
> -	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
> +	if (coresight_enable_source(csdev, event, CS_MODE_PERF, path))
>   		goto fail_disable_path;
>   
>   	/*
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 1ea882dffd703b2873e41b4ce0c2564d2ce9bbad..22fb6c5bffbf714bdbe2f4dcbfe66e453c2d1f4f 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -248,6 +248,9 @@ void coresight_add_helper(struct coresight_device *csdev,
>   
>   void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>   struct coresight_device *coresight_get_percpu_sink(int cpu);
> +int coresight_enable_source(struct coresight_device *csdev,
> +			    struct perf_event *event, enum cs_mode mode,
> +			    struct coresight_path *path);
>   void coresight_disable_source(struct coresight_device *csdev, void *data);
>   void coresight_pause_source(struct coresight_device *csdev);
>   int coresight_resume_source(struct coresight_device *csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index 7c7d3a3cb9f18a9dfa78eb5c19dda43fa6656271..cb1d4f90a9c245b2c2f6e818c0f4d905b86477db 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -66,7 +66,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
>   	 */
>   	lockdep_assert_held(&coresight_mutex);
>   	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
> -		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
> +		ret = coresight_enable_source(csdev, NULL, mode, path);
>   		if (ret)
>   			return ret;
>   	}
> 


