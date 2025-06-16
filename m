Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70333C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=; b=j7IragdDbNOS89h3n5FU3INzOL
	+JN2dDjp/GyinRKjH6i4ZCdd8diHiaU+F0ltemdvlByUN1Sbar6X5iSeGWtjIASz5l0UGwNAE0VKN
	J5apP4zaH0gTjaCfivl0juCXU/4YQYE4RnprUhoEebP1OX7tgicFQIe26uDYaJ/oiQOyEuMKQq6Wo
	xOEl8akaJffVDT5CvjzzDvMbbPt3MKV3UbpZ++ASXDKckvRaSD8tphiXcCRgn+rv2L35KqOp8ZtSm
	Xzac2L2qWUgRHnNn9gQ5X1b4Cfpzax+0rO5d6l4wzZRBIaoFcEdRBVsH4evHXpARZRnfwH/fUqxYE
	u7u0+7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR725-000000043yU-0QyV;
	Mon, 16 Jun 2025 10:25:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6PQ-00000003x9A-3ovt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:45:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so314166f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750067143; x=1750671943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=rjkfsZ12En1fb7+9BcO3PNzQFXWnVEtRF07jyDUPGnuEQoVMx/Y9sPHRT9zyq335pO
         /XUEpP83+Iw47VnK9TVsoQ0v1uI1UwlL//J1MjJ+P6q3vu4v8z4XnhHq1+HsT4umF/hC
         u6tEo7WLO2ayDH7ehK/0yUMUX9EYxBrFqJow4vDTWFG1nWvZd37Ccbbn82IOXduOiFn5
         pIyqHuwPiuJZuV5kDtj7uOnl4Yq40BcJx/YI/Vc3PCENh3N5vJjaxpljlrzxEWxBzuoD
         HMG+QnhGPQFMvz+RcWYwd4ddVydCj7Y6q/6fk1vMz34iasP5o7Eh8Vh4RdzTBCWxW+a2
         0voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067143; x=1750671943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=gYHXTJlWIdzD07JiIV0bCsL+mHLtYjVem22Yy5JeUV/HtsnYttE3eS7r2/BqL8Nepx
         YjFqD22I9BoNhhfH5MnYpy+ofGH0k8Wa2tPPFRSAeiTRRJsuGu/V49laRxvb2Xsnm/l+
         aBe4IlgiQYBIJNJkr0KrRt03MwkaK+V/Rj8Q2Y2d7i7MisBbsXJgqqqj++1cZ3vB3xfT
         DJWTBByeq10b4LDrPO2In48wUgzZ35TPbEKmukT5I+ROo7Wmui1pjOPPY5RfeygK7fcn
         /fXptQ4GpjbSNWly9grdipdfkx9gCLh7UzheXkO6MNQkdDiTvqvlGjl0OcydaxOd5FPa
         VqTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQP9/EiZzPyQOh867M2bNxPaEkDP5ozxCP5+ayeyjrTMoaLdCbxcUG2L+G8ulqMOTrrswxGMKlitVPEn7+H92o@lists.infradead.org
X-Gm-Message-State: AOJu0YwngLWtLVdbeKqe+zOH00F8Ic9zlqwcUYU3J5735y6Ih7puRO6+
	HOd50T2+v4TnY5KKIZ5w/jdD2khMRHMXhiw0Y534VZfi/fwTejwNLFucSWmZINWEcF5rFukleJZ
	SL1nyUKn2lw==
X-Gm-Gg: ASbGncvXKrmJZ8chhlld4RZ1mI4ldWNqeQD8kq8R+uPerY5LnalX5pYI8Il5VWFms8b
	dKlmIE3BSmtM6W92on1jEUPAH4jdFXWo2S0QladBM+3PnNTjZvzrIhVfUoCOjF69rm8x6hd8KuO
	g6RwCQnAKQ4qkw228bE9/myRtBQfxUZ8rleT3u8QBq2GBNIOv76ofkg937AV0cf/uM2WcpCnRzT
	6vvNwUZn1SfATp/hu6HXKlmxUJqC4F42bkoU2eOCihkLNTh/tFwk9SzfTl7Nm4Ce3TE0FhImOXT
	lqEUhSjM1UurUScW8JdVX7GGhxVnzYHFd2bwtuGUJXb21SlIxurne+Qt+nJCdAGGIccZCWJYoA=
	=
