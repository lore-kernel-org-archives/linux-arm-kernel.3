Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF835CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=82DQuFCXh8YO2rtBkOqPySEJ+o6VhkmuvailxMJ7KeA=; b=bk49TvKbINMVv8
	F4cRoWA0Ko2J7V4dIlR2cJrp/IWzSxcQpaDWIJF30uIYC/tSVu85l0iGrhXC5lY1W+DMKWz2leRn9
	gVelZ+ONosV61WKXvqfCHnqEuGuhq4wB50jorK50mcs9ZEGJBVUGabFqU0j1VwH6Luvyp+2VlC1g9
	yPBnDzENfAbQEwyPn4VuI7aDEG6ZRbaHJDlA5+dNAvWLAe1SWUx49genkv1oDODqjLk0ksRVlyV2x
	+IZNHsXW4W2OXm52PivZJwTgtcumu9SoWecuIbeCdt14X/K/8JLdS2aWvUIFo6LiwOGxwUYj2t6jA
	pFE6QLI691029nwLxSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBR-00000004oXY-2fYd;
	Tue, 09 Sep 2025 06:50:29 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhNm-00000001pvO-3CTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:18:32 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Tnu7FzlNRrvAkepIltGvjpu9EdsiMA10UkZXaZVXkcnFa1peLRj3E8wl6ynPkTwOwMxQEQSt7xTF+kh0S40yBzp5lJ/He13/W07ehhlM7oD5YrpbYqsSp4/gaVGa/4bBsnk5ODMI+3c2/OyI+Yq2MC9FiwbNfpAoYLOPr98MAj0ijI3Z9x25zkgg7YVn7F55kZHVOlUfQL86k9K0qWS5Vr02VvFjle7t0EHmSTjsvh4O0Dk9mwqK1xVE9lkEd5JgFllDbV9+uf/stStJkuebRcPYoXUZiyhVgyp/jHiOGwYawBbn68O53kZFbbtmH219JW8BczfN/dwfeaFnsul7sQ==; s=purelymail2; d=purelymail.com; v=1; bh=9F2TNgdH1pNDHLwB0pIr1YxFZjkobiXp5n7/OLvFJn0=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 292196779;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 08 Sep 2025 19:18:08 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/4] Add support for mt6878 pinctrl
Date: Mon, 08 Sep 2025 21:17:54 +0200
Message-Id: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOIrv2gC/x3MywqEMAxA0V+RrA004qP6KzILH1EDM7WkHRHEf
 7e4PIt7LwiswgG67ALlQ4LsLoHyDKZtcCujzMlQmKIyrbH4i7VtLHpxU9Qvhr/3u0YcaCZqqDS
 8jJBir7zI+Y77z30/5GtqiWgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757359086; l=1603;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=9F2TNgdH1pNDHLwB0pIr1YxFZjkobiXp5n7/OLvFJn0=;
 b=wI4YdYlwNvX69+y3MzJHzF6UO6pNEeWKFAjvc+aSn8WWJDIMJQsllOvMaB2EBg5KV3E3rULTy
 L1mHuP3micEDVGsrwXEWOIfrNFSLazxHtZeK84LMp02aFUXnREqFYo8
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_121830_885402_9A854B10 
X-CRM114-Status: GOOD (  10.26  )
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

Kind regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (4):
      dt-bindings: pinctrl: mediatek: Document MT6878 pin controller bindings
      pinctrl: mediatek: Add support for eh bit
      pinctrl: mediatek: Add debounce times for MT6878
      pinctrl: mediatek: Add support for MT6878 pinctrl

 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  209 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/mtk-eint.c                |    5 +
 drivers/pinctrl/mediatek/mtk-eint.h                |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6878.c          | 1559 ++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |   60 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h   |   24 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h      | 2248 ++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   30 +-
 include/dt-bindings/pinctrl/mt6878-pinfunc.h       | 1201 +++++++++++
 11 files changed, 5342 insertions(+), 6 deletions(-)
---
base-commit: 64074b8d93abdc35ae90e38ab5135f0b13ccdf68
change-id: 20250908-mt6878-pinctrl-support-a1d117140efb

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


