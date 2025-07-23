Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDBEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=; b=sR5KmqzKPGIwmAEj2TYRGgwA4e
	0wg8LmigUHXVFsAz6iCUWal7PK2SpR87/HK7dNdsSYE9fGhS9Z5L1e4ngSiLyi0sKq/aabFD6iSPh
	WBjK1IsyjqMrJnc9VZR+qRxR3NKWb6uIsYJXmuUeLQu7XX5NOl+9GEq7bGJbV8iQmsmG2XgEkuR1m
	TRaqxSEcBrzLQnQKSDmdzP7x5qnJKSZ/PJjo6ql+zJI8ZqTw0RI7AnLA/qS7UXyYlGiiQUtDgMb+O
	s+fOb2Ogn7psOQkKB5zIwzOdZHo4WuSSS55m7v4ynhhjYT2NVvT5FhPmVievFXoe7A9owPHEe5+3y
	AhxP0SzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVzO-00000004YLq-1QKn;
	Wed, 23 Jul 2025 09:42:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVPM-00000004SPv-1MDP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 09:05:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-606a269d440so1108218a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753261502; x=1753866302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=;
        b=XNVESAet9zvyWIkaNtJhXn5jmYPxYw0BN8VmVoJP04Zbd79Q7HfzYY4HOd9JQI4UWJ
         spptsBGnUovAAvdBEvm/IRsyQl7K0BgbphX7sxO+I4ZOquLuIKULbLG5IlHxWC8kKwlt
         WLsnxSo4xprh6W0VGs6/KpGUdehaAkqvannzwxvpvUQcBtFbPdsIiH4hMBL8UtBSCYNr
         vPe12qMVmb3eZubIOdl6TPQcO7jKSsJMyAKxfQgh+1gpePR6bXxQHmLcSxzcoZLVM77S
         aQhT+rzGlX4OzEQsHYkT5WgIlkFuAQdivAa2zArM7MVw5tGR3v7CDEwxXTNW06o6WZzY
         FjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753261502; x=1753866302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CoZCnvfP/rwehZqm543p76Ydsjj+4/YJqR0zDLYGaAE=;
        b=cdrlH86DjlBftbxzXWJm7bm9J2sUQpyJslWCRrLd0RI2CretY4EwsH9mVuvZW9iIPZ
         aOi42M8rY3F5PyzQNHEfILhCN2HItcntkHcHBs7SqcJmey+JKFmNtlfsZC87kaDDwQyv
         sdFKAydhUNLeVjNMNlvFEEkW06aJBUOBD+SHScN4KR96vdTv8DSxx9gW0SZopD/kbvl6
         OKqQnpcMrfKXT5xGUucYIPHaB1AaqUuXshoZAJHFuO7ZJ0jJYJMB3PKe24wS4gcTLkJ4
         GgxUDZ6YfMamoaQ+TxmoZU1hFe+dglMFuuZpYOZ7m1zDJhOZ+mAloAbr/xJAN0NzlrEt
         ripQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlBxpptxCoaQWUm7IicxmqiZSjqgrX8JrnSwSKyd24aiAwyYGGgY24MMUrpkhLL4wNOQf59JlaTVaTeURwB/Df@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0+b+6CNXew1/Jn9W9WvRikqeKiCsAvqvP6KAM2P6kqtsTu0Dz
	Qdc1q0OR3bQ+LhVsWJ5k6rUr3xSUSa7WiBb6BvmJvMz+xXSn1G/Cxq0esBthWsoPaRI=
