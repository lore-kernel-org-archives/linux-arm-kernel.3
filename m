Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808B6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=; b=s1V7LjIDrWRQ6JOgf1TNupehNv
	fZjv1Or0BcPpQPc5swxPIGfMvM1JAigqdmVw8LxlcmZiYGL56uU21d3960GN4oJBb9qItDv9h6pum
	UI3ohqyx03t5qbVMUsg/ogVd50OInFakIYbHSuxGpTmC/eV3nYWkPC/MVjb2eAHmDzI5bVeldopB7
	iB/mJQ1CzF/ipeZk6Xq1xf1TWgdkZtNtXeY1v8TyoGVzDzsXhiMninYQyRCQkdaQ+h9IDClKd3bP8
	dO//P43mHil7eJDv7KGHMaJ67M+zOWKXtcCrwIiYCPACr8hqOm6HNtJvG8NmWoSdnShfXpCHUhYa1
	9SnXCzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tScBl-00000007FTV-3KiB;
	Tue, 31 Dec 2024 13:21:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSc8E-00000007Eqm-2QxB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 13:17:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361f09be37so15116495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Dec 2024 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651077; x=1736255877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=;
        b=jkNwEOXTo99RzWJC8THLoJwgjYtEbmHenJNfHfuVNsz6cmhzW1C07/SixVq0+e2xL2
         pIvu4QmnQHdVO/FOnVTHQrhiNC1e0/oONfto5e/ZAUrDHVrD4IVL6BvZVpgihMKkl4b1
         2Wcw9giCit7i9OgVFqfAI74yXs3s0TofblL7SNvJHjDyWPN1bZJ+QVm4BgCUxwMy0TQQ
         QRzEMhkp+zgvqoc45ITlJt8fST+Kec1Sug7iG0ygSQdXafUIZ7Nii82GkWP23zfBqNRz
         Mnbffr5Y6CpE67LMeGMOfVCSllPDPe2HQsOZ9fBRLt+otDsep8oQjhUIHkMn1vhscHV8
         o8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651077; x=1736255877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Cegx4jkWYm3KNBPZL9uCiDiWoGmBVTmnbwZR3twevM=;
        b=kUN8jwrwSRzxn9eU4aXWoP8MNuFlO/vCjz5n9X9S261aN0AgMIpeM4qtEtAO6YuGFA
         Efj59WGAeZMof6CBuvNPAJfA6W2l2Fh5X1qDXXAfFRG8uQY/XLusDqIDYGex75GfG5xx
         gK5bjfV1bFmy8ZFINFp44Lc7Yu/Nf24UArbK7BwlojCdx63Emhb31aPEuLzmE6ovr9cX
         4fagZNBkdDyua1IIfq9IVvSr7JFpC3lb3zTf3nUO5WOCPuPTuM0jBIMb0XHyeLlDaV8H
         zBq/1yKyMqFvZ2tNhXdnDOvUbsoSMZYsUujCLbGN1t3EXAiqOVDhxc2jYoejyWWFAPah
         MWCA==
X-Forwarded-Encrypted: i=1; AJvYcCUEJy9ldgVy0DqsZDRwcuJ0Y//KYzgYF6tXPCYz/xEPYO8PziHqq7dmoz5/C9LesiOmLV5bYBgUrxCFXI9pEVMh@lists.infradead.org
X-Gm-Message-State: AOJu0YxZFaZ5ufGRKU4k0gLjgShTO/7ITOH0p6MY3Zuk3Mklm8dzf2fh
	RNcd3kJFomqGyUSc2qv98rT5xvJ3/VxHXGdWvwTrPLzM8FYHq/D4NNRKLO6KX9Y=
X-Gm-Gg: ASbGncuu3GlkYer2sVsl5/8SWmAsTLY39PGQB+45p9Bbu/GeWcBRp+rAx0X7zNbFgak
	RPTO7shrrKzs02IAGoTR/I3gc/+ewAPg7vN778rRoONyjY8io8dCbelE9LdKs1NNyCdwwWjjGiG
	qJQOHUo2iZMDerhv0oiKrMRQCBbHMKxzCMnGKwN5vAEgsATeGSYChVVR/wA7gJKII8nTPRMqzP2
	XkLQ8SaWXcrExEMJbLb6TlB5C9cY0yPLa5rGawlFa6TNr5D59EuSoC+cP0YxZ9rIVHYM14=
X-Google-Smtp-Source: AGHT+IHw804talOfXWk2gKgWu9RUYC1DfOft+MhnzFGHwJeLypmOC4OiQ+wNsLYlowqo/W1PfUYEHA==
X-Received: by 2002:a05:600c:1d1f:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-43668b602c1mr129738655e9.4.1735651076746;
        Tue, 31 Dec 2024 05:17:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm420068305e9.40.2024.12.31.05.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:17:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: dts: samsung: DTS for v6.14
Date: Tue, 31 Dec 2024 14:17:40 +0100
Message-ID: <20241231131742.134329-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
References: <20241231131742.134329-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_051758_704171_066C91CD 
X-CRM114-Status: UNSURE (   7.41  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.14

for you to fetch changes up to acd33b48ce663c7e293b11cd77df7ea702ca34f6:

  ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec (2024-12-29 11:05:46 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.14

Few fixes and improvements for sound on Galaxy Tab3 (Exynos4212).

----------------------------------------------------------------
Artur Weber (3):
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 31 ++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

