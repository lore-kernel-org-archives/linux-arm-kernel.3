Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336EAC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bSy3QbJRv7DmGrlDT8/1wLtqRMpqrMZ9rZcc0aoNiSs=; b=oY+cN9jIMheSsWZSd4bHTw6693
	IJEF8dziqNTKWpBcp/piy9xDgNbkckiUgEaCjwUc5leR/DK1Mqo3jS0B9ivUx4ntuStiRKf1AEh9W
	vUe0ThXa07yoD+3GBI7CKc3NcxPir3qDTJSEckFmbFs1wuq0jnel8AobxFOb5ePxQyXjxZGGy9MYj
	FRxd3EmJxJYgLsli6UNJuQqGef/+3jzQEJnJXeZsq4MeZRDTfmjFqWCEeaBI0qB35EXgooXiqiUR0
	uzS3ZFM1PQHeaOCSUqM+04fHppEMhunQg/Wl/aQ9FZ8hGR/RoI17bZ8dB5RVncVA5rUJWoUZ0xkDi
	Ojq4G0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xQW-00000003BgE-07bp;
	Sun, 27 Apr 2025 08:31:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8xKH-00000003Aif-0bZz;
	Sun, 27 Apr 2025 08:25:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736bfa487c3so3094523b3a.1;
        Sun, 27 Apr 2025 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742324; x=1746347124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bSy3QbJRv7DmGrlDT8/1wLtqRMpqrMZ9rZcc0aoNiSs=;
        b=K1No/fxOLiJ31Vz8KrYVjCHqVEFWg8d29ZYDRcoI1skPB0B4xo/wFKxaJnPctLM6Q+
         qz6YZ1EGoMxdaRfkeE4N7AQO4jiySK3aBKHvc/1AIEIZGPCODtYxvDZ7o2+EsojeMcnu
         LfjiYpUv2MxVIK88rw3cEqvyjs7B+ZQYR4DsSvMBvhOeiAL/yIUa/1C/A4JFjtUQ96dv
         j8OI1cRRMQJUSXW91k7rZsPXAO57k5X5Adpffu0EyBSMOHuCITodNEumGkkoLEmqAGq5
         trA2fucpyVu/YZkU/lCn2CIPdjYiE+S2wftIFwQp5KdfWMnk74xTrdnYWU4kbWhHq2GR
         qgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742324; x=1746347124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSy3QbJRv7DmGrlDT8/1wLtqRMpqrMZ9rZcc0aoNiSs=;
        b=RGNCZdL6x3K/+kKekVLAqmHCRRxsY4Zwo9BVwhOx9Z8XLmpkG7DKXYH2nA7nIBCt6u
         YlJsGkoUlyRkfzWKAcxHJlGb4uvqvp3FnvqBkrt31eEEyfxnErz1BQv+Ux1zG0vMGYsn
         k70O+tgIaXYmJAtDfC2+ZKwhQlhsA/qBq7mmD5HDdFWmssPtFrroeLRrvXpD6JhYd76D
         CIKueH1BtoN2jfIpnomcVmMMlv4+itlKaTw+PQkVPK9thas2ENerSDBjmzNIOCSVCR1F
         k0O6HqAdsO2YDpJAcZUHktLYvCHs05Ws4/rKd3TCbRSWahNc05lxvt9H39b4LleMGv+q
         T18g==
X-Forwarded-Encrypted: i=1; AJvYcCUyd4x+zFUPRO4vmNEURGRl/edjAd1Gx8ShBZHOc96HtT+bdEbCdk4SnF4zsEFBGwcCvtjjKXeq4ekTbTLumdQ+IA==@lists.infradead.org, AJvYcCVNqpK/vKv0NEIUD7bgYjIHeidgBWMOtNFk6NbL3vMLhVKtiXIjiU+NZXfh9q0OTxJNKFnQ+MGwi8ZsdX6mY4Eg@lists.infradead.org
X-Gm-Message-State: AOJu0YzGHQUjJRf/B91nXmR/s5KcIyj3/f2iStf3+t+PKvFlAP+0twP3
	Kdd+7AnfZ6VtjBq/DaQXyN3InvYpKbDQkqeOPC/+v1eTdpwcWxET
