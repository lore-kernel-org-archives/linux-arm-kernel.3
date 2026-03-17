Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8E3FED9FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MPH/2TVb+G7IyWo6jXI6IP6WTqNJsSi4anEcn8iTP4I=; b=ZIKOObOSjw0RoWH2hFzj1QmZ/L
	DBE09ym6458y7iHwMbikjynX/C5Sf1HG3eAp4sLoQ5DAd8KVEbhzV/MqEZKXHSTXntQkXqm+tzYQI
	2vfYk8pDJhEfrxFe2EnqupMEx+SfpJqVB5QJ4dkUMVGojr3Qcdtwacg1zSttirZ+uevbbkjQPMBR8
	qZTzJ1YhT4IJuXifUEvcMQwrm8bmNpcDFWiwrOu+oT4AqYIfRTeX1GveNT4Wr/xNVrsjPmd4FCB4o
	n+muU++qYmoNwVuh3MPmAv9tlNjx3UVCq6XphJ9eVibQ47CCTyAesBsHKn2PFJj7W9QXZFdorzCRa
	50PVviTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yls-00000006zvQ-3BcH;
	Tue, 17 Mar 2026 18:04:00 +0000
Received: from mail-westeuropeazon11011023.outbound.protection.outlook.com ([52.101.70.23] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ylp-00000006ztg-17WM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB0O2dFwgxeOOlox6Dfsc+aqBrrVl2Xe6XQrKHgJzSpcbB8LYu5b4zVCpn8FqLYsb8GyvdRXmi9kxE1YSCCvzI4LQfojhw4uJ2hzUcP+S/E9WBS+sImORopwwkn+FB4ffM4jfrgF5h+62YtPJMLPzTmHCiFy3qqqF7gs/MODvlArg14D8H7BlXl/K8LwjMomVEwT6Abx6smYWAHkhhjAYo/eFn/5TPxvm4jCfCjc8Zf8srg93U0usnCsarnQ1hcXhwFNxym40FQctGM9690UQvv6mgVOGH0yZ3JOc42Ly2fxEvnw8SiWlC2qcpelugKIhOAhJq88V/iushyHDHTcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPH/2TVb+G7IyWo6jXI6IP6WTqNJsSi4anEcn8iTP4I=;
 b=UqTEG7mtm6wQnAvE1rSsJaPDBj5xb19dyRi2tqgvCIuwE2Su/smp+0wrJ10XV0ypv8vMkNkm3/GAJe/QcpXotOyCZiJSNJ3hfy5LEahdC6tg/HrL1qGOo9qpKbnUnlgb3NzZRo8LT8j3i49SIcR35T8Eeik+W/bfsuAp/8lOnVsQ7ufZATZmWR591zpZcSsMFLbtvt8eurm4L0WddzNoLTN5BO9gmJ3R02rkmy3V1d49tN8PzDalBFYgNOeY70Pt9drgh++AXkNwaXJ8kAwZCfNKg3OXA50k445mvdTokP7xPQnH2QFzELQE2WPrV2LZB4zL4MTpMsem4jpJu46v6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPH/2TVb+G7IyWo6jXI6IP6WTqNJsSi4anEcn8iTP4I=;
 b=N2TTnePJEs034Sb+kjPzcVQrhvKvGDy0Yl02s+pCeTc+V+YrOTeNjwqcAotAAfumbYV0Pai9yH2u6BmzrGdRwfDllkvCd9VsBsxEoLihtRJwUzIkMLTnXlsVyj8c/yKu23llbBjQcPNL45lo5L3cuzkW9cCJVDX6E41ORgiWxRr0zFGq6J/6DR6G/zndqy9w4boUKRYS00fbNgqHJGZN0ubxHBQm5RrLdy8Hz/zZBrzim/sYK1XioCHCctEkm+nZYUStZ5MIf86lY/lO8FZF+64hIPLexdDU+ugb592oSIEB3Vy+Poc46dg/tFIFWtJa314tr3vydYUfQVQuqunrng==
Received: from CWLP123CA0203.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::13)
 by AM0PR10MB9671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:740::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 18:03:49 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::a4) by CWLP123CA0203.outlook.office365.com
 (2603:10a6:400:19c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 18:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:03:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:06:23 +0100
Received: from localhost (10.252.21.194) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:03:48 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v21 0/6] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 17 Mar 2026 19:03:21 +0100
Message-ID: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.21.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|AM0PR10MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c458646-b2f9-4613-9d33-08de844f8a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|30052699003|36860700016|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: DwW/YRRPQ6FlZNiRps0OklgE0CmOaaUHGOwM+wUemRwgubg3K7aZ7VKxAzsPx2hE/afyFD1OvEDFji331dbPZTTF4usowRPSQt1bVLd4oc3YlRs3zfq7rt5b8VLwWwm6IHnp8QIbdra4ifa4D1EmJylAhT6QZ6D2nvlGzYtx/lsnwJoUBscuztrUmQzjwiO4UtbB7JpMbSQ5Mwe/1GNwjHwyX2IQfzO+4kPSW6dgwmaTwZX3mjtb00GKZghWOmfzKbAkecsxuiolYo5IDp+/iRP3c5E7EGvmcqp04dZECA7E22rRQxu0APvZ5YI7iUXqp5PmA/CaY6+bAlP9VvOi7y30eSOwFrzDG7+jGwg+yv1RuN3Uz6Jv56hkoEvir57+kIABJN8/jF4cni1DR8LVqcDLYwJo5pL7KMPP3nmthCVzCeugxswfeLX+RU/JGLR6X1JYn0JW6lY0URSBNEEYG5AEgmvlAQk1H89st2EAAa+uXrGx4L9EJHfqtugLE0LM5MOz9mEtEHaT8OP4+guFzd9dR8SGsG4sPg31AG/i8d9d/7V63TAmPXpon5Pspjynt7n06bEZTjTgi4baMmCk9Uj5dekATC11CZTJwkQFBnC7GFZo/jVGSaRL+Z+BytUl08S0SsBvu8CSjc97e6tBq26OhPfv5RUhAW7hQvS8h8Wiqtf0+amiCVBtUS57twjslPi45Y4Tgn40JqHkJb6lzehlCBmzqbe7rhI+iEjj6Bs=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(30052699003)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hjeuJk8782NBkRBaNxKZQwBtvN7hoHqM9hc/3umZNKCASGkZqv5dgdhAZzuDa81caVgnxiQ0dUNyBSXm3vnrHCOzBKjNRcYMlpbrQbIF/54c97rVZzTEA+aJiJeMHHbHDrGKAMY9I2IiR5TKA3BWxayNA5NC8q32CG64KgJOoDqaah39yasTZ5nUDIMnUJsNPrnX+kr7+6gW6vt+Xd2b2CcMZoBA15bi+kJirSEMnmYvN40nW7r0ODzPm3NR8NYREGv0jPfJjeJdrSiFwVt9OfMTY84kNgQZR4B0A8qAUnLZAtBo8oLZPjkpVPN+ufM/ENepHHRzRVT6L7EsYjxKMRL6Yqs6M+AZ6hq8D9hm/fR3gUajFA3lUQvluZLX7A8d9sHSsPmYn6AspLKatgVQv6XpHRB7QBwAs68tJ8o8kXNyMAL4c2ASmWmFIeQTur+b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:03:49.1437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c458646-b2f9-4613-9d33-08de844f8a64
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110357_608766_65610B2C 
X-CRM114-Status: GOOD (  15.75  )
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


