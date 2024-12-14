Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE50E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 22:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZb9moUiVpxFCMqmY6tsWVihMcoiO44ViJkmkTUeDTs=; b=UxEh4AhgaCz0YxEkTVNmguCyh1
	CA/Ph2xQ0AL8/wk50BJQVfAf7eO2Ingv3n89im2hlEc/CWzrnOMit+/aEIjU3s20wAMkBN5TKx3iO
	i5lq4Rr+rPZy8Jfu8ljPaDHKiD5jLyUWA5JlkOShm4MssLduOHkY0oxDwCXdqiMUVWSAHvxzR/BGX
	xk3Ky5ZGoS3MgXHKGxX1to2piFcYwTfDH1nObpmPTqNtx89E14eaUgmuNc+17uHQZ12+z3/IYrk3T
	KPkggSYXRNS2WtSXT0i+L/9zZjqoIPNnGA36fXJjYv+Y3tS/uZ1iMTj0ycXqimXR9YxgwBM3qBz6w
	QIo8CbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaGu-000000071Wu-0RPu;
	Sat, 14 Dec 2024 22:06:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMaFp-000000071M8-1OlZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 22:04:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43623f0c574so19927815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 14:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213891; x=1734818691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rZb9moUiVpxFCMqmY6tsWVihMcoiO44ViJkmkTUeDTs=;
        b=guACw+OVHpahHm0eLuzSpCBmUsFfESDOiNOsF+YLwH4RlJzfjve5MSiP6wTdVOcPVF
         kN7m9VOTJokN+Siaj4HLce8HNCSAAB5ZC2McXEgMMENiYIeDYi6BO2cZJjw4lHPBmhTM
         m39Ws+CWwJVZKlwb5ie7wVWgltHyUVWc9jZZ7NMzTB/uYquNQvIA5qb1chadus2FfAeK
         2biK1O0piJbM7mxsLOdvRpiuLK4Y0WRO+HjWuaOGworkFJFIxHp1/f4Baqx4yO23VK7h
         /Yki5nnRW42KsxqbxLLrqm/zfQS27lUEvVwC1cSa8yDlk4l4Ii18MIQaLOORYqDEqTjf
         JAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213891; x=1734818691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZb9moUiVpxFCMqmY6tsWVihMcoiO44ViJkmkTUeDTs=;
        b=lkeS6A3VJfA2lw1fWwkXfgXf5SrI/NSrogl1EsOWNFKaZV5YI9C6w4XNcRid1bR22T
         ZFkmmsXUSN5Uu4jo4Ibg1fZVcAfyO7actXboON9za04GT6rhrl1+ICZYw9GtuI6BK4e+
         /W66IV2uYv96g6OPbx6GZqDJXAnXEdNl5gmdaCYx1YCXaFOisQWV5Vj0/juXopM7rEgu
         wGK9SLiMpyo297IskfhBB48WYaoYFG777NVfFax5qqD2DiBkPIbYsoe95aQzX8lHSx2O
         XsxJ/N+b5rS1bMadn1km30iaSXrBbgB+LLJnYTepOvpJWaZcrxoTNCoXXhhJ5Ld4C8bR
         HqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5tzLE0ChmAL+arORlp6Pr+4sIS02x8nwt8mCOZSplwwiWfFpgo+LVGa36EWwbV0xytpEFzktgHRerEiAwSK3x@lists.infradead.org
X-Gm-Message-State: AOJu0YxmnIvaiyOSmsbles62iiaYb4pvp0exRXMQ+RBfrTsXlP9Vg68B
	Pfnr48UxRm+plW5D9H5uAnDX62X1LdynpJQzr3oF7Oi+Z1aRv/VS
X-Gm-Gg: ASbGnctomsTLy0WV73VtMRhaAzrMfvpFH8KkrymDuaJAIbXOFw0Ri4NwG06qaIkPH4+
	hXRRJtTXO2tlSsLiJHgZEHqrLFuWKspiJrvD/dmV0LYuIxw5sG2ayQQAlfZ4wSMjR92cpMHs9uR
	xQNPYF2+nofG1Jro08q0B6VDgGe1yRXJIfjG7HyblLoMT+NwPZNDtSKw7DgwFaClG7c3tzmS7fT
	QlkKD6hsMyXHmJINcHCKC/Lhx3xceWQZVUKyylp+JkXdt3Yb3o55Ex5lSWxQEghQBQ04h7jCWAN
	qCSVbYRjE332fHfVX2uQ8T1MpKs0j52u
X-Google-Smtp-Source: AGHT+IEp+JHm04UmoCFXhypLWQox3sRGEjPR48qR1XxVmCrxM/GGVQTqiSSl6fYMc4Bk25nsaMdzVw==
X-Received: by 2002:a05:600c:1c12:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-4362aa3d8bbmr72912625e9.16.1734213890608;
        Sat, 14 Dec 2024 14:04:50 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm104456185e9.1.2024.12.14.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:04:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sun, 15 Dec 2024 00:04:17 +0200
Message-ID: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_140453_409523_9ADD2BAC 
X-CRM114-Status: UNSURE (   9.91  )
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

Hey folks,

This series adds HSI2C support for Exynos8895 to i2c-exynos5. HSI2C
buses here are mostly available implemented in USIv1 blocks, with 5
available externally - hsi2c_0 to 4. hsi2c_0 is available for PMIC
(although I've never seen it used) and it uses BUSC clocks, which are
still not implemented in the current clock driver, so I've decided to
leave it out for now.

In the next few patchsets support for USIv1 will be added to the
exynos-usi driver and with that the rest of the I2C buses will be made
available.

Kind regards,
Ivo

Ivaylo Ivanov (2):
  dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
  i2c: exynos5: Add support for Exynos8895 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++--
 drivers/i2c/busses/i2c-exynos5.c              | 31 +++++++++++++++++--
 2 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.43.0


