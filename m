Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E691C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p6+QzKXcRNoqQlHz7+u9sgV6eaPwE3xJHdlR/zl3wUs=; b=KpkBMCmaTw5wLJ58AXQAhg6YB3
	DFMZAVKy2FrW0aOqsNtuzUoGg9s06IeGVQm8gZl7oRrltZsdf8A03D2X1d0axeB0FuIzDvFCYypTq
	PuTgBgz5qG7RL2aYmaKs0AsbynFrSsZZLidn5LSHtNJOkcSeOyod7R9U20y7i7rrApbMeUp8u/GOa
	l2+EKoexl5VGsuy8/sw1Hwu0Xvp/jn2RYVbGSMrr7ZE6hWcA9snHQGnxZF1AlS+TDhVAfKLqFPnwS
	4fjGR1Qawy2DN6VxyIs8nIEMHfE7KQTuC1gG7y4NZGRhpuZgYBdWx3RmD1wAOk3yh3akn0r5LFAna
	ymWa3G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaXn-0000000HO4y-2RAA;
	Tue, 30 Jun 2026 15:38:39 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaXl-0000000HO3v-0OPL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:38:38 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c8c1ebd68a1so315401a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782833916; x=1783438716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6+QzKXcRNoqQlHz7+u9sgV6eaPwE3xJHdlR/zl3wUs=;
        b=oRtF2phSO+ENTwvozlHxzaP6p3JHzAI5pI8K3zTtWNYcoawTR64SR+sgDbbg9I8jJg
         XUZDyBq+vQAGYXxRP54LA1UMd4bW69CRJDqnFLBbvfuhXv8ct/D19NS8nrQUobKuxUue
         7fQhSGC4L3L4E5iT/wZpFYEtLOi+Q+hfZlf4XzFOZgApwwVikkZriXTeT7a+McRyt7g8
         NCfryJsf9bvSc+7+FkONTB8A4miTR49bNTGMiPUw0sYdly+LZkeykNJA65DxZublpx6O
         eguui98BicofUL/50gHu6bwAZgXk+xCaL7uL52bvtDCGil1sWhUigCrEqMA0u2VpuL3z
         iytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833916; x=1783438716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6+QzKXcRNoqQlHz7+u9sgV6eaPwE3xJHdlR/zl3wUs=;
        b=Zwkjw4H8p2SEpOdkVEh0ZWFa/Hh6E+N14CpKpimbwYCYf4VUQXklUfCYtcBxerh7t8
         y4Whn1+RjtFXXNS7vryVzrtLfCSKHAp4JEIBpflmS6D7zx/xdeCBqfa8TcJj+aulBj1x
         WrPDTE8Ma6GhVivJVvSmBo9jqdO9uGkGVQnl95oYdKPQPM6HepR0R4qszLmXJ+jMJRzM
         XUQ+3zUOjBKc4DyrK10T7lQgt0vbxk2RNj41RKXtAWr+z6ecI1Fxqo5eQoS7q8w6yLEy
         AHJ3Agzbt90RlHm5jN/942H/Fyl7o6Tdq8OGWrVAF8bo3l31/d44TmybneGV8ePkP2RI
         6LnA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2HzfWHcts4Aowsg/n9/DJsx0c5LX+jdI3d1s2K8NbOB5YUcSxH+DlHJEzhJy5GSbcD/OQF+Xv/u6QhABSSzVo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+FfvFlobjUodbvRniuBibike7mfIKPTV3yn10NOYBzb+mmLV
	O7Nm4xeEcPkGLuyvjh/3CelN2yjF1BxWgb3vex436BiDjM2/dQ+GTZZ7vE3F9S7WU4L4Xw==
X-Gm-Gg: AfdE7ckZa0IID0B5vqyojjEcqWEaXji8KZOi2JzpDb0V2ZdFRRGpQHwpBEbbF8ptpj6
	lAQUYVZypMq0iTTvd/odGOHYZpjtaV6e0PXlr7sGgVKhctFVcAG9QvrKpb5rm7ewEWBruP8B+XE
	zH63w3P50mQAuj99VT4buFaUbhNLUnYX6ZIk/3NNZ/eUesGZ05N7qxQz+EECi3PY+HOMpWlvs0f
	uw1+xyG13ta/JPY4OfNq25xjWgLyM1kGjakk2ESxUeverwUEfdqym4u1T/y0SphT0Dwfu/dKlJG
	iHdYvIfG7zh3CvPXiawks1A91uMli/yIYoCUuVGWX5LGyoNAY46z8RARysbxm8F0Vf7mKERCUHX
	7S3R1OLezxRmjqxXFo35SSVdIEx++fULKeBjJTUPZqVmyH5vskCMz+ox+5YIXR2xRpQuhXsmy/O
	oYgxeygrF/t9w=
X-Received: by 2002:a05:6a00:174b:b0:842:5a8d:3035 with SMTP id d2e1a72fcca58-8479eee483amr3328451b3a.22.1782833915487;
        Tue, 30 Jun 2026 08:38:35 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm2413695b3a.60.2026.06.30.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:38:34 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 0/3] Add devicetree for the Graperain G3568 v2
Date: Tue, 30 Jun 2026 23:38:07 +0800
Message-ID: <20260630153810.3574714-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_083837_135248_2FFFD091 
X-CRM114-Status: GOOD (  11.87  )
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

Changes in v2:
- Fix trailing whitespaces and other formatting issues.

Notes/Unchanged from v1:
- ADC keys have been verified with evtest and works fine; kept unchanged.
- The 'regulator-off-in-suspend' property for vqmmc-supply is retained.
  This is a known issue shared by most similar boards and should be
   addressed globally later.

Planned future changes (to be both with the similar X3568 v4 board series):
- Replace the legacy 'gpio' label with 'gpios'.
- Add the Bluetooth UART child node.

Coia Prant (3):
  dt-bindings: vendor-prefixes: Add graperain
  dt-bindings: arm: rockchip: Add Graperain G3568 series
  arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3568-graperain-g3568-v2.dts    | 894 ++++++++++++++++++
 4 files changed, 903 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

-- 
2.47.3


