Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31874D58E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDpwjrP92roIetOnlHygAJxfgi+JMRMatyYYaVWjm/Q=; b=zUxZN9DrLR4Leh
	KjlEYpK0GS7EwdUYNtB3l377uWJ928Rso8l5GCa3Ee1VNhGIkzEvOQqaRLoVCh0GvAeRE0aqSIcNl
	puWDy0TOcaQmiz4WeEPs6b5G9dis+hl+GeC6NQdebUUCMiIenX2D9sJ9TZh7AxHDr5kIKdxIBcbSd
	CRPp2B383Nu4KhNP8/rOXs6fTXmNsPWmri1czCtPKXnYAXDlcDdpUCDqRZbKrmwY+Dg1SkcZCnz60
	VYQr3A7YODaL3zapmUQbjNoKlvRxnd81ZaimaUseBSiszGV65gaQUJno+B31chdAtTpQDUsHzNJtc
	kzY/bGatJGlvVVSq8wdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzg0-0000000CbKP-2fAf;
	Mon, 02 Mar 2026 09:34:56 +0000
Received: from mail-northcentralusazon11013030.outbound.protection.outlook.com ([40.107.201.30] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzfy-0000000CbK0-0bHT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/PH+Pvni6G7Bxm782j8LqsA1QEz2Jst2QsDV/7Z2Srq3X7RywYWT1SGLh4/FbI7Wktm8Q6RjjfimRDpTpkluANUDM37Ir4yBvK29V3R6EoxzMHpZPPuAAtA5qF+mKNXX8d2+zXcNN8SCZg2YJzYSdYvoTJ1QONPX1JvCSSFrDGibCdaiauBDiD1s91ijpM8VPCVcVExdFlwBJZXa4vnMArGWx/QOYt13WExwexP/tAQ8bK8wOhjM1GEMQLlF58gYvHa2vPV1u00QkTzXz/qryO4Vrdat0qCd112lkll2+5NISDbav4ZP4iHTWAWSeDFfbi0RgqtR2vXj2upvGt3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDpwjrP92roIetOnlHygAJxfgi+JMRMatyYYaVWjm/Q=;
 b=BsFCwjw7TmpzYvUbTfFsHN+Fq3G04wDukylo8LyK8ABiU7aEunH0UnHzDakvMWbrF2AABlhuhR4quiQuzARiGC28ZWnFjhXBUDkMH47Db4W+TygqWDUpK6gOQZVsri4cBPqDbCRBQupXXXfo6Cn5HUAM41SO8pbb9rfY4y+iw81Gbk3dvcOdWXwzPhuZ5hwmHoeEmMBHyQml+W+SzDyTszV216gb1faP6KETTbsyh2WF+mkecR6EnVaoA9C+5M3HqbWFczVIaumkxY4whn4QswuZ+lRafaMYJNduxTedc7CEnOVKSK5/t5s2bHkD4GfNqaGiMAB/DfgET0+ylsaFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDpwjrP92roIetOnlHygAJxfgi+JMRMatyYYaVWjm/Q=;
 b=CrE7IgiviljKubMrF456kbKjq/Bo0KSL1a2+J6uNYRy7uX4x47XM7BFKpH6eak4M4+2ETDzNr0bwkGy6EBCHptWp3OeVuLCUIWOcyXEb1+BjQrUL8k3J+kUfCwRGrxqwBpwIQKE4rYT0dFo21eyyRnWlSwudmwESWAfa32M8i9c=
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by SJ5PPF2BC420A1B.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::797) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Mon, 2 Mar
 2026 09:34:47 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::19) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 09:34:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 09:34:46 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:34:45 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:34:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 03:34:45 -0600
Received: from [10.249.48.175] ([10.249.48.175])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6229Yhse546005;
	Mon, 2 Mar 2026 03:34:44 -0600
Message-ID: <f59045d3-c8de-9a76-b58a-e4531f550f4a@ti.com>
Date: Mon, 2 Mar 2026 03:34:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: k3-dsp: Add C7xv dsp variant
 for J722S
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260213001151.17370-1-hnagalla@ti.com>
 <20260213001151.17370-2-hnagalla@ti.com>
 <20260213-poised-archetypal-trout-fcb5d2@quoll>
 <f54bd097-d56b-4f87-926f-4778476a96d5@kernel.org>
