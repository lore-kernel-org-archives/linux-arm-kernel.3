Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD2610BA428
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+G4EtBR9Pfg/Lh89z4PhLFWWwlZTmDVWlHqohYvnlQ=; b=FR0Y5jlEM7+PAeOaxPZnuH53DT
	Hrc3REu0mVH9m7sDX0x3WElE0ZjfrW/3qY2zv5TtPZHbSlQR0upgHmWWHdM/RuL41HDu+JrlI0oGo
	DbFpd1Hj4sVsNYznBOOoVWNSisY77fCfIZErt9IG3S+MrKgEeRgVk2J+WQGvv+aRJN5KX6VdIqHI3
	Iacs4/vRc80/Q2tZUWfLIQj3xOjEHDRiWOYBODjbCMJZ/elMs75zquKkdTOgQXD9GVHP8Rxb61MdN
	jP2lnMMEciqSt93P9nJ25LdUtigVeBeMzdJUzWWPwjNiBbAiFPEgFEp8NLfStvvb2rW1bvwm/iXXI
	mw+IN4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z2Z-00000006fdW-1eMY;
	Fri, 27 Mar 2026 04:43:23 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z2X-00000006fd9-0Dtm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiIFsJVkP/4mD6Ic7zTM8DS7w2nuAOhOp+4RKdcTxBXdg+qkdtsEKEP3tmFWLYd2D5U/x5mxPosvWSXqT7Tar0dmu2Z+dNc9x6jgQkECuZMTSizvVy5s0D56Bxs0ddKoRu7D20/D4WwjMEQRb4cqBhI7BwnrZIkEA2xwtHT5z182qoaucykYeT2wvWZ1chcHMHlgyFpu1CfmvoXzhdItLZJwgSeRmxRe2qA3Dm8ElzZWm+W+HmAkmPcvR+SjhRceRp2c5/1VG+SSYm/E958gFqpw5s3yifeTgMvOWOuSoIK/0ma3AL6JTIxzS6NkAbpFQg6ChwSHW4vb7KkqMm1I1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+G4EtBR9Pfg/Lh89z4PhLFWWwlZTmDVWlHqohYvnlQ=;
 b=v1tRAVU63pVseLOjVTo1iK1TrodbJHNHTiauYYRv1JQTaow6iJDQ5EFwNIO2WKAQXitIxpreGVxQnkhyRNPvIHxZ2nGcCGwnNbT2L+QHnhofdRiQLWgTHPtl78989/hzpSNP8tMZLO/ysRdVlzCio0hcaJNMuLPGcrkqjy5r4RK/Tm1iEUJRAUulN6Wg78o4owU2FZN1GAgNUYRDOSeTwuH2gaC3dTgKlIUSE/YQFcQTt/IF+8kKTyBLEJSUT0YpVH7uJPnGb+MeHj4T+/rJqIgPUtCUUQjxPAcni0X/kRAxx+Dmw/KaX8Gm6Euk0HUqTmyoETRUb8xis140epedGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+G4EtBR9Pfg/Lh89z4PhLFWWwlZTmDVWlHqohYvnlQ=;
 b=EBNaxRixWxfW2JQ7fX3jD8DsufjNOEe2xP3vP5LvSwoUjr6p6i3fJtUonpbOB5vAd7Ck1U362+2eJHSdJwNHuo8roQbpEZfjs83xw7pq1z+4AW/nqKEfc3mE4REPyNebiZiT15bALIc/EJfF9CFh71/7qRS7U5iIyFKpxFrPNh0=
