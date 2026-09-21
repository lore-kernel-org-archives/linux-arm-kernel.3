Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F3FC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vsfuzGs5jvUhmFZ4RKP1dpDxXe4f0AQZAHEDaxhyx0=; b=I/rLNqCnJbmDKnLQ21+aLCiua8
	zfCgxejbkbAhi4pdPpBhfaCOTA7wMgQ3vybFrcXJ0SQnNz0229XqQkLEvNaHrxxp0fc5VP7mPVdId
	XXGeQwbdJBjZyK7KCoLa/TEbPkFVxdRPVseaGcNlvt2xdvR3OAv8JhrWc8OQgEsn1LpSQl9GpOMNc
	SRmL3Qj3wC29r0rerACA91DgEU12Giqe+oVwiRqrW4MTqOOO3Wlm585AOc47WJyYoTtG6J/XqN/yX
	mrJekV4PkuM8/Bemie0ribZeMrHMHwewnoj9Pl2extvUR66yIh+2jc76CyG5wLNKhwiFR7ZM3rcqa
	LxKbhzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iA3-000000033Fy-2xI9;
	Mon, 21 Sep 2026 17:50:39 +0000
Received: from mail-eastusazon11011057.outbound.protection.outlook.com ([52.101.52.57] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i9f-000000033Ai-31bd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 17:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJkqZLO1XZa7DE+AtSb0saHoSVS6NbpChQYeX0+kJbdNN8dHcFJdwl5RoUHvCGdtHLSc+TI2sn0/L2xyDJtFkBfbgf0P4Sz7mPluYZSwX3Mk3QdeTmaxiTtij3ivrKEN1xq06A8Vfsn6Ex6uzBdUFV1oQXQrXfIaHR3GKvTYjvvJy6t7FuuqHwBeLeUsv34u7V+RcgUFNm9cO8uIp/C8l1Vp/6ficVGy0JjifeBa6/GeIygXrlspqXZqJQRvpevtA4RWNf+jAyCgIvXT/cGsci4iUYHT3HPULsU7P0n/EB8rwG1TIxwb9zyu5fShe9BIZ5nsWtuchh8tqiAcwSjr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vsfuzGs5jvUhmFZ4RKP1dpDxXe4f0AQZAHEDaxhyx0=;
 b=xo5TYbDh1lSvdbW/akVnwu6jfBL+z5M26Zz2HkFzewB16SdEdnrhPnEST6cw6eR0XFH5/con4EsbUNJcjzZylcPLgA726ZXDgUh3I1wOkB2Vhvltt15jEAtD3mIhxaf0e6/USXOHUiHUtuznV0XOsWTG2nx1dze2NXs+X9DG73iGzwwaqL5oUzihm+cIDEJ9Xv4FUW0tajEHDHdA0eRGhn5EZXwpbQKCQ4FvVhbOLV0GM9mHgdtFnZr0ejQfK9YXzfWislzZJKFz0iBz/Wm4ekbnnR7KiBRnhKeq4ACNTdfmOBxcFWoFpdQDDEZExjfsSx0veCSLW0JiHu8KUg/3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vsfuzGs5jvUhmFZ4RKP1dpDxXe4f0AQZAHEDaxhyx0=;
 b=JKT8Hvj75u0b9b1gGyHUY60WPXauKAFr07FSAL/OQJDXdaUJaJruRgTd3D3DzYtzhS5/If+dlDyIDTC447U9ofPxm10aSMvyk8/4oa02/6oUlvVwJEyo5/bU472hslOY9vxgebnoJ8DLkSjKnV1pqv9F1k6AZwdVS2KWhKtF7+OyYbg5ZWuO16aW3tcHcwSJZbY43k434yugTnFJ6VReglJgSTviJImp1mDCoPAbatZGR8fokyIRR7gpT4E2w//u40vg2yBriE+lYkSizmwOkB+EKNq0vI89vBDQ5VFpMZ77b3jukbZ909bR09sNDYtAtGvR+ugljcTFREWaPA/7FA==
Received: from MN0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:52c::35)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:50:04 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::81) by MN0PR05CA0012.outlook.office365.com
 (2603:10b6:208:52c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Mon,
 21 Sep 2026 17:50:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 17:50:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 10:49:43 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 10:49:42 -0700
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 10:49:42 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Hanjun Guo <guohanjun@huawei.com>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Dat Mach <dmach@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] ACPI: arm64: Add support for the FF-A FFH Operation Region (offset 2)
Date: Mon, 21 Sep 2026 10:49:41 -0700
Message-ID: <20260921174941.2406319-2-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ed517b2-90e8-8654-757e-6c0730b7d321@huawei.com>
References: <20260901192906.133670-1-jamien@nvidia.com> <20260901192906.133670-3-jamien@nvidia.com> <6ed517b2-90e8-8654-757e-6c0730b7d321@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec3b11f-e101-4172-e71a-08df1808c2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FbWShQuHGeC7IDktyAs9rVKF7ZRX7Y4lHne7u5g5EXNqOjrigSmCAlT/TWJltXXL2wZ6ML2TPnCkCEFKuKd0UAXJsSdzljjTRRsWqcqFJvpxn998CpRFdCci9P0YqkRV3S74ZED2Rb8JBFvPWA095A+4CDq87RQtmwodDg2sL8HsHwnGGR/kabGE4ysdasCtooRcn3R3H7FUJQxgpS4t7344/CV3J/Kew2lbiyHQFs0c3LoZN8knNCxZooLEM1EKjf60OS6sChBr5KRrQy1Jdk35cCnVIdsDEMvIFalJSk1GF6MBXkQWw1G/ZdiLNhbtGl0jiqbVVjvzeQZOZkhG62GtLEtpmGAgXOuAStOxAvSVIus8U/jt3gzHEdL8Y+6pzquBDDMNlQ+wW33S9t2lYY2JVLAN04tVG7y3mOgxMOSfNobC4s/aIEQ7HZ5qkegRgdflGgbmReuDuuXCsRLsO7G9oN7z6i7tjPA9BxosBAcaMFoGDOUDowfUZPo7Qwx+SgUK8Ur9/UxjvTmKdkwbYY160AQ2vE2+PihUDfW/aWOEmmohq9yK7RvT06nMlFZqzqmz7DTEcvokYA92EVs13mneRSH8Mf1jzPuCqpFiOWT3VBsc4WXB6zqX16f17wcGbXrJPu2FORmShKGpcF+2pKxsiRsCtR7q9ZioO+GjzuvnmHOP1n/wPAfpwf9/ytvxMLduH1e5M4jApuCQYZu5nQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VaupfpM2x2pQfnnq2h3NXvfoDm6Ii1bj+bv9XCWm91ohQkLWNTrJtKeqPVakfQ7QsT8KDjz/0LUP3PWs524G9lrBO26cqdD4/Asd5nAEarqzQDvdczzM1M+8pvnq1X3hccSlv90b1/VrmrFlvgyUzv19RnUF31OnNfExqZ/4tHtNUW/rSrzJKCDzLqA/bAgCYeMJF01sdg/AskroHCdUntkJwSy/bbjhUlRbTDxvudij07QCibTpxwM30RFZHZHseihOztovVEhqYHDYJn107Q1LyDASfmNsdV4yf0ofjYC/WM3i1ufWs2zK+sAjTN2Heku+SAzEoqr7x/LXpeb5RlYTr46XuitlwGRN/fsWGqMIG1nk7IXamdyejrfSF/8M02ScO0WXUKAmbYiU/tZu24zxyWVnXEx6I2sa45QLt9XIZmbJrhJQEsxerRvQ++lg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:50:01.5737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec3b11f-e101-4172-e71a-08df1808c2d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_105015_764146_2BF826DB 
X-CRM114-Status: UNSURE (   6.98  )
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

> There is a acpi_ffh_ffa_length_valid() check in acpi_ffh_ffa_handler(),
> is it a duplicated one here?

A failed acpi_ffh_ffa_length_valid() check is reported through X0.
However, a region shorter than 64 bits has no X0 field in which to return
that status, so this path returns AE_ERROR instead.

I'll add a comment explaining that distinction in v3.

