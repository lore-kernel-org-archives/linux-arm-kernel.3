Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7903E77198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vx99Y8SQrugXLJ1+GA+aTfa0OBhtUac94dHDKuroZ0M=; b=wPBUFjVxu/+oLsFUP6dP0bD7Ny
	6r88z4Y/KMs7t8kams4G1y8L1md1xCygWI/6ZWpQxKizrtHnDM7oMeo16jTCkKWifL8u1ps+pTyEQ
	V5/IEjEJc+m0xaAotU4L8bK7NYNY7B7tmLxLxfy4XCGKXBdv1Isjqndm//DBL5hkzoKWU3jlXkleg
	bR5Mn+6oJoj/ON/ctOFVE3XmLJ1ZNy67TllTAqd3y+0d3NbcuVXJXWK+NjrA+K4fqGep5QqNyGgNW
	/xGTkERyZzj9xwg/rKIC7bBA3EaP0wrHQUy7aFGwp+LoFnRZzcfVtrZtIoZZRDK1dXTjYRZf7/oTx
	wbUjg3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKjR-00000006hb1-17yz;
	Wed, 08 Jan 2025 01:19:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKiD-00000006hGC-39vc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:18:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21631789fcdso4305095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736299100; x=1736903900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vx99Y8SQrugXLJ1+GA+aTfa0OBhtUac94dHDKuroZ0M=;
        b=O4uXxzx34eHScmmRgvEeAw/CNZJI4LDZ86di/9WGKoVebcSt8PcBD5y0Cl74mFsvaX
         4RlxLyvyLHCZAbwVVCPvdc+R/5yb3j+ZT24hTwuWUeHpbtf6Yt3Z9dLVw+fFwYt/f8yE
         RrtN/E52JHdEnxNbdKNkBKzKajN8AsChjpWi35NWkamgoPauZ6NllKwUTX8yFFmrMVaI
         YVdh7gzawAamK6xCFt4pgkBQ+Hk7Ee5dI6+8BAQJ+RcAxpWtDBuVcBjk2JagD6iUFsF7
         a3DmJBfBfCgwWXtKazVnehrsmwDC/j4wQQQLeB7Fd9GODhwhqA6qIhO21LgZewtoHUmW
         tjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299100; x=1736903900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vx99Y8SQrugXLJ1+GA+aTfa0OBhtUac94dHDKuroZ0M=;
        b=DxMnpy+OQebLZgANvyAVk7fnyyiyBZp8ZjVvFT9XGS4zYlWzR3wa8+lITiMhHkfmym
         sxDz7DkxvEZiE7UUvl9eh5a8mRw6avVZY2n9kgf4Y0IJ2i+RAOGNZQTSG3EFoQs6WFkI
         pC2xtiDNWEmHCoqdVP7S913Hg14u+hJ3JjRlv5cLzHCKREULX6zS4DCp2T1DUB7MH9PL
         vAnJJaHhIELBQxPvQyGXIr/1NTktCGukuXkitoWCFbgt6mfOI7HydAea02y6ewPFwYqv
         nz+y0dLIS594+l6W5wq6RO/VqfjkzmDc8N7gt9xnbFsrw8DNinfGFEF0KqctwoXQhyDd
         4Kew==
X-Forwarded-Encrypted: i=1; AJvYcCWH2pNKoco8RmAEblKIW5BolkGwePQ9B8THMKHUF4o8pN8IICmxJ9HTVjg5pSkl8ba0tn0mZ3GK8Ia+vk3bMl2G@lists.infradead.org
X-Gm-Message-State: AOJu0YzYH8sHmIw4Kc895jkTXdXZxIYPCKWHAvxo4nSn7U5kVAJCKz2h
	ulno6UYT2ASCCCzDBAwIa2NiBx4ulSlzRiIa21sA/dGajISEkXXl
X-Gm-Gg: ASbGncvXE/2joBa7m+APVg5ZDZjIg2pjraPvflWdi/pjomXb/mz/9T9t4efQdL8YJVI
	76DlWQFPpHJ8IHbaIQUs03E6nkw8JxLLQQ8b83CFFKRw3Smh2H21PapiJyVdpBeYqlE/u19kL3K
	a3y5neckHT/Z04XJriE7l8FYds29HC6Nzmou2aaK+mDHFRAVsZ+BSpZvWdh7WnXa+yAY+5xIVl0
	SLzdUH24bXSDP4g46ARvWboUD4HQjKs1wiNrUfTUL2N4fGEw/W+XUTy/M8lRyJ2670frc/Qx5a+
	cf4rRY95bJWFp7p1Xa1c2ILJgPug00T6OkP34dTVqg==
X-Google-Smtp-Source: AGHT+IHBXjlnMHsFnSJ7x0oLswpnhQiItsRr5cWXQazhFwNjODFq+rz7pmKosjS34A3gO044xDQ+pg==
X-Received: by 2002:a05:6a00:843:b0:72a:78a3:7f57 with SMTP id d2e1a72fcca58-72d2171f607mr2054335b3a.9.1736299100053;
        Tue, 07 Jan 2025 17:18:20 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83033esm34045009b3a.48.2025.01.07.17.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:18:19 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	sudeep.holla@arm.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v5 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Wed,  8 Jan 2025 01:18:10 +0000
Message-Id: <20250108011812.627-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_171821_817229_D62156BD 
X-CRM114-Status: GOOD (  17.42  )
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

From: Ming-jen Chen <mjchen0829@gmail.com>

This patch series adds keypad driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 keypad driver.

v5:
  - Update nuvoton,ma35d1-keypad.yaml
    - Reorders the items in the properties and required blocks to ensure 
      their order and items are consistent.
v4:
  - Update nuvoton,ma35d1-keypad.yaml
    - Kept the same order of properties as in the required block.
    - Changed register addresses to lowercase.
v3:
  - Update nuvoton,ma35d1-keypad.yaml
    - Removed vendor-specific properties and replaced them with common properties
  - Update ma35d1_keypad.c
    - Modified the driver to reflect changes in the YAML properties
v2:
  - Update nuvoton,ma35d1-keypad.yaml
    - Fixed warnings and errors generated by running checkpatch.pl
    - Removed the previous version's properties and rewrote the
      properties in the Device Tree schema.
    - Renamed the Device Tree binding file to nuvoton,ma35d1-keypad.yaml
  - Update Kconfig
    - Added COMPILE_TEST to the depends on line in the Kconfig
  - Update ma35d1_keypad.c
    - Refactored error handling within the probe function.
    - Fixed the mixed use of devm and non-devm resource management.
    - Corrected alignment issues in the code.
    - Updated suspend and resume handling methods.
    - Fixed variable naming to remove camel casing.
    - Used for_each_set_bit() to check key states.
    - Modified the code to align with updates in the device tree binding

Ming-jen Chen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  82 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 387 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


