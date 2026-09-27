Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276AEC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 02:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=; b=a9/r7uNMIFQZpbmwxI1T5wy1Qg
	clFf4G1+nY3ymLCULBxRAOQe9ZDxIp8A5hHtMSNlHKFXLbvREahmARHKqtLxfKr/4Zxt1ptj782DG
	zPwSbJ96uuUZNKpWIT2CYZkRuNupIl6ANtDI4kkm8JVxIe9eiKItQYD7NPrAZCbGdZt2vw9QEFFgW
	myspvo52l/4PhdZ9kee5QVz7y5rdbkTRwg2RGdWx7noWaTZjZDUhRl5kYQoqvO4yab5dlLkdDncj+
	D6rP1RW6Uokl2yZ88VPUoyV1Ga1dQtrn1x4O+YdH55E5jly4uqZwhUXP65PkvuiCz4pTDy9a7qmlF
	WkWpPLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4A-0000000FxTY-2r9k;
	Sun, 27 Sep 2026 02:56:38 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf48-0000000FxSN-1VGm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:37 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2df834eb96fso12011585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 19:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477795; x=1791082595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=gfaSTJ85YWQN7gECMtBqjMT04krGYP15liP6ESYffpAntIZk09iHyhF3JnRomBiAdO
         81bXdVQ8Tt9iUBz2E57ZU8+QbVqIrAbtEFtkz/ue2RSst7ZEUFAJo5O/0Ob0AA2G56+b
         oaWFIYk8EFQl4fR7kALLkaL8+/Fnvb4MTg5rovpp/HJTc6DsKik1nqPg8kZwit515vN9
         tp0ELklwaG2JQ93coFVUT8FGVugC7Fkx6nQNYgKbqmbdUmVgEdO1QHQ5LqPZ1Z+ktawz
         LGW6ykM+pGQpieWQ2zOqS1zdXiu18y466+ht3wQdHCDPwtUcFDtC+NfBD6r++3piZyvh
         8XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477795; x=1791082595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=eJoOZSJ7+1K3mHoOuwpn1u41abeJZyCElXETbJZ/tzC6Da2GLWL2FBg0lBsCICk4Ej
         pvNt6WGJSYKW5hTLjdNkQD5HiwqleJ4Eo/Qz0s5XF1RVlpapaHLTLFSCYVVPQcWZ2upr
         U6Zm0WxmpLCDmZMxfQAJuXGk3C1THv36s+o91fqIT8hrn073Zdo1Zn5SkKo+u7SkEQPu
         zH3BvxEr7g0XAt0L66XzKAaFtZSPB/c1NQEw8WPIjMX0mgWxqJ4P20FtCg1WNCaZvHEZ
         mb1fJ6EUi2PUol5rQafh1kx/0cz1iZIHcQf4GWfwZiXjVt2ZWZYpgTq0N1kZtt87I7+O
         8k5g==
X-Forwarded-Encrypted: i=1; AKwUvBxC9WJnjF3jWIToojI/mrYSjxPKxMjcuuEO9fNC9do/Jv7ckG8XiBTo4h4+YMKSH5W6fvsmORttr1FnqfmICpfz@lists.infradead.org
X-Gm-Message-State: AFq9FYI9+rKGkGshYo0oiq0yFFcEmvNDO+TJ4v8FIGWfto/4aRzWiwUi
	DB7JiK2YWCI7YBtvQJAcKWC+xzNAYaRUDyNi6mW9dG71Ta5Pl4sPmBaUkam8kSBjt7bG
X-Gm-Gg: AYBFou2hs2QoWU7GGRo97Dj2Fo1LTANgr1fWkX4MQ16flUnnXM47ZskIk3aiHdgVIQv
	DQaSIBRI/P/lQNkgHNPIltA9Yx2vy4vkJpcjqIEOw79Y23s9PVGVqSGzzUCMxmozGRKqk5Yyhmf
	8XJOb3amurUW2qEeOMJMKQKmYyFxTd1vEm+AFra0ABRt6iriwKmIpIgcYxOw+tJEgfg336tJTKs
	Tn05UDYbQ1yGVpFJYFl/uGtKeCaGNJuX7lViQvpNyZKARbbGSJxj37GC/PsXb8Yr/L6QZcR7Npz
	bGXfw2nuzY5904WY6FKIBiP645B94f04YkTI0iNVVz/c2CNe7yICU2ml2mOVsaL4oKOvwdnFdUj
	5QLqBG1SdYiM4WXhMA3EGn/ohFW7ehTF1Sv0l/+XI3OLPggIYKNqCLqKkASvdq+r6f70knl4nso
	HtHAzxtWeFFmR4afnqGsBpA7L4HxM64EPKWgrxC2NaIgaLMoIClJlc1DgrdbQ9d8yh5A==
X-Received: by 2002:a17:902:f650:b0:2df:8f81:e595 with SMTP id d9443c01a7336-2df9490a525mr51727995ad.6.1790477795247;
        Sat, 26 Sep 2026 19:56:35 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Sun, 27 Sep 2026 09:56:23 +0700
Message-Id: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195636_433716_B1C53D7E 
X-CRM114-Status: GOOD (  15.20  )
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

This adds the hardware spinlock of the D1 and T113.

The sun6i driver already handles this block, but it looks up its clock
and reset by name, which the binding doesn't allow, so a node written
to the binding never probes. Patch 1 fixes the driver, as suggested
when this came up for the A64 [1]. Patch 3 needs it for the device to
probe.

Wilken asked then for testing with Crust running [2], as Crust owns
part of this block on the SoCs it supports. That doesn't apply here:
Crust doesn't run on the D1 or T113, no devicetree in mainline has this
node for any other SoC, and patch 1 changes only how the clock and
reset are found, not when the driver enables or asserts them.

I tested it on a MangoPi MQ-Dual (T113-S3), not only between the two
Cortex-A7 cores but also against FreeRTOS on the HiFi4 DSP, the other
side this block is there for:
 - the driver finds 32 locks;
 - for each lock, while Linux or the DSP held it, the other side was
   refused, and got it once it was freed;
 - both A7 cores and the DSP each added 1 to a shared counter a million
   times under one lock, and the total was exact in every run. Without
   the lock, over a third of the updates were lost.
I have no D1 board to test on.

[1] https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
[2] https://lore.kernel.org/20230216095454.54f4d5ca@posteo.net

Nguyen Minh Tien (3):
  hwspinlock: sun6i: Get the clock and the reset without names
  dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
  riscv: dts: allwinner: d1-t113: Add the hardware spinlock

 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml  | 7 ++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi         | 9 +++++++++
 drivers/hwspinlock/sun6i_hwspinlock.c                    | 4 ++--
 3 files changed, 17 insertions(+), 3 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1