From: Hari Nagalla <hnagalla@ti.com>
In-Reply-To: <f54bd097-d56b-4f87-926f-4778476a96d5@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|SJ5PPF2BC420A1B:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2f613a-4755-4375-3a60-08de783ef11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|34020700016|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: Y/0YMz6HRZIIYlicDhz1G0sOh+VaQxwf7jjld8Xm/C0J+lWOu6lmBMRxmPpSe3gjBOOjDjWON57cf4q3tP/wrAsnwQG5kUdNf3XgP2M13q1MJN66HZDgi86O33hpItel7t2VGb8kSOSbdzAQtF2Q3QLqmmdCRDc0q0S9fTA6JhhJvly4V3Aq6YYIEMWKi/CzviNB6BHmXymcubMYgJsKaKtvi3hiAhnO1yRTppgRvkwWTdkaqH/uweZZc8YPDG8r6xCNQnjF7fhz66mj0SR72OIdg9t/MPh2nQ3AOtH1GGo8p76XjjLH4ffCW1SSMxHUAkd9H8gZx/TD5Q1k58RIkmrlV+dik6hV/feO3/s5V4e/9bTU5ukOx/sGPbUrXzpewia3U/lgo9tL9pG6wGd3i1bINvqcJ383ob0h84xChQMpv1n/2RqcggflTrcG7ZadNluMJXJUfTOoYNpzmSn22+D6tGsI2xXFftpdYmz+usZjBnp7UeCKcrJLKi0UXmY/mmFNKAHcZ9IAcAbjUqmsDpoTJtky7oKsXu/sisjDHUcdaoUExF4cRvpMi6zEweXV3BeagbK/RDFr8OIwbU3g4NCe7w6npJdACUG5EIYYv5nqbNLshLRuTNuVyW3zlPwKxZN+4yEkhk9W/P6vSv4qcQwtAoO1n2gj56MXeN00fbmLkplpuBaCy82++lzRUnscy1n0OGoCjbnZCBwnVLB1vDewBZIfKn39WOj2jpZZsu8iLFw1zW93eG/kD1dMcXjtMRYRHpeiOTjIHfqy31RRiVfdbf14IFecF7zGeBjcBg1Xvxa2hp5SJV+LA+cETeBQ/Lr4MzvK0uzLu6au7bwb3Q==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ylXvBzl6z3ziaktBAXqzZ3KCr3l6mxMCzjqQctzZRA9rMRFPMoFD1eblf1NexxQ/egRAuKneVP14RBiRLCyJAiD/zcsXm6NaifxkBwu7kPXYlBTWnHROKjPbeEjvLrhXeWRrLHz++xs0+oDtrNZ6Ix1YHNwqj9HRVPIzAquN29cdJyY0wl0jGnB1wjfE6BIpLBB28t7dGgX7ue4c5LP0li33r6scDZ37DezL4IVR6tZWYiKHtFhFij2FaVD+Huf4ogKwgs9eAO/Hm3PKdz4MdHuTyZTFLxLV4QBN4cGNGWDm7083XjFkxZSy9PAYrC8LmgMIM7ObHRVDumx8QwBRQfgV9tvJSBV3NSBmT6FIYp9v138V1ZIhVx1c8R57MBS6AahrrcnQSJeXkTqnsKqzmYjwops+pUJrQwQ2IfPbYK8FnlHmjgCla6AczE3aUPue
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:34:46.0357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2f613a-4755-4375-3a60-08de783ef11c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2BC420A1B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_013454_283403_1C71F5D9 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, vigneshr@ti.com, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, andersson@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, b-padhi@ti.com, krzk+dt@kernel.org, kristo@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2/13/26 03:34, Krzysztof Kozlowski wrote:
>> This does not explain lack of compatibility. You ALWAYS add new
>> compatible string. ALWAYS. Drop the last sentence and fix the patch.
>>
> 
> And by "fix" I meant express compatibility or explain better why local
> reset is different than resets property, which applies to new device.
> The entire picture made by commit msg and existing binding is just very
> confusing.
> 
> Best regards,
> Krzysztof
> 
Understood. Thanks for the review. I'll submit a v2 with a better 
explanation of the local reset vs resets property distinction.

Best Regards,
Hari

