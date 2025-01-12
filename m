Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C23E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=; b=wOECNsOHWtf3Qn
	XWWc7P4enQutwTmg8hrxaM4fuQyEJcpJ6NXrdbkZBlbaPg4skX4kYvV0KhjP81T9fNqVHPZqVQf4I
	gpaWU0FSqZBQOgA2niwlgGoqw38gBEyJPsyuxBGV2B64X8nGwLG3U4QxzKdZPLPSJ+tUlbrLxlj0a
	cM4HqWKlY3vAFK83yy+HfMNO185Xq6VGGw1nLeWctIVmtUTs8nNZqJbKR5d1rUFsLSflaHx7emSzO
	piTuTsn3LbCZJOVvRytODn2EU+6jBKVtY6iRRnlYOVrJ2Cwxuk8nIYUvHJIM+wheBzidthXuZ4WO8
	l+lqo/1z6DeQWMj0nO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy6b-00000002lwx-25UX;
	Sun, 12 Jan 2025 13:34:17 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy5L-00000002lam-1KDg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:33:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso598789a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688778; x=1737293578; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=;
        b=DJiDabZtqt3TGP2Yv+Zhhq9UX53y5wwQEqMOaHPonmj0HIBynJZcgjyF7Hxe8j9Vzr
         MFqFO74f3ISx7IK8aSYmtLpi99RpsIbi6EJlZXa9kYtXv9fNfHlkiFnQkHLyIb3HLJuR
         ibV5PKkm1Iau7bLTmcaodVBFGGrsu1VWFJY2iRPoRPumUc2OU53fF9jOVBDHRnhH/p5s
         Hs/qoSnF8Ix+VaqM1wsRgbkO6DDXPOBC5/OM183zMu53mpSt1HzI4YpFpxSeE335fsot
         g7lVCAfj9yeW+x3ILRuo5f0bQrIFEEiTM2gQDs89IbdRPNSW1an7xtf4vKkrD1aE9AFm
         12ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688778; x=1737293578;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qagkZ/LU4rtTQes27vALssH2ImJamgS/6MR4uWjQHuc=;
        b=Y+p4f1DX9CShYXy1O4akrEYPyfMu/w2yOA8cJcFL4kGmjM9p6yg++IJGm2cLCfozrs
         cpRaKdn4f3D62nJL8NHDnBLfGaaPlPTl0LA/WbAwegBtazfPMEl3sVGjl5l64t9Vdftv
         XAemw75ITw4Bu2pgH/idokWpA6GNZDjJii2pkzqJQ03lObpbs0XZPF7RFjLzKk3YgM87
         YH0ctmi67MUA6t5gv1JIF2xxu040pV0pRMLyv/b3LZtOd0QpesKuwKuGHL2M0rkV/GYT
         IIybslQj/8dDUR0kJTDx2kPTBYKHrYQ5HZygA3BOr0cVmAyH+CCrOsn1h0L/B13uTZRq
         /d9Q==
X-Gm-Message-State: AOJu0YyFeQoRv28F/lGHneoSFlFJBG09qryAjp19MaLwotUK4b+9mZoc
	TxyBX8Dfx+ukFfwqXvVt5itV8ulg1zY4XIOU/3jVLaViki18vMeuJwupsE2y0+g=
X-Gm-Gg: ASbGnctEijtVJB1kQfBW60EQdxgduy33TrE8YuG+BVaMCHdIrIK4QiHmew87wgGEpzQ
	+FUz+bhSPQGdMc9mnHkRFI4hQPXxJ+oPeICSAUFWQ0K8GxOjnmSgxHBUg/hR9NLJW4dDnEQhUw+
	CFuupaLtddXw20jH/JZ/CQCEUPLSjK45tqWXgvJp8by5MzQXDMBvxi2znHzE6Z07qJ7djboa92X
	ZIvP/yXUh8VGcexycRPaJq//10viHr1g1QiYrRjGETYBSk5NoA25eRDq2kuyzat2ioVub/C
