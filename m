Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38526C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bWq2ToMMyXzSZSO9Kp8KcnHp/iXqQGSVbh9ui6a+4/o=; b=MJLJoFFRlXhUE0
	bKugQwhZSM1mSdTaAB6zLDsNCXNWn6Crsw08jSO5furGJeYisQ434hlmyVLRG+yZ9Gvx6YU5Do6nN
	NrPPJHSMQqlsiHwtX0MWiD9OOqAQa/NKg5dNHelH6TuM5tdyRnqbOSF55EmDJ0WrDEjqCbWFeZE2y
	WbQjiQ8f2+IJG213XyKYLR+OFcc6vExiQOIOf0DlkvxIxOZ+T5RCnG4wJjPTtiaaLApAnW1+5Q+Cd
	KvvcDJE7uWwmnfOeoAmjfQgNjox1J6ZQrd6vjvlKC2WHTWx/BlXWeQbJiM1teQGmyMh9nGfbRtjsV
	JAA+ggCMvv6JWG+uHalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAaW-00000002GBF-41GF;
	Wed, 26 Aug 2026 10:10:33 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzAaK-00000002G96-44oY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/mJM9xyVmIEUsR4z1a+1y/EsOaL4l0Z/rxVa8QLh9l4VjYBkRajl381N4RVh0uIGdJttjqWxfEurSFXniwBREOe8MCyNmUTOFvAOVZHa6Zgd5Ctg0M3wHLuoRHlpcsNOwtTw16lmeWeXCTpTCHsoY/Wa8lBJpQYl+3jVLERf0DeXg5GF8PnRTwlyNr97XKvbsVbIslXbmR/uZ7T3QaNnXL+dQvyk2+WwGTO1S3DIOLqZ9SzyqHVM7m7hyOAjipgepNDwGj6kRK2uEPDuMEtvFVbqwpAywJEGbweXDTiQvVfey8PAXqk6MIa1tfTmPsYEGPSW3wB2qSjnNqywAgJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWq2ToMMyXzSZSO9Kp8KcnHp/iXqQGSVbh9ui6a+4/o=;
 b=CwEzhNTreEPE7fxhnxtJKp8Djt3a023fB50B48i385AAhTZ/dTf+/b7bdM2zm+8NtamzVwY/j4KtAJPmX2pj8oiKxkb2SMip435PNqE0zotkZD0GXfmPsqWIOOFOt8P4aOhOGIQSpBe9D6UUymn3I1YV9MB153c9CBXH9lNksbfOEgQ4e1bqm7qf4KBurh7cPPb0h/UKArRUdc9gHswkG11GeBaXu++FKR/8iFA86TNj1GRRrBNb46mm4sgvz1KT9GwlcOlCHDl3xR+QhBSiHqnrhP6bGpiuy73am1MfK8FMhpyr+XBtsGFPzP6b8aVU87IB7vAhFiTxLCc8ptDDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWq2ToMMyXzSZSO9Kp8KcnHp/iXqQGSVbh9ui6a+4/o=;
 b=rkWUktpYyBKL9lD7EpTpihczVlZo4jji5pxRmcEd+XXLKW1CJ96M9lilhukrCo8h9raeL39ExkytHV2XlSflqCAXLy9jlGmaAkHobtUAKXU2LUqNYEl0K6y/iY/adejr+wtIHO2dUnJQS+5O8arLVereRnLafNzjaocX6IMNZ6o6JH6hCPhOEqSO/QDLTFYZ0eqGJAmx62Vyw7B6a9wOymE+SeaPqRU0UTCknPw7YDA9GXziA8drX+zApVca5y+2fwnJpGKPmcqJrru7WMJIYegZ7UiUBnWUuipNfWik5iRvKLISPO8WQO4cJap6rFOm+jalaEhjh9NFS5/r/+P5jQ==
Received: from PH0PR07CA0048.namprd07.prod.outlook.com (2603:10b6:510:e::23)
 by SA1PR18MB4791.namprd18.prod.outlook.com (2603:10b6:806:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 10:10:12 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:e:cafe::4f) by PH0PR07CA0048.outlook.office365.com
 (2603:10b6:510:e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Wed, 26
 Aug 2026 10:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.0
 via Frontend Transport; Wed, 26 Aug 2026 10:10:11 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 889DC4186B51;
	Wed, 26 Aug 2026 03:10:11 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH v4 0/2] arm64: Add Axiado AX3005 SoC and EVK support
