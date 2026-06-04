Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2976CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 03:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fKq5fJ3cqFIQw5+w/Q9G5m02Gv7YUg6FInwPoQseAA0=; b=zwcRhoKK6qRUZy1amJ6jHzV7kl
	Pk8bM3zkeeQROowrSVhkO9M+wfrS80NCyiu/KPIUZFP4e6EZc5D+3fVTnHIdigYGwNlAabfJy9APk
	3TC6aJzZhZqT2vVu6lOkOhjhs3OqsKAd+kkygI/GUJrvdJGUALDIugnnyE/xPdMQVL7mC/SPcq41q
	ipml1Sa6QCx4dIJDGmtuaZJK+1sXG7gHXtvkpElBruhn3wIyn0HYdVJI/HpiUPS4G/v3weWSGhUna
	KQ6bb9dY1aXBOf7QxVQZd88Vb+9mOPMH/pA0pf+cO+PXB4NAMwAMYxJOVT5VQjb/rMdk+dUfRAYxf
	6CP6dV3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUySk-0000000G5Az-3ZmF;
	Thu, 04 Jun 2026 03:09:42 +0000
Received: from mail-eastus2azon11011063.outbound.protection.outlook.com ([52.101.57.63] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUySh-0000000G5AZ-2uJl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 03:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds0JfNtUbI6SH0G03voW4/m38dqTnL3rSVBBKxNb2ThMxBp86U9//JNiFeadx/WlmvlMd55+5lWh3h/I5z8jKbey4xGGO8yW87durbcz8/Gk6sJ0QrPA2lvyFjZCjtJoNxWmw2k0QEV8VEwRorTEtbShegZjgLkE6mayNMo0BCCO24I0K398qQUIyjonMhPG9deIreHQnXFKxQ47VLvZGybYZNIllRnGoYI2PhBYEvOJ7yJ9qbkff7S66JUJTq+tgvOveWEsxslJYYNu7O8WkOX4QTfS8WiwL8ZmbiqC2+NQHqWOuZpO8KeUz/1rfg/xx0qYWxhs3pt4G/Bp9pJrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKq5fJ3cqFIQw5+w/Q9G5m02Gv7YUg6FInwPoQseAA0=;
 b=ldrUSyofjXoMQ4PYFtaRA1KWc3elT7BMK3aUv8TElIklzNmK4KVDU/OHhhC3lrnkr7I6jigvGdChAWPRxLbmraORjpYlz4y/pLIhNVozENCWFUUqKq9SI2RLr0vX1H55LZjysjR9X62zCdr84gVEUTDeYcpMQu35LWsIl391quvctWGSlYtGg7wbubdSuLoSW5lr4JvWJWs6v/eo1GLnEr0JYDbaNtgEK85p2mA2BlWLipJbq4oo9zR6+Xf3scEsC5gk095hxFOmujbd3RNemfZQHxLwhfgT488JoeFOqPt6EiM7ikV2E1zFiZnQhfNYQlav0pZwaD66r+I7W9Ku+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKq5fJ3cqFIQw5+w/Q9G5m02Gv7YUg6FInwPoQseAA0=;
 b=iMUhnMFPSedMVRbLbpezppZbUpV6Lltg9rSj+CD5kn//8BojlPLaa//hpDZ37C/k9N5o/DrOW4yCUlktT97Tw1F7yWNfQx0arfoutRF4PJP8Xslr5/8rk5fkuMSJarqrRdea3QonNqPMCpHZNTLdgmLhxQHWeC1zQuYJzLZ280Y=
Received: from SJ0PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:33b::16)
 by SA1PR10MB997964.namprd10.prod.outlook.com (2603:10b6:806:4f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 03:09:36 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::25) by SJ0PR05CA0011.outlook.office365.com
 (2603:10b6:a03:33b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 03:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 03:09:34 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 22:09:07 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 22:09:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 22:09:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654397tD3058897;
	Wed, 3 Jun 2026 22:09:07 -0500
Date: Wed, 3 Jun 2026 22:09:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL] clk: ti: sci: TI updates for v7.2
Message-ID: <20260604030907.dhppbxwyfnnoeitz@dumpling>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s7gnb7csoaf35iyp"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SA1PR10MB997964:EE_
X-MS-Office365-Filtering-Correlation-Id: ad40475b-494b-4eda-9540-08dec1e6b433
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 2/CcN12UUvh9gBwQDH78BsmKyd6e6WDoWjJgS8IMAkBM75+jfRdcM4dC+r+qHZ1FVqEyjtUO1UIhsYOTHU0J2BWAgLXi3MdYW2J+Rd0gMXGyJsoZYLMIK0yaT7DcnfnFmIs8DGBP1akio1e38M9coDPYTLfuHljeLIh6TYfz5EruMFCAh6yVFqQ7Wlz4U00Al95KMow5W4ZNyroUQ73nashRdU194BDCtzSUhWszFYvY00gmCRQ1gUOXsEakDqdbEbxXMXsciBT+MHpY/MHlpwdzUfBR3soNUijppKfP8RdWT5dlW5XoXRPN5UFibAWDoqssAgq/YzB4S9E2gA22UNVMCnkGDS8FlABTOQGVVDnY+HShJbe5uvPtedJd3064YGKuDaKjSZVIpGVf6FwMzD3dT9CA0J9qxtHcu+L3Uf1FgDrx0UVK0i6I/79VAQlOEOqfMh7RiKFmnLxyKQDLf/TXoPPHKWHmKvkb2zxiFrZfTirnS0KU3lNABuHBhOqCHiWEFmewjg2CRtgDthLMU5tjkF2meia6hoBrQBaKkiecyhwJbdIaH/9tvkAtFWpBbvu0vxPyCzmAEAwZneGlnwzIT48/bj/AjwGpRM0OxTn+1BMnObgL9+kBS6MuLbcyoo1USBD28/dZfvHhrryNoIGSUSlo3jVUQ5qcWbi32tZC17jzflg8r6Ya/6flnoiuyWFdQDm+QhXt9B5UrGIoYTgWH4PsFGrbMt4MPNINDV8=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DPg9peh/1tLK0Y4ozK+fMrkBmXgIR85QwC05Bz8gifnchOYKzOhQGYkkgdx3T7QDBU3WH/18Ev4y+tBlgrSOHi2yuilBOsoPID4bnEHJLnmI6TwNlit69cyrVE+36EnavHI6aBl7lRZsLey6j7+jAoqQC4ONTnTgaZag8gaDBuKU+60gsRt2SiSglGCJgZbldU1Gu38NrD91ZJvab2FBWXA1e146EpV/jAkY0oDaJjfQnzwAg9ePGfDFD3h6ddRctgZp6ET8oImBeMcTUgvbvy0aq19RUiKTtTM+kafU5vqF7YpRymZIns1l5zlJlhM0+ACxijkTtRLA4ICzv5DgIfrWJDptsrT8bhMJxMAdBIgiG/FdfIcPbEjJN0c0jE8eEiVtVsVFHnSY8MTw+jtYepggKgHFYxZxEe9xA+VM1uKtGMpehEQQRJbz/Pkjann4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 03:09:34.1840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad40475b-494b-4eda-9540-08dec1e6b433
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_200939_740699_740092B3 
X-CRM114-Status: GOOD (  12.64  )
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