X-Google-Smtp-Source: AGHT+IHGPI5G9xAGCnu9erfmrPb75d7mnwukM12RbyFiKbkogF5yX4joUi45dN7aTJobJQAhBKZ7tA==
X-Received: by 2002:a05:6402:1e8e:b0:5cf:f39f:3410 with SMTP id 4fb4d7f45d1cf-5d972dfaf04mr5579529a12.2.1736688777399;
        Sun, 12 Jan 2025 05:32:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:32:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 0/5] net: ethernet: Simplify few things
Date: Sun, 12 Jan 2025 14:32:42 +0100
Message-Id: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvEg2cC/x2M0QqDMBAEf0Xu2YMkoi39leKDJKselFNyUhTx3
 5v6OOzsnGTIAqNXdVLGV0wWLeDriuI86ASWVJiCC63zPrAdFhfltYzpAx7yZKzYuHl2ybUIMT1
 A5b1mjLLf5Tf9BcW+UX9dPyiJad9zAAAA
X-Change-ID: 20250112-syscon-phandle-args-net-386d05e2cd7e
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XKxgPXkqRoVDNfOxWtITwzSpA1j1CzTTW6TU8zpRG9Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SAA643Zo2cp/l+bcjvA4yh2jmRGdEETJsAm
 Enhfy8ebEeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEgAAKCRDBN2bmhouD
 16MrEACXZ72WUcShffV++I09qMxK0HXHtn8vUtnKitu0FCIocOPj/7yXCn5UNkwMiowlUD/SJU2
 eJcDaunCkjH8J0KQfk7GFxGX5vk93eYQxv0HlD+RMRxaKnL9IJJFTwy7UCU53xCeMtLDPVo/iO8
 GHcTw4W6rf9JhAdFzQAzZCXIyih19x9F+wejqS6Q1gbhTzpQdH0zpZ2eA5iOE9U/D1m5rfzBZDk
 B4CBqgq+Km8WkZvkDsFtGQLV8vHiL8OxkQa9UFtrUOzVTyLmgh4iuCLXVz4qgeO/AoojroJ6UD9
 UqyQTPPbEevML2onTmd6zO8u8P35sCy5mei8XuP6tTx/9xY4zj8vUBmIgNnDJTd1cdWIRpCaG2j
 ASmSe/phuj/0Yn7KYirpKOECOZkvSWcwS0ScdA4DTLxpnwGyacg3B+7MZc2TcaLQiNtfKO26d5j
 vaQiFJ75DmoCxwQabf+RYQ9umr+3c6yKY+pO7BC5z5DTLPv/NXBa8xTJNI03dK8YQMIC0dDCkpl
 qxGQp/Vb4x8lv1ftODbrjU03Z4MWTeI6ahuBLX5mJC+L20oY2fVmZ1vIL6n+9noDROXO/WrRhD0
 DlJiC2bxqKx7hcdSoCThDAzy30sDLBihn08oRSXZ0t9wxIhbCZYyeVSq539LUav3T/PLQgdIMwh
 6aN+wRTr39PFWGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053259_421317_3439B313 
X-CRM114-Status: UNSURE (   7.10  )
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

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      net: ti: icssg-prueth: Do not print physical memory addresses
      net: ti: icssg-prueth: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: imx: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: sti: Use syscon_regmap_lookup_by_phandle_args
      net: stmmac: stm32: Use syscon_regmap_lookup_by_phandle_args

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 10 +++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c   |  9 ++-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c |  9 ++-------
 drivers/net/ethernet/ti/am65-cpsw-nuss.c          |  9 ++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  2 --
 5 files changed, 9 insertions(+), 30 deletions(-)
---
base-commit: 8a7b73388d7ab9aed82d5b81f943cc512ee54e9e
change-id: 20250112-syscon-phandle-args-net-386d05e2cd7e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


