Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8062EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jSeLpSyqZM0d28vZftrA3N5zj3VTIegp6CHksZAgsSU=; b=Af7628D1BtCwAfBcXwMVrUZMV5
	an84FTxDP6Xojv3wr5xSte6EnAt1PwAG2oyELJhv7vMhVphhnD1Itc7aS3+n8R9CFjHeirT896nzp
	kAhBHXpqO3SDUTvbTlkS3YrLbegeChM2w1j92bLhxzqQFpjzb4nBkpQF30RcTN/hzmcz8amSTkMtv
	c6eNU+lE0V0rBUkZ7l04hd0yJJSBDQQUiGRgr572kiO0msKPfNuC+wU41TucOAIIGZQAVAYiAjhiU
	NNtD4h79eMRGhggDllDCC9zcVYdwUD1VKO7rzASH5aMW9G0FX5N9+GC/NW65VFhZ/TegzO0eZQKTJ
	15LgpOQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNA5-0000000FeOr-2kfZ;
	Tue, 30 Jun 2026 01:21:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNA2-0000000FeOV-3LLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:21:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8424b00710aso2778827b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782473; x=1783387273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSeLpSyqZM0d28vZftrA3N5zj3VTIegp6CHksZAgsSU=;
        b=pKAFHaUvMqWNCdCUFJJJPgPOnCE926RfuFlEJCnWRP4Hu/FDFBAw0Fme2Bz7rhxVHg
         SILew476tesn7mIvhNoraVxsOrl5Y+EazpEJTxzsQzmuHUgmXfbI1mrTH+6TQM9pVjX2
         5fIV2BTb/UGI0ykyEBv665p2c+En/fJ4JYnitKkhJwNG+JUfuwhgqll2gl8zb7aFFjV1
         UFvhE6c2xx8d0fQ6eK/X5Zsxc02SoXZjU5CeQDwCQnIcPWXuSpewHEFOOBIfZQpEmm32
         kkBljPrDfUJHsX7e0S0WPrVHknShL34XfIlvFGhtr8Q102RybUAIEp/jkLWSgustQJ4l
         z8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782473; x=1783387273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSeLpSyqZM0d28vZftrA3N5zj3VTIegp6CHksZAgsSU=;
        b=bX7C375OQssbFfq8r4dr49BUE/OKUiK1Kbk3TNZQqhIQHt0XE0Eau2JrZU2djnNQnT
         iizct91QPx/Bu/NbddE242ZSjZGVRHUJp0+P5s24mrfyFfg3pXFyipxYeLCUYVgunYk+
         Vkmu+S6qv3Ixtuz2sFtZMSpgUTS+oK6TyYz4IK044x8fc+4W9ThWsBxC7TZapwHsJWR8
         CA1yEZKLoFu0Mw9g/uqQTplTsbH3cN8W4Ng0XEaI+9nU8f0swaWdFVxBqHv3g/stLobc
         l5/z4XP5XwJ4eM4Wr+cnRhrYRv26K53iCxxVcxkvjj+e5fGGynJyTEQhJjqEmjUFKVvF
         W+Jg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7SOrcfZ80sdcUkuZqAwhOeLJfxE/QV2dZE+i0CCwLiL5z+2SVbrvTh202jilyzqAIL0eAbRNMI3a4TaQtj+SX@lists.infradead.org
X-Gm-Message-State: AOJu0YyEt+RxFcyaA+I3cbVOugqWFcHnehRbk6j6H7U41Vo/JjcFmctG
	PmSxIWYHyfw4nh6KZH6AMPOaJw7SBHl0g+bDMwPYEQtyNyQsFhNocaYj
X-Gm-Gg: AfdE7clATNrhYUeNcntNpikefLqNXadK6paetdg727+EpaKzst2KVWVxDsI5dZRb89Z
	b1TdDowhjxdxcqvggYSajDhk8Ww+SXFnO4/G31xTVJ7T4iz2YgJcqHuWplUGzSb11PKbwGX2+cl
	Sjy2qmHC1IQJcnQk0O8RlmAtfc10L925Y/3yD3ufb+TmyBPJNh8lDbarhW4uyW3koxvLICskunL
	us+sD4iNEuyfDlzZQowsBQGXsnFmz/hGT3oqoWxR2+qlDUpVeYGy3quSeohgOLYjU1Q4yOzaT8r
	2A0GE/CcOG/9Csx0rD6EAqV2yKjaOAkXDuAkxSULxaRKymSpkfM1iDeKTxWdJ08Dnmst7RFLly+
	GtNmWIX37Nt0y/0JNzPBE6Lj97InLr7JkIt3PHUzSV8rnR1xOq0CadBlRcJh6q6Kg8kByLnTCGO
	LHrOOMCtvi4RnhEX4SP412ENVhwb0TW3bn3kAAZ/FoCGT0jqpGrwiz/t6XoMuR3NengDUaxU0=
X-Received: by 2002:a05:6a00:4515:b0:845:cf86:9469 with SMTP id d2e1a72fcca58-8479f216724mr1371011b3a.29.1782782473138;
        Mon, 29 Jun 2026 18:21:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm654503b3a.49.2026.06.29.18.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:21:12 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v5 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Tue, 30 Jun 2026 09:21:03 +0800
Message-Id: <20260630012106.3616821-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_182114_844226_23A600B3 
X-CRM114-Status: GOOD (  16.31  )
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

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Changes in v5:
  - Patch 2 (driver):
    - Add spinlock protection for MA35_CTL0 register access.
    - Add NULL pointer check for i2c->msg in the ISR.
    - Use devres-managed cleanup (devm_add_action_or_reset) for runtime PM.
    - Use pm_runtime_force_suspend/resume() for Controller mode 
      system sleep.
    - Control I2CEN bit enabling/disabling via runtime PM.
    - Refactor arbitration lost handling in state machines.
    - Remove unsupported I2C_FUNC_PROTOCOL_MANGLING flag.
    - Clean up readl_poll_timeout() parameters, retry loop, and
      unused macros.
  v4: https://lore.kernel.org/r/20260610030208.2020275-1-zychennvt@gmail.com/

Changes in v4:
  - Patch 1 (dt-bindings):
    - Update example interrupt number.
  - Patch 2 (driver):
    - Remove redundant spinlocks and fix 'irq' type to signed.
    - Fix target address recovery in ma35d1_i2c_reset().
    - Refactor IRQ handler for multi-msg reads and NACK/IGNORE_NAK.
    - Fix timeout UAF via explicit IRQ disabling during recovery.
    - Drop IRQF_SHARED and fix PM paths in probe/unregistration.
    - Limit suspend/resume wakeup logic to target mode only.
  - Patch 3 (dts):
    - Add missing i2c0 node to dtsi.
    - Switch SoM configuration from i2c1 to i2c2 with updated pinctrl.
    - Add nau8822 audio codec node under i2c2 on the SoM board.
    - Drop redundant i2c0 alias and clean up dtsi property ordering.
  v3: https://lore.kernel.org/r/20260512073953.564323-1-zychennvt@gmail.com/

Changes in v3:
  - Fix minor DTS formatting issues (whitespace, missing newline)  
  v2: https://lore.kernel.org/r/20260316063726.41048-1-zychennvt@gmail.com

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".  
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.
  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.
  v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com



Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  20 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  72 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 803 ++++++++++++++++++
 6 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


