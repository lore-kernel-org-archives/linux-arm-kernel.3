Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385F1CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DpPPqJ6vfvGH4vuO+e6EX5ng+865t3uw6R5fP2qsALM=; b=eYqXPotu/uIipX
	Ix4VPyfxWYJs/bkwgNkjnCurNOyNU3bUVRYjF8kINBgm3dPa6COZPqcCnxu/zaRH+cceshmsFV5HA
	5OxGbWTC+uJtkc4+cix7oI+119AxKJtRT19KmojiLG8QUKzxyB318jlw5+PAo0JQV8/61JNiUEVrs
	9ebFrkRZaQbKzEBySYJFFWgjYI40oQ6ltAcqDAY7JOoafibt5xfnkZtNkvA+wiKdTG3/CP50s3w4f
	6cxLTGYVhYn8ZOLI7CyZiWatj3je8qIqpGgXiY37DB7yTrqxBGpdNyMhxzOZjLEWX6R8kQ2RfSfGM
	9UX486LpcvOzpWVwYXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjNG-00000005pqu-0H02;
	Wed, 03 Sep 2025 09:01:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPl-00000005LhB-41bp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so24841285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886420; x=1757491220; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpPPqJ6vfvGH4vuO+e6EX5ng+865t3uw6R5fP2qsALM=;
        b=EvlhRMRQTz5laEdp4yLLetX1Gwven4B57DxJeUC9fsWiF8HClQPk/VTN2kOhDg2E5O
         B2fWGmD5FSjGEzMeP929X5fTgW9Sv9w1OZTiBe+tiGh9KF7zABQJR8eA0jlpOS6NWgHl
         5Qi4vkp5JV/uzVDfiJC4cBhdOgCQuY4G4+IBappKhlMkGsZM6/k7ckqOp4BDl4M4a2Zl
         e5nO9Tl54D4CbTvks7+Fmm+lkKJ1Rze7Aom2vbN6J3ExUVA9mEcCJC2fHBCJJQ8THEnF
         3I6H/t7KtG45L2GfoO+CYGT7ZJxrS/iWmcX7NjoCq4foTg9z+/lSEmyaePacmm26gCG6
         Ng5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886420; x=1757491220;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpPPqJ6vfvGH4vuO+e6EX5ng+865t3uw6R5fP2qsALM=;
        b=OlSn0KNbW435BVROah7WqIcM3cWScZlh5QJ3ZiCmx1S+sXOAv90QARYCWuRsbKdfOe
         R2nla0Z2troYzlYJ74yttHTfqd+OZ37KTYl2lNAUUP/bTnAkP+3dn+VzzHnEhrcdlxXr
         SGiCoI9GT2ufGAq0ZOcq7NZcBnDOLERhmebsLDdXJY+wRq9eRQz+Gvc7QbnRCHTuw+QK
         op8qwjrsqrTH0Fd3x2ZlpdM34eD0Rn5q9Df4q3KqZ1nrpAhwjS7zpLMnBgRk9LiV2FRD
         yyiE8jB5blJi6Xr8ObYoypcETdu0+lSIQ4h83Bt8pzxfBA28ESQ9LyAFs5eRf62Df4Wk
         1xUQ==
X-Forwarded-Encrypted: i=1; AJvYcCViY3lws6FQTj9n24XIJ7A2H77m9PR4IZ8gP7PpmE7rvQjBiIuZ3RSOfXC2gGOjbBrmIpEEuxKMoPPOfx0cEEJH@lists.infradead.org
X-Gm-Message-State: AOJu0YxEoT5Ovj32cOxhATgeu8NDDZxQ6dilSL3lAn8hAtGvvZ6PG3mv
	0eTq70ytBytjDO/cpxRkPtuvDUBXaCNeiXp0Mfy2u1x0OCs+sdLmBZWvIY/mEorDLGs=
X-Gm-Gg: ASbGncv3E/GgOza+42RcJN4367jUX5FUQcVTqHFRIGCzuoFYaVf9nl8hhSs/qZAIMFa
	t055mYuH4HulmabFLJnMxPansaG4JfvaYzCjPnOrmyVQtU0VrlUesy7Q0gbqg5ALR/PsfCzishB
	pdiUj8TjX2YyCnpOobOyh0liqb8mwrS/GFG7JjA6JQj29cojqyxfmGyvKgA+QAtv8HzxbzO6mpJ
	Wbvz9AbwpAMU/X1Af1zzYmnqNoqMyb3ObXzl9sjkFjEASuxyUrWRdDD6uZe2eFPHInSJ7jL6KlX
	/AThn2SN8BXNowHOTL3UNnlIzkhz2nFzJrMYCIbMnTPdlH71Kosw/GarEFyMK9yV1IHa5Jw1QyD
	/ZVIH629cPNvx/BHG
