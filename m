Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB5F0182B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTkk7uiuigPho3KVdrJ5hWiT++sJi9u25O2m/ZkmXhs=; b=MbZqEvjm+fgI4p5ZxaOgyR6SpB
	VJjfz6rwM+Q9qTgQxaG+CWBORLa6ozsZa/9f3f1up/rJEgERT50giXuj72slTrtYtkWUwvF/VE2Zd
	p9ljIuG9NLkJlN1lvjEw745xoOFVs6oA7pUJ4qnKJZTIDqqnI9zOBo6vUvFLkXDrkYOE1eIhmR9+r
	gxlFrMFF1SGTenmPTmFTofsKJyFA5fk9WSzeptnTvvxq8hvFMRzygcNPutAySBmT89SOYJQbzQq1x
	1MiK2xxxL7Ns9nnYiIk+V5cEc3F1KqnzNOasBz/NCVAKu3xCnNq9CCkS544Z20Co0N8Cvi4MQHqfQ
	JzHUppng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwK-00000003bFR-2JOU;
	Fri, 06 Mar 2026 12:05:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTwH-00000003bEN-3XoZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:05:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso498805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 04:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798751; x=1773403551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTkk7uiuigPho3KVdrJ5hWiT++sJi9u25O2m/ZkmXhs=;
        b=QTcApAcbSBg9nTRL9egqoB56wRtQkNYppjx1QA4G98X1OX8g3wFEA4nB4N17Tleb6P
         BXe79HgMZFwKgoBVFQubjctA10cjWIkbVdHry4xMOnbiL/uKSXYnr0no8xRVTiaLFjx7
         keNkZOumuk2mRH1coBz3KtOd8vH3bQY/hB212kq7h6dgOzj+935y/0cZrCwn6I7gjC/n
         oD/yYC4HBij8mehJ//3Lv+r3Pwiq/2Pd026rDEC0C/hNE7pnSFQfIEGQYyOCo858e9rI
         IFgUqwORWhJUmbe7bq4kjMMP0V6MA68o+R3R2DCH8KwXRwp05gOCyd5NlceBliCcWFFU
         lYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798751; x=1773403551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTkk7uiuigPho3KVdrJ5hWiT++sJi9u25O2m/ZkmXhs=;
        b=U1pLjDvytZA9pPGPJo9U7+EyQoljf1fCdrOMxgJHKB1xYLjc8R/aQgRBoGHHRT1nYM
         BwfiHh8CHG78F912v41Ff8tzNHfQq8DZkt8mkmQWkl4iTePLx1nKwdmxKrC0dkCDslGP
         +ayMXUlgSftqmDzvb+hb4KRtIV6Mc0vlRRRwipKr7Y23nTKHCWUlas0piRCcXk7JZq/P
         O3BIXwQGYXqt/uGWZCWgwaIlIIcAIysEGagxkOZ8axYStbWGXbjWJgrR08cRRtLODj8f
         waAKlrpmDHx8PmfL/IajQZxRfI21wPLwTycuIfBkLW3FwPs0GEJ9K4U+Hvws08Vgd0pS
         rPNw==
X-Forwarded-Encrypted: i=1; AJvYcCUc4XEAEGXqQbbu3TQJI4VjYFUN5zDIxurCf6fh86KwGggeNcs4VQy5fEZwBTV/yMfUP3hptATwKP9ty7grkHHx@lists.infradead.org
X-Gm-Message-State: AOJu0YzD8A9SuvaulZOgXwUDmAc6edUXqtvZU4+QPwCGslZqTS8OI+w8
	GHEmlpNiSGL0siZfQ9fg4HTlUoJpJs2TwZgxGVh+uzLKeKMTb1p4Yn7r
X-Gm-Gg: ATEYQzwKrUseYyuMNHizDLrBh5mgZWS8z6Q8uUAj/vSbnAhgDAZUQa5BRhZrv03KrPZ
	Kf6ZFPu1XhukbD8yvzL2hqIL4z17J0xYK9J0ccNR1Rba7ApXTFTBvMZpMsNcghRM031WsHZIIt7
	udRpSbzCWWxPmebr7tjC3GlYtvLLcTYsMxAh0fviqUPaxBkj542TdCTTkBBUmijYo4sdGkZKfMs
	aL5DY9iMaXaJFM8KUtvdbimER8sLtCxp8Uf4ognXw2ADOpspMcjH7/2PxOYWbsDnvum8qULUCq9
	ZvclQHtCjwWpf7hDzAJ0nbE7E9prX5N8DD9ka4+lyrHEBxcgNUzdXbwQqnF6ZBzpxcGrgn7MnJE
	CD5cxFt2XeWR0oE1LwQP3NZ+/U2i/JKQCj8GhRXIWHprMm9GvtnjptI6uZuxtcjzltwWQT0iUuo
	UoqWVtliSq0L0TDJFfyH0=
X-Received: by 2002:a05:600c:a403:b0:485:2969:cd9f with SMTP id 5b1f17b1804b1-4852969d02emr7858575e9.12.1772798751250;
        Fri, 06 Mar 2026 04:05:51 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:05:50 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Val Packett <val@packett.cool>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/7] Add support for mt6392 PMIC
Date: Fri,  6 Mar 2026 12:03:04 +0000
Message-ID: <20260306120521.163654-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040553_907433_3D7DF779 
X-CRM114-Status: GOOD (  14.25  )
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

The MediaTek mt6392 PMIC is usually found on devices powered by
the mt8516/mt8167 SoC, and is yet another mt6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

This series only enables three functions: regulators, keys, and RTC.

I have added a handful of device tree improvements to fix some
dtbs_check errors and addressed the comments from last year's
reviews. The series has been tested on Xiaomi Mi Smart Clock x04g.

v2: Review feedback - replaced explicit compatibles with fallbacks

Fabien Parent (5):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: regulator: add support for MT6392
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Val Packett (2):
  input: keyboard: mtk-pmic-keys: add MT6392 support
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   9 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 134 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  15 +
 drivers/mfd/mt6397-core.c                     |  43 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 491 ++++++++++++++++++
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 13 files changed, 1281 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


