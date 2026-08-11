Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12970C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaWMG6qG0AoJfmw+GusTjDXo+UgHIcucLwKvmhwkcCY=; b=M7Qe0SCsMJQzuh
	YVHKAh6j3eU7WE7vvPGO7vdg1SPz3UuRbL/j8JktZndjhRQyNjDAnVnB1eeY0FHlFqJXOW3keFF2c
	c/M7W1IgxqkA/56lPqM0ZSC091lEfGhZRk7cvRJVfRpoNC48C85Djr9P2ZR53Ac1rea48MtJsQRXd
	jmqY5XVYPyYOwt18agqN8UFVRlYGMMPTCrVoJgt7be8HHqUvSH0CoTyxs86BExb23N1mvQd41MD+m
	DXQt/yl6OycU8ZY5LWF8aPitfr2PWoslgQ7cqA9HQGbLOGthFX5TRmUDEK1amlVcjmM9SdpcK2tUL
	s8lrTU4F+mopIOaNwK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiNl-0000000DgLP-3MFl;
	Tue, 11 Aug 2026 09:02:49 +0000
Received: from mail-westus3azon11021088.outbound.protection.outlook.com ([40.107.208.88] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiNi-0000000DgJm-3XU9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ResyciNWVSIBqs2pqJkmCJl5o6UiqTjgTGzwKeLl3i8V5Ppo8b+r2MFo5eLdQChkIHWJFhxtT2qwfVqGIfjejrcVJGhrPcM1YivvjO0O7D03jBjte4SDc2VJzItMEuWPOo7ODr/zgxzsYUcb9j7TRYaIiWLRMKZF2bqkc0TdoI3HAIbFvpvAWuSqKbo3wdjfzfXVBZWh5Pfs0+RkaipDDE77irqse65t6Yi2tOEFyI9KsZFFaGXiAQAD9I8Rhh+iwciZlLJHGneJleyl/XaXrkW4jFvnXjsc3Dm4boJS3wU9ny6IdC0fq/o0jBrt2ZN75BmYcDD5r6uP8WBV7wjNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaWMG6qG0AoJfmw+GusTjDXo+UgHIcucLwKvmhwkcCY=;
 b=uUfyI3mpi2MfKP7FnePZOzQ9yif4PoXYyXS15+dSASiX+3y1XVB/lWvP61q0J3E4uNS2lGrsSZuZrdaDml5t7XI5OFRDQ6nRTeNaOAEp7/LDb2PvxojwtRAoqYIC/fk73sy5Z9oEie9lCuA7UXR3AQsXferU9wfDO5LAhm+i2wjM756NkV66kXyXy+hXe7Gw/YDqa5+RsPu0mJDlM1JlGFQUWkq21ZhuVlJloVQmZKau0sVoXGauu45AoJJrGcQGkWaEeUHv9BeIWn1Zu/tHtrx6KvR0RriIF47Wg+e800HX/S/yFf+staRynHY2PSZvLSUX1a5c3H9t3CsHhv/Upw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaWMG6qG0AoJfmw+GusTjDXo+UgHIcucLwKvmhwkcCY=;
 b=u9uVI2b53wfoEE+iLv0xuCcSeHSdGSpzqjvVb5AF99bbxnON+CrK+fkPC5jvLkKTZMRd9iuCiHdkGsJKCE9nC/eEKWgg/XhwCfjjviUNam4+SE6zRIykcX9f5uuqyLyi5VeKAroioFX3VmNwnHJGrh4wGUZCGW0O/kMG5USxOS3N9HdR2JV2e883SzW6s0545aqJggkHIBdkDO3qWl4ivG4kTAemqJi7K8lb1yzVWQ+yt6DKOF5aL917pN8lslBcqbgec26wc7vDeNuyEedqlR8Qu6no0YF7ANbYJnzch8PnffYZ7Ro2h9NxIRI8CZoTVFFFbS9E05UBdFVX+dRAfg==
Received: from DSSP221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::12) by
 PH0PR18MB5211.namprd18.prod.outlook.com (2603:10b6:510:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 09:02:32 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:8:3d5:cafe::35) by DSSP221CA0012.outlook.office365.com
 (2603:10b6:8:3d5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 09:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 09:02:32 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 4E3CA4157BE1;
	Tue, 11 Aug 2026 02:02:31 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v3 0/2] pwm: add Axiado AX3000 PWM support
