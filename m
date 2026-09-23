Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A49C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=; b=m3lTUtPDOyIEdiIsaG+U8OGcJB
	nZZJ7mQrV8C0saVpLVb/7z+f1AD/VHfJPuFir9OGOwK3XLXWlJvH+glZinZLzSmMHT1WZsHCjCNRc
	j0NYWYSe6AMH9gLb8BrfOPKDZQg0KVxryx+XFJNrdGwWNShL9oSYl2BPN6SSYSch14eyxwGmPD9K0
	gn8Q4Gmillcwvnkv5XUVmM67Aq2UMrrH0lH4iKm+6hgKQmRFK90zVsJ1pGLw6sKmgT3Q7eDosIA3W
	WzajnDNO3daBY6EUcGCC7Do4HK+kZW1ONk7sbBcsEReycsGweUn9ihKMrP0xeZruLCvMMT3nGUdZY
	muXNdMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Opx-00000008jDg-05Xu;
	Wed, 23 Sep 2026 15:24:45 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Opt-00000008jCK-3zHf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:24:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912df756so7710855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177079; x=1790781879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=;
        b=Y/RzKMz18dDECzxzrNznrBvtti46v3qXPIT/eOGB6SPHaiplQLmuX7SYwhtgI64p3w
         cPnI9Y4yOpgbjwaWe9y6gYzY94WRbIsSEwDDUh+c0c2CKf4HirYcdNRDEkaDDu8lQrva
         OssPIzC5MD2UXxDXRiKDrd1DuW0h8egtdsaD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177079; x=1790781879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=;
        b=O6LgIy8UsoaLTqRtXnZvhTNUl3tLwdhw3z+FvjbiyOvBz9F0EdxhpwWUQrckwjs6LK
         UnktC7a63TNfFr5tItJ16k5ANcyt3/xOtoyKOFBYdn4BM5Ih2VdibcsMjL63Ws3oCdJ4
         8g/vvQv/TKNM0HkbmnT8tI6F3qS1RqPUDPgOBC42kUUMVqfqLrjoNBtEwxW9IojuroqA
         BPynuB0opWZeyFbkIeyAVGdbGB1FXfunfy+UJJOOzKOtCVhRDuop6cOqgYitDuRosEnP
         tbWVSarb9cYFujQ+iq86E/3NjNA4dSWAHl0Iyii4JH96qp29Q+JbqTE8qjMfevO3D1FA
         MjZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCLSZC4x/4lCCwB2J2RturURnoFVjbM4fEB5RUNIUNXBZXvpo2pn7DYQB9gEvdnLOJa1nIn7igRFlGw6pMXdKQ@lists.infradead.org
X-Gm-Message-State: AFuF++kO1oMWB1Fb0sOiaabOl5/kWyrUO8yrO95Vm7Tb1AF7HTVVDe3Y
	w4Sa8n51XNOEWBih+QJiH1JNLq0HPHqSb+T71gNHgKR1bRxuvIDADp/wp5fzQPlI9hk=
X-Gm-Gg: AYBFou23qIE3HBypweW8NAZNLzZ931KfMvybZxleewj8cRyH0w5dYXv2WkT2f/+1THN
	b/hnAKFZ9LHt/jnYh2y34OI1Sj/4Aue0yGspkYHEhw7fW1di5cbDr/hNXx1/5cVJYzu7a8+fpmD
	ylBI0Iu71HxsRCjB92N8yTLL1O+vlMDyI5qXkt/mqwMs+WQkcieQBisl2YwmTJI0kVJsvvod+FH
	JOGK6/ds5ESYPWudeBfGjJ8cUror+L29kb+Xfhx0PYqCVZ6loXGH9xbk4VvLBozzsLH4oDoRrA6
	Wq2I6m/WTiWsDLfoqqT5uBc/hjhWdHyE3HR68tPktJ6eunEP/GQJ9iJDa905I8WPWBBf8esXbwx
	gAoXwrL7DVzTlPqnlkFu1VXB8ECzUVpo9JtqyI3uOMxqTUuJtfjlddhEZITip8NX2aKR3GRRwh6
	oSplCwZjHeQQ8Hei64eXN1bwIBVyMs3vZlU3EG4xivxSfV5NWOcW4iAM/au1u8rQ0Dhcz0sAGs0
	drm1wqgnbpe9i3jxUZCM0Kp+GpUjJ5gm8a537AhIjKuGy2YSDX2pjDmTLRes3PcYALDEYA6V5A1
	OQ==
X-Received: by 2002:a05:600c:468f:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fdee0ab5fmr47670875e9.4.1790177079486;
        Wed, 23 Sep 2026 08:24:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 0/2] arm64: dts: st: add display overlays for Engicam MicroGEA-STM32MP257D-RMM
Date: Wed, 23 Sep 2026 17:23:46 +0200
Message-ID: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082442_000256_89C3485D 
X-CRM114-Status: GOOD (  10.24  )
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

The board is produced in variants fitted with different displays. Move
the current RGB panel to a device tree overlay and add one for the LVDS
variant, so that the board dts describes only what is common and each
display gets its own overlay.

Dario Binacchi (2):
  arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
    overlay
  arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
    overlay

 arch/arm64/boot/dts/st/Makefile               | 12 ++++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 69 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 51 ++------------
 4 files changed, 152 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
branch: engicam-rmm-overlays

-- 
2.43.0


