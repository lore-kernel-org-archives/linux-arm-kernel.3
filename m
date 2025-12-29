Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F830E92724
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=; b=hGrHTh9lEerKaLJznbq45VBR3Z
	cFfPygD3wUBm6GYhFnM323C0M9lXer+7MpsMiu+Uhm+xJxWMqRhJxfI9ukff888Bou54j+o+GieXZ
	qf6deFS/lx2WyBMKQ/omZIHsObPVBdo/oWPikk7SJXTgAtgpmsopWYqNhmSjCcPzevnGUc+k+dLNo
	QjO3faHig80+pcoxoRLMShBQ2Tz8VOw6tWGhvrFg9jJEF5yDQwAmlmJxKzMySRzkw+v2/wm2mzYcp
	cjjQpQupExgl9l4feY+QndDi4A2eOAdTNUxeNEf97dZEiZfGoi5NCct8s9kaVVamOydTuUXtdrVFL
	6Z1FIhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEZb-00000003ne4-0h9a;
	Mon, 29 Dec 2025 14:50:15 +0000
Received: from mail-southcentralusazon11011004.outbound.protection.outlook.com ([40.93.194.4] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEZZ-00000003nd7-193J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 14:50:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkO9kRlN2Srj7cfl0TP3RNG5TSuGWtAbFbwqgDPMoELoqCXhykFN+ffXXDz4zqQJ2edx+CL7filHiVr6vxTgtWzUvf0q9DV/sN+u2I8D3Rv5j3GwVdqJ7gsHbF58nHXVRCPnajEsQmHhd5HOG2632YdptuHt5esqe2Iec4SUj7kaCKzU1THaJ6RfSERqWfOWnHDEgVFC7nEWhzBjcYImPyz1qAzTnt54ufKmEEIz27FkB5r3v85LipRaShNR0jlSheG0nUC6Fd39MeuKucU8eRQLiH2indGPtqhGV1vTB0dvc3V7KT/WMEeK2cGv7VlLTfmhAYQ5Jp7UxDw/6ZPBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=;
 b=O1nyGmXLrLZ2zoUaW9MStwzqixASRqqjKZ7rZKkbSZeyCsz9d9bbngc9WcWIBGvnAz0++BaAkVo1nBEDKHYEpeu6k5sV+MjIgel+2yyu/pwxyVEdX8Yx7uMvU1X4fifRzSiZTGK9a2E9l3TniMt5B2P2HpEzNYUBS8rvUrVCAl0LI4H1Qx67xuOkodgVFV/92B0KiSLC/XhUqESNipgi1dHkcb+HXKQy/+P+9fVyE/F1e7Wwsi9wuWxKbok+mSLJ/YcAWPS6w0lkGnXzOtssqezyuUdLt+onKWhPDpJU6OA97TpKli4vaPXM73jyFAZbaxhOOUz05Dl7r1u3Sgg6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=;
 b=WfZytKG6vqYhfXxQ2wQy3VlL9oiuIXe56wkmDXoeRUFcpqeEtzkkuXz/7Q891mZ+6dyEKj5+ZErRzMiBwkXyjqhjrjjtoKKvvxLkZs6zCmo3YR3ODfjqG8C0Os02GFYWPrqqC4ZxFIKwFZp3E9SVD0BtPhPRcwlkXbJ9uIARmLtQ/0R7VFaMed8FeM5nOySj6MfreKoC8Drqe1Skt8Em9WLtVVKXNRQ/yeXdvvqRz9qEvDIp4EIfDSqy6S40EsV2sGRIa9o6kjZ/O/7fbBC0E8vevxLj9DAhuji/vK9v6pOa2RLBYCmdkOjWtUJKL7gy6OJmrvOyAmAoosOcj0eC3g==
Received: from SN7PR04CA0169.namprd04.prod.outlook.com (2603:10b6:806:125::24)
 by SA1PR22MB6045.namprd22.prod.outlook.com (2603:10b6:806:467::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::70) by SN7PR04CA0169.outlook.office365.com
 (2603:10b6:806:125::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:06 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id EA815F2E5C;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in low power mode
Date: Mon, 29 Dec 2025 16:50:00 +0200
Message-Id: <20251229145000.421426-3-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251229145000.421426-1-nandor.han@gehealthcare.com>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SA1PR22MB6045:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c5a23363-c21b-403d-e5d6-08de46e98ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?24c+IJAE/34bVdFbpdGcDk1C2I1wvOE8LOwXfKwn4929st8lusjh20prf7cB?=
 =?us-ascii?Q?tWTanGnXs15MG+RGpcwFSK4LgapRNrHMFJ0Huk9ML2387yjuc+yMvNHqiKPE?=
 =?us-ascii?Q?xLJ5PD26K4idGhxH507QTxhuw4X5a2AmdULaxzv2y4NyjxXti2m+709sIO99?=
 =?us-ascii?Q?EZozx6YnOOO3dD2umEGGeGFgeFrIoVqdUBBj0tzZmjyAOf9Pha1D3BCnKlRG?=
 =?us-ascii?Q?csCi1wnTRSAEwGyo0EjbrW6Iu806J+uta+lkb+exALCWX8ZvsicxuLlLud56?=
 =?us-ascii?Q?YQyf/DFsTqjfKJQP/hpdULT/yJL42REG8M0AksULsP2NQCJIVEpUwpoK2/eq?=
 =?us-ascii?Q?+AOZgb10/fLzTBO72mCPxJWiXjq7tqia5muCLs1exqmDZ16KxV84oLGGxMwI?=
 =?us-ascii?Q?QJm7pqOHDseoLOG8HUAV2uk1aB8qiZvHkP3VGC37lBzE8tvN+k6yiaBmjwl8?=
 =?us-ascii?Q?kQmlLzXxP+my6U2moXOhwYXtXOalmvEEa1WLOv66FowQ41AI/+6CFx5F4Oo1?=
 =?us-ascii?Q?mg3mnOvff39q18D7Yotl86GW7wLmIaVpCrXL2Kh872E73Gl3Eyb90/7kVntw?=
 =?us-ascii?Q?5OViGqO4hKonzyODbzdRDRVQiTn6mrQ4/MrEy7Sb3J6ChrurQVFeLQrw1nRw?=
 =?us-ascii?Q?jSlWgYmLvSNKFAGDyuFcNGD/PMLVG8l3jxh+fRVcLFhZjRTEKUVrgOEdOnQt?=
 =?us-ascii?Q?Y0UVGBDao9p0bgVE2Ir+cIz8U4g8/n2JgXIy07nWOoBnExoS9P4EojLEPfDj?=
 =?us-ascii?Q?qhWYPJM+Sj4lSBquDSRRC/l5gOnDoa1D/o9tjkbakvhW4KxuzsD01IOJwSG4?=
 =?us-ascii?Q?zgt3ZVfmkX7uAmsxNjRESUsgxhuykQlxkUZfQW5HQ9s4hGEjN3lI5UhPMHJM?=
 =?us-ascii?Q?Z9lPM17I58NzwiRLvCIaQ/RU5i4agk6yCr9UCVY0wwrDsixMQLN/v6roCqtz?=
 =?us-ascii?Q?mJtV1gTu/wIdLudKeCD9ASLYAA6+goo+MKbkBX2Wavdtuh9m3FPkVxWnkMPU?=
 =?us-ascii?Q?W9aTZxGDsPfksrvKraJ1jTaQ7q/lkaBVxllPqXkxuiD/rIA7eG3jREdSH0Lf?=
 =?us-ascii?Q?Ey6OhjIDUT2+he1lOdo0h3mfLPRDPlTkaJjyw7OmD62A0Q2TZ1YpFsRV0apt?=
 =?us-ascii?Q?60VutDBmpOlS9Z7skvASUJR/N6Rhi5qI61Kx0Rrprha9htOl8TXccwvRVEtR?=
 =?us-ascii?Q?ra/32tXcg3D3V3Pbi3iyJRAxQ3nLWtUsX1ZKLCVphOW0aq12ZLj3X7jqQjK3?=
 =?us-ascii?Q?jqS4dky88FAaRxsaZpl91D3sRDRJjqgstJIx0L+UjC4jf6thAgB93hyqsxyA?=
 =?us-ascii?Q?yfThQ4kpR/aT1ruvbmTiJVkVAGrxpMcw0bKNPTgFbZ+ogAPUKZuyB0A4gloh?=
 =?us-ascii?Q?8Gw81YL854Y5mvhK0rh35Pr7hdXSD0mgL2gpyCJmwVci4aMuPrN9C+nln3ib?=
 =?us-ascii?Q?xvRCbpx/35w2i1QD91CJU0kcpOV4x0ctCt0FTUx5dMeWrCP0cu6eESTYegKT?=
 =?us-ascii?Q?GWocCau/nQYdnRlxlcVWscmQ58xvu4O6h3n8ePK5ehecNjN7dwzqrqtymOy0?=
 =?us-ascii?Q?uym6LGrlqQDjSaqHQO8=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:06.5591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a23363-c21b-403d-e5d6-08de46e98ea2
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB6045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_065013_313567_A6A9F2EE 
X-CRM114-Status: UNSURE (   9.54  )
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

Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
running in low power modes (STOP and DOZE). By default, the watchdog is
suspended in these modes. This property provides the option to keep the
watchdog active during low power states when needed.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 34951783a633..4dd9cc81c926 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -64,6 +64,12 @@ properties:
       If present, the watchdog device is suspended in WAIT mode
       (Suspend-to-Idle). Only supported on certain devices.
 
+  fsl,wdt-continue-in-low-power:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device continues to run in low power modes
+      (STOP and DOZE). By default, the watchdog is suspended in these modes.
+
 required:
   - compatible
   - interrupts
-- 
2.39.5


