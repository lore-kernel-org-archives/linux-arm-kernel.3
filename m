Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7DEC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mgvgu9N2AijRJyk+Sq7xheAGC9tJFkrvX7b0MouEF7s=; b=AeuWnrD6I+4ZJ7
	V7dxqi/BVkqRG4y5t49jUZuuiiEXbUEzXwJeNzWizaF9Twa2s/78UuSbqCxKjUEEJGFYdRIoG1/vb
	STadMsdI6vjHieZNxZw/Ok36yZwLixQq1IksCvCDIQL3bzTJyRoMfXY5UOibCgRjN1Kvp5IrCs42+
	+Qnl6WqL+IYruajPuyBtK967Jhakyac/xceGtzR0rKX23MKGpmU5fbWQHzFN0Zbti7P3LY8zm9Fuu
	TQZzPLSPnYFXhe9ZE+LTRxz3dPyI4kYG4OfecmpqzMA21s8DSdvAk8QS1g2uPWbELbwxCSdB9MV4d
	JCKEAPK/lD4K8JogMWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSk2-00000007rBP-0XpJ;
	Mon, 11 Aug 2025 13:39:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulShO-00000007qdt-3gdv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:36:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so43477475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754919385; x=1755524185; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mgvgu9N2AijRJyk+Sq7xheAGC9tJFkrvX7b0MouEF7s=;
        b=ZNwJ/hBGorrsQUqdKgR6mEgZU1BBdi6d0Lo/XhCb/4xbQTzp4M6zBM2MbyTMC36peL
         eHQ5+8Dqwx/RAgTQl+slbQn4LPJhI2LOjllaNLLaIouqJSoaCClbreGTEcq9U+8XOfaK
         J/OBBnVHrfu0MC4GD/GkSTh3+ZjB77AediS1o4hlO+YcT1CGJDugqIM9bCffQEeQ2RwH
         uZ9x4lL/KqgDlfS3UsinkU8vgqlZvazAJcPZvJFQDVoPf6MY7Js7guU/xBa4hVTMc5qH
         7/s8e41Q/rKwjLdOvDH7mxSP1K6V6yhmvDH0/7Qsb6ORKLOf/sEz49Bz6H6Rc3G50Eyb
         4DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919385; x=1755524185;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mgvgu9N2AijRJyk+Sq7xheAGC9tJFkrvX7b0MouEF7s=;
        b=DtXosxwXL2CQjgll+Z12DP9mPYQwfOaCe2o2wxaGoV8Pf22wLF7sNzpeDi4OTVlx+D
         P3Ktp8L7u7TPA+Nt4hneF3fQkzfkdnIADXp+sfEF4ohxafeJH8hJOAbX4x4p56HzeBPz
         eRk5OKDeOuIT57Z3gQjizR0kRvOt/S11C7P4cqnoUyTZ9KE9p83wYOBIhN+5Pl+q6MdA
         e3WDVq/9RU2yKj9SfWGBYfi0SD//GVYSFYezSllwMbekJJUHEQxXuNVEh3VYceTyo7ec
         PrZEFPJHqAVdwiu6iYA704Jxt0sMz801b7fJrLFF4jmh3ch9Pd8FVREsBQ3KIfTs5SSi
         XvSQ==
X-Gm-Message-State: AOJu0YxZtFmGreuYGYegvgEDwmirKoXzmNWvG9Wtwi9U2xdLwHUA7k0t
	9xuSSuAw+D3Q3V1rNOtQ4WAf4NKLhQRZ9mAF3ii3mAMEGNysnvqLyWhwbegOriQ7L1Y=
X-Gm-Gg: ASbGncupTbPTbXwZ69VR1TkAFyuNkSmNDLVKf8f5M+C/mbOFzHjhhTRp96RNoDcr2Jz
	BqGjheSsqpeMaxvqN6rOvoiweNHbVOcIokMVP92Sgi2on339poA8qNsOkwgIVIGi03lrh1cJBej
	5J0585dkvBYpBrLRBRrm6jJUTs9SNWT7eAwfh1J58p8RZe8I6bYjc46D2Oc3YAiHU2+NSj0yM/W
	CsElsW+adaAjEV4qvGIdRanGTXPhKoVQMBA7qnO7y1txROenB/KyRcz8qHlneKAoNBAATi95k5g
	XVtTJdVDc19cfr/QpUv1xgQbxpaBfi0t9rkkNEJYeDmS6xH2e1TU7MZCQirHRBdGcNzzWAIxRek
	dA5ft9o1N92G6FycaUA==
