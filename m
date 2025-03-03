Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EB8C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yy1JVRlXR6nmaQaZdHV5up9VNNk75+ZYeI4CrMOgdUU=; b=gIFkbw8zgQZ0yw
	/eVbGp5vB5V2H5mb871qQ+pzmEg/Hd4HXJDK7nhSBc3MVcFfh82Qi88uBlcgpYNKyjoNLMKDyLC6J
	89r4KJLwcIK2NKpYrCzhH+tRg9U8+r0FHrf4hpj1aBi19/Z2g8v8NtrG1HffhKI9dSHG3w+c8dVps
	QE2oEq3DG9VD8+F2ZNXKHSMQDkDPaM7uTSE3P2pRnV+rQbNBZ978TBPygm3lcA3CZAHe2Bt0fq3zw
	5GL+kyhpf1jA6TDv56lin7WH7/eA+mG4eTYYiqef7f3sfHuJKvnZg1Y7gfOrWmVYZomhAPkR/3K5X
	tLvKzy7znlwW/hUDAUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5kT-00000000tc0-2L52;
	Mon, 03 Mar 2025 13:22:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5gu-00000000sVX-1sVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:18:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394a823036so42280185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007918; x=1741612718; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yy1JVRlXR6nmaQaZdHV5up9VNNk75+ZYeI4CrMOgdUU=;
        b=fr8LQ0rGu5ctduQD25aRoDuYrcgiwfD9+Aob/hr/Aal3CShpNe8GD34sMY96w+8RRY
         Aa/6rtm5yD1QWueg8I6m7SL5AqFe2TnJpVaMqjFP1t7hhkKjXWJlk162JObQaTCGELuH
         Ym74mnFpK05wE9J8cy6lQvMc7Vl0RBGfzlwP61UgVdRUTpFHpnPm3vCUGHEwp9WMCzIF
         u4DLZLF4suwMzpETI4XRDezFMhbdodr4mojuzRYDTMzPxuVez+larcMM48DHqHhYbN9D
         iRUf8FFZyT+yZS8bMJufhMxojW13ijbzHe6EFhaLrFlifcIB26zwXRzKMHFYuYcru1on
         rMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007918; x=1741612718;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy1JVRlXR6nmaQaZdHV5up9VNNk75+ZYeI4CrMOgdUU=;
        b=siCzg5Xl/XNqUnjLT/tUSprrEoQEYScSuaXiuBoJoDh/aMdPsSA3bWbZmTctu5fiwA
         TZkSaBPnW15fZJy3UwnS1cyQndszjJZ7pEerCET08SfTkwLCOmUrI3vdPVZH7Xzgn1qV
         rpxJ2HfzFkH5jAkGbKbCJzPK6znydkRhim1xuf89HMQYuKpe0CAQ6cU3Mdi4ZN7cyHEV
         MZP3qA05CPNGS5+GrCz9xWQxc5dD/95ONwnN+RgK9y0FutzX0IsfADVna5fqZq1hJ1KA
         xrXbfI/cTkcK9mg03kiKXcwEzaiIX3H/KVVJGGKOc0VSDy0KgNnLYALmrrjHJ2EaRCmZ
         DRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdueH6yR+Z/U/5QPBEZI0Y0kLuj+XOF5f6Eh+llTwtIjDdbDhzjmWiz0Tmk7k5gxRZKp2ScP/vemqnEcNI4MD4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7p5DFs/TBkor+ZEo9Zc4BQc8FWkidNpYDfHFl+w9p2iAM2FCp
	UAWQSC6bF4TdGrrnk0y3EIsYAjmLqJvluzZU/dud2dDwiZyHkLOchHEfGOIHD/4=
X-Gm-Gg: ASbGncsKVVx0EnKgTRKoxE1lC5EeFanPWI3bwfVvrUffHMrLWab2QPHH2TTTOF7OQnp
	UE9GMhth3Sjru8YCLijZfYdji/gdWJxUVTuIBqVQEkLGbPfMJc87dNLylvKcHGNjg3nWM58RfP4
	3+/+/LS8iaUHuOpVpGHbxHkJ3YA+1oSWbzeJodfTGgivazlMXf9N3Amk2IOKdRug/owSZ/KpxIp
	njpfnTWrx5JqvTmi4x73dGyoztzo4OYpBlo972JgwBXDKEvj1FgVCuwdbdLGk/X0CeyfeaIYpxk
	1yA50kGFZDUWGXTEH5YKlf4CMujl93V5n1uV1w==
X-Google-Smtp-Source: AGHT+IEYSoFbgh9Yo6fzCpbmc4OD7ixVh8/Qc+gBT9GOh1lnAk3c6PmzNiyXxz2KhEi+3a6qb7fiqw==
X-Received: by 2002:a05:600c:44d6:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43bc0fb007dmr31862825e9.7.1741007917860;
        Mon, 03 Mar 2025 05:18:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: convert more drivers to using the new value
 setters
