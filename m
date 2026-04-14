Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6310F9D0D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vSom+LQ2hgD1/KOY3xFyTW2hYyd2vO4j/9ZqnZ/JatM=; b=FVWcY1zGHy/oJW
	V8Aw0VXrqPqbFn93gTvLGIYla15GWtJcRi2qvda5lAUQEJGHs6VKi6pFUict97PpW7cPoRpatsQGi
	CC2eFK/bXlS5BYAezRobomLwg7UdK1d/VdIfojpNWaTqc1KGFtcH91CQQMLVSWU9JeVYO7FIxIOu4
	Ne9xXJ2WMk1frn1fkhJj0N/vNKJhOVmHz/OJTKH/y83HAzt4OGmelnyOrj/7JPi5JMr3s+eaT6TA7
	GR8a8vamVIi8fWziGG4zw/Fx2FYswdLIuAs7j/aoUwARJmOGrz/pSBGwYOLBToOBT5YCWHmfH3vKm
	1wej83WDl0/5yxmUiHOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe8Z-0000000HOyu-3HaE;
	Tue, 14 Apr 2026 13:49:07 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe8V-0000000HOwI-2f9r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:49:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owju1sT/tw9vMyyMsAKH0d92KIKuyPG9gabf0k50Y+8bVy5zJ1sVmy1HQXGYb52o8JLC/nGFB6VxsE08Xyp70BokE87/JjJfLBPIipVddAPmleiKwAiG0Xi2ngDXjVeVEIwOcK+gn0J286sCUv3B5YYv503aqVRkM9AMLciVpL/fPjhASyHjm6ENT0Y4gTqlROx0vu26yGp237sYB4wCHDkBZ3r8kvmQSfraRZo5ONOMlcoJm3pN2kEuYy2y+a3gqznRp+YBK4DgWADmR4owITWH5Dv/d8nq4GvE0EWVQ0563ISBd2MHpwM1/RMdhGj0kko1p6lQn+AikNcmfkkd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSom+LQ2hgD1/KOY3xFyTW2hYyd2vO4j/9ZqnZ/JatM=;
 b=o3UUGbyFQHZrfFzu6RQI78QEN6tj4RDvs6jSgsTMIqKPi6pLBJV1DyPEGGt/ASV94vsxc4paDGAzB6nkPl4GOgseIgRPE9UwNSbBGJi9hs4P248wb0lAh6jHWJrphoqSMWk4NUpD2xBT/Nd2FJX1u8iDPOu1Rpg8ZozKPJn+lrmga20YLVP2RUdxEEro/7wdfaz/Ridln2iOSrmjZntxJlAYPpo0fKGi02AUNHpIJ88sHMz5tbL3Y3G54Glv+bTlh2rvuEMhABM8qhC3eRixFZAz31MrSbkOfVcmqTgbVMsk+rhteVkyG6xuHm8eVSUAxciaTcpODZQvosEcomM+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSom+LQ2hgD1/KOY3xFyTW2hYyd2vO4j/9ZqnZ/JatM=;
 b=oc9d1yFnuec813kDFriXAArZclAxmREMICPeWa9muDxbJCNp32goYeG9fEBHjyK+2p3+SfxZwzpcOMjHjdwasM6C8qkUW9RoIcRwXs6MqRFK7MgXCg+lUVyt8snuHvK3gozmaESeZFG4fITbcj9lCbbHEdDQrmX79dY91dpQGzB7DtJY9iIIT8ECvjqkin3qImhG/UevlRmzTRZnIkaHWRWhKHCwnSPHH2MDkeSFGzatXFpK7ZVdTMZKgyftLWlIHd8yxDR4p5wFhWw8fLlx7YwiAj3YGptl3thsBuDp7c9XuAkXt1Q0d/wAocvYRdLu8Shc3qHmxCcrM5gBr/yWLQ==
Received: from BY5PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:1d0::38)
 by LV8PR18MB5808.namprd18.prod.outlook.com (2603:10b6:408:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:48:56 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::28) by BY5PR04CA0028.outlook.office365.com
 (2603:10b6:a03:1d0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.47 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 13:48:52 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 44ACA4186B55;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] gpio: add support for Axiado
 SGPIO controller
Date: Tue, 14 Apr 2026 06:48:31 -0700
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9F3mkC/x2NQQqEMAwAvyI5byBWKOhXxEO3jd2ANJIui1D8u
 2VPw1xmGlQ24QrL0MD4J1W0dBlfA8RPKJlRUndw5DxNjjBcEpJ2TESENZ+iGLV8TY+DDYl2z2N
 6+8gz9MhpvMv1H6zbfT+owj+jcAAAAA==
