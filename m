Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D8EEA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Jhl1AgkbMcGr1iocFJG1ctZ+AUye4aUY9gdIo8L9vQ=; b=OwfTWIjo9HM8EQDnPk5f3J+tNm
	kWzk4Ds82CiuDv4Z96X1UE3Jz5+S7xe8TBIpEiuJ3PnvXGdJRm+AWCFIs3IypCMXWrOtTicrHTZlu
	ylddZH9FayEMTM91qGGu18E6xiHWIco6sR6UX6yDHmiTo1HQV/gwd9cbNHwnMj3ei77IPTUGwF+UX
	ysafNjuyXh9JYJG/Uqd6FGXpTyld0unOj33zOzVlD74CCuQde/0M/cWZsjfNa7Ff5hns3ClldEDu+
	x7kQXDYWuz2TxNtq8A2OTvZnww6hxLJIlUW+MyzwXFBQBdxspk1fIzSQhjh44WFQunJ9rgc4b+gIB
	8NvfIGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApFm-0000000AT0Y-2TDN;
	Thu, 09 Apr 2026 13:17:02 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApEu-0000000ASpv-3Jdr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:16:20 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TfRVLQfPni1xYwi9RgjAEEQ3G0JxsIURZ4TSXinyZu1YrO0Xeqf7FnxvyTRVzQeS2EQtSgA8Af30prWZPxKIjdXAhUT3IWL+IZ58SZlpXI3Ji4X/1uO+0nj8/Hb8e0V4+lYe0+PRqrm+n3c/MwoJ/5z01egZWUg4fThlg7gzZjsENz1YJtB6q+/xCmkxZn4brphSj5EbfC/EiTqdKPB/LgIBetF8l08kQTgxaXX9o+x5BjqymoUx2jJY8sp3h43EVxGA9QzNkNNlzP17pcBUK1ZK+IJCJjUvccyL/vw21EdJLCxrGlsXruL/malPKX7jvaOXyOEujcQdxqAD9Qq5Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jhl1AgkbMcGr1iocFJG1ctZ+AUye4aUY9gdIo8L9vQ=;
 b=B9kSmJ656vnx9aJ/RFzS4r+E2/oMQfJDcDAIfNob6LzmMa8hoZYqLNP2dzp1CX9z0sf4lPVwh/JimBHSYWWgUazYSMJPENKaa5fXpqLrw200F64IvU3zcq2hfKHWac2/IYvlNd4gd5QcCkI7kJVNIKiPVSkPtT5vIInLwU8jBvZhm9KGs3V1t9KwWCNBLeGCHSIoKQBgNODV+VCFHlcGYKUQYF1JUZ/B7Ny9SXDFJRoYc8v95ASF5qIUpCeP9/5k45UH7aecUCPUscOrhf12iRzBPySsiqhE2JUKuFTnLr4AsmdO4FiFE8V+/t9rXrc7EYGEspxhQiKcwHUKa3xrxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jhl1AgkbMcGr1iocFJG1ctZ+AUye4aUY9gdIo8L9vQ=;
 b=UEZkxKirGuaG3is3c5kerRxe/3JdwBE/dfL8sUoBnI8SczmfBLoOEjn88tMmaaOdjk9165XVKiqZHYKJuRnrDRYP9X//6bgVSzw7agOSNzZshFK/KpMoajhGwJlNqT6pSEpzL8IbT0S3JYpkv/NmdB3W1ey+dzeu+wUb5oalrDo=
