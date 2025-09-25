Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3691ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bzz2pumGmBcyNpxo1Y0oH17RGom+gBqHpqoSbnJ+NGU=; b=VWhrJJNImWft5I
	dh6j+BNXlHnvpiICqn1i6BZGb5XeSNnK0gh+eIZp2Psq/iep10Jx1BGmDDr4/1d95FM8P0eB3bYO1
	wWpqnzEpYjY5DHpy3HFh0H9duL0p04O8S/jEgQHe8GsaKFjrUXTi1KJJJ+WqCxDAUHzrHykIMJKpM
	Jf9Z+QBbma2MY/Zw5QYQNibacpIoGlimczRIGO+vsjDiHJWLhxWuywMvnM2E2mtvP0BKowP78z2lW
	j34d+RNBGKHVXkfN0hYD2X9i4OG8EnfqXwXwaW/c1+xbw5ZH74C3XwrVFshVshLXxoENxGv1l5iK7
	1wNjr4tjAsxv+L4Iutlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kH5-00000008ZxR-0pPu;
	Thu, 25 Sep 2025 11:36:35 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kH2-00000008Zve-1IgW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 11:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq0AHZi6+D0awpGSHdkFTXNhSLmPZSbcce820XDRci14A0flUpHdIxv5mPlIy/E/KiXJYb7bgbSS0yNtt/7FDblc9X253DhJjd29AHWr5DDpQRgNbR45/yZJezO61tz87xLI120eMkGgOQbvTOghJhAXAuTllWE0qcL5empwLNq4xSxvflUu17Hv3NW0YjNo5Pv5d+erSEzcJgr0t6A8jxd1mOi2TeRqML2cWbStCROO801bxGbfiyhogbwqIs5igruhM8Qw5QLEcO3UQ0rY6LcYmEcIB3fr9mkcmvMASKh2ReLwMPSynLWYbPqV3BUy22nT/Q1Rarawq5TLceSJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bzz2pumGmBcyNpxo1Y0oH17RGom+gBqHpqoSbnJ+NGU=;
 b=bs5GW4KPKwCDecYAtRMbO1au4ZyGzdqz6XitB0asUvT7ZnMUOxylqjiI7L4MsVGtAebnFWng4YVrxDsOtoNS11ads/DVNXZxMcQ8aXS1NlYf4VciYVeOGrKysXU4+lEchi78ULUvJ2vp3EpLJb/8eJX6mL8fnXLUoZVQyKyxT9vHbpvOfUOAqgwNt6RxGxAZCbU63CxXRPIa8G94QDFZP2zo5BynlwFvsNddOg1Vh6e0XDyYo5jsoQ0Jz3ksoFUjHlu6oB3bldYAUd6keYHe6kNg3sxlkqp4EJwYUyG2rQup43GR9abb5cz2D+wVAPIgp3iQpJUR5bpOkNO2vPlk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bzz2pumGmBcyNpxo1Y0oH17RGom+gBqHpqoSbnJ+NGU=;
 b=RTzgVuPK7DQsB9at4OAS6Y8bIaEMj9H7eYh0aOqCOIo2YSsoE3swc28qbWkc8I8PhIuOo6Mye7MvepGtubUqylWrPIrvtWo9BKzIRVLAq6aLN5ILtNZOEGyUBL6p/C3hX0aX3VH3qlpMzmUBzgiLOCVtVDvtkYCuEA2RVDBZSGwJ7pvXb5ea6Hz2TNSKQ6DQcpzgokEK60jkgIegPkGuaYCI3gaae5eAANTQaU15N4B+WSFYWwjF1H4Cl4SMO72CVvQYtyILn6MY8EtilfbMzdheqDVX+P/J7hm8yWGrqmAPmRrLniehapHu+o7YtKn8Yh+oSD+r2D6HJn2Wr7vFAA==
Received: from AS4P191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::16)
 by GV4P195MB3024.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:2b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 11:36:21 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::88) by AS4P191CA0037.outlook.office365.com
 (2603:10a6:20b:657::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 11:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 11:36:20 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 13:36:19 +0200
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH RFC 0/2] drm/bridge: re order of bridge chain causes
 flickering display
