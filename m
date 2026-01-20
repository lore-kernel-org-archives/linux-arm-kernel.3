Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8451AD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=; b=2c7zk3whexPOuodO+MwLmWDwtS
	awfu4jyBYHxE2wC8HrZ/eQjSpTnmCEt4IJ6MQn+QO82OIZIwY9B/K85+rrQjuq1VRlSYQs+ZMjv6d
	qaNLsKtgoRiqv2mSM8gumgUInZTuEm4iDawUDT8POEVorhVV3D1EIC4O7REh58V6oH9NPZmm3H1yx
	eBUJqzLiMntOnROOlzPzLrCXbzo0Ke0rc7A4r3wcM4p8pHus7V7NzJXA5mpZSrrH1m7X5rrUrhJzw
	EAHN4FGafkRSqOmVEMmhtp630I2eFJwUKFzm5TwPehYcov+fk8xez40bxKHMvak7a/6eWPwOpJjqR
	Lx8H6clw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDHe-000000042wC-1sqL;
	Tue, 20 Jan 2026 15:04:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDHb-000000042vc-2e02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:04:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b87f3c684a1so257729266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921478; x=1769526278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=;
        b=Jb4AGCFiRR3UkwTQq32Y/49CFuukujxFAwrr9DSIifI4LE8VpDNvxcbJ52tg2jJURi
         nFxy2kby/Sb/qrOHtPfeUSprsEi2ikjU6oUUe9zy3vOTh5gGmJP+GFu/o1NvrMp+47dn
         vC8hAA5WP9e64awMYprnL/pSEdSVQD52DOdZRw6dTj0X+lLAo/eeFBjaD0uLaUUUwWR8
         aDDMFU9RPxWSt9fSOROQ5wk8r7JzamlxEyz/C2zDLW3QfjjD/OogrjM1eInBVgoV5ab4
         zevooCAkMDw7hpEO7Yk/RCvhTXA0f7GHitzTyX0iQ+yXJf/9qPGgXLCCmlYvnqbiPkSF
         /U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921478; x=1769526278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79xLShts+sn9/YB5KF2cuQey91jFfbfmfoohIEeLjDY=;
        b=YsFzvS3QFsX3YmgOlixUxKQY6kYZJNsKg1y1wUpuRc9wj7lx6Ni/a4JeNJtgsU0g6y
         EAVANJPMhORdd5Mw8ow2s4qqO5U6+jCQZT+YvA//pEKCbwNw5A2C9w6IwFvmYldfdew8
         GEw3N4t0Mjm1Eo0HCzzIkZPQTFLWA5YsCO2VQ9VDvxKwSDrM+c8ysC4rfKi/Auei5RxV
         QXIeJTx0X3Lk6KhAS/CE30g4XniMH9ZimJUMlhpWKLdoRFceIe8SGe7yD9jPDTq6qUD0
         BIm55Ns/jg2OsgSajsu2rrTfnX7aoXeh9kliAlntVnjehC29s8UWYaRW1ia4z9vFHTpj
         C2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmI07C8+BbLMeko8Kccpz8atMO5qmQbnMfBOl0XFcbRpt6UTro9s5NYe7GkkS1eB2P16RKfcLBxS/ECNDB5jAp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa4XKImuiPbY0mzw3Qfi9aDTcMs7yxKB/yexT66L3S18+PG8PW
	UApPXIit/Bc1Xen3SxIXGCiPlNq18/Nknnl6l5iVUfjVXkCH/R5sQWWI
X-Gm-Gg: AZuq6aJNj1HssDKm6QI5ikb9SIA8/NX82nNrWquyjPahAO1IRvPVjJM2VEu4VyfdXpB
	xJca5Kzaa6JF/JUD9Yf7QNJLFuPt+7PPiJC0YR+qMnYZTF0LY3nH05WoIgVBRiiQLCueR4vhWbV
	HeNS8Vj3yJmS2JsPuKC9I14wHahbmWRW4JpF4Bodol69AGyRoEWe/RpTl9IYUlP6UqewPZHxBQx
	BjBwjL2h3o2gL1XfZqQaECObMzYGEm8jXB2XkZO6d50wQ2QCDXyFlrVJp2Mn5Bqgtt+2jPIIt3i
	S03Zm6QhmK7IkkmOmVJs2EZoPr+8xEdt3zW7AxiasJEmBt/NxcwUmFY4gAPhmvH7lgQF3XR+wnE
	nPxykzXqY5wbQBPR0Z9QkQGlJYNy14XB9kTFJJizd4MOzFCVczWeTfGiA1YZytHAYUYPPjjmUcr
	LRgNRnEl8jLgxR7aHu0rdcebDllxkQw+dSzMy+
X-Received: by 2002:a17:907:3f23:b0:b87:206a:a234 with SMTP id a640c23a62f3a-b88003426b0mr227202366b.31.1768921477456;
        Tue, 20 Jan 2026 07:04:37 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:36 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Tue, 20 Jan 2026 07:03:27 -0800
Message-ID: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_070439_677717_241C0921 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

Laurentiu Mihalcea (2):
  ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../devicetree/bindings/sound/fsl,mqs.yaml    | 12 ++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 3 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.43.0


