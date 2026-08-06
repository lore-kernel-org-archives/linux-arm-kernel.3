Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3A3C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rp6JZ2VZMu6D7qs8xPRngx/HR+ZmZziCVMPQ8iG3ozM=; b=I+UHIkAeJtkiyn
	V9KIMVsXYJaCvHz4FPUeZKeGkbMoOrUS/XI+vf1/KDVb38cmMelbHy23LNr9gX54x5olbskOo05Ih
	HRgKLgRKVK+QodVzPKpNyRh3AiGbntkhfX6jDM1NIXz1NYwsaMEmkqxKzFQJQomgVwVTyCTXeGU8C
	uqDY1wZOSgg+YBMUjir1ZrcQUtYTl2350y1Lc/cAx95hHbum6CrtDxs8NWKyluPZhfrgw7f4HOb8J
	GJV157QgpYmwLhc9zYQyQ2KRlSviNzEGLf92spEncb+jurqWuNgd1j7eRLeyRp0npd/3uGjxLRxYh
	VW/K61xPTOU0BMJd9BTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtyz-00000005KD0-3khv;
	Thu, 06 Aug 2026 09:01:45 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtyx-00000005KBc-1blu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyoqmN+z1dPzmmsLPVXfjPGTN7T867p3ZEBhQ9Z1io3kIYWviXvym9gKm9Ia9ZKlrG7UBwDYKDV3kuP2aDT8XSYsExOBDYXie1TDnrSZLb04NSxOZJvzt7IcvXRRgRlUM90MrUcsJCAWhyyCeON09KLV43HY/hE+73TMqSNeGFTHj7DgYzLnOD0WfflmhT6oS5utqoIwFHmkzSbX4MuWBplBORhTy3vV5KsX6WTm/WRJ3gT/i2GHg13r2UppP3zZdJZ1+78VHxUaVOwxwcV2aqDglhCg/F+/kcbht+4oPZybrAgtMhvCA0fwyi+PYTmIHqrTmoDQtf2UHHR9ze0bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp6JZ2VZMu6D7qs8xPRngx/HR+ZmZziCVMPQ8iG3ozM=;
 b=HmncpdBw9vag1YJv7nfS8hhbrrS9Aozbwq4XhmPaDDzt3NTuTotnw+k+LHaHWgzuozQnoaUHijmxJxX0x9gAcZcyh7cmKFv7sTzr6BMRerryE0eQ5rrgTvlNfyYJUmWFnFB4f6e+sUlCWkPWkYPAvyUALXYUCLeNAyFIudkx36ROAzx8PioOWVY31bYuk8pmO/STzjbtRPB9bzM/puM3W9eHsQleVdZaB5Vx+6lTnzhE0oci5SPgrVJqeOjxuXXbqSVsMDynuaLjwmqzMRZainZOufOZtf5LHfNMO9S+SeKXSezfze8kF4uUQk/NS7+n4fi/8SL652s8PiRs4/Sueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp6JZ2VZMu6D7qs8xPRngx/HR+ZmZziCVMPQ8iG3ozM=;
 b=XYXLBAtIVkowZpNbVM9UOLANOZS8u5OeL+hxPqLFLFRgI/917pvSUkZppoEZ8Xfsw22dRll3+d9n+5jiH5mfU9QQo+RnDzXvAaGBkk2LH+UO5A2dqeQFUGU3DtXDQqL9Nx7pa07UerX1wcTp2ap+ezq36bBqGZsVrue1y6K6kkCwWWFHOy9Z6kNuVPopgbzZCnFSUd4c75j602kmi01q5Xzu9txYE+bED+EmbrO9UUANMW9eFmhvQ7JEyJODkLmxSRzOu7yQPal+DNFN7bHF1kBkgVD2VShVaxOu4X+jnmi7Q0CT4Ftz9Ie61aaGJGvU9d+J4NUZA15OT/4zfKuBOw==
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by BY3PR18MB4739.namprd18.prod.outlook.com (2603:10b6:a03:3ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:01:35 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::4d) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 09:01:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 09:01:35 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 77F064186B53;
	Thu,  6 Aug 2026 02:01:35 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH 0/2] hwmon: add Axiado AX3000 and AX3005 PWM fan support
Date: Thu, 06 Aug 2026 02:01:28 -0700
Message-Id: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhNdGoC/x2MMQqAMAwAvyKZDcQWi/oVcYg2agartKCC+HeL0
 3HD3QNJokqCrnggyqlJ95ClKguYVg6LoPrsYMg4qg0h38p+z7BEhMe14cwBreOm9eL86CrI7RF
 l1vv/9sP7fkAayEZnAAAA
