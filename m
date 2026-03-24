Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C537BE9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=; b=vsS1cOwgyd+cFgrv/oq0eBsXtV
	Q79WGCZmZOPTBkYJhwpSWfr+a5ldUechnc0rk9fdeDqZQkXeAc5KMKEyA2TMCXUb3+i21YF0kaKIL
	SNsCa0mym+6RTaWKgLJqLJbgCEdOesEYPBQG6n0fW3zLA+dXBPTHdHTlRWGq7mZKoaxlToXVH8nBk
	2Norl/7OC6wdtlrHrWYTJq6qsh5Fvdb07QUgOjhIS/ucByhYABkaz6MUj/gcKNbSawQAmsc9vkfSV
	b+sX0J7wKVNwhTifNkDCPFrZyD6tXDm6RwB8JvEJr5LyCRjAmqEBoHBLAZx3h5+BRav3UapN/o9qH
	yGEMJ/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515I-00000001PEh-0WyN;
	Tue, 24 Mar 2026 12:42:12 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w514s-00000001OvZ-2wmz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:41:48 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AVmKTG2gkp/ipbM+XC01kPriG85zTHm0D0xntpSG2qj7YYuMW+0ydghde9bCyoHzRGZW8DXgMt2VpXGLYTUsKLa1BfDEgj0fH/hKPo4h+efsSDbpRKnPTlo7LM+tB7U5UVQThM5oQ9tWf1oFs3KRTv1hYYdE75EbyKSU/bk3XQuZVA91b/Wue6BNzIC6olJSH2yX9AAR7869+T56QEyaRVADVGTvX04OI9XK770eebL19CAiTY7kLdFK36rxyKi7Sg12DgQ0Ip3KbE4ewNs0v8WaLzWy7g2v8T319+qPSIjpNNusfwvHjEGKFhsVUykALsN59VeS1dq4I4mP9wkzXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=S6F57+e05xI2elPznVNYMZgKfHBuQY9oALhzEiLlUFWvndxpCz5Px9Uk3yta205sPo1mXDVvh+F1qHlWfLaqGXkYsAdg5haNgrRUHsjikG9qe+8mGpaZ0rOsBVCRp1hC7cJMIDP73eK4TIKzUu2/QHwnaw9ylLP54MY1sUuDgGNhCVZ11noXpHaz+qG+tk5PZ6lXc43RYGKb6HzVq76KWCzM19RFgGNhzAEIxZxPZ4HUZY7sC44CJPQQaV7dA09h+t3Rkwh7univDUrhIn47dH9GkCdBjkrS+SzbmHIwrB6KOjypvCx0CTT3P+2AOqTkXAlJEhfHcDdfi/JNSHazIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=jN10hdinaQz/MNJEHQBkITRZw1TKErqC0tptOx/PgNTJUGDseRwe/xNEZnprJ9l8dupUftdLmi5jfv6YVaDBXe2zR9ct/Kc3QNfpvgOQar2QiGr2Pf5R4JvN2XXBwVFLD5RWtB/oCcEW/CTx0VDNuTiA8jQuJhtqFBworcXLPl0=
