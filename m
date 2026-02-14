Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD00FEF99F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 02:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7kXqefz6Mz84tkpvy0FFhVFi9KVDmRut/+pi1Uax3Y=; b=trFGWorLCRpLqQmdez0asJQyxQ
	P4CAYFyGl4BWeSyHH1QGAFpEaKgytgqSBzqUA6gnvUX+/KMgWHCfIIOG/fEjEvreGBWF0bQg8q8jV
	cIgdDCHFa+8cXZxpm1gpQRs6XssNm5qk2vnoWaGF93zrTGWSDhWlRj7+E6abvREdT8c6MMerzKhL4
	qYVJxBe9k3MxRuwgHdTX7EZmoZjXcsoX7VdgjxiN+FWssCJxZ2Q3PDwJ1STgF+ft+UEc4LUCkMPz/
	gtiZoBIrAhPyKK5HorRNH8yLF8JHWiGO2vQ/XZEw1lQbl4PROKF81SUhPmJacavv+QW2s2F9VFIJs
	+32ftqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5EB-000000049V6-1Dvf;
	Sat, 14 Feb 2026 02:17:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5E6-000000049SL-0HXi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 02:17:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-483770e0b25so8826345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 18:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771035460; x=1771640260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7kXqefz6Mz84tkpvy0FFhVFi9KVDmRut/+pi1Uax3Y=;
        b=fPnpv0OcixEBLKAtAJ8EB9Y0SVhZ4DcjDiFSkSGj7kOE+9aML9XEl0RWIhUggNQ9u4
         ApycLdhQu4ogPsuVN70rtETsV+YIA/GCEnXDWp3ZfJ3OscAlaBdKg5RDSGm3KtoIy8Ik
         66ukupWhta3ArRWGcVKxOdLtPO6c7HYGwLUyp7cqfM5/h7Evz8XpxzEBIfgSY/pU0zJz
         nGBBRrikXvs1vbjFGz9VwAymuxw23nGF5INrOG9vlAWA0guuDW4DR7rXrsfezcR0lwOi
         8wUcGOx15uAjM3cKUh7xKOP6rSnUe/xA2OQd0hRDuOIGqSkaQNaWb4znapOac+dubKxm
         U/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771035460; x=1771640260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7kXqefz6Mz84tkpvy0FFhVFi9KVDmRut/+pi1Uax3Y=;
        b=NQwoDZrWyxrXy+ytzW+eCtaY7NAheSOPhHSV2bT7y4lw9zqAp7QPYoJ9UWW50ZOnHl
         /ktlK00fvqHJPqFmbBZ+SqzQQXv+9pzDI8WhIqFtD+lrVGm5j+XSe0ku4BwTjT1D6tg5
         12WSlOl4UEbGmP0Ap2aabK0mm+0U5cpRhQuRw88X2DnFkLjtqxVTIgZzsiyZRzNa3FVp
         pIL6aNpBxGDQop1lZnz0v4YoT6n1CD+zShSFG0mvsJ9bupTT1UB0OmMTnyDnO82wuT/z
         q32elpk9Qu1SyPavJC4oYG2yvh2h7MMHwgXMmjB/SU99VMPF+w9n1pnn1nHV6HGtcV/1
         swcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1IMEKbE4TnjzBaIo5GVAllgKbBL3CqMllB+Ld02oSnTbMcq28YZL6Dr0wfbJMjX7zVN9h+3hZzOpVwXJe2En/@lists.infradead.org
X-Gm-Message-State: AOJu0YwRpbdn9dpC28/Pd5Us6WNt3heEPW6N/mS4FoQxBonEhkTBT47k
	Be3m3WqjsSKB8EUr8mScuA7ZbKDdpcocBbWyyv2qJq0htqrOV/nr1870
