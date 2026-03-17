Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9381EFEDA1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=; b=eHhsw5J3MDUSQAbfScUFxrLiHM
	Xz7vZjQB7/wOqRbnE5DG36NaBYvV3GWAG0fhMnX2bLcfPxNSt97KKVt6aOQZ4Y9P/SkYwlu8RQdJH
	5gv1CQ41Sekj8yljBqHtuiFVQNITHP3f2tAxKD06CIJrephW+hIQR16Cbfjek02N4oUTnJw4pOnzW
	wXW+CtwbpwGob0kJoLcsz00Lf+CxX46c6a2j3AKYWgHm11r//UlHB2LXzvrA72L8hjUgpmxSQMuK1
	rm+qId7KBsQ9rhHZjp61uuafAy0/YMWoGU3Drh64hzQ91uA37zRbf92rcf3MAU/CH69FywcbFCGLL
	Luv05XOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSn-000000079QN-1O6V;
	Tue, 17 Mar 2026 19:52:25 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSg-000000079Li-1aJI;
	Tue, 17 Mar 2026 19:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTyvY6NPHpkMAtm5m+q+VRm7yVgpleS6O+jK+dP4IHw7+NLjizFHnoCRB7UK04UAHdsq6JyHyMVssYrsDR/kZO7/QJWMFA20pJQHbdvmrAVJTqIi37am1xMXBb4Tjn90r+kRnlkOzt7Xd5yQ4gpHKHG0hqIFRgifecfX4QDi6CvN8YkE9IzdBlX/SD99Ml0AsqBt7W5votoap9YVMJssQGLKLE9ZKH0KjLQgOVmLLc/kGMJ4DNS21ypmYeRKSybUcnSe9SbaDcu6sjpYuuHwqZV1saG24crY0oKVc257LLklYASu/kz4q6lctrPHhotX0i98fuVPfvCzYgoCdcPhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
 b=TtetDd/euBZwp2c4+TptHQt8qyzQKKQlHgXzmKCkSjVQyKXAzZXm4BTJaVuV1kfpPRqmPaX2wduXY+7Uq66ts4/bqEopYZ8vnW3QeQ64/iEO2Wq1Ghl1dMeSL4y6FXiewNdukI/vlQ/pDPfYeiQjhuL9mgRhk4q73RkSyUKOgEMgiUayTsh9icROFtvDqPlWQ9sOza//WO3/1VRcYpJgOYzH4pcfguIV1RE/Ib4cP5JaKXLb9I6892+fq3M5bcq1SawolyeiBNHaCJj7ZMZOPFz6ZUybCBKOWyb+CTStcJT4r3AoAaZ0cngJuYnE1Enf9eZ54jcaO4DI497cbJ7kcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
 b=XUQsvmswP106geq/yLD92q4nd16Z6mniaOEE/AtHNNJcuxUdViRE5/RerjMM/FFOOjgd3u4Gmlrk3BCN11QR+p5lnhqeK9bhGiAzgp1jt7LRZQtXfnV8RCfChDmMnV+SfhKKo+b/1LP1ovJIujZ+ogaIrwNG3HhqN6jB7mJPuiWkTX47Ii55rcqM7ygusSVqkyWnJ5+rivRscP4t/NgG2LXNCmqSt7i1LEh0/+VboJFhNLZAZ5xaEyFVfqWrUyEWV92S6O+ijA2dSlvGpgFdCCogvbjEd/SpoVzPlhRDpve2kjTe0OtrGkhJHTlWU465bA0wB9/yVfUDGTKLhhASew==
