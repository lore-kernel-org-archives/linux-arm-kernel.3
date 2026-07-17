Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871A8C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXdCjsWF0dpZZmXjTpgu/fPTzQAcxcfwgYRGlyn4a48=; b=SqasLDRsW3rkSM/kA0J+jrkXlP
	3GHcQyKVKRGNHGrl3qWuaFTz7jBMCmF/L8YJu66UVD2H0IpwWmlxK2nQMHGBLWC5LL3Exm/5CVfvT
	w9OZpb6CDFFnOEwIDUzy1T1nw6Picz0yFnmImv71uu24M29INSJObPa6jqFdoFb0Vg6nKCoIvIxo9
	bB9jfUClVg3wcwkPjvymHW1WXIhMlxPvUGTqr+jo+ckjd5GZIOn1losbOFPrTsOCiJU0+5hJR/kRp
	aPgq6foicEnl+7WXAPLJfR1e00vSIHP3wtgdD7BBgMghW5YiuriGW2HT3masvgyxvafXSA16Xh4gT
	tN1ENxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZbx-000000014n5-4BFQ;
	Fri, 17 Jul 2026 03:51:42 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZbr-000000014h7-0M0s;
	Fri, 17 Jul 2026 03:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvSMGb93fGHEzKSzfRZFoinvz0KG159tbJqnMDeJV74MP6euuQR5z+qk42KyGl+qvD/h9WJEZ7zb87Tok1U0GAIubPpcIii9sJKDKw3mYW0+H2oFQXza8HKvnNvQdvmh97Wk48z0wapriEFOr5pYRUyOiI/5XNmjUKsFetwL+svJXci3vt227CXF1/W7twlOS+YimCqb54TIaoHQ3GwmYOVrwZLu2q8CKC2JAllGtN6IGwcnU8LxeF0Fd6t2EaTmYqHWx0ffefFJJVzPbnBU/JsgtddKnFztqqsv/BdocBB9wyYsM1aEhVF+uufjUvAIp3DfShhfVrrX7XoLgoBFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXdCjsWF0dpZZmXjTpgu/fPTzQAcxcfwgYRGlyn4a48=;
 b=sNCdOjLad/7Bxepl93LBF2SOzOLlVAb6JFKfpHadDLj2YIVmVXuzHWkANwvl5INYmvGmsLOv66U7WdfFLhBsdLLGtd+E6peERvkt7RNBikLBPinfY7wVwX3EGhoq2Nm/0O5YXkNqlvDWQsGqdRlMh8EyFNUqex4qNV5YfcLz+y/hE1uge6GNzzqq4IUBEpKEBrOTp9o2/87WdXFg/fmykla9uIaSykrBTBmM6iasNoWIxw2ocpnJUlbAuzPJoj5AAgXq1wuLZINQRTYyrATRI6dzW7YOcAoGlAIMf3F9q4Yp3dzM4etGYoSz7KavOweHRmX4WlZNhIzAw4AhDyAlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXdCjsWF0dpZZmXjTpgu/fPTzQAcxcfwgYRGlyn4a48=;
 b=GbhTLfZBKRm6bGGMMbkt2VQYrHLvk5r5wsWghwK02KLiJvTz7lkSMwKXvLJJzNOUZ9Hz3XAwv3/h7a2kjtk5X/ipG4t5z0jNaaYMTE5ETAlSWuo5q8uCMwBO0dzRpdsepo1WqVOlZIWgrhxBWae7okJAbAD/HYpU3iTFFn2HdfbDkUtL/0pD55Gsm/zokXUfKRPhKaTMoLyaa+TbTp+kDfofd5S03fu9cwbwoTZcSw0eJtPfxpfNCkvGlKFLXm21QXhEqL86Oq2dK1pY4JseGxBPJfpuuIpsYIsGF2KE7voNWHRz6L6XrDySB30QZHvd6N9+mdNwlJhC9ATn3u0WMA==
