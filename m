Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCAE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MEBaxrhXtuUNeerBIkR47JpXV/0Yl7e6aP4Ai3bVM5c=; b=HgCrnQz1sugA0jJoaEV2K9f3KR
	mOp34gkiJG/4RPdoAom11SBXViF59VwHVXOdnwFRtSf2I4tRuIaz2J76yNmm9aF0Sggw6YvHXjp8s
	QGjOspMXSRiRRUKLsRpzj6xoGsdfZDRen5Vi2HokqoB6tA54cbImiNV6P8isd4rgdG+txYSM3a1+x
	4tLh068xwJPBmk6cLuH5KFlHdmvx3AzmJ7GL9ucgqCCyZzVim0ByGUgv8s4w1cHRaplxRvulxMx91
	qRoligOqIND7Vim6suFNB5fOPipXyCvykhZvQNDOdv1n23meoiVF9Jw/QGsrA9nHbSU5TrWamkc1w
	MZD6tVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGBw-0000000H3Ek-2yRB;
	Thu, 05 Dec 2024 18:03:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGAv-0000000H2yK-2314
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:02:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3862a4b8ec2so51718f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421724; x=1734026524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEBaxrhXtuUNeerBIkR47JpXV/0Yl7e6aP4Ai3bVM5c=;
        b=Y7d1yNDHmDyhxwue27zw3EzXDkANSUdQr+FmU70Ve4CL+L5RPO7lKU5U+Mi5IMr8VA
         wM5E/saFgWw/STFNDECbqsyEA4Lmp+XxQ5RHOsRY5do9DeVH2yC/ERbDCsy09EG22+Ib
         fhyu30me8EfkF1V1jt2uO+LJOw9UdrINVAblSz0DJEt8gj8Lt9Hh7bVh7f9sg08F6AHp
         O8SWWfiTTwm8y4f/sQu7O+9SwQ/+rAmdHn66gVHkXw3q9t+Eb6cNV0XQJV/OxDH19L2u
         7Lqk97cy8jRvGai+yyDUPZfwPAvQ9X8U0Mwvla+mMqqKbo0wZn67Xb1csfTCRw6YgYfT
         BMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421724; x=1734026524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEBaxrhXtuUNeerBIkR47JpXV/0Yl7e6aP4Ai3bVM5c=;
        b=PHtNptc09pUnpRUZRCgR+8ceikdB5mCtQzUw6lwNqYDH76y833+Dt31Z/q5MbIdajB
         ORelgbu2jIVnj0zTqTWqEoxbDymcaJosOB+cUwNrg72uMFzxbkZixwquP/tCH93hIOpB
         kUl31m6TnBMEycQkWq+1fZe6xPqxeM1amrEidpv6qvqh10uWH04KL2RJuQeJNqSlGpo4
         zExlzmVATgB6JEYlRNY39GlYfgpAGID6lLHgCiX+8iOllz7SGqhqpPHK4h3he/dfqBwI
         PUmN2FeGGOpEdA9ZV774M+bANV/nGsBTKqROBxwNc+iz8mxnj/ZdPZMHH8OBm9WFs6ad
         cfNw==
X-Forwarded-Encrypted: i=1; AJvYcCUMCdlgzML2hMM1JCTm6Ou3qZA43NzZdhnlG2UOV+yx8evRjjtyOz9Q9oQFRxA9GHMiL68d1y6J1rigZsASrT1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5SPQWotKDFn8rwwFbEeBPMfbDgxNHQAQaviffn4a7umy2qERD
	sRZykqZYagPk35iTyz2YYWEVo++f5DPpIfy4lJMiJB8K07zldKI9nO8+IJgdLMo=
X-Gm-Gg: ASbGncswI1ghKWL3Rifur9J5fDkVb19Yq2hgW8OxWILXG66O6XVAyLP3KpXzXEShh4J
	H8/2S32rOU4ggmMaSSjTFoKqvuDv9Ava/gGSaIPXt5uiFQ1jFiikd2DB6SlGi83JX/vroJQ9Zu1
	q0AfdxMZw5ZWZshaWz+s4+IEEKE8RyqHYHerwXEBNxla47T92NGYG+DE6iuDMwmd4sT44p8qiCK
	qEjh4yvwHC8u/8qcVAMhE3YjvQ9MfDwraEbEwVdtKr+xTV+U9aQtxYwjNIeo2vHhwhViW4i/7f0
	ZoIuw35Nypo6xib2NVUlhOoVyeYr+p2n
X-Google-Smtp-Source: AGHT+IEaRSOep3o6BlOGmjw5C8xn/tsj4Vy2kgRYv+HBcuFUUH34fZUaz5fJUMup+GJE2Tx+FT0gbw==
X-Received: by 2002:a5d:588b:0:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-3862b37afa8mr16766f8f.34.1733421723607;
        Thu, 05 Dec 2024 10:02:03 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:03 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] arm64: exynos: gs101: add ACPM related nodes 
Date: Thu,  5 Dec 2024 18:01:56 +0000
Message-ID: <20241205180200.203146-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100205_530041_538EEFAD 
X-CRM114-Status: UNSURE (   6.80  )
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

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Tudor Ambarus (4):
  arm64: dts: exynos: gs101: add SRAM node
  arm64: dts: exynos: gs101: add AP to APM mailbox node
  arm64: dts: exynos: gs101: add ACPM protocol node
  arm64: defconfig: enable ACPM protocol and exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 40 ++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 +
 2 files changed, 42 insertions(+)

-- 
2.47.0.338.g60cca15819-goog


