Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E789C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=; b=NFb13MpmM45+i1dFCu52YYr+d4
	ee77MfDCcgegaafaoqO3v5iIS9mKFoO65qgTD6erIHIXHoaK6UI8TDYfT1VT2iECnI941NLPSUz0o
	E7cjqr57g2btwUW8Zj8iLDgWm8ENzAgTbYbvR0yDNObNdrk9hylglxeYy2349IWqkCERrwfcCLxY4
	45Bxaw/j9fcDo5BrLfE9Al/M9vIogag+vF5ZkBp2vbF6eJ1ysBesl2mFKzfLlESH7AijZLMSQEG58
	xuw5SiXUDpUPgEwtPvx6nEhaAzdi0h8rCaJUKjYD0AyOdyttVsLOI0mq/jOVW5TVhpJpG94xZjlDg
	ge5LOHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmf4-0000000C3Y7-08U2;
	Tue, 13 May 2025 10:14:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmav-0000000C2Y0-47xn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 10:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=; b=n+DCS83chkyP94dF+XiHATr7aj
	QhHip54XAplKge5MwuVXz/CcWz6fyy1P3GgoV5TqhOwNHE1xMgwicQT3BHHhiVbm4pS1A4vmSemZS
	m4cGazxUcQS4BVx5dOJHQFA2QBnNYEgWGeu2ecQ0id55zAaiHNrykazhb6QKM0CIND1bOPEJw3GVl
	WS1bzxQdKTzWbux5CcXDg6mT5JUugi9S8BCFXFPtleHpz8+zfjEpjvTNH6YEAwg6uilnYVsZKpUaE
	nIeZDRGqstJsdmFXxfQ9h1ioyGdQHNA/ISyiXXS5X5v7zCKOZ8Mw6g6t03IVud2rWJqTRnH5TTl/w
	ShNY8NxQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmas-0000000Gvda-3Zo3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:10:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso2724525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131036; x=1747735836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=S8spbef36j3zn7v7VEZbgDnJjbNspMPIYrpS2iZ6vdcm7I0IrUBTI4XmYnEi7G0rvS
         JM0ke2lgw8RTTzW9il+Taq6ciSrMafBdicWQxbfH34nsnFTbqyGz4TQ17dbFrPn91G8G
         dxai6Np41XpkPLc0oFG5jmuiM8nKLsm5orzSb0V4qFqnosT59ScPrGKTHLvoDgtshLpB
         dZAA7g6SLm4Z6u4BdQ0XvKIRGhtzobIoSh3mCjXxmKGLZUsKUbfpWeHUFWYbjxT1J4Jj
         KieK+QtYW4aAT1GJr6aDC5aDSneW9v3M9FKQfuWWhrs6Nia3bIc4Qvp0N2zkaS+cmZso
         OBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131036; x=1747735836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT4RifiabCn3jNXGZ/1SUNp8XFTerXnwE9dw2ciCKO8=;
        b=PJ94KkS8nJ7fXRuJ/dIGdOYikqaWx495bOpkA1lVH0Gph6j1pR9LsfZNu0BNvWTw3q
         xMl4W7heXGNkYdqy++5cDWLylcrCLjIUyiJr+WggZH4ATFmIYH3NVHDbtgp+VvlY0z1f
         agqeVUc6LFMgYKRhy0wQjWXgIljfi7Btr52+ADwllYO/IhkQAF8s9eCcgZ3K84VnBC+K
         3Uj5AVhXJuiJC2NsDpAfP1gx1v/HNdVM0F2LesuHJn0DsLj3UIoldmAQnHc2HT/4UB5J
         gh6A5fA8lkzob2yVapkUcbzYLvHboqB05Lq+i9tG9BcG5+ZODTsG7zyhKH98h19Uk5K5
         k9QA==
X-Forwarded-Encrypted: i=1; AJvYcCUrP6quftGFrpmPBTSaNdd+iR6DCHV2gltEETnMDQcMxE9Gk1dZlzPiFW28cSDUj3vSGeB02mZbQaLOuO4I4cwU@lists.infradead.org
X-Gm-Message-State: AOJu0YxDFozJ1NBJRktL1EBNK/jJMwWssDkzbbFZnMuen3Q0dOFIw9pU
	iS7fCn92oaJ95ZWwstETflPEMJJhN/XuU4WxR9e5RwhO/9ZB6rSUJIeAPIS0ltY=
