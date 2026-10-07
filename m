Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBE1CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T2fDTeShml4o5tRtUIxHrb5fxi9zBJPnQi14MfVcMQQ=; b=dFyZCXSFasw3us
	fznC7W451kcTcQJB5z4fm/9gYUsvhj8KELwjAvjTwO8VcK7Zfcb8En8ZvJVu1aw/YFtqbkuPonZhW
	RINT43oNivXxm8wB2/F82Qc3wTTl/dCpPyKqw8GYV5rwD5MEI1lWDSpctdckiMsi2y9NiIcQxCyPv
	dO3WPRpHhq50IzJ2WO8yj8+oUAxgAGdFi68/Rq+kx3IgSIEbJ3M0hckQ09QNmLJ5GjZ6IaKOvp1aK
	p11eZhIvLEnE5UXTSrpGJZcLC6S0IKJhxqpWZ44fFbILwEFQOr2TEkH4BIYeBlEkjV/QLG81y8MRP
	nxR7yKKTrVJiEI0g/pKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENcp-000000021RP-2ttP;
	Wed, 07 Oct 2026 09:07:47 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENcl-000000021QW-0a7a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 09:07:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2j4UXjllq4dTOwpt2lQkO5OIG02BI70tlDa60hkJpRKcT4PUrl28SoP+xWYIl1kyvE2FbRKTGFaOvOTE0bXqRCNCapGLDfvTRK9Ocis8Uq94hRnpGw6JLs7TFrCuB5ynWQtSu7CYD2/dSybrYDXeuJD3Ka4RePSdcQ/q5bSbIsLTxYgStnKwzii8opyP/eLYEk6s40YpJc3iib9MUkJCcLqi6cz+B4ckSXpjl2FBMfXtVWKQ2nvQR+3FaIq7fN7bw5SNLGbdmEhvNt7+cxGS5iOj88JhWqHFiN30eil6LDG5j2Pvr64YCOyRKkEjlQ2e5zw7vGpaI7b44u7+tkzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2fDTeShml4o5tRtUIxHrb5fxi9zBJPnQi14MfVcMQQ=;
 b=xs2ZB5ksbeLlg9ZH7WLeao9jQ4lg3gLBzS5cU+6tPvmLvtmpr3xRSSTCWlec/NYgdV4mfs6KL3tcBeIM7p5N4XF29L+JNoH2PMEa0l2Cg22n8hsLHU0Q0bozLW29sir1U3gKPVP5IFdmyhAJke8gyfSMgGDdgpzYJeRYrbY0GBJA7Cjbl3RD/EqCjeZE3HhLDl2Qke4rNpYLnQwD+Zc45N/tX76VBFI5fwXjiPI8EPRbG3tZP4DCgRuxHzEuReXpfzUn7s3l5egDVFQI1jNYVHUnwlUccszILpFCmyrA8qB7mA8vi9TWs5NIA7EWA+LRLddaM4O1sOeM5MS663lQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2fDTeShml4o5tRtUIxHrb5fxi9zBJPnQi14MfVcMQQ=;
 b=psm+kdWeUh9FK3OdPHe+lXRt0LjZepexps7AuJful03vzmlXw15lWUOoylhdF3oF0L5PPhmIJb6kqFjPzMZGDach0gKnb1Sg7a9OzD4+eR9ipcge/P4E8V3pMVRNSAnCCVjRAHJD/c0bKBksLrTbNR1Py449H1sD3nGANF6xTEU=
