Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CCC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=; b=KGsNGEPRsnmHShRb59++NlbSiL
	SljkwxndcUA9rNLSSP9RGhvuPpAca+sDncsX1CNHianip3mgadb94w9b7f+btDV7MShaxwQ5vRYUk
	SRKepUEtlTr+jSMR5pN9v0mwV9CEvTSdFPYYL3BM1ZrrC33B6GHrtGT4anPvNzbF1KZj+qb6ZMSTB
	qX8vAaAqQTLRAD4oBdiG3Vvdb/YfD8nY2WeouyCwqyTv3vP/IV5J0yRMWII29xrfcjq7YAu3BX6fs
	45kZFJEuwiV3v/rB1Wnzcu8t38/MNlgBEaG307TI2+YC3ZXyXKSW2Copr5MdRxyxDRC9vAHkT9Pxq
	PfF3GxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kb1-0000000EkAe-3Dlj;
	Wed, 02 Sep 2026 13:01:43 +0000
Received: from mail-westus3azon11012042.outbound.protection.outlook.com ([40.107.209.42] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kay-0000000Ek8a-39dw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:01:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaujxe9++KxTlL+7OH6zxUykksxIAIFu+0Ny8vI4i1ANSP7H4WsSeEq+RTbjQTAc4xqR2YC/k9gJeHuRoAT9qVFyTuhlxnWuxMrJaLYcfFWNIxE49gdvXg9YvcHqizvFsnxSpKqEUKSuSz8AF24M1syoyhLYiqSXX9fFUox7WZeKOxS600qAsQe4T7lAFbmi7xnSYzbplNhvIjnbCL8YXnyXMFi8RBHcc94tGF48oGpq5h3DOpZOdN9hueYxMVpqoRZXWKtUKRg56x/9V/ZVBxNYpnw3bwQB72EDNw73Y9zAskhHri/zpjXYCasgK9S+90JlkJWy/IVewGCM0ZFBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=;
 b=XsTH0fL9+TPYhWxGuQHJBxxXnk4DTcbIuQ/2/V0dWmkkyIKrOaw8GjypVfmb9wOcWpDqJtar9nTdbaVAqFnv334pbK2hcQuDQSZjUvYTHak305Q4FUTdZvMmfMQOTMVHOgIBKj4ucVmSeTvl3mPQzHEjvZwXNivpNIE1BRUjzCfJS46AAOVUzNctp8lna0Dpxo0oaZFp+3/kNlmoAYQkGMRn+um9eqfYad8k9n8B7MH+pQJQk1rt1oLXNMjcV6zL9PZqbMv/fwYylRt5qBgwJ47v4CisL3nEhmrpG4swnkUUMX+WVO9fR7HiNN39QnILV6PPSDfUXgUKMitwr2zX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=;
 b=HIlMyMN3SAWC25rsQWLntIMwmuBqGpojCErz+1AbPNUVxdBgMAF8kLuQHg3eW0Bk1VeVDXhydGxq3ZJ4P28ctLvrW0gHM5KyUwF3RoFFJeXisrMsfr3ASHb/u/8G1M5xGsPGdr/5vPyryBIdPBgA6A/J/L7Mi0m4jgubYDvGalRNHDrZyDUcjzal4MznPrL+QoI9DiVP8GxUA9QiVlj1GyIwcfwVR8sdwqiuWuX7lTaScmK2Nb7gYohASqPqwZeyfJB2jZwxPmBC1X+zYLC1/h+A5LadgfTj81y7nXkrVCFi34pqCY8FWj/6HXaHSFvd5KUDxGZs1PPmNWnIG5N2Dg==
Received: from CH0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:610:e5::20)
 by LV8PR22MB5699.namprd22.prod.outlook.com (2603:10b6:408:267::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:01:28 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::6c) by CH0PR03CA0255.outlook.office365.com
 (2603:10b6:610:e5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:25 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2622119249;
	Wed,  2 Sep 2026 16:01:22 +0300 (EEST)
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
Subject: [PATCH v1 3/3] ARM: dts: imx: bx50v3: ignore HDMI rxsense
Date: Wed,  2 Sep 2026 16:01:15 +0300
Message-ID: <20260902130117.2731-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260902130117.2731-1-ian.ray@gehealthcare.com>
References: <20260902130117.2731-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|LV8PR22MB5699:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 95b8c148-ec75-433d-69eb-08df08f24bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 7baRqnGRIXlC3qPIDmgw0aMqEnjb4xbdKBI3gCl2sPtqbzrigUCpaX3JUbgWYPwQeQonshQOTowypQ5WlJTbu62ax04zy+SYAIA9MvOiVvjDdFwJWleY6FN5VsTjTR7XfQdjb0ANErjulywMTBmknzKuaWl3iDMIniSkFKJDO5mhPaFJH9/lTJV16YwvUbelCUwtR23T5t5Y/ivDnD1CE0IwN26R+AyYmDQd/9H+tslCquoOFdGwYE7ooSFxjATULY8dz+c7MUBIk+oJCvLZDn4TL/zSt0ZTcnK011CWn5iGSmoDAFkRe9D5IE5qdCOoNEzJGNzzSgRnEo3L/Zv28SmY1Rv++RneST0RtVwnLkldG702pfHh3Sj4uh0Xz6b3lkOEbQLAdMYov5aQN6H/pIM1kMxHz49d81nHECddcCusfIoFXXczEqUfjnw+IuYpp+xdmi0XtgmjvlXRwHsgH7fJYqSb8EPErUjv+3fCnQg7jproXdnqaJLHTfVU0qHBB+Wp5xx8sDt2rmwlLOoQbEnca/gvxBnzbp2QIcetlQLDbzuCQhNj9IMRZ41c4y6xEjHIqIu7CSge82kFyqea2vmxXJZW8yGEhMU0276vjRDl12CUnoeBhY4Tp5syxpUQMqmwxV5uaYE2JMMEqcTmd53+2ipiec3J9T1Neqg5QAknUhmhGMR9ycFl7dnX3AiDoMqXrtYoxvryv00qpTtKTQ==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oV6bDXkdIO4I84d7D6fhBtH3AsHWUMzrAVIqtdMNOVRWxevsYJKH8wykv/oD+CdQwA0wArZEGokdGfAtExvomW3GqfC49mSUg9SZ2m+i0/nUpZRWvovzLNDMxQLFs+OTjZkUfnLP2Zyc8s32DmR1AIDBlxgE6Fa5PWEIFK8h7jQ4AwfLGoHKeqyamM8F/UW6LEP+/NMxFGbDduDJNpDzKmRAxYwPaIW2bdXM8PdAyW8E5N5wIw9BDR7yuFWXITQAvhHH8lJmMyG7FYKtARJvpQJ1dmtw5OxkDtfmNciKqI1UJTpbZuNl4/ctAg4j1M64bof6FoxPWWEpLTMKdlyvIM9SjelURvBK6Fh08raD71Vs7iK3+shZIqfN+sokp/DdB8HTeMPz8J2iRAbMnP+Vj4h2E9+VdvmjfgB5oGvYg6u9j5F2Jch+nXVXEb8U32ne
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:25.3376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b8c148-ec75-433d-69eb-08df08f24bdc
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060140_808325_1215176F 
X-CRM114-Status: GOOD (  10.27  )
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

HDMI is converted to DP in the B450, B650, and B850 boards; as such the
rxsense must be ignored for hotplug detect to work.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 2c8d2ab8cda1..8e129b1bdbbf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -174,6 +174,11 @@ m25_eeprom: eeprom@0 {
 	};
 };
 
+&hdmi {
+	/* converted to DP using STDP2600 */
+	ignore-rxsense;
+};
+
 &i2c1 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
-- 
2.47.3


