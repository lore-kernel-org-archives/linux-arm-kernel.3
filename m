Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA76C53213
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPSki30Om93MAIQOQaA4rpzSk8jQMeIC5eJpZW9fpM4=; b=UjviM3QkQPwKeWbRR/b51yhsoV
	us7J+xPkR06htnLKg+4iEpp/5h4A2pM7LZl/IXyt7QzJ4ceinhcb1ktnMqlaLMQmCYKg9vaqUa5CB
	ySosLaVxcnpKNeqdIulSBi1kZly9GlOJx18LhpQ181fOsGQ/IL4IurzJyl35CwSmvTBsA1vB9mvlZ
	h3C5YkAoZ+yUuCKBJZlQuaN/GebvYubCtzTMU+RdY5Q8OHf7SIx//3JElEUlBR4rB4i9Zg1bsRtPf
	2Ki6nIZF4lvQ9un6jcRszBWGxH+2qzArUspweYq1LpK37kslDKJXEIa/I3oYCHK9lC06fr4a9MWnL
	csE9qdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIQ6-0000000DG5H-2RH9;
	Fri, 20 Feb 2026 04:47:14 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIPy-0000000DG3B-3i78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 04:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4X31XI9d9HdJ5QqxQddMjxj8ow8Rvb3DLSTX42k6iS/gsCx/Ib30wjwoyUp8wPwEfJE9XqqcVlaJsdEn2/qMkIS47k08Xp/IKeZBvYg/3YnZGf/MzHKdryACIlAKeRnSclVtOXSGSlz8hO/TZiDJgFGmUeeJMQvX/PkJWRjNlEHLRnNkgZFlXHlxkyZ8s6KZj87tejjVmZROeI3kdiXWqF9gE8Aje8OCT22Yc00yP1QBO6PJJiEY3pHlzX/H8i5A/2F+xGcnbnvw6xnROe0lXiNN7tB+t42ZnVpKK7IPbNZ70q4UUCBNXTHWOOi7KuIwDzHbebIP/UnO6DFZ92cyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPSki30Om93MAIQOQaA4rpzSk8jQMeIC5eJpZW9fpM4=;
 b=Kh/XCL3EIYXsSbErVgj80AlTiczNC9YK1+ZVj6q3OtDiMnX26YqRReGEtCmv827MHFcsW5ba/JWpYLEongEMbWiZ+0tZtFGSQFzeZ3PCZ88ZyxJi++S5a0nSoKbpwsBjoWl9RDzIUC2gf8fnTr4TbAkYc8XgS5T75RugNOmPp7oef2iJ90axir8grYXMIZJHIC6Eq9F6Lc5La4zyKwDjJw1+hDeWqKczpoYC3MTL1L6sv0wxb73Q6xeGoJu89stY9SGmfxT+weDjI4NqXS64sPmvgrNuYtqcc3xp6q39AZ9wQBF5+w6If2fzpW5IS3m0vOETS75O8Hx4cBM5Wlgzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPSki30Om93MAIQOQaA4rpzSk8jQMeIC5eJpZW9fpM4=;
 b=GBX9H0jJrPBL8fI3U33UeZ0O/tu6pQsR50N1ApxiBRRMSe5EIfs4mhowYAMKSMBflZGslvhe52pI3jJvULvdBvKAoXhy8/YP8eYCLZAbbLKUKFEa8Pbsas4lUYWgn27blYhmBq7vVVycPCepGn7LI6reUdvPnisEj8grNmtymMu+C1ArUXCFCcWeDYMp9aHQ9MmfaECqtTefzovDZ+QjsGOVFw3bWKkAqXoidCLwMxdjfJpJ4aQrzuJYb7HYXkNqL46VEDKnpkYtiW7/RNpcrX72eszdQYnBbV3B9fnCnKEtiHIKnepvGFe4KfQIRF90O1pDNBwa3a2jBxmrr056ZA==
