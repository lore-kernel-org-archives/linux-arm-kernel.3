Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A39606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=plpfShEd;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqEc0Xpw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kh71zvMMt1zTzgPdpRNPd5BIRCWG59enIN8zrZyqd3A=; b=plpfShEdYZDkhrBE07Tj+hWWgK
	XvlQtp6Nsk44qWlGoEpi8vCiPtrrUHJxuCRI/Sca5kNJgz/apSyjRz8X3SFpEXHem8uMC/UYEnqYM
	0lwm/IQf3bjGLqac1fOwVG/4ZXk6Ie2+lWEoDR0keZiYTZa6vJb1Zhl7EZQMxGZ3gq/dRKG0CNVFk
	Y8dgNSMQDK323RIY7XYF5hM0NSA8Kxa7RdGm6sZtyjYdyrdQgfjX3Qkayr8gcT+OwCdYpIx8KP/Jg
	jEzpE6YXjT76lN0J5rNnQkC7j/j4N46Fy9szMDGkxeiACAybxZ9yZh+6GZGcWyMCPHXYrf541zluV
	u5AAZjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE8T-0000000BPMF-0EbJ;
	Fri, 06 Nov 2026 07:13:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE8R-0000000BPLZ-3mK5;
	Fri, 06 Nov 2026 07:13:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A3CF6020A;
	Fri,  6 Nov 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793949195;
	b=Qx49vOjM1+M8AuhSNnO2B5L08/6LhSeu5WoPyZi3rzbrkiVaoLaIVDm0zoi3VSbTIkxh
	 oMzssb4+dIfueSg3OMZGdDAypZ+CBIbfe1fvK2t3Fpu1zK0+xHDMPZ3cydNv340+NlxB3
	 +D2GN1L1ROMo5p2T3A7cEDfBdgkWOxyM9dx/ew8EyRenSvjvRv+f8Z1YBzUU6n2HJ5Vdl
	 kEBDccwVAkyZN35cxybWHDSMvukSDdVk+8pvolM+dYqHHjM4lJ6CgVtDP4yjv1HEULz3L
	 Dk70qLelWKqTV2nT2cMOhmQPnYEyVrlqg/yVwfgorC8iWeVmZDjTnJnX+jJfmODaV3Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793949195;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kh71zvMMt1zTzgPdpRNPd5BIRCWG59enIN8zrZyqd3A=;
	b=FQAjU8cOxj892vAhrPbgNZOcZDD47aWXnVAiQ5mxXmNIjuuNzQuzxG+J789ZjU1dSZj0
	 6g1YNMnGuAb7hjyF+CPurboW3GNlVj2pCuLpWI9WjjFlhHzM4W+7ySWL62Y/F6Kpu/+5c
	 x8BndrSgVMfMw+ehYtrTEFT3K6PDiWGsrRVKFkix8J12khqcx56wB+w5Gs4dr6CzKmRo3
	 XJUJWuLoyfO/NTWy7ohucEPf53VMXeVmfO21eL2R56KHpc1CB1I9qChbLLn8tdMpZiM1M
	 DkKgcV5wZVEulTp+EpQefbMElkP3i6WG/+fTlWsiYvWrJKuw9AJp4TSE13MecDw7kyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 659411F0089F;
	Fri,  6 Nov 2026 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949194;
	bh=kh71zvMMt1zTzgPdpRNPd5BIRCWG59enIN8zrZyqd3A=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hqEc0XpwnO+0eRD3xFa9MtqV9q+3fwmOsNGgEmoR+/sZjr15fQNFIbogFrbpAWEQ5
	 zroK5844wff9yEV6HRRItBkvL+FwGtGM0fnXdaEB1Acy1mOfV73j977vURI9MQ38/6
	 BYhjoRIcYyZmP6dBBSY295ZPo411ZonlZyNuL/nGngC4eEDoQWE68NLlvEkCd9ItSe
	 pdhROBlGxun3qCoQaY5v88Ec0+L/9cfpMbN4W6d5f5gZ9lvGsdzAEPnZdfWfaduwuW
	 J2TjINFitvf7GJnZu2QxRg1W6uXt95exBU1sOmzibj2O8QnGGxX/Ptjg+3RCge6v0x
	 7dDiK1NcDJjIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E5C4D45C30;
	Fri,  6 Nov 2026 07:13:13 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] Add Amlogic A9 I3C support
