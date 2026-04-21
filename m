Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9DBF8925B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlE+GhkrE0du4Uo3pZi+Gpgu8ntQtX3uvbC71vZU4lg=; b=H9gMb0PlePTAOqRdXVTHYjoTF2
	fK3Sbz9wExknCRRzJtjpeA3zvWFP5dLxyxQtxPcua5DSTgzkCckIm2XELsJOeN2QaGk1tQjJJOllh
	XJVq2GviSHk3ekmQiyzLQzGCKklBjlJYE3GHjc/RUruyYwfghrmiWel4MgytCnwm8HpBtqwlXn25L
	N8QeR1I2PBSz+zey5TMInY2DrN2r7ecrok0j3L9ZtGaWuzfda1Du14QqrbkWrC8b08iHfUKrwkG4h
	eQ5kEo7uOeeI7wM9yFE0YeB/PVe7IvrNXn4vLBO4KVnZPzJuVUsCe5O4M7iVITC7A7UZhkNC5MncC
	Bx6/9xWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8ae-00000008SQa-3fwD;
	Tue, 21 Apr 2026 10:44:24 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8ab-00000008SPd-3ngX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpbv2pEfaXS9fupq8569kV/f+UE8abdIlETCv6kePaU83W+0/RZzKL7f6Mds/SMyCSDG9qZZnpYV8FEoxMlpTVbeamk3acnSljztrmZx1cN68OfHHLWuGqlZ849q/0e60X69w+lBtzYxUDJKIb6JYoKSO7EQtbclrMO7gBi6tWzQtnVg9E3ZygJeP7mWs9W7lObvBMfbAX52FOajhiVA3JOQwdD8KGbgST0l0VzR9qoJQkG07BBkQJej6RTWymNkWNhYi8Nh9ZAE2JNJRpKU2Zxk+tAyO7w2qFsYajthWedsGE+5rVSaIVzAFrXeGRTQyLBrU8gKolQMJvFW+h1Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlE+GhkrE0du4Uo3pZi+Gpgu8ntQtX3uvbC71vZU4lg=;
 b=fpgekkmNrPVjBCHckrDGFpJjYSo5WDN5Zzdt2jujH6cJcjOIGyTCM/mf4DrWWM0ilHjE/2DF+Pqd9HRNFbgiJXGMOCXllr3ERDLwbykMKVThddVTMk81FLpV11r1LYUf5N0t5DjUu9TowIucEVlVDGdN3jlfkme55NHU01uIOhNeAql4YBi6MrMF47DAtIWRYvMjYTMZoqkc4aeAjkmCetMimJ29td31PystJXxIaeHP/u15ZPD4+cguX5J8wnQ4Kbzhy2uf+CHjWzsJtLeVUmWc5JqRKgqAVoQdQmJLBNrgrN1RSeWhUkELIMM+hi+NI2nnl+nQajBBQ8vulntA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlE+GhkrE0du4Uo3pZi+Gpgu8ntQtX3uvbC71vZU4lg=;
 b=qA2tS7pt0mGqzsrDKenmNuBW02QzRTvs2R3ycC/WklNUEsFwTzVZgTWVm3riO7u0HgcAiTKm2Bgb3qOKdQDUMPt3f0dPM3xehAPgSs10V/iZkisrdNEvtUhnMiHXb/sI4dEhY2KmdDofFwnAybN0epXKIxtHdvI1XeSYJfdJi7U=
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Tue, 21 Apr
 2026 10:44:15 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::5e) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:44:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:44:06 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
