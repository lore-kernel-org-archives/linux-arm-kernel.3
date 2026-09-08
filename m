Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4FEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k1VG1pmcGZNdUQpQRzwwsj0V+0yWbJ5/S21pa91tRek=; b=W3/uxbg0DlhJSuVhw370v5SSWK
	e0i1OFCEvaP+9mGeVItS67rp8AcSxw3hQhqn/xWi4hYuq+5gX2146W41ccUz99DvY3dB1qgiJeMAj
	Xx7u79O2fe9zmTs8+vyq7UTKcqdmcFz5DQpe9fvU0ohBcyvNgsTuYEGXhpXBxJ6KGAbMxJP7IuAy7
	LoUkr4FWLVUU0EMeSRPUUG4FTaGRHt75o3eR44oRJU62FTCd9y8fIPzcXRi2fDg58qMwiWwv8BTJq
	owswSd6S2gdvGh+1+t9+grQSc9B3k17JcpdCHzagNodigqAQ8vd5WcFtoJPRBy2v+Lh0LrftVJD0m
	g+7tDH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrv-00000009rop-2mlE;
	Tue, 08 Sep 2026 17:44:27 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrt-00000009rnU-194D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:26 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so8293095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889462; x=1789494262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1VG1pmcGZNdUQpQRzwwsj0V+0yWbJ5/S21pa91tRek=;
        b=jRhmr6LweP16ynKLk7iDO4swwlFtaji2XLyNQoXMqZEMR85Zs6D0xEr8uI/XjT9+pC
         RCRC96YjHwt15v4ln03wfoIi9Eh4ml5CL7KG0fOT9+fUOjy9rhh0GXGDYN6awZ3kQc0U
         rv6yWOaULnAi4cXWM3Ho0Bv/ORVC74FOKYFOR8EzK/MdaTU0JeLHCGWAxC5y/nhWCv96
         F+lXPbJdStVdHnnuf3yw/EU7MfzJyRYEJvgUy3eRcwNFr6ouPVmadLkHPLFMn3puuA1X
         SpyGEdXzE10KPLHFEFgmhvJTZAkmRpn55vEDBxDyy/yO0zunue5qVKHGMAZ/C8XdJ8lI
         gyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889462; x=1789494262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1VG1pmcGZNdUQpQRzwwsj0V+0yWbJ5/S21pa91tRek=;
        b=TCSxtVqLlk9n9sKcvEJjI0YCsBd4KcOvT56dx95BcIeVtxv0nzKe3qHj6jcwT8joTm
         YKSLaT0B3QjrBTi9eA8cEFO0niXVYv6bVvH56z21UAfSRX9PfCncHIXr5xBdC9H3siON
         7Hpn3qK1ya71LjMrm6BQQ8izBql78IwGuYqawNZeuIqhaoDqbKMRr9VTsFXCSTrzBJg+
         Krp8FdnNeN4++zU24oms9kPoqrkyPlC5e6bMlsPuVBwz1hIxTVpGeE6jOd3+zJnGjDjr
         ssVcjD5v8qo+voJy6X5eYKRQwV6Pukw99vIQt5i2oTeQXqXsIGi0lVbx2my7RiEQg/oH
         GrRw==
X-Forwarded-Encrypted: i=1; AKwUvBzkdQpJ8/DeJpGgJn0vc/OxP7PDWHLiZs5A+CxF/56SXcs9KlD9ceJFOOeIw5EFkjYgt4623HyUazThaSri6pOv@lists.infradead.org
X-Gm-Message-State: AFuF++mDNgUZllxP2I+JXudaIELW9Hac5Ca5n4FMLRC4vPT3wT1YevKi
	5yfPQP1d7x0pjyUQzjulP80mGQxQf9idkUKVS9hSlcNRgyRtQZnY8Hqe
