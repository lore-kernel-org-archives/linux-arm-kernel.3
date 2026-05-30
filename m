Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D805BCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=; b=l2pt/wunRdsacaZ6kWy5otSCp8
	szS3O65k/Jm2N8IcKAeq2DFg0r+MeeWBgAl0YednCa/cccf5UPtqPxbF62NNcjtD8JqOUUXapuSe6
	bbqBqn6Pl7Lg4gtmzAvrBU9hW/PHrGvpaNp00LJR/eriQ+CM6alJxkUZcdvMqhd0p+zBVwC7yMTPf
	+xmEY2RRIMOgQMdCWegzGwXZ2I+YiyDjbSadkgTz6NxhISkILKRNqrtpOKiePfhaldz2o46gRXm7m
	NH3Tn5ENkMmWrT6pLQ1lA94SwPpKFwf+7m+lALMydDOKknd/juF38lOoyKziicKlpUlgpux5j8H3T
	IRAgJPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8e-00000008quv-1yZ9;
	Sat, 30 May 2026 14:58:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTL8b-00000008qtN-0okg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:58:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45ef4223be7so867722f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153087; x=1780757887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=;
        b=j9/XOO6PA6EKZclEH5KS9OqBEi842eCxTsoEW7XAM52IyIp4gmyM+j3TryAfEvkKvi
         xBl78fFxHVERUW9wLRNn4YBTcv1j0Ua55t6ebXfvsBpQ+C4J4QUX6B40zcLVNIBZp1l2
         3c7jOC47oiDi+1BNA6d5Mupz3s8dWT86Q2D5yOytWFqcFbw5X/4NrxvxbwRRcqOIw4Ld
         dVk5FlXej4B1nZH7w73gKQT2rWncU5o7jJoKISEe4JPUpeifMBaKlK6q5iWJCABrXOlX
         gMtNOjGtpRjR3WNo2/P+GsTwzQQbcC0cWR/DJTSmdWBEARLivLWlg/ROOq3dIZN79aDr
         BonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153087; x=1780757887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=;
        b=KGmTA+s5pt6bkMzPYeefJCwDd7XHf/lT3E723L+GSYrTva4a58/bggXqsO1j2or1D9
         W/Ve8jZgnA3S/Z9FIP+UrkcR8xHmgEtKKydKkO7acBQaJpI7+xxpr0+7NU4iyMW8pUO5
         GDK+yDtjlt4tPi0qk9Zh5JzUW6doQHN8Z0LyzKPVRU/Rsxcam8u2GH9JeQEVq1aFeK4S
         VZ/eZJFB0M+fSCXtnoEtYzkmOZojnVEa5bg3IJPj7gGvXEYeKjR3rC/SRxg4unerVqPP
         cVBA6XAhP4jrnHNlACBrhFp0Bs+/rMkWwdKEFoX+jncOVcgaqncrZFlBonN2ni5ohy2x
         37nw==
X-Forwarded-Encrypted: i=1; AFNElJ8yInUnmy02WcrQYddzDu548CA261eCPbtSOeGYE3W7t54Kh5oDUIuy2seckkB3ZWZVVgltOAq1aXli7+3L966w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Q5IkPOMYbNowkisQYNjT18Xp4ZRVG9X7EaRJpQ/e1AFIjwPv
	ayamE3yiZVqHxF9UDZy/61LjUcM8jgjwMX+ig9h1/Pb5mQCwKIewX/wf
X-Gm-Gg: Acq92OHhFgMI3GThElwXyqvJ3UPHyXUS3nx9GIQ7bM7RdfDj91Gjo7uwBzYvJypuemM
	cq3U3vJMn1SCCp409aP5R/660PjF8iA59dLNlzVokKdAKJxoFCx4AhsY4YMZ3dWIurUZrSOY31j
	vqLVrcdLbJrdb9zvpeiKpu8sldVHjeqs+VwskBxLSEuanOYzzX2oz5/AzSUbz8U6Rz2kNsRU7Ac
	wNidxyOmD1HmzdfeMIg0753KeF6uMRJUEK8cFOzFnGpoC3lcvrQ8XXHqdwBYHzCWtP5q/G5hjVr
	yzQUqt+tbT6UjyabluD7jvUAV2jlda4hE3XE2BVxdfdqaVo9jp4ZVWYZu8jTdBGo8wCF/zHRp0A
	AzmQnjFSkhMX/pAoS9LgKy6YQ6xcjIHsR/BXTbYgKP5EUrarpZyUoxS4ugdzO7yK3vytRv3h7ps
	Ax+3VnaMQ1B660YjPu0zv8Vkl7fRjQXjk=
X-Received: by 2002:a05:6000:e88:b0:45e:73b4:e731 with SMTP id ffacd0b85a97d-45ef6b16255mr5752925f8f.14.1780153086827;
        Sat, 30 May 2026 07:58:06 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:06 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Sat, 30 May 2026 16:57:52 +0200
Message-ID: <20260530145800.1029920-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_075809_256140_1E6111D0 
X-CRM114-Status: GOOD (  20.48  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v7:
 - Wrap &mtk_paris_pinctrl_pm_ops with pm_sleep_ptr to fix build error reported
   by kernel test robot.
Changes since v6:
 - Mention changing MT6797 DT in 1st patch commit message.
 - Squash MT6735 DT binding patches.
 - Add debounce time to eint_hw struct. MT6735 supports the same debounce
   times as MT6765 so reuse debounce_time_mt6765.
Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to the top
   level definition then adding maxItems: 2 under the MT6795 condition causes a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindings
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (6):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  152 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++
 8 files changed, 6172 insertions(+), 245 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

-- 
2.54.0