Date: Tue, 21 Apr 2026 16:13:57 +0530
Message-ID: <20260421104358.2496125-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e673f5b-ba3c-411e-013e-08de9f92ee71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EWM4Yf5MxJS9qBkQCxAsKwNyngibrrZCtglwO1CCGvXMcL51UHVKt0RzXNUTUeCoALXCNUI61JBpxCYMuuMX67unTUTQd8hrZS0DUDa/1cQADBg9yhiZzraBeuiWgSsyz8E3x94bGFqxYdkQ4gr9xW5vXVEGPg7rzoRwsY/oo3eCrSUwhlZxMPj9NSsHUFMtCO0/pqoPOpLwYbsOyxb3eRFALjsNYeQjQSwuyTOBuOhw0XG9fJswebRy6R6dx7xrsFOiNJZLcs/WZCQ09YF0/vseGexqNOiTGpkCsYTjn/6kz6vrmmmrECw7gu50TWj5v58rqAcom+LmCfNIGXz1Ffov0PY0zjaxJyB5BqoG/tf9yUg5D5aEtidZjmwwMpxz4BqfxmTaCQRO67nMHKfdRdalHJGzA6BwCIpvEYDUbRGNqGHrNkazWMOEFWLlCPz+wD3dDBMtH52hs5Q1XlnRw6cIoPCgqxJ9Ts9JzVlmIODJ0paktTTrTTkjEDBddZQ9XCVFPOpcYdF85hk+quzPThw7rI44FRMPBufgGgj4EFBgbpwbGzdoSouaHcXyQlIkCDu2jP8kLQooGiIiAKnycbRoGPJM19PqIRJufvKh7j7IdNI8sJX+Q+GfyMjUudkr8sX7rpKm8HXZkuE9BZpytvAIWSj3OIUpSYrsYU2JbyjEmNAk3r3FO1Toh6TSdMY923mwLklPNgok7UZeUv/KMtwGHRgSS68oGsUlJFXDnQYySv5YphKaisHRk/Vi/0/V6EoXvHnTSbG3D9jz0z1Tmw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZPuWb9E/dOo0j8C7yRiVKx7UkxKjyZXWmV0ERvfGIKEuTRFHRI3OhgnSiYc/POHPBOxG3K6AsqEes8S1o2KTPZadbVUrcHZoCjYFRS3sueHEjNV/MO1wb52tuzyLmVAt3nC4UW2QactwXT3BKXNrrAuykwIy9CRGfoIS7MMhAmKqU8qcxI9UdNBHSsk07oKhhLXaS/wAe0xEsblHb1b6wPL2mO7rXvqEV+jFwIvjzlSghSkkQzKX5N8BocEl17j9zGjjd/MVV5ojAZKEoeKN5pn6SRIoquFwpKtHESHvb9+Y2NoMhCGvzHcq+VF8UTpjV49zRZAb8CoNRsGZOn/1FWRqpWi7br5Fm2bjMGoiIZ6dDqnBGAc62MjO1PCuVOBxiVwboTnc8BBk1SIsRKV7Tjy7u+VsZYo+h5cVuvuwDMQLbLTedb0jzZ+ONooeGDVt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:44:14.6946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e673f5b-ba3c-411e-013e-08de9f92ee71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_034421_968138_3556E9CF 
X-CRM114-Status: GOOD (  14.16  )
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

EIO (Extended IO) GPIO is a Xilinx IP block that exposes
multiplexed I/O pins through an EIO interface.

The EIO GPIO block has 2 banks with 26 GPIOs each (52 total).
The GPIO width cannot be determined from the hardware registers,
the driver relies on the compatible string to select the correct
bank/pin configuration. A new compatible is therefore required.

The block is currently present on xa2ve3288 silicon.
The compatible string uses version 1.0 matching the IP core version.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
- Update the commit message

Changes in v2:
- Add description of EIO block

 .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 30a7f836c341..1ca067217509 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,eio-gpio-1.0
       - xlnx,pmc-gpio-1.0
       - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
@@ -30,7 +31,7 @@ properties:
 
   gpio-line-names:
     description: strings describing the names of each gpio line
-    minItems: 58
+    minItems: 52
     maxItems: 174
 
   interrupt-controller: true
@@ -89,6 +90,17 @@ allOf:
           minItems: 116
           maxItems: 116
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - xlnx,eio-gpio-1.0
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 52
+          maxItems: 52
+
 required:
   - compatible
   - reg
-- 
2.34.1


