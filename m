Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCEFC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rF++icwshe2VtcBT9AWi0iMRQyQPhKF4xSpDMXs35kI=; b=iyi2lIaT0HtKg3Ge8SO0YMz3lY
	0zw8xP8urJEitsd03LzA8qoTius9qf+TknZ9LkH7lM2gXDDQF307Gv+3F9FLxZ5cf6Mv/NrMa/oss
	+c+FifqDCeqms33RRfXVC868+ooJaenbAIMs6YG/3cwDxDbWdi8lrSiYpJsYqbaSQ3OelN/gDhzUk
	DSR1PdNRlqyKnIvldKjAmW4e0v28jNSzihXUfBJmyEZh0b3cvKYknB3rDHFBwIrM6RU6K62w10i/O
	Aj3r6NUY9ui8qRO6gzUUzqt33vRreYVwikpg8EdTHDpOWe+1v2mmd7VpapoxOcCh0SWZpGBV+qsjN
	q6Q1TlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4ZN-0000000A6fS-07lV;
	Thu, 06 Mar 2025 06:18:57 +0000
Received: from mail-am7eur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260e::600] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4Xl-0000000A6WC-0tXz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 06:17:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRGlYaTrTBM4BXYwGniin+ChcyjS2lpHu1ps3D0papvZ8eYSZ2cuEfMUJndu6Jm2uidBckCW80Y48HJiuPKIxb5Ktub3mEpG/iQpOoSXZQ5RhUFlgjPLf6+xZCRFcxm1UapSI6Y58YkMgzwzM93FrXnL0IZWFU/eM96edN/BLqZf/liWazajq5NwX5EjlQIX0x7W+P6DqV1y9+nxaAaBam/Tyr2xk+CJkr0W/ajTQsoS7bISnijMUNO+tpSupQ87w2uQhQy/bAqgYk5ZBrK2oD5OpIt4QkdJE9fRtaaPcT7/bR+IbX4kv0dPk2ylLM34Rb7z/OyIuePPSyX6xvufzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF++icwshe2VtcBT9AWi0iMRQyQPhKF4xSpDMXs35kI=;
 b=v4RmJAgU/oGEP/tbnF0ILHXudm/RlHVbJViE9wyMQIkNBbTh/jComNdGADvFLFz7uYIV6uJbsEi2teFN5Qb85zU+T3I9HoxwZ3fddi0QL7pUPpLeVLzpOw98JengoqniZEx7c0aLs32BKnqQwlhjpDulxqw4hcX6225Q33QKW+GBO0F6t6BIBK/EKpGtvlZltgufHELuSDsi7sLltG6YgsOAv1ZZYh+5UlCGTXWD4QvkvxF2PyxeYxagJP91ZvU97BTVXZDbw8WqrvzWX+spi3Boz4iddSKkU+NzPhxFa2nBIOM80f17AyD7U95GV1G764vqPNl1JoluXYi3441VAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rF++icwshe2VtcBT9AWi0iMRQyQPhKF4xSpDMXs35kI=;
 b=NAkZXR1DA/0dcClkfo4VTxUGKZfGYHOeL1cBCZtxR1wtk6vX1EobQUor0Rg+0itwbcEo9eAVjEd/J/NF/n3Hij6+tEEBUT5j6BuYuBGqGU0fSeTEci1TjLToRhztjtLtX240swXGpfoYOaHL+M4ZJwuhXS9amHsN91ZtZCIHqN/VBKjNBm+3ZOAOR/6luxTIZf7q+u/xfiLk1ZVSbDkfx4viwld8QKVx4C7BFpStA2u2FK24uQ5POKMKZk0XqSgS3mayqBP0kE2LAvOq8woRiUyVd2F+kxLNzLi/I1r5Ow4LHOQ4EiRENhkUjWBj59ldcav7m4uX4qTQ4tqh+IrsJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM7PR04MB6965.eurprd04.prod.outlook.com (2603:10a6:20b:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 06:17:09 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 06:17:09 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	ulf.hansson@linaro.org,
	daniel.lezcano@linaro.org,
	james.morse@arm.com,
	d-gole@ti.com
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	khilman@baylibre.com,
	quic_tingweiz@quicinc.com,
	quic_yuanjiey@quicinc.com
Subject: [PATCH v3] cpuidle: psci: Init cpuidle only for present CPUs
Date: Thu,  6 Mar 2025 14:18:05 +0800
Message-Id: <20250306061805.2318154-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM7PR04MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: cf94a3e9-a555-4c99-78a2-08dd5c7686d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Jl7guTR/pZ1/B21tymFzImfGHErO8OSCWBcvhvpPaElKPX9JAwnmAe0IvbL?=
 =?us-ascii?Q?9IMDTOkFj/paNOpr/IC5EXd+Ci40hLHBvTnm0PwceuN8O3LEE5FaIRqzs0Xq?=
 =?us-ascii?Q?eap2izv/Xgg2Ol4NlwG+49cIXJfoDrFVKbqPmgHKB+HG8PCzWuop2NXinhkc?=
 =?us-ascii?Q?qxuL9KzaYfhmQZBlwAguyNkr4z2pwcbqR4Ey+PqZY42IiJDOWTHp1/glGyCv?=
 =?us-ascii?Q?p/h3pYJ4sZnHH5D0mYf55ZLgtJx77CfAs3RjTJprq4sYbbZx1VKw8TIy9RaZ?=
 =?us-ascii?Q?VIpAsaYJFkyLz9RZhBZ6fNbxoaQsru/KLivKdwo9q81oH7jIamGUxH1OtlEx?=
 =?us-ascii?Q?zAHVb15bfm03Vwei60MdEX2qKe1YZNauGbHpCDPElZ9SG9swOrkOcBdyud7B?=
 =?us-ascii?Q?YT34r++GN/IiMGhIsm2KcZHhmPDQVm4aw9mKxSLZvP/G28WnGez51nKlyQB8?=
 =?us-ascii?Q?p+xTcYdvJNeCMt+SZ1XFsNrL/FKtkgIvBQzkjzqx7hW+xhV7iYwq8pvPACtn?=
 =?us-ascii?Q?CYXN7kgcl00CEwPCyPTa6GJoR/PXWUUtQosBfGamNlMOk/3o9gj4jJaPIrO5?=
 =?us-ascii?Q?CPOg1l8v1YwmE5Rf6yXM6ahau0XXnJsd6z79VbLO/b70rRCl9lpW0ii4OOu5?=
 =?us-ascii?Q?Lh/G/IluSOBYEfMIyVIA5H19DJFX0HjgK8neYnWwQKXm/9A3eCsBNKmA5tgT?=
 =?us-ascii?Q?9uEei5K1JSHEeNA4HLjelpEQY33PR1Z2ztVX4CRIlEHJ3lF1o+17GahdbEWx?=
 =?us-ascii?Q?lwivLum2yKO7lCUsbE0C9Jw48HyzBgSnsTIGAzZRCcbGw2AhwqO8TCiToMNl?=
 =?us-ascii?Q?MSszglhFUxM8Rr/dJBIkl7pcvM/b6zLNZs8oZLCnnEyGb2G2eycuoeu6v0oA?=
 =?us-ascii?Q?ukh8u7P5v8tGNOwJjG6j7BhhHIE3DIucfRWw3iQ1FTkPzPdShLOQHn/SJahn?=
 =?us-ascii?Q?pO0aoeuiNq2fyiQOATA1pMWaeetNsHl9k4nuJqQDRPctbDLhieAZtQ4c6YJo?=
 =?us-ascii?Q?nPAGSsjAByA6Ny95j3qTVwRtRfLYqhW1ER1H03N8Vi393fwC/AU3iyi9UBPQ?=
 =?us-ascii?Q?97ZbIdQgyTzcRu53ZU+stvIEzcc8WskAamlqLvMLyVHLd81hs1808lgqq3tp?=
 =?us-ascii?Q?QVJybW83HjF41pjUAZyxRCiBYeBLqO9EsHvon61X8jlnr8VDATUSb7k9OxgQ?=
 =?us-ascii?Q?k5K5znM8SgfjL6djCPaIq2E4BwivYd0eiw5cTsJfTKQ4Y+aIPvEMtBJxPMir?=
 =?us-ascii?Q?eSAnMKvc8HscqEg2jYwHmGfqEHJsJLUHGsnmqcu29nViOYUprv3F//P9Nwnk?=
 =?us-ascii?Q?GhwNwekiMCNA2Elg1uCOn6EmublLBtdTWl/qH4d3EH5eGtIfVV5vwo6DFXzK?=
 =?us-ascii?Q?0fRo2a7aetTCV1/8hxSCeHgk1iUVXGyUg9SZjkD09LwaFkKk6Oc7WX8gUo+4?=
 =?us-ascii?Q?sy/1CSyLhZrEO/rXRlhNpqHbZIKmRd4N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3P7wJ5aH3TRAogBBzeUxy+aDVMOHTn6YT5Br0VmH6RKSpFZ9ZjIcfXN6Ptac?=
 =?us-ascii?Q?d1MhP4BI1K6GnnVKCBH2SavlkMGDKHgCf+AJKyQAmWDIjuQGRAqdseXomH6U?=
 =?us-ascii?Q?lf/kERJk8oAuX9b05sSKsGkNymY4sdiKVSNrBoHGMfsriIdoRDs8wO8GzT2A?=
 =?us-ascii?Q?/Owez/Ck37KOLXNkV8hctjt1wqAyRoVhgXuET7xBi68nrJ4wr16Mh+CzVR48?=
 =?us-ascii?Q?H5SgH2UCXQ3SZRsZ2e5FXE5c+1mG+MdkSf0G1+F314zQXBrR2FOE12Z/Qlv9?=
 =?us-ascii?Q?nxImwgLUa63mqNtgwrPSoGEjzbp/C/K5fVm7so/GwbthHidbMHWN4WPWJBWo?=
 =?us-ascii?Q?QjQTJQlk6lZKcxoCuCydqtrHKT6gRsqEjEAjzQGqX9uqTvxKS225Zuf4riCY?=
 =?us-ascii?Q?1vquWziZrQmEjmx2Yme9cM1g8xat8IUhaOqKhh94GLzqAGGbKQkfTNAGm4Xg?=
 =?us-ascii?Q?pYH0z3wZsxyr9OxCQAyySmIigHpRjy+GjInLgA1iel8FgkkRI6/MbOTMRNEv?=
 =?us-ascii?Q?yJQaNBWdB8ixxprW4jazCI6jKBvcz3/T2YADnfTayStbFWoiozL2P1lFZfd5?=
 =?us-ascii?Q?v7fcR+8g/08oBjKCP6Dq0Si+PBL+AVzrPSsmkTMwLgfPi2DUp9V7OooFvKbX?=
 =?us-ascii?Q?A+A6cWAQ1lENNACzLWV1t8yBaCYntmbWoYE9FeaXSHzoK8W06TtNsGAZZYXu?=
 =?us-ascii?Q?oqBitpCBQVpznCAUCAqFtaWUOgM2t8Snji/isFeH0mlW2M4MX4cM0mLfRcgS?=
 =?us-ascii?Q?zjl1P+1QEdXdiuPhRVUe0H9hLZzSi54bDeVC1QP++k1e9x0mbF1VAy7VaZRY?=
 =?us-ascii?Q?dkhQRrrBaDXLErSAITFWvkyBYvXSVxeiHbbDAsj/+/pP6bQtGQ2eg2bO+cqt?=
 =?us-ascii?Q?hmZp+ue7wW1xgDzQfqTmNkH/GbjO/QwDtys3bJyCuC97IXoHrTZ/uEVs59Z7?=
 =?us-ascii?Q?WNc6zZj3ExryxC2JMH/3XqJEmgn3GK9FEF5QWN1n8krq3y3Bzk4JuVySrNo7?=
 =?us-ascii?Q?2zAqN+OonUbpekRu9jwMca2OrOUM465zI371qwUFvMnZpRtJHqhoeWHX6iKH?=
 =?us-ascii?Q?jcn+M/nsvtRkMcF5x1096Ox90txDUuH7n510KE5EJBZlZhgmecDPanY6EPwK?=
 =?us-ascii?Q?vxnkYc6nulrnLu7Uy/o8BnfGKFtVvJeUg1nhalcLzgKIlmBT259zUuBG7nyU?=
 =?us-ascii?Q?OcPK7J/BytnwMiVUf4PRdRw1m6OIk1tnTdMkL2aoTLH5GlhYF+b3DrJU3XDd?=
 =?us-ascii?Q?VgNngGOfpiPPOPW8LJLSkFXQOmLmbWgaNDE7eMAr8WcWIXx9JVe1AabnGK0R?=
 =?us-ascii?Q?6ARWT6eq/mNTe1O5BkFJNJPrpgib3aid07k3FNKMheQ1vX4IPnQxfckL+ZxN?=
 =?us-ascii?Q?65Zc3M9EeGxecci9fcFUXVmUFLCYmpBaraCmytS/2xxtb9DujkzA3ur6X5EC?=
 =?us-ascii?Q?oIsQopwHUQxMlMST7I73dAvZ+YEFsejpctk6VUiJNaSUz9hi6gWrJhO99p37?=
 =?us-ascii?Q?AeuP0eN1RY4MJ++Aj8kmA0f4fiej1hFL0+v2xB7OO3YYRafS/t4rRKQ7A+wa?=
 =?us-ascii?Q?w4jDkxnb/TvIqugHNekdwKeEoG+yHeNeKGtceWHJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf94a3e9-a555-4c99-78a2-08dd5c7686d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 06:17:09.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RuoU7FFPbyLxN8qxHei4Aw0zQkQfTTu8mY7L/7gtUn8GDUFPRWCBgtak1YCcvM9jHCHseHXipETQiOGeaQ8sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_221717_254531_761FE0A9 
X-CRM114-Status: GOOD (  15.01  )
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

for_each_possible_cpu() is currently used to initialize cpuidle
in the PSCI cpuidle driver.

However, in cpu_dev_register_generic(), for_each_present_cpu()
is used to register CPU devices which means the CPU devices are
only registered for present CPUs and not all possible CPUs.

With nosmp or maxcpus=0, only the boot CPU is present, leading
to the failure:

  |  Failed to register cpuidle device for cpu1

Change for_each_possible_cpu() to for_each_present_cpu() in the
PSCI cpuidle driver to ensure it only registers cpuidle devices
for CPUs that are actually present.

Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
  - Improve the changelog as suggested by Sudeep
---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 2562dc001fc1..00117e9b33e8 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -410,7 +410,7 @@ static int psci_cpuidle_probe(struct platform_device *pdev)
 	struct cpuidle_driver *drv;
 	struct cpuidle_device *dev;
 
-	for_each_possible_cpu(cpu) {
+	for_each_present_cpu(cpu) {
 		ret = psci_idle_init_cpu(&pdev->dev, cpu);
 		if (ret)
 			goto out_fail;
-- 
2.34.1


