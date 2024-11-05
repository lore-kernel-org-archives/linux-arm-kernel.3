Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6F7D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=; b=ay1urctfjMG9cp
	tEaVRKkEBElpsnKRnVDhWT+HmclxDk4dM/AanxiCZTXcrfUMWWvht2TeELkeGcZc6kzpUygUrPM7x
	v7EnVe2FFrz5thA0k+vMmRQoHxOxxInLdXb38q3cdBq1AKjsozpUOp05x9lMakcC6Lv4RsiUf8Sun
	9W+wPU+WJHPtVr1PXxHKovyVWBauMtNCB0cfiYkWiQZWWEpgqCuCIJWJQMJohV6VR33IqS3OdOW+F
	AkFCYBNd36L6vXhDgGqJDQtWheafyH/zq0oA361YUrptbCT5WvmMFJKQXeLTP+S28UQ7n7sytMKVW
	N2uSvEUSBdXvE9SwnVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EzV-0000000GLjg-17oX;
	Tue, 05 Nov 2024 08:32:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EjM-0000000GItV-2gJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 08:16:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4314f38d274so61131915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 00:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730794563; x=1731399363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=;
        b=pcFJ+82XG8rA5CFKv/u6zkRjJy0ghZ+KJmli7BK6eD49sjC3j6+mXmuQUiqWPUhmjq
         9Of+lv3I3wimD3TWdj6K1h6M1E1Hp48zEUr2lYRsQN4bTiPMCbFP9EgoZ7FVrMsyHq3t
         3vqWs3uh/LdAHWodvhG2+dYXhWimyqgKPRUmst1WGiS2WQT0CR3+hePqelwqv61yOysS
         7JeiMt8j33BSNuDewtTjVZMZUDzCQuII9hW9XGBUyg81h0VQTnaBPwfMChf4+WKCEa+/
         GR4G9GbGdbhmmRU/BsVO+rF/+Y4LhaS4/xYiQKrHhntTS79ikuiUoikj6BbRvUJl2+9g
         rWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794563; x=1731399363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A+bblUKXABoYUlPZI2iItdxBnj1Infm3G3V+PNL0sQ=;
        b=jtCV+0r1cMQuG40bYTCJ0q8CO/Y5ggby7G7Kya8F/3yKOsFoRJQPzpuMMv2Ri5EtPW
         oWASGOeT8LECXmYWC0S6HJKEY/cLfJCbmhHVu2GdgEskHd5oWxjjk8pg8h40wA6w7p0e
         kn89XfKh9ONhgYSh9o35yUb5BXfl5mRik+FA32JwQZu6y7GX8RFP+wNW8mOc/u/rMeWK
         Ojx6J4YGOEmzs5jOIFLWiNO2wCla8F/nXDC7PFBBRdyhmUC/ZxfZBz0iJfn5diW17j/Q
         cnqKfhjjoKRAa7C0w9XdYK4zxqS1+dY3w9XemokOxeG/tEt4rggzTZlZQ9eHStcZsD9h
         OAxg==
X-Forwarded-Encrypted: i=1; AJvYcCVRbWb1aYD9UnWvrYckNLyKpehDfH98j7WIueTCjTWKtOXGq7nzQpRtFoaW6btlEwKGT3rNXS15R2+EzE6OKaXJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzcsjKDYXx4Xr/d0tydjacusJPWk/IcgzidVJJKQB2LrtYxde+T
	NWNJSQF/yW7m3U+mp1tHtn02UQ9ZOiGsJcDcRO+9Z9j74amhaqZRu8IkNNZAWI8=
X-Google-Smtp-Source: AGHT+IGGHDG545gM2JDgnkR5XBYlpGW7v7v/vAKLvbWZnC7J19z66NkFXEMkC9u0Fk9dGZqbFO62Vw==
X-Received: by 2002:a05:600c:4683:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-432942dd802mr93805705e9.3.1730794562617;
        Tue, 05 Nov 2024 00:16:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917f0bsm203801475e9.17.2024.11.05.00.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:16:02 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.13
Date: Tue,  5 Nov 2024 10:15:57 +0200
Message-Id: <20241105081558.3980044-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241105081558.3980044-1-claudiu.beznea@tuxon.dev>
References: <20241105081558.3980044-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_001605_251738_B0BC3FBE 
X-CRM114-Status: UNSURE (   8.06  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.13

for you to fetch changes up to 07891907687e3cc7e0659fdf5fbdc816c97ddb80:

  ARM: configs: at91: enable PAC1934 driver as module (2024-10-13 18:52:47 +0300)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.13

It contains:
- enable PAC1934 power monitor driver for the Microchip AT91 defconfigs

----------------------------------------------------------------
Mihai Sain (1):
      ARM: configs: at91: enable PAC1934 driver as module

 arch/arm/configs/at91_dt_defconfig | 1 +
 arch/arm/configs/sama5_defconfig   | 1 +
 arch/arm/configs/sama7_defconfig   | 1 +
 3 files changed, 3 insertions(+)

