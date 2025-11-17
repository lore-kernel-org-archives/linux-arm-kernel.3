Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7D0CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QTEL6Izch0K5ZAgdjedJYC59oup2Y9TdQVDCw4sXrt4=; b=QnoWnlWmDv9G8UjGcIles3SPMt
	O7+QgW7HW/e391AlJaR57iRHFyk0lrD5SQ//F53VPvpuPW1z6fuFa2gTuVbSJXs46MLFRbV6JheoP
	0dy05nnXyUxoP6/MtpfAdDcwZPmdvWyDmUZD6BdPVxHXMbHa4ieLr9xTDasQZJ0kSZGfuscS2M5Sv
	O4s39dctM1BmA86Ot6kOVvLYY+AMZMotsJx+dFzPwcQDS27NTwWNl6wSu8pDmY4cjaFjJsyL8KH2T
	3TidJY8xaziLnM5A63alxV9147pD3F+W+Yccz8lpz9KI8nwQd9CIS0EL6sHRfX9vIqPWB4tqp4OK1
	xedWn1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzxs-0000000GEzn-3hkE;
	Mon, 17 Nov 2025 14:12:20 +0000
Received: from mail-westus2azon11010011.outbound.protection.outlook.com ([52.101.46.11] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzxp-0000000GEzH-3H3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnKs51Vw2qNFP1CAOTfUVV+s4uARYUl+Aey3slLJAkXZCYVFf3o8FkNLtxZymiVORhu43rbxYxwL8De1kkcyaQunBmxjH6S7yvwdbJjtx3oXI+fIfOqryiKSTkTijOigGRcGAsjJxyctamUxvyDQBtpwoBW/IuoRHEiTd0eY7kn/UGOG95MqYqi6hVk0niwGw2N3CCKzlHyAIauYZExKGN7Az9vClX7BHAZfyKdAHCiNKFkynilyy74UduL5jEgrx3IP+Nz9EBmYU/5o1wRNgSq9QpSjWcNf9KiAa9cBl1FKwVNe0jLgoRndXjEjbb26HyTp1s+5ng7gSu2wh0hZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTEL6Izch0K5ZAgdjedJYC59oup2Y9TdQVDCw4sXrt4=;
 b=ELQhvSN0EhAHrR/Po4kYCj7iBwcnRNdNjc6ywbBDGhgdTiOhMz5+bUl+Oz+EZ4LYt+AbbDLHSR/RI3YrJ0y+9geq1sjm/9UHbdE3RHAIMWPMdMVcYH30rSWeR48/PmRaack/QEMk1WztrYkMhj950M3YB3LtB2ihS+5UZsStL+0R1uFdtCGgKOGJVdvXvcZoujbAAGD6KQfFa8KBuV3u7GsH2tA+EhqcMnh5C6utUqLOMSAgpkq4HJWOOZK572zmtavTrfJr2lusp/iEeEVHiesenugk2fodTo+yIhdZ+P9SyyqIRwaCvUb/eEMI62Syx0Dpnp2YuyMCPBQsoLny/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTEL6Izch0K5ZAgdjedJYC59oup2Y9TdQVDCw4sXrt4=;
 b=s1ZEL4GQEjFu+C1Gzrl3vqy5j8JkSp1u7XTrObHzrRW/UiPBn4vSoYRI+tarn7cIHPzgIGqgT/4gXdwE/wnHITToY/+YQ8P+HCnCCAttReGrO7SJsaMSyLe5fQRCDEu8O2KY/LU4uA4ZpQqOLCoNnWVRD6q/+4ob+PtQfqh+Orw=
Received: from SJ0PR03CA0262.namprd03.prod.outlook.com (2603:10b6:a03:3a0::27)
 by SA6PR10MB8037.namprd10.prod.outlook.com (2603:10b6:806:442::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 14:12:10 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::69) by SJ0PR03CA0262.outlook.office365.com
 (2603:10b6:a03:3a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 14:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 14:12:09 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 08:12:06 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 08:12:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 08:12:06 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHEC6V92618964;
	Mon, 17 Nov 2025 08:12:06 -0600
Date: Mon, 17 Nov 2025 08:12:06 -0600
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL] soc: ti: Driver updates for v6.18
Message-ID: <20251117141206.pqjzjzegxajziyof@resort>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvve6pb4a3vhlaqm"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SA6PR10MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: e7509da9-5d26-4f55-352e-08de25e34c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xCObZZIYH4i7eSbreSU90Jsl7/d2Ag0lEkgUQnGfMzUcFjNRkT5FnsleOFsj?=
 =?us-ascii?Q?BB7P7kPkn4d9Nvkvt7TCl536mlKBweSTMqmxviJv2oLq4/bCCRGd7P58kkiN?=
 =?us-ascii?Q?aXanf5xxmVZGT2jZ0cUCB7TsiKZgzr+xK0sFPtm3eT8xDGGslAppgTvFjZAs?=
 =?us-ascii?Q?KPzCcM/1Qp6Nn8gUGapI+UlRG7YVmd1iWueOHx6ZgCRmjYBZhNagdcYsd41q?=
 =?us-ascii?Q?rlCpWdK0m79Wd9qYfiT+Rqj04UdFUr7bw0SRqKk5ndq0oHWu/ZXfVCeoyM37?=
 =?us-ascii?Q?fqARhN73AduKZhUdUW/yhUWcoTzxEI6+q4wH6z6f38ldaM7IZzEJxLQ2j9sg?=
 =?us-ascii?Q?q4BFfjlMO2QlTt8i+9+hZzKUy62C2ae80rhQU2gkbrpMejA+jGniqmSSbDZj?=
 =?us-ascii?Q?SNaJpjfOqb2kKWwPuBaMAEUcH9ZRS+/e+eduk63yO9SSiw+N0E4/SkbkvsR7?=
 =?us-ascii?Q?7bxO7TL5Ebw+AF7e2iNmcjUDjljgOMT/FU8OGY0fYHbE8QMx9lxvSDQJPTn1?=
 =?us-ascii?Q?O1UNgMAanlBjES+eXFQmKwtlKJlN7bOQGy+QBeUxeeN3Botwi01lOUclrToC?=
 =?us-ascii?Q?F7WoHynW2kLxLapF6TLqgFRIFl/opIXIcMScc9akLBqco43MclNV+mFmEipo?=
 =?us-ascii?Q?p9vqDBuuA7ZMvLars36eXT+GOzMle9YQN9QoU39S1d1S47il8SISWye8XS93?=
 =?us-ascii?Q?EuTFLbmfNNrebyox/SnlLAPbRBtNlz0W/ZM7LQSULmAfArGMgZPr5J2YHVqz?=
 =?us-ascii?Q?44ITfjlvBShDvkmySAy51iIjkLzbYbNr/KIHkrX27OGSTHX/sHDv2UUJ7aKv?=
 =?us-ascii?Q?NKSH/lSCbuKRBRj7B/SODoSjMaf+o+lggPosCakota0HCUv1yipZIeSHLvKQ?=
 =?us-ascii?Q?q1cMXMIJ7pZ7Pg7Jcu13Q2KjvJY1vp4/qn8F6i1IDi54TJeOIWG8u8Ouv0/V?=
 =?us-ascii?Q?EJhajYkeEM9vArWLIIKUqoXVyWu/PbwjHEdB5M5uq72pMETT0LuZ2D2h4H9O?=
 =?us-ascii?Q?T+gmPoKMgt8UPvqTq60zDVxcFwWYgOvXmiXP+0dav7ue2yoTjwazZ7DsXKKb?=
 =?us-ascii?Q?zG9n02rFR/lZBQGSyNH7vNUuWXmP7kntMS9FYLoMCr3/SG3TFgumVN77j9mE?=
 =?us-ascii?Q?WNBW23VLnJiAzuGsjGvIK/lUrzE/sff/untH9s+Sl4tUeJ9Lv5uQQy1auvQ2?=
 =?us-ascii?Q?0YPR4SQBbXYklDT+v1DDhHZOLdzShNXxACt1PxWClPy5b4JMgkCkXT4kLtvz?=
 =?us-ascii?Q?y4WdKRg1uWaJ1ALSqvu/2vf+s0F+ExqVVoHqY8xd9Rn3YaL/gN1i3tSaF+UL?=
 =?us-ascii?Q?twRV7+udf5WfHadr8wd6UohRKroVaPrXiPhxUGiyq+PP6JvspYWKfBod8/D+?=
 =?us-ascii?Q?iW5qTmUqc8tzGCwdZT1184fiYxIwIkEuCmv38gWqsfANBTQbgBpmzWyEK4Fg?=
 =?us-ascii?Q?W5XHi9qtor0vRzp2ErUMXonQdWMuvUiEZ3jmYRMhVQAqUCqSGilExE2yhWWZ?=
 =?us-ascii?Q?spZD2iud7bV4D5jR7i0lKF+NoElWZoJMrXxs+9rt3d80ODW14/nPP7gmqTvn?=
 =?us-ascii?Q?Z0KufmjeTLjrxJvlEEI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:12:09.6707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7509da9-5d26-4f55-352e-08de25e34c15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_061217_946822_5B221BA0 
X-CRM114-Status: UNSURE (   8.80  )
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

--cvve6pb4a3vhlaqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v6.19

for you to fetch changes up to e0431ff998bd32dcc1e591a45b4e156fcb0325a3:

  firmware: ti_sci: Partial-IO support (2025-11-13 13:03:55 -0600)

----------------------------------------------------------------
TI SoC driver updates for v6.19

- ti_sci: Add Partial-IO poweroff support and sys_off handler integration
- ti_sci: Gate IO isolation programming on firmware capability flag
- ti_sci: cleanup by replacing ifdeffery in PM ops with pm_sleep_ptr() macro

----------------------------------------------------------------
Markus Schneider-Pargmann (TI.com) (2):
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support

Thomas Richard (TI.com) (2):
      firmware: ti_sci: Replace ifdeffery by pm_sleep_ptr() macro
      firmware: ti_sci: Set IO Isolation only if the firmware is capable

 drivers/firmware/ti_sci.c | 155 ++++++++++++++++++++++++++++++++++++++----=
----
 drivers/firmware/ti_sci.h |   7 +++
 2 files changed, 135 insertions(+), 27 deletions(-)
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--cvve6pb4a3vhlaqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmkbLS8ACgkQ3bWEnRc2
JJ2rZg/6AysHiSYmTwvTLPODcudRC/vh928BfHENSjGBjAbmSpdUE8Xntw4cqVJ0
mtwg4bKFdymYynUfItyIfvxaIYLIi/p0YOcp51I/mcvmAAELUlGYQTaV1SeXY8Px
UiIUDXVpHbNi+r1wWJi6cteiXsJzWJg4Sj/uCxU6g/oR8LcMEjBoczkSyOZKJScX
q0Z6cJhio9yUpTuXm2mB0PWlZDmXOQWaCen3w0iZRQP8u6v8OwkliI083dQa/GX/
9QFIuhfV5PD9jWtI3zcH5fL3wcOCxagLypN2E9t3luC8Y/2mzVtVZvw7iiISy9D8
8XmF8X98bYNEn3xu5y3c/NHus7W5OwuXr3OkwaZ18WJEet5z4ghsIIRh2//M/9+N
c6huWLQqGs/NoPV8+eTwFZjxjl1YynC1gNEqWYKLgyeZyn1qshHRgMeQRqVReQPH
Bpyc09yAA7MXB1UzIqzR/ktWmN87jXa2679cE3ody/AHB40GxNJPeXsJxkWueJ9Y
zEVFfy75TFR8vU+qmFIzJq/H4DrvW7PCH0NlWIf3PoDHg3m7LvvkVG67i2akjbDO
QacDitTVdZ1cZfXGdBISlnkY91Mc5H2wxPbQHyT6u89CsLcHJdzEixxaC8ofIXOe
TlQvawDEcna0y75Tv6pnVQs+fIvOGDX/Mzro5qePBaRvCdYQQsY=
=rCGs
-----END PGP SIGNATURE-----

--cvve6pb4a3vhlaqm--