Date: Thu, 25 Sep 2025 13:35:54 +0200
Message-ID: <20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABop1WgC/x3NQQ6CMBBA0auQWTvJUK0UtyQewK0xTSmjjEmxa
 QlgCHeXuHyb/1fInIQzXIoVEk+S5TPsKA8F+N4NL0bpdoMipalWGmeJ+MbEIfCIsf+O7LFjbHO
 UsJiAR0Oljdyim7AkO8vYW+cV1UjauJbNqar8GfZ+TPyU5f++w+3awGPbfooO21OQAAAA
X-Change-ID: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-058abe8477c6
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
	<jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar
	<devarsht@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|GV4P195MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f216ea5-0cba-459a-e220-08ddfc27bfc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|30052699003|82310400026|36860700013|7416014|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9VL01BNmpjWEVWSWNDT2cyclJTbitmWHpvV2tzNnQ1RktTK2gvU1JJeUVP?=
 =?utf-8?B?YVpCcnpiMEI3K2FwVjV6d09aNGpDODlTMCtiWGs0SjVXdEUvVTN3aDVxZmJX?=
 =?utf-8?B?OVNNTXdDOThHVG5zQmVwZ2tZY3V2SHVxV3cwSkNXMk05ZTZWK2I1ZXQ0d1Vx?=
 =?utf-8?B?SHR2WEo3aDRIZ1F4SWkxWFhqWkdNT0RkUmVPUUovMHdSbWkvcGpuYytlTHll?=
 =?utf-8?B?dTVBNlQ5RWF4WThhTGRoN2dMcVphUEVYK0ZJK1NpdDBVOVhEN3NTOGxVaGV2?=
 =?utf-8?B?WFZ6cVVLcjdRNzlDYTRuZjhYejRCN1Jnb0k3S3N1RzNSOVVmSjBGRVRKV2Uy?=
 =?utf-8?B?VUZyRlcreDJiSXpRckljRm4vU0FORkxPWndDRnB2b1FBQ21jM21sS3FOWjFS?=
 =?utf-8?B?Y2lJbXdsb2hYU2pDMHJCK21ZN3ZRSS91ZXpncTFSSm45NldhYzZzVWx0T1NB?=
 =?utf-8?B?U1E5SFB4cnhIWC9xVTBvN2pod2RjRnFBQ1JGNEV1N2Nlc05HMlUrQlB0SjQx?=
 =?utf-8?B?VHU5NGdSeHZycXBRYTFSZDVVbml1V1krS3oxOEVGRkVPcTNHcjdqcFp0K0gy?=
 =?utf-8?B?SGJsVDg2UzVubVJCaEwrWEFIWm5NS3ZXcFVwNloySmJRdWtzcS9xSXpYaTM2?=
 =?utf-8?B?Ulg4QWFhUTNXbTJnckVTQko0YnYrVS9vaSsxSW56clNSeXNRbXp3Z3p6aE84?=
 =?utf-8?B?NGROdnhFZlZ4dlFsVzdwejFXa1NLSnFqU3R1MlFCa3crSFJSR2liTW9rbE11?=
 =?utf-8?B?M1JRemZ5RkVIczdSRUZmcTFUNjlQY2J1dmJLZnBXRkRNWWc1Z29OSGhScEp0?=
 =?utf-8?B?OWRwWkxra0pMbEdXT1pLODAyamwwMHdoWnFvYnFWWTJHVEZ6NXZFeXJWN0p5?=
 =?utf-8?B?VVJDcGl6aGUxT1BLekhBRGJRL3VJQ21tYUxCTnF5NUhoUGtNTlNnZGdPQTZv?=
 =?utf-8?B?QXNLMTVZU3U3cWpxY1JCeERVMjZFcGtRakZZMXBKYm55cWlvMCtyZSttd2Rt?=
 =?utf-8?B?Q0RVbzJaQ1FYK1JVdkI0WXdUMGtSSmJ1TlFRdXhzelAxYUtxck9FMENFSnY2?=
 =?utf-8?B?bjREQlRPWExPZE5GcmkwQW9zUlAydFNuc1BUdXI2WmE5Zk9YN3huOThtdTd4?=
 =?utf-8?B?RFp0VVdMYWMzZEQyR1M4K1FROEtiUUpvNTZvQnVIM2x4RzFsc0JHTkJKSFE1?=
 =?utf-8?B?VGY3K0RzNWNGWUZhRkpCYmIxQXRUTVRiTy9mYVRLZEc1RldHOHNqR0FHa3Z4?=
 =?utf-8?B?N2FoRXFsd0xtTHAyUlpuY2RtV2ZENnpYOW5yZTA0d0xWSm9Ba2l3UGdwbVdn?=
 =?utf-8?B?N2RVYmZ1Z0xjZVlPaEgzQnVvV2ZVNWhkQ1ZQSCtYZ3psNXJFN3d5Qy9neldx?=
 =?utf-8?B?ektxemE1RHNrTkF6eWxOL0RjeDFjUG9NaXRaT1ZPOGI3b3VmekZDdmZFTWll?=
 =?utf-8?B?VWx6SWpaK0cxNFR1S1U3UlBvNlFZMTVoenlXaVJDeFg0a2tobjBCOHhDWGJq?=
 =?utf-8?B?YWZubThNYWNVdDBKeE9WbTVJa29RYVU4c3RnenZGQzFxc0JZUzByNlRZOVBS?=
 =?utf-8?B?cTdsQUJnckxCS1pHMWprWXdUdm5NYWRQTUpvUUVmZWp0aDcrMTFjVVZ0VWFa?=
 =?utf-8?B?QUd4WWY0OUk5N0JRMjRQajNnT0ZtUUg2VjhGVnVKb2lScHg4aVlqMXV0YlJM?=
 =?utf-8?B?OGkraEZ2TURwN01xc3BaQVQ4RG16V1lGa1Nmdm9QRFltbzFvWlpPNVEwc3c1?=
 =?utf-8?B?TjhFRHRnRy9hTGU3M3pCYkJjNnRlY1hlWFIrb3FpbE5BWXl5dG52eFM5eHhi?=
 =?utf-8?B?WUt6Z1lUNllHcTN1UG9KTVFSUUh4b1h2c1JZT0FodVdrcHc2Rmt4elFQZ2xQ?=
 =?utf-8?B?dHRzdGQxbE1hZzBYdDhOaUd4aCtweDJjaVZXMk1oTk80WHBmQ3NrcnRsRTAw?=
 =?utf-8?B?eHUrSkRvand3OCtib0hydzlxd2pXUnlDcDhSbUFBcldWZzJ6SWhBRlMwQ1Mr?=
 =?utf-8?Q?OMTGZgjYlyfPETy+Stuwxrq6OdhGSE=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(82310400026)(36860700013)(7416014)(376014)(13003099007)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:36:20.7486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f216ea5-0cba-459a-e220-08ddfc27bfc6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P195MB3024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_043632_538200_EDFE7BEA 
