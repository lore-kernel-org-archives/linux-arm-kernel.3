Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249CDC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1WNF/t9pK2HwnPJWbDOD3dXmKgsh35CNG6w7c87mKE0=; b=OPgABIAhCxEHSCOrkFVyBA3Be7
	IiZXcLdRGLL2mLfmGQhgbdj96zeFWhcrMvL5yA2PzMsPE4PDxl2edtAdSsLaObet54466Qov8wMWB
	xXVxr71J8tRKg9FYSNq2A/sgXLbCj7A2r6qf71cRgap6wJf088M1bxj+yaKAX2DYvWczSZ6uqUlhm
	YiDqMx26Hp8O8MBaKKnxDKKDv7NbK0hoYFJ0TVVFNLREuodDttUiWsq7qKY9waPgsCkxaM++yDhit
	hINNattwsEENs3sHxcoExNuwqvw4um4uKMXseW3iN2CtpRZ9zuhokQ0dD2aYl7L77Va01rbO+uC0n
	AgIA1I3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAo3-00000001ncC-37MU;
	Mon, 27 Jul 2026 02:11:03 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAo0-00000001nbP-2P0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:11:02 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2171457a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118259; x=1785723059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WNF/t9pK2HwnPJWbDOD3dXmKgsh35CNG6w7c87mKE0=;
        b=dwCmuZxjg59AiXBusFyL7YxH70KQrGoLU0II1a1oVKd1L20FZGzlXBZg8BNPPPvxqY
         W1vIXmIufGaivYvJQOi70pRY7QW953hKbf9K3zXwK8q/Ox89Aq3dzQu4FLxVZ/r7Pi9R
         PzpNmGPbb5HMv9OzWGiEBBKHIGsTQ7FRRsHs2C6UwJnrdhu5otr/q3Xl98x7v9v82cZb
         jfr+vUFd7XIFveZsrM1BG4qDgI1p0CTXwrSMtaR13VzYlFzh2SMJnaj+smYVqjcXT5Cw
         7FDtgAIkNvlIBAfQn+C6/WatFpphWllwhhjafgsBaFgHQXFEBqEXn6SiIObiN6EyqOmE
         5N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118259; x=1785723059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WNF/t9pK2HwnPJWbDOD3dXmKgsh35CNG6w7c87mKE0=;
        b=MvGNITXY4Wowkr+fIsSERo/oxsr4dLvMSBPcu/Ak4XSWaAqI6y75Qne5vVDsubkQL8
         gYxMe2oFnMG4/rE2vcMhebtmp3ZROHbG3iHcE2grKzmzDjKT4LVmy8nZyGP6IdhlJc2Q
         mmdIsxe6s+8Zpl0WzxZK5Fe/sLjQYBex5mLJMhvB0Z+njvPfL77/+2Ff+1fBUGJM0+ki
         tx6HW1D1cW/CIHI3dK1c7WEr3fbnIVTZR+Jpx1KutVXmWGui/KT27c1zdrV4r7ibvVkl
         B1EOK7Xpb3URFvKeLGZWhbgE3mEN+StPmbhXAUOe9E6MFEFmDkKCvRkJCKnloOCuZEvN
         l+KA==
X-Forwarded-Encrypted: i=1; AHgh+Rpmg676dIjsebpPDMUgFpaMXmJRry2ByDHnLRrNDAANp2e1rIpXE7Y8cbrGPyduwB/eHNEBvzxx3GXHVMWfPXNT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw93JfIAKE/WMm8zjmqkLplAZTdPASI/MGSUOQ69Uq1GkR7TyzD
	YvOl//PLEyxVq2RRyIxA4JZG907lfP46BO0mY9cR8t09lXSESt50a9nS
X-Gm-Gg: AR+sD11I5MTeyHz8FlVNQRMsKJ2SjmDqdlq0azAkALWu1p3HSoYc89MGONwuiVAnoI0
	DgeoQ9Hj3QXpxm9ck2SNLp7Jqre5GP5h6aZ26b/fI6BodFOw9NRMaaAAqNAgFikF+Tnqs0zjBFK
	toTK2NZCHaa9TJJ6wUBpzutmA6LEo5dlGkp+j8MNBRGZpLrSWUVir7V/Shg3CPYyCBi4ksvcvMT
	Wrewpr50zATrWBAadMZRCCZzaf4bxlExPJYanDVBOXWs7Mlg8ILUgMz15rWPlwXx2aWlG41AVCc
	FjlX/KMD2aYcLT0Xsn3GuCoUNmylCB9QZCbYT0MQMnEQ/KT50jbR4CsfLjMNVWVsadV1Use9BTR
	EdRPYm2/y/e+DqIYA3gGQ5s0/xzw2bdlWIaxC2vqIsT+xWVBEUswUro/5yOoZKa3en2nIUWdvNH
	GWcPTs8X1UpQsC9RukanicVCI=
X-Received: by 2002:a17:90b:2791:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-38f293cc2eemr6150209a91.6.1785118259380;
        Sun, 26 Jul 2026 19:10:59 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:10:58 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/3] net: stmmac: dwmac-rk: add RK3576 GMAC 25M refout support
Date: Mon, 27 Jul 2026 10:10:44 +0800
Message-ID: <20260727021048.3375444-1-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_191100_640677_4163203D 
X-CRM114-Status: GOOD (  12.07  )
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

Hi,

Some Rockchip GMAC instances can provide a 25 MHz reference clock output
for an external RGMII PHY. Boards already describe the MAC clock direction
with clock_in_out = "output", but the dwmac-rk driver does not currently
request or enable the corresponding 25 MHz reference output clock.

On RK3576, this means the REFCLKO25M_GMACx_OUT clock may be disabled by
the common clock framework as unused, even though the board expects the
GMAC block to provide the PHY reference clock.

This series adds an optional "clk_mac_25m_refout" clock name to the
Rockchip DWMAC binding, wires it up for RK3576 GMAC0/GMAC1, and enables
it from the dwmac-rk driver when the MAC is configured for RGMII output
clock mode.

The clock remains optional, so existing device trees and SoCs are not
affected.

Tested on a PicoCOM RK3576 ACP board with a Motorcomm YT8521 PHY.
The GMAC 25 MHz reference clock output remains active and Ethernet works.

Gavin Gao (3):
  dt-bindings: net: rockchip-dwmac: Add 25M refout clock
  arm64: dts: rockchip: Add RK3576 GMAC 25M refout clocks
  net: stmmac: dwmac-rk: Enable RGMII 25M refout clock

 .../bindings/net/rockchip-dwmac.yaml          |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 33 ++++++++++++++++++-
 3 files changed, 37 insertions(+), 5 deletions(-)

-- 
2.55.0

