Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6FA105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA0+aNr3KA7zULcrduqmgAYyzjL6Nx9Y4OB6opkusTA=; b=rL6TrNeauaOevubYQDdqDeNQFn
	aQvSLTbrJJ8Uy2gMwf3E3gvkpeLJTX52KUwgl9Ur63SQXISAQtr4sSNg+gpAllrZnAcZMzHvaAXpx
	dITnX9DqQrwJlnYXf5JiT4VBlOlyETuBLtZioLVvT6cv2tSVYnfPq+eNZfNVwqyv+FLSQg8KsK/cM
	ObKxcxOmSER4wlBrVfMTckxWGSOy9i6wqTO4L5bkZeUGHfC0NaHipx+AjczZozGbhSFbNargZVd5I
	95ru5GcS2vnI8gVKuNwMGDdNMSAbSPh6w1SMHNjLxjCifIjEmKEin2rBvYuc1275r3OlUd7D5bS9E
	YYpP/HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13fL-00000000PKf-0gTP;
	Fri, 13 Mar 2026 14:39:03 +0000
Received: from mail-westeuropeazon11011067.outbound.protection.outlook.com ([52.101.70.67] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13fH-00000000PK5-3e1q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:39:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YKXYj9KSoGUndLk3Pi5Y1lGAr/H/L9rlGbbNONDm5D51xBOYtsHB85NKU2brveZSFO5zog+GlGYaiPcBQG/183cMH0zOAch4eU5twPq/mUBCRqMnAlZFJAhwzWJBa8eAjyw5TUXM9wgKcj5Oy7ZxZf25yXBPx04EeWXk8DB8Jsh598Pj9tv1VtYKSBLo91fK+AJXip9EJLf7rb/u5PfYlt8zY+Z7434CBhhhBvfm1kUhvWNDX6Zz3ZpUpy5Ij1B/L8GGcQ+wImtD4zackt95qkWaBJkPgBDoBUE/qWko0l96VC/aCwJOZhwJhNj0xlcfhXGHiwVaiuFFubKSeLNSzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA0+aNr3KA7zULcrduqmgAYyzjL6Nx9Y4OB6opkusTA=;
 b=wS6yBEAI2QyfM7nyf+kylUO7zNnb23u3jrpSNUTccLsBrxuDW396wS82VZxgOrik/qcVIn2I01qF8ubBWoDLE42j6MBTQYeJHYr9++7kPLQv3+7I2weGpyZ1cXL3enbblqtirdnbr3uGyIpA+NyrQo7bhTC2nJHNo1/nbrg1Jn4P+ELnogpToSDYjwN7quN8+JFlzA1QlEVoHcdHnqLBUzIbxw1ZhkCnU/RvQqSiSnxAQGyEYvAIbTyi5VH/zkoqhQEwNe6zNiE9rgk30+trJyWWPXiIHWD80JoU6ke12L3w6Yug6zIlgKx6oVQ57NmEv+pFddozwFO/qRzowfOOAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA0+aNr3KA7zULcrduqmgAYyzjL6Nx9Y4OB6opkusTA=;
 b=m+RzIpNUKpJXXAIhALG/ekEt9qYZRIBN65DHAIPARKX3Um2+RQfvy2ddg5C6ANCkaf0GIWZPompAXRXKYSrgaENkfRR8WU3oD8dSnWZ+75uQeZiRFAgMXC/ka+ttk65t8Clmvd5WQEy5gZi2eWXDG3tScCNAKnTY+iN9azYOUeg=
Received: from AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16)
 by PAVPR08MB10331.eurprd08.prod.outlook.com (2603:10a6:102:32a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 14:38:53 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:313:cafe::88) by AS8PR04CA0071.outlook.office365.com
 (2603:10a6:20b:313::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Fri,
 13 Mar 2026 14:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 14:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itPbJoT8/hHk4zwHUcwXyNj4wsF8UuGezowis5v0aUQkL2TL3rP1kjnzfiad5rJfnPP4SUBNUUcN/3aZJL/ZE/Jsp4midpQoeN1qQ+JDJQO0/hDB1C/qlpVuwYwjBeJl+xJuIMJnQF/Zt7bSgZ1egebrwizBlm4OTU1ZAxCosn45gp54t3toXnN1fblEEe94H9qDFgP2h0AzcfCeGgBOEvpVbxgE9iiO4+C/T15161Q4NxpuIaq2xeyZP2LSbWoGWr/iYQlLJ3SYoeFvzThEWJ7luhY6n80dlUEl7Bg3bRHBtrFo1LcNEyTfUUY6tjw+n15r6QaBjZsC6utA4I1rJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA0+aNr3KA7zULcrduqmgAYyzjL6Nx9Y4OB6opkusTA=;
 b=Xc8vQfUDs49jKjyU8s9xZ3YVC/ikrmdnw6US1prU+5F8AKweoYXraSnnqm+rY5TjU9VhVeed2r9eYQVJqwfkK17q/itGrYQZ+X7lV3Gc7qaHtdFtMZXeDz3/emTlR0E5fKk6x1zeWQFJZe8IWkKAlYDfF/LiXCUjZm4nNS7sxT5mQM1Xtdl17xawAvH5L+HxqwO5iAhk9AGMTU1gP45iQeo9rHo+FavrCnkk1kpiIltQ4jPZumXOxtNKxX4GaDRq1ERqPqK/b0i1fV1jvJACLAQlPyDAiAWSC+zHMECtCW0gEbU9/yYkugRndSr78XyR4H/oyKIvnvsfjXSlzLQIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA0+aNr3KA7zULcrduqmgAYyzjL6Nx9Y4OB6opkusTA=;
 b=m+RzIpNUKpJXXAIhALG/ekEt9qYZRIBN65DHAIPARKX3Um2+RQfvy2ddg5C6ANCkaf0GIWZPompAXRXKYSrgaENkfRR8WU3oD8dSnWZ+75uQeZiRFAgMXC/ka+ttk65t8Clmvd5WQEy5gZi2eWXDG3tScCNAKnTY+iN9azYOUeg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DU0PR08MB9797.eurprd08.prod.outlook.com (2603:10a6:10:446::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 14:37:50 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 14:37:50 +0000
Message-ID: <50588d97-238d-4d42-a588-c4f47dfa1c78@arm.com>
Date: Fri, 13 Mar 2026 14:37:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/19] coresight: Add 'in_idle' argument to path
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-13-eff765d211a9@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-13-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0124.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::21) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DU0PR08MB9797:EE_|AM3PEPF0000A78F:EE_|PAVPR08MB10331:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de85051-880e-4dc8-bec1-08de810e3fe1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|921020|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 3XyMYpUdn0/VVB4bFoqeS8rNtBW6qHxf55skqR5YTY9KqmJg+ESZLd1jf1dKPkL7QfdCXSC1/NIzQ71P4ltipItpkgLHtZLf7Kq46yBTdAbEfiiQv5IOHOiOPt7qcg7w43hRIb/uUkdIsoSn2IXvFl1SvXCUpncrMm72rVfjBHLOjB+4WvlVS3v0+U7PCOgEUNKi64xUukZ1HZ9TQnaRXaCq1NGFh0t/gUjmm2I8E9IlacaEO/Aq0EWlWD7MSYzfCdxDbSYAFjRQfbx6Xi3cyBbF9sYYk2N1+63tYUOdZDieeplu4j2WcN2f+Mzy48uIuWEQWnBn75sWt4Yy6E46qVQP8Xaz5P3PvJw6/fYhScmRYPIrhfnE1E7tHk+5z23+aJgvvEyF0rhDyvrkwPGdD5ZNAZkq1wKrXXdldp/USa+w2EJOpaLBV9+zaeXamq5c6Y7xcxcdT6HDIqmVL3TZp7KAH7A9vNejw/mxwRnA/m8jTGL/iWdtYLdXpnCrQse/GfACQ96RJ1FQ/iO9JWCBoIZN/XpxFmW3wqU4qwcENfRdQCIsvY9UD+NfseFaHxx4jD/RxqB0mQ77kCNpxIZdFwSG75SKUW7lLWntkS68VMFpPNdgp+lI1RFjgRY8jHK31uezWoUkW4bEeimdTGkZzgWmWr4tNktKIZRJp0SoCKQcYQExdw5hXriqqnVeG/jnUGAdL5LQSI/chfhgwGeNkdzGACFQuDqmZyKjaJHLXXKfiASJoTlmzsKnttor5dOgB7FCpUnGGKAF5Bf2viEX6w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: KMo74pyX7/dyg/GIuz3UIhxQOBwndYXLrg7yRSP4twr5QuWwo3eM4rgr+BAH1thEf74ni4t+D5DanLxZ52nrMnk+IWU2wVDqPuqLkT4JJP9dyJPoc3Myg/GwOEDqeQ9bQWQd72CjPlaPGUyuN7veuNYN+N9OvyX+MBe2ORVeuThnroUz8jedljUyZXiSPOZkGMBkcYikd6HUnMsQc9RnkUCv+zVjwo0PIadxdc7NxUYIZr622J7jkjm/OIyTRfNzkVJ1wp2m/00lIebulIbQ6Z9FXszF4f7a0QxFqs561kyfPFATyJ7pCGV273Rh4VPvFcJpNUu03EWhhhlsAZRU5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9797
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 620537d2-00e6-4fc9-00fb-08de810e1a0d
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|14060799003|376014|35042699022|82310400026|921020|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: Y3lN0DS8x5larfuHFedB0XuOD5yO6I8NJ3Jzbd1PC+JVmaGhne/mqcop9cMus1fWCJkjUSO80sd7jytGyOiK0dfQjWbE0S2i8aBJDg7a5n3AeBQ+NYMpo+RWSXXc0SRGt4AyM5QU5IRMwix8d9velLOHgXRhS4PViYpREHuvceyL/r64JSgZ7j+c00Mg5om4MxiyBu1E3ZvJU5qjjrraYRKmfMnwBcc8wK9i3tSiJjEzSMtthYQRGAMygYisqRO+Ddops2dVxb60IUWmCertGWZRrMndiXjEkd07iD+olZx0hHk66QV8eyIdUIEO7YChGPkC5q+sEK4eA0oWm8KGYjWYktgTjmcpMD47EJZvSXDOw/Y+WlxRgjOZO6RJMHC0mASuNrl7KupfJrpf0i0DGA/eHVUHB7l1u/bBDQZ7+aHOnO7Kpvw46vJbmNLGjG0prJrsocespDWv3RBcRzo+WtN93mroT3u04HowJSH6LgBFlYcXwyx1WRGM/PzjouCWgOt2zHdpBx6hR2TUfGiKEx2t/ck6sUZyuaW2c49C9PDkdAoStS15jv3qQywHl4W5Ro1ZxnCTS6EVwviNYilTU+sQCf1WdlKfvKOO1Clb91QlwE63QesAaFR3N257NbnE5qR13VP3B8fkoKe20K0twWagSJAA3uQMPgwUIdQwDb1epFIjYADnb6vcp8CXImxVoBvtIKLEcc9c7vtnwAdKYiKrhnQidx5lbz1yqu9+gUH42JCkemKgp2dv0//Uwj7Xn7yb3lO/4o9ey+xb1J//7B/x3JQvvHDou/cO2eJqrxuiXclGbKIF5LXsYNAeRv14
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(376014)(35042699022)(82310400026)(921020)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W3Ry3JPPFZOgKJqvtXoDXRE32B6maPo5RsSPxG59ilODcNu16MYCgL+BLwGLSeuokQe3aaodMvazLhnwU3I8LNNm3tWLZG3PcBAO4mmYIueVmmpviI7yFzVLbdb1sPK/Z7xa0wnGaf2MdPM35vqW1E34xCOBlzUXLbN+zx08fU+pl4N0B0buaG6sg7eyQXhTdw8861my8fyXCw+G150MtM5ZnqxNpAZneHtloeN1Y0KdNLVPsy/KZavWfeE+S+Ulaa0XEXb1X0Z8uMGw30RaOf4mD0QB1L4gHhjNlFeUlcxu4x105MBfkslsZoW08AeKWPKEz86iba4thcvaEGsX593ANmghP9YvxMRctjMYjJ6TTbPx/REp6nJXA5zt/oZsfH6+XmJ2yaFu13OBHLzejBXsUHBlPy7sKluPSP5eGWLShmLUOp0tjsFNHeUCnSWA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 14:38:53.3424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de85051-880e-4dc8-bec1-08de810e3fe1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_073900_063176_9AD32F14 
X-CRM114-Status: GOOD (  20.89  )
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
> Introduce an 'in_idle' argument to the path.  When set to true for idle
> flow, it skips to touch the sink device to avoid long latency caused by
> the sink operations.
> 
> This is a preparation for managing the path during CPU idle.
> 
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Does this need to be saved in the path ?  Could we solve this by doing 
something like :

