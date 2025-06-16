Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9CDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 04:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWGF2A/7Iv6Wsp3mLNJazxDmKZdBDJu5w/UW0aEFsD8=; b=zRtKbyPY3DJ9mBbNEVgf4ZtFEL
	guurg2iKkXF6YxzDOjlsd6tQFJ3WTSvto3NCEGvBmIW2f2OrN7veW4DzZ0wqgo4ukY1RkMXp3iP/5
	+0ZCVOSQcmxKcEfendF2oB5vDY2ORnRA723AcOIwYctVXUnZ4KFborZ+/udwW+L8L9s/UN4y7QFbl
	lZgqujFslffT2VOx+d00j2z/PC2d0IiZ9UTehRYHB9S8jVwkTdyKvkzCfD5JGrLnwzRfKYVoJnUR6
	6ThAoT9MOzoUUNAPGBUUAu9aXMYOXEcYr8HJegQ3BYu3/Dq+epe3zC94hNQ1Tg/Hhny+3VuCtHn5g
	KGTg8V6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1cH-00000003MN5-03dE;
	Mon, 16 Jun 2025 04:38:41 +0000
Received: from mail-mw2nam10on20721.outbound.protection.outlook.com ([2a01:111:f403:2412::721] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Vi-00000003Lpg-2JxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 04:31:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i509qEf46dVrnANvLiAAOQmh6LiKL+LvdrtqNYjR7tqbxHpaMT+gHFBczb7BaPnP4Hirg1CvyKNeRO+GT4aVqCFU9svmDJjn4ZNcbiPqv/5XNqtse/GdnA6dEOKAoiNVpgSsrl+IE0v5Lf1KtiTZF0yRBwBduHIBRHFa0FwaBCJ3T3XE7ozsdpix2Z6cAw5WtRDza71N2MyZaCbVeI1tMxQrk3BCCXYyn116IcpWw4skS62If9/5pp+TLqpK0NjBbp0mXNrinBXo2evchcXCHHW1uxGZkadcv81ab8i6xG2iBr6IjENHNfhp9Gw7qwlyAzY9YizwTEQ786flUXeGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWGF2A/7Iv6Wsp3mLNJazxDmKZdBDJu5w/UW0aEFsD8=;
 b=rURm6GS97YTWWzg/BwSL9xEB7eANhRd5Mabu+Y6TZ/mGcZ5tjH4/2wlwQgHej+guTI/P4zTsAigsGsMXBpGtVwZY7ZV5VE14Er27hRACKu58+xcLHLNX7GgSBK4WRe8wRmtul6aKkMdJTI6Q88Nms+ShV5eIfHy44h7eMG2ipkFixLNXcAQ5B3D+WChMY08vUzYjZfiO8BHRcvsK8KhxkGKny02yQLYJYtf0ixflv1MPXlnN+eEpzjDO+uLO0/O8T/RmYa6cxum6yPx8xCq1kV1bKgF4mYpgB5FWvKdT1JqVLF8erGtaPHH970QCzMx/97P3YFYx5QGGipcR0pEZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWGF2A/7Iv6Wsp3mLNJazxDmKZdBDJu5w/UW0aEFsD8=;
 b=Iu9eGevjltiW+Pwi/d6HM83+8as0IyiCnjQaTaulgCN1mQLsien4MH7K409uZ9tsvAduDao95NokL77SJajx0Wzx9293w4W+IHGiRzZGh084oVQYSA+POhTBVa89KCOkAA1l4I7ucO7AAPHQFxTX0K+TPe8CoYAnTsEs1DaRT6GSC0wVO2yDEw3XOtjlZPS3tMFZi38L8lGEHuH9qtzw1Omm/D25TOe7P0+gVF4gJ6DbAep7yq67nP5qwjqvvTuwhOgpB27jYwgUsLajbUjhXxGn6qtAAbrYxsTBVup2zeUo0r27X7jMUIdh2IhJLB4y5uzew4zNsYv/dhi3MzjKYA==
Received: from MW4PR03CA0080.namprd03.prod.outlook.com (2603:10b6:303:b6::25)
 by PH0PR18MB3831.namprd18.prod.outlook.com (2603:10b6:510:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 16 Jun
 2025 04:31:49 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::c7) by MW4PR03CA0080.outlook.office365.com
 (2603:10b6:303:b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.26 via Frontend Transport; Mon,
 16 Jun 2025 04:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:49 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:35 -0700
Subject: [PATCH v2 2/6] dt-bindings: arm: axiado: add AX3000 EVK compatible
 strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-2-341502d38618@axiado.com>
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=hshah@axiado.com;
 h=from:subject:message-id; bh=zSEsejmTVvWne20+T60Y0DDbOvObD3G9sDv5C/BwoJ0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54wnnDwQfXyh6J86WyJkHUUXO4YehmyMB14p
 BxafooX5LGJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMAAKCRDxWHMRoTLV
 +yziDACSDWdhU2hS65SHva05iINrxpiV+hTKM+yjUl2iBYkVc2YkJv5IphZliBN+5cyubRIicLP
 z/F0XfPNaEsnw2zGvZqsrGdqo3Mnu1yVNMc1GH4tB6ypM+1YzeQrZzJ5j5Htaz9vl5NBSzUsjoy
 CKr4fnEedmvrqG8fHBghBaC3XY3/qWVUhmXY8MyyENfgonlEkMXzPFIu5XZWdjNdiQEwlyQj9Ss
 ORxgj4h+e+XFkLWDqxxpQQ3aF/ubu09iBV6Ks2+xV3tlk1Ebfj9GtJJOTqoAJw/Gi/vabfscst9
 LcML0TRsxJdw40CLfcqXSIS/622YX0r5QfiK7SeFbW7am5czXzBE9I6yqOy8tbD6FGzHPPY1n/e
 2W8INJk5sBJrzIbS7KwWKcWjYpCjJ62oZjPHXgc9Z6CjkbiLIQRO14oWt2q5fCdlbX+irKPCugz
 fW7txaF9dQjXbHvHXX7GhI/jYbPTZpcHqAV56psLECUJ7GPI9ys83c5HHeYiO5AfdmO3o=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH0PR18MB3831:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aaac834-916e-4b17-ed5b-08ddac8eb5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmU1N1RMdmFzWC9yWGFTeDJWYWFRUnFNeTZxZDBsYzk1cXUrcHlBMlVQRllx?=
 =?utf-8?B?SlVrNVNsZWhBSTkxU21zd2JMY2JOMFduVDN5bmNIWHNJbUp1WXVzUG42dVlW?=
 =?utf-8?B?WFcvSTV6OUZ1QzRlcysvL3NpdXlVZ2Fqa3NIeEUwbFhOMDNka3hhd3BJMW5m?=
 =?utf-8?B?SWZhNHpPU1NmYnVtc2NMTUZaWnZQNDRyMFJBTkxCcjJQSllsWS85Y0lEYTVi?=
 =?utf-8?B?dVRRL3l0U0NWZlZxbEl6Z3Bod1IrN2doaitpK2tUYUdiNTB3MWx4VkFTWk1V?=
 =?utf-8?B?dlYzQnRBSkVVWkJiQ05UdzdYNzJLNGdJSVJxZXlGeXMvYkJxT1FZcUFKenU3?=
 =?utf-8?B?NDRHQVM5N3NyZU4wMEg5UWJkS1pxNWdsT2hIOFFEQ2tCZDNrdituUGF0WmE0?=
 =?utf-8?B?ZmRtbkd3Nm5YKzM3RXBmR0thZnZpNFpTTWNKMy9KRmFZSnFOWjVubnh0cU5a?=
 =?utf-8?B?STRsV3p0ZVFaMjBEMnJ2UUdhRmdEbDVyd25LUkFZK2VlTHFlTWhiT0pKSzY4?=
 =?utf-8?B?NnVFS3ZIbXBWcjYvR0JrQW00N01sN3RUbWxJWUd1TFlrczFVVTlkdkpoaGZv?=
 =?utf-8?B?eTJQRS95RXhTMlR1NDQ4UXBMU3dld3ljN1BGa01ia3NhSW8wY1JLdW1XRGhu?=
 =?utf-8?B?bWlPcVNhWkRlZ2t4Y2Mxc2tsT0lxS1BXdjFlOFkvdFhobXg3UXdUeU9udXAr?=
 =?utf-8?B?MUdKakp2TjJhZURSbVdnV2IxdW5SNm5tc0RHSXF6ZlR5dlVKS0R6cUxJcEd3?=
 =?utf-8?B?endXUzNZSElqeG5JZGQrVHRSb0YwOC9DbzVFUFFJcTEwSjc2RVdMYmdYSWxz?=
 =?utf-8?B?NGR4VjV5b0ZsKzhlSW1Tcnp6VE9FRUwxQlZ6NUpDU05oMEQxK0pYZjRjTnpr?=
 =?utf-8?B?OHhFRGxvSm1qU1ZnekpZZVc0RjdiYXhCYVJmbCtyc0tzT2xMdVZMbFN5MEhO?=
 =?utf-8?B?a3VGSE1wMkQwQmdWMnZmZlB3SUc5NHJKUUx6S2dxQWRNVU95T3ZiSGk3OHFS?=
 =?utf-8?B?d2owWDFZM2dMVjYwUkJISVlLNFZuQXF1akFKeWcybEVkYU45NVdWbXRhcnhw?=
 =?utf-8?B?R1BveDFpQ3ArTGt4ZlZTY2Z6dXpyZ0h2UmNHVzY0UzMrakV3OWJLUkpGZWVu?=
 =?utf-8?B?OFFadTE1djdRWnBFOTVMc1FSL2ZSaG5JcGFlMCt6M05jVFYvMTN2Y084U3RN?=
 =?utf-8?B?RHdyU0pVbWYvZ1dQdVJaUk55MUtYa0U2dGY3OTkza0lIWmt2QnM0d09pK0Rx?=
 =?utf-8?B?bS9VMzF0WlJLZnRzcnZSYVczd3NDSlgvUVh0RFdNNUpvbE84RkRoOHdEWW1o?=
 =?utf-8?B?T1BtN2FkOStpcnhkcklLVGMzQlI5SVI0VXRHc2Y4T3ZwVWFxa2lEWHBZTFpX?=
 =?utf-8?B?T2szb1dtU3RkWThndTdDdW9zb2Z2WXlSeHJzLzZOc3Bua2dVNUcvQjRXSkRY?=
 =?utf-8?B?aVBDWkxHYVhMNm43U2tzSTFqQWV4djdKWERxM1VrTWF6eHNmRGllZUdpVTlJ?=
 =?utf-8?B?dndLTzdqaVdlRktxRjcwZVgrUU8zcHV5UW9HRkVnZlZ2azNMVko3UmZEWEZv?=
 =?utf-8?B?czdSRHdYOVdUcjU4eldnMFhFMXZrclpxRjJkbHVnZUFEQysrajc4N2ViWVBE?=
 =?utf-8?B?ODNnQ3hYMFJ3aldSaHVnZmNLdG93QmJNS2dYSHlLc3o3eFFoQmlmN1NFWVhD?=
 =?utf-8?B?S3B1M0lLcDdhRkQvYXQ1cGR4a1lQUmJtUW1tOCtSRkpON0xNVk1Xb1phNmhR?=
 =?utf-8?B?cUNxbnBSUVdsVkJPQ2tTYUE2c0N5Y1dKUW1VdmxZMEJlbW8zV1I5UGtOTld5?=
 =?utf-8?B?M0dRRFd5RDUwU21ZTWRoTkRLR2FoTlZDRnl5dExJYnA2bjZhN2NybzBLcTMy?=
 =?utf-8?B?aml4TThqZ0c3bytJRzJDczZJb2xiNVU2Nk9aankxZlVFenRQOHJaaXdud3A0?=
 =?utf-8?B?VTlocGU3dDlMaXROWFB1NjVXWHkydHAyL29ST1ZzVGY5aktHV2N2TzlsSlRt?=
 =?utf-8?B?em5Qci9lN1l3PT0=?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:49.3134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aaac834-916e-4b17-ed5b-08ddac8eb5e8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB3831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_213154_597007_97FB6FEA 
X-CRM114-Status: UNSURE (   9.96  )
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

Add device tree binding schema for Axiado platforms, specifically the
AX3000 SoC and its associated evaluation board. This binding will be
used for the board-level DTS files that support the AX3000 platforms.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/arm/axiado/axiado.yaml     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado/axiado.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f323162b7c3cf973754a3539b94a7534111886cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axiado/axiado.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axiado/axiado.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado Platforms
+
+maintainers:
+  - Harshit Shah <hshah@axiado.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: AX3000 based boards
+        items:
+          - enum:
+              - axiado,ax3000_evk       # Axiado AX3000 Evaluation Board
+          - const: axiado,ax3000       # Axiado AX3000 SoC
+
+additionalProperties: true

-- 
2.25.1


