Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8226FCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=; b=3P3qHVyQpkzMQO
	TrdJTsQBCjT4Zb1nrjh+XQwiZZwrvnabJyzADHQQ1c2J6CIQuxM6+rlqrBJkLIa33s0jVdQSNVu9n
	O2Lo8A8y523VIuheQvKFe5kHcvnVk5A6mx2qcDTcCeDcniQYyRldYnZX8E9fIZ+UxHNQcQXUktS7w
	kJTfZAB1E3VBBzOGMACnsAnDW1bnjxE2beSrNWkH3ROaa6uG4H7eCjOHLT7eIzCWvmMCaOPdbR7uK
	IMHT1YJGbLGYktgJDPN5MhYk90W4908NKPagsLloQD7g2pE9BnSTRUZ0NMucr6Y6nK0w8uioA4SNC
	N/fuSzZtNIpcTpG2BfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWBD-00000008XES-0kLk;
	Mon, 11 Aug 2025 17:19:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulU2L-000000087kC-0ewn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:02:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so28381145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754924527; x=1755529327; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
        b=vanCHH9GAPi1n3auL8tFIlB8s9Y8QoB8Je7YQM33UlQodQ3DU3/jaAqNYOb1nX65/Y
         ar63ZFm5iBTihJskTbP5oFIP4NHAKSLME+6Z6V2sDcJryXAuF8cy/pabmey3QFgv4r6f
         Ohs/n3pAH3IX9f1JKAYuwa0J+OdhsoFLnPG22kddrNgoB7q0kDtzLAujVm+t5avWYzAT
         yyE+8yA+kOCwcpKCZiP9O4r0WaqQ67fu7rOFvNlcp76qda3J6IT4Q9qT81o5k+Iftlfw
         Dmm9Ll4KLHQ6SI/zPwIhYQQDprOAsY522vF0bdc0F73aeDrUBXsiZQc0gPi1QVxeE5V0
         yF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754924527; x=1755529327;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWxxJB41GipbzcLM3187/KnwqQo0+hqj/Nc5bwMNpJE=;
        b=GvULCzrkYz/Dn1gqTMyrHzyQe1iF8iqDGWn5vxNeR2xKkPGufmJck/Qf7oyKY82tvc
         Nw31E+fZ52s1GLoMKZU+qH/OZS9yMzJ27OAHHI4GiLe9ZSBhT2G9ieLszMIiDd9ddM18
         446N/c6LSIoL1OKeQ7DntZHAkASRx24syInxAHT0ielE42elLE8ECYHUQv3uIhtLg4M6
         ZBf/wiKIEXGt83SeqHBow8EifFUc9npkgXkotwEk6diRx9L6sL5gixCJsuyyefa4ZeE/
         2VqtWk80Z9lmNF68oiEJ5otCnEC4wJ6agZjDUdLOCXKIPIZWPZ3g8FAcF2MCy2GAFBxh
         i+nw==
X-Forwarded-Encrypted: i=1; AJvYcCV0jQpxCEvKBj4+sFNsF6itUCcS5pzryCAuZXLpoxhcrsAzGxqbStbhyXOVNMNA1xcgNsQHu+5abhUQEv95ejgR@lists.infradead.org
X-Gm-Message-State: AOJu0YyB8VG+y8R/CaVGZPKGiqHZmJI6JEEHtaqPAQAlfzRhbkcmXOOR
	VWXPu/EFQ04F+W6CdhSDcidDxKOzIOxw0Q2Kw7Y366QUV3ZueZm27uvF9FEfPqsS+ZA=
X-Gm-Gg: ASbGncttiexR3vD1QgN3/G3UK+zQG9YUD6xrlYw/6K4NkL8WgudVoSG1EFkXLCFAmVm
	ifc+ioUEvRCHvsxCza2j8zu9vBnoG5UqOC0xQFW9fZkQvExpWRr6l4rtHTUptAPVIlCAVbWyJNW
	NB2EWnV5/NbEcg641BBl7gMSgZ9VcuL6tq/UaMtRFaQDYwrroJU8tJnUO/jtUixO2C4WvOAb0Sz
	uFhd3NOG0ZysBe/JdtJNuxbbW4p1zjK4BE4QykeQ7yi2mbYtZQHjkvp8HgGdpkValjvhs7Oq2FD
	2CcxdjrkW0rWIas8qquSSytEmC9Mx3A4UDr9FYDOkXrPAV4Lw/dDIZeo8wIj3qCMJo+cTpiP3z4
	7rO9xYDDTDtGHbcfa
