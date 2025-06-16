Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuZ7ryNA5tj6+VLj2Sq6P0eo79hP3I6BooUtB2sx2bc=; b=q0Nq8peG8WczyH4jD2JZ4r/dGX
	gwIsZGNN/mR3YHSp48XyTU4rbMkXyLnADnxYJmqJP1sSQdqsnZ79Zk+2yoC9RKuLGcbrte/bpljs0
	/cTmcFmG2zu9dsMor7s9Wd8y1PTZjWO4cw/ROM21OvUL24CymuTPgOyAyfvGjYXCjUpfzTZw+ruP6
	a6QFmb5M6WA9JN9+3GTiKGfzTx0vJ0cmpY++kN2XbEnC6sWtjUsFZ8nGp8OouTIvZc4k6AklB7KLA
	JTHxTCQc/L4k7aPTlxQP358Jd7msMQGUf1RknpFFUQSmmk4LtnJN+EzrQQqe9zHQgoCG0VijJyhlU
	yK8vnfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4wn-00000003kxV-0bzt;
	Mon, 16 Jun 2025 08:12:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4dr-00000003htK-2gbN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:52:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-451d6ade159so33596865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750060350; x=1750665150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuZ7ryNA5tj6+VLj2Sq6P0eo79hP3I6BooUtB2sx2bc=;
        b=LPfgzzaWeZQLvhFHOoQmrkp59HserzvxguLPVU7kSegelG2j4M6ZKcF9FndSo4lQaM
         hC2LtDOp6O+edLIpjWeu29tkfxI+WQ0ODSBmiKaOaFqAPWStnXRgJeLfD3KaA5z8zfsv
         BU9oyoDVO94IR+L88UspiYLdvaTg5uXqi57nQHkB3W3tiTq83lIEIcXgk7wVk6j4bKNx
         YJxh5blTaH+7bS6nPeJtLNjscAiDnQVwmdFwZQiQarwC3oAH0YhIc+NhHyi6veLMkWj2
         qhq18Er/1OLIoUSgKZjavCF5D1Ytj+g7ASArizWEVT32UjTyNtIU1tqtvuDM5J7Lu7Hr
         u3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060350; x=1750665150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuZ7ryNA5tj6+VLj2Sq6P0eo79hP3I6BooUtB2sx2bc=;
        b=DGDMtXhbjsil1WxzudM1stRO/NQRGmM/LbACjYypS4Ql97T0ljKtViF2no3THmawIc
         yKmOcbJMhovKQnfdpwr+Pvd1Lgss/ssJYbvYd/g1aLmLD2k1WMWgxv5hvRVSeoUBWEkD
         nyGAR5KiUnOTpOgE6V4TuuxPmosznXe9EtGxnhEGx8XETUbI1Iui0gTZE99K0iiRYRkx
         xWSJBxvqCFjcnWhfZDJ4VytDHmxv0zp6l6zN7cjjO8oSpPXoNfSenIeDK4BlaYSaOl2/
         tKlJWZiCc6TTv9x461hjLdq1rcBDfIsLoSc4JwkrzBT7TDJCZTDq2I+lt5DL/XEHb/d0
         10DA==
X-Forwarded-Encrypted: i=1; AJvYcCX2LwQjSyFtPdAaXjrriTX3c9GlFIfXaxuS2erkoP0O4IncmEoeXF/5mV1c4X2KEXQ2YLpPtFQsZH2EGGeHwsgJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9SNyxwt6nm8fpqojlcZ1JQkISlG7tBif8RwtWtvalUSwuku4F
	6OThVhvYabV2NKUCkmFCHZUxsMuR20Y+rCyzFt7Z90L1RFLU0eYz4Kf1qUrgl3iI6WU=
X-Gm-Gg: ASbGncubWpPIAKXejg8yHDmGwR18vzHxZaULUGGQWQsS55m4UIrbKgaaYuMlWCTrGgC
	dNoc5ZSIf5CGMkS48AQiNcLcClVYDCvBwUn0mkyo/gMXLfHB2gn3cTUkD4c+kqvhiLnFS+i0nlf
	UQ3ritC7JHbMCVhYzzkcrcN2Jo22Q2Z+tNgFZjSZHAx4o/x/JhKMKFYPzE+BBmJn3f1g0kylX7f
	InHxiYRRTSIICKCIDJyOXSVJ1d2i/G5haJ/NU8cdyvPhqDIfKrmeFfJ9ZXEQUDjSxWi8oSgBI9M
	OQ+ICSS1xseT5e6vguPelEH7rp8aqSd6d++tqrjcxWezCtAj0RmDjzwqCloGIQ==
X-Google-Smtp-Source: AGHT+IHXRXXZYRGpubgH6HhObOmp8EGF7T7fg1ywZE0VXlicZkh5PVgGSBSmZjmIyIfwlxbLRKwwnQ==
X-Received: by 2002:a05:600c:6097:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4533cb484e6mr75561385e9.19.1750060350043;
        Mon, 16 Jun 2025 00:52:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm134888355e9.20.2025.06.16.00.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:52:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: raspberrypi-exp: use new GPIO line value setter callbacks
Date: Mon, 16 Jun 2025 09:52:28 +0200
Message-ID: <175006034577.16922.13168351714262147379.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250614111216.93677-1-wahrenst@gmx.net>
References: <20250614111216.93677-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_005231_717122_60C83966 
X-CRM114-Status: UNSURE (   8.33  )
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


On Sat, 14 Jun 2025 13:12:16 +0200, Stefan Wahren wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/1] gpio: raspberrypi-exp: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/367864935785382bab95f5e5a691535d28f5a21b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

