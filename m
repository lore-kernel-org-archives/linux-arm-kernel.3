Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FDDCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UCbUuj9+hOXP+c3XV771H1RCzF6jFI7j7nEisy+/CKM=; b=NHVVzEw42DJjio
	67tenLCLVnjzsjyN/Vjw63kSe+mha9566Loo8Di6PRDstphN2J/qlnbGuQxWTyRycNxTCJQqpmUw0
	LKhcDDyGuobW4pIC596/fD36wDZxPoMzsaaYq+K/tNkSKZQUHMkx6S+IsLnmQlIUin2hIFGTBPE9g
	zY2ScWh1wap0TrYHNj9gyiOopDuOXTU3TxuuEl3txY1jtjLQEaCCG54Ux7ZM53GT/R2O/Wo1hs7fm
	+rnAjF+e3bEFRYEvb26BB+Pfmz4kB9FYImjzXm6Rn5V/i2q9fsSygZqeqKA50SiGtEO8webvnqIge
	U/gBzQaFmlPZ/Jdqt6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo8A-00000001abP-1MEu;
	Sun, 14 Sep 2025 14:55:06 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxo88-00000001aa8-0U9Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:55:05 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=C+mmaTMwjnogU5w2g633397v2KlZAuXWdNLGk/OIvLZ0ImFKhCkwQgWzUK6BPcw0Ho9KGvfWvL2b0cWRVveI7CRtZoVNfCDWhTuGeW1fEPNU6eCtdyUrYBVAf4KopmagI3A+Y61LQeNnskIRZ98LG+T2Kbo+PkTfgXQPJUGuWvS4u7WXgcrH3ydUMKe7rTCfxSiyVfhuM84d+8SWCH1c966Wxd/72iFVMa0gtUpNRTXtsEWe4wQFXkf6M1xxjtGZKahCQAjHIQmWtzNADTotuWyeP1PGiJq/eTXN5L5FvVixyY7qshBSuyAa6LlTpuxEmpXwfpF3CvATGSSf1mkNkw==; s=purelymail3; d=purelymail.com; v=1; bh=9DkDs73cZykCmkmg3df0Vd7zFxbD5eZBfhpDkbzHxAE=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1880024390;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 14:54:29 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/4] Add support for mt6878 pinctrl
Date: Sun, 14 Sep 2025 16:51:58 +0200
Message-Id: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7WxmgC/4WNQQ6CMBBFr0K6dkyLKNWV9zAsCgwwSWmbaSUSw
 t2tXMDle8l/fxMRmTCKR7EJxoUieZehPBWim4wbEajPLEpZXuVdapjTTdcaArkusYX4DsFzAqN
 6pWpVSRxakceBcaDPEX41mSeKyfN6/CzqZ/8mFwUSLkNb606btkL9nNElY+0ajcPZkLPkkOPZ8
 yiafd+/CP+FMs0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757861668; l=1670;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=9DkDs73cZykCmkmg3df0Vd7zFxbD5eZBfhpDkbzHxAE=;
 b=KUK37uPMFx1/1uBIfny5ukgD3ZcYfWwEoKjIjy9Qm4d26LSJfkA+EiPjTOLjqjHGVFCRUwNWA
 qGnY10D1OmeDdSXKmMFXqJi5u11RgnRiERGGA4+1flfnzR/o0bqSomg
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_075504_221043_9F351D8F 
X-CRM114-Status: UNSURE (   9.81  )
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

Changes in V2:
- (Krzysztof) Move over the pinfunc macro header to dts directory
- (Angelo) Drop useless eh bit commit
- (Angelo) Fix s-o-b on debounce times
- (Angelo) Massively simplify pinctrl driver, use PIN_FIELD macro,
  change eh to drv_adv

Kind regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (4):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl
      arm64: dts: mediatek: Add MT6878 pinmux macro header file

 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  210 ++
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h      | 1201 +++++++++++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1478 +++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 ++++++++++++++++++++
 8 files changed, 5154 insertions(+)
---
base-commit: 9bee9db994df9f1a2572e3ecd61996fbe9a871b0
change-id: 20250908-mt6878-pinctrl-support-a1d117140efb

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