X-Google-Smtp-Source: AGHT+IFwjP7yYn1uifzActrfXYI79jTCrc8TnAVAgAEQ4T0bxdVQdBTd41jSKK0TuTYpRpjrFDEjGw==
X-Received: by 2002:a05:600c:4e44:b0:459:dde3:1a27 with SMTP id 5b1f17b1804b1-45b855fc86amr107466725e9.26.1756886420178;
        Wed, 03 Sep 2025 01:00:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 3
Date: Wed, 03 Sep 2025 10:00:04 +0200
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT1t2gC/x2MOwqAMBAFryJbuxCjInoVsTBxE7fIh0REEO9uS
 DO8Kd68kCkxZViaFxLdnDn4Il3bgD53bwn5KA5SyFHMokMbOaBzBXXp4G+Me7p6HPtBzcaoiaS
 G8o+JDD+1vW7f9wMBCkNvawAAAA==
X-Change-ID: 20250901-gpio-mmio-gpio-conv-part3-534b9ffb7e2c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gKWwUvnAEvt2ScQRr56TGrFFGK11fkBKFuB/ae7rjDs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WMzbJ/KeLZaXwwbG7zHqK/b9QJqWbxJVEkF
 NwdikCx+xqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1jAAKCRARpy6gFHHX
 ciaYEACZUQUFrz8EUOXz/wW+8FpV4nOg7WED+poFNv1ix3BYoSfeycNXw6ASf8bmTHYuRUfMeN1
 RfJfuwFT9hdegcIBuWDhcHRmW/MhmZN/lfl2jipA5Z0T+f9Bcs/jU64irF6NgBMONC36lWxz434
 tSq+qphMiMajKiFrcwoWa8GenarK0R3+JcoTAhDwfAr5F6+GTanDnjNwY6CVcz/ns6Jpkj6Qjm/
 DXZgC2xB1dlOgRk/KBm0uVd5ztLeToZOW93AyDUZdsF8aKnRvKKU85ypaJ/U3hxwQEpw0r5X9c/
 4vwFH4beR1yILC2lFhkhsU/M8fU0lhSmgc6ajG/XeV7EuUlPhz9+ozGz/OxCzeHr5Zuq3SQc3VT
 jPCVSYynJOUfAWmBKaKgKg4YGHufyqswORJ1Gu6S+PokAhRamn2cFOF+zfsJ+n83f02+J5YT4S6
 m38OkRc6GTE636Q9OnZOk0VoH2hhWWQMsn+VPysDq7YQQiJWli9piqELKJ4lT+wKVJSgDcIixNk
 A2UvApfvhhuPYuFH+Wdtp8ivAh2v57RpT1czjXW4nHXz9KtIj7r2G/93f6wED0SMWHaGkSn5Bgg
 aLBCXTs8AyWbCXyQEagHqPvuVrllsdtt8bKra3fhbclCiYgUYtC9e64Dby7AYCdtdAUK5l2bLQp
 htd9ZzHD04avA7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010022_002836_65019780 
X-CRM114-Status: UNSURE (   8.26  )
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

Here's another round of patches converting GPIO drivers to the
modernized generic GPIO chip API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: ixp4xx: allow building the module with COMPILE_TEST enabled
      gpio: ixp4xx: use new generic GPIO chip API
      gpio: idt3243x: use new generic GPIO chip API
      gpio: blzp1600: use new generic GPIO chip API
      gpio: tb10x: order includes alphabetically
      gpio: tb10x: allow building the module with COMPILE_TEST=y
      gpio: tb10x: use new generic GPIO chip API
      gpio: mlxbf: use new generic GPIO chip API
      gpio: ep93xx: allow building the module with COMPILE_TEST enabled
      gpio: ep93xx: order includes alphabetically
      gpio: ep93xx: use new generic GPIO chip API
      gpio: mlxbf3: use new generic GPIO chip API

 drivers/gpio/Kconfig         |   8 ++--
 drivers/gpio/gpio-blzp1600.c |  39 ++++++++++-------
 drivers/gpio/gpio-ep93xx.c   |  33 +++++++++-----
 drivers/gpio/gpio-idt3243x.c |  45 +++++++++----------
 drivers/gpio/gpio-ixp4xx.c   |  70 +++++++++++++++---------------
 drivers/gpio/gpio-mlxbf.c    |  25 ++++++-----
 drivers/gpio/gpio-mlxbf3.c   | 101 ++++++++++++++++++++++---------------------
 drivers/gpio/gpio-tb10x.c    |  74 +++++++++++++++----------------
 8 files changed, 214 insertions(+), 181 deletions(-)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250901-gpio-mmio-gpio-conv-part3-534b9ffb7e2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


