Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46BCC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 02:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=; b=a+5qCjmnjHRY0j
	NTni82zQIjWJ7LZCRgk1NHuoYkCYbuvQQav8fSL2PHyPswjfJAf25MWFcckV3eYFpSgeu9nAGSPvr
	SFKmwFgtIrNEHHf7DOy3YAZi3n+j+UziohDq/Mo5DKl0WOsQfVco8OLcVMPqabjg7/DPk1q2R9XkK
	58+k0xjc92hf8SI6vX+ZBM8MBgiqdabZE3aYu5g3xskaM18+8GbHhF6XVXP4pd5DDXW2PqUqZg/em
	aVRH8B325pdNlGCd9++3SVNcqPDmtvdPeXcMqqvkmDVFOzKQoG4KK2dGixo7FlSpJIphVKfolQ68L
	pVNhIYEFI/Os8LZ+T3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3ZF-00000001o25-2EHk;
	Wed, 26 Aug 2026 02:40:45 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz3ZA-00000001nzS-0WOZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 02:40:44 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-836c4474028so4575567b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712039; x=1788316839; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=;
        b=s1G56YTtadMMa8+83qSnKOOUH0aiD3vuT4D7ukeQcfUVvfyue+QjRJTmeB70+v7LcH
         BIwWU7FrXft1Hs9V5hYzYA7ftuswoCiQ48jrGRdhf1EM5NhzXZI4ZwFg8OHFB4jBwYUD
         avXT9gWHUKG0vt2qc3UkDXggAesWQuROGb83ahefbnLU8hbixK/tIm83gK5C5P9/390d
         v5uETzx+vg6oJNVGjNR2LC66bFUhG50oXfe+deqbVXm8jnOEY6LJSbqTNLUA6hEpm+zf
         W5c2X8pYiCQq8m5szD9/tgaW7zimJj+0gC9kjAplk8N788wpVSqIjvMNC+yjnrIcDR+n
         msmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712039; x=1788316839;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=;
        b=OmyS6OUagMIUT7ALgblyfG5NzxFV1x4ipug8jwo6JKVFaQh1Hp1rAjJyJXt1U5V/1E
         FY0Vmhmuhga24MlPmS8zX3nDKDEwDdeAV4gtoIZIfCzKOXWezb527Omd3+59xsvTrdIG
         qgA/VZpFX9J0m/In7xl4BaEimtG4Nkio7Rxmvlg73AiTcY1vhR7Sq3JBbvQvliBjf0Lw
         SLKX2FvvAMs0NqfrgsIimxz8pz3VIb9v9uzWO3vCDPMqTj0C9azXJyDnv72aNZfu5hqw
         wN+ghewpsiRbYpUKYk+nRfpFYt6gNI6tsFQN9OVH8HpAm36fI4ghO+L/wZJpkmXwyvej
         wVgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7qLBJtixeXeZVimE1AASjFydF1JmcoTpmmEKYM/kFTlki0sfKULDux4Tmt02Hxs6azF2kd9dJAae9Q87omyUL@lists.infradead.org
X-Gm-Message-State: AFuF++l24JMdvCtx1nZKDlIOTlmU+DeqGU/R+quWzxVurqGOxPXSFGXo
	ny3CuDSjmNWYki9ASd+YcfsBco0o8knqfgkEefEtXG7IFXg255PUDR49
X-Gm-Gg: AR+sD12TpItR7wEQZgQ+TIwOfZcfdnjtdwAf428qunUHcTD0ObRGQlFQQ03QF1JxKNE
	HQBZujoJg++aRXt8rSVz5d6c3sjWJ2WYvIyCHB1pgVvz9WDqax3O0YqP9df1ulupcMrFLt6+EXR
	sA1piyspecSx4gHrl/QNaVGopyXp3Is7hdM9bfvMwlWC/Ez1kk5iAb1LmtY6uJ+WcA2C4OqjLo9
	7SY4HJpP+jPFmh1E0n+Nl9hopBmZwQBA/47JsAHM7EgfqV/yTI1/RGenDoqfH19QtBaUH2SORc5
	bpiMTgOWfpB/ehKTVBZ5+uMuM2XtENr56EKdiPEkraF0ReNyEDH8s+GUeCh+iMblW+LLt7fkwhu
	3GHwHq3sdFTD0F7FlQ0BjnAi6lGrElzWMWTzIwTLv9xcI9EgvJ4Uwh/t20Vzkg/otKpME7/Y/8/
	s9fpSFo+fl4R5pZibAAdW36lEZ33F1Ana3SOOsE+FbhJpSd63+8hZsKqjz6nyWEXewuEVc0qPC
X-Received: by 2002:a05:690c:c3a4:b0:80c:cad:c4e5 with SMTP id 00721157ae682-8574335d605mr11800927b3.30.1787712038777;
        Tue, 25 Aug 2026 19:40:38 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:38 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v5 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 02:40:26 +0000
Message-Id: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwY7CIBAG4FcxnGUDw0DF076H8UAHUDa23RRtN
 KbvvuAeVm32+Cf/98/cWQ5jCpltV3c2hinlNPQl6PWK0dH1h8CTL5mBACOMtDxfeiMSd41S3He
 OE6DWEq002rOivscQ0/WxuNv/5nxpvwKd60xtHFM+D+PtcXKStff/+iS54N5ha9BGasB9HjqXT
 h80dKyuT/DkQS49FK9QRBB6YyXRu1fPHpZeFR+NbUIEa6hdePzzGzBLj/V/gtigjij8i5/n+Qe
 KES2mgAEAAA==
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_194041_536809_85ECB2AC 
X-CRM114-Status: GOOD (  15.94  )
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

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
- Support for higher addresses (up to 32G).
- A different interrupt register layout and mapping.
- A different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series refactors the
`sun6i_dma_config` structure by adding hardware-specific parameters such
as interrupt register offsets, address masks, and channel counts per
register. This allows the driver to support the A733 and future hardware
revisions. This approach also achieves the same functionality as the DMA
drivers in Radxa BSP Package[1].

The series is organized as follows:
1. Refactor the configuration structure for interrupt and register operations.
2. Add support for variable address widths using masks.
3. Add support for variable channels per interrupt register.
4. Update the device tree bindings documentation.
5. Implement the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v5:
- Use field_prep in bitfield.h instead of the custom version.
- Add the missing function pointers for sun60i_a733_dma_cfg.
- Link to v4: https://patch.msgid.link/20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com

Changes in v4:
- Refactor configuration structure to use irq stride and offsets instead
  of function pointers.
- Use GENMASK and field_prep in set_addr for different high addresses.
- Link to v3: https://patch.msgid.link/20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com

Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com

Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>


