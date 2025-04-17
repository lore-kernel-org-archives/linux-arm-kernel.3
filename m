Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3852EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AiJjVG8+/Firyagu7Fl7s0VPCxH3kEU5iMGnuGX+Vmc=; b=wU6IrjZxXByorLLQRvYhHHsL43
	A9g0LGkNY5uCHO2tKwq9HJI8XWmZX9bq5pLwO7zrBl1selY11mQquWIIltMuWO+WkVaQpUl7WIcb3
	vlvsPuV/zclVYL609NLie4Ko7/QbaJsC27HSNT2we7Kli6A7qSwCN9fEtYWRs7zB82qrC9OsgChJJ
	7+OzHvH1bVrBJpkjR/mWZ3zON6j3lLoD8p3LACkZ6kKfwV9uuY2S8yFfcjgWMww+GKZyFndFpP9i7
	xTPigrJOeYmzPIutgDjqkzw/RNfU+Q+gtYqvdQ6QcPXKFNCpVETKHjKLmcQwYmWLqI2tbe3eWAlsY
	t6NlU7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5O1w-0000000Csce-3qpG;
	Thu, 17 Apr 2025 12:07:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NwQ-0000000Cr9T-1fTA;
	Thu, 17 Apr 2025 12:02:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AF6E525DAF;
	Thu, 17 Apr 2025 14:01:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJdCT95lv0-O; Thu, 17 Apr 2025 14:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744891317; bh=OxekrltX8CslSDgfz+SNyaS8erECtuzT/O/V5NUoSbI=;
	h=From:To:Cc:Subject:Date;
	b=Yrmpd6bJSHrgWNqB+FyfnUELsF4p2/rXvXK6N8qn+KciOlI5uiWr9fm0ZC5uSdnh6
	 ogEUvBijRoSp5lnWxI6SvbIUA/iKRRQCvk5XOLcVW+qg1eKbnmugrIK/lve7LBF/bm
	 1LGs9PgOYJd6dr78bUdA+YmoK/Ma+cLnoeRp3OMgwgJW5yFfqjE3cTR6iUO609nyfD
	 Ae3qYTPsTycEpjlnKUIsLM7ntKVWgGgPApSJpvWcURc+wdNMDLW9gC1Mc6UULMhYd+
	 Pvt7dcBG3fx9WDbav5YQ38QSAWu3yS2L4jjPKXnYr9HGyu0YlRN67iXEbOtoPFgN5b
	 w5ekjQJbwyc7Q==
From: Yao Zi <ziyao@disroot.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Support I2C controllers in RK3528
Date: Thu, 17 Apr 2025 12:01:16 +0000
Message-ID: <20250417120118.17610-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050202_838753_89FB139E 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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

RK3528 integrates eight I2C controllers which are compatible with the
RK3399 variant of i2c-rk3x. This series documents the controllers in
dt-bindings, describe them in SoC devicetree and enable the onboard
EEPROM of Radxa E20C which is connected to I2C-2.

Changed from v1
- rebase on top of linux-rockchip/for-next
- dt-binding: collect review tags
- SoC devicetree
  - sort i2c and gpio in /aliases
  - provide default pinctrl for controllers with only one set of
    possible pins
- Radxa E20C devicetree: mark eeprom as read-only

Yao Zi (3):
  dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
  arm64: dts: rockchip: Add I2C controllers for RK3528
  arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C

 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |   1 +
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  14 +++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 110 ++++++++++++++++++
 3 files changed, 125 insertions(+)

-- 
2.49.0


