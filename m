Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18A7CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLPKytk1wvvuH9/A6zaXrXwTqBqqQEyICugi3wHaOew=; b=1JICCeMEIXsZUsHqwR7lq4p7qv
	leOaxDzS/GV96FxdsXl214hgLRoVFPYnLzimg4PAcoxQatIvkTDLpT4ZbEvVbMy/a+jS9IDkTKEt2
	QQVz7TnJZY2giV1Bf8cPP/TUZTQ4y2EBSOKRABVRJVt3Rf8UfCYkE9iekVUzrdAwj4+2yrQrd/9lX
	gWLrVT6SgJGu5df24cW/fa8t6z8GtpA/4W9J32773GQ7s4KKXWoPot9MWDVzoNUuKD6seAnaS/y3i
	RR20jMhvCcySeXtjj+5cMzBXv1QzXV8IbQdyd6g5Zf2l/1KIluy2TXJg4GGrH1uwH3qPDw5pq5+FU
	uHUbGIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOts3-0000000092Q-43SA;
	Fri, 28 Nov 2025 08:30:28 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOts0-00000000922-16om
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 08:30:26 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ElRvm4uNu/AT3dJ9kPyOIBFC0JvVrO1OZYKGLQM+V325uNiZNsUbjihT+wptjIhkxrZQXCzT3XWCouiw3C2/qYM2EDEI/o3JfdQ6GduZYk1J6WhJrsiRhDWXbE5HI/W0SvCrmLoI+FkQi2nykSSx071VVYXvuuuV0nbwqlOVEF+SAunEFetY/BZiGboYGFBa7+Vb4TkhtPB/eQ5hQjzFm58Q05Mbi1RPKnysR1Fzo3K4HjhXYgL9j9eKZ333TuYPUxiDyaRUR6pFbzXm8Pi1VMJ2qDs5k+s8DNmtsknyhEBo/+JRDzSQTgoBw0sryvPMWJ1G9z5v5nNQoDgGlVfgGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLPKytk1wvvuH9/A6zaXrXwTqBqqQEyICugi3wHaOew=;
 b=d8piFTAuwGS0LeOnHjldZgx0zAM5n3GGiPMn2oF2LTkkYU8jcZwULjtxez0c/OOQhUxMEEsyRLlr17swo7jywYXA65CTHmgQjIms6Ge5MQw15BcqadzyzXfcIHJVtHdBaHLGdO/xLiMLuJIwEC3ED6WmFV1J4kqCzbNtuj72XBFqwvN2DASuHiRkakbev2bXkIjx+jGOlR3yH2oMbYW+UouBGfdBIuhGO/3CWwSfqsU5wDqGX9HMm7jIZkNWuJwhlfTNL3mZAZB5otVe/aXL9lvHT52XJ+IpfervNtCi88LNtFeAUlYTbYbRYqH/YDe0Ua6jTAoDK1xHFHp3XufgWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLPKytk1wvvuH9/A6zaXrXwTqBqqQEyICugi3wHaOew=;
 b=DU+sGin/8ocY6k1ONxq/3dIrcmwXUZYHT8kKfFO+lIkXbGChImqNKq+uBk4Aw/eSh6ppkwSQ+AaI4FnMqsaRgfJc68S4ZRONneoK8iI4vpL/gzCLxQUY6LUhnnTLcDohc3rxHf9jWGzIubtbhsNf39gaXPEYOVHvJGx5zHh6IsE=
