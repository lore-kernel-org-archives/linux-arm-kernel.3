Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB14FEE4F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y+AHGyh3OXoEomGwyE8iNdHvjyGaJiecqa7H5SxpJzA=; b=lkEFHp28h1N/93MtjS8j4cEuvT
	I3Spj5nofXDX9eRSSQahnM/Bf0sts5DbDbo/y3R94HDP/PXJEwQLJoiatX9XXwzsrlT871ZWtoPCa
	S77KbrVrDycympZ0yXcWeu9VMJvTePOmbwPaIgrY1u94ZO8+/4uw6q4VnKgZhw0HiaUdNyXXzo3OY
	dkEHjUk2DROWbAK1avPHGTNMcBgxAT09bLFyH7zNpNQcHIfMzZ82xha2iuQs2dzGUL1C/w/HGLLCt
	/0b3jSPtlJNpbWwLD2Qaz3iK9sH4/mTEyBMkXa7btSciqccHI50PCT9yI004AFQj0wYtJxdRIm3yi
	ea+X1jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwRKU-0000000AGhO-0W6A;
	Sat, 28 Feb 2026 20:54:26 +0000
Received: from mail-yw1-x1161.google.com ([2607:f8b0:4864:20::1161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwRKQ-0000000AGfN-3N1I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 20:54:24 +0000
Received: by mail-yw1-x1161.google.com with SMTP id 00721157ae682-79868eae536so31024857b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 12:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772312061; x=1772916861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+AHGyh3OXoEomGwyE8iNdHvjyGaJiecqa7H5SxpJzA=;
        b=dLY0NYo4FxbRz0dIkX8t8iIEMn0xoxJh2x/NrnJU0Ip61+RyZaCQVFQTezZDWKeRuW
         3XyzJZyYRGu4s4XnKvZRoMVhUqFoU7SZur2F03xfSlDIQlVtStQ9XgtbSayMOzaLSL2e
         ACRrul97fXDcRNrzrHUGPD9yU03RjDkACTweYayEFKVaD8D0I3SjawzuYQjYygn+UIlS
         wL37xe+LyWkgIoHlWTKIx4SDYPMxaVQrnQR8IhvMLm+/YbnVhT48oks30qhvxRGE8189
         r5svd4/jA4KSxeBiJWfowDaVQlY7lx7FXL28EWdmjoXn378XNKdWM8jDGv9FsYTkY/VI
         SYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772312061; x=1772916861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+AHGyh3OXoEomGwyE8iNdHvjyGaJiecqa7H5SxpJzA=;
        b=hF6reqOYFcVCu8quQJwFzrwEVji3oa9n+NS/FUWWvg2aXKSg1WVvM4QjWywJv3JKXX
         YBkfENE/WLnN182mxBzTGACQXLoYqbvDoAMQs8aLmjw3ND5kGWWamDLLWBhUzHrX/WlC
         /+LbGoJVfY29wOMY4miK7XaHUi0IlWJui9zDay1SLNhrTi5HWrdw36HbS74T2hHmJlxd
         tWN9s1AU8WpSTqQvAMoiPxUP1kOzKom9ZTujcpp+VdkSfxxbhb4Fpyf/Dv27+s+hCkT6
         S2so1uaBnx4CyxOXCrg2no9OZ2oLbf0NoVH6VvLUiNCeTZKoFTBKy/SQthZqHnSc0Ml1
         6EAw==
X-Forwarded-Encrypted: i=1; AJvYcCUJx/yhlQziThxaL4hzVz7tBmQ9fD9HXlLLdgyFrtSlXtS78Esh2iLIxvLpRKxzQqqtF6bP8T7QXan1xce7mBg8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4jRCFjpTAUwTIZrW6j7rkRaG8+AVM/5DHbpjptWciDVW5qUz1
	oSmyvJq4IPkEzcH/DTJXjjBAZlHsAvYWdr1g8YDXPhTh+XI5vEkGx0slE9Lph6hROzJ7SXq9CdW
	1vHyw/UzEYh51RyoSwVUH/lJJSExxfrXcbv5g
X-Gm-Gg: ATEYQzwZUNV20NNDj75pzWmkm/ump8Oc7wUBO2MtngHPVRIxWeVGLail7Ev3ZEDRos4
	GR4Fi1fYXZ25G7mXmzmpicrI6rn0+jKqf2xzxla9Pzk0oIzD1s6nbCbfYX5TV91V5xxgajRGvwg
	dn8a7tSLm9X9IvCV3GJHghEaLNPfVMFNV2oUeeHBsVUFiX1MzR2goYMyKWCFDA0yZhoJNIj4a9v
	poCdSqdiOpv6CGB92MPka4CkPYCf9745FVB84O2pBGhElzWeh93kDIQCKqkZxbQN4gUThTlGiJv
	FE9A0fZq8b6I0kJyqnbnBkmT4xTxc/hFnOSx4W3DN8Y1d/zV6DPcSrI51o4rbiG8cxPqz8VQH+8
	C3363P+jRyTTbJea2VmuyD8nbdfO1cqdR5EBjN/tWDZQ1
X-Received: by 2002:a05:690c:399:b0:798:6042:12f8 with SMTP id 00721157ae682-798855d67b7mr70561227b3.55.1772312061036;
        Sat, 28 Feb 2026 12:54:21 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79876bf333esm10213567b3.16.2026.02.28.12.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:54:21 -0800 (PST)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH 0/2] Add support for Orange Pi 5 Pro
Date: Sat, 28 Feb 2026 14:54:15 -0600
Message-ID: <20260228205418.2944620-1-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_125423_003962_FAB41AD9 
X-CRM114-Status: GOOD (  10.71  )
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

From: Dennis Gilmore <dennis@ausil.us>

This series adds initial support for Orange Pi 5 Pro. The network
driver was just added. The only thing missing is the second HDMI port
that is connected via a DP to HDMI adaptor


The series was tested against Linux 7.0-rc1

Please take a look.

Thank you,

Dennis Gilmore

Dennis Gilmore (2):
  dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
  arm64: dts: rockchip: Add Orange Pi 5 Pro board support

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 376 ++++++++++++++++++
 3 files changed, 378 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

-- 
2.53.0


