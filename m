Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F98CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vUKdp3zxH7Oha7uDxQMer9tLEpUMsFaUWsBzVTUUJVM=; b=zZCvQe5pu9oLvJ
	8jXw7PVI32zY56WsEMpcStXTJHZs9bKyXWFrd8RS1AYL/yu9jdLbshktxhRjnfYNSf7Eh/kZcwRKG
	Cc8mnuf/lMzY7KEoyagv/xCDkDkOICsSTiOHmVuyamFgGlAIrPhmzMYra42kXl4q3HfL/gaXsWC33
	QtO1v4H0sdy9vbgycT/JT9BG+P8yTjzV0/VX1RWGm8pOTl++Pe75H/GarHq0dxPGaRx2Ftth4KRFh
	vahPNayxovcCOUqgQwMFTHsp9wWlLK1CJqufoaAHXwKJrcSyffixPU3EnmCKEt94qVA2G81Io7g41
	tfSliXJ7zdNwDG0/faKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8c8-00000004C3s-2NgJ;
	Mon, 15 Sep 2025 12:47:24 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8c2-00000004C1q-0XV8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 12:47:23 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=mrh2NbHx0ApUEq6mOLe51fG0WP5c6GZwIxnZXPh5zzAsiHX28BeTTHgK4ARDvNuM3zf/zMPq4HRMC3XpO4xAcg60zZmrhd4D73R0O6qTK2xTOqGjdn/Na3neNJIc7Z1XO5Ez5yGpdb53j1YGfRfsuGgApfcOG3OnEF8HtyGKirGRuSJetp4bPc1hl69xPPWA72kUWBbFdgmkTdwznUc8BKp/xmu8MZdRTJL+3thPTDtacmBQ+lhUjyTwLTYPAL3ifO/G5HTbl/krO55g6vjoye2ESvMIBz5H+yNZu+sIlioiWii9odijx17Zr3HXxEz6qf+fcK4JXNNuHGIh1U2TKA==; s=purelymail3; d=purelymail.com; v=1; bh=nZ7OKo1OumVzkuKry68ZUJeaNsWtdwCoQlST8Zyjk5k=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1506483826;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 15 Sep 2025 12:46:27 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 0/4] Add support for mt6878 pinctrl
Date: Mon, 15 Sep 2025 14:46:22 +0200
Message-Id: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4KyGgC/4XNQQ7CIBCF4asY1mKAtoKuvIdxQdtpOwkFAtjYN
 L27tCs36vKfZL63kAgBIZLrYSEBJozobI7ieCDNoG0PFNvcRDBRsQtTdExnJRX1aJsUDI1P711
 IVPOWc8lLBl1N8rMP0OFrh++P3APG5MK870x8u/4lJ04ZLbpaqkbpugR1G8EmbcwctYVRozVoI
 cSTCz3ZNibx4fLyqyuyK6pSFlzromvET3dd1zcjm61oJQEAAA==
X-Change-ID: 20250908-mt6878-pinctrl-support-a1d117140efb
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757940385; l=1613;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=nZ7OKo1OumVzkuKry68ZUJeaNsWtdwCoQlST8Zyjk5k=;
 b=vT5USx8yXGrkJw4bzhrJotrS/vOL8+/o4FILRu/5UGNxjhXiDDrY8dLNbeJwsoMscv99/cDg/
 xlLNTYlDzbIBG6pVYxyM0/nPSLh2vnIdVsyKZaJ0U31pjsEmSWEw6k5
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_054718_269310_92BBDC8D 
X-CRM114-Status: UNSURE (   9.54  )
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

Hi all,

This patchset adds support for the pin controller found in the MediaTek
MT6878 SoC. This SoC has 9 pinctrl groups, and 4 EINT controller
instances.

This SoC also uses the new "eh" bit for controlling i2c driving, support
for which is also added here.

Changes in V3:
- (Krzysztof) DT binding: Limit gpio-line-names

Link to V2: https://lore.kernel.org/linux-mediatek/20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org/

Kind regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (4):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl
      arm64: dts: mediatek: Add MT6878 pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  211 ++
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h      | 1201 +++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1478 +++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 ++++++++++++++++++++
 8 files changed, 5155 insertions(+)
---
base-commit: 9bee9db994df9f1a2572e3ecd61996fbe9a871b0
change-id: 20250908-mt6878-pinctrl-support-a1d117140efb

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


