Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD71ECD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uqm0NY+BPHajrB21L2p9BpVatvE6GcMyRJC4ERYs48=; b=k2ivAhL+gvs9o2xFJVtlh7xjR+
	zMzSVDipnizimbFRBjL2+szwRCuj0Z1TK5ekSZ3Dfj3I8HxCSmARQ4XXgUUOqqDrX5zGyPCl34ecq
	CMtmQzg4P7bPk1Dmm+I9wdIkwo+3ZujYYDX+Fct9rUPA2QrFzRx4ABkZX31oNVJKadjlVl0IbtJF2
	lx7IyY21ClOWGchSHYxOmiZT1WIxqAPpu6a+tYkceEMTlewW+Gogco7Av0Octwk3rM5RH4dClvtoI
	2jQFL0h22eFC9LuyXd8Rb1ZcswXMzEFr1nxfLq/Tf14XwdHWk5kDN4swQJm3ZTEvy2I4l8TjSpBpj
	DbNcya8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLm1-00000006cfb-2IMp;
	Fri, 08 May 2026 14:01:49 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLly-00000006cee-0nxh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:01:48 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lWu7m5GWL9B3gcVyBw30bC6cOwnzQPS+j4+GtelzFIQPAah6OdqkrvhH81b27YI/DdiuY2UloBzYG4PBIEZzjSvGcr8IK2NzFjJx9YVwKQCkfDm6wxOT+U2LNOuL0RTVJpMjNR1jSIXRZudgKK8JgVKqiw+oUd/UspHE6jaLGf/8l40n7qqDT0vYX2oe3wCkdISOmgVyiFfZR61ktXFPVU+JbKZEnm/F4qKfHpV1O/Z+Jp0t5iSmKqkoLlTFO/uAaK0WHoFvWNXW/xisYL7ErtPw0zCHzx1gwKYw7VQiedXilKdrlix/rc2fDwjLqKwOirLrKq7S6ApQoCFqaLqoEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uqm0NY+BPHajrB21L2p9BpVatvE6GcMyRJC4ERYs48=;
 b=IFtjj8jqlUcFalUNCJDT9p/U+zyptKqyxq+goxRZtHoY2aRQRetiTEQYgwao9yxSxLR2K6rykLKNhanK8C7mqrccP8QCc3KOHPRj8ltvi1vp2aVzeIMVbpltm3/GhykXs1tDYER7QIue+kPJGwIKNRKLI+5brY8fOqf4mVzjpWhLs6WKhgo2LPHT1zfOzvlxqwb/ymJWApPBfJDw4Hploz4Knn5dxAVcDQ91/b3jLnLgDaaRSbUE4ooH1Gxq9l083BgJgdD6IViExRGGdQokEPxpWI+4USl3I0PJqxdXlyTBX+iuoIdYC5e4hcEuGgfOn6KdpVLtMADxqvvRk0Vbzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uqm0NY+BPHajrB21L2p9BpVatvE6GcMyRJC4ERYs48=;
 b=J+RftXiM4oAuVibV+XDF3gaKy0AY35TpbUaVhS4LAWtMlf7GedAHziSA0zUwRP8BT/VfzXjPRcCHa/63SWMgmY4QiJkRjyW43rBzGsl1+wF6nSBfXocWa4AuHITEpuWySiZkbLX7Wg7JAwc4Mdn36ylTP0FKwqr2SGWaklkqcxQ=