Date: Tue, 11 Aug 2026 02:01:49 -0700
Message-Id: <20260811-axiado-ax3000-pwm-v3-0-6ceaccd812cf@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP3kemoC/23NQQ7CIBAF0Ks0rMUMA5biynsYFwjUsqg0YLCm6
 d2l7cKYdDX5kz9vJpJc9C6RczWR6LJPPjxL4IeKmE4/H456WzJBwBpOrKF69NqGMjgA0OHdU2O
 l4aJuhGoZKXdDdK0fV/N6K7nz6RXiZ32R2bLdtHpXy4wCNUoqqRUowcRl6xxN6MnCZfwREvkeg
 YVABMAW7tgw+0fM8/wFbCJnevYAAAA=
X-Change-ID: 20260518-axiado-ax3000-pwm-cd7c346849f1
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Petar Stepanovic <pstepanovic@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786438951; l=3694;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=qtPLEdR45LEo0wZaU0U4sHX7g0VBI9UC1fT2eMz5fRk=;
 b=VEfYGiIE2wlausBpJI/WVPxYnNnB6DYiFIRV35Lyvtm977RlsjtctfbuF8poDWyixd93cpFQK
 dGDqSshxQyUBfl5/QDiRcDdi87dj5s34G4iqoEkTewpY6pnZTeHuBVm
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|PH0PR18MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbf2e7f-a770-4eb0-3409-08def7874744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|56012099006|3023799007|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: RC/Afhs51ejpl5Y6KZlEnL5+Cy1oOQJkA/isRvcZMwIJfZy5hpKWiP5hI0yp7fECku5mIG1OJc2fQOKrCD/oBjB12O1zeTtu3g6MhW7GJjOreScATQCZvHkhDwDcGrvCKjOLi/UnNUegkHZCy4KQMQbZGYqMJYhv9TxqJIWs93tcZzCab9CTst4vmW2coCUmO0s+0qZr9p9KbMIQ8BAW9pcyX6Ls04h92JwIuDDdDTLBVc+1FYMWSgsSIehhycE7fRRqDl5jhFPxQzIIjZ0sCBWLut6SrY1SrSupJ3l9wSBlbuh0xjOIOp+66IXxRVL58fvx12DLLn0QHe5owhRvBxP4bwRd36XuPnI/TSzDjqUk3O9s/+EVo6bx4anY2POiiOYBPW/Deu44oA8Xa+ORGrpDU78YtTxTh4xT5enZFwT/GwSDz0B5Xi3JTf0ZWughuASELPJm6399O6h0ZoKKaxWF2xWdFmTVpmP8DyeqUAMD/3ZydXYjP96aizHWSe5l6G+SGfiLf0OWYevzyJKonZfBWXx2R4Iru4SGBhJmdHlsqWHwIhlacP4PBwT4d8SQhyiGNg7z/SXRXEUTHOIzQ9S8PoEAlVJp+AHvqHbGt9uEs1/hkSM3Kvt9jb8SW0gmx582JEFY01LkCMFJbRfXBw==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(56012099006)(3023799007)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cI7p1tB1GyeNA/kTBe42MNGnE2lXbNcJ+HbBVlqTgY1E8uci46lKAv8Lq5ToRHsXu8h8vwoyc3Tkx2x3G0ntHWXAZKGyHHxRtkxWqe7JWz8pkck7Q5kOtZrRAnMgaA8oWgwZJPcflqrDO/JF30Ck5qBaoep5cugPQZEircOX/LRYbtKqbMTNIWvdq8GqWPoMW6+FSnI8bpylSdx//TxgYVBMVJmYmuw3FBfbemqY1NbQyJkxXs4cpU90No1Hig55hBJJipwieehRhHO1UbFKuB0n/d0oXjJX9mLHowY/sOIk3OHMB60SXyn3nrvRPkGPQJW292uU0mHl2jCwoiDPqyWw5z14143Xny7oG2OYJiwgDFRcVPkDpatZWxqJEgSL6Hy4rr8B16aW6uKUaoE5CqaHblExGIwblAHJZDsHZb9T3SujA0ssbVyWXZzM1iYK
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:02:32.0221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbf2e7f-a770-4eb0-3409-08def7874744
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB5211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_020246_890723_46085D39 
X-CRM114-Status: GOOD (  16.94  )
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

