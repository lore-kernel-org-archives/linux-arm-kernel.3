Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDBAC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=; b=BxNAkC06MNDkdU
	1EjCfBhtKMdN3dHmkr9bfkB+G7Xpg25EdNcvNrjyi85mYSvFl7EtDUZSUBORv/BahHyyfpchrIGC8
	i6wbP2cG9pLkxg1uO8xv/GJ/GH5KTciNvKc4L75/C0vs9djFLeK0yYEpyh1zLy6vsEWz9WBp5lO//
	7EGG1KfULQtfQtTiMGRK+NWUNPaYxTR0A+qQiEW+h46j5Je0wn1BpwcCHXMPeGoVGCgIuMN7/OwPY
	kbmL4u19ViIxNU8IkCQPF/TEJMjE8uoRIAO29axckopz3q7/NJEVkHfsB8fIdNsFi7Pia1ux3+K5C
	QAb1FjEkwOp/+psaN5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TG-00000001l1T-0XWE;
	Wed, 26 Aug 2026 01:30:30 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz2TB-00000001kzn-1ssE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 01:30:27 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92ed19f4d60so29513085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707823; x=1788312623; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=Ate7cvsJlZDvIDZdijKPBwhvSLHdnyCGrqz6NIiD5G7K5H1cON5T48Qc5qvLpEc6Z+
         PW+lo6hK2KSV6S5iujOTjewdm948iN4g83x2ljnz1wFkdByX1bB+BMDnnGzQilTdXp3m
         pXCOvs7yWtNNUnB7o//GLnjHMTbUqRX90DJxsuzg8QaFxwQhhEO4UudJrfFjLWhJNTF3
         Y+ajS6X1Dw9naTkvrH5lmNE6T5DSr2niqQh5nnKyiWwHxcXjGOhrjV+gOD6yybgCZL3V
         +5J8OCwtQVHCUM4BMeCkpl5b/KD38s/zLvMQmV214JhR4xFqzfr9AtXRVSDR87WPzdKl
         +aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707823; x=1788312623;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=HKVipRuDFAS7B5EBABBqzQvHfAgrmfMqu58EAVgwiJUp+94G7/WI+/Bk7uIav01Fa7
         dRiKPLC1D1bQuJxeP3cTPHZnYaNSyR+sEx8R7sxVt5g93bk6I9wNeemKz8GbMuUVZWLQ
         2LMX7fQklExLAk7Dh9DQJhVTwY51TvhwiVeUgRElzM/tc3lSZUpEVzXAhsPvpiF8A2Wh
         Vi7XLTTrSW7RMcZAnySI/GvMFVTuuGlG6BUn7rcrllBmI6A92CKhL4A9L8qP5V3F75jU
         AxJdTJh3EOBmhmhIczq/jIZzhBSeXUSOwDz2RajESjAORoijNlzqH10jNZ3d4zZBpqK1
         yHbg==
X-Forwarded-Encrypted: i=1; AHgh+RpWlr0h88RWN2jYtXpMHgbW/KZsrxvieciQUqumHXKbr1S9cJBUsO6pTMyX1B/5rwQhUllKNc/PcX/GL2ffDJ6e@lists.infradead.org
X-Gm-Message-State: AFuF++lPAhXIey65hg3TqnH9XltqNg11crPtaPU2xAZCgXW+pmpQmKnB
	OvmYzuY1LRqKfzar4lnyMhJYRDjLd8Wy1EgpyM6xBBB6i9+a4uQ//NrF
X-Gm-Gg: AR+sD11AKIZMFpzw34HMLSu5IbK+I0wuhJmuG503sN6AWS5i6n+7OQYBRWA37QgH1fo
	jFljxWOZ6usBkEICVKhPJrYkxqHtoD6Nz+DvTdjGxC3B2tgMEfM6PQaEeFNVqnE7jU/RwOpC6fe
	X5igk+IeGqxBbDtKRoK0oP7ABU/gvz1zdns0l/XAQQS1UiOlwLl+KvttwrraAR0/A3XoTNvXFwA
	XjdT5IZfpAaD/Hfi7TvaXHdX69a4k3yNHE2UB2N24RcOHwpr+gVQdqVI9O2D43XdDBRQj2e+f2d
	DmbcZphH3YsWXwZhrNM6YRO7zHOX8t5oyVYKBXdtqDI/UsMk+DbjMHnA2CUQ/89XmRxPKX9d/++
	ngl9nd+Jm4/jqLPRsE3rw40LAWjBLF/qvpRGsFGXLHlmlIpi3vrXQapsvYejnSo/mdX3JXIQoGF
	aAEiuwk3WdUKX4knfLWrow24q7UkBbep0rRz6ZfMZhYi8k5YNAneLjClgBvr3bww==
X-Received: by 2002:a05:620a:cc3:b0:936:ce17:7792 with SMTP id af79cd13be357-9376f3635ecmr870773685a.8.1787707822640;
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v4 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 01:30:02 +0000
Message-Id: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ppz9YV97DuCilhRoBQ6HRE
 O5uwQ1KXH7JPO+MKNjO24BOuxF1Nvrg2yYNvt8hU+mmtNgXaSMgIImkCoehkcRjnTGGi1pjA1w
 IyhWVokBJPTrr/HMpXq6fHYb8Zk0/Z+aLyoe+7V7Ly0jnu//1SDHBhea55MqZDPS5rLW/H0xbo
 7keYeWBbj0kzzhxQMRRUWN+PVt72HqWvJMqsw6UNPmXn6bpDUbPGuNAAQAA
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_183025_591640_998C09CC 
X-CRM114-Status: GOOD (  16.37  )
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

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>


