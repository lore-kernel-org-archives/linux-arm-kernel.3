Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14576EDEC02
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DugOzDqbwinV7rPcwrpaaCcBBfm3VhhJmZ52z51QrV8=; b=UtICBk8NpPOAnl8zIyE1O8b4ll
	jDmEmR3Zrk3e14tygpssM/huMgGLCuB0nW5NQcVVTJw39h6ZTJ3B5HhrlwsO0YdvU62Xq6eSS8XIu
	RRMHmFqEx5Chvi8QItNhV3eYceyitomPanwK4R+PkW9qcfT1061/9yVkCNoIU8a+5dQwVY+xS9Gvm
	kIUkWztYe6lI4IwYav7XPUMzvwd5CwkVB/h8y6XyGKBWtAYps0Z0Kr2rf1aUV+7/p/IcCY93VjWeW
	uwgvxFM1BYpmTvFJXGyT9UvkhearypHo2At2RdpsMcWDBbONwlT8YDc8UHDRUqftVbdI9VQSXZXcU
	bexnfgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcOc-0000000GKZe-2nM1;
	Wed, 04 Mar 2026 02:55:34 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcOW-0000000GKXZ-0vqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 02:55:32 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3597df496f6so1968547a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 18:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772592927; x=1773197727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DugOzDqbwinV7rPcwrpaaCcBBfm3VhhJmZ52z51QrV8=;
        b=FxndjjUj/bZLq1nJS9nTgL6bsGi2y11v5F19UjAW18+wQdGKx/8d+0IiDwtR+1+Vm5
         YmMpvsdF0y1wouTOaAciXZ5FIe/4qhpIdPSH1rA497kxnAToNs7i5ZRGOc7x7f95AP4S
         ECDR7CjyzXQMRbK82e4+5bwHWQil4LlDsTNCA3esHK7bEhD0iljl0wuo7HcTb7ar+MV5
         SRUVTz4vRmbu5T8m1COyO/+Bn82iPWujZZdt2YrHWn2NqabRxE9r60ztIfG3td8KWBUc
         nqZuu2nht7Ck73S+15L2eVVo96LEzmEoDqU6evqewQ9vLlFWv4TjO1N9YZXhRuIZN344
         Epuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592927; x=1773197727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DugOzDqbwinV7rPcwrpaaCcBBfm3VhhJmZ52z51QrV8=;
        b=OZgjWY0E9K7l15MAq3nnmV+c9MlysqCpE6mwr0RXZ1gs2l+U2yUhDJNVGcDzkx9X6I
         hWxLnrJL4Di/0JQSVD4SeDLqlWobgVuriDvp7Y/vrS5OTQyliAb0Z+3X18A1kVojjIrF
         09kSicnBe4GkJEYlB5/tEHhx9wrDqmICsAcqIDBjaW5pUu9Od5BNLTZY0fQkJFK7hJlc
         /hJrQJ9/M15OyfBsGx9kcjnw6n+UKvT2KEW5w1v3YJFAl/9AGDW64cOODZkmTpfDjl3Z
         yRFHjD6kMvNC3JUlK555BfNahnoYWlI/iZajEFeRcpVhr2Z9bGIb+hqanS28bh+XmoQV
         VH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUftOa2q1XhWd3Jz4/TWSuQSgCPNFS8v98q6tXdJ5dKu2dDq0EIDZurxMSRSzrJCRZFNHaNpuOFmfQVqdkuTxOE@lists.infradead.org
X-Gm-Message-State: AOJu0YyAN6/9MjScMrM2TiVV76x462f0J5i52ytTiBnHk7GHzf3XC3ny
	3HuwET5kPCke7lkdOOeLYpzotHqpBcJ0xPtWTQVobtckh5rAJVTR0YDodR8nouE5ze/Jg8O7hsh
	4h75Ebz5i7EW6E4feOM0YPdRahqoRINsyBbeC
X-Gm-Gg: ATEYQzwmW7/w3jzLdcrP3Q76afF+4z89QhVQugVEKdB9RNM8iZgiR1srDVEIWCER/7/
	HoHQjGwbx9m5Xn0o8XeZnmRwB1UXdMFmAFGrpeN+VwmHneUJdEJs0Ron83qe7ma0ZYrmo57VEeH
	7pX6XPov83hfhtOd9Mq50qRMnDEZ756Mdj0oR17q3cutacHQBCbUxAbxnR1TsULeAO9XXF6HrxH
	INQD6ATMqS7DF5p4LNVXHv9Ulk91OXwvTuA8wSNxAS5Sc+CgmVgZoP2B2D/nm2klZu5ICK1cA9A
	DxV9ty6yOyDz/si5vJBroHtVe6jU73ZznICEwH6fTMt+T43Al7B0KtGlTgqDj2FnSoTkmarQx1D
	u9bFu3/7EoyNiQ7UQbPuMLrAF85L/56nVwrt8vjib5zpC
X-Received: by 2002:a17:90b:1b0d:b0:359:8dc0:428d with SMTP id 98e67ed59e1d1-359a6a531acmr599029a91.25.1772592926872;
        Tue, 03 Mar 2026 18:55:26 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c70fa7d59b3sm1374096a12.7.2026.03.03.18.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 18:55:26 -0800 (PST)
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
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH V2 0/3] Add support for Orange Pi 5 Pro
Date: Tue,  3 Mar 2026 20:55:17 -0600
Message-ID: <20260304025521.210377-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_185528_269111_93A0D01B 
X-CRM114-Status: GOOD (  11.25  )
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
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 376 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  | 184 +++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 202 +---------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 181 +++++++++
 6 files changed, 756 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


