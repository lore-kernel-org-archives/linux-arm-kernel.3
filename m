Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752D8E909A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMGxqHBenkhXclD0cCA641SdS/zbYThx3ZyEhqar1RQ=; b=Ijq31A3cGAeJFwHirHOb+AGpTl
	8tqHbgml06lIiGE8DeeDGME8c+pcEfXQ31ZKm5ok8uY0z4topjJ7n+Fm7ScbzK47l2VlEKtWhSsNY
	gh0DH49jqdz4LisQQv9ONTtIzNYy8nFshLd+7GQs2Z51zgu1FkowGn2O0iOdp3/F5b2NLdoVDOHbL
	nLq97p4epU6/vojzzKw5MfCYn/KoH0liMm3xkWc4s0OCaEWcpRq1ZrQzmh8R40K4ULy7B3qRFiXbc
	CS+0uf9ImeiAntVwy2SXsN5nxkGzHaL2IEraUQJ+UDhV7vH/JUiH3tlXasYdOYji1lN9R3pWkZqi4
	6nuYx1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLYD-00000008MxL-2AhS;
	Tue, 17 Feb 2026 13:55:41 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLY6-00000008Mt9-1Bhc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQOGLKnTHpafGvocnUkOfUTuUn1o1RxEYPdRvE0v24MQYela0zG3uWuiruttVvBtHqUECQ9hO8iu/Wb/UIYysolSVooOZcyS3BHlwiwX333zwx59M9fcmiGKU1wDv6/WduVEGAmrMx0+PSQJiyFoK33pi80fxfzeNMbouq2/GsEGQcAGdQR21S5mpo204k4ZdoDJaJTOsuqg6Wv8T2MJDKGKEdk4x+93mCp+0/FtUDN8X9s3IOe28QYPQo2qEM96jwig8NSbhYK9QmWWT6XUUhreZH6bf6QSseflAdt9p3ge5yUeysYAgllQJJfxOhyNxYwC0ZYWDpLp6aI0wJycGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMGxqHBenkhXclD0cCA641SdS/zbYThx3ZyEhqar1RQ=;
 b=DQeTdQxWcXM3DP2rv2UHZNp92FUAbzM9wrmc3KFSwu1tap8PEtzStdBlh3JHQZjJidgtmQtfrwPaeh5WmwK17JclhYuizCNjq1zLUkZ/f/kqVcJvg9/ghHfvMQiyXwtWgozPeJz+tHHaZVLYaAvZZLUyMtI34gSMDegfNpbv3aIYxqS+4Jx6ANwlP0F6kXGqA2caSLRcBelHXyQZ+uEMgpm58xtuJOOtc/GVmCtCbNj4pmbpJ70ZypqjwROw/B5jyh4RjqmVqqBvBkbeom9Oh6IPI29LLXUCXCuTjXyMQXpqFhA4XocPMrAjR6XwZbPIUw6QiwSXClwO8ez4g9hX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMGxqHBenkhXclD0cCA641SdS/zbYThx3ZyEhqar1RQ=;
 b=cAC0QJ9MX05VhRKsLgLu34AxJPgSPFiF34HYirMUkKE8iL6sLiN4ERqbDRUPXkvvUAG/lkQe4P3LXkeiS2U2JyabNGib+VEz8CKSX87+N5humkGjtq1bLES7q1mShEKfjlVpPTmqRaKrLrIPcZAJfZEiMZU1b646Ys/J6QYuX9eXuRwYbNOwR3yUO4P26OOu1RftgS1ls8PLZADh84PdbHxD4L2I/+ZEJJNmU2IYqINczEwQl/U2b7UA3iVGcsAoZw5QDhjOqQEXiLVe8S+EhoUzwqemVRp8o37Oe+A2oz5Tc6+IZ67gCEEFoZeGeAmxkUUib+BAUK2L59xmSAgXlw==
Received: from MN2PR01CA0047.prod.exchangelabs.com (2603:10b6:208:23f::16) by
 SA1PR22MB5270.namprd22.prod.outlook.com (2603:10b6:806:3d0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Tue, 17 Feb 2026 13:55:28 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::5a) by MN2PR01CA0047.outlook.office365.com
 (2603:10b6:208:23f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 13:55:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 17 Feb 2026 13:55:28 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id AF514FFDA2;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/5] ARM: dts: imx: b850v3: Disable usdhc4