Received: from AM6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::17)
 by DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 13:15:48 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:209:83:cafe::8a) by AM6P192CA0004.outlook.office365.com
 (2603:10a6:209:83::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 13:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9818.0 via
 Frontend Transport; Thu, 9 Apr 2026 13:15:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nb017yhWOun2f/FNdXifplwZvr3q3tJkDthetzNLLwxt3Gmm4JhUkzBs4rqBe3hJtsIa1oxUCk0BOCQ8uGv17UpekpD4WjU5fHzwqUe9vpAB3G5fRhXaNPEBRUBS4OB3g7G64WBq355FW/PXMPZ/SdNar43cGaF2XHRhmTFxoy3YXAH87sRHknQfF3lA3N7Sqi64ZbhC5MvWJ8MlASE20Qo8gAgdvbqAQBSlxMjCTXywkFX0OqyycTlI719ZCjquHqjN7MHhzKf3KWAY2Jjj8Yct/t6y9ZG9S2eQu0HYSkvSbCgMBJ/vDnSJclonbObwxlEjcAb19qu+Z+jQFPT+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jhl1AgkbMcGr1iocFJG1ctZ+AUye4aUY9gdIo8L9vQ=;
 b=AalaMgyNDlS9yMAyShyjtgbPSuAzsJ7DSqR5/DNI9XowLgaoP6mWW+47GHi72+fyy2K9ai8w64wcTfkuSzjvbiYOptBv1Xy5MewW2r08D8hMmiJOvdHHCnUzNStfHZEXg38x0sETrsYS8icban4pg4y7y/Pd8HWYbuyhHMWuYKAAkcJFYqQVz9jqzRKtS3hPlsVukIOWdtOUjoMQL1K40GT9fooGk1cioKLmtXZ4UE8ylQzdxm3fCtanEDE8p79qT0I4upRIqiUm8gj53yyawCZnUk3v1X+pwGP27Mf62IMhI+BcDZMpqfevB6dUwIzv1IJd/MertQx8mDKSTKkiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jhl1AgkbMcGr1iocFJG1ctZ+AUye4aUY9gdIo8L9vQ=;
 b=UEZkxKirGuaG3is3c5kerRxe/3JdwBE/dfL8sUoBnI8SczmfBLoOEjn88tMmaaOdjk9165XVKiqZHYKJuRnrDRYP9X//6bgVSzw7agOSNzZshFK/KpMoajhGwJlNqT6pSEpzL8IbT0S3JYpkv/NmdB3W1ey+dzeu+wUb5oalrDo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AM0PR08MB5460.eurprd08.prod.outlook.com (2603:10a6:208:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 13:14:44 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 13:14:44 +0000
Message-ID: <f20b5a00-1d68-48d6-90c8-97dca2e279a4@arm.com>
Date: Thu, 9 Apr 2026 14:14:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mike Leach <mike.leach@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <e7c6f497-f8f0-409b-b80a-a064b222c08d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cd::6) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AM0PR08MB5460:EE_|AM4PEPF00025F98:EE_|DB4PR08MB10341:EE_
X-MS-Office365-Filtering-Correlation-Id: eafa40cf-a577-42e6-2711-08de963a1db4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: FdrtbqI7uWUlzQWWa7ckH8yjOazyVR3wDug4c1j/gkVCUpZlplSo+U1yFAS4ikmNOukWdjR/WtxgMJdVaixQvMRuwXCqrsJ/+UUQJr/NrT4nUK+ncx8QeOR7TaaI5SC5jukoBeKd4WVg+i9SmBKEVnJm3DuCjz+I+qyoJqKSXR+ttyAKIFxAUz4A1qG4vu9qmXVKqXJdXZ3syeKuOyIDD5bRxnKWbeXpPe3SpPhELUvKBxgWzxKYOEuZwFU7D7BcDHMVDIaCTRZmMVa8YS8QWGBdlaBqWh0wf1udcoVCK7PzpkaFLxOJR/BME1V1dI4tF7Wh5WlCu3WV+Z/8Hp9qSGtrpAxtPKVbA1yPgR0fXMRAGvU6twvdXACruwgzNqGOs8t7OSC9hTy0ADcJJfgdo9/yBRo3dZXBu0FIk5UEBDTrtskzvwVZt23bcG1Nf9RP6ULop+X0/ZqZx3ca0DJuhilC4vKeorORK/Cu32CVzB40NPXezurufpi41LfWYvZOK38PdI7pIws4xwO0r1XXeYhd3y0ubr2R2hhTuzCRu6UNxetfDMXo1mEtbjETRthjDn1uJ22GBxARbTx1yL7wpWPxkzCBmeH/IQ/H+PbWEKrOfZYTg4Pi6WbdYTc3ztQFW5N1T7lvM4W6emv3IVOBv/s3cTSL95/ONAnDMzuwjIr0gQV2+j9O9JyMVV4izJ/ZEAe3CQ0+N4GCX24069R0uc/cD56DfUYQnf2jSgWyLns=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: DEW32dEm8EWFVeUkFjVDAa2CNZILhXfmn0X3ItbGB89iBFW/E5vDtTQooI9i0iZNl/VqK3fDCuNX9z+f1mBjgUCrBKd9qZBxFTvbkZMTRPvAsQIntKizgr8OWtGEEK8H3c3oUIvqvgHAIm1thifcdT0tkXwqaI+SgVeFxKO2Ygzy3jLegyjy/BU5DBJXdx2tIn6OCU9QaKBlznIpbB+qz88cmnqd6bXnMYwh4GIWdXgZuWJbTrX9wqABXnHXpnObzJ73aotBpq6bVbF0poVsB1ZSIHQ123yGmAFUmxMAPiU3hyuxHMxVLnnllp4WSmCautwAbA2k4zdsXTNZ5vKrlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5460
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 075aa7ea-fcfd-4c8e-6410-08de9639f799
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|14060799003|82310400026|35042699022|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fI6sNgmi2YAj1rBhKSoVWVQAL7aHXoL2sg7oqfwkTlWbU9cr3EeHASkkkbWw8wwYTKShuO4KRMv6hhceGNwBu1gowJSLxt21z/o62elznQomo5UA610KEtxq1OyxCIwQM+VETiIOFydy0KI7OCcPmN7A6RSKQlAe7UiO9xEGz2GrGzodf28krRkzQwHTC9kxT4Z9AJncQB8Zad4TlxW3tjmCBC4T5pvJqfYt6iwIfmVhc1CQz/hDyhMzb6KAcjvogJnmUthu5p5lm6lKK61HnREi0qb4/Mz4Y5irHRDLsh7n0c2KVcMj1IIbdOHzqWJsk0qiYIZf/hSCtbd3vEWfKARomiVRq2BAdtpEntaT4U3VtC9K1j0VJYauFkX5N4v+xE6tugBJFaAH0WecurAwof4sbGk5Nh7W9UDTFVT0de+P4wCjhWfYKhNJx8spe00nvW/DxJR+ZqR5q39p1wpRYlSlpeZmDUFbQfYYdv25YucJTEz5wPVq/D5w2vU+hLak+oIgrA/NuREBqOeqD0cGtxpkXtvf11HJYOGLhRt4yRh+rW67iZTfGg0tXQXylH4HbnlUzOiCR0LaQy1w+lrn50XyH1oal/hgU4OGXLR0s0J05SR9RvZTOWXVaLlhYgkYM+Bb/bNgSOHc4zANINTbWu54abTu3hDglOHGdgylbTr4gWCN8PCo/KJTUYGI5IntbDf/X9ZmcIlV4mZ387mCo1r5TjhMo6dFEF8AvrMJEGN6XbKBaQGHmTcSuubuQR2Nz2edgT9oueba/xqrbATWdA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(14060799003)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g8zXIoZCsVttoTq2cYbJSSKOJLzJhDojw8MaawZ6HutDfFIbU+Gt5SJLVYSDwKCPgCFRbCtdGjQB4iTmHw/LnXcdZsbitqjA4No0B95cq4k+tXiK0nzQpB8y0nH6XgQ/6gVaA8UJfzr1TBWQUjg7nuhFlYA5/deEX4kfmco4d9Gqrp8D4EfFS43N0sTQfyqVTt5QryxCHWdMn9/RtgYtQqPt/aBO7YskeymaO1NuM7eMzI03fy63pk/jjJBbCXLHAqEvXLyak2P31HYqj9oeCWUfjCo43rQkAcgV6vXKSEPmNMz/c3ez7DMFBHXBoqWKDprFLF7CzZVxnKJqCHS3eCwQ2fv/ancIWbOTD5gTk/PffSORRh9mX5tRFAYrpXIWiKY8d8sf4FaQqSQIhDZUd+PT6FGd7JJ1HKc3Hucn+ne+EMdUKr7T2lIb/EKO8jpL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:15:48.2787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafa40cf-a577-42e6-2711-08de963a1db4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB10341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061609_378212_D8E4C9ED 
X-CRM114-Status: GOOD (  22.71  )
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

