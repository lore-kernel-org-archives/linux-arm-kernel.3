Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED4D7977E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFQ3JH7bTaVaIkyZ1bwbiUf2YzJPD1mXXk4UJx103/U=; b=Z9G8y+MO2unkdWAxWYIz7nNYQq
	IGthmGMRFkj02kzhaoeTAjJI08n3nyXO310lmZAFo/hkmFO4OajO/S2EgtjFSNbxYtQ6myUYfNSc8
	+e54wSBgI3pxMANUAULoPl9DJc7aHfGbGszg27o+1lcWZmZEJpRkf7n4W33dEjLoWn3DdtxQoW0NQ
	SMJoD+LwxuNjsLhG07uBHJ3mB9BPc2yxtB98zNv4koz6khdx0vm4z0p6UYUIa/y9gq2bnwcZuqwop
	4mV8z/vArBGUEtlbHJ0gKOt85pI+BsYLexWpcqzl5Srn2XttVmRmeQSSX/hJ6H2ZQ6Y6uf7Nzu37R
	WbgT7/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwT-00000002kJf-1hLl;
	Sat, 31 Jan 2026 15:31:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwQ-00000002kIt-3DMj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:31:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c65822dead7so1182936a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769873477; x=1770478277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFQ3JH7bTaVaIkyZ1bwbiUf2YzJPD1mXXk4UJx103/U=;
        b=JZbhucmlt5C1W32xkKo1OH75IOF8vfYHzjjUX4EENRWHFRV2fjJA4+d32dUiLYG7FI
         1ijGjDZEMcfz45pCN46qSxOB3Y+L5VaM0br8vlZyUGAumtgSlwOZnXIirssno6bWqLW2
         1fRifZGJYAMi+p+1QV6YDGseKvWhb2QuKoaBUwCBSr+SUcnTpkC7nVrgqx6j480dnAn0
         y6b5HUAhCiGmjtzwexsaGBtc2J/0TOkVMuUrTtvG3PAADl6tEhxcm06DkBHsDZvV6nrf
         Dj/KjtkW6V50LbYv6xIsLqd+YCCqWLz8XhYePRJN2lSWe/9bZ+wsQRot0ogwi5iX/hZx
         VW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769873477; x=1770478277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFQ3JH7bTaVaIkyZ1bwbiUf2YzJPD1mXXk4UJx103/U=;
        b=rlX7kwG4RScbqqMOKTv1jKzp1jnbcLrxXUWdozxX/Fg/IuMZ1Gtuvg4JCcDebbm15H
         A9DKUbXdlKzwSHmvEHSUO6eRRQ4LNgB9IUGCcRUYPRHJd6boaS8gagb+WphqMsT6D+VF
         4ZxwSPHiCJOVUNGcVJtpQC9cBgKygHm4FqPrswROSqNHjzB4hEE4CtgWT9aZzjb1Y1VL
         iHFJEdbCRWa77S35ld6IUk0xLoPLSPTuYoUDQ4JhdfRYrxtt/85qqGdoyXBJiEfYW4Oa
         go9jbjFm1pDi0CQBefrpPZapcA1rNEvXzViMdfDwKpv9B6uNkpjotLE+UpTzhEFz9dNL
         jLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoLbtodd77ziPTNXVnfm+rYdFdH7OllgErc1fUkCQG1gRNYeyHxYBBCPG/ROTkLXyFeHo/dEnseRogd2alVPj8@lists.infradead.org
X-Gm-Message-State: AOJu0YxhtgNLQvwPzPkQ+Rg+BE3NH5Ctj8PlkmLhWdbfEUtTsFiPSmTo
	/1cmUI9ZJq+H8LoCIhfIV+VXt1RPpMiQhuTgsyv2xNuy06elizSicSDmUa7zWfIV
X-Gm-Gg: AZuq6aJOsAZExD1AGb+lLePkBfvIHFUjjXqvmte1pXCJaODSx+36fkknwSs4sv19Rzd
	TwxzkzUKmYkT8MB2M0u4Ljeyu2RxAQtk+r/kNVzvauXxJdnQKq7RL7kgpgL/YcYYzdXtzU45lKr
	8jBkxLEDTHV80gvJx0Tf3QLhzYsKGRBTE4F9MArKPG0gMLbFX5j+jqNIX6ZQgAv9kTtLAVZe6pc
	29JMhrBAU2Cmq+m+TA+B5HWRwTCAttK/mkpzj3qqiujm0xLJt8SCYpGipTjZB1f0aikTPYSOKfQ
	M7CGJV7JpjrMbhwMj2+TI4GmdP8AYmwdJFdVOf8YCDKoHMOEwwteq/vzwy8HjzFKWnJ0+l11q37
	f/FHEdK+kKG7AxH3LiwSBIWXq/whOjL1ozIfyjfavvpiXRvbIRe64ndzHTSXm00nZvhQCtqmyfX
	PulMsIy+TaKag/GID8z8hLbKeLM3dvsYbQevoKRC4LkPOdrc/+
X-Received: by 2002:a17:90b:5868:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3543b2e0552mr7576153a91.6.1769873477161;
        Sat, 31 Jan 2026 07:31:17 -0800 (PST)
Received: from arch.localdomain (awork135098.netvigator.com. [219.76.135.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642487f1f5sm10701122a12.0.2026.01.31.07.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:31:16 -0800 (PST)
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
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 0/3] board: rockchip: add OneThing Edge Cube series
Date: Sat, 31 Jan 2026 23:31:00 +0800
Message-ID: <20260131153106.31723-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_073118_798406_7303F2A7 
X-CRM114-Status: GOOD (  12.78  )
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

This series adds support for the OneThing Edge Cube series, which were
initially marketed by OneThing Tech as PCDN (P2P Content Delivery Network) 
devices. The Edge Cube series is based on Rockchip RK3566 SoC and is designed
for PCDN applications.

The V2 patches adds a new device, the OneThing OEC. Together with the V1 patch 
OneThing OEC-turbo, these two devices share identical hardware specifications
except for the RAM capacity, enabling convenient support implementation.

The V1 patch was submitted quite some time ago and is now in an archived state[1].
it has not been processed due to scheduling conflicts – apologies for this.

Changes in v2:
- Fix typo in vendor-prefixes.
- Simplify company and device names.
- Add the new device OEC as part of the OneThing Edge Cube series for support.
- Set display-subsystem node to "disabled" instead of using "delete-node".
- Using generic node names for leds.
- Follow DTS codeing style in vcc5v0_usb_host_en pinctrl node.
- Modify the phy_mode of GMAC from rgmii to rgmii-id.
- Adjust device tree node ordering to follow code style.

Link to v1: https://lore.kernel.org/all/20250713163255.163669-1-jerrysteve1101@gmail.com/

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/20250713163255.163669-1-jerrysteve1101@gmail.com/

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co.,
    Ltd.
  dt-bindings: arm: rockchip: Add OneThing Edge Cube series
  arm64: dts: rockchip: Add OneThing Edge Cube series

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../rockchip/rk3566-onething-oec-turbo.dts    |  10 +
 .../boot/dts/rockchip/rk3566-onething-oec.dts |  10 +
 .../dts/rockchip/rk3566-onething-oec.dtsi     | 313 ++++++++++++++++++
 6 files changed, 343 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dtsi

-- 
2.52.0