Received: from SJ0PR03CA0174.namprd03.prod.outlook.com (2603:10b6:a03:338::29)
 by CH3PR18MB5437.namprd18.prod.outlook.com (2603:10b6:610:159::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 03:51:27 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::35) by SJ0PR03CA0174.outlook.office365.com
 (2603:10b6:a03:338::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 03:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Fri, 17 Jul 2026 03:51:26 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 40D7C40BFE0E;
	Thu, 16 Jul 2026 20:51:26 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Thu, 16 Jul 2026 20:51:11 -0700
Subject: [PATCH v3 4/8] dt-bindings: i3c: cdns: add Axiado AX3005 I3C
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-upstream-axiado-ax3005-upstream-v3-4-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Jan Kotas <jank@cadence.com>, Michal Simek <michal.simek@amd.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=syang@axiado.com;
 h=from:subject:message-id; bh=1FIHk72y1jBvhII7kXSNMX/gZstgoiDwM9EFmRWIOmA=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqzIZXuKpda5ndiks/tjU/BZt+MbMm41bJlS0lgoq+3St
 +Qtd+zCjlIWBjEOBlkxRZavOt/yT+Zq3+vcu7IUZg4rE8gQBi5OAZhIWR8jwyOnUPHwPL4jh/fs
 nPJ2ugP31KrikHuek3XKZjO/5QoJnMDI0LF2dteVJycmPVlk/zTSbOsjyUvXxI1Ozj3Cu0Jy9vc
 zMawA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|CH3PR18MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8cfb5e-9d4e-423b-b3b3-08dee3b6ad59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|23010399003|56012099006|921020|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: yyVm4P6B9G/qyCKJ60w8w8VE2bhjq7fhRHkutAWmZbat/lC9qwnKgIwuM9V/CECH4eLANt1ai9s9BGVW7mDyRdsJwBUIaZiF5K8x/Fa2xHwOC0x2ccKIFpvAMptU3FSRuDXNy8GzWnszCeNF+jLvxDJhoOUwdyD9roFE9VaCZkJIB0SuKhhMZeF/lbITDTeinkEyMLiCryJlLFkAxDTuWxfOqHIlxpI2LCDFEz9rSTBgTqgV9ff9iwgLbDzV0bRYngDwUrSN85d36Wz477AOumwMtnPTKmvFwf2u44An6L8si/8flHJsRKxMMhXAL7+3ZehA3HS/qGFPsHDg2o8Bte7sAFg4HZaTFLhrXVloqUo30trB/4cKeW7D8QbbeNuiRtReZ57VN+pL3yDf0+96N8QL8FWpQElefo8RXyFzIeLwPTGZweEy0dqh+WfK2TJfVuq7nAG8y6fAm8Tad/TvfprzpaHsvtexodmnO3VUggCGWjTq3eqHCX6EBdB/JJto9bvguYxpFq07xWaTYtb1T6+BiNf8VqmATyUcBGtOm2d6ytqhoHxr87wFIg4PfEBatCbbzlRBE8At6WpluPchweq7hxG/J8sDqOSMr7UyeKuHcRjuNNbGFA24M1n/fni2iwCJBvYtgXCqvHHOFkIN0TsvBeFpfYG7jikuJv5oALOj4rCKH0X50wZQorxQDRt/XZ13CYUbtNC0pjYlArIMIFj2YnXJCWHfpM3jcEGbtMpgqYjvH0v1XofQtep63hph
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(23010399003)(56012099006)(921020)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 86+wn9YbHIIE57Wf9z08i3AAkkgBHo9CCisSLNBHGGTSXyF0CnO54cvug3+s4aXW9jK5q/RHZqC4OStZnI+zHkFJ9Hyyx9Ubsh3EAuOJwcfWO8i1M0seKzBozHf00+5pbTGS0BBR0gMAL9d0bhZWJ4+yEq5R1sRzSkhyjtf7VwJMXOhdHNRLwn8W16WYlk7J8tj3B8uir6y97bpiP1ZK95h9PHNoNM1T7EDqGwrpGxPxUEbO+XZPdCuHlwFoM1krBTrhDWrM/J/LemhyINcygWFMfjEQeq/q9Xf8eR34QY9Hq9fLU1wosbLcik6YI/QHD9sTLfoQEc6wydiHx1qLac3Y2xj2RE8yZ22jjphse78vE3BHnZ+E8kGKbcpuopiZeoLEe0VRFXt9hwNzHbrJ0NmCHLwA/oGgEAYNbwGRLUVu2L+9nZYQ/K2Ukmeb4n7j
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 03:51:26.4633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8cfb5e-9d4e-423b-b3b3-08dee3b6ad59
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_205135_129748_68F81517 
X-CRM114-Status: UNSURE (   8.72  )
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

Add binding for Axiado AX3005 I3C master. So far, no changes
are known, so it can fall back to the cdns,i3c-master compatible.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index 6fa3078074d0..280f0ada3c43 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - axiado,ax3000-i3c
+              - axiado,ax3005-i3c
           - const: cdns,i3c-master
 
   reg:

-- 
2.34.1


