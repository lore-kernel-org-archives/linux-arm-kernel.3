Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA75C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 23:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=; b=3QZVZ8hHPi1yXyUVSGt66t7eUo
	xjXUcP5Tjc6MKp0qt6H/2ZbepfKwq2T6FBtTa0kg1Q7GrKM4xtQ+hK2K0X/G0NTV14Ckiw8srfv+W
	Ioq9ABDIhm0UnhJw7vSK+tUPQaswOaLAp8IrYe46Z0EiLWnJ/wiJ7rI9GYSDbMM+SBFebmEwZiLxV
	nLbTnqtKVt5Sc+Y4xJCWIAeXpLhCue6o8tSRhJKYWUOX6699vq8ilCwcgVEnrqNyWWXw70TMA/xFa
	nc8hVc77x9q/eTo2gv3EtSoazejXJoVnW3rMyZSt11eahFbPtcjgqEM1EIMpVQGx2Pc9wbmSxaPMt
	HRWlUQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9t1Q-0000000CO9l-3qhH;
	Thu, 24 Sep 2026 23:38:36 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9t1P-0000000CO99-0cev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 23:38:36 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so288339a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 16:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293114; x=1790897914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=;
        b=Pyi+HeQhk0cvEh21wKiIw4hdaLYC1IMI9txYwumtPcamA7tmAUYVNuIxpyYnfxjyv5
         b4HiAnhvSwTTxx5tqKp+OQwsvcPC5azuns7Q3pji1oBFp7OctoaAyQu38dh3TfvXGGaa
         fLU0aSmel0YXRqceESSl+697NGdSWeYt8Z0S7KMBx/NjnnC+0XnmeNt/Q2/wchR+dvSm
         5FFNOHzVId7wrWlHrFyzVFDWf9APXVuLDMahgkqlbn9rKVfwmajdb+HcHT7zLf53VGJr
         5b528FRvJcE4YxAyQuX4gBFrHVYFBt+852+T2povlSi2ujtUyR5zV9+sT3PlU5FNcs09
         oA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293114; x=1790897914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nVtiq5l8rv5NNM5qhW8MrGTTD+LOPVZgFHb8BuXNzc=;
        b=KW60cN2Qsk9R+Bj5xGa5pwGVKQOwweIalGlpUSwm5wYJbiRs1zmK5eQDhhVugzOeJ7
         ApL8EA6i6HsxgFUmx+LWQljnsn4YjpJTCiYqtDXuszgFDhUGva8isFXH7KuZgUhhnyP8
         H99Cf6iCyoNW5043NrXCWzpDvB+z6dN8/IwQs8ZGh1OOQ6SWs5hFDET7UA/LNY4PjNXx
         fSq8CmwR/ZzgzdDODMpPQ+PlQ5so+LeuncF6Nx6zpejFEIdfhigYtPvSRbKqFsgNiI99
         ZEnkqMqEhyZ5NnIGv1TjCAB4H2rVknKlOpEjIPxtouHue5MKo+OyWiPqwh2JtfieiINs
         uADA==
X-Forwarded-Encrypted: i=1; AKwUvBw96XXcPGOcOHF39Mpv1404ajI7RqUkPcDyMjXcfhp+UtFNykct7pOYzWljBpqhXUB/+HyjyFWHNgjYJMnwBGTW@lists.infradead.org
X-Gm-Message-State: AFuF++lDEEYCrqlLyaUn1s5aAvL7T/8cFo5Sfv4st9xzGzuxbrWwSGXX
	ZH/spwSDyNf4vyliw+G70utMKgR251855oZ6vdzxChQywi/IXP206hzgkAvJfg==
X-Gm-Gg: AYBFou2RM8Ef5DmpFKvVVd12DZX6Fo5JliOUxyx83rgg6168a/mw+uhcRGGOQ8NplsP
	Zj1ZzLcJZDlN/b5JJarsSbGCkdBBxdy9EAheXb2uPfPCsxb6i8RnCpFv+gvXt/527sJfuz6HymQ
	f5Vq9dYxbAsgRhY2O1TYknH+EmWPNYyV7cWKLtVD1EDTCr2SLLAzCwqsWVdbsfVZl2RfBscdBck
	aYv66E7uame7mPsa71GnGDD1/xAQ2oTX9ig+/vlLjyO6o6icbdMEJNiZMOP0KrH1uQHgHVBemNB
	qEEWO/Yzz4AQ4Mgt3r1hRkZhD5shEDp/na1DDxQ0IwktFeUgSsujqDmHN8YX8+3m71a2Urfb6go
	0LaOYhxvT302RX36pYETjRSsFBQjZtUG8R/35q3Ik5sQUEEimBCFpvSGW9gKn6I5fr/YmH8Aot4
	TFkHjEM8MEaKofE6EVHbX+CQWyhNInl9Ra4tfE3Rz/m2W5zyFKTuW7T491LWYba48X76zxAST5m
	OTiur2siZiz3PvLE9CALxeUoMw7te8yM17GMt6z+dROkaiESokVtmcRyc86/dr4QpUmB6ILTbJX
	uNT/IQQTJwFbMw9GFEd5Dq2rkA7F9nRj8BqAF+KoX+kM2b6r
X-Received: by 2002:a17:90b:2dc3:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3a098da14d3mr3305369a91.36.1790293114266;
        Thu, 24 Sep 2026 16:38:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b7d11124sm1307931a91.10.2026.09.24.16.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:38:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 0/2] usb: bcma: control VBUS via a regulator
Date: Thu, 24 Sep 2026 16:38:29 -0700
Message-ID: <20260924233831.127617-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_163835_190860_035FD984 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

v3: don't drop GPIO.
v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 +++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 +++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 +++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 +++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 +++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 +++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 +++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 +++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 +++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 +++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 +++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 +++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 +++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 +++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 +++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 +++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 +++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 +++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 +++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 +++-
 drivers/usb/host/bcma-hcd.c                   | 55 +++++++++++++++----
 26 files changed, 384 insertions(+), 46 deletions(-)

-- 
2.55.0