On 09/04/2026 11:52, James Clark wrote:
> 
> 
> On 05/04/2026 4:02 pm, Leo Yan wrote:
>> Unlike system level sinks, per-CPU sinks may lose power during CPU idle
>> states.  Currently, this applies specifically to TRBE.  This commit
>> invokes save and restore callbacks for the sink in the CPU PM notifier.
>>
>> If the sink provides PM callbacks but the source does not, this is
>> unsafe because the sink cannot be disabled safely unless the source
>> can also be controlled, so veto low power entry to avoid lockups.
>>
>> Tested-by: James Clark <james.clark@linaro.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 46 ++++++++++++++++++ 
>> ++++++++--
>>   1 file changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 
>> c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c..a918bf6398a932de30fe9b4947020cc4c1cfb2f7 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -1736,14 +1736,15 @@ static void coresight_release_device_list(void)
>>   /* Return: 1 if PM is required, 0 if skip, <0 on error */
>>   static int coresight_pm_check(struct coresight_path *path)
>>   {
>> -    struct coresight_device *source;
>> -    bool source_has_cb;
>> +    struct coresight_device *source, *sink;
>> +    bool source_has_cb, sink_has_cb;
>>       if (!path)
>>           return 0;
>>       source = coresight_get_source(path);
>> -    if (!source)
>> +    sink = coresight_get_sink(path);
>> +    if (!source || !sink)
>>           return 0;
>>       /* Don't save and restore if the source is inactive */
>> @@ -1759,16 +1760,36 @@ static int coresight_pm_check(struct 
>> coresight_path *path)
>>       if (source_has_cb)
>>           return 1;
>> +    sink_has_cb = coresight_ops(sink)->pm_save_disable &&
>> +              coresight_ops(sink)->pm_restore_enable;
>> +    /*
>> +     * It is not permitted that the source has no callbacks while the 
>> sink
>> +     * does, as the sink cannot be disabled without disabling the 
>> source,
>> +     * which may lead to lockups. Alternatively, the ETM driver should
>> +     * enable self-hosted PM mode at probe (see etm4_probe()).
>> +     */
>> +    if (sink_has_cb) {
>> +        pr_warn_once("coresight PM failed: source has no PM callbacks; "
>> +                 "cannot safely control sink\n");
> 
> This prints out on my Orion board on a fresh boot because of how 
> pm_save_enable is setup there. Do we really need the configuration of 
> pm_save_enable for ETE/TRBE if we know that it always needs saving?
> 
> It also stops warning if I rmmod and modprobe the module after booting. 
> Seems like pm_save_enable is different depending on how the module is 
> loaded which doesn't seem right.

Thats because the warning is pr_warn_*once*()

Suzuki


> 
>> +        return -EINVAL;
>> +    }
>> +
>>       return 0;
>>   }
>>   static int coresight_pm_device_save(struct coresight_device *csdev)
>>   {
>> +    if (!csdev || !coresight_ops(csdev)->pm_save_disable)
>> +        return 0;
>> +
>>       return coresight_ops(csdev)->pm_save_disable(csdev);
>>   }
>>   static void coresight_pm_device_restore(struct coresight_device *csdev)
>>   {
>> +    if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
>> +        return;
>> +
>>       coresight_ops(csdev)->pm_restore_enable(csdev);
>>   }
>> @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct 
>> coresight_path *path)
>>       to = list_prev_entry(coresight_path_last_node(path), link);
>>       coresight_disable_path_from_to(path, from, to);
>> +    ret = coresight_pm_device_save(coresight_get_sink(path));
>> +    if (ret)
>> +        goto sink_failed;
>> +
> 
> The comment directly above this says "Up to the node before sink to 
> avoid latency". But then this line goes and saves the sink anyway. So 
> I'm not sure what's meant by the comment?
> 
>>       return 0;
>> +
>> +sink_failed:
>> +    if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
>> +                       from, to))
>> +        coresight_pm_device_restore(source);
>> +
>> +    pr_err("Failed in coresight PM save on CPU%d: %d\n",
>> +           smp_processor_id(), ret);
>> +    this_cpu_write(percpu_pm_failed, true);
> 
> Why does only a failing sink set percpu_pm_failed when failing to save 
> the source exits early. Sashiko has a similar comment that this could 
> result in restoring uninitialised source save data later, but a comment 
> in this function about why the flow is like this would be helpful.
> 
> We have coresight_disable_path_from_to() which always succeeds and 
> doesn't return an error. TRBE is the only sink with a pm_save_disable()
> callback, but it always succeeds anyway.
> 
> Would it not be much simpler to require that sink save/restore callbacks 
> always succeed and don't return anything? Seems like this 
> percpu_pm_failed stuff is extra complexity for a scenario that doesn't 
> exist? The only thing that can fail is saving the source but it doesn't 
> goto sink_failed when that happens.
> 
> Ideally etm4_cpu_save() wouldn't have a return value either. It would be 
> good if we could find away to skip or ignore the timeouts in there 
> somehow because that's the only reason it can fail.
> 
>> +    return ret;
>>   }
>>   static void coresight_pm_restore(struct coresight_path *path)
>>   {
>>       struct coresight_device *source = coresight_get_source(path);
>> +    struct coresight_device *sink = coresight_get_sink(path);
>>       struct coresight_node *from, *to;
>>       int ret;
>> +    coresight_pm_device_restore(sink);
>> +
>>       from = coresight_path_first_node(path);
>>       /* Up to the node before sink to avoid latency */
>>       to = list_prev_entry(coresight_path_last_node(path), link);
>> @@ -1808,6 +1846,8 @@ static void coresight_pm_restore(struct 
>> coresight_path *path)
>>       return;
>>   path_failed:
>> +    coresight_pm_device_save(sink);
>> +
>>       pr_err("Failed in coresight PM restore on CPU%d: %d\n",
>>              smp_processor_id(), ret);
>>
> 