X-CRM114-Status: UNSURE (   8.91  )
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

commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable") caused our display [1] to flicker constantly.

Our setup is
i.MX8MM mxsfb -> samsung_dsim ->
 sn65dsi83 (MIPI to LVDS) -> ETML1010G3DRA (display)

Reverting the commit [2] let the display work again.
Only difference in clk_summary is the change of
dsi_phy_ref from 72400000 (flickering) to 18100000 (working)

The same behavior can be seen with a ph128800t006-zhc01 display
and dsi_phy_ref from 66500000 (flickering) to 16625000 (working)

The root cause seems to be that mxsfb_crtc_atomic_enable is called after
samsung_dsim_atomic_pre_enable. This changes the parent clock after
the PLL is already configured.

According to the commit [2] pre_enable hooks should not rely on clocks.
Both drivers used in our setup work with clocks in pre_enable.

Moving the clock setup from pre_enable to enable fix the issue for
our setup.

Please note that I am not deeply familiar with the DRM subsystem internals,
and there might be side effects of this change that I haven't considered.

[1] arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
[2] https://lore.kernel.org/all/20250605171524.27222-4-aradhya.bhatia@linux.dev/

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Jan Remmet (2):
      drm/bridge: ti-sn65dsi83: move clk setup to enable
      drm/bridge: samsung-dsim: move clk setup to enable

 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)
---
base-commit: bf40f4b87761e2ec16efc8e49b9ca0d81f4115d8
change-id: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-058abe8477c6

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>