X-Gm-Gg: AYBFou0EcaDL+YWNTPyCHLKFKOQkLKxRn5eFmLemUcpcfEpJioCMpKruQ+W9zqw6TvF
	RHRLKPZGRNkUUrYbK55JnSd85wwwpLgjnK1o3Z2wbnXC+o48eGQptkmiu3fGcLS4lJVbZm5OyWA
	jUWT/Kdrq8mXTAMwdSX5E+nSxx5hKMu2rjpnmC0SKmyKmPbPTU2RJRajSktYwFckZS0zk6I8Lb1
	uy1dwiqKusJwvOOpXSoq5IeFIPi1ke9u/JaRvf3vS2IKvAwH24lIGppr/fg8fqP9p9ezDmNhkC4
	sDnzkebinR33YGubaa84kPnqKETDqTFwtDEqjdDW9kkg3cO0rMHtWN/3wFOoqTsYpp8ba1W5bwy
	ZTtuDNKvc1ad2AtduP13h0MS8xfHbI8ijvCWRja6PyD80SAIO43eUD7mt6DsH0fI8qtNz6jg6yn
	+mhbo9Rq9k55AJC+HbHgF5n81AjYHzyWdAQMUHVB64Z7sEbQ9JOCW4ZMHh
X-Received: by 2002:a05:600c:4ece:b0:49c:eded:44e with SMTP id 5b1f17b1804b1-49d175561bbmr82285015e9.7.1788889462025;
        Tue, 08 Sep 2026 10:44:22 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:21 -0700 (PDT)
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
Subject: [PATCH v5 0/8] Add support for mt8167 toprgu and mmsys resets
Date: Tue,  8 Sep 2026 19:38:27 +0200
Message-ID: <20260908174259.9009-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104425_328365_060FE4A4 
X-CRM114-Status: GOOD (  21.93  )
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
which in turn falls back on mt6589-wdt, which does not support toprgu
resets yet. In the first two patches we add support for the 12 mt6589
toprgu resets.

However, according to its data sheet, mt8167 has 14 sw resets instead of
12, and its reset bits are non-contiguous. This is currently unsupported
by the mtk-wdt driver and it caused confusion between reset IDs and reset
bits in other mtk SoCs device tree includes.

Therefore we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Since its
reset bits are non-contiguous, we add support for a watchdog reset table
to accommodate the distinction between device tree reset IDs and the
actual bits in the registers. Code is inspired by the reset table
currently implemented in the mmsys driver. There should be no effect
on existing sequential wdt resets.

In the last three patches we describe the mmsys reset table for the SoC.
According to the datasheet there are 28 mmsys reset bits divided across
two adjacent registers.

The series has been tested on a Sony PlayStation Classic Mini, on a Xiaomi
Mi Smart Clock and on a Lenovo Smart Clock 2.

Changes in v5:
- Dropped the binding header for mt6589 reset IDs;
- Moved the definition of the number of resets for mt6589 inside
  mtk-wdt driver;
- Separated the mmsys related changes to the last three commits.

Changes in v4 [4]:
- Squashed the reset IDs includes together with the bindings change;
- Added support for a reset table to the mtk-wdt driver. This allows us
  to decouple reset IDs from device trees from reset bits and lets us
  describe correctly the non-contiguous reset bits of mt8167;
- Improved explanations in commit messages.

Changes in v3 [3]:
- Improved explanations in the commit messages;
- Added the #reset-cells property to mt6589 watchdog node;
- Included the mediatek,mt6589-resets.h file in mt6589.dtsi;
- Included the mediatek,mt8167-resets.h file in mt8167.dtsi;
- Moved the mmsys reset table from the mt8167-mmsys.h header file to
  the mmsys driver implementation.

Changes in v2 [2]:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260717163959.714561-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260809160643.33991-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260819101853.44681-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (8):
  watchdog: mediatek: Add wdt/toprgu resets for mt6589
  arm: dts: mediatek: mt6589: Enable toprgu reset controller
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  watchdog: mediatek: Add support for mt8167 toprgu/watchdog
  arm64: dts: mt8167: Properly describe the SoC watchdog resets
  dt-bindings: reset: Add mmsys reset ids for mt8167
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  arm64: dts: mt8167: Add support for mmsys resets

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  9 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
 drivers/watchdog/mtk_wdt.c                    | 54 +++++++++++++++++--
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 ++++++++++++
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 ++++++++
 8 files changed, 157 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

-- 
2.43.0


