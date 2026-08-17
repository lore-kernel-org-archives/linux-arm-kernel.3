Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C86C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=; b=B48OAFN/6OW4tAe3ovIBP9vZ7V
	NFVCusuNkk94tx+av6KIQNf44YzuHECSpHFXTrPkB0ofAidJXwkdOHF8zaYbfMb3MSvnutLeLgMzJ
	9jr4LFrcAdKVNIubXwGrYYW+6IErCSYVICvrOcGwHVOxV0YsSB4Nct+f+DU6gQXtdIZTQRSDiL9GY
	t9mVtJZTIQBFKjqyw8PyBiQhxQvQoWPNdJhSXb3+BQ0zuaruvSicCCTu1HASW8ye0IU/35kAmXn/O
	JwjI44e3Xjpi7FrMsbxm/XtYZXj5p+7RTYuD1paPico8YZNY0E+RhlCQztvQ3asjFYUaDbafhc2kr
	yM12bV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxqL-00000006Faf-3xlw;
	Mon, 17 Aug 2026 13:57:37 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxqI-00000006FZR-0BW3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:57:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6a18b91fb1fso605461a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975052; x=1787579852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=;
        b=VqAAo31EqzTjCxV4o4ImwvDYlGF/DAA4+GHoBDqDxn2XzvitY5Wb+oRG2x7ZnBStDe
         RwsATBjzQ+y7H5elGYtlmXdpHi5cqzvyCOkfSe5fEMkOEbm3oXUoxBzP2rsGg784YOiz
         YvYzXvD3SMmlVB24mbpMVGKcxgodPuaVbT15+4FArKAVarYDPATmdIidhP5Gb91vEXYL
         FFsfStFqsf98E/ekwH5yLOcTSfi419goQM2ceHGLeOE2wd6vWjJ9Qk+9d8Xon6Cv+nqT
         LKyI4gSahozdn9DpSjHmkvHJA1WhrWN7m1nGwcH8b3uGaclZph49G5DA+zhyv1vyJHD0
         0jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975052; x=1787579852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4sFYLrF8YcFxl1e2AvAjI7qSfV6fkkSPS8k5RbbIFQ=;
        b=Odm09mAAvv0SUXfVBu9yhiBOMyufy/uPKQIIdDbACVg93ydNMlxYldjGfzZtqpIwGI
         pPhnjQSL8W8p3QeWG1PilfFTgZaiAmbI6rVYcT7a+TvKeoOMoXkNodwJ6FiD6jyIeB2Q
         +OA65+DzkxQvtv67bbLj4Br1vKyYbRTo6u3HtVOG27Xgc/9vKVSWZFgHkcaBNDsr764M
         Ldkqv6C2jTqX6n3HM4zv8I2bXliausy/OKNtZSRQ0UKRS07kLiE5UtjxRNVc+14Iq0Ap
         6Hz0w2IVQc1MkB3YT2kJmBzV6NM3c+jQgoy1Q7uOmaWgl3u+/Az82JWgR2JFhl1p0Vom
         +V+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQYo/q9Au5y3Kq9JzCcGk3rl9MSN4CaFf3gTzqFjM3wWjexq6GqZ2mBWcqUkQyXzrgak3s5yyNFHeEcanNPhuw@lists.infradead.org
X-Gm-Message-State: AOJu0YwQkJMH6J+fg5BKNm4JeUyJ6gg82kuXaYHm3PXY2Y26UxzBje40
	qtzcBQDanCOs39x6oU2zORc9tlBTayuQtA5PsYCO92+iBasB0vuBkr8DN6gNMLZN+cg=
X-Gm-Gg: AR+sD13WSAWqkAxvYFJCjyViUkiXHpY2zqRl7QsvPjtnh7BGPjlc5ljE+MCohmjTr07
	O3cZZOMKcnXG8ziEaWbSGxUrZPe2S9j/vZD5mOmYOtU7ugVYA0DuqB9q2A4Xj0mIs01CTJf7qEE
	vMZVfUy75PYb1N6PEo2Xw9dAxLxszx1un40RO+zJvz+9JG1hCuVEtg3bmvqPBybS3Z/V59E+UQI
	+AiWtv9IV3ERyg+ujRZpaN8hx0bbqBO2Ugji2ElboyEsfbqAlJDUOqOwx6zCB+IgwwiRkdS1L7O
	p4AkHKDuppDzLV9gEHLUf7HkQXTXQqK05y/4Qrd/K7PoSKT8AAS9JQLPE6I2EgNUBcMuXb+V0QN
	PwzXFTRTfj6hE9EuNQkXw2ThPxd1vQQuwyxZfsb2uT6xz8OjHU0t9XU+eZ7iAveD4J5SP+c4LbE
	T5eCSMvAKMv5/atBOtFm0BR9d6aGa+bmNBtGCxZqdTZGDGX0896uHn03kPDrKnOC5l9lq31+LE8
	1ihIKIvtFdgbl3NXTMXQzsTgLoGps4CTv4qyx+lipT5M7FTSUBesTCJGyU=
X-Received: by 2002:a05:6402:3888:b0:6a1:8d3e:ee77 with SMTP id 4fb4d7f45d1cf-6a38a8b7c62mr6178631a12.1.1786975051651;
        Mon, 17 Aug 2026 06:57:31 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:31 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH v3 0/2] dmaengine: sun6i: Fix two bugs in the DMA status path
Date: Mon, 17 Aug 2026 15:51:21 +0200
Message-ID: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_065735_100659_5680266C 
X-CRM114-Status: UNSURE (   7.82  )
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

Thank you for the review, Frank.

Changes in v3:
  - Patch 1: trim commit message to the root-cause explanation and fix
    description, dropping the debug/reproduction part per feedback
  - Patch 2: unchanged since v2

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)