Date: Fri, 06 Nov 2026 15:13:07 +0800
Message-Id: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAN+7WoC/1WN0Q6CIBhGX6VxHQ0QTbrqPVpr+ANKS2lgrOZ89
 8Bmrcuzfed8EwraWx3QYTMhr6MN1g0Jiu0GQSeHVmOrEiNGWEUJJViKiy0AC1UyXioiONQoje9
 eG/tcQqfzh8OjuWoYs50XnQ2j86/lKdK8W6NijUaKCS6YUDUVqmLUHGV/c62FHbge5WxkP5ES9
 hVZEgnwPW8MgDHyX5zn+Q1h54OM6QAAAA==
X-Change-ID: 20261010-a9_i3c-9d5245d094c8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793949192; l=2643;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=ZYd+aUxW1pS5nEymTyy/Hp1Ai+f4jVO3iNWQNjSaLak=;
 b=3nC77Dei5atNTFxEprSTGjtO9TuLbZriwCaKLYoMEBIblqI877Cxzbh5Nlxzbx0RFFYujODAM
 pAHGSwpC7F+CYIcY7IxSdBSFqFM5fyinyVHd7ZUh/j7GAIKnR/A6SnY
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: junyi.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Amlogic A9 SoCs integrate the Silvaco I3C IP, but their peripheral
clock setup differs from the original implementation: the EE-domain
controller (amlogic,a9-i3c) takes two clocks, "pclk" and "fast_clk",
while the AO-domain controller (amlogic,a9-ao-i3c) exposes only
"pclk" and derives its bus clock from an internal divider inside the
controller's own register region.

This series consists of:

  - Add a vendor_init callback for the clock setup and an
    Amlogic-specific bit (AML_I3C_QUIRK_AO) for AO-specific behaviour
    to the Silvaco I3C master driver, and enable the existing
    Silvaco workaround quirks for both Amlogic variants.

  - Add the Amlogic compatibles and per-variant clock
    constraints to the silvaco,i3c-master binding schema.

Verified on Amlogic A9 (BY401) with both EE and AO controller
instances. dt_binding_check and dtbs_check pass with this series.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
Changes in v3:
  - Merge vendor quirks into the legacy quirks bitmask and add
    AML_I3C_QUIRK_AO for the AO variant.
  - Check the devm_kcalloc() return value when allocating the new
    clk bulk array.
  - Enable the clocks before aml_ao_i3c_tail_clocks(), because the
    divider registers are accessed during registration.
  - Rework the probe error paths so the clocks are disabled when
    vendor_init or later steps fail.
  - Reorder the local variables (longest first).
  - Convert comments to kernel-doc format.
  - Depend on COMMON_CLK in Kconfig.
  - Drop the silvaco,i3c-master-v1 fallback and add a blank line
    before the new if/then block in the binding.
  - Explain the I3C peripheral integration details in the binding
    commit message.

- Link to v2: https://patch.msgid.link/20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com

Changes in v2:

  - No need rework the Silvaco I3C driver. 
  - Based on vanilla driver, adapt A9 SoCs through callback 
    and quirks to handle the variant.

- Link to v1: https://patch.msgid.link/20261019-a9_i3c-v1-0-329d819d621f@amlogic.com

---
Junyi Zhao (2):
      i3c: master: svc: Add amlogic a9 support
      dt-bindings: i3c: silvaco,i3c-master: Add Amlogic A9 support

 .../bindings/i3c/silvaco,i3c-master.yaml           |  26 +-
 drivers/i3c/master/Kconfig                         |   1 +
 drivers/i3c/master/svc-i3c-master.c                | 274 ++++++++++++++++++++-
 3 files changed, 287 insertions(+), 14 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261010-a9_i3c-9d5245d094c8

Best regards,
--  
Junyi Zhao <junyi.zhao@amlogic.com>



