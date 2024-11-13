Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9825D637A3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=; b=JeKS/t5zGeTad6
	m8ML+VBjpXhduM0ONRs3URbLO2b5ceaiToTVmJ0N9JNTqsD2V5C6pP3aFvDowWoX1WfLfAatd8dzj
	6I7eyu7O3QgdJWJfzQsAJQaNPMW7JMpYoCLeNCrq105zrdL/YxV2YCzd+y+pnqr/hM5ButPYNdEug
	1HL4C9Ef7MHeDUlx1K9wb8dtFiX+DHRAAKmb+YN6EVBEO6O0A0CmkMFbsHqFZHD9IpNpSgO9koL3G
	lvCrQHmzpTjD6IA1Lm3wyFbuIdQT0JdK8Z9wuysY2bA+XTsijmuxE+sRlk7QuJ5wmROeAdSRZYWJr
	lruaNpEJwpro+b46Gdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBI4Y-00000007hcH-030E;
	Wed, 13 Nov 2024 18:26:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHz7-00000007gtC-26pJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 18:20:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so4423802f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731522056; x=1732126856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=;
        b=lu2TWfmFXPevTtCYNH9SlH/cU1BrDPKPVE9TnFnWm/xOFvCWL5vLwGaM14MruIwXxI
         rU+y0eo2SBAxU65AgO6iY2TsEwob1IyinSOkDsK4c0S+m0Q3x2rDLHy23eLmDr6UeB+u
         C4cIxkTNxOiWhpr8NbM7bMYv38fXU8wRjRoVZ/rTOYG6YDaCvo1O4r1W6dg8vVeUFxy0
         TadCSqeCsZS/SRwna3vOjZtFgRH4YNzILe7K3FRs8L2W/YfOTWVVKcck6E07efj40dUb
         jGoEwgt+6j2V6eiKSAFmwYmZJM+cJIMD6ufU0gsaUPB35fK4sgnMDpCDQQ+gFNiY8Jtb
         XwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731522056; x=1732126856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BFavaAaAPBK1zdTplun/3lQN1DVlUK79cnZIlxUFoo=;
        b=dMTrxlULvA7ihfQVRzy/TNI0t6LzmusGnOpNVz3CWBMaXkm/Ih6P91mong19GBU9uk
         VKaXS4AkcSQ1+ORi4cMqpkoSmuwbuHJsxPWmkJd8QhDV2rCXHIZHgtDI29/7GvYJ1qMn
         P57L9/U/08ovHNEoKKU0Acf+0ILG9bVCyE0Icwcf4RIwYAVZ5v7K1biTbxLKhY9lD7FI
         k+Tfi8yEb+iYhDciQm5usF9SfwxQPZLr1xZZlBDCOIOd2AKIvW3nTA3XkRpcqSx/Xqv7
         9xoE8XkWI6sf/MD7IgV82c1uwLt/bzQYYQ7MLhxLbzyKI1bgomh2QYthBQYcBSSESkET
         YK/A==
X-Forwarded-Encrypted: i=1; AJvYcCVy2zbu/ABXDB2xZyCSozmX/5HIUTFcvUD1dlBm4qmQMROhZkAQ2Lf+BCgf4HjbA7CnMX+B+4LDUmus0NKFGX5O@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkj+or0QuZ374IwqFQY93kmy71QiQkwvMnn6Y39HNyGxYlRAMp
	6nBjhHlQCUKOnv7nU0VLpMU+PwJtHq4dyEfSwTJ4kIoAnIqjWK8S/IKDAs6BqJE=
X-Google-Smtp-Source: AGHT+IEsU1pa7lAwPRKXaWud/Ylc1h9H/a+DW7TRPX/WCZyVaBRXwly5BC1hWgW2sielk9MShKXvEg==
X-Received: by 2002:a05:6000:2aa:b0:37e:f1ed:67e8 with SMTP id ffacd0b85a97d-381f186dd5cmr17209038f8f.35.1731522055625;
        Wed, 13 Nov 2024 10:20:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9978c6sm19009502f8f.50.2024.11.13.10.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:20:55 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Subject: [RESEND GIT PULL] Microchip AT91 SoC updates for v6.13
Date: Wed, 13 Nov 2024 20:20:50 +0200
Message-Id: <20241113182050.2176500-3-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
References: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_102057_563995_F3BAE02A 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.13

for you to fetch changes up to d1312c5c06f5cfbed55207cdef4a319015042579:

  dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible (2024-10-13 18:33:02 +0300)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.13

It contains:
- DT bindings update for the SAM9X7 TCB block

----------------------------------------------------------------
Varshini Rajendran (1):
      dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x7 compatible

 .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

