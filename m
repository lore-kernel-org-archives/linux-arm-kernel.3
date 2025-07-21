Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B241FC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hOPi555g1R1nQnwbYf65VIBf8GYSuV0PguYr5CDG9HE=; b=usPCqp3B9MmOexwrE09+wPopNe
	WM8nG6CjvhIkqGnJTZxx8vSGlHMpctBqzhLhX7wSbhA30W5R2322r3BzoX22UWC2mKUCHQTbQN8iA
	+UZCpcmsoYa66Yfrq4tuWOjzQNsOEi0QT+Nz0nN9L/feMqeqtRaxgH6v9lRM+PH7W8AdrGnBIfusk
	CRtgRelbZ72vV3ychEBURVv//G+soCG2ygRjpHeXU4Jncc7sjuCLP7PYj59FPJRLjhR4upEoLo1J1
	YbNzmgEeSl4uzwxRgPqZwboroMDQQVrTfwnuEu/WpmkDySspojgCRsVzcuzJK7qcQkt3CjznS4myB
	6atHmufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorX-0000000H7Nu-38Qw;
	Mon, 21 Jul 2025 11:39:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnSG-0000000Gv13-0Lth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:09:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ae9be1697easo949759166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753092546; x=1753697346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOPi555g1R1nQnwbYf65VIBf8GYSuV0PguYr5CDG9HE=;
        b=fN9PKB5es4lKdYbnbQ0pvdLhXfbSog37aiQFuFKPwrSZR0mHBUZvVB5ueXAJGQg7WI
         Vztyd5aQsdf+Lp3LNfenhMeO+3Gj11LLMrlLlcSS0j2jUU8nzC5c3H+cFAXNzWhlFN3H
         JXAGQVnmyOuyyMtqPWBh2q7g+r0XjGGcXMiQE7WR9u7PkDNxeD884+l13NgELqr60q6/
         eHb3a7qCLpZEiK81vyR2CTzcENlgQal8iyusJK0DulERgudXQU/FKWDu0jPUjDnf6mB3
         yD5wje3i9/DN70SqpN5JhRXVJAzz/KqEyzuvw96FcmRe9o7uaDldqSUNXRYR7cZrptEQ
         WxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092546; x=1753697346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOPi555g1R1nQnwbYf65VIBf8GYSuV0PguYr5CDG9HE=;
        b=oVqkl/PIjYnjcendwCiE7pMl765SFV4AwP5UUGxDZT60KSYgO37dsUMxodAQHOIj7/
         9txUekKuCZl/CmhZLCC/bFPgSJYnCeR9g3rNWzNmWHBA5lWjQQNuknw5qRA18DPHfGnY
         PXJOTGym0m84ibx1DM/MleWx1/HWddoKNUxDWwfO12/gZFEz5/mn9nhmlPTnHJfTvhd0
         1LsJFU5I3vfpY6aXExstlxWT9bsXBcLEfgcoJo3xQVVW7N5jv3PLJTOwy7axx9L8ZAn8
         s/HS7nQhA6AugIHs6zR+YtcbyMfRjKevZkQ1sBLwL7K+gMGaIFZGLPYbQIbWxo2+Fksy
         erpw==
X-Gm-Message-State: AOJu0YwTNSc0oi7rgTng7pSar2V2hTyMHjC8sgFvGWJtNp1D6WZFir8E
	6BDvPdZHo+/QTZqiStuWfD1R/NR55mGRzGS/7YgXYIAo5fAOst/VOuDdOAK/z0Meikpdj0atw3I
	ukmOY
X-Gm-Gg: ASbGnct0Zeecu20D8B3sZHwWNs8TudNoOgCA+221V2N/T7MAQj79BlNjbjN/pT+aFcv
	XPBmLuJGt9MUxCNO76P+cUqGIr4QPkmV3+h1Di98xpCTweORBjOJlZPGbfIT52TYfrinEN/GaxS
	cyXZClnyohS/SfDnS4aDoi90tpNH3JJfQqtxpHmq5fX0slOYAg2bRO8Tj+V9Lq3ClqMIv2sk849
	ey6YM66CJV8SYioEG3v5XPR7ydFQf7pWlAfbQrXTKF0p81zCe4s8cJc3WMLnQ44RBDIK+hJCZOv
	KV4uokaub3TSmt00rciwsErBCr+4f+iJrUsqInwDaERSfBgaoKHx9IIaWhZcc8M4MQLARmQfRbo
	+TCB/BiiAOr4Ebcnn2SVrRdV1fSCdioPoN/4t4sUH
X-Google-Smtp-Source: AGHT+IG/sZ0fRnLRzNDazSyxk5d4XUySLdxtGzOE7Ju/SX6SozwXYOit0mXXfrFc3DkmltPmuHnQ5w==
X-Received: by 2002:a17:907:5ce:b0:aca:95eb:12e with SMTP id a640c23a62f3a-aec4df004a1mr1302412266b.24.1753092545787;
        Mon, 21 Jul 2025 03:09:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d68a1sm647649766b.46.2025.07.21.03.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:05 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.17
Date: Mon, 21 Jul 2025 13:09:03 +0300
Message-ID: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_030908_298796_4F18B729 
X-CRM114-Status: UNSURE (   6.43  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.17

for you to fetch changes up to fac62e76b870292648c62522efd1cfb72aefc079:

  ARM: configs: sama5_defconfig: Select CONFIG_WILC1000_SDIO (2025-06-24 10:06:38 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.17

This update includes:
- the WILC1000 SDIO module

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: configs: sama5_defconfig: Select CONFIG_WILC1000_SDIO

 arch/arm/configs/sama5_defconfig | 1 +
 1 file changed, 1 insertion(+)