Received: from MN0P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::17)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 09:07:38 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::1d) by MN0P223CA0028.outlook.office365.com
 (2603:10b6:208:52b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 09:07:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 09:07:37 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 04:07:26 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 04:07:25 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 04:07:23 -0500
From: Meher Thanmaiee <meherthanmaiee.vanukuri@amd.com>
Subject: [PATCH 0/5] Add PWM support for Cadence TTC
Date: Wed, 7 Oct 2026 14:36:58 +0530
Message-ID: <20261007-cadence-ttc-pwm-v1-0-52a95a8d98b1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMLxmoC/yXMQQqDMBBA0avIrB2IoQ3qVYqLZBzbEUwliVYQ7
 26qy7f4f4fIQThCW+wQeJUoX59RlQXQx/o3o/TZoJU2lVJPJNuzJ8aUCOffhJqGpnYPMo1xkKs
 58CDbdXx1t+PiRqb038BxnNLW8pVzAAAA
X-Change-ID: 20261005-cadence-ttc-pwm-2cf98b4c696b
To: <michal.simek@amd.com>, <tglx@kernel.org>, <ukleinek@kernel.org>,
	<daniel.lezcano@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, <meherthanmaiee.vanukuri@amd.com>, <linux-pwm@vger.kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791364043; l=2920;
 i=meherthanmaiee.vanukuri@amd.com; s=20261007; h=from:subject:message-id;
 bh=3bFuESyt7Y6Lw8Zx3mHhhIeQqH12xxtHz2ZXk8hUNeQ=;
 b=3MgJb28bmZ2OQY8JRvIHo7KAv+S1NECKz5++dz1h2pA+BykNXSk3AahH9Uoof1V07FDL87GnL
 qCFKp8sE7CuAj/ABFF71cvGaqEpVpPxC0LAV9zGj9/zO7Jid6c5OcV8
X-Developer-Key: i=meherthanmaiee.vanukuri@amd.com; a=ed25519;
 pk=m/+ON8/+ewj5VLb55p7J9gAopkLKj2mp7iobBZdhi0Y=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 27beb301-c77e-41d7-aaaa-08df24526ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|10067099003|11063799006|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: YAmN1fFIsGdHwVCRwY8REPpmKVHAptqLj5ay6dpon04aj7YQBTCU81jHTMQQGJSuexCJQYda/WsxY4YumVUA3jemgT/VDvIjqebyDQc5l3IOOC1SPNlEkDjxxr+0HhUJzsV0kZMo8lhe1t7NU3J61kIgXAtsFcJkz5y/4g/BMGeN1+wSBuzCT6XQEbp9A1L0jz+8CRv5u+I7cSqUi8RKHgKbEEsYOcSlQe4WbH+D2Kwi0JmxcfhlFg+COPTQLpn31tcqGH0KBt3KbTdlm9F9w47yRmAtn18XXXos/wuThITmGpUTR/fX51g2WGzGiDa/ltEMH5CiOjDWi/SAxF0XR52QgOPSYbnQIp6Y9gqhEZeQYnXLijn1sp7l3oR42dXDuxitERL9G9mkO+z5GJqg6JhU+3vClizbgOGF5DqQTlHadbiRHhq+bfCQuEIBDIXTYg+BSvl5lM1C2BVh3WCoJjAcjmUOBZulWZrLqSbxH03fPjWMGZPUqQa/6IccBPatlWfjW/A0sgL2XDtG487j7sqLfGOyrqIiGhAkcpjqibSTPBZd4XahRi9IG+BTUW41IX+f8qtButRUtNBzenD47/AWGWAqi6FbcR5ss/3RCqVPg/oI1e90oREfWlwSMrztPcfgcTox2SljWQxgtZKyCOai+5fh5T25LgYiVPe65odOH64Q0sVvp4wbK2IYqrRwMci5Jnuf9IgsY42GjwNfoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iKKB+kuTKQw7JKdPGFnp5TRAsFxgELK/OCBWCe4P60ltMjATEJDAm+3I/OdgL00Fqiw/Y/W+iIphN4X/ra9oGG/bG4FcVcUToNcBxSvDqMXqFlLPoR+87ikszt1Fl4CLjnaL/ZppjEAUxiCy38LR6bUrn9LlKQ3glPViwq8C3koxv7+onbBiy4wKAWZRVYcXuO8ovdA4RxcC6/+T0qgqpUcsojf2e3pzMbfxVlxA7665EWXnx5Xb5yEHZ4hivR9IY/A/8WIYo1gAkE/z1oIVlJZs17VBw0Mf5K42y9Sia8oPm9LFPObZa1lKs1XygASsVRnLBeZi8lvBYZ7AZRtrlw5VKxPLpfFkverSvXFsuJS/mQzPOBOBFCEhm3xo2D+oV0N1jiF8+MwyrM7AVaunDmzxWgJLc2Ye4qSZhi9sDAdi/anNd5I+OLP79ZlJMlWw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 09:07:37.7026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27beb301-c77e-41d7-aaaa-08df24526ef6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_020743_460262_EAFB9F68 
X-CRM114-Status: GOOD (  14.53  )
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

The Cadence Triple Timer Counter (TTC) IP found on Xilinx Zynq,
ZynqMP, and Versal SoCs provides three timer channels per instance.
The existing TTC driver supports clocksource and clockevent use.
This series adds support for using a TTC instance as a three-channel
PWM controller, with the interval counter defining the period and
the match counter defining the duty cycle.

For TTC nodes containing #pwm-cells, the timer driver creates an
auxiliary-bus child device instead of registering the instance as a
clocksource/clockevent device. A separate PWM driver binds to the
child and exposes the three channels through the PWM framework.
This reuses the existing "cdns,ttc" compatible and #pwm-cells
binding. Nodes without #pwm-cells continue to use the timer path.

This reworks the earlier TTC PWM series by Mubin Sayyed [1] and
is submitted as a new series because the driver integration has
been redesigned. The earlier series called PWM probe code directly
from the timer driver under a CONFIG_PWM_CADENCE guard, coupling
the timer and PWM paths inside a single probe flow instead of
using separate device binding. During review of that series, an
auxiliary-bus device was suggested to separate the timer and PWM
drivers. This series implements that approach.

The first three patches prepare the TTC timer driver by moving shared
register definitions into a common header, allowing deferred probing,
and factoring out MMIO mapping and timer-width parsing. The remaining
patches add the PWM driver and timer-side auxiliary-device support.

PWM support is limited to TTC instances whose channels use the
shared internal/reference clock. Instances configured to use an
external channel clock are rejected at probe time.

[1] https://lore.kernel.org/all/20250115113556.2832282-1-mubin.sayyed@amd.com/

Signed-off-by: Meher Thanmaiee <meherthanmaiee.vanukuri@amd.com>
---
Meher Thanmaiee (5):
      clocksource: timer-cadence-ttc: Move register definitions to shared header
      clocksource: timer-cadence-ttc: Allow deferred probing
      clocksource: timer-cadence-ttc: Refactor common TTC resource setup
      pwm: cadence: Add TTC PWM driver
      clocksource: timer-cadence-ttc: Add PWM auxiliary-device support

 MAINTAINERS                             |   2 +
 drivers/clocksource/Kconfig             |   5 +
 drivers/clocksource/timer-cadence-ttc.c | 208 +++++++++++++++++++++-------
 drivers/pwm/Kconfig                     |  13 ++
 drivers/pwm/Makefile                    |   1 +
 drivers/pwm/pwm-cadence.c               | 231 ++++++++++++++++++++++++++++++++
 include/linux/timer-cadence-ttc.h       |  74 ++++++++++
 7 files changed, 487 insertions(+), 47 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261005-cadence-ttc-pwm-2cf98b4c696b

Best regards,
--  
Meher Thanmaiee <meherthanmaiee.vanukuri@amd.com>


