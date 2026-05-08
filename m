Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EF4CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=; b=aCymKVabAQ9jLPlm3KTHXBR0uL
	pAnOku8zeY5vF1hXWuVsqGjI2S2GV+3Hph7sbvuMzaa/vIYnSkzCXtUAjJyZthr4GyVWJgb1k+xfr
	P1R6IOqhbFwEfeNqPNUvmHlENlUkfxm2Oef1i8X12v50gSzOYb1TylUsniCnbhG2wWYvy3KcH8I1A
	XFM2OTUr2zsQDJ2FlI765Rikb9k0tbfdA+h+F8INjoJ9d+s7cafEbxqO2WIOi33waOe5n5QYmzHDg
	5Wj6h7Jx9oMe/dW6GMJrSUvwC6SVGyreo5YMxhxVV9/AuufAZscjxxq9YzIqHznsnW15Z49Gsmvsz
	kXN1ltyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN4u-00000006orj-3E5Q;
	Fri, 08 May 2026 15:25:24 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN4s-00000006or4-2Jx1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:25:23 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso430438eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778253921; x=1778858721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=;
        b=QVMzH5SvUE79VnNUcoZYIuec3A2kq8L+j7SPq7C5QEe5QitT3ekl3CMLwiF8pQM3GH
         /ZTsYoyWjmf/lP8UeCZp/b8rKyTcXZ298lDLz3Fouc6+r7P2p0nTO14IwWNEkoz+A2ab
         E9NgJi6ck4vkGeinm8jGYGiVYrs7x6Oe/yyfg5xCH2XYA53tp7Tkuq2xQ4EfE8PI9tFf
         EQ2F+LSJmqGygaHJ2BwgAPfwFJ6OvpP3HpucNTi5x19dM7IzH4tSrnl1rbYcp6Xt7GrC
         4KxPmgJ5XeKsSalZHck5Ku0m+V7YV7SA2ES+DVoLHl+AbZsOQACbj4G8HZJwK9nujJQ0
         1Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778253921; x=1778858721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRoQ+3Yekl1sBGcIilVshMHtKIfsx7cqVK42rev6z2U=;
        b=bX2pip0766qufyS0BtYEuoTP23ycNVmiEYKpKt5eLklBFNXiDUi5G5T37AjdfCFWhq
         kDJrM3Jpau1Si+RyzYZEUNC4b034d7VhgaEIiSidDx2VNBXlHv30OfIRvp60EMiP6tOL
         OaRwSXKXYYbMAMTljY7MMccQcwpetSOye8TRHSsSCyi028eJjnbf0yInHwHovExC3iwr
         MwWvPrtQ3bRUYXnIsH/Y70/32JZcgiJa1/uRPTic49urZyuhuTIxuZAlF+1OwriuqfuV
         XTBgLMiqCjpCOWDqGjIpheApZSyVCFq5obtOYG+vX4cSkuAhGIOREgiPlcT9pwo2BXQp
         outA==
X-Forwarded-Encrypted: i=1; AFNElJ+llNGuKl4z5p6bzMQif3Bp8gQHwRjnBHUYFLTK637k20qD0OP5cQTmYdGJDATNDwLNH6fahnjYFzLOPFbbWdKV@lists.infradead.org
X-Gm-Message-State: AOJu0YyYcXG/CgiQ9rBXOMFz3TpiHFexugQrf/lA8gREI07bX06F4ngD
	ctQENz9HkNCP9nFEpfVR73pv57Q2uCHKUCe/lTVTsvxE0oVdwLwzMa9N
X-Gm-Gg: Acq92OHkmBWWEkXhSxRLGkZEQAzSilzrwrHDXbqQI/fij6nGgeY1yIsvuDfKYo5wGm+
	mtcoybF9DN5a64igh4FlM22T3dChABCCiEOrCqQ8on4IOsf4RyOyDVmA4oZ6Ya6ISLFgy15rznp
	BcFi6Kptx8oKxdAcSEA4D7PlvV8/0TBZJahFrBnycLEBZ0A4BruZDhFyf6ARIXIorth+TchA6Pp
	3fRUmW6zqHnpIJy1i39N+f0M51AX+jztXSwALf8UUSKQkzkPG5zs55I1hN7N5YiWeDZqPAJeFcf
	gVP4YeXHcSxCY9uQlhUEoRKs29XePz4NNa5LJeuxO8XJfc/wk6Xmt1Wjbx2hQf7Q/t9Vi3MU73Z
	x6VVQUxyHjqd6nKvY7wle3giquNGOoYVArlprDxCRrpA1NFurUQShPbeqG0QkLV1VukB/1QZRGn
	XZqUGSyMVDdOUNA4ScboAl1warIrfTRcqbqaakXgdlwqCB6Sk=
X-Received: by 2002:a05:7300:d70d:b0:2d9:6373:ad10 with SMTP id 5a478bee46e88-2f548065445mr6402720eec.7.1778253921033;
        Fri, 08 May 2026 08:25:21 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:25:20 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Baruch Siach <baruch@tkos.co.il>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] leds: is31fl319x: Fix shutdown GPIO and update DT bindings
Date: Fri,  8 May 2026 23:24:17 +0800
Message-ID: <20260508152435.21389-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_082522_632818_644C4996 
X-CRM114-Status: UNSURE (   9.29  )
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

This series fixes incorrect shutdown GPIO polarity and improves
shutdown-gpios description in DT bindings.

Patch 1 adds detailed shutdown-gpios description and fixes example
in DT bindings.

Patch 2 fixes shutdown GPIO initial state and removes redundant
startup toggling.

Patches 3-5 correct shutdown GPIO polarity in board DTS files.

Jun Yan (5):
  dt-bindings: leds: issi,is31fl319x: Add description for the
    shutdown-gpios property
  leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
    startup pulse
  arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
    polarity
  ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
    polarity
  arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
    GPIO polarity

 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts     | 2 +-
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts     | 2 +-
 drivers/leds/leds-is31fl319x.c                           | 8 +-------
 5 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.54.0


