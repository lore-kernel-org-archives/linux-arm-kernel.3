Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA43E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V63wJTh9Gpi5tIJqemgexT4IewcNUrEcJ6BJ9DO+IfQ=; b=KlURpiX+QL9sBmyWIyPRHezbk0
	nmfDoHBjkkrivz0XQCUgRs0AnfXidGf6viw+pssfHAg0wMklc64hiTA/5iFjhz2lAvF8DN5ASs9Ed
	3cGh+zS4hvibIz0Upw2jlSi2ynWQRn9NeS2PKz+mtWys3AOgsQ9z/RHms+2TA8i9F2uB7gok+OwYt
	dd3cqXKYA2DygpouwxsBQX9wgfEmKxYnM53oVRIdJj5QMwgRJy0Eik9Uhr9ltCyAzHTXfj0TM01gr
	RI2tbpICFnjCWMeQyfhan5bpHcnden7Z85YzrpxIiTB/aNtgmTyG34tPTpwwZALq8W2/mgoSmURfd
	6gULjtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1I8-000000077jO-0Uw9;
	Sat, 21 Dec 2024 15:21:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP1Gw-000000077YD-1GPg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 15:20:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43675b1155bso4192505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Dec 2024 07:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794404; x=1735399204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V63wJTh9Gpi5tIJqemgexT4IewcNUrEcJ6BJ9DO+IfQ=;
        b=YSkY3kpPWpwA5kj/ES/ImYvlA46p5JbCU44GZBTir7LdFV4plHpwPaL6bFF1s/Iuwy
         2uzJn+g2+KVRVgOmOCKtPVRV3Nb7x1tysleZNb1CNK/9Jo0OSdD6j5zcxKYRfbcEoK5S
         7zbMKnc5af66NfyViulIZrI1MgGevPdM85o7Eq0RRvp7owVj5GTURQjp0RNa4h02JYva
         bl0nLCV2vyzD0Aw8qrzIeOFQPYibn0cvFsn+BVyrLzesVi0ICqK80eL9GcaZ9NIQ5DmV
         SRZuKN1G3pCKUDNvXDpZnnvFArFTzF4/LTdTaaFAx4QuNmYOYuZj4eD7HdPfwWJu7CX2
         yrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794404; x=1735399204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V63wJTh9Gpi5tIJqemgexT4IewcNUrEcJ6BJ9DO+IfQ=;
        b=SzXm6IAIXmyndHNtsdP0I8+tIRLZGkk/eXhB1Q5xiZgvpsvWQFUjLiFNox8LoI9vy1
         cZViB5ecE+P2uPkik45zRpyVySeALsRO8PzvXxbMDDeVISk1mRybEajxlMrBT8PXCfwF
         rp7VaNilEQAi76GRVQHLhxRE0MtRwUQqnnnFwAt1i34vzEVcS+ccNEzi5c0dhTGMJa/N
         OpH8rgQyob6l3pCGDXHqSNuPi0qJJNlSjHNzvyGixTB51ZIPaAUouiujbdvrWaCAu+XB
         BCnwnSIgNb8JoobwqVOU2IqU1FbOJy5R4jovPRwVtdOfBxN2TFxSuvHBoqkT+P8qtS22
         Iw4w==
X-Forwarded-Encrypted: i=1; AJvYcCUf2iqUkYgCCoLbNvWarvUa0hVUXkr7K9YM6AaKQFMEb5RvkxOfEOWNItdYjfi907Y5LFbBaDlsyCjOzJC6WG7M@lists.infradead.org
X-Gm-Message-State: AOJu0YzvatPFXpxm1k6kPLKRn1a22LzrUQcJhTph1+cQY9KbMWghKqC2
	lzYrap6D9iECF117KZjTQbByRDEJWcf9zqiZt7SYpXDadKmqv8A3
X-Gm-Gg: ASbGncvSlky4/DSr5bRPlEURnEGjaceq3ZcyVbbqro37lujDNZVwVk2yzT2oEnF89fR
	yRc3IBPV/8X4RJAghX+V7gVs5Ci8px0JA+NT8UyR1Df36wkr7kZ4QCBDR/R/aaq7hZzfqj2Rplw
	X3zb5MVgoNHFGXNeU4Zl8Dln4BcdBaBFMY0jR9dw3rguix5OXsg0touYW7I55lK0M5Iu3YWlzE2
	rjQ4Uwrj2OP3HHE8tCf0X9XosEccQqTHH5ly0UK5OWC9E1CxzW4/7PYnXujhFBM7ZNrdzfMg3DU
	Pyo6fiys1si/PEuLNqjJoK3XIY1MaMEf
X-Google-Smtp-Source: AGHT+IGxUo7d6FmiNUMjFt1hGCs3bvI+XiU2A4CUZREyhrBfzG+bNHKkB22GLvnHpEEmmpCAj9pj7w==
X-Received: by 2002:a5d:59ab:0:b0:385:f220:f779 with SMTP id ffacd0b85a97d-38a223fd11bmr6377994f8f.49.1734794403720;
        Sat, 21 Dec 2024 07:20:03 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm6629046f8f.65.2024.12.21.07.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:20:03 -0800 (PST)
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
Subject: [PATCH v2 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 21 Dec 2024 17:19:35 +0200
Message-ID: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_072006_367938_33A9E3AC 
X-CRM114-Status: GOOD (  11.21  )
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
available in the device tree.

Kind regards,
Ivo

Changes in v2:
 - Dropped nested-if in the binding, keeping in mind we'll always
   provide only a single clock.

Ivaylo Ivanov (2):
  dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
  i2c: exynos5: Add support for Exynos8895 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  1 +
 drivers/i2c/busses/i2c-exynos5.c              | 31 +++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.43.0


