Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E99C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 01:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=; b=uVwTgBu/OslyPcMtqWjkr4DODX
	3Q65vhW7WtuWkodt5fcjdxQzYu/kDp9K1G1UCwtvbStfql+tEfkMbVvBMiFtVN56VVnijRbZ/VTQO
	7+OT1YlX9+aXtppFWWMk3fQ0pKX0DsyMvVTRJSlCHhPXtJoKTeM6633nXXjRwonrdwZRgSeoYuxyV
	d0acUxFsm06SXWUFQAyIW/V2VG62dfJwS7J69Wpv4uZPgFPQ08Bj2pzaWsI6pCl+J1/X867Dol8eP
	rOZdc+tx/UOHjmak6W3sDNTdTOngKvjnOAHZUFK1y+HxK+EPvn2krNET54krXfd2WKxbGPBm9NM3C
	BQJATPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6I19-00000004xWj-3rjs;
	Tue, 15 Sep 2026 01:31:28 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6I15-00000004xVt-200Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 01:31:27 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so2049663a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435881; x=1790040681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=;
        b=WpLGVopNYlcg60vAPGdd5nlnfHreUKLe2FqlLTbZmRJ9ftEaHLlFVs7m2lv6toqmUJ
         v98Ey6Ba2YiQz16TvuzsLO5TQq03r3Fu7FCFG3Ebf+uKKxl1jDx/bzlZYASidYewZcpX
         OrmPvyEtjVAMe9Sejckcircj3VrothPZFVR2djHRwoa5YPK+EwAMI7ZazaGNvngx0//d
         I2mO42ddDuscPhDjuN17Y9Ju8mMAOE/CbRGYWBGWdFmyFBVhbbzOb5pMlBkDAV0MunfO
         VrwBA5NM3qYLi3bRcoI4i3jnduDhag6U/ZNDWY3pPHWLCZeP37ECztv+AF1HeXhOHuqi
         Uoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435881; x=1790040681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkjxOhGzqU+8W6VS3//UzMLrdiDuidVOSy9K9CHCyjw=;
        b=ZG7rNZsXES3AJwlICEe47J2W0iGUvawxIwK1wIbzFH2IWwR6lzAeWGL08ABGH2u6Uv
         b/QMfSuoGAH8nnmUBPqOudQ0PVrD19ehIUw+YtCuKbfRa5WXiQGCQYC9I6jqc2vQDYdq
         cOTnF0w9UW+WTuxwzmLPR9i8A7TtznVZn/pCMwck8wdTuHFdjoWkNLq0kG9UGYRpozEK
         jW7Vnwe32cTXW2lp9ZfjzzKL4VyuvXb0SUoRq8kOn+5fDu/ylIHK1Os246FDB9jqsuY+
         3wOgfrHmx0McosmHl/gZvQ9pilXWnQDRINQ4PKxvIKB971nXpf/wOiXyXgnRBEsJ75qb
         8bVw==
X-Forwarded-Encrypted: i=1; AKwUvByz22NvtRiDoHL+Nz1JXn52sZWKKhIpczh7pk6ZXS4DVBYNC3ci+QQhIdEznlfFoPkwU9T+nM8HtDFSutqUMkvi@lists.infradead.org
X-Gm-Message-State: AFuF++nFIE3BL2hz2eUPsU9w9h59iDF7QPjMofBhRLgnx+0qfb7pbfUC
	MIecutgyGXdbapOCkELiIbBmeY14ihna1IPvIHuuqJxN0qrH7gxGIkt7
X-Gm-Gg: AYBFou1mT1hldqnHFFnjweJ6ZsGmMCAEV4NzRkHD2pH9eKzod5VFZFGxLWaiKcaNZEg
	lXdW3VWpVQWGP7cE1HcgTUvJblVJECgGTsDb/7yK59R90AjVWG9rQ3adpV9aFyEqkcVbKOYc/Lk
	YPIo7jq/VCcZ2odZR6FFcuoU/hjtF1mLQBips0Z+MmeO3rKaAoAMFCcoJ4ZK+JvbDM4iCyOjBQj
	fwAfbfTfx2dLVbkZeUcczZGgqP+HHTY/ayd/6FhUUhSxcjHl8g59ll9S/7352yFJvzCjzvzrza9
	BSZwUWRgNprTBKjygWfxsUadOlLLvnPpRHB65gbci2kBXl5RKehbVCWZ3a9FQVkSWxFLASN+S7O
	xxvVyVH5VF9e4u9JJM/8JYPZZKpH6XNSCVT7CoFL2BMYGGA9dCUyrQpu61HqvB2NHwToVeQ4PSb
	zz+Pvma3j7EaMEnXdrUQFXguX0SneyIR8SaCc2kKUCPlmfPybTgj6ZulttjjrZu4/Fpq8M35vGS
	z5nkIafnVl5Z1BgjFC2oqz/AKQ=
X-Received: by 2002:a05:6a20:c901:b0:3cf:a7a5:e310 with SMTP id adf61e73a8af0-3db404aebb2mr12126866637.9.1789435880642;
        Mon, 14 Sep 2026 18:31:20 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:20 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v5 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 15 Sep 2026 07:01:08 +0530
Message-ID: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_183125_992419_70EDD95E 
X-CRM114-Status: GOOD (  12.83  )
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

Add device tree support for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

The series adds the board compatible and describes the BMC memory,
SPI NOR flash layout, UART console, GPIO line names, graphics
reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F
Ethernet PHY.

MAC0 uses the EEPROM on I2C7 as the NVMEM provider for its MAC
address and is configured to use the RTL8211F in RGMII-ID mode.

Changes in v5:
- Use the I2C7 EEPROM as the NVMEM provider for the MAC0 address.
- Configure MAC0 to use the RTL8211F in RGMII-ID mode.
- Use the standard OpenBMC 64 MiB flash layout.
- Add confirmed GPIO line names for the reset button and host power
  control.
- Add the reusable 16 MiB reserved-memory pool used by the graphics
  device.
- Drop the previous RX-delay-specific description.

Changes in v4:
- Validate the MAC0 RGMII timing configuration on B650D4U hardware.
- Keep phy-mode = "rgmii-rxid" based on hardware A/B testing.
- Add the SPI NOR fixed partition layout validated on B650D4U
  hardware.
- Correct the BMC memory size to 512 MiB.
- Order peripheral nodes alphabetically by label.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 120 ++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: fcf94f5431858d83003cf18d60df67bd87b20ad2
-- 
2.47.3


