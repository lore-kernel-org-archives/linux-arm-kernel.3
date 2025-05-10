Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23B1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=; b=EpCZjpsvdxCfj4OJFUHoR03szB
	ihbQwDgGXaS+vI2yErbIaGfuzXaMRlbYbDQDRwZnnmFd1ynnqmdTJAA6gIq1T9j7O1583eZydXltN
	D842JJhUX3vyJssBzbl3wo8xaeJzln5ytCULjrb0KCpkjzHFbxWlq3x0PDO/CZ+OXSXaZ2d/IRQzT
	TSRhMarp/c0ZzwfaROHPMrk78f/S00UdMJ9U+8LCHjmPH/we4hV9ZYbpolzgOF3IZgVelGsiOf64C
	QG2Q+GFKzVxH5R2mADSvgcRJyYpdak2N3axJlHE2fMjXDGCMhqB6bXwQql1xtVouQ5u4SB0Y9iLZC
	9klVVcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYvL-00000005Ffp-2UlK;
	Sat, 10 May 2025 01:22:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYrd-00000005FFj-1LSr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:18:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so19636265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 18:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839931; x=1747444731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=;
        b=DOVOerl4API38oQwGkl/SctmwOfNtIXtzeG5OO3Gd2PIKXQRCH7V20GyXIH320j4Mf
         7X/GmzSGuKq0j6+IwjqLfwmIY9UoSpvx2/MaP5GkdUUVwZWYkF4c+nxPIkNTo0Ay0thm
         0AFbKIHVwbW2oKtYZJ99Aa9wAyZDzcQOp2mJaGnCzJ619SiCLADeKx88tJ+YBQ87KdNm
         kIinJ0TIngeeer5jGIigAgMaVjNsYD4V2JpNTgczWkrEMF7WHrCx0SJ8KJqGdf1hhFa7
         clpsRd7pXtSgG2wOHYuEAwr9tOWGsrN8htAz5WhGItvJPeBaoI4S+U96qk7WOHxx3aAd
         XRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839931; x=1747444731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgefQKrkl7AUiVIowJ5uHO9Gz0mmelQXe1AybeWFtqE=;
        b=qYCWFll4WteqY4J3TuMJN1qYyvMEe9uHG9zpOdKoSX5CAa2RhEq8RqWH0jvHdme88t
         YO2JOWD3J2R5Xc0QVKqWAl82JC1eLD999p8xXRnfekY6wPLKaT55SWXF6cvtyQfvglmi
         JygqHUJ3iO5zdx6cXfaqyYFiqMjX0gvDUlA+sqwIVt1gNokof/4cqxz/k3jT4kzPPZ5G
         FUudEAigjYc1DTO+7YGoQbyxbFJWmiGYM/IlXA8QR7oz7QL6IbXwTHxjo+4N8FaukA5Z
         YlQks21KWQLIVWEg/eRZVkTuC3QSj/sMOgih1nY8u1ekM0Qg3JBNGYOjPNmpPxw8lq4Q
         cByA==
X-Forwarded-Encrypted: i=1; AJvYcCUjdE3vf23E6kFdHo6IO6davk6izljXfbYwxOS53H3O8Q+V95Ob6REcltX0B52ySjukl54sSEaZ5BBwIORjr5xM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw34zRk0gTRjE0IxwHqYT8/xXBzZIN+wmVwUw57IVuZlxqdlP/D
	nlIgVzGConCL9vlHC+pSzsoz/+8Civ1p49HAQ6to/JgbgrERLE1O
X-Gm-Gg: ASbGncvQl2xIqd8p24BbKxcZP0VoyrYdbQLSnpvg0U1oXqwi3y5fh91XPPpFXNS3JZj
	XZ0Nry0GQ5gSKDUZ5NYDrTWrTVRzsslfgOXEHv/7uGj2jFkmjpU3DfW3Rqljva5DlfBtj34wUd5
	RwLLCzYrCx6PPbRjyz4RZpe1N8Lro7j0fQ/T3kwtK5O83rMDG1FID4KY6gxSgkl0tUyzFqadDoD
	74fcXNguoXjdzbozD/V7lIONpq0bhinyQUIKJrRPV79a+0ApW0GdCHp+bPjU/UHIm7AigwMyV8v
	3wJ/DRPJm+sNH6fOnWxCBbYL9XZBipwKtd3Ndc2j69spftqpgvQyvxJIHCkpnrjy//A6Jv+8iDf
	aepqV8w==
X-Google-Smtp-Source: AGHT+IFnYaVPCAzu64yluN6ujyxlAajvDa+pg82hQpa7k6WPDQeLMevDuZw2bzKwlYilO6uHfOQAvw==
X-Received: by 2002:a05:600c:3586:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-442d9cacc19mr33564445e9.17.1746839930843;
        Fri, 09 May 2025 18:18:50 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:50 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 0/3] arm: fix imx_* defconfig
Date: Sat, 10 May 2025 03:18:03 +0200
Message-ID: <20250510011806.13470-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181853_355224_632A6A4B 
X-CRM114-Status: GOOD (  10.35  )
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

Compiling the kernel using affected imx defconfigs lead
to a hard CPU crash that reaches a state where each register,
including PC ends up in 0xDEADBEEF.

That is because the SoC support depending on CONFIG_ARCH_MXC
gets disabled since CONFIG_ARCH_NXP is not defined while
said feature depends on it.

The default arm defconfig is unaffected as it defines
CONFIG_ARCH_NXP=y correctly as excepted.

These patches solve the crash causing my confusion:
https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com

Denis Benato (3):
  ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
  ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
  ARM: imxrt_defconfig: define CONFIG_ARCH_NXP

 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm/configs/imxrt_defconfig     | 1 +
 3 files changed, 3 insertions(+)

-- 
2.49.0