Received: from DUZPR01CA0140.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::23) by PA4PR08MB6078.eurprd08.prod.outlook.com
 (2603:10a6:102:e0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 08:30:18 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::6f) by DUZPR01CA0140.outlook.office365.com
 (2603:10a6:10:4bd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Fri,
 28 Nov 2025 08:30:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 08:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jyu7mP5lI4A6ePkckmezHSuWSFhYUaYGaW5wL51JDW+MgEqiCqerdZiV3qZgZkT1rxfE27FnHLLMwo/1u84LI3TUoPV252uVuPDvsLphIJhBWXRO34LRnrgt35IEyMTXUWm/Oiq6kOa/7cIi4mjKEJXaHLNf5UP+NDbrIcLU4JF1uu+YhWcgmOA7vyIXZDg6FFP5/lNK/2ZUTRh2u9V7oWH/CSywMkmJa8RAeTOJRPaGiDIQzu+o+WqNRswtRZ9/b46AxXpkz6HRthlwouMygk01shS/SyhvmdC+8eWaRIAX1wf1rVRgzYQUchF9NUKHPaKBClfIPvv+PgXPacxN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLPKytk1wvvuH9/A6zaXrXwTqBqqQEyICugi3wHaOew=;
 b=v5rx2u7amL0nILh26OCO3G856bQUQw0ips2y1a0ymsP27iTUOsYoN8HVA5Gi+QbVOete1QI33vgKN3cLETmR04d1o1J6hsFCDW9iG0TxQb9eEBzdou/w9RHscbU3AEYC8ZI+jRBIC7yTHK4GywQUfZz2jBQhQBLbrBDTo/tVR+t5DxXnVgKJSLC+gZykyIr5iKAwm92n1Ah/Lv6jgk4zO5Zmae3afE375VeEhg/dkWfX+TvdoOvDRwHt9F1VTe9fP5sY/XOngH9AzpEgscTzLGF0R3DIVkWhyuZx/sqQbsWPvst8XRwNmGa0WTFYpuiC99d0MxA/gPmVHXkYLc8dLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLPKytk1wvvuH9/A6zaXrXwTqBqqQEyICugi3wHaOew=;
 b=DU+sGin/8ocY6k1ONxq/3dIrcmwXUZYHT8kKfFO+lIkXbGChImqNKq+uBk4Aw/eSh6ppkwSQ+AaI4FnMqsaRgfJc68S4ZRONneoK8iI4vpL/gzCLxQUY6LUhnnTLcDohc3rxHf9jWGzIubtbhsNf39gaXPEYOVHvJGx5zHh6IsE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU4PR08MB11834.eurprd08.prod.outlook.com
 (2603:10a6:10:645::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 08:29:45 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 08:29:44 +0000
Date: Fri, 28 Nov 2025 08:29:41 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, pjw@kernel.org,
	leitao@debian.org, catalin.marinas@arm.com, will@kernel.org,
	coxu@redhat.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <aSlddQxH4z3LPxG+@e129823.arm.com>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
 <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
 <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
X-ClientProxiedBy: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU4PR08MB11834:EE_|DB1PEPF000509F5:EE_|PA4PR08MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: f5be4b95-b95e-4e99-1c7a-08de2e585ca2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Qnki3jU8EFK1XmLTayFi+IgLbl4Rms68tnYqQV7I3tOs4Yw+5Dv5YaBEfH0x?=
 =?us-ascii?Q?DbDeoqGLaWiDhz8bbLW45g+a4GI27Hr58tuQlk08Pm+w4JKnLvwxbn+jv6D2?=
 =?us-ascii?Q?de6gZxHlt7H18MuJsVhGUt9IYOqX1TuuG8UAVn7L+ihVJ8Gluw9KtDgq7rIH?=
 =?us-ascii?Q?kKf+ci/bCUYfJqBFQYTlzA2B+eM4aujvZQEaDOGmfQeN0bY6nVGfW1SviWZE?=
 =?us-ascii?Q?7zmiPrzI/Dm0oGdVVWpGJx8djhbvYEq0vzOX3Fo2xBqCZoM/hzA7yDIgmUgo?=
 =?us-ascii?Q?e5LIMBoMxHcwiCbD/i/kSkqPe0j+Oj1uYGji2d2bM4qAga6Ogrv5/1pSsb6u?=
 =?us-ascii?Q?57vTZ6qKFEjq6Agrhs7odVGnBaldKAMYCtRJNpo7TYz+7um+vVSWCMI2GRpm?=
 =?us-ascii?Q?Qe3gPo0ZQgitIwctvuZW3hsWX5GejdOsQ8Ua+QgfwzpyrSc+sSfJcui9dR+m?=
 =?us-ascii?Q?MM4fGN+G0arqsRGYBcr+TTDYQNJOOtIhJLJjQZfiJTw3grciVXztiKttJBSv?=
 =?us-ascii?Q?vbLhDacD1IQjvg/6NeTZyOf6xrx64vewK1sbFGSGeCpy/9Fh8fUIVG7zH9BU?=
 =?us-ascii?Q?rmSsmgfrS5jlHe458RnIY42k22fsVXh7iuz/ULd4rZlY/rodYN8VRchwSdJK?=
 =?us-ascii?Q?khoGQrKNeOnksTyUp0N9U0oO0Ytwp76VN+ok8dkK/2IMIw8a4p0lZD3cWT63?=
 =?us-ascii?Q?iung9sbpf6ZSvG8wWOPX8atPzY7g0+NAher+t5JqrIsvdqaVAM0nRMOigQI0?=
 =?us-ascii?Q?YLetcjSbsiGsLcK5C5yYCaVGCWuUJeHfHL9QDJQ/LuhEfx/sHjnwHf7QL1Wk?=
 =?us-ascii?Q?PAqk9N//GiMmYiE+NT5hBQ/Ke/hWVkpRBnXpoK0kxNfPoyhLlhzG89SEq7uY?=
 =?us-ascii?Q?21dKXJ77NYBFDbTUEZa3JW2cpGTsH+KbcyJoJQaAelXuWTu7KmC4Jv1ZPHp/?=
 =?us-ascii?Q?LhrdYr5hNMTj3FPl1haIBCndNbfyhr2qQLGeohilpmb0Nf6Aks5euAFy5Sey?=
 =?us-ascii?Q?rciJ7/6CwyoBOwR2vvZUI3OINQfzCNHOk/zdPhbK1sXejJAxsjmlrDTCBIBX?=
 =?us-ascii?Q?3Gb9QUBoNYyPTHQJzbUHyrczl3T+eHDki/PgIAvJUK28VFwoEbttiQRLTYUx?=
 =?us-ascii?Q?XEM2pde2TMr37rvPCHynIEfJiFnDVy/LeRkXSivVu87Hw0Y7Rv3+xPWgtbFQ?=
 =?us-ascii?Q?zmoAmPjdYBazAEBxbi2v4Aj0IE0TZTJfe0Q8tEXbJ9zbKDk9EDLYjzgNXreF?=
 =?us-ascii?Q?GJvTk5sPEGsFAIsU2KTWM04gXw9GTqJXT9IV/i73ef6BGagrpMuPUjLXbYUo?=
 =?us-ascii?Q?nHRnVFPoBnvrJT2HLBsfZ6a46NzyhMfeRoiOzdfSKP4CTvYJtnAssCw8YVYF?=
 =?us-ascii?Q?ULHpvzmNAHovOXQWvu0Cy4HzoOMjyhSUGtZ38U2hpJpHVL/yIg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11834
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 485c64b1-dd99-4048-e017-08de2e584869
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|14060799003|36860700013|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H43DYPhB8ess/mr2x64+yfHEaduMSyKUNwK4ly5/cDcmL4cAQsKJVqELtbhR?=
 =?us-ascii?Q?5iQx9pJnt19oFRV8UAkbhuvPd+2/peJo4UR0BGGaIaC31P53MSvEySl6WwbZ?=
 =?us-ascii?Q?ekVYFOfiwZinhsQOZkGqlLOe+X2DMSQh6G8Wj03EDMpCj6Gfgobj7YkJSAr/?=
 =?us-ascii?Q?jiNdvxCKzjIHTVSU9XEd0YCh4cUeUSNns8gdNL9P0U9K9aLZN02KX5QSZwew?=
 =?us-ascii?Q?llovVtJDkNlKJZ0R/X9JrkzEhqz0YWw0ru6mG+TVuc7DUPqTVeJB52gEfbj2?=
 =?us-ascii?Q?tJdRwlxkSmO1v01hlij7XZp1cbndl0v53zRZlwp3UzVEtRfRMywf7CtKJiBY?=
 =?us-ascii?Q?LHmdGOVqpoxREqrT3+xE/hsbGmmcAgnQjWQuX5pv/Q+sHjfHhG2wUArv3mDQ?=
 =?us-ascii?Q?sQ6qpxm69pdmHOQ9WfOPZUAZKzHJAutXlY0PtjMjQLy29+T5et08zAQFYS5J?=
 =?us-ascii?Q?XXynhwh0nVz1S6LjkD6pW4A3lbwHk2iOeFPdUozRYvSYWS87luz5+yz4V/mF?=
 =?us-ascii?Q?R0gnonLMBiHMTEFLFNeKTPftwIO3GWfsPOOQa5lpNAog8d0AASWYTE1xP0En?=
 =?us-ascii?Q?EVMNWjE1UNhWGZCCKMGummP67ucdLHyZALuPjpNYz479nd2WjFihTiJmJtXn?=
 =?us-ascii?Q?mSpvWyKY+ipFajDauWOqv6Y8msj11xGIXetD+vFN1NlGtthLXMKpoPd58xAs?=
 =?us-ascii?Q?u7MIfoPYDNXc10GlxfcQkv1e5D04Wq7haqRP+dmOH04K8ngdOBcC6YOaP917?=
 =?us-ascii?Q?CTKabYjCG3gsTFQ2fh0nJhrM5EvKl9pNyaF284z5DibdfCQ0ZyALf2DKT3Ph?=
 =?us-ascii?Q?TW+opOLnmbMJ1EoxGu7jaU8+rm6yMQ1BHqYqdYuQCf2qt+7P7QHpL3uIjl/x?=
 =?us-ascii?Q?i8vHvL60o07bqvt+1GP5jp0KcZNlOT2oeJpy0SoHxQvQXiRbWUdyGe2mfJmi?=
 =?us-ascii?Q?M8zjc1N/099nbtpAoP1taG3a1LfVZ+kx0f2coqZ/YKYErYZxwPjoewJUW4bv?=
 =?us-ascii?Q?m+/0NgjD8cJowBgILCM3AfubV6rHq9kFHpWjVUioa8/e7N6bl8LJuohxY1Hz?=
 =?us-ascii?Q?0M6KLuJ6RBLLvTCWeGpLTPpj8tvvPUCbvFMeL6WedomGzw6Od9xrpgzfNbA1?=
 =?us-ascii?Q?PVO9mEr2DrgPrAJ8fFBChX9ZvoD0PxjNqtiKVLtFtegmBndXxWHxkgcoPQxN?=
 =?us-ascii?Q?ePOQciubBG/Ow+3OHrZPGZYNSkL98Xz3x5J2Zh21Qhd/j50tVBZRrU8HmwAO?=
 =?us-ascii?Q?zDdWgeUBJ95XCQ1Ix0TxEfrStqyHpDNXy9fa+o9EZTEzduJdake8Qgl9Jakg?=
 =?us-ascii?Q?+a5IS+Kq3sSaWuh/vGjtLT5BdX1BYGdtW3YaUWPrB/eUqHDI/xEY0bRtznOx?=
 =?us-ascii?Q?fTqYdFqq9BPZLGDnw9JbjxCRdRI5/P0RZSIGWY1n0qvkcA0AIKlbEaU5Togf?=
 =?us-ascii?Q?lBXjlmM1pxie3nrNBKxshYnnPnkWwhb937rJqnLOZJaplvIWDw0BWe2uV5tG?=
 =?us-ascii?Q?k9muXp8EWatG4xIoa9L6WigeVZB7yD+FFkCf?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 08:30:17.8272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5be4b95-b95e-4e99-1c7a-08de2e585ca2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_003024_412393_56BC1FCD 
X-CRM114-Status: UNSURE (   9.35  )
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

Hi Baoquan,

[...]
> This has been fixed in below series from Breno Leitao.
>
> [PATCH 0/3] kexec: Fix invalid field access
> https://lore.kernel.org/all/20250827-kbuf_all-v1-0-1df9882bb01a@debian.org/T/#u
>
> And Paul Walmsley said he has merged the series to riscv/linux.git.
> While I can only see the patch for risc-v. The other two are missing.
>
> 95c54cd9c769 riscv: kexec: Initialize kexec_buf struct

Thank to let me know. I missed those patchset :)

--
Sincerely,
Yeoreum Yun