Date: Wed, 26 Aug 2026 03:10:05 -0700
Message-Id: <20260826-ax3005-dts-v4-v4-0-a7702a3ace0e@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH27jmoC/x3MQQqAIBBA0avErBswdTK6SrSQnGo2FhohRHdPW
 r7F/w9kTsIZxuaBxLdkOWKFbRtYdh83RgnVoJXu1aAJfTFKEYYr422RHNHKnTPeEtTmTLxK+X/
 T/L4fZYAUz18AAAA=
X-Change-ID: 20260825-ax3005-dts-v4-5755fe173a45
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
 Swark Yang <syang@axiado.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4202; i=syang@axiado.com;
 h=from:subject:message-id; bh=DHeJIaseeLD/6I4QdVk4iGuHGxAUNPDA8pbuPo3m3k4=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqy+3c25K08eXs0/T1us/NCzjuuzy3ZrSV39JKI3S3me6
 fXvPi8KOkpZGMQ4GGTFFFm+6nzLP5mrfa9z78pSmDmsTCBDGLg4BWAi1ZUM/4ySdS4rVAr1v1GV
 Wnbd10QnVei98gLtVxpT3BPmhU+5NZHhr3zDj7NzKsprjhzVNbn442rv3iUpU41+LxZLuXOoM5S
 XhwsA
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SA1PR18MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daccd3c-0476-4627-ca95-08df035a374c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|10067099003|3023799007|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: wkCKbb7qbheZZojOosnZLoqq+Ih5TdPWZPXkWsUJl+REXjMZ5WnEEafZ51Bqa0saI5xZMvFGtc87tfKFH+SPP7Vhs2Hgaxoy9caRI5EMebArT6WpzkHW43I9pol447VZNBoVsgXQTMJL9WjjnV4S8djojZ4ue+VqA/AzHq4NUqwz3es7dDHpbI0KHduW91DAlfhTjBQIKgBXRMMnWchHaWe3aZVtidiNhRicZjGZ/7PIZBShNjTCll22LA+wdA8g6FMlG73ZU+O56sYfhbJvFOR+fzcdC7HXGXr+K0Itv0w7ipTsdQcBWK3NY4PmDtFLfGd38dl7Dmq/4SGql2SMtbXg03Ccx+gjx2OZn38JBp7Qjqy1p44NZvqOByqd2iaPUz11/bpCqTehKFIzBMX/47HLt/3Sf6FcAo0317J7QinQr06LWyWCYnxe9dRvClOYhh0KXyonhBPvCwS1DWFyMtdztgab0mMR1TEGJDOiJ+UBfFyuYWnuvC6ujFVpe04U8ur6tqEbkHfb7cqHio7vY6/7B4fmQOXqlJY5iVFqvRPFEcncX76vER6jQKrhPitpQohJfZv3v/Rc0D7GJlmJWQPrIdij7YYDYQBnMQI3KQt77Y96RPYqrXoxtG7h9SpYOBg9gzjkbCYqUlFOJAyj6jWdFZ+qlV0F8JfT+zncvJVwl4j0VKWmC2kQxwwLzoCDSDxd57naV800x/Wnogw+CQ==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(10067099003)(3023799007)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rvRQG6u5UorIZh7bulP5WAVrAxNJkhtpEKP1/jBS6vABC0S4M4ycmXX9Q0KWY3JcnIpl6kLYh4PpdNUMG9CYMeJPSL/tcbRNNpzIGJS2RX8wiFwqO/G/hjjLBjbXju3b6VVCLkVTu4Uu788MpAOuj9eiz7itLow0ViPF3JhA66q7be6/wgo81/uU57iOEONwkKnT966nrNQw9KW69pR76JJR/ZjyPOQbjuJRzrzy+nTVSmnickaObGm1YU2Rwr2XBFMqIv1dHoKtkOBxgQIKX9IJ4knmybEgB68q1Psqq/DJ64haWKc1Hyz/FzvMYTNuaelN21ycDWLgRmw29uKP9wYuYX5v6p7eyA8UDaYjWR4gjgS3DmPDOWrcSai0m7XDJnqOmWzNhl9En3W8Pzr1EQ+a7SrUeQg28LZa/HLukyHnkUAzuQg9yhp3SlK34VVv
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:10:11.9168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daccd3c-0476-4627-ca95-08df035a374c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_031021_075975_720C60EA 
X-CRM114-Status: GOOD (  14.21  )
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

