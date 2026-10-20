Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389160A262C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sbi7Ujqc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46IyvM73UruEFoU5tvYGZme473bX8sHtZFFnADjSTtM=; b=sbi7UjqcAF3/+M
	K604tsbnrWEzmqEDSZH7gBr0S83BncgCzGKZsdkY09MEhw++b4E87z7uTTljbrBBw+Z2kppMiPrPe
	+gbUR5m1uHS8hi36KwW/JUIUGAwTjjvKIf8JWcMZ55goxWeWNiaqnxKfZsTkVBOKHtiKhfCkFdGoz
	bxXWPwgrGVjUEru+qDslcPHrCyxLieyzZWGOap0wIRIWoxGeOMu0nYdn0eVfj7uunVLUpaHzPUYvS
	Ce2uFGXKG4pkc8k1PH1MmTslAHE/nhNimH5Q//atSYD64MDw1HviScDuuRIymMGp/y2euoYwe5LfQ
	rz32gD4BAAT9+poYXdtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Ve-00000009cQG-2MOH;
	Tue, 20 Oct 2026 12:00:02 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8VZ-00000009cPE-24Ja;
	Tue, 20 Oct 2026 12:00:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:59:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:59:50 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH v10 0/3] Add ASPEED PCIe PHY support
Date: Tue, 20 Oct 2026 19:59:48 +0800
Message-ID: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALRX12oC/43R22rDMAyA4VcpuZ6DZEU+9GrvMUZxFHfJRpuQt
 GGl9N3nFrYUauguJfg/gX0upjh2cSrWq3Mxxrmbun6fBoSXVSFt2H9E1TVpUWjQjAikjsN0GGP
 YbQbp4mYU5aqKLfumdkhFyoYxbrvvm/n2nua2mw79eLqdmPG6vWFgkIAIAEtCJkNWofoM8nXaS
 NsfX8M0xNgcorSl9LviKs16qS0yUEUaSs1M7j81LbUHBGavdYmpZobndfVXI2gLnp3mEh2iwec
 xLzGifXzDmRWougroHVsTZJtVzKJowIxikuLEOQBhU6PJKvZOQZNRbFKqEGvYMkklMau4O4Ugo
 7ikALF30jQOpMkq/lcxgMgZxSelMeJ0SB9lgn1QLpfLD8KAQxjFAgAA
