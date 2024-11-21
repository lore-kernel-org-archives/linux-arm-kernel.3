Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AD6D75BA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NToX9+BNUIk/wvm1hddBf7K2+ouHu2IvaZpJI3Ppy8I=; b=Z750qIAJz5c4yaAwjAVBYt2fYp
	2ZYrD3kIs6AGtx+HweHwZKus7UO2zI2KRSKjcjRxceZSSibvBFI1PVWMzKvMh1fbWCM+Uj5ZJlsne
	YOzZ5eRYf0OGJ/15yaius52vl6Utps955GR1YT3NP3YxMXEkGxG/zvVpvAb36LddxOSp4oCOKaREl
	05ipLjmT3vw3ms23oLgEpLH5hRsH7Z8AaJjnIqgoA2nNAlHeBi7z7TDfvm4TkwntT0agY3dCYtxws
	gCNBVQbOKSEbMeaRy9SCMyfQb5L8qsLVyYAu0v49unli7vqUJpiDKPM5KdFV8uZ0NauzX46qixblV
	D3RB7YHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxKw-0000000GdME-2Sni;
	Thu, 21 Nov 2024 02:54:30 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxJy-0000000Gd97-2eSI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:31 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-718119fc061so180600a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157609; x=1732762409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NToX9+BNUIk/wvm1hddBf7K2+ouHu2IvaZpJI3Ppy8I=;
        b=HIMc2PEwtQTzojgunq2jLHW6xhdsM/cYT/rVrKagpZ/2pqsD0clQJV97rTpq97C5C/
         UTOYkW4RCn9OJMx/WANRVff2nr3Lwqj4dLMSLlOU+fTEWPLcdS6lNkv9zrEuS75zkAqe
         EKeaNxfXqx2K+QYzbmU50wdh3l0D5D5u8JBaita4e8InN2ku2vMQiQNkdkNz3xXJCPVe
         jhJ71DN2un9avP81o5lZXv9iwoUsmyNOkD+UJ5rbHydmdnjNCCqsPyZbJZ/rB8eN+cEx
         kp+A4tMooV9iTN4fvyK/dgEiaR6gD9nXYHDD1mpONnZwJ4eKydsE9unW9uAaTcoiI5RX
         nBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157609; x=1732762409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NToX9+BNUIk/wvm1hddBf7K2+ouHu2IvaZpJI3Ppy8I=;
        b=R6OenCt6bPrIkhH0p4QyHrSC8RKoq4YTJ7ZAPONrnTI2R76mC6HaCy/p9/9y2eBNNr
         4zaLmUdBktTNozVq1tHD9+7WbRkyhmDw+OWgIRhX3Ot7fqA6p6RkSjO0ExTlh0UHl0+w
         GLEJIJmasT7kcsMXB+9TrfH7VCoEzbvIWLTgNGFiZu0HRkUEfiGjPYh6CNrl2FSaZwT7
         EkGmmGf0BW3DBzpWFL7q+HFPjBOCCZ8x+/80alHS+n3tn6y7hStJ6qxSS94te2s7enh0
         m+rJIUcRcc811k1rNlS8UpCtFo2bfNW+t5gddY71996MtQGZ0QppvFvulqPz7jzoK0ks
         S5og==
X-Forwarded-Encrypted: i=1; AJvYcCUPFJXWkzLxpjxwSlfRPkEJlVSdit3u+m6PUT7SCa4FrFN2vS5tuNOk41L2oG9KeErindts2+f992+WRA4Segdz@lists.infradead.org
X-Gm-Message-State: AOJu0YyTXw9VM83DhWfK8y4zddbKlJEQpGRur8aJAXsXdN5cFD5SGXGs
	Kdf+lc4zcLrCMiycR8p4tjh+hGaCMDsyqhw04mhnOSOiBksaQtxz
X-Google-Smtp-Source: AGHT+IFkbEHHx3XfJszzn97ujfOlcNxcTBfxrOx7+9a00uiuu8u3anBb6MDO613kJHYzHthySL2VsQ==
X-Received: by 2002:a05:6830:1512:b0:718:9b8b:429d with SMTP id 46e09a7af769-71ab30c329bmr5065817a34.4.1732157609031;
        Wed, 20 Nov 2024 18:53:29 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:28 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Thu, 21 Nov 2024 10:53:17 +0800
Message-Id: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185330_672347_5C783BEE 
X-CRM114-Status: UNSURE (   7.34  )
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on:
https://github.com/openbmc/linux/blob/dev-6.6/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

Base on:
https://lore.kernel.org/all/14e1a0f581417d4228aea8c2569598d42b4bd334.camel@codeconstruct.com.au/

v1->v2
  - Provide additional details for SGPIO.
  - Add adc128d818 device

v1
  - Patch 0001 - Harma: Revise node name
  - Patch 0002 - Harma: Add retimer device
  - Patch 0003 - Harma: Revise GPIO line name
  - Patch 0004 - Harma: add e1s power monitor
  - Patch 0005 - Harma: fan board io-expande
  - Patch 0006 - Harma: add adc128d818

Peter Yin (6):
  ARM: dts: aspeed: Harma: Revise node name
  ARM: dts: aspeed: Harma: Add retimer device
  ARM: dts: aspeed: Harma: Revise GPIO line name
  ARM: dts: aspeed: Harma: add e1s power monitor
  ARM: dts: aspeed: Harma: fan board io-expander
  ARM: dts: aspeed: Harma: add adc128d818

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 134 ++++++++++++++----
 1 file changed, 110 insertions(+), 24 deletions(-)

-- 
2.25.1