Main updates from version V20[4]:
--------------------------------
To address Rob’s concern on v20concerning resource declaration under the
tee node, the device tree is now structured as follows,replacing the
child-parent hierarchy with a phandle:

    firmware {
        tee_rproc: optee-rproc {
            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
        };
    };

    m4: m4@0 {
      compatible = "st,stm32mp1-m4-tee";
      reg = <0 0>;

      mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
      mbox-names = "vq0", "vq1", "shutdown";

      memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
                      <&vdev0vring1>, <&vdev0buffer>, <&retram>;

      interrupt-parent = <&exti>;
      interrupts = <68 1>;

      rproc-tee-phandle = <&tee_rproc 0>;
      st,auto-boot;
      wakeup-source;

      status = "okay";
    };

As a consequence, this version:
- Updates the device tree and bindings to:
  - Change the compatible property from
    "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" to
    "80a4c275-0a47-4905-8285-1486a9771a08".
  - Use the rproc-tee-phandle to avoid the parent-child hierarchy.
- Updates stm32_rproc_tee.c and remoteproc_tee.c to adapt to the new bindings.
- Updates remoteproc_tee.c to compute the device tree compatible string from
  the TEE UUID.

Main updates from version V19[3]:
--------------------------------
The devicetree is now structured as follows:

	firmware {
		optee {
			compatible = "linaro,optee-tz";
			method = "smc";
			#address-cells = <1>;
			#size-cells = <0>;
			rproc-service@0 {
				compatible = "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08";
				reg = <0>;
				#address-cells = <1>;
				#size-cells = <0>;
				status = "okay";
				m4: m4@0 {
					compatible = "st,stm32mp15-m4-tee";
					reg = <0>;
					mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
					mbox-names = "vq0", "vq1", "shutdown";
					memory-region = <&vdev0vring0>,	<&m_ipc_shm>, <&mcuram2>,
							<&vdev0vring1>, <&vdev0buffer>, <&retram>;
					interrupt-parent = <&exti>;
					interrupts = <68 1>;
					status = "okay";
				};
			};
		};
	};