This series adds support for the PWM controller found on Axiado
AX3000 and AX3005 SoCs.

A new driver is needed because this PWM controller is a SoC-specific
hardware block used on Axiado SoCs. It has its own register layout,
enable control, period configuration, duty-cycle configuration, and
does not match any existing upstream PWM driver.

The controller provides configurable PWM output signals. The driver
exposes the controller through the Linux PWM framework and supports
period and duty-cycle configuration.

The driver converts the requested period and duty cycle from nanoseconds
to hardware clock cycles based on the input clock rate.

The datasheet is not publicly available. Public high-level product
information is available at:

https://axiado.com/products/#AX3080

The register definitions and programming sequence used by this driver
are based on Axiado internal SoC documentation.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Changes in v3:
- Express AX3005 compatibility with AX3000 using a fallback compatible.
- Update the Devicetree binding example accordingly.
- Add 0% duty-cycle support using the hardware constant-low encoding.
- Cache the rounded period for 0% duty-cycle waveform readback.
- Allow sub-cycle duty requests to round down to 0% instead of rounding
  up to one clock cycle.
- Normalize high-time values greater than the period to 100% duty.
- Drop the redundant AX3005 OF match entry and use the AX3000 fallback.
- Clarify comments and PWM hardware limitations.
- Link to v2: https://lore.kernel.org/r/20260723-axiado-ax3000-pwm-v2-0-22002f0b281d@axiado.com

Changes in v2:
- Migrated the driver from the legacy apply/get_state API to the new
  waveform ops API (round_waveform_tohw/fromhw, read/write_waveform).
- Cache the clock rate at probe and lock it with
  devm_clk_rate_exclusive_get() instead of reading it on every op.
- Improved rounding: clamp period/duty to hardware limits, reject
  non-zero duty offset, preserve exact 100% duty, round sub-cycle duty
  up to the minimum.
- Added a "Limitations" comment block documenting hardware constraints.
- Renamed macros from AX_PWM_* to AXIADO_PWM_* and dropped unused ones.
- DT binding: dropped clock-names, made #pwm-cells required, and
  updated the description and compatible list to cover both the AX3000
  and AX3005 SoCs.
- Added axiado,ax3005-pwm to the driver's OF device match table.
- Link to v1: https://lore.kernel.org/r/20260618-axiado-ax3000-pwm-v1-0-c9797a909414@axiado.com

To: Petar Stepanovic <pstepanovic@axiado.com>
To: Akhila Kavi <akavi@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>
To: Uwe Kleine-König <ukleinek@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Harshit Shah <hshah@axiado.com>
Cc: linux-pwm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Petar Stepanovic (2):
      dt-bindings: pwm: add Axiado AX3000 PWM
      pwm: add Axiado AX3000 PWM driver

 .../devicetree/bindings/pwm/axiado,ax3000-pwm.yaml |  53 ++++
 MAINTAINERS                                        |   9 +
 drivers/pwm/Kconfig                                |  11 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-axiado.c                           | 310 +++++++++++++++++++++
 5 files changed, 384 insertions(+)
---
base-commit: 368d34807e6d04bb2089918383b58abf40e720a0
change-id: 20260518-axiado-ax3000-pwm-cd7c346849f1

Best regards,
--  
Petar Stepanovic <pstepanovic@axiado.com>


