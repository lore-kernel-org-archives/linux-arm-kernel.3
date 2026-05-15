Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41431CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af/yghLR2+xqLbk1FPILjihUH6yHT7F+ChXmTjZB99s=; b=dIQN0KpkH84f3f+xUz4Km4yOnc
	58KsBF0fZ/4AlkcKDu2JpJA2STUMGU64pLZg+YdZaFOxnFv3tr6yzYksF4KNrLnmjweUlh4++YzFL
	r80aWloImM2ASsVJcErBL1tuq9HR8Le1hN2224yHaBH45F41VnMxEiKT7ACvgn+a7Qv5JKedK/8mb
	fb4jUvii01Qn7B7Pyg819AVvpG9L0tKoldax4UmOKbE0y7LKDTkqhviDTo+fOBWOTo51BikAhOGYs
	PSeNV1N7kVvNjohhIj1xwkXbj/e/bzta8gq+8Y9EUSAgQnasrCjwi37Vd4O/UMBkAyloQ64RU48sA
	FmmSU2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqTL-000000089BK-3qUK;
	Fri, 15 May 2026 11:12:51 +0000
Received: from mail-northcentralusazon11010058.outbound.protection.outlook.com ([52.101.193.58] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqTI-0000000899i-1bTZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtf8gcNYsrMwJEr53EiPQSG/9JnFaVs1QaDpZYkuDIsBSARUpvTUUe5x4UmIbkf3v7WGhwKeGuiH4k6KwuVPn1NJY4sfzZxX5WQy1x4TQti0WEfvcYspz3ExaKIMNy2pgQQbuf7/OIVqFN1qcHcN8V4XjeZxe/vpv5XjCGqOY87eEf3OqI/jThIgvTJA3ABHekVbIwmo74iLZt1IRqiMiwZw4cByyGozDxhNYHSX7+RmrRLSEkkqYG1jtUoGlrnlvMcdWgE304sI8KKfMLU6dsZNTsjAV4ByKWNG7h0QWqK5R5VOdWS5E31vSYfCDeZE1f6HMdWUU1NYfbN6fKwIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af/yghLR2+xqLbk1FPILjihUH6yHT7F+ChXmTjZB99s=;
 b=R65+6Eqj50RJZa2BiJeid+RPyMIPwzIGROuZ2SSkCPb7eTj3hYl3IvxSmeEDxMsj7d+9F/Op6Z8oFd0N5b19mYT+pD6rFVmwnGdGp20cS89yHduBR8mIU2l9NqtspQMJT8whILb56T0o2ABZEPz3oNez4RcGo/zgwPOnjdqKetIZRAtsLfrxPZe/SiTehCTN4wfsuCXYbGHf2Fgx4kYZzY2xeEitNLg71yQ22ZffBG3WjqZ0hDkA0hOVeUnq/or/kU5EljXzSBjmPIiIRrQYPNT18TiMM86FLZwKzinM0RGPhH/K6x5x7orMt67Vl57505m1n4l8RUUIsSv5vI3z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af/yghLR2+xqLbk1FPILjihUH6yHT7F+ChXmTjZB99s=;
 b=gqMT4p/1xcrsqPx5EaopJEusflxyj6gyFIbEhny0on1TbCjKWJkCOwfNFGWsQ0mJWPUePyf4kgBh3z4WQ9thBzNiaOAVhaheIXFrlc+X3rBHrvIKmrDHmrZrysxH9FDrSGwpSm9MmbG3lKfDaX5MnmVOQ1jre9ScJGX4XX1WIwQ=
Received: from SN7PR04CA0210.namprd04.prod.outlook.com (2603:10b6:806:126::35)
 by SJ2PR10MB7559.namprd10.prod.outlook.com (2603:10b6:a03:546::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:12:41 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::f3) by SN7PR04CA0210.outlook.office365.com
 (2603:10b6:806:126::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Fri,
 15 May 2026 11:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 11:12:40 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 06:12:39 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 06:12:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 06:12:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FBCc38125592;
	Fri, 15 May 2026 06:12:38 -0500
Date: Fri, 15 May 2026 06:12:38 -0500
From: Nishanth Menon <nm@ti.com>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
CC: <ssantosh@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] soc: ti: knav_qmss_queue: Implement resource cleanup
 in remove()
Message-ID: <20260515111238.ucnvzhomcxvfylc7@coveted>
References: <20260506154114.2288-1-shofiqtest@gmail.com>
 <177878513972.16124.2519778203402988912@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177878513972.16124.2519778203402988912@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SJ2PR10MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 194cd9e7-ae15-40f2-0c02-08deb272e134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SxbV8lVV8qy+jktlSm0E24ijVs3vdYVBI7RVnbhAJZGAzOBxFHJC3nODHzGFePehltKo8E9QOdkC4Yusu0JuZU4FJFwNOM2MIGJx+nimBRSAg5n1u1Ezgs08YKScR7Eycw1ZmgWsVl4lhnHVS9RSN+VueYcx81jDPj8lEL6+GQntoiAG9tRCCAYoRItOiyoSEoksO2Ccg0SjXshizxV05fBG1Qw4hKcLZw4KdXVbSjMPNYQOyjGmmS0NVxQxJSTGF6Sz5x/Kf9OD1MZBZovPb5vHHqXfzC5zXSrlTF4m+UeMNAuWHvKAjbv9KOSNkI3UwVQdpz3thrPoVc7b5ktZSoylmR2AQj23swv3ONRB1cixv/d8uqNM8sRjGf+ry6yzbDQwAwB6zG0kKXfxZ9vSfy9D++cdXxzdy9mutiWw84fpZV4koxYV7KMBshFgQ9TRWTFBY+A4B4C9clJknPe0Q2Lw/bklRRXTfK1sThrC2SOoZ9Z3wXCn8V39Z/NUWA++eOmrhFsGHMBSUGZP5W5wtT6B08ANBSF/kR3zjQnJxQ8pOqBHzQbBl/3CtM+Vw12sETSAUTrajNl60fMysXeq7rz6DE445/V7mCE/A9WCnPw98bFtQhpSITTn3l5EXVtSXYtQG0FJtjfots7P6quNy4+jP9wwvNquKBRu5gelFl0hLkoY4MWx0FuybCF2iJevnaOv905dE94Uw7Gq46Slutviamb5KvXJClis30rdakw=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v34SKZEav/io0cJjEwtNyFE5QZU8N7mVMeoQbOup29q0DJWifV+rAfbOrhDjCkz0fJsuUUC7UJcZpnRer6AlWBelGZzUEHvnLNM2yEvrjLsa250RhobtLjrSntQ9hS3wuqPB349FqHOxQZN4iTehg/oLCE+ZXs8LEGu49lJOa3n3LyYtktWX+0CSPfJg08HVeDxb0YKqHrydNvWQjbjC3cnt2Ytp4XKYxyezryW94n5d9OrA6HQ9ilZVcKBJD0h2PIKdZCx2ZwQNcXbO+d84MEatEoRn0od1OPAuXKOzjTOgmRvwMMl6cL0qf+BoCyr7htRZXMv2wG6P1U/e7vDwwCIR2q5sespEFBmXHF+QoTTUajokPn5BILnET6MdRr7HStNalPIUNVnlYhh5cq5mVnGLj6ltw4Lphf6PvvTjewBrVoj/Gwk9kw0jwlrNPEtt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:12:40.6725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194cd9e7-ae15-40f2-0c02-08deb272e134
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041248_551857_CB534C0D 
X-CRM114-Status: GOOD (  14.39  )
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

On 21:58-20260514, Md Shofiqul Islam wrote:
> Hi Nishanth,
> 
> Gentle ping on this patch. You suggested this fix — the patch
> implements exactly what was discussed: stopping PDSPs and freeing
> queue regions and queue ranges before disabling runtime PM,
> mirroring the cleanup already done in the probe error path, and
> setting device_ready to false before teardown.
> 
> Could you take a look and provide an Acked-by if it looks correct?
> 
> The patch has been waiting since November 2025 across several
> versions with no reviewer feedback.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20260506154114.2288-1-shofiqtest@gmail.com/

Usually the latest version of the patch does need a few days of
soaking in mailing list before being picked up. I was going to do that
later today.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

