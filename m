Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66132CD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rBCFeFutKpKkUHB+jvdupWXEqkYfOSdSNbTjvMlEjrM=; b=Xy3TAL4tnoBrqq
	gSTT8w+fM+eoSVK9zNIAFDBuhLDx/9cnbFegq4yrKK7K0MA7NqlfmKPCTdkXGKbeo25wgYtYbAEAa
	WMTapFZyA0pXsgREFfeFRZ382YbmAu9o9ERwAVvaQ2xuQzWoAWNxKeKPM0DM2SuS3RSHoxjwrznfc
	IhrNTKsyzKFMY9YiY4O8Qgt32yXIuAafeLCtWQDUIPqStwrL5/G4ql5qNS5Flqh7zcbOBeyCl+7e1
	nU0mVtmQw5YWAcD9qtg8avAvEyOCB80/nZ3+fpVEHrCmKWI84gJ/pp7KPPf9zK4hFM/OAuAiataHS
	HlwJZTGe2QmcaHrWdi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSN4-0000000Fhng-08Wu;
	Tue, 16 Jun 2026 11:54:22 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMi-0000000FhaC-3mRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:54:06 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rBCFeFutKpKkUHB+jvdupWXEqkYfOSdSNbTjvMlEjrM=;
	b=4A3QooNHDUgcckOw2LoPOMp0nv3yjO+iJGyB5wEvzs86av1nkvygpZL+CpifXJCzSleLBW
	UbZqbUfFqgR4AgjN0Io17VnH5aK7dutpQF37u71nPktfRPh3djLCjJEZ/6lJ8bnQXLAXMH
	Q5/j0CKrYwLEJjPFTLgjdX41tEJrIaVCMD8++4YpQj6kNzAfWOGgOOG1bzI2jvdpgwsyGl
	41aIHHDsBXXY8RnDNn5VGuX9sN0fWXA6ed2vrzSs0GjxIHDse5YZPdwTTCb3g1yaYqvHUR
	n+rxj3D9m0Yk1dFX6KE2YRhuYPwdL+FHVbxt6PQwla87eYobVP7+J98CD0gYfA==
Subject: [PATCH 0/9] Support ELE API in i.MX OCOTP NVMEM driver
Date: Tue, 16 Jun 2026 13:52:15 +0200
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrDIBCF4auEWXdALRHSq5QujE7SKY2KmiCE3
 L2mWX48+N8OmRJThke3Q6KNMwffIG8d2LfxMyG7ZlBCaaGlxjXmksgs7Gf0VAteixiQl4rBhhK
 RvoSml8q5adCjuEOrxUQT1//T83U5r+OHbDnzcBw/gvePposAAAA=
X-Change-ID: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=UDeaBDb6CnTVVWCQCGwXHWutDpdDlatc9jHaM9wB5AY=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQUq39hN7Zq3PFbrw1zEjdyXCJVfBEyCybE6utrj7vb
 ArRuq/dUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJHumwz/c1SPPVD7xDzzw+34
 o1lPHtl1uTG/9D+zQTrn4eQV+/eeyWVkmHNb8fFHPWdpgek7f0So8L5McVmi/NNixYNXgRwvF83
 PYQQA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045401_641353_67680FCA 
X-CRM114-Status: UNSURE (   9.16  )
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

The imx-ocotp-ele.c driver currently uses the limited FSB (fuseblock)
to access the fuse registers. In order to gain full read/write access
to all fuses, we need to use the Edgelock Secure Enclave firmware.

This patchset does:

* Add bindings to reference ELE device in OCOTP driver (patch 1)
* Add ELE API functions for accessing the fuses (patch 3)
* Let the OCOTP driver use the ELE API (patch 6)
* Extend the devicetree of the Kontron boards for using the ELE API (patch 9)

The rest of the patches contain cleanups that were implemented along
the way.

This was tested using the 'crucible' tool and through hexdump on the
nvmem device.

---
Frieder Schrempf (9):
      dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave
      firmware: imx: ele: Fix indentation in ele_base_msg.h
      firmware: imx: ele: Add API functions for OCOTP fuse access
      nvmem: imx-ocotp-ele: Add keepout table for i.MX93
      nvmem: imx-ocotp-ele: Remove device-specific reg_read()
      nvmem: imx-ocotp-ele: Support the ELE API
      nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
      nvmem: imx-ocotp-ele: Rename FSB access map
      arm64: dts: imx93-kontron: Enable ELE firmware driver

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   4 +
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |  26 ++++
 drivers/firmware/imx/ele_base_msg.c                | 122 ++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h                |  22 ++--
 drivers/nvmem/imx-ocotp-ele.c                      | 137 ++++++++++++++++-----
 include/linux/firmware/imx/se_api.h                |   3 +
 6 files changed, 277 insertions(+), 37 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260616-upstreaming-next-20260609-imx-ocotp-ele-a512ddf96b03

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


