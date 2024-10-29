Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9323D2AB2C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/XbmEWC0pF4C6y9sizpz5a4/Nkx6ZhAqpplNpnUb20=; b=eNkhY7MloKZ0fU1McU+0QU6FOO
	BquatKo7CihawDd5x8e6/oN/iJObqozi6QCFyS9fpEgYkMaCdpGOXxWc+SYzvJR4KQV5BJH/YJBwK
	dhwslp3i6JofS+42+6TySw2bA+Vh3+5c03+NKPXUg6jbbDgM6FTodOCbA/c/IbXtldoDHHEgrUJln
	vha8N/t6IJ74q5RDMQr/JAnlwHp3V5QsSKe11aqS9VINO9bFQpEzD1H+CGabMMVfuQ7LZTKmaW/M7
	rtekAXjxf8soZnOn6ARQ1scSTmq2Kx7mBWPIo7P/XuQH2nifS6ntZ7hyKxZ8cIzIJBJ1lviqs5j2u
	MbeipxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tMe-0000000FuDc-0rQz;
	Tue, 29 Oct 2024 21:02:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slU-0000000FlM2-0eNq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43152fa76aaso4884805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233470; x=1730838270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/XbmEWC0pF4C6y9sizpz5a4/Nkx6ZhAqpplNpnUb20=;
        b=dkX0Cs8LoeFICpQNxf9p8ZcSqU++6BWcbdJT7TSMF7n5P1wRGZqXL24daFmE1JzgzW
         iHmYbYrPDyXDWEm9DjmCl648Vtb8p+HKdr4sb4H9KD2ZtwmTLWpLPwMLsP2/6M4BrzVY
         wX1gyMdb/KQDPoXSkzQI1vVS0jGaZcADo5Q4P0eU0BFROCtPfGFd7Gjl3vwCJKWDohBd
         tNde2hj+9eASqY6ZJTuBmqsTpBWiZmrOyLAY0CAF23nJRa5z/NacH5AIZ5Fg9577CD8c
         kgV8I/m29L0rYGLQcwIF3KTumVhSSU7hSB84ctZgDnRKUh8NAaMRJI6BS2kDdusMCqad
         9xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233470; x=1730838270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/XbmEWC0pF4C6y9sizpz5a4/Nkx6ZhAqpplNpnUb20=;
        b=t8RWbe1QCDTAlNfo/ezJTz1XkYbSjIv1hWHMn+2PS4abmI+2InY3erCc8mESNMjBLg
         50sfsepqg0AHpkS1VXdfZ1GA/th7liJnEvLynnA0wW+UdUOybYNMJY4gGp1dary+INIk
         f98JHpmaaJ/fGGgdXQRR2+muT40a9lUgyAjk1Emq1ZwqiwKiWOWNB8lW1TD078reU9n0
         rmbuzX2v4lp8OFTA4uzp4PEeGxE3JRcghSYqiDI0Wo5SA73kTLy3qBhj5syGE3lX9J6B
         7kagrlxibJxf1pmGTk8eWys0THddXDv1K1TXoFGiwwBDzeNStDMunEBtKnNEJ0mrL8i4
         QFig==
X-Forwarded-Encrypted: i=1; AJvYcCVJTBlfMabH9ZxH2OEY/a2mJHZ+LqthoJ0Q5Td4ECHgbRsuaxwyKumEZna5fqjrnJbJHW88rayVoIuSgU1AGGZI@lists.infradead.org
X-Gm-Message-State: AOJu0YxyXeR6+fG+oxw0R2b4eGtCqe83BP3qgzjOo63jW9BY4T0rLnAg
	vwrIDhc8xuylWN1v3BzHWWMvP5+rn9i2a3bghf6RHz2lv8j1Yml0
X-Google-Smtp-Source: AGHT+IFeavUh9Ar+9ynVIaIAr6yW4KMEe1TsLPjWkPYnSTeBsy+x87ewnsyJPz2/5d7A+QJihIa3VA==
X-Received: by 2002:a05:600c:35d5:b0:42c:aeee:80b with SMTP id 5b1f17b1804b1-4319ad748cfmr49058445e9.8.1730233470329;
        Tue, 29 Oct 2024 13:24:30 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:29 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 22/23] dt-bindings: altera: removal of generic PE1 dts
Date: Tue, 29 Oct 2024 20:23:48 +0000
Message-Id: <20241029202349.69442-23-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132432_218098_7ED4DA01 
X-CRM114-Status: GOOD (  12.07  )
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

Remove the binding for the generic Mercury+ AA1 on PE1 carrier board.

The removed Mercury+ AA1 on PE1 carrier board is just a particular
setup case, which is actually replaced by the set of generic Mercury+
AA1 combinations patch.

In other words a combination of a Mercury+ AA1 on a PE1 base board,
with boot mode SD card is already covered by the generic AA1
combinations. There is no further reason to keep this particular case
now in a redundantly. Thus the redundant DT setup is removed.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 51f10ff8e..1561f0164 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -31,7 +31,6 @@ properties:
       - description: Mercury+ AA1 boards
         items:
           - enum:
-              - enclustra,mercury-pe1
               - enclustra,mercury-aa1-pe1
               - enclustra,mercury-aa1-pe3
               - enclustra,mercury-aa1-st1
-- 
2.25.1


