Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF52D730AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQTw2Hn7kVK5lRmBqgqs/8lbK71TYOhM3LaYF1mMaUk=; b=VloqQhyrd5dWTnLTnJHBOS5a7p
	cIgJdmaWd5cOdRTetn0e0Z+v//BXeTL7Zob4B22b9kbzcFuXLqMGqhHGfhP+bEFcoebs5R7nbfyd6
	bMOix8RR8ZON6egdNji/GpiPl8QIkdfKFDbThR9jo75GOWwk0OCiO9AdNWUIyQvwbeNCd2bB3bb4V
	Xiee6JdajQ8GaDg8q3W1JvReLAqhgiovcKVwCspHLf1f9gq2DSSpa67RmkyVnn/Jz2h9cy4PV5WZ0
	0V4KC6TzbwBLaLwxWYczZGBN9Y9/Pjx2LuHekl2zTV0JnsMWjYHUUZIVNAoTC/sXERwm1/3r4EHOW
	pe6R3nMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YYH-00000001RW4-2rxX;
	Fri, 03 Apr 2026 07:02:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YYF-00000001RVF-0ixe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:02:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso880728f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199761; x=1775804561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQTw2Hn7kVK5lRmBqgqs/8lbK71TYOhM3LaYF1mMaUk=;
        b=PL8Yz05AmncY3M6BmzCFv2BuPOwwtskyxk0dPwEqyzWT6Q2qlqUoLcoq1FW1XCMUKJ
         fz4uJDk1wcpobDDj3G8dCzBGSmZrIYPcc+Z+LAH9V4+/y8t8/vGt9VP0zo07VSF82e62
         L7SiLn7mAh+Hx5V6Yn77RAYuBRU9bvUP/Z6tKHrT6b6SpBcx3bXLVtVdYqHAoqG5eaO3
         iwmHk6o2QD0GyfdAOaaAJtP/0avNTGA8GvnAiGLDl2yV0hk0/ir9HuTy4UE0fKBl+tW6
         apJB8+HtaErypDWE9s96/jt08INNqNX+qLqdCgH8aA9T5SQDkSD14OpEZXkkDo9axFJt
         Yt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199761; x=1775804561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQTw2Hn7kVK5lRmBqgqs/8lbK71TYOhM3LaYF1mMaUk=;
        b=C8QN6M6N6QDdHo2C3TJU8EohNgX3p1a3Szy9SNbzWKvhNyPMBq1KXnRJHgSCvsHPDf
         p2FCoZBOPDoHpRrP/C0pnFG8EBIwPi4osM0vEfmbvLcYY5JsLs9CXRFp874Vggc4HY+r
         SgvRsFkdYyOk2ClPBlr+vcj3/MsjPvHIXqK3hRwln3Atya3BVVkeauFKJZOs4vtSJfTE
         uVqjJlNZlf+68EfSg1tj11N+mWEJ/O97j4yerP/UvGkJFP/aGT3EiFrxg4reQdg1y5OT
         tCHz/8h9V2hQQb7kmiDX14pokYdJuxBv3dgBc3F29tk3bijoWCQ5dviBj2rM0vLXtFL+
         xJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgH8Pz0s9a5I1qp501Y6/pnq3TArOx0a7KNfKIF1jt9Ydsj1OTPK0n13LjJtPruHYRZihoAJxKOgAZf1e0VbaB@lists.infradead.org
X-Gm-Message-State: AOJu0YwHa2JfWdVystah9uR1d5VSxSLAljfA8VFVgwPx9To01VJH2PGU
	IpvJoZkzK1Xe2IqkM0UGvIk1/ZkmjgONEFbXu41GIDNGxtW2R5X34BLd1cQ1U+Lf4FY=
X-Gm-Gg: ATEYQzx1wO5P4Nc36JaRfX/6cBQ5JOrMqrdJca6Un5ClfbT5L8hl/OXk/nYqC8V39eS
	9pw91iu7eF8nykoH7p5HzAizsPHOfe39DddM8V+mnZuUwu7SgfgdhQzaCt/+REvmmnL43pum2Uu
	uAQvRlBxe/34M+HVuuLsIgaFsjLKmaZHg8BYJQ34+8rWXE/Tyxe2tLMqhdzJYBosJ6zWWXZis6I
	J5H8UNchQlAtTa5am7VpTNhtb9COADSaXOvOy1JhdiKWj/VIzJoWYK4wXrNF8Vbx6s3GWcWGVuE
	MmVCacLiAIQzoQx5wfUXP4QytG3IEufeCoS0dKbTQBpYsi+nW8aWUdRdbLAq+g1hG70m7NKasmV
	KWmBF12ZcYjAplWCApIFtV3MQWzodxeL+A0Ew67T4RBe9lNxDt0jlGjBUubc6+p3UM0cktDcasf
	wxmpftPqGZAqd2Bfv6p8mEqEdvbXWQtxSk3WOE+rbv+A==
X-Received: by 2002:a05:600c:5292:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-488996e0891mr29430855e9.5.1775199760936;
        Fri, 03 Apr 2026 00:02:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm409275845e9.2.2026.04.03.00.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:02:40 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v7.0
Date: Fri,  3 Apr 2026 10:02:39 +0300
Message-ID: <20260403070239.2552455-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000243_370233_A61D2C3F 
X-CRM114-Status: UNSURE (   8.12  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.0

for you to fetch changes up to 907150bbe566e23714a25d7bcb910f236c3c44c0:

  ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB (2026-03-23 12:54:24 +0200)

----------------------------------------------------------------
Microchip AT91 fixes for v7.0

This update includes:
- fix gpio-lines for SAM9X7 PIOB GPIO controller

----------------------------------------------------------------
Mihai Sain (1):
      ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB

 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

