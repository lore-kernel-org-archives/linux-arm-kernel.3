Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2863DE9539C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wB0VLDAPToQ8yD4B2A1a5exUgv0J2v5YL3Ju3cLJeTI=; b=yNqu2u9YhtkaPkMP3kJXhpqwf5
	FmVcp1iR9j7wHBqnxd54S7LkToUGIdr2LasUM5GTbLogIHaSQRfCbUVrNn36Z1mTAPNg9/+M5elcu
	610GqNYDPIi3WeLdoJeadqvigEru30lFK81ceHRQMUjN3cQugz+VQ1pe5i66r41XxfIg1F1KQa5Sq
	ouD/cKOTT7pIcTZBOFd3fUsFqA/AHwUMSIoDh/YA1uuaSC4V5f1/tvW8XLEN7yE3/dpkmeLNy+VaU
	lTvp0g3GLzKK4sy9VZcX8Qlcr3BQkkHiK0K0mt2sJdBIBJ3v/yv7EikwSlrRak7MlsXM+PBBcuIxs
	oHzgdk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncuV-00000008VUh-3Sl4;
	Wed, 04 Feb 2026 13:27:11 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncuS-00000008VTw-2EZs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:27:10 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-352c414bbbeso478463a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770211627; x=1770816427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB0VLDAPToQ8yD4B2A1a5exUgv0J2v5YL3Ju3cLJeTI=;
        b=icA6IlJYLLuGJi8k62akX7TEJJvatMCX2WfaKkk1pm6kQsc34MbWmTUD4Hizh/LONf
         +xECSTLHekhKvudC0k7Wz4M5iMkljwXmm7jqxGa59IT4JvMaoIyUsWW0iTWfnoQQy1WD
         06NB8YJDVuxUxAu3aCvQVx6OmIZ8DUczmpE4JtAHpZhKiNkBTSAnBjkVLxVaNEkPo1xY
         giOFo3jAwexLxq4BbUwB5uy9s51KFXK/yHMKhwdjndqDRgf3OEHEnywtmCzweUhJPa60
         fQCy1FNJ01aepGeGc8HvW8Fr6L30vIdhbMaawo5Ud5iTx4qHQlB0eT84ttESpE4WFEbk
         56Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211627; x=1770816427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB0VLDAPToQ8yD4B2A1a5exUgv0J2v5YL3Ju3cLJeTI=;
        b=WfL1VTb+QGzfTpakfOCuACo21jGFX0o6g0IN3T6eIh6XrX4z0dyK8EHbhznymn3cGT
         /JY5sX1f/yHveXlpg3N9AJNDE+88R0MqvmUcKwd/acVpOOkDTN6FRzWIJweQFTrOQo8+
         G0DBNNxaf2m9QlsnLU6BH7mdBGWI7pSASH/IHuOktsX8Umi15SVtlzzVJz2b1jL6bwgR
         MExf7yGHQB9k/rcRhf26jft/SjiTgweISVCKQRnV40YvS/OEJ1cVjjuaaEep02v7nv1P
         P7W3FN2np1Hxqn9DDE1NXCGFGyF/vxnYQpmVVYJ4z4t5HPhQdPBU5TplQezTlhRJ0cPt
         cHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8bZXVLF9iitwOnzj9VizFg96bkmilH45KpoMj+XN7o4OW7rH+TtvM9pDwbFgq5aTFMNtaUHCyxcaGtdWcRflf@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrJE1T7RAhk2/Rv2kGGSvf7ieN3wiLaYcmqlFAsw8+WeuIXN/
	XAqrfZdj935/4Zcc+XPt3Vwq+X9Y1ZwyJD22Apws0eMsUykdfRFxf3iY
X-Gm-Gg: AZuq6aLYUuH4naKfk66sEypKEavgmDlXwJgHelkKSbjSo6ptcNtKWnPH+EfASV4C3+k
	42ogGvXSRcjXHvWJObAf2vtD9xbmEasDp4Og8oxDCtPUYCV16zNTIIqkXl/7Gb/cY6qtUVkx6Xl
	d60tZCFmTtDPKF/FNG0+fVck4Dx3Hsjck4aX71bCeetSLqzSAaSh8EO3k7rn9FppK55wjfnkkuc
	GWWwNtBpVr0Aw/DyBxk9LTWqvEtlwQF2nHrD3EmX7iGPDnTSNsopGArGpLISob4kYt+NBm4RCJA
	f6HCSiGkB0aM7BgCJOFYegfMNjedvVOdAQBtFKzHa0oTKB2HGhmHQLKwCve4s7mcxWBmEDHPUtR
	nubqwXC6v5yNpWeWzgk7z+BPTYF3mbjR5YnnYnyiIVca7+GMmUx8Bpj1bVttaM4nfjbCpLQYg2F
	hPsOwHQRqg
X-Received: by 2002:a17:90a:d64d:b0:352:d0cf:9d18 with SMTP id 98e67ed59e1d1-354776e0a54mr6454276a91.5.1770211627186;
        Wed, 04 Feb 2026 05:27:07 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487726e6bsm875763a91.6.2026.02.04.05.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:27:06 -0800 (PST)
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
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 0/3] board: rockchip: add OneThing Edge Cube series
Date: Wed,  4 Feb 2026 21:26:53 +0800
Message-ID: <20260204132700.329894-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052708_576597_D0D9E41E 
X-CRM114-Status: GOOD (  14.43  )
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
 .../rockchip/rk3566-onething-edge-cube.dts    | 312 ++++++++++++++++++
 4 files changed, 320 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts

-- 
2.52.0


