Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5941DFCC9B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5fNvrEyEz+03XQrEJ7dkupE0zWIJvoyBniEDwrgW4Ls=; b=PNd+YpzKpr4giAdAA7vTMY4yQd
	sg92fyUTXTI6KPUo607Vd3BzzpPsNWYO/f6kiym1O2ZxkSUNkagJAR80TiUw5dVyOCg+DQI1OEJre
	Sh7rRp4EmQHrspwSAxevhi9d7Hkd23BiNt/sIfjGtUb+N/GwrsEdWhUMkr/CZQxZfm1T4NHmrjdV+
	McSyMfelntPfTN2257bFKpNQfb1rHQXFNx7PocWseZZaxCqXVpUAmnXMXS3jXCHaBzZUyOJ2LAPJX
	1Ta7zLsG1sIiZ5eWLRK9DQv/tYT8KpNPl6Rh4uzaRCqVnBwx1NlQx5vvDEWX3blTnP9sLD8IoBXp8
	W3NhEGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznU4-00000008cJw-0Lbz;
	Tue, 10 Mar 2026 03:10:12 +0000
Received: from mail-vk1-xa64.google.com ([2607:f8b0:4864:20::a64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznU1-00000008cHz-0W0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 03:10:10 +0000
Received: by mail-vk1-xa64.google.com with SMTP id 71dfb90a1353d-56af73db66bso1955596e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 20:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1773112207; x=1773717007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fNvrEyEz+03XQrEJ7dkupE0zWIJvoyBniEDwrgW4Ls=;
        b=lMXVDy9KNUxUQPh5L1DFuUetNRoa/ScPl+fhjJLlqkcS+xA06hqRFEWDvcN3vOg0Ux
         uUpGVwDjFs5IFh7bETuk7f+avwDU+W4BjXq3NJLu4C3k850eOJotiKTd7yFTnDQTGCJg
         mQDe2xcO9goijyYRkh0qSYiqFu4TfKFGADnfoaG7CpgWT1mvWx8iGFYWMdIlBctqVnPQ
         KB2loTI4JqjUtK3ENG4ATjYQ5Cp4TRxNUpRAgQi30zY8j3qzhDVB+TMfQlmDV1OeJRb6
         mwDvWu96s7NgQ3DcBzLURh6xRbgO5LJ9Hz5HgI+fe8U0sjDF0uXnsbFJa6TnNAOl/rOR
         DRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773112207; x=1773717007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fNvrEyEz+03XQrEJ7dkupE0zWIJvoyBniEDwrgW4Ls=;
        b=Dz5431tclFiUkJVCriihm3Qyb4Px2Yu755DmfqLRDDdEk1RaYDMYRF4PU0ad3mzjfW
         I+Tkrg/VzsZnndPlR1d+y3D3ah8s3/Hud+wJO8gZzaAIzm85FHCPG/ddVJSO3XfZHIC4
         WceWfjOOzylEr8YzaMMyhDkgIsWzk4Mln1C0sayt70oQ0DCHcZUCBCBzGVW187i40Qgi
         Fw01p4se2b2ttvb6m97puE1nti0neXG/i3XtIhWnYoDrq+BBAPYtCnI4qygkGbLUB2KC
         zbDKf5vXCi+DfLMrPwae6z0pGIG2myKWytVrcjjaXQ3a16q7fgdWE7MzdhwV8FhVgTIf
         HwOA==
X-Forwarded-Encrypted: i=1; AJvYcCWV6oPCnQk8Khc1zExcXQa1hyGWFM/fY8wGRowEJAN9Noi8vvfBRJUZlRuK8aWsuewl+GzrSNLeGuj1+riSC8fG@lists.infradead.org
X-Gm-Message-State: AOJu0YwZDF2nO9bzunEbovPK7qNKnSDl5chiLHqBywsR50a2l3U/C5y9
	1Dkkb+tJtHDsbxVeZ77Rt+a3UyP9+MoGWpRbYg5dnH4JOVa6OmB/vi/Vdv3VbxUNgHijYsvTZtF
	tvVxdLti43OX3OUuoAdsKAvBWjDY7np5+KN4N
X-Gm-Gg: ATEYQzzyRP3YZ8eoWvwRNY8bhfNj5wARubi6i1gsa0f/fgIWJ3NiatJ8l2BysnvGAtV
	IUG3U0I+l1RBNaRlJwnHlcOPf2WPhQ+ijJj9m9sO8MOIQIRRkPSuRCvAyvyMK7dgDh280Al8w+8
	7CIuJWrG8YVbLoxwnzYBpLIUlmzoLpoJn4VTUkdvtu/QyHAxWXauUdNavbTCj87zKQzs6MmAAIM
	BnrpCF3b7JQHjoq1zva8lmRGkGLzjU4GdQMwOaW/j7ujsntG2UWbyqgCgde3VslLzh09dMcfa3H
	wFakosAjJkGpLNDI7h8Vt2tknyybhiLFySuMNZAx5zkOJVv76dVWiqYNSZ+qEXFM9kvp6ZDUaae
	+6jERSRqg3mrEZXnz7iEZgeyt6bKMU2ljvnOSgW8eJHkT
X-Received: by 2002:a05:6122:3b05:b0:559:5ef5:b196 with SMTP id 71dfb90a1353d-56b07e2d9c6mr4061680e0c.13.1773112207330;
        Mon, 09 Mar 2026 20:10:07 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-56b09ae3ef6sm1544609e0c.6.2026.03.09.20.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:10:07 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for Orange Pi 5 Pro
Date: Mon,  9 Mar 2026 22:09:58 -0500
Message-ID: <20260310031002.3921234-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_201009_156500_28E20625 
X-CRM114-Status: GOOD (  13.54  )
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

From: Dennis Gilmore <dennis@ausil.us>

This series adds initial support for Orange Pi 5 Pro. The network
driver was just added. The only thing missing is the second HDMI port
that is connected via a DP to HDMI adaptor


The series was tested against Linux 7.0-rc2

Please take a look.

Thank you,

Dennis Gilmore

Changes in v4:
- rename vcc3v3_pcie20 copied from rk3588s-orangepi-5.dts to vcc3v3_phy1 to match the schematic
- use vcc_3v3_s3 as the supply not vcc5v0_sys for PCIe
- remove the definition for vcc3v3_pcie_m2 as it does not really exist
  as a regulator

- link to v3 https://lore.kernel.org/linux-devicetree/20260306024634.239614-1-dennis@ausil.us/

Changes in v3:
- moved leds from gpio-leds to pwm-leds
- remove disable-wp from sdio
- rename vcc3v3_pcie_eth regulator to vcc3v3_pcie_m2 to reflect the
  purppose
- actually clean up the delete lines and comments missed in v2
- link to v2 https://lore.kernel.org/linux-devicetree/20260304025521.210377-1-dennis@ausil.us/

Changes in v2:
- moved items not shared by orangepi 5/5b/5 Pro from dtsi to 5 and 5b
  dts files
- removed all the comments and deleted properties from 5 Pro dts
- Link to v1 https://lore.kernel.org/linux-devicetree/20260228205418.2944620-1-dennis@ausil.us/


*** BLURB HERE ***

Dennis Gilmore (3):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 301 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 +++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 +-----------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 +++++++++++
 6 files changed, 681 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


