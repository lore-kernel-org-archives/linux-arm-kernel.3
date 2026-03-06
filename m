Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB839F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pObow7U4f+Fx/cYWK3hP7CP2OEJsOd2Sjmo2yIVQOg=; b=g6Z+dvvkXs1UULkkwCUFymWxNA
	0VXVh0CT98RsYbv0gaMNS+ohrN45WjNMj7HGTtPKJ8xHVgjyVNYPhv/ZAK2bWZJeBgYkb57w1MyRm
	mbQx2eqjt/aKUyDRu23INVAANnZ75fPwWJymYD1ZH+o+BexQETGEtTL+zztX8AWQTPCE24Dw036nK
	CNhg968ycDArJopW/E3lxKzyTkNL2fK6ibjvJErO2izMh10Gfi+pTy+ujvmqihpAA0lY7E7KK12pB
	c4mbz1UNvMXpIryi4bWElY1vbbHnnwsP9BVKA824csPYW86EfcVuJd28ICRDgptY7h82z6n3qAeHB
	M23io+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLDA-00000002tt8-2Qh0;
	Fri, 06 Mar 2026 02:46:47 +0000
Received: from mail-qt1-x861.google.com ([2607:f8b0:4864:20::861])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLD8-00000002trJ-25pC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:46:43 +0000
Received: by mail-qt1-x861.google.com with SMTP id d75a77b69052e-50698970941so105743291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 18:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772765200; x=1773370000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pObow7U4f+Fx/cYWK3hP7CP2OEJsOd2Sjmo2yIVQOg=;
        b=X3vTkaHKYQdsqMjw7TCunwPCDt8N/LqNv4h8MlXAe4SnHRoSgSBcDhaXaNAmYVCvV1
         DKzvvaieO2Nk38PE4W9AfSLbkdp54Tx8v9RGWt6ISovpCO4WPq1lqNWCG4Ed7T/6MZxI
         /4DCyqI+cCSMXL8dvcBJ1TFLHI4ESGFBBeqif66NvRRmD/DdnjgmVHLp1fEUh3VkfC1S
         KlUbr09wpgkG8nQQFD7WP1XHYyxJ8xUHcdsKxpZi44GBKIAN60SkN6ZIW2XnXmuXMU9y
         FnAHqrq1jlT253AwpC41eHS+YcyXxl+Z+BNM7PfIpqfRlnj9hMcLnAjEzIUQZ18NF5SK
         RKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765200; x=1773370000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pObow7U4f+Fx/cYWK3hP7CP2OEJsOd2Sjmo2yIVQOg=;
        b=cNZrG/8SeAeEmR6v2DnD4P6kOB4gdE/gC6Jzo+mKBn0pxqeACMRfIorqdZSdH4bZia
         08/tWQG/nuW+pbkWzWox1kwPbmJk1NxQLqn6m+Jp0rMUex6np8Ierl7Yekn20q1Hc5I2
         qPdo50QFJxkPotch+YG9E3KvrovHksnbQ17ylTxZKhuPA0d8QNryzmjQdthGr/wQ0eH/
         1acVMDu+rDxypWiMhq9ct847lOIgub5OG8asc4OxYzULMNNdlUHp1KoP9JI0t2yk8D4E
         b1IFKEuuknhvxI3drPEwDsfQfnvzrYBzrAkFTVGnt+9KKjgxuHEDTsfDrucIrewMNqDE
         1UsA==
X-Forwarded-Encrypted: i=1; AJvYcCVzSUoQ1pV2x0Vm+hy+OmQgkIYfP3AVk6uSZxdxVYSdSxiU1rvoPlpGt4zOMAxv51Bj9lyoE5EcLPJbIhrdB6KI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3HjYm4ixG/D64R6uHLoyiCtTAp+zYUCYJK5PyyIpwjKh7pDwc
	NDTlTklh5X6fszAJZ019gGdvcT+Q/+dO++iRUdfh1x2qkRDotXdSEBZDZzwuovNEfPeB0noOB85
	MkMhbewHyo8LNyl80+gANHW+RXXTYOurRaOou
X-Gm-Gg: ATEYQzzFxqoy90UZI9euU6ImUudrlCFZb66IN1BuIxAVX/+YzOU49meQaVgTRcoE9TX
	jJLBBIdWQBQ4P0ggTUXkyuVIKrw/3oiseaeiMqqgFfF2OHLRA4gn0xUU3MSAFbLRbOms0LxbRzg
	g6sn1b/vSng5hgZk6IyZr5+xdg6ADAkVOf3qYL8+YeXAKZ0jaz35qZQ6hBhcT5hU/gS0tjp1Fkc
	9Ou4i7w+Uq3mQD36gBKaSiMg9MlvCk0GAoZZLTHXpm/idhwjBfvaZKbbRTKQgQmsUgRvnG7gHd+
	Nf5U73bgSoKyXTGwoKCVlSksSVeC4M/kd/B8/HDF9q+FOMNDeW7i5FNLJMekMP8BGYU9pPBJB+q
	jFTFYWimsIALOBQ5403mrUrNWLN59u4pnMQ2sRVlYAasu
X-Received: by 2002:a05:622a:450:b0:506:1edb:2cdc with SMTP id d75a77b69052e-508f4705675mr8675321cf.6.1772765199702;
        Thu, 05 Mar 2026 18:46:39 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89a31412832sm168366d6.11.2026.03.05.18.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 18:46:39 -0800 (PST)
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
	Mykola Kvach <xakep.amatop@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Add support for Orange Pi 5 Pro
Date: Thu,  5 Mar 2026 20:46:31 -0600
Message-ID: <20260306024634.239614-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_184642_540478_E6B261AB 
X-CRM114-Status: GOOD (  11.75  )
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

Dennis Gilmore (3):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for
    Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 311 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 +++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 +-----------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 ++++++++++
 6 files changed, 691 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


