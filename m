Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F43C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=; b=ksomA7ulyfD+LfhzF0QLt39eG9
	GWiaEg3r5NLq+J+mGV35IZOBPzOy+lxVFUnjSlYMzT6OVqDoZWmCW/f8bysjVkF7hjo6ogsUC4Ayi
	K49Ws9FCV8bEJrKDZpJD50e95ZYEQ/1EfMbzfND6J+dEFgUT2frhaQq9IR3MtOAA+JdgCTZMjJmY9
	/a6ewiZD5i30DmogctvWcQSvhoTb4VqAEHOBiLl3MHKakJSBiIA3f+ayFcGBFzinoJGFpz73BKmkJ
	IWznYxnAb2fZE5owVo15MnFlhqa2lfLvGb2vXz2xeLaEn+v1Fai3oR4aiavN1s17htUAkdNJ8mVLS
	OaCexzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttpDn-00000000HOQ-1P3a;
	Sun, 16 Mar 2025 14:44:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttpC6-00000000HJa-3Diq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 14:42:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so436898f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742136145; x=1742740945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=;
        b=ryJDu4KdjFnc5TV6s1W3SzdJlxw3P59HEoxzDJfyonyy4nBsU3wYGV0QzICkKrxANn
         JI4g3JAXNDka64yS1r8eAfR1gi8An7SP8hMABOExspWT/4ypCA5si9S60EJ5XE/9vtFw
         fQjnYcSFjxkyyNXWmwSn6LYuvcCOuWVYvJWWjbsMyxotim/Rmu1g7iSu5B9lXC4gKHZw
         9mkMmplSfN1ejhQkSk6u4uiC9KSNSo72ZxEu/ehls7v2CU0YE3hdRTzfMH5lfkGIu+eu
         x7VVK28wYMwTrwc0jM/8JAksYiMFz5o4gpVqtdPDAnRxaigw4Cytn4aCJFb3ZUT7vton
         MvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742136145; x=1742740945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=;
        b=GrpbV42z0sUu+58Yqxm8oTfanapSK2YpJYt3+6SYKybgdgnt2awedsJ6EiF5qJlEue
         cmXt1VjLYURiqqHVljP2K7nP/KRngpV/EIAvjWe67+g6kdBWm/yqrvxocipe/7Bso5cm
         ULXxgI8adHlsX8xmK/qkb/xwXgZ+C2PNeawgaBM7k+En15NURaUEo+wUS+A6UtTAu0wX
         TLAzxedCliRPFJfTYE37VU21afFQoR1PKN2HT6TgNqgEUxXIdn+MRAKMMFCXSeNeuwNo
         l4K1yL+ljNoABccSI/zco4cloKqm9s2pKG2E6LuDUffbUEnieiIfvH4faNDSPOKuW9bW
         RdJw==
X-Forwarded-Encrypted: i=1; AJvYcCWYRCCCO+/U0yWs2zluRN1yZfE8mCIar2bHnOts6k8Q3nO2rRy8dEGbq3Kr1IL8b/kAGjxDIesQNMzgF90ldmas@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3djqCyvcMgCfssUm74+1JcaC5ofBW+GkqSf4OiPyVGuHE8wLs
	ykHGI9owOlxrHg+zrRrc2y3PB1Jywd0n9ICOZGew+hqEMZ5k8mP564w4MWoBEKY=
X-Gm-Gg: ASbGnctupmjpHYMTNGfIAbuSexmkN2p+Yi2dCGkxQjFUT+LToVgMLigHgtsOP5LEb9k
	XcgabndvhPU1N6YswIanwN3mm6DEsSYozWp0rpY/6L1iquFkf3h1VL80beKKXpIcK1/e7x/raZ5
	w+RzlUDow08pKdoLl/mkB+va/rbPZzV/q51NRagi02zGQ2zzeju+uPMSd/HuDQw/aDtPjXxFPco
	ejz94hwPf8cuYy3i99DeOAciggy/Bkp2ixkosERwG2+LQIga5Pn3sOpt3qBxkKhRTOxanFQGCf9
	59b+WbnKf9Tpr2gttW3OLlMiB4uAx/kPxCTluic5wJmJT5ZGbsVVoEjgwoDh9hvWYHPV
X-Google-Smtp-Source: AGHT+IFN+HWoJ/RvheSs9Qe6ufnnQM/Id6b6C6RXmbLnvuIy+0v8jxxH3K/QTk+P9kPHsJxT6hIFLw==
X-Received: by 2002:a05:600c:4e8e:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43d1ecca06cmr40418265e9.3.1742136144846;
        Sun, 16 Mar 2025 07:42:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62d7sm79591825e9.6.2025.03.16.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:42:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] dts: cleanups for v6.15
Date: Sun, 16 Mar 2025 15:42:20 +0100
Message-ID: <20250316144221.18240-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_074226_817413_EAA10643 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi,

One ARM and one Loongson cleanup. I gave half a year for Loongson to explain
the spidev, but no responses were posted, so I just applied the patch:
https://lore.kernel.org/all/20240717-preacher-sandal-2aeffa322b9f@spud/

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.15

for you to fetch changes up to 854a080f0b73ff966a813ec2dc53891831daa28d:

  loongarch: dts: remove non-existent DAC from 2k1000-ref (2025-02-12 21:48:51 +0100)

----------------------------------------------------------------
Minor improvements inDTS for v6.15

1. ARM Cirrus EP7211: Align GPIO node name to match what bindings
   expect.

2. Loongson 2K1000: Drop incorrect spidev description, by pretending to
   have there something else.  This will have impact on the users of
   DTS, because spidev will stop working, however no counter-proposals
   of fixing this or even explaining this were proposed for half a year
   after the patch was posted.  Therefore drop incorrect hardware
   description, hoping affected users will come if proper one, if needed.

----------------------------------------------------------------
Conor Dooley (1):
      loongarch: dts: remove non-existent DAC from 2k1000-ref

Krzysztof Kozlowski (1):
      ARM: dts: cirrus: ep7211: Align GPIO hog name with bindings

 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts     | 2 +-
 arch/loongarch/boot/dts/loongson-2k1000-ref.dts | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