Received: from LV3P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::13)
 by PH0PR10MB997594.namprd10.prod.outlook.com (2603:10b6:510:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 04:43:16 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::b2) by LV3P220CA0021.outlook.office365.com
 (2603:10b6:408:234::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 04:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:43:14 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:43:14 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:43:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:43:14 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4hAZF2871272;
	Thu, 26 Mar 2026 23:43:11 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Aniket Limaye <a-limaye@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, Jared McArthur
	<j-mcarthur@ti.com>
In-Reply-To: <20260304-j722s-main-i2c4-dt-v1-1-03f79f0cdf97@ti.com>
References: <20260304-j722s-main-i2c4-dt-v1-1-03f79f0cdf97@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s: Add main_i2c4 device node
Message-ID: <177458658834.423823.8917207151314296747.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:13:08 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=wxMNH0+Hzpmvw254buCIQHnzcgUJdVQtYt8bDn1H5k0=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjXPeuNe/7FM3Y4u7ZJy149/aLqNodM0T9jWOLNtuwH
 hLUKZDvKGVhEONgkBVTZAlg2zXLKsXicURF4laYOaxMIEMYuDgFYCJhTxh+sy485hAmV+qVLFzu
 4xdsvjh2dcUqwbCQ5deed1o6GfNMZfin2tW5Mj5CPqTw/pq/vNMYdzZo9L+dmLCpPqrtYZVkuTo
 PAA==
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|PH0PR10MB997594:EE_
X-MS-Office365-Filtering-Correlation-Id: f530bb43-739a-4944-276b-08de8bbb5bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: BljEuA+xgImCxtTqm/23K2M6/+bksjqwaDbaXAx5pz5MFEiLM87aF0rgYN8L946X/eIH//k1YAg5o/elJjjAzgfL7EaY4RXuWqckaGwGAdrx5at9q5VLcR4EZob84A3Awj6pA38X18bNH0aONTTuzfBaKWCEQReLBEvyDZ9Iv0AkwzVOgnyhn4y0YQezBGD8y77YWSJs093669N7rdWEI3HSOqSuUsGPF0UcOsmE6mtaXluf6VSjMMaN21x9DOPpdNRbJfduRZBjN819CCdTVYQcBliqGMAVP59RF9UDFDciZZm+1Kqk8uzAdMxGUaCiq5P/HK69X9qMfCpWK5MP0MPdqJSPSX1QpkyQTRzgFP41AChFHRqOoWkA9Mxb1IvLoCGXmEA9o7wMj9ivV1Kvik09cBisl+xnewtd3LYdAHUS/1InEq/QN+nXPii8IF1n7vRYbllYMrI125jH2kDb2nXSNkwIg/1gq4gBCnFyhq77/HXyzOfPPu27MrwULVRVVn7Q1uoJknbM1cclRNPPVn6it8zY9pcg4XHZX7CSLucskuk8lYfN0z3Po9neGqeVGqw37UxJVlvY3JBXwuVODg8fohGIyLGbTljPwDIWSoSUqXofAGZ4Ty/k4BKKVZQv9ctPY/7a96GqKS+XEnk7pAvIEqyu6kcTRXKx3qkw1G0KZt/KzxxS9DxfchpbTHtnbCVvJE3e4kkK6JpF1puE/f6sZXiQIwd9FuDvjvNqmKjv05ys8909BGnafrn+92Qh7SpmaoiJ8RhJ5MwJf0TjVg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XXAsynrawcRKsDyBdTGQQkqaG/BgNBHYXj5OXbFK6oKGozAfJWxdFiGFbJDAN6i390b6obB/rkFtnC+x2eiWQg/t2tErPWIynVkbw+hyV81cY0jS9jdpJSnU4OrNsxtyxlQeSpN23m+J4kgDejUKGtyMVML8+i+ULhT8A1XEncChVvhtfqvWEIxDLa5XRFzWibzef1EGrU+ZhrmrfxLuszwJxFa1z2QC9/GRt2n1UnPlxaFaLF1YIturADL9zzxyboPNm2Xa6WYg4Z9IjfcO4XRTXoCi6BfaaRB9tZFTXmjCUsOUoCCY/yOkVUjys8kfo+8wjhdMi1eST/Eb5Qw4iVOs42nQPHftuX4R/aicaQSBHM/njT/tEHOeQz15HrVhbtdOTgvy0U1Cdul3x0Sm3l58rYAXeI5KUukKVECkFWkWMqprMdapU/yAzHnYTeya
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:43:14.7722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f530bb43-739a-4944-276b-08de8bbb5bd3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_214321_097627_6D68C256 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi Aniket Limaye,

On Wed, 04 Mar 2026 14:41:05 +0530, Aniket Limaye wrote:
> arm64: dts: ti: k3-j722s: Add main_i2c4 device node

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j722s: Add main_i2c4 device node
      commit: 7d793eea2dc171f90ef419a7a3755b2e21403d1e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