X-Gm-Gg: ASbGnctOHx5RQIMlTG4Rf7ksT1HBBLm3K94S5VAqg9KfZEfiwe0D8IewR2KfQeJbP+m
	fhoYZ39Cl8Qa5gZpJ3qINcr8c7fOvn23XuyAeuypI3SUDF+LZEi3f8qzAqnWoW/A24jzluGgUaC
	xlLoT4gk46842z2JvuTBcd1vkIopISyE3oWXJKADQFxewAWw3Rbdb5ayANaWamRv/1aomVrjY6P
	b6HX0pdqCSLMor3lHNbopv8NtDokBSdu0HIGw7inS7CgDdoRGhitVYtBzZrvNHXuy7SU0Fv1bmt
	k+flA/jLRq3sqkyaDHmTtLPze7ceZ1Dr4XGwUs25sTqChVsieRnzpA==
X-Google-Smtp-Source: AGHT+IG5qnz5GOAH6oZvY00TzTjs1/+wlVcc1GWPA84EcPujdbxxX4tiX1r/bvb+09d6pEDael2hEg==
X-Received: by 2002:aa7:8889:0:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73ff7247e46mr7010787b3a.3.1745742323637;
        Sun, 27 Apr 2025 01:25:23 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:25:23 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Sun, 27 Apr 2025 15:24:42 +0700
Message-Id: <20250427082447.138359-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_012525_188250_900F99F8 
X-CRM114-Status: GOOD (  16.15  )
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

This patch series adds support for the TI/National Semiconductor LP5812
4x3 matrix RGB LED driver. The driver supports features such as autonomous
animation and time-cross-multiplexing (TCM) for dynamic LED effects.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
Changes in v8:
- Move driver to drivers/auxdisplay/ instead of drivers/leds/.
- Rename files from leds-lp5812.c/.h to lp5812.c/.h.
- Move ti,lp5812.yaml binding to auxdisplay/ directory,
  and update the title and $id to match new path.
- No functional changes to the binding itself (keep Reviewed-by).
- Update commit messages and patch titles to reflect the move.
- Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/

Changes in v7:
- Mark `chip_leds_map` as const.
- Use consistent `ret` initialization.
- Simplify the function `set_mix_sel_led()`.
- Refactor `dev_config_show()` and `led_auto_animation_show()` to avoid temp buffer, malloc/free.
- Simplify the code and ensure consistent use of mutex lock/unlock in show/store functions.
- Remove `total_leds` and `total_aeu`.
- Link to v6: https://lore.kernel.org/linux-leds/20250419184333.56617-1-trannamatk@gmail.com/

Changes in v6:
- Add `vcc-supply` property to describe the LP5812 power supply.
- Remove `chan-name` property and entire LED subnodes, as they are not needed.
- Update LP5812 LED driver node to Raspberry Pi 4 B Device Tree, based on updated binding.
- Link to v5: https://lore.kernel.org/linux-leds/20250414145742.35713-1-trannamatk@gmail.com/

Changes in v5:
- Rebase on v6.15-rc2
- Removed unused functions (lp5812_dump_regs, lp5812_update_bit).
- Address Krzysztof's review comments
- Link to v4: https://lore.kernel.org/linux-leds/20250405183246.198568-1-trannamatk@gmail.com/
---

Nam Tran (5):
  dt-bindings: auxdisplay: add TI LP5812 4×3 Matrix RGB LED Driver
  auxdisplay: add TI LP5812 4×3 Matrix RGB LED Driver
  docs: ABI: Document LP5812 sysfs interfaces
  docs: auxdisplay: document TI LP5812 RGB LED driver
  arm64: dts: Add LP5812 node for Raspberry Pi 4 Model B

 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  |  144 +
 .../admin-guide/auxdisplay/index.rst          |    3 +-
 .../admin-guide/auxdisplay/lp5812.rst         |   79 +
 .../bindings/auxdisplay/ti,lp5812.yaml        |   46 +
 MAINTAINERS                                   |   12 +
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |   10 +
 drivers/auxdisplay/Kconfig                    |   17 +
 drivers/auxdisplay/Makefile                   |    1 +
 drivers/auxdisplay/lp5812.c                   | 2736 +++++++++++++++++
 drivers/auxdisplay/lp5812.h                   |  348 +++
 10 files changed, 3395 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/admin-guide/auxdisplay/lp5812.rst
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
 create mode 100644 drivers/auxdisplay/lp5812.c
 create mode 100644 drivers/auxdisplay/lp5812.h


base-commit: f1a3944c860b0615d0513110d8cf62bb94adbb41
-- 
2.25.1


