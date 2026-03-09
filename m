Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B71FCA17C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTTzT09xpxXuEdKLKhVqsLeMHTVqtBfx/ich4kwbJq4=; b=FPSrBXy29/Vm0yfLIz2mFq+qtZ
	i2lbGl0E3VfS4IKQK8QkWAHGLpKFZbxlfYkWnAxt5WTIgK34I9I9Moaz51kXUv79xRBxxCXiZdnUh
	Bm4QxFea1wBXs2h6D5INSHhrI0Z9GcYbIIxUowCkxFJZEfTSx0z21ol9QomMEvCIrrCKkEevV6Zwt
	a/Paft+QMtA6QJf7I/eBfxwrCY6snmPQ7dixCxO/e55dtaUEOlGF0mSPYv1PTE455d9o6sWIL/haN
	t5/MOatWdfJzaMEp8ZPcX1H4t32PcvQz+a2fMAi/WX0+2kpvCdX0002bc2VY6Kzn/POC1YcoDxkpZ
	SQHl0z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfzb-00000007yiw-09c3;
	Mon, 09 Mar 2026 19:10:15 +0000
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfyw-00000007xZd-0sYB;
	Mon, 09 Mar 2026 19:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npjtNqvJDFNsroScS+I+BrnjIafjJYBCGXtgX8PJTJBDzVtOpOOdf3aXrTI0LjWRXksZFi8wmhLeHO/VW6KGsN3cD+F4HCp9Ri2250sd2yLn1Ss+21kbGnCk8KzigsktbG6SfrN9KBfTvV12Mpy9Cs8fj6iCMfkBz30EE5u08aP1mIjDZqDUaDht1Y4CT0zWcPg2ilgSyKOCTpsiG8m0jm2qilkNsb1HgG2XYLCWkHzlyadBpYs1ZVjmpeaCeRlLJ9VTitT1zUcFyPf6FASCddm0mINxrH79pO3T+IlctikZwNKa5PPWPZTdoTbETFyB1LUM4dhNsxTIy2XuLfzG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTTzT09xpxXuEdKLKhVqsLeMHTVqtBfx/ich4kwbJq4=;
 b=U1V6QzVIHaHFQxWaU3o3FOy/hpH+4f3hbz2YCdlYHlB3uULZ64PmJVvA/dWnQfwiz9G4eKT2C8c7vM0Hxzo40yL+F7PBn7lWGmyfVrLKowotudtWxp4t2ZEh4oG0xvTWATN8b1gllOKwANmXrX7KJYR/YTskkNgy9327YAKOGyu6+NSCT5akw/CkZbGlhVLC3fytO7VbLeRkhHtA4dpG0KG4A5gAhksFDi9UlTYfq1I1esV/d48+zkVK7nyD63Lf2dtlf8I6FxfkNwOZEknw4lfFnHd0kvNFISFRw74LlgynMGxk7q4Wx100IicbhsUq6crTUU7As+EYbea+N/lNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTTzT09xpxXuEdKLKhVqsLeMHTVqtBfx/ich4kwbJq4=;
 b=GjsaVudC0Zc3HZ02awdT9gRmBNnecQ6ITP+127TWlddb5mt64vNlzSVAcMdJrRFjuEdxHLTR14B1B2L+A/LeijSkxkvncCueqKXCZHXNMPL6w8UBCVHpDCicqKbyY2OTxG5PA4/GtsncQKNO7r6X6GuBoSUDnzEujGz5Ahc5Z6HK0y7cnxuE/nd94RSeaUwgx9pjVbfz57n8jY71XrBLBxrL8z2NNvquv07Q5l09v/MX21P5bpz1hjhEFDPfKdvSH1UW88ApbHiLWsSGFDtuYCv8RWth0r2Rg3fHYDp5l5q3Oswi5ol+CFgavHk3alrDQLczdqaDJfvTEz69O0fZyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:09:27 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 19:09:27 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 phy-next 09/24] ufs: exynos: stop poking into struct phy guts
