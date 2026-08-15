Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA94AC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9w74tm65Ydq9yULfUeCQRvZJJ2X0p9Cgc3vMQMzjE18=; b=EyyFLDpQznAEU0PYpLUQW15t9r
	EoPck0YClEMLTVBwlSgeu23mIk1G/0FqZtOnU3DENjtZwH4410dkM95J+nB3yycANw+thNoLA+P46
	1ZFc9PzCxH7nzMaAZNP1mIh5H13pbfl9tpxAl/53RxP3lr8BGLmQZzS/8+5xBoGGXgF77j+SLmFBg
	ifLzlJrkHVxJdH1hM87Vnk717+G+gFMYkp0UIeWYbsHvMUx1H3w0Z9qpfIWTxM2nprno8HEzy8xj7
	CozL5emujrlBsG+iDuTiJoAMnnDMjLen+4qT29aDlQC6NdOouefS6O77whJLzUZu8G80Ld///qHRj
	td80e8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHE9-00000003waT-3ay6;
	Sat, 15 Aug 2026 16:27:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvHE7-00000003wa7-1lbY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 16:27:20 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1189578a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811238; x=1787416038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9w74tm65Ydq9yULfUeCQRvZJJ2X0p9Cgc3vMQMzjE18=;
        b=GyxIK6JzIQ7n+Qti83BG6bfv8RsoR9fU7lOV61DCSUrfg8SdPqS5SMYDCZrDB+BncW
         gtxEZRAFKge9noEcdqzrRHl60tR3SbQ8I/+JywFQdayXRN55c7qP22XfRrRI9f0TryiU
         jv9HcZ93xpU9QzW4jldV5hwaDfnt3REt+J1lJs6Jpqs1HdUn9FKSP0RzWiSayZrUcF/H
         cYUqlQ1HvYOxIrPwIHe5wAhquy+QrM14q+XjDsh2ndoOhggGcA70ipV5+Z81gCSFwfhR
         XBXQsh00cIYAVZKwOC35KM0d8knf5y5ptrTaYXUZlwNRIJp0/E/Gv9BqStu5GFpZFBLt
         lWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811238; x=1787416038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9w74tm65Ydq9yULfUeCQRvZJJ2X0p9Cgc3vMQMzjE18=;
        b=M/u0blH5JC/HBO19QRFvFp8dJSrheEmnkXlFfrukH/hDhUBXZzTwovK8l2mkMsV6ky
         y/xspKpSjTSOlm9aLYYKp8V1gvpHCSxKhzBY0lwKS2wBWVUjVkZDNIvjDvvZ4qWrv4hL
         ZNXwHhHefcFOGKIXf6N+4nGWjFqmQpqwWYAiWS6ej6pFzyBakUDCC08kOdnRxPSeqk9d
         qbHL+anqU9lBvnh4mBaXf/qQNOuV5SZizN6wkN1NXMGtUGucZdTAYzIcWUiMiklhhDPA
         RNG542PAHxA8MKjGBlxininsIol9ydwaESaryZ+gqnwdJvTTwVqJ4015hh+ItJuSKMhr
         6ptw==
X-Forwarded-Encrypted: i=1; AHgh+RqPoETZdXsjCLr/i8psNHTgFRrLDtuHBYbBQuKCvNSBU/nFWdsIKLYvt7LWgPKse0XMv9CL2ZTFIu2EaqHP2NJU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ylxS0ie1Rm5xMug2OBEzExth7dmdL30U6DwmqNln6UdVfljg
	m8I/m2yfDBo6nhx7F2DKTICsaUJ4RGafLyodp7E4eyP2baR5j8rxMw4h
X-Gm-Gg: AR+sD12PounJTJGrlt6wyGSfmq6zy8pcHMnj+e/ls1HovhqL5ravygSCPzufvvp95hE
	X/UIAGqL44cSNTr42ySik/kc/oOiXhR8gLlrJrUqd8aoZWfArc4skmLDOHyTgBQmSgaQgIXg24F
	cYfqoQikLxkdablsGMgUAZodYo1nz/7R/axDr1cvgTi8UoXIj8CKwR5gWPv9OX1NtTOG7/bE/gY
	9mHpY0K8V3fdj/KfenJmQo9JfyTlOl8r/UoQyVjxdQR0aASZYpT61UbrcQh2PUH4QFj+4tzKHPx
	FgH0LkoEfROIGvmpw0kVsg8OcLOTPPkLhY8mvhnGhpII7Gk2KlGrn8RqGg894uqGbrNpCe9GtWJ
	7XO8it1vlKC/exWKstDwdmYdKoueJeaYFpnZviUJ/ESMzSSEWWy4zNFpZ2RsKbdDTdBKLINKbyd
	e7nbdomAXuJFc+PTRPgrw87LxNol36t9aZgUGDU3kxNF+4YwmEZ3J8JSojrPohkKTAoJZ7F4A6f
	G7lnaYT+CXHdExLLtd3C7mWLCNAQ1cv
X-Received: by 2002:a05:6a20:c88a:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3cc71de5b92mr17397279637.34.1786811237526;
        Sat, 15 Aug 2026 09:27:17 -0700 (PDT)
Received: from Ubuntu.. ([49.43.242.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm36427232c88.8.2026.08.15.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:27:16 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH 0/2] ASoC: atmel: ac97c: Fix IRQ handling sequences
Date: Sat, 15 Aug 2026 16:27:04 +0000
Message-ID: <20260815162707.353893-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_092719_460806_08849889 
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

This series addresses two hardware initialization and teardown issues in
the atmel_ac97c driver flagged by the Sashiko AI bot.
The original report can be found here:
https://sashiko.dev/#/patchset/20260530052812.115994-1-manishbaing2789@gmail.com?part=1

- Patch 1 moves request_irq() to the end of probe to prevent a null pointer
  dereference if an interrupt fires early.
- Patch 2 reorders the teardown sequence to free the IRQ before disabling
  clocks and unmapping memory, preventing a use-after-free.

I do not have the physical hardware to test these changes, However, my manual 
analysis indicates these are valid bugs, and the series compiles cleanly with W=1.

Manish Baing (2):
  ASoC: sound: atmel: ac97c: Fix IRQ handler null pointer dereference
  ASoC: atmel: ac97c: Fix use-after-free on driver teardown

 sound/atmel/ac97c.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0


