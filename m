Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B7ECDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=; b=UepMh/OhFoaI2k83lhEs/q2tJZ
	+a3tlFKtriCnESMEYD6RTU6aUfzBNplfdryIIJfKHhlPG5rz8td6w612MXpp7fBWlY1xUNhbXbQjE
	uZUQOKpBhrCVgmY278HgowiPHo8QJYbFoiX6OjVukbt+hphfTDszzqEPYQuQ+vzFBK9WG1An/SDAI
	dbleS+vy7WFfWHDWPcvhGcePbHabgtCL/tm+XB++09ngWOsiWuCdRYBz3eaDHMETbzvBCHusB/IMF
	HzsEs/LkdjjNPh0OXbs8sWIXx6LD8h5XD48u0wMGBN8m+mSDI8Tcen4kujbX7BN/IIgLQYRVUg0f5
	Yi0D6EMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchcq-000000091pm-28vw;
	Thu, 25 Jun 2026 10:48:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchco-000000091oY-1rL8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:48:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490ac357c55so18117085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384480; x=1782989280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=msgXD4rng4ftz8XElZ8Gf8/b5MkVpfXyjI7rSLY1KKOhZAI0YbqQoeVCngHmuvMPcz
         jB7NkJzrLsCEEwTmssX2oWbvmlY9oIrfRxCCJQmuC7l3Hz+JXykz73LSBJpCvYSn09KA
         As6UYzPpOuZ0ia04ZUG+JZuoUVQW7K4GgRG5xeHGsTOMHPUZxv10ldHyZKulMh22EHVR
         8LjNcy2lXu0ErQ0ctBFPPfE3jeciia7FlyMPBc813FxYS5S/3pDsk3m+yzP//zSMHFx9
         GCspvuNUl1ReggUhiHzjrOSY9x+iEqKcB6Gr6LNZ4ycVtmyS1aRAbrhSQSSONzlX/IVs
         hNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384480; x=1782989280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd1pAolJ32WGUV5hqmP6vxrovN7AtVmD6Ko3jeyWjvE=;
        b=Ur7tZ4cbCQmDu82Ic6XUab8xBcb+1YJltW51aCcLbmhmFU2etNkoEn4+X1E19mJLIB
         20yrDNrvjH3fL3zaPjhycDRYzOwQV1K3c7gnQ2z5RMh7ZxhSTn45HDjwtIfmrzZojHem
         MMmfhnSnSD2Sgy3B0dWjTh22h7tJsv6oSOvx/COyQwWPeTyBFEq77Wi7PN4x9eQ5sCx3
         zH8+GFjrOikdB3UIKCmeI14eUtScpIe2oUhPBoxkGw2yykBSrpjOGLlMG42PzZm1quaD
         EmafRO/7NqPJCbhPmqX3X9kigXbpT3SW9EwsJr46qevmSiKuYpqJNz8L7rBfwBxDtqed
         nVRw==
X-Forwarded-Encrypted: i=1; AFNElJ9Dw6PSarUZUr9mU+4CXm/RmJhALRl6Td3p1n8QayGs9SGTkS8LPvSP64Ndfa529oasCQrYKZo8Pas9Mz6YFn4z@lists.infradead.org
X-Gm-Message-State: AOJu0YzNvoCHi9p4t2hmIuCO95QFAwsX7cUPpM2q8CHO6aFrlEsG/slK
	NHSbavqaVOQD9rK/uGO047yCYhwqJfyf9slIfln6TsG6M5Hy8HMo8/HOfgFNKAyY
X-Gm-Gg: AfdE7cmis4nxAkiGPcpbNYKuTmXHVmM37v0NG1tnQfUVrWZRujyPqU98uDq/dewI5nM
	eIx50LBYMWtTL0htZrjoRf69lzmptzRL41FviaMvQnsfoEJSan0fuGCCqRAqH+3VTylGf+2JCHk
	yKIT5vXcz+6EEuVBmgm7+kdy0kvXFGoJ9JZXT23Esk5S997zwgn2ay2feNN6GJ9qNBBzWb8mzuG
	muIHILV4FeeVj4I0znhaJGcSuaJssxA2T4hp2r2hpTINERZ+IR+8zWTLY/jZ088eUQ7/p9ggCMt
	Wp5VBmet7bwgpGmM3M0Q33K5T7lJ96zFWePhLVTSG3bI/HoOmVGu78olDDs8jOPUB1jCEOZqw6z
	t1TgF7pc+53pjU5EeP56bxPtFWNJC9JrJrPQxWNWMW0Q9DMJptggUjWtoaF+B41BtUV9t2b/HDa
	Ve/YRLQw==
X-Received: by 2002:a05:600c:b96:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-4926686b3f3mr25232275e9.6.1782384480165;
        Thu, 25 Jun 2026 03:48:00 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:47:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 0/3] pinctrl: mediatek: mt8516-mt8167: Convert to Paris driver
Date: Thu, 25 Jun 2026 12:46:29 +0200
Message-ID: <20260625104742.113803-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034802_494262_829EB339 
X-CRM114-Status: GOOD (  17.44  )
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

The pinctrl registers of the mt8516 and mt8167 SoCs follow the layout of
the Paris platform, but their pinctrl driver is currently modeled on
the mt65xx legacy driver. As suggested in [1], it is possible to migrate
them to the Paris driver.

In the process it is also possible to completely drop one of the two
drivers as their register layout is identical, they only differ in some
pin functions (mt8167 is basically mt8516 with added display blocks).

The Paris driver allows specifying two base registers, gpio and eint;
this way it's no longer necessary to have a syscfg node in the device
tree, referenced as a phandle in the pinctrl node. This also fixes the
following long standing dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

The new driver has been checked against the SoC data sheet and adds the
capability to control pin driving strength and R1R0 pullup-pulldown
resistors.

This series is sent as a RFC since the changes could theoretically impact
existing devices. I am pretty sure that no device ever used upstream
drivers though, not even the Pumpkin board that's present in Linux
sources since this board lacks the associated mt6392 PMIC driver that
is required for regulator management. If for compatibility reasons it is
deemed better to keep both drivers in the kernel I would welcome any
suggestion on how to name the new driver, and how to adjust the two
bindings for coexistence.

These changes have been tested on the Xiaomi Mi Smart Clock X04G and on
the Lenovo Smart Clock 2 CD-24502F.

[1] https://lore.kernel.org/linux-mediatek/296b000c-5970-4668-bd42-b99ca78d598f@collabora.com/

Luca Leonardo Scorcia (3):
  dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to
    mt6795
  pinctrl: mediatek: mt8516/mt8167: Migrate driver to pinctrl-paris
    platform
  arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris
    driver

 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 -
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |   5 +-
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  15 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  12 +-
 drivers/pinctrl/mediatek/Kconfig              |  11 +-
 drivers/pinctrl/mediatek/Makefile             |   1 -
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 345 --------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 770 +++++++++++-------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8167.h | 562 +++++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8516.h | 512 ++++++------
 10 files changed, 1018 insertions(+), 1217 deletions(-)
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8167.c


base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
-- 
2.43.0


