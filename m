Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C359FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xFZ0vSnVQU9WAxwuKugEpKxnAQwYY2paKYYRzXO//rE=; b=ezfu7bZjKkinqPc9BK4vF32yDq
	MQYrOHGcGhEpoWILlDbaxWou9h1Yx9bbLLGoNrTR6Zu+/0uQ722uiaPXK9I5b+SSFLr8cG229N1RG
	b35LeanzcwTxyj+V7r/CfVEObX/CcgbpNv62g6P+1LlJjp7FemRKWUptZngG6lCsMIfxK0+acJ6YR
	rtw9xn/v2rPllVj8f74lUSF9/A7GeCk/al0TRA0S6RQ2MmWWxruw/ag73Qqh/LHgS9FDOHpVcs33t
	QvrwdodqvEwqLyXqImdGk5D/fhRch9ScJ3ZYMYIGohGcXdTFwFa51j5WtctAtK/PfS2Yk7r5/fVw4
	3Qc0wStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUniL-0000000FRBI-2bLO;
	Wed, 03 Jun 2026 15:41:05 +0000
Received: from mail-centralusazon11011049.outbound.protection.outlook.com ([52.101.62.49] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUniI-0000000FRAk-2K9W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:41:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzrEnEOpmafchxJvY1Fr6NxybnVZYoqTUSeBj59idj9jrwbOKrGizTXdcNwzijlripJ8vKDo1EL9/9BvM+TiREEn+sy8+HK6Z9Y31b3+1S56Rgs7NstAPAs2rJK+qkzzyhTx6Y6HBILJQKnJMYht0PYHRUJl8LVRfphRWRGJLkd+OcCUdda5eRqZhwWwyKFXieR8qwgLb1vwKCrjLvm36GvSbu9KTKHaXKNN7BovDkvuOa9syZmY7N037DkfB+LECSODiUTuNq9q8sAlBxfc9P6E8UEtGxVQyvh1dXNOYRj6Okt7l46K5k0bA+29Wpm3yUbaSgvWxx1JoKXFEJiETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFZ0vSnVQU9WAxwuKugEpKxnAQwYY2paKYYRzXO//rE=;
 b=XMzmo+18hVZabeueOalb3UmccytvNdKlTmtpS7edVzAQvdtfzUpcPnkNRNRyYxnFivW54GbigbSXbZBuNgrWMpofyI0yoiV9omPVF40TGXS7MFgWrbAwKw67PedmFSzFvzJdOZd/bJtM7BcJTg67GgF7d1I4n3GibUvbs+jgJmIsMFFRGWLMixP5YRS8wiQ3+ojzuyoTMztfkQ8HWidqdjLUk9Tss7eISN0ZO6m0UkoaqH/JWb3phxzqoQuQbpyT1Fbvpqa4V78LWoOEajGIXFhkUKqapzU3IkkomYMyGfPTOEEjwe/4JMkv3usoRRz46ynYH2TPD+mX73QDqjxNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFZ0vSnVQU9WAxwuKugEpKxnAQwYY2paKYYRzXO//rE=;
 b=IezEW0i5HVBun6pkFSxsVyxf8u2A2IWoJPKD6rlcWWazI+WFJe4/NfZ/lrkaEtCeswBiWAi6fpBZqQKzXrJqk5NmN/S7L28iEe1jN2LMXYikM1F3lFvE/Yl8v7JE9O1CnS5Nb+ECEm5Kq/HolKbk0xoJaqKIL+Ecw1EntGaSoBs=
Received: from CH2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:610:50::11)
 by DS0PR10MB997625.namprd10.prod.outlook.com (2603:10b6:8:312::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:40:57 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::3b) by CH2PR16CA0001.outlook.office365.com
 (2603:10b6:610:50::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:40:55 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 10:40:29 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 10:40:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 10:40:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653FeT7w1499474;
	Wed, 3 Jun 2026 10:40:29 -0500
Date: Wed, 3 Jun 2026 10:40:29 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 1/2] soc: ti: Driver updates for v7.2
Message-ID: <20260603154029.sozfqrlkptyvslbn@stinger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhtb5u7zqvbvkzw3"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DS0PR10MB997625:EE_
X-MS-Office365-Filtering-Correlation-Id: 411a1494-070f-49b2-4d30-08dec1868084
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: kPvulWURRt8gyq8eHtoE8eucv+NNYiyIvfMlFo1AYaKd+z3WmXPC199xMweYyk9BbvN781N1eh8uJ0iU/2kocmMDqqC+8t0z5HZqrstYgKMJ4GWqs5z3eN5vu5/sZ74SaC0AQZ0XGI7McQxpfiJ/XQ/6wO8i+dXT3AzWtJYpZ1/rNjTaby6MB/NfSC0k6x1yJvQXYJR+54xIA9NUUW7wXJylo9Uv7LtaSG2lglThUGKlnc2XWaMfyiFw8eBS8fqwuz2yLsz6PdBg7AYkqq/NGQX49b40+QewwjR5dGq8w4jcOPg27PdjJWvRGFD1xQwloUBMFBk4oxVz8Eq9Qs6vJS0Q35LI7t1AeqsJ3ZA15Gvi4Kx5yV+lKCsrd7leyBpKOIjyx8Go9bNeSV3FUiPe9S+qLhJy5bIm/nZm138t0afdB4I7l60Pp+7cOvGeXYonvCXA23dIutHebB4+i8hRRRfl83iv1QfmOIe2HPJzDP5W2AqW25a1RgzDuQvzV4voqG7KU24EE1aCUxAAf4+GlvIxB0THUMllGwJMr/wgQ6dJqmke8fgxUTTOfSfB+SmU+x2rYhHLdVV/vu7oEIxZnTWG2VufqSVUqGD42mETw5vrbheo6/kacsIOnTvV+F417cFqouuIQ1g9ZTL54yGNh9dq3TD9lo5ClyTYu1sjltnHWYkloNGQNVh+FOSFk2pI7kV+tnC6Giqtyq8RF5vqNc1lXWSlNVHIEb8Rt6oid9g=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cnl2wATnsS8SYM+gRvbylTu4rEzkuK+YelQ7Zk5nwVXEIcPIqb4vUSzVvUKZ3uJf3ODqcyNgn7vb7rmIEiWixX0zMFxAGazgW+U+6MKt3w4l7vBG+reBFH9hUHVOM8ohfso0/DIAhAa4OQZXPmBulvPk+6cnn6vePulOfc4M/ux2M58qXD+BUv7QIKbIRv09M7qVNTa5oKuGiegE/vP4TpbJoEBoAAPl3HyqIENhWKw4R1KaHkSM8g+dSvDWNa5NlZgxdY6AAvMNK6QOVbOt/8E8LLKKsKfaVsuPFZ3aRrRggAIq1oJ0yymgybujTAB7FgD0jr3IUbg0Elu80ieCx+64AmWqa31lSWEjY+q8mr7WswSQSVUxBhO0Dc3GmX/wwuqItBKDCxXzTy2hhrGLpvWACuf+12htrHq/YzTqeRmYdl4MUNEqRzfiIyt+aiE3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:40:55.8213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411a1494-070f-49b2-4d30-08dec1868084
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997625
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084102_696592_417F6F64 
X-CRM114-Status: GOOD (  12.04  )
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

