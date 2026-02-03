Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A89E87848
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjxVuWnk5B9RXCQZJmoomXjLkYn+5cEbj6Ic+qFTg0A=; b=iVdIwFFLsdVexrtPV0Bd+02Hmw
	/Rn9ZB+D3OfkPtDKJntt0UtyS5IRnDIqNdYLsjih5jvTCG4VYzpP3Fb18Go8QH6p86ST7O9YCUuah
	39l5EDUEoMyox09mjUDgcscAGi9VjVU6wf188sksX+prIzvQ8KPsDheDOhYeR0nbFXyEqf7KGPNEo
	zes/k/xIuLsxIoj/gd7RflAb3vRJC3gt+9pXaJn975jGti6b4GCahJNEdgMgnLCpMazKo3GyUrPJI
	KE53ln8vHxVTNz/lLizo2PGrq5ZjPqzJl9GFJKG8Au7t9rIIkQraycqxGhegverAZEnB4hPEiJ+M/
	rxwRAXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7c-00000006uyV-1myt;
	Tue, 03 Feb 2026 16:19:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7Z-00000006up9-0ldS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:19:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48068127f00so49811755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770135559; x=1770740359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjxVuWnk5B9RXCQZJmoomXjLkYn+5cEbj6Ic+qFTg0A=;
        b=hKd8Lsz/k+yLH8SAOQ8hFGlGmBujAyJG3oKCkasaQTa55DEnjwlwGvyywo0IJZGtrR
         kWYHl07TDzecacyLvlNcJLsVg7AWlbZ1s1qtSy8/vg5ly7+9tIoA3TImV+BT+V55IoRu
         jPFCE7yFhyFENUL7js663llURIL2JHd7vj3+UuhTzBXDWej/EjgK69iTdNsOAeg/PfL1
         HWaotG9DKJCFKwrLZcJz3sYkdFNPM5w6o0gTLTAM4572nWvn+llLKHbXsi2PByAeWH9y
         hSM7ggguFMd+ZeBT/bvB0NbAS4UZ3w7Xc28TLRKHp3lcL1TJ4MFXN4RLW6DjyVe/vjUf
         Y3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770135559; x=1770740359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjxVuWnk5B9RXCQZJmoomXjLkYn+5cEbj6Ic+qFTg0A=;
        b=W2CX1xRaEBILYvRKGnmdUIRL8NYGPdpdr5Ml0HjULohU7zx/hy2TAFVJ9CFAK24H2G
         YmCdiwO+XMTXh6cJ9fm3atbEQVXlSv6Euj6oXYrLhqzcaRflkeI3Is1v2PCU/h5aQ40F
         WmM/d6Ly1rYEhzenDwLKLEyNf4SuaqCrc/HyYTM6UiQfdu5itzFRyAb8mvxi+Hbh/B8a
         BiYOnCr1Dhymj3gj7WvvDL01IhydPBJNDbXZweGi1K3hfNwElajIyCOrcjKueseGV3Zn
         nsaD7fwYgNqe0XwVw1nvfcx2FqtLxfmJaVnuNWgPs6cTwkQ8HvM5prrvfPS2K7gGIF1+
         pz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7Ux3Am/iOJB8zFVY0Fw5kb/iHv7CDJvEr28sXKluQ8SW4om2B2EJ+TwUJRJtYPAlSg56u6aY1d2qLyDGPqO7A@lists.infradead.org
X-Gm-Message-State: AOJu0YxtlV0hubz0efbxtwd2/PNDy38tuzfuD9WVgs8evYKo/NwpIM+1
	Y4LJ9Xsx6NtFAC+FotyN7XjqNL1ydXmB7PQU0Xe2CTnWGOOnNjb4hJutD9V9oYyZ3C8=
X-Gm-Gg: AZuq6aKMNBJRhtYhlvB/ztlNlOjvKVJz52ey4SCocA2GbRJ5YhLmhuoUKVlQ175GRK0
	AqEW1/rp/0Zo6CkF6mBIt3QW3D8pVhe9cjQuAG6XY8VssKeqPLVKk6dB6vNr7rVUSZqWhxMVks5
	mnLKrb3T9vUeVzoZ8XOEI4GPEIhZJPehdkjxEfU/dQlhBg2NOP8BSTssgkViRbfEyn+58zP5a63
	OdDKPFI9w8a4PeFolSKMpdMEF1rEnilY0hsCe8eMQ2bmBWlSXImpTluWEp71o7SSAZH2vRzifqF
	VCmumnOzYY9BMIs3U2LvPI7Qswt6UOnO5zwrMUwJBI8quOJN6FCgVXi7s4D/TvLQjnHR496NQSh
	DDnZtjRaSe2X6nFeLHMbOiKp59YfJAFZkzPlgg3KL5tQpesngiC2BOR9FMRY0KVrQO6G6K0kv+K
	lbBzIhWrUm8NN4NzkOaiQl7pJ10GvE5A==
X-Received: by 2002:a05:600c:a00b:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4830e971be8mr1908985e9.29.1770135558650;
        Tue, 03 Feb 2026 08:19:18 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:81d1:b874:c1dc:42e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd21f5dsm144120785e9.8.2026.02.03.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:19:17 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	p.zabel@pengutronix.de,
	linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	horms@kernel.org
Cc: Frank.li@nxp.com
Subject: [PATCH 0/4 v2] Serdes: s32g: Add support for serdes subsystem
Date: Tue,  3 Feb 2026 17:19:13 +0100
Message-ID: <20260203161917.1666696-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081921_244894_5DBFB2C9 
X-CRM114-Status: GOOD (  10.97  )
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

s32g SoC family includes 2 serdes subsystems which are made of one PCIe
controller, 2 XPCS and a shared Phy. The Phy got 2 lanes that can be
configured to output PCIe lanes and/or SGMII.
    
Implement PCIe phy and XPCS support.
    
Change since v1:
- Fix compile_test
- Use devm_reset_control_get_exclusive()
- Fix s32g_serdes_phy_set_mode_ext()
- Manage devm_clk_bulk_get_all() returns 0
- Fix s32g_serdes_parse_lanes() error management
- Move xpcs filein drivers/net/pcs/
- Add pcs_inband_caps()
- Fix functions in phylink_pcs_ops
- Fix MAINTAINERS


Vincent Guittot (4):
  dt-bindings: serdes: s32g: Add NXP serdes subsystem
  phy: s32g: Add serdes subsystem phy
  phy: s32g: Add serdes xpcs subsystem
  MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver

 .../bindings/phy/nxp,s32g-serdes.yaml         |  154 +++
 MAINTAINERS                                   |   10 +
 drivers/net/pcs/Makefile                      |    1 +
 drivers/net/pcs/pcs-nxp-s32g-xpcs.c           | 1006 +++++++++++++++++
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-nxp-s32g-serdes.c   |  953 ++++++++++++++++
 include/linux/pcs/pcs-nxp-s32g-xpcs.h         |   50 +
 8 files changed, 2185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
 create mode 100644 drivers/net/pcs/pcs-nxp-s32g-xpcs.c
 create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c
 create mode 100644 include/linux/pcs/pcs-nxp-s32g-xpcs.h

-- 
2.43.0