coresight_disable_path_till(coresight_path, list_head* end)

Disable path till "end" node.

coresight_disable_path(path)
{
   coresight_disable_path_till(path, coresight_get_sink(path);
}

Suzuki

> ---
>   drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 80489d38f690e0139c8712161c663ee63a8a7fb3..420e5a9cf38e64f133aa6780987d2d7c2804feb4 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -531,6 +531,10 @@ static void coresight_disable_path_from(struct coresight_path *path,
>   						CORESIGHT_DEV_TYPE_SINK :
>   						CORESIGHT_DEV_TYPE_LINK;
>   
> +		/* To reduce latency, CPU idle does not touch the sink */
> +		if (path->in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> +			continue;
> +
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
>   			coresight_disable_sink(csdev);
> @@ -597,10 +601,6 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   		csdev = nd->csdev;
>   		type = csdev->type;
>   
> -		/* Enable all helpers adjacent to the path first */
> -		ret = coresight_enable_helpers(csdev, mode, path);
> -		if (ret)
> -			goto err_disable_path;
>   		/*
>   		 * ETF devices are tricky... They can be a link or a sink,
>   		 * depending on how they are configured.  If an ETF has been
> @@ -612,6 +612,15 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
>   						CORESIGHT_DEV_TYPE_SINK :
>   						CORESIGHT_DEV_TYPE_LINK;
>   
> +		/* To reduce latency, CPU idle does not touch the sink */
> +		if (path->in_idle && type == CORESIGHT_DEV_TYPE_SINK)
> +			continue;
> +
> +		/* Enable all helpers adjacent to the path first */
> +		ret = coresight_enable_helpers(csdev, mode, path);
> +		if (ret)
> +			goto err_disable_path;
> +
>   		switch (type) {
>   		case CORESIGHT_DEV_TYPE_SINK:
>   			ret = coresight_enable_sink(csdev, mode, path);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 96a1af3425a5d588fccb185a428cef5c88febdbd..5f778cd41e6bbb58393278f72feeaedabb0094d2 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -332,11 +332,13 @@ struct coresight_dev_list {
>    * @path_list:		path from source to sink.
>    * @trace_id:		trace_id of the whole path.
>    * @handle:		handle of the aux_event.
> + * @in_idle:		A flag to indicate if it is in CPU idle.
>    */
>   struct coresight_path {
>   	struct list_head		path_list;
>   	u8				trace_id;
>   	struct perf_output_handle	*handle;
> +	bool				in_idle;
>   };
>   
>   enum cs_mode {
> 


