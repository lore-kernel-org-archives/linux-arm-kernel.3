Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E419EB104A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NVFUjSPLN71tAt88lKiU/yqfXaxOoHb9pszSaHhLjrY=; b=eErf6gu+75ajiOADd6Uhtgahp7
	LUkiK/cu+5VErWIb+HL/JiOrWqhYbLdDNfOovEvgC7lONLXGDGFBffaXZH6VJ/hEyTqJI4xVKCWVR
	fGfsAD8F9CNAZR+EUiJ7Sy6M8mqpwiI3JvXp1ewX77GpwMJa8CQ3z083CieCMyciQYSz81fg52wLk
	M68jIMeYvnNH6O71/lhHDbRSCgP2k6/a9dcNshx49TKucdTnF/n1GBh0sfUSuR6mYt6aAGzwrC7nu
	u2sJ7m8Uzc2I0kfOl3J5aobqCZ44fb+rWzkbfO0gz4pBgm3GcmIDIo1B6ZffDanlMJmXq3hp2b/QY
	LxRccj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv79-00000009Gca-1yYY;
	Tue, 10 Mar 2026 11:19:03 +0000
Received: from mail-southcentralusazon11013066.outbound.protection.outlook.com ([40.93.196.66] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv76-00000009Gbh-3vdt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8dAr0aNWZO0aT9cdbJ0eThB6EeBS3XqH1LLysfXoB3mehjV7Ot58b2gfxS+zKPOM6B9fAlqSo4EIv3JfzAORYy5ko7sMCj4VjAS2UFUK4q9JmeKam0t5wjPx106I0FDzblvGpDOsXPMzCzEnNORRSCWfoPsilDZs6Q511iXCl/WE/zspyK2a8YAVDswxx+O8j6J0EcmjY96zHyYCEEo5qnnOY9Kt4lviwkqyZLExNx55w0OoT6AojGXqAKsXeXPHcJtvqTV3GVXeI4h8i+UeznHnWMgGwaW12JveTX0Pv6KVx/okZMM1UUU0smutyIfyeTK9HwtYK/ZMrEj1Nw1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVFUjSPLN71tAt88lKiU/yqfXaxOoHb9pszSaHhLjrY=;
 b=ysyiE6b+ZX04XF/hhyA1r2Ft7Tc7kGfA9WmTwyGrBxLcgQNisyZ8o79vXr+YCaIDECZBcSWtuZMGs1uEmsbuG+JMqOg0oj7iHU2Ti0wvEXDJ9raZwmQvMWCXMZPhJZ67F9E6qyD2NUhrNNTrUM6XKO1p6efQNFbmkjC2QnVUPA28tZBwL6MOsCLwuB0tnhkdhYBd+nDnPd4hqF0ec+iy2irVdAg4peD+ZUe2BDT6cTawDPHBpKEMQw5hRvsRGetISKjaluKj9gbsi3hkht5ma5ma1Mgy6zUEmU392XmJiBwco+zZd3WbxJ0jbwuzrI/F83xDJT8CFclAF8ZFxlcP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVFUjSPLN71tAt88lKiU/yqfXaxOoHb9pszSaHhLjrY=;
 b=gKr5De/GoCfiO6/pfIJhcKJ83GVXn6QSA71/jW6uqg3QEDXtCGpM2O94iaXestaeBCbFiyc02iulK5VEfL1RfHVdTeDU+g8WP+ACoLX+aIAlNdDRa8uE6P6ynK1kR34r1M8/7ENxLEP1UKYAMRp6V5mfYnd0mRbKhbOlXKqW03E=
Received: from SJ0PR13CA0064.namprd13.prod.outlook.com (2603:10b6:a03:2c4::9)
 by BLAPR10MB4995.namprd10.prod.outlook.com (2603:10b6:208:333::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:18:56 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::41) by SJ0PR13CA0064.outlook.office365.com
 (2603:10b6:a03:2c4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 11:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 11:18:56 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 06:18:55 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 06:18:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 06:18:55 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ABIm7a2963300;
	Tue, 10 Mar 2026 06:18:49 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
	<khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
	<lee@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <s-ramamoorthy@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <d-gole@ti.com>,
	<k-willis@ti.com>, <a-kaur@ti.com>
Subject: [PATCH 0/2] Make TPS65219 poweroff handler conditional
Date: Tue, 10 Mar 2026 16:48:44 +0530
Message-ID: <20260310111846.1084623-1-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|BLAPR10MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efedabc-e825-4b8d-dfcc-08de7e96d1b0
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|921020;
X-Microsoft-Antispam-Message-Info: gXcC5yqe3iGsDAvPKIWqfPq+dy2rju5ryJzclhpYQhkA/X4xEm/whp0GlrYT1kFz3wa3eqY1mPVKYoznU4vbv+9UBYXoO2dGkQqvJtDg/Etptdx/pMu5bBJE0GeQV6FzGt7aAhg/pFhFCxbLmMjG0PUjlmEi5H4E3Bp4piOLSQnwICc1pdV+hYlhwlRE0dMAsiuTc0I941maHqgokml6rXeCMBAoc37KX9Yh4k23kKGFNCkP9YqdJBFiFOpW/lp+iqVc5f9bBNDHrg6Bz8pY8h5p5zsW4jrY2Q4A4g0hvAvQUzBsjVMfKGBS75YP3xlKNpeAaX1n/W3NDNv2yen6Gv4qr13zD4sPFZJgxgZCV2ROYXqxwKyvWuLmi+bMqHll1LrTnkSwWRjSZc7ls3y//bMqqQarsLYQMnjvNYSIy2w5li4xEn2bvI6OfEMO1uxoMntGPs/IjAtPJAFDZgTUkZ7MA6NWAfulRkEzRIQfs2eiMDUmNfiBRK9N7S99bmeCSO1ZdIxYJwjmunFil6N6p9wGIt+0DGj3wn8dFAxUXQi3+0cUpF8tYFFpzPsi/ZF0b4ISTHIM0sx1GqwDGzhJDSfezoagJutg2Xp9z8mm/hp4dzm20PAhp1urs7Q1zSaIsIoEw0bTeQMBpnITzn9u2DQ+JnTDletQkOt4O2bCiD0nEyxt0y4shUnNf38xsGqvNlfQvBXFWFn7RC+aJ3EVNlAZX+8wJiZFGFNaeqY+zgMr22MSXWY06DLbGtlejhdBq+Saqw0nMWLra8HF6okc0MR/o6ek91vogCCR9u/vCZxVHfd8rn8NtOINKoJieVsT
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZZ9RC4WwB8gm8zym61S1bbX7G4uLaJJpI1P6k3UJGx+DFE6t9/2UuuQX3rF5zhNvJEEo3DjFyyq2844GQt9TjhtD6OR80xJCrKJd0UUJATN0ZKgwNg/GcT8d6RTawxq/+CtZgZ31ZBe0oKO/kyhCZK7of5UOnt1EyJjMrqcnsTATxxk1nhvL64TfbVvqzdFp9wCpT1FMQsvq3LZ2y1eCnc192VK0D8VV2KAA1Pk2dhIIc0TQ21WF5wxwcjM2OPvZX5zT48JaFVw5KKv30/gSys3VigSi4r2ceAt9YAqPLdMhvYy8PQRcbcQ50/8OIcE+TPfM5i4BT5vjDBf9WM8KqAt9imH2Y/qiT9xh33RRiwsHhtpypLZQAFVrQ/1PC3RCInxNoIcK0nl7xOau0mHJkA35dIUtM98GvWGYe6etyy4p5HZjf/hPAZHbgXyMfjg1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:18:56.0130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efedabc-e825-4b8d-dfcc-08de7e96d1b0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_041900_974975_05BFF506 
X-CRM114-Status: UNSURE (   9.31  )
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

This series makes the TPS65219 PMIC poweroff handler registration
conditional based on device tree configuration, following standard
kernel patterns.

Currently, the TPS65219 driver unconditionally registers as the system
poweroff handler. This creates conflicts on platforms where alternative
poweroff mechanisms (such as TF-A firmware or other power controllers)
should handle system shutdown instead.

The standard kernel approach is to use the "system-power-controller"
device tree property to explicitly designate which component is
responsible for system poweroff operations.

Patch 1: Add "system-power-controller" property to AM62-LP-SK device
         tree, explicitly designating the TPS65219 PMIC as the system
         power controller for this platform. This property was missing
         only on AM62-LP-SK among all in-tree TPS65219-based devices.

Patch 2: Update TPS65219 driver to only register poweroff handler when
         "system-power-controller" property is present. This allows
         other systems using this PMIC to use alternative poweroff
         mechanisms.

Impact:
- AM62-LP-SK: No functional change (property added, handler still
  registers)
- Other TPS65219-based systems: Poweroff handler registration becomes
  opt-in via DT property

Tested on AM62-LP-SK - system poweroff works correctly.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>

---

Akashdeep Kaur (2):
  arm64: dts: ti: k3-am62-lp-sk: Add system-power-controller
  mfd: tps65219: Make poweroff handler conditional on
    system-power-controller

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts |  1 +
 drivers/mfd/tps65219.c                   | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.34.1