Date: Mon,  9 Mar 2026 21:08:27 +0200
Message-ID: <20260309190842.927634-10-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309190842.927634-1-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::45) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 815c75e5-8bc8-4847-785e-08de7e0f620d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info: ySJk2f3zeNaTpXuIXEL8nL1iYHIPtjk+5Q+Dz45yX1RpgkZFlCgMm9HCBDxZ2PtpnNG9eSWuBTf31bC7Mq3NX/PTo1VlgLQpO4QP1Vr5cxyuxNnMWX40uakSpkSTFoxOJ9GlmzyUOSlDx7G/9mIms6Sfssehv0CsZkT/05k+NRU9qUd0wgTspGuPT1FcIaFud2/X5Vr85rUM3oolwPUvWEPaOVHF5o7tKHmgFpWEqFpQS3fbeZNJihglwhYgXFQwVqoHvsEjRjM9JVH1pfUqp+0X8nRwNlrZU0SC3lDRRiZDmQ1LqbOe2Cbi6hIkhqg7N2hP553cEikYIBInWRR2BOh8m0T3P8C0bjm9Tn4ZXwe64cnZyfiIcwbOci6ygf/IrponP+JUxZ7bsbYrgHqiyN8I8Zw9fBDl9YoyNq5g5oSE1Otp+GWJJ6KjmHBhJ0J+afFGPzq4v1DT0qex5JZcjD5/CmEnwuCAfAANV+aewwQ8mUVorVi+8QR+1stLaaEt1tqtRpZfPBrz12JwS5FSykB53H38iCk5dDDUuQ14nYc3U8LQvh7f2VQSvr04UYWHfxyMFBREJr+VgRQu6HRzx4d0mpphY8XbcqNxPEbNC8Vjp+UUhadVl/NmWrAtu+ZRP/mdvx3PWI0Pwb1tbDmmeXC99QvDydw3DxOLCGy4Ltk7Qh+r6SowgJBkI7UBRTpmcu+kPxlCtz6AfwXKpL2B4JEA/HBa4zlzNh45FaJqfdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WfpQmH1bqcQle5cXiVmRoXWoMq69g1oFOFdUzqCLrfbQtGVb0UMx7tBIcVi/?=
 =?us-ascii?Q?5BGmX2gLO2D0VCBdrAhZ3SG0yTXAxyVoeH4/sT5Ky1FtzzbOXRlICMkDUM+/?=
 =?us-ascii?Q?w4dnhPQygV6sBlYE465g4fW5QdjIE3VmWUDgc7w98AX53uh4tX9KPg44fpw9?=
 =?us-ascii?Q?4dBNLIlQwqBmUYpC1ydxHRapHCfrjM8RRDJzidCyUWb07rZvCkkdKDTtw8dw?=
 =?us-ascii?Q?LGovm0NW1Q8FDohnaR+1XWAoHwyKIR7nBw/f2uK99XSBnwGmB5a/ZpONfjWO?=
 =?us-ascii?Q?Jm7kb+i/25nBz4Kkij2nd+vYpyeAQNek3sXIVJyA19HtalcVpxKOSxJWRAJv?=
 =?us-ascii?Q?QPXdJH+ADT7BAKtwKji5GGMvUyzYISqC23bY+rFZkZIgwB+YpHfWP/ZcHbfg?=
 =?us-ascii?Q?34myXM0I+SkuwAJ9+bbjnKZGhfjrd89avp4UEvIKVFEW0sVNn+VqzKRtwfhe?=
 =?us-ascii?Q?PclWJB/nvO6tKrklhnrnH8PhXk4yreR5kWUFjbClfVU/7uaG4FPMMl55eHL7?=
 =?us-ascii?Q?GUDVZcAEC6FFxGxTpNdGayOnyUi+aNRyKnrc/0C05u8u3EJlPdiSOYeS/mmw?=
 =?us-ascii?Q?QqTT/W+w0JDdjj5u6DlN0heyXQgdV6hF4K2wPIIlxkMsGej8rachmECsfKO/?=
 =?us-ascii?Q?nZekhKzlBOBhnMTe7U2GSnYUpFcZBgUAZRcV8JqeFiObAZrcehT6IRfmOeEl?=
 =?us-ascii?Q?mcNcqd7IkwrDKxwGLvsEkgfx1WVE4DyDEB7CtOuU9v75UuMcXWPkur4tH7pj?=
 =?us-ascii?Q?l1uE5gIAx9l+KnfKdKbiYVynE+Ye3x2/RrhkH5ppRrLxxzazAiXoGLqFx5oT?=
 =?us-ascii?Q?ZyWtH8Cv+6BuKnS02XrCYmUsWGia1y9X2TozGsrDnIErQA5ELbupYGcvZ7px?=
 =?us-ascii?Q?xSJgM+Tzp1jR0xm+LrfLLz+vnsjLD3lpTj02kh8Rx7puQfWyHszOJdPjYTiC?=
 =?us-ascii?Q?030yQEcZ6j+/lo8a8uADohWRTKjleWo/hiWm4m7dQr+mTfI4qxDdUl2LiIS9?=
 =?us-ascii?Q?Xvy9b+ji73K9fF65GwmhVWYgl3MXSnr06AeQznUJ1u4CPCkDn1rtNW0j+cHq?=
 =?us-ascii?Q?+G2XVFWujAmtsfBv2g15B2hQ9Kz2UK2gAUX1s73SHHl5o79FgVKCgtN+u+es?=
 =?us-ascii?Q?hkZAAw6YJqf7ULglmnedjf3KeU8RLNVtlsqZq5vCJn/Y6pSzS5ZYqz76XG/H?=
 =?us-ascii?Q?OUxIE+q/UpMZkdjWNMdqUoNx7Uy8ur1qKr++yXNhPRd0sYQcffDNTNTVJFQY?=
 =?us-ascii?Q?Frh492CE+Dnsfe3ImjHNG6E+5bzmyrQyMP7XRezSRRqK8/lRPbbB/Ss4JHNB?=
 =?us-ascii?Q?zS5t+dLFBfElPgirWch2VVy2kmO0l4OzP/klaknsDD95fF2sCHEbBZ3wznmP?=
 =?us-ascii?Q?NFZOUmkKPGTogaPfG5bMpX8dHfpQHW8mnYm+3eW2+5iczjyYGcoQ801J0yek?=
 =?us-ascii?Q?q+IVjVqgB+szELBg90Cv/hDPQ1uJ6dHJ+ZNcaO+uhJh1iQjjUfcSbmllKEOK?=
 =?us-ascii?Q?Qv3it9f1nj4LqOwQn1451xTvN4St/L1fpjz1K5jZ/+JFQmMFu5Rvx3nuEkU3?=
 =?us-ascii?Q?Utkx9nJL4uSfqeGlXOFKwKYzr/3JhBejzeeUOK2qf/cJoOYY5IKTKo4uzH3h?=
 =?us-ascii?Q?HtuemVxzxMHpO4+nOzkinHgj0erRyNrWPj9+zb+JpvYvZFrAEZYac2Q+ZRC/?=
 =?us-ascii?Q?GyILOegWw+UOLC0im+/Y1EFC2tfNr8n8/Cw6N/g2XMYbaQ3i6P2ZiCwCdsas?=
 =?us-ascii?Q?c69MlZ/s1u7KGQWjvM/17HkWAl8sTSitqi8QfoVOqyoZTxhuINOTZFXNrEOF?=