X-Gm-Gg: ASbGncs506fFa0phoRfoXPfI03OfkNpsB3OYca42nLXxI1AsyrWs6GSp/pYBLASxQI6
	KoFaqLSW7/AG7Es/kOTzdm2Etsz5wbljARgTzwtFrA2buNnpKvp7NSxqVYN58yQA8ENoC2Y9c1R
	yYIf/2J9IU/PuDBuMjUkK8ZUKchLIHOo9EO9HA/4OVst/J7FWyILOwrv62urjqmFKmvp0p+j5MB
	o4kDYaZgY1l/W7RzSA/xLrMzxwz+jDsiSGbfpQbkKZFLPFcFH6ZbktOGtq04a7OIcv6Hny9CoNR
	FUOre/0LXzPqwOja4ZAK5dSfYbTdeERifI5niB+16EaWcZvudn3hLhtcmmN5DqcyCLDL4h3IUC+
	9ZZ5ciWg/mYXbJ0g3VfsKXZqN3bLe7yGs
X-Google-Smtp-Source: AGHT+IEfzsllmY1ddx+Lz3lhSzSUYagxITt83zhZt/m63TVAuXGg4evDnAWl67hB8SYpI35/gQ1tAw==
X-Received: by 2002:a17:907:8688:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-af2f64c62aamr72965566b.2.1753261502178;
        Wed, 23 Jul 2025 02:05:02 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af22f6fa6afsm208165466b.120.2025.07.23.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:05:01 -0700 (PDT)
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
Subject: [GIT PULL 1/2] samsung: drivers for v6.17
Date: Wed, 23 Jul 2025 11:04:55 +0200
Message-ID: <20250723090455.25295-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=jKxS63Re37hcFm6L5FR0wOlWb0i7sX+Y/k5+Rp76jT4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBogKW3mDzwNTJovQ3V2taqJr+0T0EUFr4aTJQrU
 U2eCAEqgvCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaICltwAKCRDBN2bmhouD
 1yR5D/wLSF3mWxeCh6hr0nA8CzfZto/VRm7x52o6glrfAIZHQ/zaOZ1570ojQRpZeJP5mZm4qGY
 eCpgfc3Cl1f3osmJKLI+ojFPlK2gH/ipqWahqcUL3RsUoLEivfyXNMYgVXTlWkTORjB418lS8G4
 fC+/aTu3X6UgYmwLBP8r10DUaCbsZDfBDbr0mNCU1VMLKphSgTRHrJ7Fg8HVk8mXucjIsd0J/5t
 Wl9bVoa0hc/QJMAZO9hG2pK0KaAuIHgs/9GSO9HpcyHnlMKbMOvg09YptLZkXDUDs2zTlRF5wnB
 NQXTtkM/pqAfz3z9cWqPeRK4OkEILvtOIFeYAIO+qd8n3Pa3B7DyBhlf2r/xLCh6FOKtNtHp1dX
 tk1JND/+6NxXlw4Zt9WkiAj6vA4vu7Do4i1DEdR2dlB/C28jltww4CsTGu48nkO66/6iD1vCAA3
 ZMeQciN0yfxEl7fRNBiHs5JSXdSW8axGHEtdSU8PkD71n0nSR0Fwxf4RY1JSEk7vFdeFJlUUuio
 z03+FSDx3pT2g/B3sbq/trspGQa3YpomiGIBGJvvId9fUwkUa4CHy5DxEbDObIScg4zIs3oZ8W8
 GikDwiW3shZzRPhee2lB943Ur5FpLQDYG1LGPmjsUY7oMlNhTaPs2mEsEmIWjvC7ivChoKGwVrB R22rNCovyB27l2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_020504_391843_205AC58D 
X-CRM114-Status: UNSURE (   7.96  )
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

Late pull with minor things.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.17

for you to fetch changes up to 687d974a218a719f7e729bef9c498ec36f18115e:

  dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920 (2025-07-16 10:41:42 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v6.17

1. Google GS101: Minor improvement PMU binding.
2. ExynosAutov920: Add HSI2 system registers binding.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon

Sowon Na (1):
      dt-bindings: soc: samsung: exynos-sysreg: add hsi2 for ExynosAutov920

 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml          | 3 +++
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 1 +
 2 files changed, 4 insertions(+)

