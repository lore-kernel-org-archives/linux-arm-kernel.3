Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3BDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=; b=Wxh9eXFULZCyaJZlLVtspaWcy0
	CvGzEYdL9gkj3jkJSbjkP8hlhg1IFY3y3cogAwntaC9rC11ADwwda4lqe/sAVAXWMa2C7FahmvkhB
	azsNYglzoIB/0MjsTXOa8L6n9qwj0ZcB2CWERhAmMLaFEKhp12tbcDoJy8YLseWr//uArXtWEBt0A
	HlElukjHxaWeVtylWRNmo+5mfowm6g26zv/dsBCYKIug+rizKHf8RE+P1bffRkiRjpgsl1cXPbU8P
	6+qP0+NOGxD+tjLqRHB4lf245GAV4q/eQGKwK+WN5DXho3FFQxwweiuYnmRGFMYhDRi1J0wJHCQVb
	rHKaTK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldK-00000002lAO-01aj;
	Fri, 17 Jul 2026 16:41:54 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldG-00000002l95-3oCW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 16:41:52 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c167bda216fso535447166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306509; x=1784911309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=;
        b=PUa6vw593YGIevMoBagennzTFJJ1ngNLTJp9J91C871+V+SrZnzoT7zdSwfX5P1sFx
         u8j04ro+YOHt4bNMYhWi2UOxi1ghTiyL7WWrZPq4jhEaXq9iLJZAEhbPtSjjIesf96xa
         F5qesRqxJOPtkogReUZ+JO3RJqhdYNCLvOfYt2NMi6FloL+Nsilvi9rzkNLzaZYAcXVo
         xi5rFD2Kwiw7DUDtzjAwEZndr/5ksxifYFzcjTt/1zV+AQvw+yo6m0qA15Sj8LZL3dq8
         trX2HvH9hIYWl6VNDoQ9mnD0FlGNx+seoyAfyDNl/VZRIQuZnvlp9HjFrj/bPAICkgS2
         zlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306509; x=1784911309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=;
        b=ZJzOkL27vo5FiXrPuC2wvcqlokE+/43WJsTnwdFo9F42g2X9IxRBUPq0d7fae1k0vQ
         QBGVNhuLnxQz6uapzgCWgFXeGizcw6xiCaYrCaZXQPKBLaFsxXCzYLSHRtMwkCjxxPmh
         1u0aozE47ThCDFUHS+N+qT3oFjfspWyScwgapIj7RqSJa/FGCMRmGBC7SW9+6ZZXZiFn
         IDBb1bsdgGsU9m3vGxijiIlESVOt2BJ9mDByPwLPNs7QguIhVdtCh0nLD0bkJ/tsAEDx
         nuNYaaGT2Z9gDeDlKE1UhfUsnvCQOFdLFs9b0+F2CpCDQ3TB2EvPMaW4BmraNHQtnTnQ
         gv9w==
X-Forwarded-Encrypted: i=1; AHgh+RoZ/0pAKuwxs+j0fZH1xhkuFP7kUyN4ZaEi4KTdq28FM3zGYOdQZNNnLZPAyYXVhkk8/d9/G2cq8K1v7nDz+C0b@lists.infradead.org
X-Gm-Message-State: AOJu0YzdcOTwkUh5IUm0qXU9rAuRYIIRdrDy6x7Ig+Eva7+alD9xatD+
	ICHetypSN2dHD7nrX2xEXwe4pILng85TFKnscFx+wjvLkylLknQPdBCZ
X-Gm-Gg: AfdE7cnfgyCWxhntjh166l5PJ2vPycSPHgHb9mnw6OHjzXpzd93kivwpFdXIKFTc3sW
	h82E5fuQUf8tYbAYAstAIBvpMpisjAsliit8iNRxVQa4OAH7JCZFN5TtTejkbMf2r208vbvE/tp
	8Q+vYUDq5RNYwfdS7tnSm9fRmZXmCTp9Kpe88oieLjsOlBc4ZIQw7dtNr/GTQ6ub4YxFr5e6d8P
	1fzSFQoYCvWao0ChK0VKyJ0LbcUQ7PlpHAFdvYByNizni78gmx/VL/uH1oHpw+ykr7j9rSlw29A
	m/AKZSGE+14A0SydQsz0lDaJ6d7ua0O4BR+r19i0sLwxhglDjyHOwHHTciPcbNSURdFwiGTPNZD
	QRPkgsaX6N13jPBGFYIPlWGl25mIxSdTQjTpGuGqVQp2ciL7eQyh9RuqZiO8/J8XsGIhbK1OasQ
	==
X-Received: by 2002:a17:907:7a89:b0:c16:1df9:6eda with SMTP id a640c23a62f3a-c16b48d373emr163696066b.49.1784306508409;
        Fri, 17 Jul 2026 09:41:48 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/7] Properly describe mt8167 watchdog and mmsys resets
Date: Fri, 17 Jul 2026 18:39:11 +0200
Message-ID: <20260717163959.714561-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094150_958828_A4C198B5 
X-CRM114-Status: GOOD (  15.98  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

In the first two patches we improve the description of the resets for
mt6589 with values obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 6th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Changes in v2:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add MT6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  7 +++
 drivers/soc/mediatek/mt8167-mmsys.h           | 41 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  3 ++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 7 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0


