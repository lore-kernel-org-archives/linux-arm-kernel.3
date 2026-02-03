Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD46BE83072
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RL8/ntmLbz7GfoTyFS9PYa6ILY9/8FH2UwySorYf6Js=; b=zrqGYqFYUiTgtt
	ykRizlpgfz+yC1h2qCIy+Tv76dlXKyKJcXHXvv472U6Uq23G09+HTa27U2ZKcKJ1IExJfofoNpJX0
	YV5S5BnMkMtFuZ17tbLnu5001w1ZFCtYIN3I4aaCHJQRLY9Uq0PGJXEY05zryWV/evHfYqBc0WU8g
	iq7jpIuGgTVa9JayeEUYI+VKZdk96RYwhauVXAuheA7qf1v279EgGWZLkVqeGN1LTvImdGYSk/9z2
	ZCTZWeQT3c840jTQufTUBO3/ZP6GlkMAQ7hDUZpFMz2JcWgMXpjqBGGG0jNpaGly2ybJc/maWsb/l
	IoSkRHg1R0Df5eBcQ3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD3T-00000006Pd8-2RwX;
	Tue, 03 Feb 2026 09:50:43 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD3R-00000006PcG-1DHZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:50:42 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso3355205a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770112240; x=1770717040; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RL8/ntmLbz7GfoTyFS9PYa6ILY9/8FH2UwySorYf6Js=;
        b=YMsDM+aftJTVp/P68yhKD3YHpGZJ97Ki3PYU/unjadjiLqrp23tzGasIznZ8Y/o0Ar
         rjbQ6i4udXfCuxkGNz3Idv5S6Gl6sN+RMO+vjHUcocctZBxbDoYOLBvNk5lD7UK7PAu3
         dLLdt5Gg5rIqinPpCzuiPoYKI8ZlZblzZ9z8f49qjCPvks6SZ3qYfq3u6Hzt93mYukSp
         SXCXPqsjpor1VTUaP6fLqx1cF4ngkbY87zjd8L4EWzGWZTwGxSFjaUabBRIkQxw0bK47
         wfFwL9dXhHUs2fn+GYXs+NWoru0h5yrqF7VULKuUTNOVL9URv62nZ2vSyMl3BtnIpiRl
         iRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770112240; x=1770717040;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL8/ntmLbz7GfoTyFS9PYa6ILY9/8FH2UwySorYf6Js=;
        b=Pp3hZ0yh0LlUX4j4Br1qozi/34uIP9+Lk6mgZS42GuZzwIcL3pBVh0dRp4PBTEQoIU
         tzJT8lz+gI9YL3WpSSTISQkLTS5yQuVw4BlHzfQg9cSm52v3/H3AmXawnD19FT9FQdMg
         1JyVvfQdEVimpzqwMnnD7c0X+mMDlQeTH2vMsacmaODYUInb/bamBk+02jkTaCSi7IpS
         bO+pgE8J7ya6nz99MjjaLzm3ks1knW45oqH0H0iDci4NIvIdAofpJSik2Jat2eG9Oeyi
         skTeVdApF1Eu1lKDhZmkUsRB1Nh3lLSPRSlJePoPmZVRP5fndWo3XA+rUi/crXsuRjgK
         kLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWofGd3j3p5vLU7n+eTlYQk2RgnZFXDhZ4EDqtcwpfVolbUm/QcUHPO2OY57Q4pGV/Pbzk/pK3Hs2Gp+bk+dhia@lists.infradead.org
X-Gm-Message-State: AOJu0Yym6ckZqcwRIrVfYeSiY6c8TYDuvVxG7y6UCo3q6iRPwZqp/vZx
	GjQiZ4lUUx1EZuhhfim2frEqMCgZRBz17roHRwQoT+VU5on+aNvDULA3
X-Gm-Gg: AZuq6aINpyF/18Y9z0AUu46S0qim5hzy+xdffArbwpteKf75tIVhzD3dGakkym/cXrP
	92yd34BA8XjzDL21edsFx3Ur+6X3np5IGI+n1RMtjHzOIqsPfYkDIpLCIddC6rDMUY2YxuZ7WD6
	CWrDlmm1AD/nFr3KGM9YWz1c9Ep2LhyD6GaxfHQxNhwD73glogilw/ZKUF3BPNqkY3M1xfxbCxh
	4tG8IQTn+5Vdw2A2U1fuVxCZPVdzlgpjseX/EkyzImAghppM4S8PNa5Iw2ODdt4/I/4o/i3kx13
	cUlw3QNh464DL+28vxwP3fRjVnG7TSwmQLvGasmBnk15mODogPGPGKdaqNeBQAXJX+RUPDH5GGb
	Qle5h4XAa8Uqd0qoZmifQooLpKwKaln3uef5uiNpNFDMVWPQdZ+Xl4RwsEL8PWlyVpH3q1Egeuy
	tZOpyxq6Qu9i7d0gjMLMrFiffWEwENGv7C1KolhV1ouiCsbJZl/VvcWOzUprg4Ivg=
X-Received: by 2002:a05:6a21:790:b0:364:1339:97c2 with SMTP id adf61e73a8af0-392dffffe23mr14554241637.14.1770112240073;
        Tue, 03 Feb 2026 01:50:40 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a336a1csm17535332a12.19.2026.02.03.01.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:50:39 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Date: Tue, 03 Feb 2026 17:48:13 +0800
Message-Id: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3EgWkC/32NQQ7CIBREr9L8tRigVq0r72GaBuFLf9KCASSah
 ruLPYCbSd4k82aFiIEwwqVZIWCmSN5VkLsG9KScRUamMkguj7wGi8otZF84j+QojSZFduq1ube
 t7rjpoA6fAR/03qS3ofJEMfnw2T6y+LV/dVkwzjTnslV4EOe+v9pF0bzXfoGhlPIFOhJrqLQAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Roger Kan <Roger.Kan@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770112237; l=903;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=u0zWzVB/IbD5oQY4O26nV5N+KWOpDsoPDXV4B5J0j6k=;
 b=bjYFW176Y/+F1LIHvROPz0o13EZ5avX9lVW0ZmD/Tox+xxQ9TytzDUNlUSeAowYi4jCsnzI8C
 2CPIP0/fYiVALW2Sj/kads1HKs1Q3uxEeHj1TneJL4J/lnM8IeErl6e
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015041_333449_6FD5B1B7 
X-CRM114-Status: UNSURE (   8.80  )
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

Add Linux device tree entries for Meta (Facebook) SanMiguel specific
devices connected to the AST2620 BMC SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v2:
- change mac0 phy-mode to rgmii-id
- remove max-speed attribute from mac0
- Link to v1: https://lore.kernel.org/r/20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com

---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: add Meta SanMiguel BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 1161 ++++++++++++++++++++
 3 files changed, 1163 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260202-sanmiguel_init_dts-79cdb33c50d5

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


