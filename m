Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6123CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLr2Qm3e7qPPrbuy9EzFZ4qGFX2Jg5btesNxtQvmJvw=; b=HeVnUOvYhkDdFO
	nVuGw5fl5nmBulrp/0etBoJt0HfDU7ezz4yLSvQpnuesM6ijDRx7IwE9Rqgq537tYgPE6D+0OY//o
	U47kJTEXweGwhX50y+VXuGcLZPvxSERG0IKg6qZ4IvVz85bRwQ8rUuDvgy7qQYKC3Da3oDzVXsjKx
	qrH1ZUsiZb/G8j7Nt3Zl3ZRfgEANHoYdq8ImXHH1upqF3KzWPitsTx8GOagk76JWDC2ywxRKoB1rM
	g5AkqLiJ9o7/QFNCkCYKFIJFpWGNeZgL3z1Mt4oAvth7OiLcNB3sef3XeEMKkr67HFbxJD7tR2ZQz
	OaHtsbV9jDf22eVDeBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaC-00000007n3S-0vbf;
	Mon, 25 Aug 2025 11:41:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTop-00000007Y9t-3CJ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c854b644c1so853238f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115330; x=1756720130; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLr2Qm3e7qPPrbuy9EzFZ4qGFX2Jg5btesNxtQvmJvw=;
        b=DEquCAdLhW8ZSLieRyUqXBpaNO3+je7V+ss/bm65JSLY++7d1XU3RDhjTHPGdfVNsj
         orGDzvuh1BrifU5EeWCBKPF2fuT1f8nOKD4z0B05IJstMXxKCaMySeMaPj4rlUg7N+4C
         EM/g2sHgMUnXSVLhWMAvlTzTajTAWCl5sYNQ/L3HBBEtxaU7IDh5XgCv736EMwPy7TV0
         WQ2KhdKsjMNZjTXiKzVHCnPa24TdOhkRknhtB/ZT4JY0PZyhBytsswnaqT8WXB93gH8e
         lD0cttcOw2NEcBg2HqIsgtXJ0/r2Lxhsm6X7xp4GJ9IwtTzO9QBL5YO1EJAOMMhYc0Wb
         c/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115330; x=1756720130;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLr2Qm3e7qPPrbuy9EzFZ4qGFX2Jg5btesNxtQvmJvw=;
        b=eCOQU0z7uVSUNNPYsa+j0G5EAubs4sz/rrTFVsTcXkbw6aaH13beN6bzAsYwTpUkaV
         JpbDVAv4YauLOZm+sZGun4R8Mm3jq/ly+CDR9absHv4lGMNP9j7egg66u5KfTioIZ08P
         KXFwrXCOfK1mwK104F55D6i/PF7eJb8HEne0XGtE5aZN16sUEUPWg5cV5EJVUlmYUS5e
         HzavGfN6DwNyBRGwjPn2RzGVHR6fAy6rpitBZDWlLAYD5vR7fKlu+EgBJ04SbbXz99D5
         EXQ4otpSATEzA4ipx7YODziZWuma/gGZWqwyfOwGsSDsnuyvw5G+ydAMvKIGZBB9y5En
         UWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgj7XmpD8eqI6qbz47xGm8mZVANSe9cwlwrHS399UrY59Q82Y9YYoa4gNzaf8NinvBlVko/5NaKPvOK2yBTzpe@lists.infradead.org
X-Gm-Message-State: AOJu0YxA7Q0nDc096DWMbOISB8y12Zlu5Ib8VsU+/BSQbV9O0PJRMVXW
	lR90nb/Dyk2+PEvwzTOwRgx6+3dItSvjJhXkpl9Kx7PiELXjBAOeldr99YMZowu3xEg=
X-Gm-Gg: ASbGncvQZxmhpcASEBcmfbsUgeScoP3Va3rFRspVqHVoazjpWhJYDhdDBX/eRsY3gxq
	S5SvTNbcopATPCFecJh3lKI5p2z8Pn51Uw+dsbPnkEPPqZcmg/r064wivbKmif5La9AjfXOA6ka
	C8lkJfMV2FVeKcbdvnwVCtKHz6z/ma2FpaVP5sfPLR99XR2T3cQ61O+bmTQeUjJaLT/8vpa91fP
	8IVV0p8OOiLNm37rBP0DAajI3h/i3gRCl4syRRxJ6hY3R0YzghqEYrLzWG26BXXSSujaJe90abt
	6ryyjJ2v7ov8gqqDvDaa4xbXkPFI2p6PBO82vWT9+GUGX688KvYpvOAFdlAmyRyogTk7jWO5gty
	xKUNOaqIyTNqhSwPTeOgjE5xvykbPp9wRPftFEjU=