As a consequence, this version:

- Introduces a new stm32_rproc_tee.c remoteproc driver.

  Instead of further complicating the existing stm32_rproc.c driver, a
  dedicated TEE-based driver is added. Both drivers are intended to also
  support the STM32MP2x Cortex-M33 remote processor in a next step.

- Reworks the bindings:
  - Drop the st,stm32-rproc.yaml updates that were introduced in previous
    revisions.
  - Add remoteproc-tee.yaml for the
    "rproc-service-80a4c275-0a47-4905-8285-1486a9771a08" compatible.
  - Add st,stm32-rproc-tee.yaml for the "st,stm32mp15-m4-tee" compatible.

- Reworks the probing sequence:

  The m4@0 device is now probed by the remoteproc-tee driver, which itself
  is instantiated by the TEE (OP-TEE) bus.


Main updates from version V18[2]:
--------------------------------
- rework documentation for the release_fw ops 
- rework function documentation in remoteproc_tee.c
- replace spinlock by mutex and generalize usage in remoteproc_tee.c


Main updates from version V17[1]:
--------------------------------
- Fix:  warning: EXPORT_SYMBOL() is used, but #include <linux/export.h>
  is missing


More details are available in each patch commit message.

[1] https://lore.kernel.org/linux-remoteproc/20250613091650.2337411-1-arnaud.pouliquen@foss.st.com/
[2] https://lore.kernel.org/linux-remoteproc/20250616075530.4106090-1-arnaud.pouliquen@foss.st.com/
[3] https://lore.kernel.org/linux-devicetree/20250625094028.758016-1-arnaud.pouliquen@foss.st.com/
[3] https://lore.kernel.org/linux-remoteproc/20251217153917.3998544-1-arnaud.pouliquen@foss.st.com/


Tested-on:
---------
commit 1f318b96cc84 ("Linux 7.0-rc3")

Description of the feature:
--------------------------
This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating
and loading the remoteproc firmware image in an Arm secure context.

1) Principle:

The remoteproc tee driver provides services to communicate with the OP-TEE
trusted application running on the Trusted Execution Context (TEE).
The trusted application in TEE manages the remote processor lifecycle:

- authenticating and loading firmware images,
- isolating and securing the remote processor memories,
- supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
- managing the start and stop of the firmware by the TEE.

2) Format of the signed image:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57

3) OP-TEE trusted application API:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h

4) OP-TEE signature script

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py

Example of usage:
sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem


5) Impact on User space Application

No sysfs impact. The user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (6):
  dt-bindings: firmware: Add TEE remoteproc service binding
  dt-bindings: remoteproc: Add STM32 TEE-controlled rproc binding
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Introduce optional release_fw operation
  remoteproc: Add TEE support
  remoteproc: stm32: Add TEE-controlled STM32 driver

 .../bindings/remoteproc/remoteproc-tee.yaml   |  36 +
 .../remoteproc/st,stm32-rproc-tee.yaml        | 108 +++
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   3 +-
 drivers/remoteproc/remoteproc_core.c          |  52 ++
 drivers/remoteproc/remoteproc_internal.h      |   6 +
 drivers/remoteproc/remoteproc_tee.c           | 810 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc_tee.c          | 537 ++++++++++++
 include/linux/remoteproc.h                    |   6 +
 include/linux/remoteproc_tee.h                |  91 ++
 10 files changed, 1658 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 drivers/remoteproc/stm32_rproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0