X-Google-Smtp-Source: AGHT+IHDTCjn6dBu5l+OgcVURiM6ym9RYYUAj/uH7kKQAWn+bxm23Sv86Ag1bxA1de9Pe5NZjNwYrg==
X-Received: by 2002:a05:600c:190b:b0:459:e048:af42 with SMTP id 5b1f17b1804b1-459f4fac94amr103698535e9.24.1754919385351;
        Mon, 11 Aug 2025 06:36:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587d378sm253045105e9.23.2025.08.11.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:36:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] mfd: vexpress: convert the driver to using the new
 generic GPIO chip API
Date: Mon, 11 Aug 2025 15:36:15 +0200
Message-Id: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDxmWgC/x2MMQqAMAwAvyKZDdSAKH5FHDRNNUNbaUEE6d+tL
 gc33D2QJalkmJoHklyaNYYqXdsAH2vYBdVWBzLUm4FG3E+N6P0HZ5FjuNDSwMRuY3YCNTyTOL3
 /6byU8gIfB4mwZAAAAA==
X-Change-ID: 20250728-gpio-mmio-mfd-conv-d27c2cfbccfe
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=clEggjtaYLzTP4MRCQeAmK7J1GgjIsiD6H0HbmNpPwA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomfHUYiAnVmpFO/oZDby6G3Nf5/lruJtO9Yl/L
 PeCjRn8/wCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJnx1AAKCRARpy6gFHHX
 cjlfEACaOEGk18hRDoKJNflCPY4MfFf4GwET0PRhy5JviWpFMYTrtB5tMVk8F4IfPlR0Z+waq/m
 HzKLZfJ46OXxlk/w1UaUfZxPh0PXi2WnO7k/O7q0H4PviNcLql6lrVyWCVqcMm0nS6mD0Xr3+m7
 pGTDTAUMm9EhyW2ANTdFY0NiC0mH0QIE5T488WnHqThXwKZwSPWAmLf/JzuGz35BDu+dxoPAEX+
 IpZwHudbovr04PrPAa2om/LfIUFGv8r0cLL3oATqcRu1HjdRv+qDX6KKq2eeYtJR4KkFq8w4lPN
 GaJAmGdIEb2VEyfLHN2aLS2EggsFOiEz0jyMsxh6JN2XYrHOlZHvXVW/u8uzlXgBPg3Fl6vP4hR
 iPgqd2BtU1puXtWD3ytDPMXkV+UZ1rUT9UhRs9UsbyQAS9uLkEQ7Fl1xtsVF47KS2M2C0vF0mAp
 FjM4WHe+Z/PbXPs2fR0Xj1gKPLQngJRLNmbJ0ltc6EeXCcWgNqB3CJSMDt0unBFzs5hlF7DFpUT
 a9tLk7admLgn3uoAriVVTj8WP/0zbYuQSqViufMoF954F0eaGv7wJnGGejuoaX44pkW7Wcy4mQH
 XFXMn9Odz1ZbuUf9kkFjcxeZytfNhrR9EaTyzQBtLQVG1MLZS0b9Wo6NUWmTnLIYPgRF7Iz66cf
 RcTiCXEK6wyHc4g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063626_956136_8AA6D096 
X-CRM114-Status: GOOD (  10.91  )
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

This converts the vexpress-sysreg MFD driver to using the new generic
GPIO interface but first fixes an issue with an unchecked return value
of devm_gpiochio_add_data().

Lee: Please, create an immutable branch containing these commits after
you pick them up, as I'd like to merge it into the GPIO tree and remove
the legacy interface in this cycle.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      mfd: vexpress-sysreg: check the return value of devm_gpiochip_add_data()
      mfd: vexpress-sysreg: use new generic GPIO chip API

 drivers/mfd/vexpress-sysreg.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-mfd-conv-d27c2cfbccfe

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


