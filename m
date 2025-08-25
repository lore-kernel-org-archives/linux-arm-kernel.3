Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2BACA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=; b=XHY1S71jtSLL/Ou6j+vfYNqWnM
	SpfImCXEP9euNKk+P7eAJ8iJiT4B/Vf4VQ7GjkniWAHA+FDHbGB9v1N+k/k0eIy35iyYRJ2KKQmA8
	K/G1kuNgw8O44VND+VeQuvFpcyzCNVRJIvbLjPSge594/XTDkpSF4ljgZnNGOt+SnVhXB3jJGdcaz
	kl/niCuaoMhHviEBJOMNGzMC2wZNG54r7zDdwsgEPvLtx8s46uYT5LTqHSp7jDO/FytkfsIry+7+t
	yLul0MG8hMEB62PZydLzLXoOm2sMDMYz9MF8MKS2A7H2H5W/vvg713pxXaxEvJ3iJ4tzJAIMQi9Qn
	yryzWxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaD-00000007n4G-0RHr;
	Mon, 25 Aug 2025 11:41:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqToq-00000007Y9x-1OIJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3c51f015a1cso1948862f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115331; x=1756720131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=dOF0x0uqQWseJkXu3ouBv7XFE8YFRKiD4eJXWfexHeYM7rzHeeC9E2+VwY4pb/zssZ
         kTEbXSS0TZQkI4THU41goWGRMnuHWwxZDcz+FireFilMXuNV69eBaVLROh1FV+f1VhTV
         jQuKLN1zgDyHG0xXI6jAJvs+O19oxqaqf2Mig4ixjyy2JwBVrVPxm1lWCxZbOGqpc3F0
         b3H4sk7n/BZa7qZcp2AhWair4hmgN67KiYK95Yw2bQHAPrn5PSv/CK/Sa3TbOuFReOIx
         goxBnL61gDwi15mrsV9p/XOstfAtzePeL5uDkKBE7moRMQemT1dMVBEeOiRFj7eAUi6M
         KPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115331; x=1756720131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=Rm1aOxykYaZRuUU1UkcAix38lnjT/AorCpT4Wg6a9bnAzFeI/pzxS+iDgQVia2KmIc
         fFPH6qibuxdPD2t8E8JB9jWBRY4H2bIk8MiczmK7J3v1Fnh8MmNRFrtGD5MRalkTS2J2
         DlE28YQCCf+y7qxbVPRsigohk10Ma3fBzapGeeDHGlJdEAAaaolfn2ymX3rAq6wLf2Ay
         3ZuXDgkKBHehVRq+n6xNz2ka5885tbh0RVpFXl6wJwslYGLxYZdKjFmgtBkzHBhwKAVv
         FFrIhICe1NDN2RYH1MtefN0ECQ95BQJ95OlJbTLBMOGsounPG6RI3gnGZ4+Ghuh0QXjT
         xonQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2p9ol9nxVQeZsz4BsddRMv9+EIEyGheaJe6uZ6UBUOkzVZgrvxPHPSTezqthEbryxWInYEODpXaMKRwgAZHcn@lists.infradead.org
X-Gm-Message-State: AOJu0YxY6PmAjgmv7bHqXicf1fPXi5UcWqR/kdkNiLOV6Cr0kEZI+dGw
	kaOsPAe0ldM/tB0GBS8t1VaoL1+g6z8s0yYTCt+HLgahWAZQnOgIZVYhuN8+CD/KiL8=
X-Gm-Gg: ASbGncs0OvJWMa6vXJi2brrbV/GJcVHbN5CwnEMELCu+49fnTm9/U5xXJaYU9tluqv6
	O54gCh5NMPpuZQ26Ly4Yl/2GVZSKESngtKq03ahxf6BbLYcDq4xQSH53JhkHVb8POWMLNtTHFkg
	Kh26RJrfauJnvaIpufO4QwJvLoiTL/GXu+hik5OhPp4DwNmGbU6rRYgteBLNB93g1TQoLS3iP/V
	ubGRgTQ3a+vCQJ+KOFFGz6G4m6DTsZm7RrWkU+jQpT7UAalceATOZRnKLTE6DI8YYLrTrilpBUR
	gH0LAYmCd98bbtqTnU6IpOlHbDlsZRXgArwixrJlGYDVcDmw7fSTUD7UqGmJaypKbeFD9Pax2v+
	imeL+FERC5zwR7DFbjFZNYyuFRDMQ
X-Google-Smtp-Source: AGHT+IHWTHIcMhEQ5HQdM6YoOeolJohMogAZDIPB52mBaKmxTUaFs5nkdQ77PxRV7ddsa+Y2+klbLw==
X-Received: by 2002:a05:6000:2b05:b0:3c9:9ec0:2057 with SMTP id ffacd0b85a97d-3c99ec03013mr1335028f8f.24.1756115330763;
        Mon, 25 Aug 2025 02:48:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:42 +0200
Subject: [PATCH RESEND 01/14] gpio: generic: provide to_gpio_generic_chip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-1-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF9StIdV+XMb86jGojQYOxVC3O+FG2OF+hdT
 i78Cbu5/oCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfQAKCRARpy6gFHHX
 crWhEACncvMwkOcPwHAi9aj2OHDq7X5SHxv8s8KrRap+M2V0ErklcQNs1GLob7iWSimgg2QnjeB
 qtJybnFa0IOrpakdguy2J/Rxhl3L3bRl+U2GAabp/gyfdRTE3wV1D4LkuAD37BAfjJ81R8pgHXC
 XUFfK1yQRSp+7Rf1NANuInvx4GYMPqcTWz7Ju8wI1BJdh3R6oTSbcMb6F8+WsQ2QzwUCFYCU+0+
 5XUpZSuNCZ4VHHgLWO58F0hglpj1zAyoPi3lW5c84DCfxfcXRgjbZf68zuXrfIZxNaoE1PXDTK0
 n+nqj2mmgKePqI1V+75Gbv8zLR28FTK/0/EXyERUgxRGJbmHBceAXX2fzFJpvmxYN5Zks/a/8XJ
 g8g5QzjfPG+UnFnGrNSfTEX4gcmuqSCmNITY+3PkFxd3AlVL0NnR0y8ZGf2EEzOJbUZ/exvWBhK
 UM6ox13XeBAuBlYx7ru6QTnvaJNiuLG/6enWBUZusa9cNfbnFNMSEyRIa6o5c5Bfbu3btwMHdmg
 NtiwGbECS+2PceI3NfqmGBIo02UcLUakC3+B+ACRcFZY+Y12U0OK5vAwkEVEChYTsSypiSvxEJw
 cc3WaWYVAUWxYNcIIomXMJtQYPKiUDDGsW37GBu5UPlonio/jlUxf1/ZS2zK43DeordcubSJzBX
 lDY8PScKDVMc3LA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024852_401018_FA134442 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


