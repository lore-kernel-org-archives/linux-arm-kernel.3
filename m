Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB76EC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=; b=IpJmU193dqsnacXjIXeuM73liC
	Us5XoiP+qm/JtQamdeq52aswqXAkQe4KTMyOaSrf0Lf7jCc8JykoOpKqYsnSv5JwWP/8ywMQTmlP3
	lTSOx6e1eA+cMSv0MZdKCmo2xJmSBhuPr+SuZX7UX1Q1rDWAyzSj8hZnwgTJYD2YIg/K4387pgKwZ
	HQRtW6thHT1XALYJHMSUiosC/esFzLB3s0/HkYpDSyJ1JlnsIiDT4Mb/tqRJ0MJX9jjQaTCDwwpIG
	X+SlwYfIPASKL8JryeSgpeLeijuwFDZObAVb6OpTOqylQWx7H/KBVFhayCE+prtZNP/5uafP8lAZc
	bCHlHUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYX-00000000jhQ-3S7A;
	Mon, 23 Feb 2026 17:17:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYU-00000000jgj-3U14
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-436309f1ad7so3454765f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867029; x=1772471829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=;
        b=dVHyqrk2mCtt//qFyPHtwGysqx9N7DdtfPwAPKJvGbzlr95YMT2jlqOdifoF0Ldd9L
         zSBayrU2n7FnXq7Y/uOb67XPCu2uYg8Jwu8g6vvoTPj2wrktzX0yjZeI9JZ8vBz0fUo9
         9U09UD3YnBHo5gShdULoVO62ICogaNRR2WQMzVW+j52q0jBLf6VwOdUZKBD2rrY+Rgdq
         uiuGoH058RAaLbX3LaW1psM/elURGglc7lME+JatIDvSKq5saiixtN2SLvbjUONPH8u1
         sl80ZswVWL9KtNyjsUEHqymSI42Tdj3uD68ZC6IAhBaGPzurxr5YRX5tCh/I1cxLt63M
         yGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867029; x=1772471829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyGEcrLpV4bwwocVSCsdzUyZjiaZncJT9oIq/dUyqxc=;
        b=rJK5y/d8/j4HOauoztRHr3guu0giVS42TTgwq/cEjJIP6oGuBYLCFJB//NLJaOzxd7
         SU49femubb8eKg4tz35AFEIaXAnpqGQC/RKV/TxUi+l8vYsKmQWc7s9WJjCyRJS+nxeV
         wDE1A/sh7xz6lCWmyGNohSt2t+PB1IgDAX7Xy+a4pVUhAky4UFi4l3l/NXWy6encTewG
         HDR8J/cHU6lt30bsi6/noNZhZ9IjIQYXJNNyeL+3B9k43jyDQ/VsGBOR1fUXfjkH1uMM
         ALRIOXFPcraPZJVUcWpO8Jmd4VbhsWgVkc+1OsjBj++w3JuWhseIVgVNZwl3z5+1N2PF
         2xgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv1qVh7IVynFHC41IRQH/0iTZQYV6TdQ00YhBuW99TR1gb1Q7LTKhTbGACJRHdiqYI9TfJDtBv3HmoaIf0LriW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4OBWHkst/t1O4ykgc4onVccsuP4+Wll7CCxstmOvM1uNzisCY
	txCeimVcTpt2MrdrK3CAUwxtn9XI7u30XaON2Plp13hYpZJD3Dv/z/aZ
X-Gm-Gg: ATEYQzyaoBZT+TsAhrJpPGQvE1YImwb5r5FZ2wcYI4D9kNhtTcQt3q6dPeyy63JrObH
	phvT1pFKbs5kb/tPnCmhZIlw52U8dJCoipREXhx9KHBXyhjCnF6HfLgJEondgIkElz0zqsTUzqa
	KT1G3MOj80APExn8JsBpgFKoYMMXI+7z9JZ8R39GfQdcX7tCU3EwkV6W7D4iGqnsvI2Of5PUcXn
	8ptAovwcnFueacWBoNxmE/qYbmByyN1gxXbzaBkT7qnKObupGVyJt1JiOlrMdjl7DjtYXiNbFd3
	Szeaf3kJFmqrd1iMuYkB7gqP22nkVKzM4Ku+mvht9wPlsBr0//KWpVhHEAH/oDyhPFCWhh793Ex
	9sBHo/0zhP6nJVoXYNMQjrQNxzV+wDF4DO7pLyxJiWwSzfzvjv63Yt1i2zM6qjsW+5vfbesbK5H
	OVIhNgi8+NJy8u6AusvVk=
X-Received: by 2002:a05:6000:2910:b0:437:8111:e2d0 with SMTP id ffacd0b85a97d-4396f1562efmr16272260f8f.8.1771867028658;
        Mon, 23 Feb 2026 09:17:08 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:08 -0800 (PST)
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
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 0/9] Add support for mt6392 PMIC
Date: Mon, 23 Feb 2026 17:12:39 +0000
Message-ID: <cover.1771865014.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091710_887975_386D3C49 
X-CRM114-Status: GOOD (  14.57  )
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

Fabien Parent (5):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: regulator: add support for MT6392
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Val Packett (4):
  soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
  input: keyboard: mtk-pmic-keys: add MT6392 support
  rtc: mt6397: add compatible for MT6392 PMIC
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   3 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 133 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  15 +
 drivers/mfd/mt6397-core.c                     |  43 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 491 ++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          |   1 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 15 files changed, 1276 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0