Received: from SJ0PR05CA0087.namprd05.prod.outlook.com (2603:10b6:a03:332::32)
 by LV5PR18MB927632.namprd18.prod.outlook.com (2603:10b6:408:35b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 19:52:12 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::1e) by SJ0PR05CA0087.outlook.office365.com
 (2603:10b6:a03:332::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Tue,
 17 Mar 2026 19:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 19:52:11 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 678484157BE5;
	Tue, 17 Mar 2026 12:52:10 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Tue, 17 Mar 2026 12:52:08 -0700
Subject: [PATCH v3 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add
 Axiado eMMC PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-1-fbf790f3f711@axiado.com>
References: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
In-Reply-To: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=twei@axiado.com;
 h=from:subject:message-id; bh=dmL4+JZi1AdhbhPqTCa4lhbBe/FaZIli85fBevKnbj8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpubDqpXO8aBQuApYM0CZljQXkyFil0QITpywgE
 V9b5OVTfniJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCabmw6gAKCRB4EDBdxFrx
 11KIDACh+SSXsun2k1z+niGJiHhIQWlx0ssCE7XNdlUXLp3fxHYV3xZW16HiA383ezLXyqXl2Ut
 0uxqrAtRPn7PGQqMESXWMF09ly/ROTq1kssalzF6BBCEslQVePtWjakDpV+hKbs2BcaHS1Z9fRs
 wcI29oyeSTVRQbgipQ1sMCumEVcg+CCf33zIGRh5PrjeJwKr+90nVMtRZ70HIICqB1eL8tqlJPY
 9kxHI7HtLLYwDKAAqM8jzGDSCYJXU2gASxMKDoiCePheV/NTs+fqwro2SQHzhiYqLw5z+jGqYtN
 1SwsKIrBneAdoiIsDOKw2A4XyHlQGMfpKsd9gpgNE6pcxaWsHs20howKSbneOwS1fT1oRhFAoJY
 JHFTuzrWA6/OVXQcHKe0W8pOiNe7MStFTOEv58wGH0RSC/UZU7dCYCwQ20lqPyJzDr31Zbkq1xC
 gTnGncWftu/FNoST1fyY6/Bkjyh+0Y6AzXKB8AOhZq1Y4T7VNpiDS5uGphA8pH7PYtqsc=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|LV5PR18MB927632:EE_
X-MS-Office365-Filtering-Correlation-Id: f7eb3591-524c-4de4-60cd-08de845eae22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|42112799006|7416014|376014|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: DEoKrSOoasz8EDq123yuurF0Z9YrNGlmoiH1IVFJJDZh372npyuQYMh2dfuYIGdOj4qH5lC1fZkU2aChnrfcDVXZAHaC9BYGJS53rty6Hn65j9LIBMbPheMqie9HPu2Bhd5oEUO2q5/hjsqYPBfdjugCdw+YqOlnFBg/5v/t5wkUnzXC36Pw0ok/Wlu2/Bo1sj69qKjpt5qTLDmGAqnek71xwBJtBZRiDxXMaubyOEet+TM642oC3pNX6O00uOET/fETkjnWEC5+CiIDHHyw4L49WjKPL577hmifWOExUC1nhPgkv3k7sw0fjiKMB9ypsFCS0mweUgqRFe7WHJ36x3f4GxXo0LmVO4yrWRafau9/B9flim3SjVHJvizh4UyLPFkGP3SnJsCObP1Np9CR0EFfJgrtumh80/+ATU0hJFQub49J7LIby6Y1H+9sCRLY+ZddBd4T74Aicf74f4DXTkCS5xYgGmFDR9X7+pRYvToyjYMy0KhYvT5FzcFb/mIiP/YlPRy/eBKB6UWggkMl0BdquVuaV2daD0gG+R4urroTNidwADBYUWylkXJNWu/sR284XrvA8hMD8te9w7y2RpW3TtxPX9h8nUZo3Wozus6q/5eLwSkO6nye3++ed7Bgm642mjQgiRl4kYY9yc3hk5akP1G4SXwz8EA71DX0r9LSYqjea0Gl6zfBqtWu2Pm/p3i9faB2OgBLQg1bnaR3NGHo2XwCm8vrZlyK/o64f/0=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(42112799006)(7416014)(376014)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WCs632pEqGFRN2kLXirjGeqv4wqHIuMcfY9E2tZlRYT5nFgjAFfCaL8YEag+wlZQYuz4Nhg1bThUnIXhfRa6KVlch+Ywy2dPcdBKDGszvgRLYn0mCLaDeZtNa1lRbt51WpwpU2Ncw1C+i7f3zUlZfD2t9IB7UX6TQdiOFsuDfSwNHsXt8z/nyljC0qNK03x6ekpd0fGYbPjuF1L92Z9Oo5C/OTkmHsxSCR+AgXC8Zihccu70xIdD3XuP5dVNv8cMemb56Kr7NzTNImLKu9Tzf53GOuLQHTg8W09wxyoRtPfZzn174bEW3uXbPNdHD52aIFlIifClvnVHaHJrba3WbU85R2kM168PTfOboNT3q/wmzgeyyqnJUtWi4yuLdoTJgvTnQ0pjSifDceTt2SkdaSX7p7X3T89U+X4E9X3V7oBIAqRMaIN/GzLIUsfhzktU
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:52:11.5981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7eb3591-524c-4de4-60cd-08de845eae22
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR18MB927632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_125218_436565_DA016553 
X-CRM114-Status: UNSURE (   9.69  )
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

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC host controller.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..61700b80e93f7185e16ca9eab0922fe6bb29fe86
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/axiado,ax3000-emmc-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 Arasan eMMC PHY
+
+maintainers:
+  - SriNavmani A <srinavmani@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    const: axiado,ax3000-emmc-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@80801c00 {
+        compatible = "axiado,ax3000-emmc-phy";
+        reg = <0x80801c00 0x1000>;
+        #phy-cells = <0>;
+    };

-- 
2.34.1