--zhtb5u7zqvbvkzw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

There is a minor checkpatch report irq_lock - Check reports "struct
mutex definition without comment" but it is indeed part of the
structure documentation. Things look clean build wise and tests across
platforms are also good as of next-20260602.

Please pull:

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v7.2

for you to fetch changes up to dc51f820bd32415445655aa6e3af9011b9e3e0f3:

  firmware: ti_sci: Add support for restoring clock context during resume (=
2026-05-26 06:44:42 -0500)

----------------------------------------------------------------
TI SoC driver updates for v7.2

TI K3 TISCI:
- ti_sci: Add BOARDCFG_MANAGED mode for support system suspend/resume cycles
- ti_sci: Add support for restoring IRQ and clock contexts during resume.
- clk: keystone: sci-clk: Add clock restoration support.

SoC Drivers:
- k3-socinfo: Add support for identifying AM62P silicon variants via NVMEM,
  along with corresponding dt-bindings update for nvmem-cells support
- k3-ringacc: Fix incorrect access mode for ring pop tail IO/proxy operatio=
ns

Keystone Navigator (knav) Cleanup and Fixes:
- knav_qmss: Multiple code quality improvements
- knav_qmss_queue: Implement proper resource cleanup in the remove() path

General Cleanups:
- k3-ringacc: Use str_enabled_disabled() helper for consistency
- knav_qmss: Use %pe format specifier for PTR_ERR() printing

