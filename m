Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF60CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2kksmKNYVqd+uErs7CVztic7a4Xyw6TxrahAVbwRtSA=; b=2kf39yL8wJZoEroPJk/n9BFYJX
	X85wvcA4QMaQY+KsdRJI1xOqh3+z2Aq/gFGnenZXj+kCuDbAVWn62aejZm6E5FtVsRggCcEijMM1b
	lajIXzRY14t1Le588X10LNm7He8euqe+sfjqp65EMMLxL2Fre0JaJqyleCwNWx+ee2RyuCTjl3gLU
	sdd/k+Ogbv1zRyk13AUbBpiZVZ3rdUPGRf1XtbGDbXqkC0tQEwSpp7K2mOkeQqPoiK1kWFXnn1EqN
	x/Lj9iyqnCd6oG3iXqZGcLJX/pJLVONl810Turz4qB6X9Pcmg6OMsXopFRC/H0KxkR6N1zJQ0Glip
	s0N0A0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyBT-0000000AOar-1A6v;
	Mon, 03 Nov 2025 17:17:35 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyBQ-0000000AOa4-3hJ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:17:33 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4392111b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762190251; x=1762795051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kksmKNYVqd+uErs7CVztic7a4Xyw6TxrahAVbwRtSA=;
        b=mORz/dCRADAYAwArXkEaDrZfWS7lWCTIyP+KX8bMyznLsQkcWY0W5JJlnPRCIdpIvq
         A5qz4MniN/Qm35/rADabUJcbF44VzNdEvFsxf2vEu+4nNBijYB+cvAhFOZ7XsljTB3zK
         frPmqnm4UuDzt/nGpCDq00TV/bjLMBNjCgvjGdxAs+hcW66pNwR+800keGv8I35LZQGv
         c5gc66AdulDqRTXZTxRgaItBGEHmZibcP7FqXGfBgu0KxRFDDw0f7rXfEq/oYGpSR1kr
         N2fB2+u+5qA9aYvL0So66hPlPBPmhHEeFB2G5C/Jb4YRprJS7SCB4zCMKXA0stYoQ8kq
         BVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190251; x=1762795051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kksmKNYVqd+uErs7CVztic7a4Xyw6TxrahAVbwRtSA=;
        b=a4NVoWjCA+FNX52a0LFSHjC1k3VF8AxMgpIfR8MI0cdkl62maQwZhOmXf99JBK2FN8
         SumpQa6w1+U6iHpeNYNBExqD1kzBGuK+jdZSY6/IEBNVT82QHAnpsfJM3nv9fEmqmfih
         jJAZsyO5vNNfFHHCkItjNYwzbH3WX+moURCl5Or62OgcYcG3X7KL0bpQBipVWmL7npvV
         61j7dUI0MUO9t9Sx4dx+I2zuis9O911K/2d2sVnaYS5P5s3i+Rdvwr2Go3fmFy1Hx9/g
         RFFHc8+SwNWUkPjvvAxiEFG9/0H8bz2HprDS/v4hvHrNSNFiM6Ot0GVu/3fsmbUpVAxk
         3ALQ==
X-Forwarded-Encrypted: i=1; AJvYcCWws68hRv2NNLl+uzV3Jf/vyxaG4JcJ+NGSqh2aGYhaaUVJEynx9y5ASZnaOyQf3ioWEXr/QshUADnk9ZbMBu10@lists.infradead.org
X-Gm-Message-State: AOJu0YxgeLC/Kf/KaJw428hb4fRSaU7yGStP4Q4nbwy48wQbfZOOifqj
	TBICWCuBjE+dTpJl54hqyuBBT+/G5FJgon78vtO3K1w8ligkDmtVU4OtU5d3WwCp
X-Gm-Gg: ASbGncu1XiOQgAM+fDSEu5iiQGbq43lsrY2t+zjoAa4WBtD3YzUrvmR8UnVsDR7hCoN
	auxHjwW/iVr7Xig3KwJingsifB5SQSn1xtDolizLWwUUrJrAmu7l0uab2AvNxSFBIYNHX45RxaP
	NZ/1SA0AifaSR8WNyn/YfbsxMhumGHJR7pEc+j4t8QTDK5m/okhqLXipX+OSgV3gxH810rUjAKS
	qJcTgdldhcD1Afo8rgdD1H3XUxH2KY9ugMcUGZzZaEM0GIJSJMiMV9sC2q7QnyD+U1oW/9Qy4zk
	ogVbdSdAghvucxj31Q+y916DOXYd+eEQbXrru6XQxcGfKToKgzpyIjcv4tSZHj7iaa2H/xHB6SE
	snWGky5+cBdoVGV0j6bifMuhe3uH5se0U/M7baCIi6rG57GCPBPHuusOy/5ZpkJuG7oTAYGCe74
	8=
X-Google-Smtp-Source: AGHT+IEh1pB9FNn1laHqFiES1TSY/mujOV7r+ksozCtg3k8Zu+1ydhQneDCtjE1I43f+WBjK2mFcPQ==
X-Received: by 2002:a05:6a00:951a:b0:781:171c:54cf with SMTP id d2e1a72fcca58-7a777760e07mr15739593b3a.1.1762190251263;
        Mon, 03 Nov 2025 09:17:31 -0800 (PST)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db28d3fbsm12148112b3a.43.2025.11.03.09.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 09:17:30 -0800 (PST)
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
Subject: [PATCH v5 0/3] Add devicetree for the 9Tripod X3568 v4
Date: Tue,  4 Nov 2025 01:16:59 +0800
Message-ID: <20251103171702.1518730-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_091732_916559_E53AE314 
X-CRM114-Status: GOOD (  12.04  )
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

Change in v2:
- Add vendor 'ninetripod' to board filename
  > 'x3568_v4' => 'ninetripod_x3568_v4'

Change in v3:
- Fix Makefile

Change in v4:
- Fix overlay dtso

Change in v5:
- Rename 'ninetripod' to '9tripod'
- Add rtc0 to alias
- Fix PCIe regulators node
  > Test passed with CLK missing and CLK installed.
  > No boot issue observed.
- Replace ethernet MDIO PHY
  > mdio0: phy0 => phy3
  > mdio1: phy0 => phy2
  > All point to the same device.
  > Rockchip's phy0 appears to be a universal PHY.

Coia Prant (3):
  dt-bindings: vendor-prefixes: Add 9Tripod
  dt-bindings: arm: rockchip: Add 9Tripod X3568 series
  arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |  11 +
 .../rk3568-9tripod-x3568-v4-camera-demo.dtso  |  84 ++
 .../rk3568-9tripod-x3568-v4-video-demo.dtso   | 154 +++
 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  | 887 ++++++++++++++++++
 6 files changed, 1144 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-demo.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts

-- 
2.47.3