--s7gnb7csoaf35iyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

We have a couple of minor patches lying around for some time that
was'nt getting in, so took advice Brian made.. Here is the PR.
I have cross checked this on top of next-20260602, applies clean,
passes the build static checks and functions on all the TI K3
platforms I have access to. Thanks in advance for pulling..

Please Pull:

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-s=
ci-clk-for-v7.2

for you to fetch changes up to 2b0123e4a9257fa2933d13d1bca9ac36467efac1:

  clk: keystone: sci-clk: fix application of sizeof to pointer (2026-06-03 =
21:46:01 -0500)

----------------------------------------------------------------
TI K3 SCI clock updates for v7.2

- Fix incorrect application of sizeof to a pointer type in sci-clk driver
- Disable clock rate caching in the keystone clock driver to ensure
  accurate rate reporting

----------------------------------------------------------------
Jing Yangyang (1):
      clk: keystone: sci-clk: fix application of sizeof to pointer

Michael Walle (1):
      clk: keystone: don't cache clock rate

 drivers/clk/keystone/sci-clk.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--s7gnb7csoaf35iyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmog7EwACgkQ3bWEnRc2
JJ2hBw//Qf7WYdQ4QSqgAAu0V2l9n169xsrMcrGk2jfqJtvNwueVsGOyB/xH/Ad8
vPtFplF92RrUydbqJUx6wde+gpyn80iOC5cnO7mjuZc97Zb+6WG/T1GbCo9/rlue
iEOi5KTAdtwe9Lmr6dXsb9jm9e30ayT6Rk+LI7ZV5jycVrmvUqOKGieR59Nvxd4T
EB9KxkNlC46LZXKoS73IF2cUIpWYI0gz1fTCB29blZvIRghLYG5qZNboCX5l+Xkz
bp/uacH0aanymqN4pGbGwRC0DVSZgCMUZ17y84EeyMRQcD0w0L/w4MWp0sL4kj/e
TdCVLl2Vu/LnrQoudUiNwABZ7n63zdqthQLKfD1RAhPMGJ1sgrw6Aibn2cFoEC9C
G242LXePwrZK4po1Avu9sXNHMTxlvxJoY3A46sEatxxON8V8zPU3UELUWPaDEDiq
clmjzIXOclLz+reBqyPdAILIunxPdH4DO9WWK3wKnLnaeODWWiABWZtuX8ywwosb
q9bQmeu3tjmZFhrzt2D8IaCbSnvfLwpp0H7RRvJMvLkwoi9kTVmFgREXBlJffgdF
5x4ey6iRpPeu/edRpkuhbqCNriN/zQ+Ib4XD4XDom/oZKyP3ASozsicprFj5lw9j
CWCxHjzIiC/vWC8tENwpeAftGG/pZD8FBp4taqKHr1S01mlk+bw=
=WPvT
-----END PGP SIGNATURE-----

--s7gnb7csoaf35iyp--

