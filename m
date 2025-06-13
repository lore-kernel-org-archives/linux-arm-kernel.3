Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C1BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ks7Cb5yRG2wcSUyuDs1LCaDeK8IldkGqaX1oBwewLMI=; b=v4GKG/zDNqEMqaf8RsxXp6bxOu
	kZ0SvpWlaxoJvFcn/ZBxw0NOSrmfXrPcp0JAnHcz3S6hQ+N1OH00/N8AYrmjxIuhBhuJGQqPonWfG
	GaNKmI1qrbK25dzBlI99j7bAiQ125/qKdgzPANFQeoSZclYZtl81ZLbjRuIwisJar7yxtnfg6uHFT
	fv8Ku/yHGg0FrWDFdgNWURtWHW47RDsAcSe5b1ZDlO7WpFzBiTggfdfhlDQoKO7cS9/M/Mj6cqSAy
	+wyw3KobG9ROqVNFo1IFqpNYfpgOHK5XEOJpPnMYJ9hRO1ig2VZzb5fv2z2crRsHskTBPzLBRXmqx
	QIjGJWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCc6-00000000DAi-1IxB;
	Fri, 13 Jun 2025 22:11:06 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCZv-00000000CnU-0DKX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 22:08:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2363e973db1so31473035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 15:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749852530; x=1750457330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks7Cb5yRG2wcSUyuDs1LCaDeK8IldkGqaX1oBwewLMI=;
        b=g4N6tpe/IITzeCQeION8ScYzHMxbNjfu9ra/F1cc7D9wsSqiYopFYiX/zjfVF7fwCr
         kffoV15bMGG9y2ipCCX3lUb4DBuSiK6sn4efhe3nNggPdxT1jAc/QnwvCUQYU9ixkEjz
         HJJUWvxVjqJfkv2nNhSbZ4zklyBFR1inmHe80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749852530; x=1750457330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ks7Cb5yRG2wcSUyuDs1LCaDeK8IldkGqaX1oBwewLMI=;
        b=BBCUHWszUPTsgBLrjDyNgCXzboWTrJ1rwECVSL0gu6vIseiGgLYTrw3gP5fEh3r0YG
         JU/6JZfUedpCW498haGXi5ZRjMel9fk1tEAz3nDEMpFoDtlpZsVjVDXezVufsmY+Ksp1
         WFhBtgiki1+il2j2o7Iamm8y0VAbLBn8hnUlFYDXeZjKONgwstEKMjocypvpbB1HE6qX
         SdetLUKm16QqcW8irMq00kuOi2gQNBYZtgpNQCIb6EssImQaXG0tRCFxpGbQp6tPKqg+
         Uf07+M6Sp+4eZhAAcyeAVK7XCCgo941CZM8vj9UDlEiViw8xT9Dv58RrZjSA1h4uExUr
         Mo0g==
X-Gm-Message-State: AOJu0YysXb6Oqv5NdXmlGGf2NCOwnMkjZPZmbGIz3u+obxMD+eGvSrx1
	yEH//7carugN6y67Wd8/Xj3Gkif/5tQ/7d3aYnJICWJmpeRwjenpVR91I5ESI8m0Tw==
X-Gm-Gg: ASbGncvpQREu9rRZvo8FCXa5qCgSnJtW78LfRU9AaVOSS7Z2xOizhGF7S8/N9z6lR7h
	aPi7w3K89dIj9ooIP82UfhTGVuCkoNBho90zep4hBXzFsrbeWPfbbquoXbYB4lsHaPRcd3ybH1G
	Bs/gMh2G5VqaY6IHdIrosRI4iURH2SsADYYUeQPMId/ainsbI6jkUO5Jn/oDNWErJBO2qNJhLgx
	92KZ0eT+OHCTU+I4clPFrpkZRGkhIWebThFK0s3/2Pjh7Ppb/KpqnyCnCdImlYLoBTOe4wZNGCs
	/uNxzchbXc3kLwDHxnSGc2wsWtJTUzpl7tKAcjjEGaqt4Mj/8LjEb9opOMjKCL7w/Yu2U2qQpyK
	1A1Ro3alG8dr4nuQSH5tGCDb9ePvMHOFLPRKymqSAKA==
X-Google-Smtp-Source: AGHT+IGGXunzvDx+YWUHR3DJ8A7LTZeXaJD9LY9Vb+YqHFJOh93QCg2y7/MZBfp5hRzq6QWzHieHfQ==
X-Received: by 2002:a17:90b:1dc1:b0:311:9cdf:a8a4 with SMTP id 98e67ed59e1d1-313f1c06c51mr1846023a91.8.1749852529544;
        Fri, 13 Jun 2025 15:08:49 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d74sm19593105ad.152.2025.06.13.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 15:08:49 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] PCI: brcmstb: Add panic/die handler to driver
Date: Fri, 13 Jun 2025 18:08:41 -0400
Message-Id: <20250613220843.698227-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_150851_201497_16A4ABE2 
X-CRM114-Status: UNSURE (   8.63  )
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

The first commit sets up a field variable and spinlock to indicate whether
the PCIe bridge is active.  The second commit builds upon the first and
adds a "die" handler to the driver, which, when invoked, prints out a
summary of any pending PCIe errors.  The "die" handler is careful not to
access any registers unless the bridge is active.

Jim Quinlan (2):
  PCI: brcmstb: Add a way to indicate if PCIe bridge is active
  PCI: brcmstb: Add panic/die handler to driver

 drivers/pci/controller/pcie-brcmstb.c | 193 +++++++++++++++++++++++++-
 1 file changed, 188 insertions(+), 5 deletions(-)


base-commit: 18531f4d1c8c47c4796289dbbc1ab657ffa063d2
-- 
2.34.1