Received: from SA0PR11CA0156.namprd11.prod.outlook.com (2603:10b6:806:1bb::11)
 by DM3PPF516449E88.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 04:47:01 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::8a) by SA0PR11CA0156.outlook.office365.com
 (2603:10b6:806:1bb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 04:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 04:47:00 +0000
Received: from vm-swbuild02.axiadord (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 685C04157BE1;
	Thu, 19 Feb 2026 20:46:59 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pbolisetty@axiado.com,
	twei@axiado.com,
	kmitran@axiado.com,
	Harshit Shah <hshah@axiado.com>
Subject: [PATCH v2 2/2] MAINTAINERS: Update Axiado reviewer
Date: Thu, 19 Feb 2026 20:45:50 -0800
Message-Id: <20260220044550.4152148-3-kmitran@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220044550.4152148-1-kmitran@axiado.com>
References: <20260206-axiado-ax3000-soc-maintainers-change-v1-1-a39ad47eb185@axiado.com>
 <20260220044550.4152148-1-kmitran@axiado.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|DM3PPF516449E88:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eb9323c0-fc45-4d57-dac6-08de703b161a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/s1qjBYeMRRbwyaqvMd6IiYRM857UYkWhEznBFlzzh4QscOZlkYDfAl+V6QR?=
 =?us-ascii?Q?Nw8OhTOU8jdjA1p3vdq9dpeBYpdzC0gMV/DPc/28qgKPPciTe48rYi+Wp2Fz?=
 =?us-ascii?Q?uu2lLNPSLoZxKxA+I580j1onD7oZNaz+itrGVxfS4KqJhrRI186foqJWB5Bx?=
 =?us-ascii?Q?sxsntbSWP2cBEriy80PO+1ceQpFMmzJvUPKhDmR1znX+DZbARvxPiTCSGzqm?=
 =?us-ascii?Q?6WU21PIEk9JZyu6lTnVLJ5YcUK1/rCwXCXvDmXmzRYxDfGPaniEpfQ2/WLEd?=
 =?us-ascii?Q?F7wGEeX4rhzlX4z0q9IWaicZ8KsTN5BtjqKAPGIoM30UEjr5X9WVW5j4wnpW?=
 =?us-ascii?Q?RwsUgYTMkmBQHiy2ymf08UGMkY8WjQiUSBP8YsnCaA20Q/Ln4SWVOmKHO+Ne?=
 =?us-ascii?Q?ThF7L/w2RQG7VIoUqsfheG29V1FrRBrHgV6DbOjnWWt99RZwOmTmHebPpAUH?=
 =?us-ascii?Q?8oxarBHyS5zwhmLcixx4uZoiqYjcKFHvFobATL5eYYYyMu0UYUVFOixkEsmD?=
 =?us-ascii?Q?Wu2JRefLW8ssoXhYbfZHaSdy3keClHz/NjSGyv9COBBnOmWMbwLdt9nWKUGJ?=
 =?us-ascii?Q?ApR8UP89NfGGXi2b1H3HluruLkt4nrDSfbXt+SSrAL1Jtivde+UZmWyAVcQp?=
 =?us-ascii?Q?DQfeRyewfCKrWgi56t6Nl6Spuq9m38evbyRncTGfp+dJqv8/wkS2byEe7ulR?=
 =?us-ascii?Q?7V5zAe7qWlVq7kZvAzOht23o53aeOBpiTd4RYkj6+hXnJFMpHmmAkw8RYMjt?=
 =?us-ascii?Q?8lfuWq6efO/C7vtAKChbj3oCLMR4nogbs6C14k+2lj33Cn3qRaweAYEORtRh?=
 =?us-ascii?Q?f0s5aeUoRDVxijTUSxOxTboM3ZbR96d6tgwsNYP9CMa3RnRQNPQS0KjHDgj7?=
 =?us-ascii?Q?B5bM8X/WKY6jrdawzC+t+9+GnOAHmj+SWUUx2GYiSj13P7okHfODjWPIsUNC?=
 =?us-ascii?Q?Oewx0JIJw7PeluWfRyAXl/1cMxwFXxsauTAMMVr96jwWqx1YbDRgEfL9jIWD?=
 =?us-ascii?Q?wEimQAR6s+BEMLYtzQGKRc5JNiOPtt+489EQlK54+kLWSooU5USUI1tobVz3?=
 =?us-ascii?Q?xe3kBzsW3gTWE04rUcpOFwJ1Urfb2o1tMT/DxcAXasFXK6Dp56y7DFRATXYk?=
 =?us-ascii?Q?7HQpYpss/l6xzHye/6aZGt4eS8TzVXvG7oeE+pOT/zme91e9pIqq7qQYzxBK?=
 =?us-ascii?Q?XCybfl8XHAT2vj/TFg6e3PQfux0RtD6117HNpGjn7+qJV7igzxk+6qFWZxjS?=
 =?us-ascii?Q?1BeeZm0eiML3ws54/5v4n0+nOMIF/4HQO7A9xW6z72s5W616ECRH4N2R5hV8?=
 =?us-ascii?Q?BWx9r1IiO/fAOS8pTlAjrOpvYoDjJal8U6Kt3v6kSzRTz6GeXdegS9kEbPn1?=
 =?us-ascii?Q?PDU/L+/VsaZgtGoXfUYi2bDj/rnjRW+pBs3nSY5WoMakeozfR48g4GTyXPvi?=
 =?us-ascii?Q?cKJAtDyJ/y3QNS+eF7ID8mjPDyRPWoPvMPBFP521kykQdjyf5FFz60fntPpt?=
 =?us-ascii?Q?Mz/0BGFdOJMIvjkngVgRkagxtoIt8JbyJ51TYflgX5pVCcKvYJ/jInHhK8rO?=
 =?us-ascii?Q?sCn+g42QOCGI6HfL+Oj2M3wZof4/6BsrwreR8NvHrDdZZ1Pkz1DliZb4EbU8?=
 =?us-ascii?Q?B6KybkxDry7SN3h9vjJfxuGFZKr6Su/u10tPreZiEyteDwm6D6oD/2yoDIcP?=
 =?us-ascii?Q?mkZuOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3x2zOFfZTOrAlEpWycPkZkQMdWafvXJ+tsFaGRMDauFf9KoU2Hzq8GsvOvfGqYvRQ+fpskRDrkXe2GYEaGAuHAdXo0mtRyBUq8nkWRrdCnziEg2ab7mUrm+zfBSrtEWXgvLv0J634Z/rcL4YZjD9mVkJAS6bXYpfS3F2bplAGBmDr6M4P8ffrCmu/aqJHoYM98IbLC/Z63cqz5eKLDB9MtrTlaiMXVv4IKPkCSso3LHrsDsKdSjg1J2+SdQXgf3UjUtTlQsXpekDvEVOaNfLCw034ZrODif41sg/+WnqTnjwgLIWIQUMtxYPaXDEJc+Ok/MQJ65Z+HFhdNw/6SMkfJY57IdyrNPoi+kH0McLQYu73xzOb/iNsqLoRkHpE82MW7NiB3F6oE1KpgxYo+hPLaULcAs7kOuCdbNruZsBBl0nUsIuabORAgDDZZ8Kpca8
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 04:47:00.8158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9323c0-fc45-4d57-dac6-08de703b161a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF516449E88
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_204706_926263_A79B3089 
X-CRM114-Status: UNSURE (   8.96  )
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

From: Prasad Bolisetty <pbolisetty@axiado.com>

I am working for the Axiado SoC platform drivers. Adding myself
and adding email alias for reviewer

Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Acked-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..52f1228bf137 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2554,7 +2554,10 @@ F:	arch/arm/mach-aspeed/
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
-M:	Harshit Shah <hshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Karthikeyan Mitran <kmitran@axiado.com>
+R:	Axiado Reviewers <linux-maintainer@axiado.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/axiado.yaml
-- 
2.34.1


