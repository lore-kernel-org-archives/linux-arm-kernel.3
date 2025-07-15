Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B72DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3GwjKh4XQxSRfwQPxwqnuf4H24N1Uv5D1O1oOMjSyM=; b=VSggletFqlmtC5f5JmM0qzpe83
	GbZntOpP4hhgkaMueel9UgCqQO5cTxvS9iMLfuKCaLmTYrjpZopQVph743caz7qJeHFsnkjB4oTj3
	yK4piSvGv6H6yg+ZEVQ+Tvf/WsngkSSPDAUsyQ9NhGE6f9pipTOwUIST+nI0ui4c7BhpGH1ZD0AV5
	6z9c2ByKzquMukNcbtfSYsm0HvR0syAL+AJsxeHWQbMnxO9hy2VOGN0CZ44gVfeRR4dkoxtS4+l3X
	qyyezu9Koued8y+u2Fq+J8Sz0PnRYNLoOcFY25VpTzFKKMfRfxJX9qArHjcpkXSMMHZBx8pZE+PAt
	H+HlHLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcbn-00000004nr3-10YC;
	Tue, 15 Jul 2025 10:09:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcWM-00000004n7l-0SXd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 10:04:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so292909f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752573860; x=1753178660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3GwjKh4XQxSRfwQPxwqnuf4H24N1Uv5D1O1oOMjSyM=;
        b=V1iLhz/FMXAjcAvTv+d2OA8IedmBksYwVjknK5Slahd6Y5GuCogkUSjMN+4eivFqTe
         SkwvsBj2LoYjkNv1VTzTrpsHHUaFF277YBSxTQ+rswfIPfWpPYh50I1L05HWgmi1nmyg
         +cun1XoKVmcfy9fY00R2Moqn0wXCDJHMw4b3EInV7YK6I2X7bBp0Jqqsws5+JNXI2tW5
         ZW1KnW1tWdOZ/99icilchBLVVY2IDAaqsoZiYCkZ3TL39BYn12e02YRSzNgq100gIOJ+
         YHuq6a6FJGPlfqsKzizxKe+/4tfpqzb58DiJc4p3cT6BEAyb4EQHDUP4fWy696nEACp+
         GCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573860; x=1753178660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3GwjKh4XQxSRfwQPxwqnuf4H24N1Uv5D1O1oOMjSyM=;
        b=rjGj2b09YP2spxyvaaBY8w3xMP7/tw3f0QFLDwWKnw4RZ6f5vdWQ9S88VioFDuwj8q
         izPWWVWTU3DpV1gh3XSjQ8aLzJK24ZsmynFGVhv49Rq0OsS/If3GD1V9rJXr9Fztr8y6
         lSHhuLjVtYKN3cKd3aZQQzKSfSifDn4ytSsjpcAGGIB/OETE7LY4BXRoygdKoKoI0ue3
         ILb5ptC3LtPx6S0ldaUvr3GKLBzffD+p4JzSC5BS7cJKvfM9AfWNQ5zjCXkLuc26gC5X
         OJjzb0yQHaICu5Yn0EOPHyRs68axsnJ++/5iDu6uAJv5sZl5NyC77zJI7qv0TEyxJXS3
         68NA==
X-Forwarded-Encrypted: i=1; AJvYcCXy8MJccDHndRieYM6fDQiP06E5TKi3RJ8muHCmGBxojOcJT8vKpOFU+WwZ0ewj23tsFvhg3QFkH/C4CK79MOPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp8eaABOWKM5tlpRmfu7hjnG5PC6Tr3nrGbvrOmwg5bHy2KEHd
	8Pj5pEj9E31+zDZQYAaT1nCW7B5Je2zcUxTPX/ZARa2txTFDUgVXxcL+1KCx1/p7F8o=