Date: Mon, 03 Mar 2025 14:18:25 +0100
Message-Id: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGsxWcC/x3MTQqAIBBA4avErBuwTPu5SrQom2w2KhoRRHfPW
 r7F925IFJkSDMUNkU5O7F2OqizA7LOzhLzmhlrUSkgh0Qb2ZueAiQ403p0UP4Ot1NuiVdP1rYK
 sQ6SNr/88Ts/zAth7bp9pAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FTj6xoyS39LnNrJXGLhXAeRS3nQ1U42Zly5B+pL7Yio=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawlRSaTKbF/S2ubujlU+T5mOtA2wT+5FfqLz
 f0O24SM9OuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsJQAKCRARpy6gFHHX
 ckWGD/9u+ceNcDwkzEAzs9WbMfq5vXhzHtIGaKqnxBBxx8KhWYFPKP7Se3MIVRL9v0JnhQ87GKy
 HDgBiwVyHynXsOKVlQw0APVr2LPRIaJaggMbPEmN6tfFWYJFXsseLQH6tF86XmqyVRZFj6c3Ony
 a2Ji8lD8KdpKO/hTUEHaEk1Y7QRzZR3e8sgS3FMq9xzd5GWdbGNLbVCi3bIcPaowv+oqGTsktY8
 IxJz2cM8pV89YbZvcWD4mJlhwti/GUcqKMlzqaiaGYSviLcYsgCdCp7UsOjsNZa9+BRiFp6+u2G
 HEc+at4+FRdvN14vwP083vAkOasL2iFM66uCpowT/QcpOV7uFMZsOYtaq9yzbx78N6FWFdahWYh
 9JwMY5WrPG9p4eUzMdEsDKKQN6u8tgZk1LUGg/uq3c4jH4NXUarz+uzydzMFxqXfRi/AoL9g+60
 VUkNIpSaLu1JefQwXm4VOq72a8rl9Ko95MHqVnuwKQJFNCyOieV5D07Lg6VTQwq3189BSB8faoi
 zlWMU1AEuEHIsLPV5ccoXeZEXD+S2JuM4av48cV6RU4YuT+xCqSPmjnhzwnl4JOxdJ7CFu72AsK
 SoU70k9bxmFIe9uGlfJiCdi28nlSkLv3bW09urYrHNMjhGHjTXNTOdEJ32yXwu8R2VpkIqc9rs2
 0+3p2O8qDdv/SiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051840_684570_E1FF707E 
X-CRM114-Status: UNSURE (   9.70  )
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

New variants of set() and set_multiple() callbacks allow drivers to
indicate failures back to callers. Convert more GPIO drivers to using
them as the old ones are now deprecated.

This series also contains some additional refactoring to the affected
drivers wherever it makes the conversion easier.

To: 

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: 74x164: use new line value setter callbacks
      gpio: adnp: use lock guards for the I2C lock
      gpio: adnp: use devm_mutex_init()
      gpio: adnp: use new line value setter callbacks
      gpio: adp5520: use new line value setter callbacks
      gpio: adp5585: use new line value setter callbacks
      gpio: altera-a10sr: use new line value setter callbacks
      gpio: altera: use new line value setter callbacks
      gpio: amd8111: use new line value setter callbacks
      gpio: amd-fch: use new line value setter callbacks
      gpio: arizona: use new line value setter callbacks
      gpio: aspeed: use lock guards
      gpio: aspeed: use new line value setter callbacks
      gpio: aspeed-sgpio: use lock guards
      gpio: aspeed-sgpio: use new line value setter callbacks

 drivers/gpio/gpio-74x164.c       |  16 ++---
 drivers/gpio/gpio-adnp.c         | 136 +++++++++++++++++----------------------
 drivers/gpio/gpio-adp5520.c      |  12 ++--
 drivers/gpio/gpio-adp5585.c      |  10 +--
 drivers/gpio/gpio-altera-a10sr.c |  14 ++--
 drivers/gpio/gpio-altera.c       |   6 +-
 drivers/gpio/gpio-amd-fch.c      |   7 +-
 drivers/gpio/gpio-amd8111.c      |   6 +-
 drivers/gpio/gpio-arizona.c      |   9 +--
 drivers/gpio/gpio-aspeed-sgpio.c |  82 +++++++++--------------
 drivers/gpio/gpio-aspeed.c       | 108 ++++++++++++-------------------
 11 files changed, 177 insertions(+), 229 deletions(-)
---
base-commit: 9778568dede2166c7bd124d473f9ec365f782935
change-id: 20250303-gpiochip-set-conversion-736fb6548975

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


