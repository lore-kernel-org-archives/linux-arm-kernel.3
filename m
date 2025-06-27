Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67FCC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=; b=FIyaRe6sXWI3RyFK2KjBYHB4Ze
	74bBtSUvSM4f/oxbsXZYHlvYhYQop86xR61Glbblm+0aT2n0VYYL2nxEBQ3rHec2oLUUqq0SSihqE
	9eXKpbA41M1JL8XP6obYUhz1rs9NFmhWrDVPiPYrk1BiKQWjLiT+ae/ZObRZ8Qoy7nbuaJwx1m+bI
	dcSfVr9A16W7ozbg7hWf/Og1rmYsxPDvNLIpKR94XT/XyLy7cGOSbxoqrBo8L+3npaq6gWHL3KY++
	Cc+O2Q7WXHmWuq9OvbwHBvYQx2T9121TiJQC+4zJXOKod1A3I2CFzvTJ8Qp1wn+MzOrnyigdsQTcX
	yAYkSCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAYZ-0000000Ezfy-2KPA;
	Fri, 27 Jun 2025 14:59:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA2w-0000000Euh3-1IHz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:27:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so3464827a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034436; x=1751639236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=;
        b=ZF5s0MA7q/igdFpq3EEUSKTS0bUjqz/N0McTru1WPxQxZG8gDwaU3Wn+O6Z7PgXid0
         3qy/72llpDDLFxuN0i0Dmq0oxc9wukUzZG230ar2+Le36o4kKhI5C2s8M95aN/gjw/zr
         DVXN5RdGafAbkYduP63QOQoLD+WTvBCr3ALa4lQxDVelWe/AnVPZry6fBmkeSQI4JHXb
         hlmSI4nbWF3fmaPTWoZKxdGZ2O07Tl6NgskcQM1YlOSiUL6bQcINfdsfBQi/tA9AI3id
         Jm/+sKPPEzbBK8Ng/zy5OIzNa4Dq0pSdIAqs2ziEAlpRdASS4c6QqHoGThZtT2cfBPKg
         5e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034436; x=1751639236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcSBhyw9Yhzx7r6sZ8IGYEHAbj7bfuO5frJAgYAC6fc=;
        b=EFD5MzGn/MFE2Y1plVIJ714rTJSWEa6RaYIGo24pEnHNzAk9t7AtYadCeFQldZm902
         Y7C3q+3JqlPY/B4T7csAs3GGTHRphUDF1QxCYeS/9YeetifRiFksnMDAlqmuKD0RxJuD
         ace/79kjHRHyGIEvumWpwPG5CkC04s+4+fwS1+apN/jZSW+vevJQ9FURs2YFiZY3J/xO
         rnIo6zMjDQv4QZNlwKNFPgHMTORY2Ak/vkjDzCWMGNsZGjWSYnmNSVBnN6EDKb1Ew3m2
         fh1Oq+V4wUbd3EakKts9IJ+ecGRadxKgzfU/apPbQ2A35NK8i2AKvqVAOb4+4WBinbVo
         RV6g==
X-Forwarded-Encrypted: i=1; AJvYcCXgfnI0AoD6VJ9Di5Ql5AnFpXVftOfWGDe0wwG7FyX6E+xeDqMWTzwYImFn5lrUY1174pX5Aw+KjvSgKgl0Oecd@lists.infradead.org
X-Gm-Message-State: AOJu0YznetWtHFoehYYHJ1Dttn+ijssgzFH92hJ7f4TDhjPivDAql7+c
	zkwNi2GXU6mYpQdaX26kWtpE3rDthp+UmPkTe32jTvUwSbd3/QvpdUNRh7cgDg==
X-Gm-Gg: ASbGncsLyeR1MqtZyh7raj4nHn0eDcFXDzGZI/JCTDqSPiHd1UdseNTqqeqBq+F2Acl
	Dv2RVtuBPmTa6+PoToBXJcgyG7ehvvZ/jSlXin1Vgk83w2AMk66LvnbT5Fk19oloMeO96YYpFyO
	b3T4vURXPrZEH3IP79z4+bOHouhKETesAFJpyu/4XA4d8Wy7tnfkZeDKyTEjWg8l44d2B95VcgC
	N2tA0IKBoU2PV0aV6ita3FbtKYUJXhoWo7nHEdKlt/ZZ4/pLn61RIe88XPCx+cYDuDf8jCb3DVM
	M87D6cw/+GOAlNvBBadI5amTqWX1ppVomMncH3kIDnkSKgxmspyDaRuCErQXd79YQ4kvkVLudWj
	lEJTl7EkYUwrfnF7L48Y6oXc=
X-Google-Smtp-Source: AGHT+IG0h3kcfUrRnkezRjAYnSPlB8QkmdyUPOhCB89bzaJlmd0l883sazC5bhUvRYXEgDVePtMgsA==
X-Received: by 2002:a17:907:7e95:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae34fd89929mr296454566b.17.1751034435962;
        Fri, 27 Jun 2025 07:27:15 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:15 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Fri, 27 Jun 2025 10:26:43 -0400
Message-Id: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072718_353544_E2C05DA9 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for the i.MX8ULP EVK9 board by introducing a new DTS and
a new compatible string.

---
Changes in v2:
* introduced a new compatible string for the board.
* aligned the pin configurations to the same column.
* link to v1: https://lore.kernel.org/lkml/20250623150146.1398044-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
  arm64: dts: imx: add dts for the imx8ulp evk9 board

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

-- 
2.34.1


