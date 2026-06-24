Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186CECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4erykny0cwNRzbio5Mm8JVWemZljTTHZ3U5rcwnU2s=; b=Zer7F5NSkfnnroYlHX8bYLv15r
	nK2BmFjqyfJLsxqkkHdKE5LOfnjL8fMbWTEmOuJgyJFtjao4xLB7VHOST/Tl68Pgrl+HoSgt7fiEU
	uxOwALJqW+Ng184YRjSCfruYqeBOP6jgsVkdIJ3u84BkO1S2m/1MzHRbe3ipIvkg/1/QHCH4LmaAF
	5cUfusv46L6mc6kHhwAKOiUPZr5V3gHy+++Er+tCIxyKnhg+dh0v0o4eHCN6ZDtdnGhQsiDpXLLt7
	dtBz/F2usnVJkZpeCrl0ImM8mDexuNnKDD82M5NZg2P8nX87jc5FnX9qlB4LpAVxrUDx51D7EJwTp
	fJtxK+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKjY-00000007amO-3Beq;
	Wed, 24 Jun 2026 10:21:28 +0000
Received: from mail-centralusazon11020138.outbound.protection.outlook.com ([52.101.61.138] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKjS-00000007akH-28Oh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 10:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmMGvVVfldvStjmwdcV7cQzzBXhAlDn8B0DsO2Ejs6BhDW/OtPQ651pjdJwgFyOqrOI5bBaF7s3/yGBzGOeg05jKrQdSHBZ4GDgzDf94Dv1/0ZoJvwh+QUkgW52MvCPYn9ffsnmeW5cAklMkMFlZfq0W1yI3fB6Qy6tzjPmqwktTV4n+niBYSvltuK4Ftn2kYLEK/TVSzGdRcarX2wJUj4n7cOHQ3wlEtSB6GkKms8Oj2+exWRS9JJSZEWopWkx1g9moP30EJHmZCLYajAjCo16rNveOreber6Sfe3/jgcGcSA2L98MpqHYOVzHfyJclAUaBoVUO4yNjrSKytCDc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4erykny0cwNRzbio5Mm8JVWemZljTTHZ3U5rcwnU2s=;
 b=lNUSiYnVTuBNXMXdCyc+tD83VITY/c40UgI/v0jX28EK9e/aiNWhSwvjMKM2Vg5eE4ZhwlXz/Fj+kJfy0LQM50EF5+FBQlq0Xon3DwvW+5WWu8k7yIVsn1qrnq80Yi0wThZZDs5UdMrRYd9VNXi6y0uMoUJ3Z78Lb4AL3F9OL/qja5HD+kmMtqTo2PBECYI5a+86tB3frPswiplx+CrgNZRyDIMBQCcF1P5ORyR5WMmwQB/hriugNMZgsYW2o9JVpkNLMhnuLoewrQIHkYEgLK7L0a5ES24aUEZ7IE1iAlkXREKt6TzJRsoNrZ/y/+z1EG7f73fzBABfWCn7E0PR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4erykny0cwNRzbio5Mm8JVWemZljTTHZ3U5rcwnU2s=;
 b=ZaHaX3S5vzfLkjFPREVgXkbg4ADdzrvaOVMtGgB3GpVgye3qPWsTlFNKC7soSbaJt6EDYWE1EnHL+cCu8wYxT0wWDVG1MIDAGncvLryh19gAtb8hvFKjmRkq9HXEKIgicPNrzMeH+7RT4adQrYSiyvwKGmcr2WwSG24ubEDZuaPsdkh57jhYfAsilcaIM+v7xCDgAogqVelWb9NpwxQjNdCkKgCCBIWBxzehTichHZtaPzK7wlsbWuoFTT2dmVqNiZpXjBWSATG5HdWw2B0dTDjHGLUQjMAMeAoQaC/H8hMfTOa+BTn34suCmNvhiliM5UeASSy4Akn8O3or5LvsPw==
Received: from BN9PR03CA0073.namprd03.prod.outlook.com (2603:10b6:408:fc::18)
 by CO6PR18MB3827.namprd18.prod.outlook.com (2603:10b6:5:353::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 10:21:15 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:fc:cafe::40) by BN9PR03CA0073.outlook.office365.com
 (2603:10b6:408:fc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Wed,
 24 Jun 2026 10:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Wed, 24 Jun 2026 10:21:14 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 91C7F4186B5A;
	Wed, 24 Jun 2026 03:18:27 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Wed, 24 Jun 2026 03:21:08 -0700
Subject: [PATCH 1/2] dt-bindings: arm: axiado: add AX3005 EVK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-upstream-axiado-ax3005-upstream-v1-1-c05bd0bc9124@axiado.com>
References: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
In-Reply-To: <20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=syang@axiado.com;
 h=from:subject:message-id; bh=rZntrHs4iZS/6Uu22RI9Q5U2O9zrbdXEkRwRqNgk54g=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhizr9TOO18d/bJxk6Bhza7vk4pXPwlcU8NVI3jV8tnHpr
 Babi2+NO0pZGMQ4GGTFFFm+6nzLP5mrfa9z78pSmDmsTCBDGLg4BWAisj0M/7OP5iit8NrQGumw
 OqltDQ/bczaJuknpjGlB2zqv8W7MVWNkOLXxpNMS8xvvPuR9fWXzMfJPZsyGBJ/HpXJTShZHN5h
 4MgIA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CO6PR18MB3827:EE_
X-MS-Office365-Filtering-Correlation-Id: dffd40b9-6938-4345-b696-08ded1da520a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3pdc0z2twy60fDo2eXpkxUS0IlEl6Og2PJKEKXKn5vjxmWIEe7LWkjqSnOzgj8tQr44HaJLTwTQ++o5SiSkh9TeJM4AdZPe7BAx+4D2tbL3/i82m17wSOQdqVGujyNPMims8dk5AyOhBqY2pri5zUxsnX4P7yChEMEDd8JNxE04MEoyTZir5/rgEgAsWTKUJIe0hRKB8HuCFi+qwjJutjucjUKfcfsb4TJOMeWoHHrOSNUk0Ppl1iCdGcLECIY9RkbkzqbfxyKQ2eOr7EchnEZaX2UvX0LXV5jCJbOKSAQMdRQD/OR6RcRt/vU89Amr/fcLQnP1S5KDEVGErTIgWFSo1suWMldo0a13ao8pDJGSZUJ76n3H47xiTHkyLEGTRHNScqrsCOchRfWJHPbCLmfi2+uCxroaBxYED4EDXiq/Cb/MtlIApzJpy23j015LhcYCXhWEqd3xZWOJg1Q+D6MLViJavf1KOyq6ZyNLJqgMP7o41+2MS2ghP7V8yQuaUA/L0ZitR4W1XaBNNrTVTXfBxwiIZ0Uk/AtipAfxnE9bvuwd0WKQFW2CAPuO5V3nDnT8GdvDzPM8p2LgaHatxvP7YG53Lmqc58ngvRKZ0dRJ69NfSqMtiwHi9K2x2OlybLOlpzXoE6mfrrH3GjPVibkCljpkVeZSv7DEi1xFfTdTzqcGm9JRqNmbZxhQgpDqkLiM5QE80939tD8AcRliOjQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JB2/54t3dxReWw665H2OfzVe4T0P4DKAnDeHLvlYWnnrrG8zrD2fZvRuG84Ox0Y7+pobEHhSkTTCc7aQk6po1goncwpbgMUOVCdak2LP88QvaFpURrewyM2oM+AxPyFJFDwZLUPq7xEPK8yIaVgDXcyTpu2q7o55PGd/9LM2HFYTPcxX4y/yV/1ovrEx4IXcLuDKEMFxsP6LubmzUC8i95mNo08hquQ4Njf0Ty29h5qyb9BFXBxXIUbA4zMn537H7hWr+2Gqnv95cPuQAhdq4vNEQyTNFx7SvHqMn8XG0ETcP/YdYIsPLzwJX4VVv0/VauMEjt1MeP/zPdobysDpzoE502xuF0Z+8rjVFLHuN1lMuVli9L1OUSF7zoV52feri6GMoGZCtADjkAnuRV+OocpZmtaNnp2sNNmr4Gh1m8KsyCFLx6Q+6/GQYHieoUOb
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:21:14.0976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dffd40b9-6938-4345-b696-08ded1da520a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_032122_557684_865AF657 
X-CRM114-Status: UNSURE (   9.04  )
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

Add device tree binding schema for the Axiado AX3005 SoC and its
associated evaluation board. This binding will be used for the
board-level DTS files that support the AX3005 platforms.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
index bfabe7b32e65..008d2b1d4e62 100644
--- a/Documentation/devicetree/bindings/arm/axiado.yaml
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -20,4 +20,10 @@ properties:
               - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
           - const: axiado,ax3000       # Axiado AX3000 SoC
 
+      - description: AX3005 based boards
+        items:
+          - enum:
+              - axiado,ax3005-evk       # Axiado AX3005 Evaluation Board
+          - const: axiado,ax3005       # Axiado AX3005 SoC
+
 additionalProperties: true

-- 
2.34.1