X-Gm-Gg: AZuq6aJp3e3IMUiHbN6SK+vgGc7H5oQe6YgIzaOoZDYwTxizrDespONsaAVF/T2CflU
	zXXe7PhHjzDqtJNqgSKzGBOYsxJgY8LnemQrOG3zH2LwJ4mrG+cGOgyaRNozMiFBeYA8JgAndAb
	PXYQq0xnEzc7dYwCo2wDqDxVth9p7RdjodOO0gXn0iDcDTlwrHxYfeG5F+5x5lFnMcnLe6oe5d6
	R3LXlTWXaXv7a1G9sfyAqVJ0S91ybQQEqjfDfXGslH6N3sFubSW5jjN9a2XZ8Aia1hQEa3KUD22
	I03X07CfMGvWZUqsv5M4Ag5tIHRA1CZURTmihjEpAdIlj9cOmhjUs/lpcXItOwKxzo0EWFr59nq
	naNQ42f7mVxcyrEb6mBU9Z85UOx9PDS4Rp8rAxGAwNFY/CJF/eCuzLrnEunzFCfyAwDBSFJYZCH
	aSvUkZZtLfzLgxpsIqUkUE
X-Received: by 2002:a05:600c:37c6:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483710960dcmr70601475e9.34.1771035459856;
        Fri, 13 Feb 2026 18:17:39 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a53:6b71::1002])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm8608308f8f.37.2026.02.13.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 18:17:38 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	jonas@kwiboo.se,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v5 0/3] board: rockchip: add OneThing Edge Cube series
Date: Sat, 14 Feb 2026 10:17:13 +0800
Message-ID: <20260214021719.620752-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_181742_127830_9CA3081E 
X-CRM114-Status: GOOD (  15.12  )
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

This series adds support for the OneThing Edge Cube series, Rockchip 
RK3566-based PCDN (P2P Content Delivery Network) devices originally 
marketed by OneThing Tech.

The V5 patch inlcudes some device tree adjustments, following Kwiboo's
suggestions.

The V4 patch includes minor improvements.

The V3 patch merges the separate dts files for OEC and OEC-turbo,
following Dragan Simic's suggestion.

The V2 patch adds a new device, the OneThing OEC. Together with the 
V1 patch OneThing OEC-turbo, these two devices share identical hardware 
specifications except for the RAM capacity, enabling convenient support
implementation.

The V1 patch was submitted quite some time ago and is now in an archived
state[1]. it has not been processed due to scheduling conflicts –
apologies for this.

Changes in v5:
- Add missing pinctrl for LEDs and ETH-PHY resets.
- Using gpios property instead pf gpio property in pwm-reuglator.
- Adjust and unify the order of regulator-* properties.
- Drop rx/tx-delay properties in the gmac1 node.
- Using PWM_POLARITY_INVERTED for pwms property instead of the trailing 1.
- Link to v4: https://lore.kernel.org/all/20260204132700.329894-1-jerrysteve1101@gmail.com/

Changes in v4:
- Use a unified compatible name for OEC and OEC-turbo.
- Drop the "series" string from the board dtb name.
- Use a self-descriptive model name for the dtb.
- Link to v3: https://lore.kernel.org/all/20260202150437.270567-1-jerrysteve1101@gmail.com/

Changes in v3:
- Use a single device tree for both OEC and OEC-turbo.
- Align the compatible strings in dt-bindings and device tree.
- Link to v2: https://lore.kernel.org/all/20260131153106.31723-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix typo in vendor-prefixes.
- Simplify company and device names.
- Add the new device OEC as part of the OneThing Edge Cube series for support.
- Set display-subsystem node to "disabled" instead of using "delete-node".
- Using generic node names for leds.
- Follow DTS codeing style in vcc5v0_usb_host_en pinctrl node.
- Modify the phy_mode of GMAC from rgmii to rgmii-id.
- Adjust device tree node ordering to follow code style.
- Link to v1: https://lore.kernel.org/all/20250713163255.163669-1-jerrysteve1101@gmail.com/

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/20250713163255.163669-1-jerrysteve1101@gmail.com/

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co.,
    Ltd.
  dt-bindings: arm: rockchip: Add OneThing Edge Cube series
  arm64: dts: rockchip: Add OneThing Edge Cube series

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3566-onething-edge-cube.dts    | 342 ++++++++++++++++++
 4 files changed, 350 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts

-- 
2.53.0