X-Google-Smtp-Source: AGHT+IHZd9byCiRM+Fg3ebBCZ00/QdcAygBb7Xpi8Rv6gpZTPdJa0i7D+jm5xfmQtyut3EDPIP5xHQ==
X-Received: by 2002:a05:6000:400b:b0:3c9:8e80:da00 with SMTP id ffacd0b85a97d-3c98e80ddd9mr1550445f8f.19.1756115329536;
        Mon, 25 Aug 2025 02:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
Date: Mon, 25 Aug 2025 11:48:41 +0200
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHkxrGgC/22NPQ+DIBCG/4q5uTSAH2inDnXt0I6NAwHUSxQMN
 KSN8b+XMHe53PO+ued2CMajCXApdvAmYkBnE7BTAWqWdjIEdWLglNdU8JZMGzqyrmnkTTkbScP
 LmglV6lFUkC43b0b8ZOsLHv2zv99gSPmM4e38Nz+LLLfZ2zL+1xsZoURKVTHd1E0nuuuCVnp3d
 n6C4TiOH+RcyLq/AAAA
X-Change-ID: 20250728-gpio-mmio-gpio-conv-623517c3df74
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gzJkrxl2GSQBg3wbrfEpmXDR3TtQwTcP3zezkl/FLP4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF95fgkfgqjH/0HnaqX+iNA0RpmNhytZ0in+
 thiLMlRL0GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfQAKCRARpy6gFHHX
 crJvEACx7TpNiV+8iWSToemqO/HsyfJRu7ALXCsYmREIXqiOBwMSCkC8cHfvU9PKo7uuDh91jFD
 tEcgr3HLkBOcKlNKArUXIcZkZ/LCfTDZ1xTYedJYiXmvRsVJ1hDiMCH3YScP802egjAoOHgdL3T
 z4GAftbqtWxkWYhLej+VR6Nl8tLxojPoaIPSLVz8SUjMIDfXjKjD9wfdHvqseG7qXrrPXT3Mouu
 fb82RNO1KaXIwLkTfEfpBZ+GRsA8TgjR/o68CKLK0Ai4TSQMrf6OmjnSTZuer26m2lHOF7oTx5O
 kAwO8fghfAKJQpvCGtlZQcSUya3pmK3IVfNZJh2+vH+S6ZFmyH4v7TsJ49oupzujYOBSRtM/aUG
 lSsZzVR/hXcWmO6kEib62AWtfEq/+7YTiFqfNp2PchJ6lkE8AIAob0Y+MDIEbnwzFLAcW/gP/fN
 63vv8TZsfPaI0nydFNRLbBXfnLE01ZTlHlZrbOh1NflS4H9/bDAp2xdmvuL+e0gMdQ/bop4/eOE
 VT+zjPa1SoNmacXZB8/kpbCBJoKrtQiOPiexSyni4heDxwJfuVwWHA2RrTwOLSISv2/p/GSJIBJ
 VqPR09ARTV7SJy/L9XZ+bpH6rL6lMBFFpgh08eM5W6h2EGBTD7muEuGrf5RgI/8iUQw8rHX6lMX
 jbsarJ4Pztr8qGQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024852_047265_C19A558D 
X-CRM114-Status: UNSURE (   9.48  )
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

Resending due to some patches missing in lore.

This is the first round of GPIO driver conversions to using the
modernized variant of the gpio-mmio API.

While at it: sprinkle in some additional tweaks and refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (14):
      gpio: generic: provide to_gpio_generic_chip()
      gpio: generic: provide helpers for reading and writing registers
      gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
      gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
      gpio: ts4800: use generic device properties
      gpio: ts4800: use dev_err_probe()
      gpio: ts4800: use new generic GPIO chip API
      gpio: loongson-64bit: use new generic GPIO chip API
      gpio: dwapb: use new generic GPIO chip API
      gpio: amdpt: use new generic GPIO chip API
      gpio: rda: use new generic GPIO chip API
      gpio: grgpio: use new generic GPIO chip API
      gpio: mpc8xxx: use new generic GPIO chip API
      gpio: ge: use new generic GPIO chip API

 drivers/gpio/gpio-amdpt.c          |  44 +++++-----
 drivers/gpio/gpio-dwapb.c          | 160 ++++++++++++++++++++-----------------
 drivers/gpio/gpio-ge.c             |  25 ++++--
 drivers/gpio/gpio-grgpio.c         |  87 ++++++++++----------
 drivers/gpio/gpio-hisi.c           |   3 +-
 drivers/gpio/gpio-loongson-64bit.c |  42 +++++-----
 drivers/gpio/gpio-mpc8xxx.c        | 102 +++++++++++++----------
 drivers/gpio/gpio-rda.c            |  35 ++++----
 drivers/gpio/gpio-ts4800.c         |  39 ++++-----
 include/linux/gpio/generic.h       |  37 +++++++++
 10 files changed, 337 insertions(+), 237 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-gpio-conv-623517c3df74

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