Date: Tue, 17 Feb 2026 15:55:20 +0200
Message-ID: <20260217135521.65742-6-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SA1PR22MB5270:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a8c85704-2550-4c5f-bb76-08de6e2c354f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6JsyC0oHJTP8uFRCcIiz05tZXHalSjar3ztz47AnKgg5ZU0XvqcNHG/oAj3t?=
 =?us-ascii?Q?G+SItOy+0fsfe69nJAEOsarfCFOT0N7snzK4p9hvdywNvTMS/6Idl7ZXswen?=
 =?us-ascii?Q?V0TULkb416Mp006Q38ayFPTosKfe2s2NAyqSgBPajTQUl05Xpr/gfCQkj3VR?=
 =?us-ascii?Q?T0lW0lTinq3GDOWzx1IRpOUrn1i6AkeTG3nRQ3uMa/qLSjvgHIVWBaLtXI1Q?=
 =?us-ascii?Q?UTdkdZQKnVowLY5ZaavSToPN8zO0nPeAI5CtB1UMxBWBntik+hb0ACXjGSOB?=
 =?us-ascii?Q?DWvMBP1cmPklGKWyjAqxbEJ2mL2oAA1Umc4q03RFJqk5nXTEPOhg5GykPHBs?=
 =?us-ascii?Q?GZ9D8zz7FTPijajpn4mMKkxWL2EAzzaFejqer5VMPwS6ZP0ahX/Vipzz0qrX?=
 =?us-ascii?Q?Mmsg8H5nZB7y/dGAtwNxAyMpLOP/3fZOni2qCpRy7E4AMgJFsRuFWabHxpzz?=
 =?us-ascii?Q?2QsoUrYPmLpqQJrX6hwzkp7efrGiYoSBgqS7NBURI9LxgKuva+ze3x+WewGa?=
 =?us-ascii?Q?V8ElWcth8QFbqABUz4fAwgzlZyty/bSwVCXoC1627eYHMFdtMy4XSUqBPZtN?=
 =?us-ascii?Q?OOHsnkelwLLLa5PFGsaFcJDlFO0T/dZxOtAFeJKcaGydVs3UrpkjSnpKFPb9?=
 =?us-ascii?Q?JVwWQQ7YXrg5Pj+2PJoR+SVm9cSSwwd6TWBMBZsNTdnnanUbZm6ViPYdmfQV?=
 =?us-ascii?Q?A3/MSoZPel5xv1xXoBCyu3gj6i+GYpJBNq1trISpacz9llCBmz3Ux3XPgxTE?=
 =?us-ascii?Q?29mX7O5buUqfK8OnP0h8dFW3olmAOvN1zJDCgvxaUxgrHgIt8VrK2rQ9xkXB?=
 =?us-ascii?Q?s/bOvXze8uPm1hx4gk79zkVxua1U9L34RLi9NTi/sAklSwYDEMO3kh+PD52t?=
 =?us-ascii?Q?2oaUWV3sq+h3g5BGOQ9O2+jvFr7v+cp/+RLl+5keU3nsK64ewCRKTasJDmBt?=
 =?us-ascii?Q?MWzaYORNd3wwAAZyajU7+yQH7nT8nnqU9sXYhDYC8Yau+eiZAoj6IvHW/NFz?=
 =?us-ascii?Q?ReiH42orUcFCwc6dsAgR2DhrorDkt1Q4LxzX+Os7l0dUBvt2mnpysewDr346?=
 =?us-ascii?Q?Pr04LqnHSdepuGh6GrsybbKAxqUSufJXN6UX9tSUZbtO6GMhBAaMigo9Jpom?=
 =?us-ascii?Q?bYaFn5mkg+a1OgMZum0q1SG+QFJgu98x9U/wy/WnWQ8+KRG57qUj29vkx9UQ?=
 =?us-ascii?Q?Uc7GzsQi9i94OwLHBOqxzB9UgEaRu/N7GkIOD70LMlbDIEXwL5WeBUSj77sK?=
 =?us-ascii?Q?h0KAIu8/qFXW3qACUd6B4ldBDPWqxmzO7Llne3Qk9HDfNK0dv45s3tGXOOQP?=
 =?us-ascii?Q?HYRB782o56o0j5aYV9wEJaA79sIJlnWVuZcGGlDhXq5Lro1A+iOeJ5dmSHxk?=
 =?us-ascii?Q?zRMxk77wxdHUVzwEqG8fatxK0M07mxfBPSiQ4U9GPiDsAvrSPHvM7KuNDsfb?=
 =?us-ascii?Q?zC2Ya4E1/XZQXPdVmr1pZjiZhdGxgRZmrfxzbUvM79i52xJVPtF2WfraXv+I?=
 =?us-ascii?Q?9m28ELtI1evBxcS3zuV6L+FjbbNoX7YRVDcT/B6aZBVk8Gnm1EQdjH1b7nbh?=
 =?us-ascii?Q?B4/ZWjjEPa7biDeBldwQ2pgmslTLDE6WjodoIj95v/wEyZNH2X/bvq5G6kk2?=
 =?us-ascii?Q?2pt12e+3UaAdfa2otrR4TH31HHehhB/dAU0rhqgB+UI/kPplxnmGplWpWSl9?=
 =?us-ascii?Q?SgN87w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zc8fP+aD8CKBAomQ8adHY2x2XtKnR4QP3qcMdM7m0y1pI6qCriAXESR1LdjzYQvRNRrt+VDBZaTpUd6REq2O9bFx1LGw4IcSd3kaCzDKdj2+TkV6JsGSTBVf/hyCD5j5muM6MOg2krH5psSi2er0bV6uRhof4VCAmHmVN9YgwOPkqEkryi/znwEXWEwm05VWqp4F+esrq+ZybrcnLq+fskLStURfyax+U9olOu8cO9VN4xK4FUrs1pfic01K6XaahBjJG/HeB6lkGhp3zxl84wfvTpMYHud5bxOt99SXb9EHCcvl9hBGtisd4RbtQL9sWlexHnUO/5cPgGqo8I3HLSmSayD5PGQt33CSGh3QVRT+3Cza57qQkSMKCO53IiMzPGTefa5ks/1YtS0u5Vpi4+5AVeKlnV0TeeKvrzfCMIG1ymYiGyW3OMCrU6G7Bt+Z
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:28.3513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c85704-2550-4c5f-bb76-08de6e2c354f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB5270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_055534_322887_9C254885 
X-CRM114-Status: UNSURE (   8.90  )
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

Disable the unused interface, to fix a log message.

```
mmc3: Failed to initialize a non-removable card
```

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index e5e66d536a2d..d00236a07dc4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -303,3 +303,7 @@ port@4 {
 		phy-handle = <&switchphy4>;
 	};
 };
+
+&usdhc4 {
+	status = "disabled";
+};
-- 
2.49.0


