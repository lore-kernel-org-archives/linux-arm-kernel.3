Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC71D49798
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TuzgFIU7lhnnYJgWPAsmz9SQkyrksNZjuekvv2lFkOo=; b=DepDLXQHK01QBtNKPKNWf6+HGU
	9J4Pfc/PrSffiTjkvou9BLHn+ABtU25uZ+Bw9tIcbDjCNNQJonv7hMrgr5Ot5MTFCyHbp5h8puJdY
	mxce2Wqbpz6dtnq4sOuahxNA0MXyPMko203NuPdlwXyQNpurDEqDkr1SR2gXPTAKF0U4i1Rjb7zTJ
	5ylXD953rDyeqTWCMzI5mCrfm8IOeaVMA0FMSMO+4nH9vkZvMXFm4vzt9kKiFr/2Qtf2i63hc3z7a
	odDs2EMU6oDPtGxBXL5kqhPEb2Kild9TXBsRKFfjwHPiuvOFAz/MPKq7kOdo78DdgEkTxd8QWS1Er
	kHwyPWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx5u-00000004wNl-1jZf;
	Mon, 02 Dec 2024 03:27:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwzL-00000004v0w-1gpf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 03:20:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21571559c05so615415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 19:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733109642; x=1733714442; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuzgFIU7lhnnYJgWPAsmz9SQkyrksNZjuekvv2lFkOo=;
        b=0qc5kVm+ptKJQLTJxim8zv1/+KKjyTybb/hLq1tQM0qmHSVdNO9slh/f8pqaspWfeC
         J/QcHLsdaLmDuQSZjs8X6prYOCb7dhoKT0nHLUp7aMySZNNoEbYsJ8FxRHrOMrE1gHBy
         QkB6vHYPrK4Vu8C4rjugpaEwKOdBriDeb90seMjKjbnCN9qMZU1v8XXsRJ3naLNGpo6B
         S64ehjXwtWbVBCcQoROtzRkwimmBfnxX7QUV0oAhsMX95MbVbh0tmxrbhBuxWhvRNA9u
         6MvYo4nlu6bP5+8Y/HycxzB3eBAiy9A65SkP/WXg9zf8T2FSjLZ3xt9DsFqGI57Bdbsg
         I/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109642; x=1733714442;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuzgFIU7lhnnYJgWPAsmz9SQkyrksNZjuekvv2lFkOo=;
        b=AV45rKFAQfvL6jaqQ34qpMWpH46TYO5tNmFqwLHFeeVft5U//zyNxcv4L72Ul9C3DE
         jzFnAH7W/zJJzWFougQEAXfUKFLcIn3j7dG+drLn1ANnNBj72dRRDcyjOkZVam2uxLMA
         cKz9juepxtUxczGF0DoroV8yGVJ45KJt3WJVM1yXqOtQdFhx8ds86rKYv3aX7EaVglGJ
         qFvttzWlyFZzdarMU9qJ11L2A+nVNDq9/ZRsAtGGjExFUqnZ6NDUVQuO/tqcjbqcH4c6
         onM7xsQX9JE9L9R8SKYr2K3vN0vV8pZ3QnXB172lEk3KSE9X+/1OKIk6bTDDXM5YX0YJ
         lA5w==
X-Forwarded-Encrypted: i=1; AJvYcCXNKXeFJBM7BOOswLq1DJ7aC0DJdbv0IaUjauBdml+8SP8uPBVHIb4dzIspMvS9/iFlfic6f/ognT+nJGT4EWDs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6iVMXQ47XIXRWuDxW0batnUw9SW608QmzIrjV8gjSPbPKEsCp
	9EP5nvI8GhC8N6z5rTT5d2LPGDB6zxJTUGxKx8wmkRkKm+7hgqpMgxdrZTf2p+w=
X-Gm-Gg: ASbGncs/jo8sZCf/UJJ7LQOWpl542HoUj4tcTxe2q7TTwSUdReSyUte/+4Iuae0p3a1
	Cz1IxycoJwgLcR39KHuO+ixNehAtUZ0E1O5z4d2NzeZCJzvYBH8pVuGUSdFBzyR7U5zLXK7CKJF
	q4F8uEL45GAxQ78EDl5BBuMZ2vFJCT9YZgbfu7Aj7VyphvaktQbtJ3p+q6BbF3kWHtQfOf88mzv
	RqWSiAIBw0Pd5fthPKrwg8ukdcNCIes5UuvqMOTaB2uhvd8Hkj64f0V8XxIENM0iZUapFmW2N+j
	foUt7qxdse7Fvw==
X-Google-Smtp-Source: AGHT+IHb5nlT9jqYI8Y70WEvhybXjTpRvcrYnffGEZaJUPmJv4bqJ8BX7U0rAdMIvmdlW2JubFsgoA==
X-Received: by 2002:a17:902:d4c7:b0:215:4e57:178d with SMTP id d9443c01a7336-2154e5719e5mr55828885ad.11.1733109641988;
        Sun, 01 Dec 2024 19:20:41 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm66305725ad.184.2024.12.01.19.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:20:41 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v4 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Mon,  2 Dec 2024 11:20:31 +0800
Message-Id: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192043_707530_DAD9322E 
X-CRM114-Status: GOOD (  12.51  )
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

This is v4 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v4:
- modify 'rt1019p_pins_default' to 'speaker_codec_pins_default'
- Move usbc_extcon out of typec
- Link to v3: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v3:
- Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-codec
- Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v2:
- Modify location of "const: google,chinchou-sku17" in mediatek.yaml
- rename "pin-report" to "pin-report-pins"
- add "vcc33-supply" and "vcc33-supply" 
- rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
- modify subnode of sound 
- Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/

Zhengqiao Xia (4):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add exton node for DP bridge
  arm64: dts: mediatek: Modify audio codec name for pmic

 .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
 7 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