X-Change-ID: 20260520-axiado-ax3000-pwm-fan-36a89de6db61
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Akhila Kavi <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006895; l=2103;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=L1errroewBQQ9h3a50ccUPOFxOTJzBDhDpiOOeW/1u0=;
 b=7bX0V3G8/2zI9kiRlqLXiXWLtUoWx4pJFJaPaiO2c+cWc1zSdQ57Fddf90sB2wHp0ctMYqytY
 u12dZtooJllCkQnpuGFceTCzU8VJpKcNRtG2cMLmV8FQCHUilMd/2qG
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|BY3PR18MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4505a7df-c331-407b-8c17-08def399519d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|23010399003|56012099006|10067099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: UxmJT3eKjLLquuigrOMh8L7s2aHV1iItKHcGITPBtFQ7UjC7rAsEpiRQDX80h2xUqaDDurumPMNx/9L/ej95s9j8LLcZMYekfYzb3a3kyf3HWpfDFiIPd2NWdLHrGgG7auqoiYAQ34KY2Ty9JJRCk4g/Ot2QkNVhQoDsOBRGQF5zmnkV8AXwX6H7IrT/tqlm7p+k+JWL691EGLt1EIk5/6Kt0IFNB/H7gJF8S+QnggXOVRTZvj5dzjAoS1l6UOuvHs2fmrHtAvUG1F97HCNKBjeu/7YKO4fsUmwtKpSTjfqBhvuGKEd6GhwOvUUtDR9Rgcimify7E72PjGASWcV6JvCYstSbkgJWx8E2JBo2vC1s1V+ubckgd497WDKf8ChpYXinigbuQgNko3+rv05SDinmUraDUoDA5MxDGiuzLJQ/OEORQuBDNAIU4fk8xKN/4+eqOof9iMAOvZz6sm5xbG2dO8EK3oeJ9RFD2lMlzoRA8/jVPbELyeBD4/3kKwNqJmA9SjB27RhIHJ5Qqqq9cCVifHGVkwph+IhV8wMVmCmq2r14Fl3XiyIqPj/+MvJP/m/EH1JUhcSiv4OOzCAvrM7H9jLQ4IO/ioUtGlPfmVhjOFDrXCnK2xFkPHubvrxpExjNtr2q6KpX06f7s+kJc/OnQX9xXy+gk2hwysqHDPo7RweAl+1BJkzTqjDqvhsDFmfrEa9B5TSMCgbSpMebkGt3ADkfF+KOjaBjEBzMELugGu5qoPTFhVT+ZDc0z1jX
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(23010399003)(56012099006)(10067099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PFcV2kV2hA7kqXD1o0qRem2kPZD80MkYP9tM/TvFnEQv37A3N6XcEu1RxltIkQvl326FcSjH6X1qkapapU3/0rA+6+M2h3SM/tduU/+bXeX5SI67qkaBEYz4BEVqWEB1p4NAICiPzi9a7vYST6bMR21MC5WAqOst8xP8+21I191MzvkmV8gYa/9+ZjM3ULr2L9FtZ/NLshXicKtpIyVx1YJSwDJ4jEu1j+3q/aADp7gjHGwZ2gV3WAokJk5DxuUzPYL6wp1DRlc8RSO+b6+GwXItSjo2xWtvm8nXSDfNgrckXB/SbJWlut672w4icmCDhtPL7pvGw8MBkS7KixNP9YSYlvDfbRKKEmtYWqU/oZPH3FeIG7x2KpMcQAzKoYTR10HcEjbCJMDwTcNyPNKQXds6yXNtyfRoRncbCK8uZFo/ulZ3vafi8tLooaANaAaX
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:01:35.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4505a7df-c331-407b-8c17-08def399519d
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR18MB4739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_020143_432438_092833A9 
X-CRM114-Status: GOOD (  12.28  )
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

This series adds support for the fan controller found on the Axiado
AX3000 and AX3005 SoCs.

The controller provides a hardware tachometer block for measuring the
rotational speed of one fan. Fan speed is controlled through a PWM
signal supplied by an external PWM controller.

The tachometer counts fan pulses in hardware and reports the accumulated
count through an MMIO register when the measurement interval expires.
The generic pwm-fan driver counts tachometer interrupts in software and
therefore cannot directly operate this hardware counter block.

The driver registers with the hwmon subsystem and provides the
following standard sysfs attributes:

  - fan1_input for the measured fan speed in RPM
  - pwm1 for fan-speed control in the range 0 to 255

The number of tachometer pulses generated per fan revolution can be
configured using the pulses-per-revolution devicetree property. If the
property is not specified, the driver uses two pulses per revolution.

The series includes:

  - Devicetree binding documentation
  - Axiado PWM fan hwmon driver
  - hwmon driver documentation
  - MAINTAINERS entry

The driver was tested on AX3000 and AX3005 platforms.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Petar Stepanovic (2):
      dt-bindings: hwmon: add Axiado AX3000 and AX3005 PWM fan controller
      hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver

 .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      |  68 ++++
 Documentation/hwmon/axiado-pwm-fan.rst             |  38 ++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |  10 +
 drivers/hwmon/Kconfig                              |  12 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/axiado-pwm-fan.c                     | 389 +++++++++++++++++++++
 7 files changed, 519 insertions(+)
---
base-commit: 28807a684f870463e059fbc8cb22f5b780b94fe4
change-id: 20260520-axiado-ax3000-pwm-fan-36a89de6db61

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