----------------------------------------------------------------
Judith Mendez (2):
      dt-bindings: hwinfo: ti,k3-socinfo: Add nvmem-cells support
      soc: ti: k3-socinfo: Add support for AM62P variants via NVMEM

Md Shofiqul Islam (1):
      soc: ti: knav_qmss_queue: Implement resource cleanup in remove()

Nishanth Menon (11):
      soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
      soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
      soc: ti: knav_qmss: Inline lockdep condition in for_each_handle_rcu
      soc: ti: knav_qmss: Fix kernel-doc Return: tags
      soc: ti: knav_qmss: Use %pe to print PTR_ERR()
      soc: ti: knav_qmss: Fix __iomem annotations and __be32 type
      soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
      soc: ti: knav_dma: Remove unused DMA_PRIO_MASK macro
      soc: ti: knav_dma: Remove dead check on unsigned args.args[0]
      soc: ti: knav_dma: Use IOMEM_ERR_PTR() in pktdma_get_regs()
      soc: ti: k3-ringacc: Use str_enabled_disabled() helper

Randy Dunlap (1):
      soc: ti: knav_dma: fix all kernel-doc warnings in knav_dma.h

Siddharth Vadapalli (1):
      soc: ti: k3-ringacc: Fix access mode for k3_ringacc_ring_pop_tail_io/=
proxy

Thomas Richard (TI) (4):
      firmware: ti_sci: Add BOARDCFG_MANAGED mode support
      firmware: ti_sci: Add support for restoring IRQs during resume
      clk: keystone: sci-clk: Add restore_context() operation
      firmware: ti_sci: Add support for restoring clock context during resu=
me

 .../devicetree/bindings/hwinfo/ti,k3-socinfo.yaml  |  11 ++
 drivers/clk/keystone/sci-clk.c                     |  45 ++++-
 drivers/firmware/ti_sci.c                          | 201 +++++++++++++++++=
++--
 drivers/firmware/ti_sci.h                          |   9 +
 drivers/soc/ti/k3-ringacc.c                        |   7 +-
 drivers/soc/ti/k3-socinfo.c                        |  41 ++++-
 drivers/soc/ti/knav_dma.c                          |   8 +-
 drivers/soc/ti/knav_qmss.h                         |   2 +-
 drivers/soc/ti/knav_qmss_acc.c                     |   2 +-
 drivers/soc/ti/knav_qmss_queue.c                   | 155 ++++++++--------
 include/linux/soc/ti/knav_dma.h                    |  11 +-
 11 files changed, 372 insertions(+), 120 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--zhtb5u7zqvbvkzw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmogSuUACgkQ3bWEnRc2
JJ2cZw//XnumBfs0s4vfll6n9FFh59Xm4iFwRaayo2efBfOTnloKyK3SRKKXaQ+p
AjfrCjJuRrQ1m3HGkQKLRtS6XJoC3EiwFzE4oH731TB463WS/AOuC3kY7IfZFmUa
9Y/cKzb+gP37QKfSKr4/dH81cJJOiJ97augG5PDHACHSSodObO52YSGXeiEzDx4Z
9gjT6zdftNe6L8U1pbOTVlRGY/5AwtcLgqvOeNuEGYqYZdlhNXZoLs8VU5WEE/ih
vQZulUkaZSUTy9y0Vvqf5g0JVNUHvEDVYfWIAqd4bkg01PwZ0AtAq1InlSSdi+7G
7E2d8WKsvcC7tpqJnWfZzI2Mgur//HJM/XsCVzfNCVRmGY84EBQi3m4B+YKKQQbF
RykNLA1AA57z7zAh6hBZb8qQT5KNC//qzn3L3h7NdcZm8jg01vkHDNCiFctasjMk
EjAgMR1sqREBuRPlbBNRecTHSqdNHiEM77iad94ZmpGndu6yQIM00En+p8f47wh9
rFORT7CqQc+f9rA4H60pOsulAB5wb33TZ2ptrWCSGo4q9m8OOAhrGRsDU7VjD2m+
XNypOkzlE7lkWOIQNEhXCQqxd9iKU9pjJeFD+pMfHFF8LRXNAnzsEnRDXtrYHtHL
kS60a2mVWKTYEbEDHHQVyFPcFlwL+1i14lrFhqWmAvosceJOsoM=
=2AUQ
-----END PGP SIGNATURE-----

--zhtb5u7zqvbvkzw3--