X-Gm-Gg: ASbGncurrJohvF4W20dKzNRVFkzRqL1cnbdnHAxQeS74l5oruBSS+cg1em8UU+z02XM
	eA9paz+jN4OCjSXY/wzJ2gAEN8gTpyINpNkFkkwTfvXJcmCIlCdhy3obNiitaHfB/3jKPHW/4pq
	OizEH0Itfl5Tj5TyVqV/fSHlHn5W01EBsQ2dTR/JL8V8LweSmHylkTHDa2KKXI6dRqin8RANJyA
	6lWJfTsZeWcwr1jvKWzad8o0CyhqeOkn6QDF637xGhjkBjQEl16n3gOAnO7wFl8f5L3MVo8db98
	ZbrAYKvI7DpacwwMQwKrYtp1V94ZHp/fRt0H+Cy3IhitVg6xFrOmUq2uj1JVSXUhKcjHaQ3Flix
	pQsQTuUvNDSahYAn/1ZXEzPNZq+BZw9Nl7XE1f1D9lPHHJg==
X-Google-Smtp-Source: AGHT+IHMrjY0VOQQ9jAAOgpScWai9DyRMoY9ri1wzCPDLxklTJKGMPp+lNZbCBa7EyLMTB8MbldPmg==
X-Received: by 2002:a05:6000:22c4:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3b60b3affadmr360862f8f.14.1752573860331;
        Tue, 15 Jul 2025 03:04:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d571sm14964623f8f.57.2025.07.15.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 03:04:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.17
Date: Tue, 15 Jul 2025 12:04:15 +0200
Message-ID: <20250715100415.60487-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SB5SCWzU4SrF0bpQDxGLNYlzODumqwqpchHlKL/3Y8I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodiefBvfgeeH/sRvJWFZDCiNYk4oeYz1pS3qxy
 jayWCXCSCKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHYnnwAKCRDBN2bmhouD
 10t9D/wLdtc2naCJk+QxDqceFLLmw9n17tnaDNQLktCQYeD1Oj7BiPOYSnvKeu9IG72Ru6pTQom
 t0ivRHMXRkjNg71dTTq6hYzeNMwJw7aa9FLd5BmYivYmQ8v3LyLau7tVDwQp+mne+uKAwpI+DdA
 JaiOqgxoenmPLxUpOlHwwmTqqfeMoO+5ra9LsspbkIeXQrSZ/ZBnCz/OlCPFEVFmPUJ57vdJecC
 Ik7N5ll7va/s7Wze8FVj5nBAYVd3O4TrJyf1betn5N82xkdpYGpRTvzbjoBQNlco/7q/fJW73cb
 8GCl5Y9NWoG4yUJjYwytEc7waT6sil08JcnWdOVSVdq7Ekcfmy2Ior8ooXXMjuLxvyKglJh1CWZ
 YU+VVpYaQmqpgn1Z6Njq6M2t6Yc+u4no6sRCd1s2gCDTVBPmtacsN/uIwMBpbYYbrH7Pi/0OBQw
 NJ5ryZM8Jw3oC3iIZDqfCD0c/D3NHkIZgXstzEC6CohnbvnARNNLWKKqMnFwwjuhwrNjlQjcbW8
 g51fowHAe4Bw+t3NtQn5u3+3iYHJc4oTHet5S4T6K617H8KMtk5gyEDc7v8aJ4ShnEPwBbp77EY
 n5IN7ezkxsmMrWi/AwRiA+TxofirQlpx01/rk9cS/qdOc+dFIjZW86wT/GZkAr7RImesc3ptZ/p i2w0gdEkgVu03hA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_030422_188450_25EBD6EE 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi Linus,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.17

for you to fetch changes up to 683d532dfc9657ab8aae25204f378352ed144646:

  pinctrl: samsung: Fix gs101 irq chip (2025-07-05 09:35:22 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.17

Add support for programming wake up for Google GS101 SoC pin
controllers, so the SoC can be properly woken up from low power states.

----------------------------------------------------------------
Peter Griffin (3):
      pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      pinctrl: samsung: add support for gs101 wakeup mask programming
      pinctrl: samsung: Fix gs101 irq chip

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 103 +++++++++++++++++++++----
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   4 +
 include/linux/soc/samsung/exynos-regs-pmu.h    |   1 +
 4 files changed, 98 insertions(+), 16 deletions(-)