X-Google-Smtp-Source: AGHT+IFmhUzV2REZ+armXUuBCrTN/HZvKEo4jmpES0++U9AIxkv7x67178KFZZA0J/Ne420xjaKjFg==
X-Received: by 2002:a05:6000:2087:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3a572e7a579mr2511491f8f.11.1750067143332;
        Mon, 16 Jun 2025 02:45:43 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a67361sm10711943f8f.30.2025.06.16.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org
Subject: [GIT PULL fixes] ARM: samsung: soc fixes for v6.16
Date: Mon, 16 Jun 2025 11:45:39 +0200
Message-ID: <20250616094538.33256-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT+fCBAboPqnDdMQ1PbbW1abt+tp9PiIs4J8uF
 Zr8YV5NFt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE/nwgAKCRDBN2bmhouD
 1+wzD/9FB4y+oWO5csn0+pLRk1mm9Z+42W/TegH2R2wag3jd3cYzP86Vv4/BBQbxHc4hsGxAAZ5
 RJsw5q0sX6vx3hDeyo1uZH1BmKQHEJASDC8WDPDPC3pYHQYhAxRYU617yNlp5UNNk6JJ9rC+25p
 ZXvz6nLdWoj8peI4annyXHOGVlPEZ53Mn/2PBlzdYdLvUgDMX6bUwli5SWfkibYRWq9FzXrZ8FP
 MNZtWXFU21u8GVRwWqONPdwtAkYCBVIuq+Ven2bdI7PCds9Qh04Nd5QIT/Nd+XRAV8IQBZjUd4z
 xsdRNotZyXzhceSmHfMDHx5jFJvSRz9OrXXYvaW1uXHD7bi+b0h+xai9SkzSyHsMzRL0FX2+hB3
 MA/GXCreM+h2UXk0QhYRP4oQTQHrJ/ZF1PxAhrHw7+7H8lgOnevjGTQ0SF1fpVS2Ve9x1XmKcKd
 B8dODZghP92kNu7iATg0RlDsXFilqRJ9fsekxbzPbmqriNAWrQ6Ozc2sHyDPTc1kNJ881pJsHRn
 DTkh3it/D6s8jI9+0Njc6Yl8YEK22YfjkiY5LGPe0+k/i6XgGxbMBQPkgpOD9OZsttb/J0TtHLc
 KwAdUydr1wsCOlqvU3YluXNrJddgEq6JPnGl0er01MlMYa6C+e/F6GjLgjO1EEas12HlvlYxHV4 fpTfFw2FA9IP2GA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_024544_947331_12189854 
X-CRM114-Status: UNSURE (   9.53  )
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

Fixes for issues introduced in this merge window.

The defconfig change affects Qualcomm SoC, but the originating commit came from
Samsung Soc tree and it was not yet picked up by Bjorn, thus I am sending it.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.16

for you to fetch changes up to 8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff:

  firmware: exynos-acpm: fix timeouts on xfers handling (2025-06-10 10:20:16 +0200)

----------------------------------------------------------------
Samsung SoC fixes for v6.16

1. Correct CONFIG option in arm64 defconfig enabling the Qualcomm SoC
   SNPS EUSB2 phy driver, because Kconfig entry was renamed when
   changing the driver to a common one, shared with Samsung SoC, thus
   defconfig lost that driver effectively.

2. Exynos ACPM: Fix timeouts happening with multiple requests.

----------------------------------------------------------------
Casey Connolly (1):
      arm64: defconfig: update renamed PHY_SNPS_EUSB2

Tudor Ambarus (1):
      firmware: exynos-acpm: fix timeouts on xfers handling

 arch/arm64/configs/defconfig           |  2 +-
 drivers/firmware/samsung/exynos-acpm.c | 27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 18 deletions(-)