This series adds initial device tree support for the Axiado AX3005 SoC
and its evaluation board (EVK).

The AX3005 uses Cadence-derived UART, I2C, I3C and GPIO controllers,
Synopsys DesignWare SPI controllers, and generic xHCI-compatible USB
controllers. The AX3005-specific compatibles for these controllers were
previously included in the same multi-subsystem series.

Following maintainer feedback, the subsystem binding updates have now
been split into separate submissions to their respective subsystem
maintainers. This series therefore contains only the Axiado platform
binding update and the ARM64 device tree support.

The current status of the corresponding subsystem bindings is:

- GPIO: merged into mainline
- I2C: merged into mainline
- I3C: merged into mainline
- SPI: merged into mainline
- UART: received two Acked-by tags and is pending application
- USB: received a Reviewed-by tag and is pending application

Pending binding dependencies:
- UART:
  "[PATCH v4] dt-bindings: serial: cdns: add Axiado AX3005 UART variant"
  https://lore.kernel.org/all/20260805-upstrea-ax3005-uart-v4-v4-1-8399f0773b13@axiado.com/

- USB:
  "[PATCH v4] dt-bindings: usb: generic-xhci: add Axiado AX3005 xHCI variant"
  https://lore.kernel.org/all/20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com/

Patch 1 adds the AX3005 SoC and EVK compatible strings to the Axiado
platform binding.

Patch 2 adds the AX3005 SoC dtsi, the EVK board dts, and the Makefile
entry. The EVK describes the CPUs, architectural timer, GIC, GPIO, UART,
I2C, I3C, SPI and USB controllers.

Validated with:
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
  O=out-arm64 CHECK_DTBS=y axiado/ax3005-evk.dtb
  with the pending AX3005 UART and USB binding patches applied
- make dt_binding_check DT_SCHEMA_FILES=axiado.yaml
- boot-tested on the AX3005 EVK

Signed-off-by: Swark Yang <syang@axiado.com>

---
Changes in v4:
- Collected Tzu-Hao Wei's Acked-by tag for the Axiado platform binding.
- Split the GPIO, I2C, I3C, UART, SPI and USB binding updates from the
  original multi-subsystem series into separate subsystem submissions.
- Dropped the subsystem binding patches from this series. GPIO, I2C,
  I3C and SPI bindings have since been merged into mainline.
- Addressed Marc Zyngier's GIC review comments:
  - Added the GICC, GICH and GICV register regions.
  - Dropped the redundant #redistributor-regions property.
- Link to v3:
  https://lore.kernel.org/r/20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com

Changes in v3:
- Added SoC-specific compatibles (e.g. axiado,ax3005-gpio) with
  appropriate fallbacks to all IP blocks (UART, I3C, I2C, SPI, USB,
  GPIO).
- Added corresponding dt-bindings patches for all updated IPs.
- Renamed l2-cache0 node to l2-cache to drop the unnecessary unit
  address.
- Fixed DT node sorting.
- Link to v2:
  https://lore.kernel.org/r/20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com

Changes in v2:
- Confirmed with internal team that AX3005 BootROM multiplexes the
  single release address for SMP bring-up.
- Corrected architectural timer PPIs and VGIC maintenance interrupt
  polarity to active-low.
- Aligned memory node unit-address with reg base address (@81000000).
- Removed 'arm,cpu-registers-not-fw-configured' property from the timer
  node.
- Collected Conor Dooley's Acked-by for the dt-binding patch.
- Link to v1:
  https://lore.kernel.org/r/20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com

---
Swark Yang (2):
      dt-bindings: arm: axiado: add AX3005 EVK
      arm64: dts: axiado: Add initial support for AX3005 SoC and eval board

 Documentation/devicetree/bindings/arm/axiado.yaml |   6 +
 arch/arm64/boot/dts/axiado/Makefile               |   1 +
 arch/arm64/boot/dts/axiado/ax3005-evk.dts         | 327 +++++++++
 arch/arm64/boot/dts/axiado/ax3005.dtsi            | 844 ++++++++++++++++++++++
 4 files changed, 1178 insertions(+)
---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260825-ax3005-dts-v4-5755fe173a45

Best regards,
-- 
Swark Yang <syang@axiado.com>