Received: from AM9P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::15)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 14:01:33 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::75) by AM9P195CA0010.outlook.office365.com
 (2603:10a6:20b:21f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 14:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 14:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeOUoJ2js4Z29sf4y6lulVIyKN9XuzERst8X9eL4B2Wgb2nqlUk4q2Xsn+8pKh566hCswNIy8N1yczUkwBlWHbwzYPoNSdb6kFdEsJPzcoxTJnL7BnuqZiEb/0Qf2jaBeTsZjmAM5XEf4vIf8KZjeQ8hzumXT2KDDzs2GPOS5Adr857Nku6mkZ5FEpx/IGjKngdkqrX//0rUwhDOQFVdGs1T46WzJuzHkgT3bIGqt8SxMSXGh/RNHdV6Bl5QpBB5x+dVYIVq1hdWEzzWvNzAiasv7147Hw9LU6CdPJVSEvwSTsd1i+vZu+2BHnkFpxclAEOpXCrEM4AyxZpH0aBc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uqm0NY+BPHajrB21L2p9BpVatvE6GcMyRJC4ERYs48=;
 b=G8Cai2GGHhn2ToOH3YbWwfj2IyVRxcNhM96XKRgu7pXEiDy1fHxtTblm00HKKmNtsUSb6os/ZbQEaGZH9RpsRkyXA4PaHOy/1wR/VCl+GwS+fyvXj1C5AnEZCc3ZBwHRPAEd0yR14iCTDOXx9zV7JZKEc0BRtvFDKRCH3QBA9duGxKiXLHR7QsFpSQus9qGras5NXl+p0FoePuFhPtGSkqKv9c7X+5oF3OL8UKEVhEFlRAuf9gu50ACn5LRNVyiB6mZWSsDjQRTK9RW/WopHHWug319M0MjfNA6cSwdujr7Ob/91Toal7GaCUfHNJzfxFzD+0Z1m1YQIMkiul1bbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uqm0NY+BPHajrB21L2p9BpVatvE6GcMyRJC4ERYs48=;
 b=J+RftXiM4oAuVibV+XDF3gaKy0AY35TpbUaVhS4LAWtMlf7GedAHziSA0zUwRP8BT/VfzXjPRcCHa/63SWMgmY4QiJkRjyW43rBzGsl1+wF6nSBfXocWa4AuHITEpuWySiZkbLX7Wg7JAwc4Mdn36ylTP0FKwqr2SGWaklkqcxQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7723.eurprd08.prod.outlook.com (2603:10a6:10:392::16)
 by DBBPR08MB10602.eurprd08.prod.outlook.com (2603:10a6:10:52c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 14:00:29 +0000
Received: from DB9PR08MB7723.eurprd08.prod.outlook.com
 ([fe80::f81:9f7f:178b:f147]) by DB9PR08MB7723.eurprd08.prod.outlook.com
 ([fe80::f81:9f7f:178b:f147%5]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 14:00:29 +0000
Message-ID: <978556ae-a158-4289-afcf-423a4329bb72@arm.com>
Date: Fri, 8 May 2026 15:00:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix missing error code when trace ID is
 invalid
To: Leo Yan <leo.yan@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com>
 <20260508134437.GH3778514@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260508134437.GH3778514@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To DB9PR08MB7723.eurprd08.prod.outlook.com
 (2603:10a6:10:392::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7723:EE_|DBBPR08MB10602:EE_|AMS0EPF000001A2:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 97766099-97a8-4836-d9ca-08dead0a4f81
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: n9dZEU9F1juLzm8paeO6eA/Kp4L4HqtrRODFpfspF94XCZ3yBSckqKuoTpC2F8srevpNxV70ZuD4B2XicXJ+53O9dAeoVgKD/gx5dtoHSexxj1dTtND6l9HgIq86rQQ1I8j4lPw3WqNw/7gZAnE9TlSkrywe4MA3RbxqB+eoINKVWNtrmW9w4K0/gL2IjObsedo60HyIHUHIn1Si5PUX2b5zMuEJfXqDkacjELNcx33MxbbVsXfh1MSb2ioRd+DcPRzbrm4zrnrkuNV34djIlcu+fN/lb1hKiDCcYaNx/m7YZEOQi1OSqnTYV4+FnqKNW3VKCH8E3yLgXuOUaVK592JZOhQ/8dTRQWejxb6znGulGeauZVuV9iczDjq+44Xc1EDhQ0U/w0ZTmRnNHbr15SLTXdJN0LW6Wz6fUhOhbM9eBjHg5pwrU12o8kgwvYIyuCM5+cdbpLxxa8lpUsEYcxZRj9rrUcR6stzq9V0fFdpz2DMprKzz7UvDO1TYWaO2RVuIzIK4/4D3FpBM8ilkRY46euRCCboxrGURpw4blcq3YJEIk1VQbwO4yxp97HedOxn3e1q4PStzgrOyUhA6uqS0caW3MHwja8Q8qDLPp5rTppUO7eeLjtP4MGJejX2F4NegzQmlzq5JzAuwCJSWwuE8mJ08XmTMvAYCyu0ZacsHJYM10sDxGP6D30LACR0g
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7723.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: a+EAn46LWaTVfXQU+QSiXWIuTkBEijCQllE3cY3F1ObTARuU7zpO9ELR6FuXjcL8+xP0gkDJ5eHRTkdDAJCARuUqrfoCri8j/x4x98JOs7McdyjKiL84c7pFQUlky1ce23Uw8qatlSH5IZbKtJBKP80tJqAhpvuxcZK1B52CUL7snod0hPFvFbD+cUvouNBKImlUi6XDeCmDISiOYLuGG0rrPRtpxvOupjucXkaAjAEupHzhOM6R0rm/day/W4KHEpZfNc0n+diLT9sHy/O1+VG+/A2UAxxw10lccQHvTU7sy2WkXP2cwdbkL+JiLRfPKVCI5jV/dYJ10oxHrEUumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10602
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6765f70-b871-4823-320a-08dead0a2975
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|14060799003|35042699022|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: A2kOY4e2NjyZ7yQG+XdfwcXmXOYbZRB2oYiS+Bess/s5lX8KkWDmjRNC8KUbm+p0y2XvfJqNZFNq8RXAWFI/CYyFkyEtuLbZVwEfZs5ugDLwZKl772TTD04eqmAxwsmuWmvHxsNmCcBWINxcoU9KqFygMlNzYH2ZHWE36YQf8nxTOl5q7G2yo6jYSSJccCltqiCA2DkMJAmJ2X5BHb9cDttKplfP3iCYNCeo1/0xBhC7NgavpO+nvQ4oYtNL7pqZKCyPpxBxBVQNmV2R+WIR42fiVcTVsouyoVPAamVhoPSMKEdIFT5UumTz+6TGxfvuYEUeP0b0jROg8EWjSXOAwT5AMFd5UxjyHqkk1F5joKafF498d05SDRBevpYR2qJcpamS0adiGpUObA95FQ0k+cmbqwfD56xK+TtsqDwD+yQrXKOy2u23xt5r0XiHgOqw/myu7V2RpAD4MQ4Rq8MJSuVoZePXoyGBJJy1kMlY/xL8arjNebtSW5xCEg0DrBjcw/FaId9uVXFyNj0ovHsLzpKOAlpVji13bLDhD0X58GxC1Ok7OtQ0ZHBD6jrpM6dCthNyiCtVukO6NjhpfIANfioHXktk0JGht3p2FyCizmaVPeLeNHryIfjMTWzOPzfAvHHzXBjb32dLgKVIL7kGHD722wEpiRjkxgQfj7GIP2lwjd2yQW9czg/2bU4tRZknaJJUseAuQ89/WoGvQqIrWstNb7sCTXhmtXPTJHjiqfQ=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KHpMh4bCx/mxj/FAyXmZQqBKHhQEjOvzPbBqnDYX/VCiKKtxuTACvRwnh94hDkIDgkPJvCOrNX0DsOhPsxd+yXupGfNv2JxynzeHrqyU5YTzkhd6k5M/2S8sC9CjBwVT9PWVJNnRAa4kdbqlScARYvIkzF9mDTozQbb0Zs6nV5V8U3j7FfAl/RhHYE5MGL3E20QWOiuK8VqV9VxOaG+UNasa4hfFJpeQsKTWnQULEEijHvr5dNNw2ywsZEWsG0ynxSn0vdHa8DicOkaBMGB5JrLiThQzDMQ+/q8EzOBBd9CBvxmanmilOfR9xWJleVkGPGfiwGAquY6FFxJNOgT06iwBNs2bPp/tdypkePYRp7YY/s39jJHJTpwg77D/HCBE55HCtmeS+qnrhf9BLfDqVPqaNkuU0mHcf7pq3TA5+7xbaVvO0V8HQCg9DsE2Snup
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:01:32.7387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97766099-97a8-4836-d9ca-08dead0a4f81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_070146_235409_90B6B8B4 
X-CRM114-Status: GOOD (  11.90  )
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

On 08/05/2026 14:44, Leo Yan wrote:
> On Fri, May 08, 2026 at 01:45:35PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>   	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
>> -	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
>> +		ret = -EINVAL;
>>   		goto err_path;
>> +	}
> 
> On the top of this patch, could we do a further improvement?
> 
> Move IS_VALID_CS_TRACE_ID() into coresight_path_assign_trace_id() and
> return 0 for success and < 0 for failures. As result, callers only
> need to check the returned value.

Yes please ^

Cheers
Suzuki


> 
> For this patch:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