X-Gm-Gg: ASbGncsliwBOTVzXXr9nO96GavgOfMLW5VedIMmSVvPbHAsMLCqoo5q27I6PCzXSB1I
	5HSzYZstot6imRcLT+vAdPSrbOTYKYZa3TXgac6SarIditoymXszWv7qnMjC1MWEQlks6pvLl3m
	xWs6IYXC4GO3H/uAjMteDdoC+1LiwfOrckt/zXrM6Ba/Msv5Ds7ZU/CKcl7tVRHaGtf1cWlUGeJ
	4j2BbSp5OiDQPrO7o+r4maX5he5wXXJMP1xYyRtaN/cR62sJ93VNxVoOsmuXWjUeFK1PpKnRF35
	zmt54xm1MpakcrR7FECvvEDQyDdSvXcGshCyx5jPbHbWo+2r6h9pnHsIe/tiLNegC/AIQKde8ZO
	5HKRZ4GwA/o3yIXaDnPM8TEVPfvzZoGoyIKtX5JM=
X-Google-Smtp-Source: AGHT+IEMONG7o+2qqLec3J40u8cxE5Hikn1gleQY4dduRgG1LUtg8CN8da8I9rkzzSsfliL822Q/Vw==
X-Received: by 2002:a05:600c:4f43:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-442d6de79b0mr53581305e9.8.1747131036030;
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4 fixes] samsung: drivers: fixes for v6.15
Date: Tue, 13 May 2025 12:10:22 +0200
Message-ID: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=S2iTrSKyId8Z4Fz+KFg97dcG4QI+SgeyYQ5rhg6W4Fk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqPmFvw4YlLZILw8ztH+LBScalD7xKqIX+Ch
 i/m/UIVK92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMajwAKCRDBN2bmhouD
 1/eqD/9MbCSa5fsTfL4M6Msdl6XVHg9QIaMp8B66liyP+bBooJn55w6uXhxdlwHF9ySGKC641F8
 0Q1O0VRsta3YWmVqQswD9tO22ySzkEyzl0q4aKLWMuasrAHJcQcVIdgOQC0yNNJip17k1LvXj3Z
 UHxJULw7Td0SC9sdIVsYgteRyMVemT8dZK5zpNGPLwTN5oKFrDtiJgyDI24sFknyq745ownKXvX
 WZ2iukaUZ8tQIe2JiOy63Sc4OHe3Aqca4auvoJtF3k3o3+u0kO0wN4DeyNubrYXKjm2zgCTLP6F
 l0CyTXp6qLXSXc8FhOwM0TLdrJvfyYDSGsqI1FnXyGJ+xlZOKkZQ6WOKILmPVA4DqSbvIpPpXFZ
 PDq9RJBQt9ryi5c2neECV2UWcAEhvfuWf/A1M7g6MyKofT8qf9bWbAyCBDV1qlqWRm1HbWQmOF/
 IeEgAn4K3cl0l4xRZ9FuxhRxTk9peYXqenF/s+o4vnGHsewyHM8EAKzRbWejkywbwTHsE2Wj7s5
 qUHiYm79dBT3JNWbYJA3c71y65aW96Uz7nH/T33/sKRbmHDAnaFxvwzcOUl/y1ZDntKGKW+Wl6E
 E1u3eXEFPjrr1v+0gRTvgG1vGf8uFKkN+fZM9uBSQezJZCkwjVxr+Gv3ly/VRKhcIvnUjtLBrBK A/ZSg49r/gysgUA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_111039_018862_2F289A6D 
X-CRM114-Status: UNSURE (   8.43  )
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

Please pull for current cycle. Both commits fix issues introduced in this merge
window.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.15

for you to fetch changes up to dd303e021996a0e43963d852af8a3277e6f5ed88:

  soc: samsung: usi: prevent wrong bits inversion during unconfiguring (2025-04-14 08:51:18 +0200)

----------------------------------------------------------------
Samsung SoC driver fixes for v6.15

1. Exynos ACPM driver (used on Google GS101): Fix timeout due to missing
   responses from the firmware part.

2. Samsung USI (serial engines) driver: Correct ineffective
   unconfiguring of the interface during probe removal.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      soc: samsung: usi: prevent wrong bits inversion during unconfiguring

Tudor Ambarus (1):
      firmware: exynos-acpm: check saved RX before bailing out on empty RX queue

 drivers/firmware/samsung/exynos-acpm.c | 44 +++++++++++++++++++++++-----------
 drivers/soc/samsung/exynos-usi.c       |  2 +-
 2 files changed, 31 insertions(+), 15 deletions(-)

