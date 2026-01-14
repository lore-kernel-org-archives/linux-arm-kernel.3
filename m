Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D11D29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6OCciJM5VLSPu4v6eWfBVWzdmWj5wTJ4JKpa9kVLeY=; b=VCW6JZooUsW0MxmN1ySCVoDn7E
	w52SuX2cH6i4otDvXbxOS36A2oWdYGI+Ekz/t0UIhRG3kvmn6yQEms+CuhKskD/ZUMTSpZLstkga6
	4jnPg5j7q7hYmiDwa03FCxooa+Ltou6jWeuXV8SL7cSMKrsvh4cIvvc87epRAmiM5S0jt9VJD4If2
	Ukj2x7nCxuvzq2XDwwNJTIFV05vp1Lx3Twj/1Symqo4F70Z0X0372H9JXWKrHNF5HvNhU5sxojbxb
	f9m05+UJwHPy2jHb80f36234oMOPSJpendfb8J7GS3VSBH1ftWOJxlqfeYmGFdpI455FaiG2uC8TW
	y7E0HVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyKM-00000008q4r-3XDd;
	Wed, 14 Jan 2026 10:42:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyKK-00000008q3n-1KA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:42:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-432d2670932so4162509f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768387330; x=1768992130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6OCciJM5VLSPu4v6eWfBVWzdmWj5wTJ4JKpa9kVLeY=;
        b=hROmq+n1Fj5bEAxOJwWgIkqrJRYbuXzoaWID4atqCPXg9k4rdjhf7I2hSBJINsUrT5
         qLeSKxdYtQzHcpSUuelSgMLqVRpr4Bou+CCliYCR4iW6klRoQGIX15OwybhrUi6Ry0lJ
         ajGLHin8J+o097sLhbqkFDCr4di+uHJujhadBLQTvmer2WNYnKuY9q3Y9SDZNMqRl/+l
         tvbBgscrxzYM77wBdBR4bRjzUs053bQhnCgNDv0HjLj2YqG2I5ASfjWfLn3SQonFucyd
         hMklxa9tANItojgcI0ZFS5so+hwYj54thO59TF+gJRcamoYow6Ze9n6//cdkS3Dgc/Ns
         LKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387330; x=1768992130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6OCciJM5VLSPu4v6eWfBVWzdmWj5wTJ4JKpa9kVLeY=;
        b=tRyixARlkaBHixwmH7mA1nGKlSU/8OS2bXElQUBu61BEG+o3c4mNUW7ZOKH2g+oDYq
         wFWc3iTPSZ/Lkh3UdEkR8SoYeOtRGMSsEyBUC464KrtNjXKRW06ywR3oXdKe9jZVToN8
         0H8rK9XnFRzAoPmsxguwzvNb2VS7r0YBw9pCTl5dHNt+ubPUMBDSmWWtUcDa1S3sl90X
         9AwNLTUPFjGWFaZ6QxljmLPJUwGwBA0s0JMwS5qGVrY3BQH5qWwhi6JwmbiUDS5QPzQ5
         er81jvmQBZrjF64R7El3tfEuMoiRTixlwlVTZaQsgidLjCKqPum2jJEWKmB5s4E8NsPq
         RDCg==
X-Forwarded-Encrypted: i=1; AJvYcCWoeMTO+RjiLfQs2rzk/vpfCWI/xN18SJtF51k5dyWeIquheToCin03Fl9dOujNmTonAOy1alB3ehMyQeyp+FO6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4BC9SfEigAFcOgKgUgFBv+As29lfvgGE+T9Y8wc4NCnMyQXgG
	8L5pGWQQJkRiE1zUozWujudnmpnrwqjjyBc/6AcbIMPzrYjRsgrjRNLK5AhiGa5y0lE=
X-Gm-Gg: AY/fxX7QRPbkz3PVE9KXBfLvHkMm5m0QQBsxpv+ZiN1thSAko6WbiWDLLqd2cp+jiND
	6D9is+L+2Mocwh6RBcZxle9kMniP7/p5yKD3tVoG26C1FvAU2+b8r5xGF8XRuWu8X9qjSGOmhhQ
	PF+tDRaL1NAfnJBYE1f76FdMCuk9W0RiTFKYgVxixOihkCInePlYNF0lTOrsb6435HvTzzMpIyv
	ALzzXp6BhSPkN9tx4JSRdjLpbqc+OJBuiNWDVCXCXKTMQKOXDzKOwEL3TGYh3XK0qVS24JJrfgB
	B3SnMec8qgWd3JMr3xGQZ83rwqR63Jw1vP95YFuZumG1FmGqvtHbwhuze4aE3Ty9CZGRjOZ8Cjn
	SwRQ5BosZO4Xo7PTkhV/cDO6wKXAOLb0PmTUFAr4oMofGf7VreGrRmB6Vpm0JPRw+BGg5IWmF3n
	d8BH7hnDzkZGRF5/KbpORRS4roaveQ/ESnkrCdTQ8=
X-Received: by 2002:a05:6000:2386:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-4342d389602mr2053586f8f.12.1768387329838;
        Wed, 14 Jan 2026 02:42:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm50818905f8f.19.2026.01.14.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:42:09 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v6.19
Date: Wed, 14 Jan 2026 12:42:07 +0200
Message-ID: <20260114104207.2033174-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024212_426391_A010137D 
X-CRM114-Status: UNSURE (   8.94  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.19

for you to fetch changes up to 94ad504e67cd3be94fa1b2fed0cb87da0d8f9396:

  ARM: dts: microchip: sama7d65: fix size-cells property for i2c3 (2026-01-08 09:31:55 +0200)

----------------------------------------------------------------
Microchip AT91 fixes for v6.19

This update includes:
- fix access to the PHYs on the Microchip LAN966X PCB8290 board
- fix the ranges DT property for flexcom9 on the Microchip SAMA7D65 SoC
- fix the #size-cells DT property for i2c3 on the Microchip SAMA7D65 SoC

----------------------------------------------------------------
Hari Prasath Gujulan Elango (1):
      ARM: dts: microchip: sama7d65: fix the ranges property for flx9

Horatiu Vultur (1):
      ARM: dts: microchip: lan966x: Fix the access to the PHYs for pcb8290

Nicolas Ferre (1):
      ARM: dts: microchip: sama7d65: fix size-cells property for i2c3

 arch/arm/boot/dts/microchip/lan966x-pcb8290.dts | 1 +
 arch/arm/boot/dts/microchip/sama7d65.dtsi       | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