Received: from AM9P193CA0003.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::8)
 by VI1PR04MB6879.eurprd04.prod.outlook.com (2603:10a6:803:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:34 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::b8) by AM9P193CA0003.outlook.office365.com
 (2603:10a6:20b:21e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:41:40 +0000
Received: from emails-9342560-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id EE4C0802E2;
	Tue, 24 Mar 2026 12:41:39 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Mar 24 12:41:32 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JB+HGVi9SXOmnB67dpTBylYLoUxY8BJnp6DI9jJdDUaq0LiAftKPW8JQ4myfNtvIkRKebCPzelmHUjffh2be9pV+JPfkbFsupbIXEH/pXGqmCWKbrJRrJEhzO3ym94TX0EyEWWuBlRJbTTO7xfuYC46mfmeFZ6RVuyLX0RDEOn1yJrDWZsUIHvsgyiMc2nr+Wak/9yjEvjjmnSfYekqNgOXMvI9PD6wPyxqTjVEbMRFAgIGAo0hyJVdu7iUNGoo05OYVy9n8tBnWNd+29xQST4C1gRU+ol8/kgGO5dz+nvjBVfOX4ZDFl7ojcGM4AIp/voPWzg/NPyrSJUdElvF88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=H50CeM0Cj/9ldbpE2pagMFUrfl2OMeCUxDWKwVweKG4dzwEL7vyYbEvA5gLes6UXg39rZZush2sRTo14cHngQUSeLXyQtNVLVo8cqbZ84JWm89ElR5gkuhUeK2BfRvXpnzEVYuJ1vUya1ZHJJvtmGbJKEidzUGrwCrRANaU4W5XLyYTHjGOKIh8t5bI/bqOUsmA23Olzley9VTENNZO6Oy3+DkDM4Zl1nKmF2VmWSR/rXMIhuO4kbqvYqr4h1j0FhD2Zm78FPKlaZ0UxtfEqg4d65SsKfjlVkzWTdPByv+J35mgaCn8ErPqZJniMk3G1l+LzrEZyt5qx3afdzj29ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV3Bp7ypsj5/5LFVVMLalB6K+UQpGjbjOiVYswysFRM=;
 b=jN10hdinaQz/MNJEHQBkITRZw1TKErqC0tptOx/PgNTJUGDseRwe/xNEZnprJ9l8dupUftdLmi5jfv6YVaDBXe2zR9ct/Kc3QNfpvgOQar2QiGr2Pf5R4JvN2XXBwVFLD5RWtB/oCcEW/CTx0VDNuTiA8jQuJhtqFBworcXLPl0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:41:26 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:41:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 24 Mar 2026 13:41:04 +0100
Subject: [PATCH v6 10/10] arm64: dts: lx2162a-clearfog: set sfp connector
 leds function and source
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-lx2160-sd-cd-v6-10-8bf207711848@solid-run.com>
References: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
In-Reply-To: <20260324-lx2160-sd-cd-v6-0-8bf207711848@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DB9PR04MB9722:EE_|AM2PEPF0001C710:EE_|VI1PR04MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 681d333c-e7d0-4f7e-01b8-08de89a2b252
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: Zb4H43U3Jq6y42hXyA6TU97cM/b3g7rQOvOi4SyI7Z1D33/ATk+kicaPkmsJ7ras36tCWn1O0Rt53Sdpgi3OlZXPe6KIKQ5T1TaakbJSADgIvejDls+/3SvTxWx6gsrg/ORvPilAI/EM//2rYpcCuIcryVzEOdvOfnRQGrza0cMNYk0U/kKzPLCkLMXlx9QzYk7wgge06PydZYH1hzdh2q5m7VyzcjulvGYS2oRX9V/YAFveWEt38eq7NpiuarLyL4MdLsZ3WLUBkS/soDOjzvow5622COsCJRBWEmgIsAefEcpepeUfmE/aPQqR4OMM2gI5hw/EnuHDasXISMdk3YWghghE4Y0hFOC5/1PBLyDNUDLTgUgaopiusarDzdba8997w6CUappycWh7W8N6/AUjinpYQ8zK/khp56bzi3BikgFwgwhGayJ1h1x1b0PzcCEelqkIoo2HMf9iJMb2hlavL/kusMUXCxiKhbs3940z2aBR8I+hzoDHYDvid6k2tm2T7Xswf7KI6L4YYuBGG8u0pDZlxuGndadQ+RZXtAE+LHASwAXWrF4u6XC5EWSZ9uBxcIlbvAp8SJ2UH3niLDzkqcX3k5HKrk6F+BG0ZJFQ7wQ82Oqq3hNirkjON1eYmFRbd8UWT11DVLgClM36uClFRIuEXsnlqrmeh6b8ccBSrLbKNUnsHhfqgwzTcFLfxLVIwD9BiTLHEt247I3qxUfurNhDcxqkNSCSGkizeT+WCCBhV288bkd6KV26y7rk9qun/sbpGEtCfJudWPTPTUOEB2DzAc3gZqMg/U8b+Tw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: U/ojCWXBICPMIwwzsVsPX/pIJUsfaNUpxKrMqVX19bDygHs+XyXuydIrZFPsvxRdm2iSmB5a3v9Q3Ik5KHac/vYbCRhuEnGE6XqZ86E2u+RJw9ZXdPchudZbBHh0pqDPCwLls/05nMSL033GOyXnf2R3nTbD7GI/6Y8Hf9XtQV/z9dI/2OQNgN3nhaAUyHutlYN1Qeyglt6xoKldZXjpwUr5HxJPpPQC5qKfPIwKjew5bw8iOuhdCcRmlAnIrTta2uBO2yuJG//tFHsIZp6rzsmB+XSHyrX9e9+kX6OfH80Auv3GEbJ0NuHnnLQkVpdqdH/RIyzHRU+l7amM93Mq3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: adb66f65214b43d9b80bd66e81fac18d:solidrun,office365_emails,sent,inline:b9e026b2ce894d6ae84a8479915fad54
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ec90f721-1b88-4adf-510d-08de89a2a034
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|36860700016|1800799024|82310400026|35042699022|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: qGpNcgW9eS3gNJsBPiFN8ASr12vnKW20cC08g5jTrD9lz2SDnUQiivgbVF1UXHjonwYOUInkooI3eAEpR5Nn5dOvphlNpIsG5T7bWLetnRr++DtpS9hditXHzr5SrH+K9et2XrIv6yJB4b3bljg7Hfpf46CZ1ZpfKrCI+caKs780//FTj2zbyKkCo0FP+beCMyP80I6hwLWZp3CzHvu3KaMjs/dO3oErNhwQkNUJ2MqeqH8qAhuB2FZhoAkLcfB3TE8/gkNOqTYMJYAv64sRKNOTrXXYtoqmKX50SWGkGBbVmNs2T7lOnVE7nokn+oU9fBDZ872QsxvRegmmPVpnMSG1EqzD15x2ZzFnGaVJHZmtr/2zrLptDV46SDBi5wR5u6qB18XktZGSc7GzWWgth0S8ihcDKCaq/kA6dKdDQlgg1j/eIQWBYaRVrnex42FZnsXV9dp8OTnSyYIquNiEgmkIuCF2/aocJQRHskXvj42r8QwDpyRkgNRxl4LRPaA8Bn3jbS8KeSx1NsqGbrzUZ6+ehuSZ/156ReA8RYzrau5QRWTggxXO55PuRV2XYeHZh0GSTkZ6lr0sC7YAc4wQBVczatG9rld8V84ZelGMyAmoq6nxdX5HqMknLCCrBhPp4PInEzCzhtkOZjiRMh1LMHfWqzTrfILLLC5wMcVAI8NlBPqeE+gxUx7HVJ7qvXd1bvBDFhi53k7kW6ZsWSGsbG/xS0GiU3LkcBkEFmd+Su5gIh6rUQWGY7oI2rX0R8EbsBvPDqgMbDXjzxMP9jfANg==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700016)(1800799024)(82310400026)(35042699022)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: molb3QFV3YHGM7P3S37aWkiXCd5sfQU5Qk4eaQovX+u7ddEWFTQ7VLbQ7dZliGObrkuHjCCNz5msgVX+zDo7tzbJDnDS6bw7JzA4VpE2QtZbdV0mjsPkQDQopZy+8cCDxDvDysOHv0swrNabgv36jHMVleQzGneaGBBm6Bh/2juQds4oodmKdsUZUYM0sGVH127q/mFBuTVeAXjssG0odGnbG7Fj0UzqoEceX1v2ddnrS0yaJY2b6T4yCykwc571mqavwogbOURSH006sKaoIrfwjnXXOmR0uLO6uJp7OrQXgMBvOm6wQCtnHCuqIgGcg94zgOfYqSYZRQj0dEAQ3oqLJoocF6tL88HdDml5KQ7oooLBvcpU8mHOH7DzrWqtp/VQuADj9uFVpeNPDzHSP3vpqmVBUa+y6z++KuS3NpLwJxihs7Vfxwa+LzLsGwq6
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:41:40.1600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 681d333c-e7d0-4f7e-01b8-08de89a2b252
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_054146_781681_4008D1D5 
X-CRM114-Status: UNSURE (   7.79  )
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

LX2162A Clearfog has four LEDs attached physically to the 4-port SFP
connector. They are intended to show information relating to network
interface status.

Select "netdev" as default trigger for each LED, and link each one to
the respective dpmac instance as trigger-source.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 8920326a06735..9d50d3e2761da 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -41,21 +41,29 @@ leds {
 		led_sfp_at: led-sfp-at {
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* PROC_IRQ5 */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac3>;
 		};
 
 		led_sfp_ab: led-sfp-ab {
 			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>; /* PROC_IRQ11 */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac4>;
 		};
 
 		led_sfp_bt: led-sfp-bt {
 			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>; /* EVT1_B */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac5>;
 		};
 
 		led_sfp_bb: led-sfp-bb {
 			gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>; /* EVT2_B */
 			default-state = "off";
+			linux,default-trigger = "netdev";
+			trigger-sources = <&dpmac6>;
 		};
 	};
 

-- 
2.51.0