X-Change-ID: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=1471;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=Io/GMsGRNQ4Tnemef2yZeU8ouOWgdCfKz7xZ73DOgKk=;
 b=rnveu0X2ToRJZnkET/NNBaJTha2iRQu0sq5I+4fT6JVkIoaXn2Y4FaznLDrpt+vD7TtlftdZo
 SGDc+8JekKqDib6PJGAHF+eD1MVIntJJjrqGAZ5gkY6l7V0NPWQq0Xv
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|LV8PR18MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2c6c96-1040-4729-da0d-08de9a2c90b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: QzAVtDEIEZ/AAQIJCa+VrnYfG2eA02W6hQ+cDBNkt7p37YMIru+mGSJEdBeryYcS+ufwin3i4HTP3aej8usaxPwJSCPgF3SIgPOZu5XNwjBZ57cSrNrtaaalkWa67Kz2DSkzOIr3JBvymCFq/RL6FcjMVKUzt/vag0cRSV2ryMa/BougR7FZ9JAFO1nnoaQ2mjfMHcDe92J67dCLyMNehEKVDBQ9vGmSNWzG0q9kc+Wx4AduXqv2t5D0EcJVKdCbfwxY4YbF4QwxzUKGDfMWPjiFZPp7cm7J+IaAaSsrEHDbkj01XGRu4W3CgQ5ju/lhTlQJ641m8z5ZZWRi7bsVMY5chxaHWfI9PTzOHM9hL+lAfek1fBUQgxQqrT1+6934wA6VK+yD27UGZlXI53eGeH98x1E1+Pf1MLhnG9T4DWa1wF6lhi2kKjy2SSwS7pXnufJyYC3z5Nb6OXcAeix0PoqNc+jocn/Hv+rVojp0H0rLY/vrUhiE1S/lI9XhOBTN2BK1HMnkDf7MkC6LLSAjdJaZbATlywm4nmpWTLBNtj/Kj5ZN4qNVnSC236KINMRZX8RL3GjMVsS0HqWvut+qzUGjjeUOJv7Xkw18aEsPMUHAw3xM2gn9isdpdNng9yKe3RrhMKIX86Ych23Rr4uL9gFJvzektojyrY5FngCfkFPBG9BFaj7slhdkSI7GOV2h1+KgshFidsQVJ591f63jJ+yonm6SSCeJRskrM47aBt4NWr+malwOjHDI+a1Ww69PbLwoE5ZwkPO3uhyu2f5zuqmQ7wkxp93GZL8+Nu5+/ubGZxjgySouBcTc+iI0W1XA
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8bAJiByhE7wuYndQBFf5M5VjlTjgsp/W1yy7SvOXqI2lNcbsRPXnT/UJEjlH7AslgpED/0LDH+ZJrHLtqF4AuEkDU8LUK3ZPQgb8+SoCd5jC5YuTG9CsbtTKeeXsQraDxrk4RRTe9mHV2PVJQwEFvft5OizDJBEw/0h3vd5/RcDKJ5siXwqkgGZHQpyyrhkgFRJv3NFcinnPaBPT313lnRyV8IY/2+zdgarJnK4oDKS7wAEbySudYB1BTLhCwa0Ol6oYZP6IY04NO49NfSkK7nSJDcH3pQbPSvT6rqd1Q4NAc8QAJ0Y2ppxe2PH4f5gLqK/d89m7HTGj+cqmVZY5ej9KMd+T8rOvO6TeFUwLH9FC4NnsyxOUJNmswfXao6wNm8pO46s3MbGN5CjbTtxLpVJxBhmIEx8jroaCtg8j7IoEWF3wp0QDi/YtDDRHoQQ/
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:52.9908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2c6c96-1040-4729-da0d-08de9a2c90b8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_064903_688047_FC1B23D4 
X-CRM114-Status: UNSURE (   8.49  )
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

The SGPIO controller provides a serialized interface for
controlling multiple GPIO signals over a limited number of
physical lines. It supports configurable data direction and
interrupt handling.

This series adds support for the Axiado SGPIO controller.

The series includes:
- Device tree binding documentation
- GPIO driver implementation
- MAINTAINERS entry

The driver integrates with the Linux GPIO subsystem and
registers the controller as a gpio_chip.

Tested on Axiado platforms.

---
Patch 1: dt-bindings: gpio: add Axiado SGPIO controller
Patch 2: gpio: axiado: add SGPIO controller support
Patch 3: MAINTAINERS: add Axiado SGPIO controller

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

---
Petar Stepanovic (3):
      dt-bindings: gpio: add Axiado SGPIO controller
      gpio: axiado: add SGPIO controller support
      MAINTAINERS: add Axiado SGPIO controller

 .../devicetree/bindings/gpio/axiado,sgpio.yaml     |  98 +++
 MAINTAINERS                                        |   9 +
 drivers/gpio/Kconfig                               |  18 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-axiado-sgpio.c                   | 780 +++++++++++++++++++++
 5 files changed, 906 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260320-axiado-ax3000-sgpio-controller-00f6e1db6ce9

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