X-Change-ID: 20251103-upstream_pcie_rc-8445759db813
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792497590; l=6380;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=nsaiDKDcqqGMfom04v8aWN0Ba2aHC4xg9Hlr8F8E+a4=;
 b=5UFcNODqu9txzKJ83jT+ocQVK77jeiXxOQwW6FRy6eVJJanU2IHEeSn1chJJb642IbW+uncc3
 9ptecfQeVuOCKpvxaobrKIRy6f5IurkWzCJm1vmqhcJaRb1wWIu1tfS
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_045957_541681_DCDDBA47 
X-CRM114-Status: GOOD (  21.23  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support for the ASPEED PCIe PHY, including the
device tree bindings and the PCIe PHY driver.

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY
- Implement ASPEED PCIe PHY driver, including reference clock handling
  and an AST2700 host bridge reset sequence
- Update MAINTAINERS for the new bindings and driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe
device enumeration and operation.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v10:
- dt-bindings: add required 'clocks' property (fixed 100MHz PCIe
  reference clock) to the PHY binding
- Drop Rob Herring's Reviewed-by on the dt-bindings patch since the
  binding gained the new 'clocks' property
- Kconfig: allow building the driver with COMPILE_TEST
- driver: get and enable the PHY reference clock in .init(), release it
  in a new .exit() callback, for both AST2600 and AST2700
- driver: add AST2700 host bridge internal reset sequence around the
  port-type configuration in .set_mode()
- driver: make pcie_phy_ast2600/pcie_phy_ast2700 platform data static
- driver: fix ast2600_phy_set_mode() to read-modify-write PEHR_GLOBAL
  instead of overwriting the whole register
- driver: merge the identical ast2600/ast2700 .exit() callbacks into a
  single aspeed_pcie_phy_exit()
- driver: include <linux/of.h> directly for of_device_get_match_data()
- driver: remove the unused dev field from struct aspeed_pcie_phy
- MAINTAINERS: fix drivers/phy/aspeed/phy-aspeed-pcie.c file path
- Link to v9: https://lore.kernel.org/r/20260115-upstream_pcie_rc-v9-0-d6c82a1556a7@aspeedtech.com

Changes in v9:
- Remove '[v8,2/4] ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node'
  and send it separately.
- Use FIELD_MODIFY to configure register.
- Link to v8: https://lore.kernel.org/r/20251230-upstream_pcie_rc-v8-0-03598cdd80cd@aspeedtech.com

Changes in v8:
- Update the title of cover letter
- Remove 'default y' from Kconfig
- Change 'PHY:' to 'phy:' in the title of ASPEED PCIe PHY commit.
- Remove unnecessary headers from phy-aspeed-pcie.c.
- Add ASPEED PCIe PHY MAINTAINERS
- Remove applied patches
  [v7,2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
  [v7,5/7] PCI: Add FMT, TYPE and CPL status definition for TLP header
  [v7,6/7] PCI: aspeed: Add ASPEED PCIe RC driver
  [v7,7/7] MAINTAINERS: Add ASPEED PCIe RC driver
- Link to v7: https://lore.kernel.org/r/20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com

Changes in v7:
- Add PCIe port into aspeed,ast2600-pci.yaml.
- Remove aspeed_pcie_init_ports() and merge aspeed_pcie_port_init() to
  aspeed_pcie_parse_port()
- Refactor aspeed remap pcie addr to aspeed_pcie_map_ranges()
- Link to v6: https://lore.kernel.org/r/20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com

Changes in v6:
- Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
  the pcie node of aspeed-g6.dtsi.
- 'dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST#
  group' have applied, remove it from this version.
- Adjust the defnitions in pci.h.
- Link to v5: https://lore.kernel.org/r/20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com

Changes in v5:
- Remove legacy-interrupt-controller and the INTx points to pcie node itself.
- Correct bar mapping description and implementation to PCIe address
  configuration in pcie-aspeed.c driver.
- Link to v4: https://lore.kernel.org/r/20251027095825.181161-1-jacky_chou@aspeedtech.com/

Changes in v4:
- Remove aspeed,ast2700-pcie-cfg.yaml
- Add more descriptions for AST2600 PCIe RC in aspeed,ast2600-pcie.yaml
- Change interrupt-controller to legacy-interrupt-controller in yaml
  and dtsi
- Remove msi-parent property in yaml and dtsi
- Modify the bus range to starting from 0x00 in aspeed-g6.dtsi
- Fixed the typo on MODULE_DEVICE_TABLE() in phy-aspeed-pcie.c
- Add PCIE_CPL_STS_SUCCESS definition in pci/pci.h
- Add prefix ASPEED_ for register definition in RC driver
- Add a flag to indicate clear msi status twice for AST2700 workaround
- Remove getting domain number
- Remove scanning AST2600 HOST bridge on device number 0
- Remove all codes about CONFIG_PCI_MSI
- Get root but number from resouce list by IORESOURCE_BUS
- Change module_platform_driver to builtin_platform_driver
- Link to v3: https://lore.kernel.org/r/20250901055922.1553550-1-jacky_chou@aspeedtech.com/

Changes in v3:
- Add ASPEED PCIe PHY driver
- Remove the aspeed,pciecfg property from AST2600 RC node, merged into RC node
- Update the binding doc for aspeed,ast2700-pcie-cfg to reflect the changes
- Update the binding doc for aspeed,ast2600-pcie to reflect the changes
- Update the binding doc for aspeed,ast2600-pinctrl to reflect the changes
- Update the device tree source to reflect the changes
- Adjusted the use of mutex in RC drivers to use GRAND
- Updated from reviewer comments
- Link to v2: https://lore.kernel.org/r/20250715034320.2553837-1-jacky_chou@aspeedtech.com/

Changes in v2:
- Moved ASPEED PCIe PHY yaml binding to `soc/aspeed` directory and
  changed it as syscon
- Added `MAINTAINERS` entry for the new PCIe RC driver
- Updated device tree bindings to reflect the new structure
- Refactored configuration read and write functions to main bus and
  child bus ops
- Refactored initialization to implement multiple ports support
- Added PCIe FMT and TYPE definitions for TLP header in
  `include/uapi/linux/pci_regs.h`
- Updated from reviewer comments
- Link to v1: https://lore.kernel.org/r/20250613033001.3153637-1-jacky_chou@aspeedtech.com/

---
Jacky Chou (3):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      phy: aspeed: Add ASPEED PCIe PHY driver
      MAINTAINERS: Add ASPEED PCIe PHY driver

 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |  49 +++++
 MAINTAINERS                                        |   8 +
 drivers/phy/aspeed/Kconfig                         |  12 +-
 drivers/phy/aspeed/Makefile                        |   1 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               | 230 +++++++++++++++++++++
 5 files changed, 299 insertions(+), 1 deletion(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20251103-upstream_pcie_rc-8445759db813

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


