Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F818CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FyUwz13+47kYMF2lZ9qijwSPRz6vuX79fcnmYw9Apr8=; b=ol9KLC+YIDrJRRhe3wHF0MRFgY
	Nw/0NagsGqV2TeRFEzARE1tBpCGo4EeNbfdwDq7hO7Wu5DfXC8CTsjy+pHXXYEJickAyrdV8jyxMv
	N+JQgWOnOjPRL3548AzDNloK6FrOn4Cw4t7n6S53oAqhXIHzL94nubZPbiHT2el2qaUTUekQz+LsS
	jgdIz6RMEtDGnihe3tbwioblwLWPdn8/30MNyFbUvWaGLsv5eLM59sinyOwogqumjxNdYanbe1zQM
	Xe/ArELJRBD4qOGsooybkW+HwjbGqMTs87h5jc4Aiqpu2ABH5OAhj5Zdx4LuQDwSd4ZZk6P+IAzDD
	2nQQZnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcBz-00000009P89-2cjj;
	Sun, 31 May 2026 09:10:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcBy-00000009P72-0jUQ;
	Sun, 31 May 2026 09:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4839E600AF;
	Sun, 31 May 2026 09:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8EEBC2BCB4;
	Sun, 31 May 2026 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780218645;
	bh=qCSXdL7UxE/qWT/uKT+Nivjqkn1rjsbMggSsnxkbbJI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gTqJSVjSjM5A+hwjg7JIeP3wUZpV4HIWu5hG8dpr+utVxFdhR47xSrlsttfxPTSn6
	 U+CZ1vTIpqgJBQ8Scb7Ln03KiJlryej2wgPH0j026aYWBG8ZuQU07ZQONauQdLMadC
	 DMDxmJYc568/C9tv77+LOZUUupOqfvG8uz4Zzl5ov6X98Y6LvmRCfy217f1B31+fzP
	 wBCwEINrzhmqyU8Yy09dM2RbuPR47BWwK40lRZPa9K76RACJ+BBRE5sekYhDlWQxJe
	 NDkxiIXQajig8si1MriGTohuedMlgb3SiFALbyZK5FTyQY08/ljXkhCtz3AvXlN5s8
	 vG/kT5ore9Mew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE901CD6E55;
	Sun, 31 May 2026 09:10:44 +0000 (UTC)
From: Yassine Oudjana via B4 Relay <devnull+y.oudjana.protonmail.com@kernel.org>
Subject: [PATCH v2 0/4] MediaTek MT6735+MT6328 SoC/PMIC pair base support
Date: Sun, 31 May 2026 11:10:41 +0200
Message-Id: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWTuJQlHqVUwXFkYdEy0BrCbGu
 xfr8i3+PyCQZwrQZAd4+nLgz5Ig8gzM2C0DIdtkEIWoCiVLnGNVS4Vu8527IIVGN7NBSw9dWmU
 U6Sek3Hnqef+v29ftsL4nMvH6wXn+ACxelj58AAAA
X-Change-ID: 20260531-mt6735-pwrap-mt6328-pmic-de481d5c5e89
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780218643; l=1752;
 i=y.oudjana@protonmail.com; s=20260531; h=from:subject:message-id;
 bh=qCSXdL7UxE/qWT/uKT+Nivjqkn1rjsbMggSsnxkbbJI=;
 b=BErCPRXo/UmHpL4V4wTM++8swxKEM9ihvG6lllxqkHzSSemqvXk3gF3LIB3ZuJUlbddkmnxdG
 LzTHPsEoeuCA68WBkRzcvpASMMtAFSnN9O0TMQ330sRYmlETgOTzC57
X-Developer-Key: i=y.oudjana@protonmail.com; a=ed25519;
 pk=sr7uwnyVqGKAIhvwnIwormkDM3d2VNc3VOTEU1GmsEM=
X-Endpoint-Received: by B4 Relay for y.oudjana@protonmail.com/20260531 with
 auth_id=802
X-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
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
Reply-To: y.oudjana@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision)
can be found here[1].

This series adds base support for the MediaTek MT6735 SoC and MT6328 PMIC pair.
This includes PMIC wrapper support on the SoC side and regulators and keys on
the PMIC side. The PMIC has other blocks such as an audio codec and battery
charger which can be supported in the future.

Changes since v1:
- Fit regulator definitions in 2 lines and 100 characters whenever possible.
- Remove get_mode and set_mode ops for regulators that don't support them.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Yassine Oudjana (4):
      dt-bindings: mediatek: pwrap: Add MT6735 compatible
      soc: mediatek: pwrap: Add support for MT6735 and MT6328 SoC/PMIC pair
      regulator: Add driver for MediaTek MT6328 PMIC regulators
      Input: mtk-pmic-keys - Add support for MT6328

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |   1 +
 drivers/input/keyboard/mtk-pmic-keys.c             |  15 +
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6328-regulator.c               | 500 +++++++++++++++++++++
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 177 +++++++-
 include/linux/regulator/mt6328-regulator.h         |  49 ++
 7 files changed, 749 insertions(+), 3 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260531-mt6735-pwrap-mt6328-pmic-de481d5c5e89

Best regards,
--  
Yassine Oudjana <y.oudjana@protonmail.com>



