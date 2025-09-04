Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06666CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SEhM2tiUisq6N+QozK16nGrK2nZOTA65pnHCvF2QcgU=; b=4D7XUEsIwoML53jTGuUNNc5+Cw
	PZsDuUA1JX6RW3g8lwtBRwKW54htiqsj6GKk1KEP7eHU6e1RR7oOQrfMUxL6REEh4n5v3Fyfq6ovQ
	OwSPhZgzguPxH3j1s7xi3t1BtVsg8U0Nu/5MZmxiq5c6HVRJh3Z/Nxa0qJndvIP3sZb0IvZpVYPGA
	DMoFaZQwW5tEBzbqLPLjOik8Re/TIgVbVpDelrSNIyIoB3YarWo2zHvIFgRMvWEXS1Y6bec9zSC9b
	upuJQYC9M4D3V1Tq2bEULCWLqeRZP5nJ1lRMArRfnmEAUpvSMjiIqsgRd3oXtGhHdPqLGjzg3AQOA
	lM169EAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6wS-0000000Amti-3uhy;
	Thu, 04 Sep 2025 10:11:44 +0000
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5om-0000000APHe-2YOg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:59:47 +0000
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
	by app1 (Coremail) with SMTP id TAJkCgDn_Q7kVLlosGTIAA--.33516S2;
	Thu, 04 Sep 2025 16:59:19 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com,
	rmk+kernel@armlinux.org.uk,
	faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	inochiama@gmail.com,
	jan.petrous@oss.nxp.com,
	jszhang@kernel.org,
	p.zabel@pengutronix.de,
	boon.khai.ng@altera.com,
	0x1207@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	emil.renner.berthing@canonical.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Shangjuan Wei <weishangjuan@eswincomputing.com>
Subject: [PATCH v5 0/2] Add driver support for Eswin eic7700 SoC ethernet controller
Date: Thu,  4 Sep 2025 16:59:13 +0800
Message-Id: <20250904085913.2494-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgDn_Q7kVLlosGTIAA--.33516S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4ftw1UXFy5try3WrykZrb_yoWrAryrpF
	W0kry5Wwn8AryxXw4Iyw10kFyfJan7JF1akr1Iqw1fXa1qya90qr4ak3WjgFy7Cr4DZ34Y
	gay3ZFW7Ca4ay3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26rWY6Fy7MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRAnYwUUUUU
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_015945_050988_4BC131F3 
X-CRM114-Status: GOOD (  14.59  )
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

This series depends on the config option patch [1].

[1] https://lore.kernel.org/all/20250825132427.1618089-3-pinkesh.vaghela@einfochips.com/

Updates:

  Changes in v5：
  - Updated eswin,eic7700-eth.yaml
    - Use "items" instead "enum" for clock-names
    - Arrange clocks description in correct order
    - Delete redundant descriptions for eswin,hsp-sp-csr property
  - Updated dwmac-eic7700.c  
    - Optimize the implementation of eic7700_ appy_delay
    - Update comments and remove reg checking
    - Use FIELD_PREP in eic7700_apply_delay function
    - Use clk_bulk related APIs to manage clks
  - Link to v4: https://lore.kernel.org/all/20250827081135.2243-1-weishangjuan@eswincomputing.com/

  Changes in v4:
  - Updated eswin,eic7700-eth.yaml
    - Modify reg:minItems:1 to reg:maxItems: 1
    - Delete minItems and maxItems of clock and clock-names
    - Delete phy-mode and phy-handle properties
    - Add description for clock
    - Add types of clock-names
    - Delete descriptions for rx-internal-delay-ps and tx-internal-delay-ps
    - Add enum value for rx-internal-delay-ps and tx-internal-delay-ps
    - Modify description for eswin,hsp-sp-csr property
    - Delete eswin,syscrg-csr and eswin,dly-hsp-reg properties
    - Modify phy-mode="rgmii" to phy-mode="rgmii-id"
  - Updated dwmac-eic7700.c
    - Remove fix_mac_speed and configure different delays for different rates
    - Merge the offset of the dly register into the eswin, hsp sp csr attributes
      for unified management
    - Add missing Author and optimize the number of characters per
      line to within 80
    - Support default delay configuration and add the handling of vendor delay 
      configuration
    - Add clks_config for pm_runtime
    - Modify the attribute format, such as eswin,hsp_sp_csr to eswin,hsp-sp-csr
  - Link to v3: https://lore.kernel.org/all/20250703091808.1092-1-weishangjuan@eswincomputing.com/

  Changes in v3:
  - Updated eswin,eic7700-eth.yaml
    - Modify snps,dwmac to snps,dwmac-5.20
    - Remove the description of reg
    - Modify the value of clock minItems and maxItems
    - Modify the value of clock-names minItems and maxItems
    - Add descriptions of snps,write-questions, snps,read-questions
    - Add rx-internal-delay-ps and tx-internal-delay-ps properties
    - Modify descriptions for custom properties, such as eswin,hsp-sp-csr
    - Delete snps,axi-config property
    - Add snps,fixed-burst snps,aal snps,tso properties
    - Delete snps,lpi_en property
    - Modify format of custom properties
  - Updated dwmac-eic7700.c
    - Simplify drivers and remove unnecessary API and DTS attribute configurations
    - Increase the mapping from tx/rx_delay_ps to private dly
  - Link to v2: https://lore.kernel.org/all/aDad+8YHEFdOIs38@mev-dev.igk.intel.com/

  Changes in v2:
  - Updated eswin,eic7700-eth.yaml
    - Add snps,dwmac in binding file
    - Modify the description of reg
    - Modify the number of clock-names
    - Changed the names of reset-names and phy-mode
    - Add description for custom properties, such as eswin,hsp_sp_csr
    - Delete snps,blen snps,rd_osr_lmt snps,wr_osr_lmt properties
  - Updated dwmac-eic7700.c
    - Remove the code related to PHY LED configuration from the MAC driver
    - Adjust the code format and driver interfaces, such as replacing kzalloc
      with devm_kzalloc, etc.
    - Use phylib instead of the GPIO API in the driver to implement the PHY
      reset function
  - Link to v1: https://lore.kernel.org/all/20250516010849.784-1-weishangjuan@eswincomputing.com/

Shangjuan Wei (2):
  dt-bindings: ethernet: eswin: Document for EIC7700 SoC
  ethernet: eswin: Add eic7700 ethernet driver

 .../bindings/net/eswin,eic7700-eth.yaml       | 128 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 250 ++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

-- 
2.17.1


