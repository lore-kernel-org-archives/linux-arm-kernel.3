Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FDBC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=; b=X9VS4k5U+t13HIvsfRdMFXjNLI
	MakBn0vO4CP7OMxN3nMxoVpBhgN71fFu1IMjmMEsFOdzoqO6q4erQLJcea5fpZsmQuMCYtPQLwGVO
	tXN+rJI4Rqhn9drlI0NBb6kO85RhGmr/Gj39VSRosDOifEQW2aj9RYjhDxMqx1eudb7nfJWceh/VE
	kRWxV7ayiRKN/FGgOJYznfmSY7epGqtlWLRhx8Pu9vk5k2g8u8bf0lfoW0bpb3N197nmBj6WUiGIA
	vai7i7jGgjJ6wdcBDo0mXxcTmI49OU4I7jai5mG4g+rgK2AZ+hgGNe1BWgokmH6W947VrZ1264+Fj
	uTyzV2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzp-00000000JrZ-2K9V;
	Tue, 25 Feb 2025 16:41:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw3L-0000000HY5t-0vI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:36:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4399deda38cso34964735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494213; x=1741099013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=;
        b=c6uTAKqqbPQt6sXtgam2NA7/6H53Y0dIPj63OYwkoCh1D50DZLNd+3DgtxO8O0/oDs
         bwJ30lTDypS/P7kFavQOEV4b0lHvgIuJpLts/ltw7f6R5ZksPhwaUHXd/jVAqDfQ5A0R
         tvpKei/A9Wgel5XzMEz+V1U7H7RV7RAZGPoNA70kuY9XI6Dc3jfFvegcthzeMEHY/MCJ
         dywt+96u62pA/cZhetLB2IFuQ68q65wZQBiep+7PqI7lSRMfGN94/QHjOYp7qxhC2bj0
         4uYQ8nfEbnRYOS7noDGLoSvjsirNkTCTTB2FnRFfT/sGHptVfqo7q2jkRWKIFsPbJUhW
         sX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494213; x=1741099013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=;
        b=OtRtPqbrAsycMB7KeC7r9f8QkvZ9XZY0DodyCAQ6YP0wJ2Zrzb18KRkLgfq59h0ho/
         N6GiLSnaI3ke4SiyFd38kOWmYNNePoCsq1TZDyW+IpPsE0ytsE6032j5y4XKQf/uSlIJ
         juvq9oiXTQsXkbdzUBQ+Lf1Iwq7xJSZ+05QVk3EsIELIBa2LRMHMNFrCUJHsWpdqh+CP
         5sIzQ4NixiquhvsiMsWnl/Rns1GuSacAkypDyqnjBCkol5Eo0i4yXLcnK0RQBNSYkovN
         BmPlL9Crwjq8Q4WFIkO2kMDYGZaJlHgB9zjp1BrHuE2Men/iRpmO/u5E8ug8wN0ovp6A
         TAeg==
X-Forwarded-Encrypted: i=1; AJvYcCXr1i/zT2C6xemsZbHIdOA6nIzdxgSZ+XgwyLHoq6dGkaraoCV7P6co7J0EkjlyINAbjtoZGLcxlF+im3lM4dca@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Hp4NS4y8AL4B5hyGBq/eluV2ODT2Ae51t2rNdY6ixINThtqt
	raymWGdpS/LBMmhweBcam6R3Dtco7onfGskczl2emzXMpMyX1XOm
X-Gm-Gg: ASbGnctyG2p96nDtWTx/aZXOus/3uVGdBXai32qMQYNKXte77KKj0i2VP77U2lV2NfP
	LmW+LRTcQCwJKdeZGs56kWn+YQu9hVWKkZYqJ6OM+t1IM9OVmr3ydB4aw6hygLkeKpcmRs/Uz4T
	N3DndMQFYSIwoQOt5AevRix308+8wV1h3iKyiecCyWkwQXRYS0tZp+lkrwuN9Ljp+ZvXbIGN409
	Z0zGAiePWmJsAlz0EKRG6wIQMT4C0L+vFTIUmlhuFSLeeePKvxAA1fgay1PWvfL31CZLFWHU4RE
	7j9b6vLtotEu3j2qinov0Pe1mMAvbi6hPVvslVXbyDCuO1yHVyJvvqljUvFVI5Q=
X-Google-Smtp-Source: AGHT+IHqYyNIhjlrYWJKlXkPU9c+6qRV/sFcYlFP3Oo19VLSLbGLfo17beLiyZrjDoc/9WsbiQBXqQ==
X-Received: by 2002:a05:600c:35cb:b0:439:942c:c1cd with SMTP id 5b1f17b1804b1-43ab0f41698mr32827425e9.15.1740494212733;
        Tue, 25 Feb 2025 06:36:52 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2474493f8f.49.2025.02.25.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:36:52 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Tue, 25 Feb 2025 15:36:37 +0100
Message-Id: <20250225143638.1989755-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063655_257340_94BA2C9D 
X-CRM114-Status: UNSURE (   8.71  )
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

Hi,

V3 of the patch allowing sunxi watchdog to remain enabled after probe.
This 3rd version is mainly about code cleanup.

Best regards,
Regis

Jernej Škrabec:
  I wouldn't add checks on CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED here.
  My understanding is that this config is already managed in the generic
  watchdog part, as long as the WDOG_HW_RUNNING bit matches the actual
  state of the HW watchdog timer.
  I only saw one reference in a HW driver, stm32_iwdg, where they cannot
  read the watchdog state, so they start it and set the WDOG_HW_RUNNING
  bit so that both match.