X-MS-Exchange-AntiSpam-MessageData-1: BXchlwbXih5cNE/9gne86+e0WmvXV/jtJDc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815c75e5-8bc8-4847-785e-08de7e0f620d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:09:26.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjK2aux57mmEH5BNwupzMjMNvF60OMHweMS9Tk9n8zpz13Oz8UnPz/trWt3yqqHIRSuZQj5fUJ498YXUYANJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120934_292343_272BDB17 
X-CRM114-Status: GOOD (  19.80  )
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

The Exynos host controller driver is clearly a PHY consumer (gets the
ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
to get the generic_phy->power_count.

The UFS core (specifically ufshcd_link_startup()) may call the variant
operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
if the link startup fails and needs to be retried.

However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
the generic_phy->power_count, because in the general sense of the API, a
single Generic PHY may have multiple consumers. If ufs-exynos looks at
generic_phy->power_count, there's no guarantee that *ufs-exynos* is the
one who previously bumped that power count. So it may be powering down
the PHY on behalf of another consumer.

The correct way in which this should be handled is ufs-exynos should
*remember* whether it has initialized and powered up the PHY before, and
power it down during link retries. Not rely on the power_count (which,
btw, on the writer side is modified under &phy->mutex, but on the reader
side is accessed unlocked). This is a discouraged pattern even if here
it doesn't cause functional problems.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanho Park <chanho61.park@samsung.com>

v2->v3:
- add Cc Chanho Park, author of commit 3d73b200f989 ("scsi: ufs:
  ufs-exynos: Change ufs phy control sequence")
v1->v2:
- add better ufs->phy_powered_on handling in exynos_ufs_exit(),
  exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
  enter a phy->power_count underrun condition
---
 drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
 drivers/ufs/host/ufs-exynos.h |  1 +
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 76fee3a79c77..274e53833571 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
 
-	if (generic_phy->power_count) {
+	if (ufs->phy_powered_on) {
 		phy_power_off(generic_phy);
 		phy_exit(generic_phy);
+		ufs->phy_powered_on = false;
 	}
 
 	ret = phy_init(generic_phy);
@@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	if (ret)
 		goto out_exit_phy;
 
+	ufs->phy_powered_on = true;
+
 	return 0;
 
 out_exit_phy:
@@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
+	if (!ufs->phy_powered_on)
+		return;
+
 	phy_power_off(ufs->phy);
 	phy_exit(ufs->phy);
 }
@@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufs->drv_data->suspend)
 		ufs->drv_data->suspend(ufs);
 
-	if (!ufshcd_is_link_active(hba))
+	if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
 		phy_power_off(ufs->phy);
+		ufs->phy_powered_on = false;
+	}
 
 	return 0;
 }
@@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+	int err;
 
-	if (!ufshcd_is_link_active(hba))
-		phy_power_on(ufs->phy);
+	if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
+		err = phy_power_on(ufs->phy);
+		if (err) {
+			dev_err(hba->dev, "Failed to power on PHY: %pe\n",
+				ERR_PTR(err));
+		} else {
+			ufs->phy_powered_on = true;
+		}
+	}
 
 	exynos_ufs_config_smu(ufs);
 	exynos_ufs_fmp_resume(hba);
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index abe7e472759e..683b9150e2ba 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -227,6 +227,7 @@ struct exynos_ufs {
 	int avail_ln_rx;
 	int avail_ln_tx;
 	int rx_sel_idx;
+	bool phy_powered_on;
 	struct ufs_pa_layer_attr dev_req_params;
 	struct ufs_phy_time_cfg t_cfg;
 	ktime_t entry_hibern8_t;
-- 
2.43.0