X-Google-Smtp-Source: AGHT+IHYAg5/y7zzobnnTviyWJZ1QSB220ScxMwZP0hCZAAL8BDUWTjluWnaNcHujIv1yztB2rpJiA==
X-Received: by 2002:a05:600c:4f91:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45a10bef8e5mr117525e9.22.1754924526966;
        Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459eff7918csm192649605e9.25.2025.08.11.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:02:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: replace legacy bgpio_init() with its
 modernized alternative
Date: Mon, 11 Aug 2025 17:01:59 +0200
Message-Id: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcFmmgC/x2MywqAIBAAfyX23IJJL/qV6CC62kKpaEgQ/XvSZ
 WAOMw9kSkwZluaBRIUzB1+laxvQu/KOkE11kEIOYpIzusgBz7MistdXOlAHX1AZYe1sRD+Shhr
 HRJbvf7xu7/sBAPmAOWgAAAA=
X-Change-ID: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o4Eo/zy/CDLQ6xHxEmWPUQyDRccG1SfxWwIAZkyyDsE=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiaBeig651OieRFfC30/uCVO7y8iI2KgimJW4RKqVTdYrjxp
 YkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJomgXoAAoJEBGnLqAUcddyU4AQALGs
 Woi59UlCQe+wBauzsU3IX4K+sRo+vEk2S5EOlNJTfDlw/+bxQrkKLPpVFW2papWzPwvwfKoHmk2
 o2PkOmUxcL5/zR3kV5czcj+EYf0Mo9Oo9EyP5zNHD42fuOai8TqncXDUpSRiNeWemMBVI/tqXEo
 S7wG6bfTJQWhZydCqJrktOIPmqp/94FlLd6Gdb/gDJDsbcotGrzqmVbfwCVZpRcEschG+8Cs1l5
 XupJgXz7MvXDzozY6innrdxmciMCCdR/i+mbWA36pxXLAM54PNTG51/1W7kqh8kAVqki71SKRsn
 NEjPtM7HRTWaYBq2Nvq0eKiReBwgq4lSlm66feUhPx4X7HhMDWZUJ5+RbWbmFF9OqlioZxGJ7ma
 kfN8Wkhf+4Bm1txc70R52AD5uceubTlslFxZ6xdRW3ybaNy+eJ9w5qUzgmQVLXh311cIE90D01O
 gkWr+AkX33bicivR5yTraQDAB03YibkGswLnA6H6z4INNJKKpiwS7KnfPsXsWfGR3+aMSYgEw5p
 vh83ZU7yXJ2tHsSyEVAxax3riPxInwQ3Md6oWpWgpgvU+GO1eMkVhduz9VfMwCbItzRABIVAViC
 7kV1OuH/pn0B25k5kJIslZu2sakYxOM4LY9k25MKF9/BZhmzYohzC0fdFo2TBc2vX6DB4qvOfNt
 6okKU
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_080209_444301_5857E9A4 
X-CRM114-Status: UNSURE (   8.32  )
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

We are in the process of modernizing the gpio-mmio interface. This
series converts all pinctrl drivers calling bgpio_init() to using the
new variant from linux/gpio/generic.h.

Linus: Please create an immutable branch containing these commits once
queued as I'll have some more changes comming on top of them - most
importantly: removing the old interface. I will need them in my tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: stm32: use new generic GPIO chip API
      pinctrl: equilibrium: use new generic GPIO chip API
      pinctrl: npcm8xx: use new generic GPIO chip API
      pinctrl: npcm7xx: use new generic GPIO chip API
      pinctrl: wpcm450: use new generic GPIO chip API

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 181 +++++++++++++++---------------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 154 ++++++++++++-------------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c |  44 +++++---
 drivers/pinctrl/pinctrl-equilibrium.c     |  26 +++--
 drivers/pinctrl/pinctrl-equilibrium.h     |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c |  32 +++---
 6 files changed, 232 insertions(+), 207 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-pinctrl-conv-ad0ff8d046ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


