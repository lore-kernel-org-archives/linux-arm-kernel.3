Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411C0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gea8RDhxW52XRzq4nksHK4G+nluCQdGJ7LngFtiewMU=; b=NglTSXWl8hjG3I
	Qx254NK00rKSkSCA9jC7OUlf3v/BPI5E4hhl+SfG5bBv9RSs8xi6r0V/MO0aALtd5VcCd+Y5m6peg
	NLDSLbohV8AJKIA4tL4iUf/aL6xcqInxdCB2lr6xAhFuN7Yxtwc1duqoXxqPAqF2FyzRyD21LM8tf
	t4t6h52TxA1O2jlS/Cm8vdKRi1m04fYHEie8cTYC0CFJa+21v6JPXgHc9AHb25Pbaw4pMgqzMwv0L
	1U1LvG6gZsWrq/4BYRyY+PTv0s3Pmbv43SETGnLNj6NrfYxOmXLy6ruF73Uc8Ng14/fxIIjVvaaJx
	OGLBI2VbcL25x1cRJ7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8HI-0000000AcVz-0evV;
	Thu, 06 Mar 2025 10:16:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ff-0000000AcCV-1ziV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:14:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso740564a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256089; x=1741860889; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gea8RDhxW52XRzq4nksHK4G+nluCQdGJ7LngFtiewMU=;
        b=cq+p3TEtGhQTutfUVFsncpqJl18tSC8VVFT5nfTIdtRI7NqJN3jhmhzB8iT69FtHYR
         cSaE0FBKuYzSut7wtxHlsC3FTB7yX0arza1FlhxWp0w2J3UQcDzFnfUiX8D5NDr3EsUl
         NK4xGQGEBhfI3YgDM5QBdHI2PaMbcvIPct2oaw3RUgpcRJBbcCoHSl963mVNLA6jQhrg
         dgOSgu5lcbYgzKciQryKwtlq8UTGPqSRlJ6DdYpGXbcOd7bnluTFIbVgvEwK9gYSChIN
         1byNKVFOIeuB080EYDtDb+pJ662S4yDcn2X8A+ipbBa/1/qdJDcE41u1MjQwInOgbCaW
         i/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256089; x=1741860889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gea8RDhxW52XRzq4nksHK4G+nluCQdGJ7LngFtiewMU=;
        b=ZAnLWD8PIsbt2/zp06M4YR8zO8aKX9NJ6d97T+1zxx3Ca/A6zXRYQMEsLtyDbTQ4sq
         wla6CbZp0htjrNg/s5q+HOfLzQVq8Up5zb8x+SNxFPHk96MJJZK0Sv04z3RHuooYovyb
         en9ZXTeu93vWBhhvRibu6AK6Vrc8TYC8DrkBWMTV78ylKEtU0z+EtHVWQg9RLvocm9Un
         apPciyH3xHtoX6e9WcAn3jW+r1VU6DLkdrJpjebAsRweZO8pTr0bXwXvmikKP0zVt7jT
         AoBMZxtLHMJEJiMN5B1GC62SVNtshNWctXgFApoDiAfW9ddE2QucJBTyY0IeYS7XezOP
         XdXA==
X-Forwarded-Encrypted: i=1; AJvYcCWj5WRM5lNapBZfhlCuJRZT59jFd4ie/8TBv64RM909b5Uw5J0bd/gr7z2/zfk8x1bdXuMtuFeISVrEF3T7WD/2@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuXEz7iP1kSfGzdIg/NGAVL/MkKDwAxjnwHFlx80NxB2Z/ry6
	4Fv6PqlCUYp2Gv1xlPvKAHjLa/LWYqjm3BB0AeJP7bDpbd/9vhWMEkUkLjfQvD0=
X-Gm-Gg: ASbGnctyVj9vWVStRU3enrJi+HcX8aylIB1GOjDQWq6kNuj6rjdKS6rsEcz8w1Dxptq
	qctzlc7jGwpnVUiwRdB5iB2c+nt/JszcSIjaB1hMqBZgD2lrUfs2pl9hu6LlCkALzHbqppI+Fom
	cjPbv6rsls1ohxE37vQo44+TvZ8ORbQTgGEuSqhREpPHxKW1sg16hK4t0zyv9uJPvcsJ4rNY9dt
	+fGoiY11YPj9lzySQhbvaAuRr6s/TVwha+sv/LFr6uTqWgyp2n/pd6oX//CgV4EaZ3ZT4Q6PfOl
	PfLxwg1KDOgMKKVYP/rLvDweJHtfKKwCP3fhPlp5DxVfOPuLqHZQnz/DdMwNX4WKM2LYBnTFn1n
	DvcQK9wEEy3xg8eURUvnheU6U1lEA
X-Google-Smtp-Source: AGHT+IEgLGcDGlkE6kWAXN5bUDSnAdelHUlOLrSKWe6iPW2qcxJJbof7KnLLgyUzGGWjzI7ZpD00UQ==
X-Received: by 2002:a05:6402:434a:b0:5e5:c0e7:f455 with SMTP id 4fb4d7f45d1cf-5e5c0e7f696mr2569873a12.8.1741256089115;
        Thu, 06 Mar 2025 02:14:49 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a6af7sm708972a12.33.2025.03.06.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:14:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 max77759 enablement (DT)
Date: Thu, 06 Mar 2025 10:14:45 +0000
Message-Id: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJV1yWcC/x3MywqAIBBA0V+JWTdgD7X6lWiROtYseqARQvTvS
 cuzuPeBSIEpwlA8EOjmyMeeUZUF2HXeF0J22VCLWopGKDQtbnPSWsseN+/QXRG96TqjrDJOCcj
 lGchz+q/j9L4fWtwzJWUAAAA=
X-Change-ID: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_021451_515405_1265443F 
X-CRM114-Status: UNSURE (   9.19  )
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

This series enables the recently submitted Maxim max77759 driver and
updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
accordingly.

!!! Dependency note !!!

This series depends on the corresponding driver and DT bindings
proposed in
https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org

Note that in that series bindings and gpio driver are accepted, but mfd
and nvmem drivers are still waiting for review comments.

!!! Dependency note end !!!

This gives us some extra GPIOs, and enables NVMEM which is used to
communicate the requested boot mode to the bootloader when doing a cold
reset.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: dts: exynos: gs101-pixel-common: add the MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 75 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 2 files changed, 76 insertions(+)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


