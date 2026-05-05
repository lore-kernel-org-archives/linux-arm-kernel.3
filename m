Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD6CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TO7harvlkx6xP/Qrmd/2D7wgtT2ZW5k4xysYSHgf9x4=; b=JThKcu2405Wgh5
	ecvQBcFQvSFry9wGBVv7oYhe63Z9P+CkD97E3Y42lN1AAzW4AW3Dnbw/P0Omr4DlQOAXU2fR6Ue34
	XSKQf66rNOcVa4wV3siQmQWrGQVdsgGxumwJjxKAmgvRwyzYr72VK4YGLu3HFCmj5mS/2MMBsnS4F
	3oQZG5CcDd/AXnTW26BQ8Kq12b6xGrvM4iKVOBv3ZEwFJzd7IUXsqN1j7at79Kg/l5HVOCnZxk93Q
	ZBuh0nBY04772adGdwO21YTkragDzPcjdOtZ02uUOPuOo2rTkJS8vYPgPqZXM63bmUBDK/VuXTmRB
	F9BD849Ea9kqXAE3zcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9ON-0000000FJ5U-04Iq;
	Tue, 05 May 2026 06:36:27 +0000
Received: from mail-eastusazon11022129.outbound.protection.outlook.com ([52.101.53.129] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9OJ-0000000FJ3L-2Csf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 06:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cL9Q70JkoxYXAE0IRJhyX2ezOEy2nB8wLpgzgQJb4dYshXAbRfBwd1sOeLLWzJV9TEQbTlLFfKPkTotwDJYUh4et6sKUJgWgzPGqkZoHaZ4vFlBdhmKHIWEm/Z+20F3IxWXrUKx6eDtdgQ05l67A1i8CJdK+4P9Wkw8kv+IzQbsJfFEA14vym+F9462bKcC8xI2rJRYlx/JQ1y/AyAcquYQZIVy43Q+yFRPzA4KV59AH2sdvGWprZGMt6VIQ669ylWMTKQgWumjng1eOsj56TrqPDCOKzKwhYApAo3SAFnSBvxQR8MCmO1k4+S0cXIKCAH4itjXSoUY1QuRW0H6zHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO7harvlkx6xP/Qrmd/2D7wgtT2ZW5k4xysYSHgf9x4=;
 b=o3qPmTMCGBAU6eHs4/1ojpWZyp8CJwCvo9Kds9B9hcIYBd49Z3PIb23Vw8cD89m9gQ5EEdum8qXEvKox+KA0tAmrmOybVDItglNQ0XrofGB/yg2EqXgpdFe25mSFcSqwNzEo1L5rTGl9wgfn+RjeM/s5twt/gOLqtVscLiwFbZUCEjKI6fhcvLuiZDafNgShupj0PNkuQ9cFO8hY+dKw2Vssgl9b943dAGkycgYTaGYR3wzr9FFoWC/eDBBv9Xv9jQ23BWAEvoD/kB3KIfjgmLRtvBJzQiwByQbKE88AW3hpL6ua0QHYUsbZXRjBtV8fsE7cUdCVvWRl8ahtYEyYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO7harvlkx6xP/Qrmd/2D7wgtT2ZW5k4xysYSHgf9x4=;
 b=if9Mz3LRqDrafUR3EJ5E9WemsHShe7WMXCxsHYNC04qTr+V4tG/6cHm+Wsu+V6uEQp8dJtvsk1sTUYWLy9JpYhWzS5tQCjuszng04jX6b540Jt09ccQnRyeRckdD2fzYsJqwKutMadPKhIcLBZOPBvDY2ZmY5d8GhMSfN/859OlKdIrcuP7+/n45Zo/kSpbR8JvTMbHbxquqTtXvJ/fnoKnQdsZx2uysmrsQOTGxgZ9yamI4+Vx/ntutjSEPNpTv+6QS+PGFQcXVYfXBbd1P37R4qk3Nh8ScO7X6Ugi1/34au4Q7OCcjBoq/uvsPUzIAE/JMhYkq8fOXF5RpHMQoHg==
Received: from SJ0PR03CA0279.namprd03.prod.outlook.com (2603:10b6:a03:39e::14)
 by CH3PR18MB5572.namprd18.prod.outlook.com (2603:10b6:610:1a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 06:36:15 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::6) by SJ0PR03CA0279.outlook.office365.com
 (2603:10b6:a03:39e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 06:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 06:36:14 +0000
Received: from [127.0.0.1] (vm-swbuild01.axiadoRD [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id BD7214186B51;
	Mon,  4 May 2026 23:34:17 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH 0/2] i2c: cadence: Add support for Axiado AX3000
Date: Mon, 04 May 2026 23:26:42 -0700
Message-Id: <20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKN+WkC/x2NQQrDMAwEvxJ0rkBy0gb6ldKDIyutLrax2xAI+
 XtFT8PAsHtA12ba4T4c0HSzbiW78GUAecf8UrTkDoHCjZgZ424xFcdIRCgxaRaPgmD/1lraB6+
 jCvO8LDRP4Du16Wr7/+PxPM8fxiO0lnMAAAA=
X-Change-ID: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=syang@axiado.com;
 h=from:subject:message-id; bh=w4ac4Qg1lZhwimGfZE2ipoFsuKvVXSLnNmXVnH7NO7k=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhsyf/TceGzzyPtESnPztglzG05nz9DXer/A448RdsfIX/
 wGODTN2d5SyMIhxMMiKKbJ81fmWfzJX+17n3pWlMHNYmUCGMHBxCsBEVscx/JXrTjsSKH6pf9VF
 3umnIozW3LrQqntsSUPoCmOp9YXPc+cz/NONUdxyT0PpT1hHTmLsyji2ielBt/7ZRtrs3tWhav6
 3lwEA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH3PR18MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d2896b-53c0-4489-83c7-08deaa709b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|34020700016|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3jmOZ+M/QBRgBVBOQ0qGyT3lzcKlkSHqpG+X8rYq1ye5L6WlECudC/qTK0JW2oQ02PwMpKxv48BkRuUJ5psNhMuW3Iz561BzZWxyL++1X9JkrePdYjAN/2kyPgDM4IGkXiYwetV8zjLBC6diXv6cnIhsSwiXvA2OB2W39fH5jXkaDoCoRqZj8nsfgrAkRrOkkkQkE6ZBXYwSptumTPJxA8cE9q9JOhM2KDVg7Kec54qYonHMYeg14AzMFJqJ+ZevVzGFDegpI5CVwe86U3S2jgFA01TjLRCUIkAQOxNKnbHAB31Z19Ya65HbwjgXTcAeawdVazZyY/fGliu9zCSo4zJyQztbqZREASsrheUneS4yvawWiDggfmU/T8/ihVcMlYcsOKpYRs5FunEQudqCuSNgVfI7Xnsq2e+0MvPQl7LFzwllZWfMO+QcuCxyLpwrCkqX1YOqhHkD4/E/LqHXFXJXlwb/1tpASDviE0WyzSHmOR3MStxnUefo3ibsvZzNcvJBtAFz+mKUi/W+eMEJ7B6vg1jciK3dhPD/aJTJXhfAD7GW/pHe04aG4IL09sqQeu6zcibzEIbbCmk+gTaamj5pTz3TRClbj3YMxtD594as8gwX75Qaq3aBWW146rzFUg4bDR5F/stnNMZVUe3Mbheeo3czdR1uNnfXc5352Yt2ayhzFWlc9yFh1Rj1eNVL0CPOou4uUNYInKaFw9/1HQKzS9XaTtterHTT4P7FlJg=
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(34020700016)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pZ7nuFoPbVrk6Pl1CPync5muh/mLYFX2fMvDdk8SN+okguA1BwDvYK+wJgxxHhCx3rX6Gm+Cv8s/++YVJm1nPkI6nseP9wz9wfmnWvLRlnhc12P8SwycD5x5ixWV194TBoYb6Q8YfeSJPYGoTDxSmVq3tkp4Qm7/Ipk/OEKOFxp2157hsPd/HdMtjPXThxLBkvDhiv4jDvBGkSKFLI9K2pW8CHj8t6eiTQyc6T2WGkiK2O66FDJzRzQfGhlJDnTd6Vc8xMDJq2EEtX+ABzH/DcbZiTSWR4OFjL6RpN6OzB0XVr3kBZX0lpdNFkPkEXn4KaOREfGfL48XwNY35VXDM59A5E9F1TxQVZe+ISebGskM5L8A3OL5fOV6ZinXyeES58G5QmyhArC8VSAcNQxSCAmCBkcXhtq4HsJPjEuXZ9ptpXCr/iRnTWuTqkLDvgyk
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:36:14.8835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d2896b-53c0-4489-83c7-08deaa709b28
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_233623_613849_3DEE0F7C 
X-CRM114-Status: GOOD (  11.84  )
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

This patch series adds support for the Cadence I2C controller
integrated into the Axiado AX3000 SoC and enables SMBus Quick
command functionality.

The Axiado AX3000 utilizes the Cadence I2C IP core (version r1p14).
While it is largely compatible with the existing i2c-cadence
driver logic, the AX3000 hardware specifically supports SMBus Quick
commands. This feature is currently disabled by default in the
i2c-cadence driver (masked out from I2C_FUNC_SMBUS_EMUL).

To enable this functionality, this series introduces a new
platform-specific quirk (CDNS_I2C_QUIRK_SMBUS_QUICK) and uses driver
match data for the "axiado,ax3000-i2c" compatible string. This allows
tools like 'i2cdetect' to properly scan the bus using quick write
commands.

The DT binding update follows the recommended fallback structure,
referencing the 'cdns,i2c-r1p14' fallback to ensure compatibility with
older kernels while allowing the new quirk to be enabled on AX3000.

Patch breakdown:

Patch 1: dt-bindings: i2c: cadence: Add Axiado AX3000
Patch 2: i2c: cadence: Add support for Axiado AX3000

These patches are expected to go via the I2C subsystem tree.

Feedback is welcome.

Signed-off-by: Swark Yang <syang@axiado.com>
---
Swark Yang (2):
      dt-bindings: i2c: cadence: Add Axiado AX3000
      i2c: cadence: Add support for Axiado AX3000

 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 10 +++++++---
 drivers/i2c/busses/i2c-cadence.c                          | 10 ++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074

Best regards,
-- 
Swark Yang <syang@axiado.com>


