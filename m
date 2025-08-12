Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD623CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=; b=xneNbhP5yR+lu/
	OYVu0I/om1+W39kbnhOS+jqHxneQ8PfkA65eWaOKzl4YPPkDfqfVEnh7e5VtwbyDavDgDs+EdVALN
	fqTKjAftJ9avc+daDMp3FtAOYV1FczSVxqc1QiCU810KVEc5HufFwLI4IWFgeRitwKGxYfsFjX8Cz
	KJwnf5qK9/VdzJgS0HKTXj+m1J875h7IKd71b2L8DPyrpVE1L/hrXM9ucDv4GF3+ICAe1QvRclCxK
	1gT7xILrd2MJWshG57xIhsEjz5opryAX0ril2oP8/bctXQvXD4t8FCQmWN6uJOkOKZhf6U71HcCMy
	30lbT2jxb2qic0zP221Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhp-0000000BHMf-2cax;
	Tue, 12 Aug 2025 16:18:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulllh-0000000ARtF-0bs1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 09:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=; b=cnFvUYnNSWIfkI+Hrjk7zoO4Pj
	WZKrQuKXgukmhz4Jk8avkJ0q6mWvTHB1/0yhuTL82XXrLUEKxk6c5BCtp+z1xg0CF0P50FWuvAvsu
	wYSQJbDb/w1OPZthpmltD7BCvnzu4Ec7rxrVNjunSsGKnWTbL1o1ta2s31/PNOYW77ztdxollbqBv
	BDwVpFlXhOlWu9n/smj0tBke0bbhJtgtcLvq0qRjSN0wFbQvqoBfscKkc9WvoK7Qw6ru8M5VZyG/2
	e3CHnuetjiQhy7otJO2vjZIxECil9k+e9gE4aJqi5fJfyyme6bllbckc5aqtG+MjX+E0CB2183Erm
	FLCff9wQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullld-0000000FmJR-07da
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b783d851e6so4466343f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992683; x=1755597483; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=;
        b=u4vXy34Zhd57BAAtlUkkEJQqZX/u3rUvuNyMcUOCWpkcoq3FifD4uj1edK62sSQrWC
         u9DM5EMMLxLIgL2prXt8lnON1PpZPwmG/MGFVmR3yJK8OtP66lY4hjEIvgB19smQ3N0g
         Rgg/DUsRyrcrMB7S/msqKLhwOEDXuDxA3Z818wbD21CjJj47byFxpJ4g2MLft8bsY6Xw
         XnyOmvkZVzvMwD5etgZ66VXFSIPp9UYvW3EoprSNJVLNNvghWLbCk7aYQrtHGDZA/EOM
         zlpOx7M8nWwMsg97g2//Qqk0XW2Cvim/yRAO8hOBZf/BL3e1AQYVWdsMzjvQJpVABXt0
         sK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992683; x=1755597483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=;
        b=NadMExNCIqZ9SewSQqukwz3nGRI7xEb+qEC/EFvbCG6oV09lEVjHaMIAWmDoXjk6Vu
         AjyhSfXqCJcXlcLbnjYywE+tzIrSc4MShZgThMrny1DklE9LbR6kV62iC7d38AKjAs27
         6iX9patn6rAM1GN7VtnvYew0rYE046QjzyefwLPf+HrR4kzhTtH0oEnmuBdUSvZjNyeL
         wjuvluABAzU9dOOINAl0I+ick+nAK7DQr+sKCeVA+aJBe2rg4QsQ3RG60RCmFtoE85oa
         17duJCXnW7x/D6Kiqzt3axEON1x1lMtpgON/PDh0C+Ucn/diKzX2xMrCMw+TIGCnEhnh
         cHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU5XCau/DSAkk7gc6qWHyAxHUy9YGui9fiv2c3QbfWZz67VY4wKtq/QuxX3ovHlx3aIdJy36DsQETaLdTiwcKx@lists.infradead.org
X-Gm-Message-State: AOJu0YzSwcKMZ6ulXvixp4+CL0eHyDjmBUn5Dnhu2nY2aiMWAJN8+Bc7
	nC/pXl1zo221Q7J+FbYx2UimCuY/i1TbEF623RVxDbWuAdVAihM53VOuIDQcKAJbIdE=
X-Gm-Gg: ASbGncsNJjYqJ7xADGIvtRKIbj8brKuNwQrPhrcqSr1mhmHQ/1bRJ4/pCnwRB+P7S6a
	reKmLi/R/T8QEWhcVZvtabzVQN2UTSaj0YjdslrWlFUhE2nzG5CCuRbHWszIGI8MBAaXTvE9kye
	052tfjKG6BacAq9G1H/cqch8nkVbVuvNnIz7WqSCnc/ggrzWn6AVPY7T0/BWFsOkmwNp369acDK
	bBec+WbZ+JtTMS4corV8MOXprceGWQDSw0hE4NyOIm2Ub8Kp8PxS7BfV+BMIfpKzh9MBxe5AN6V
	/KwLIW7bAPgOQYkAfbWM+T7+Y04G0MlAXmUGrzGmzvl+puWUkhaCcdP2ftIVItHLj6/8YhSkuuI
	LMsqvJ8/75tkqSV3xjm8RZgIx
X-Google-Smtp-Source: AGHT+IFRKMOjNEq/svqoqO1+OAGml8rvBrYHa5cXxdGYNGhaStnGkXEy6t37GrH8g1J/ZYMdLyL3ZA==
X-Received: by 2002:a5d:64c4:0:b0:3b4:9721:2b13 with SMTP id ffacd0b85a97d-3b900b4efebmr12112320f8f.14.1754992683274;
        Tue, 12 Aug 2025 02:58:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
Date: Tue, 12 Aug 2025 11:57:55 +0200
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMQm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyML3fSCzHzd3FwgAWYl5+eV6ZoZGZsamicbp6SZmygBdRYUpaZlVoB
 NjVYKcg129XNRiq2tBQA5H9IJbQAAAA==
X-Change-ID: 20250728-gpio-mmio-gpio-conv-623517c3df74
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ufruTN/rsMjpZogkg1bX/2fwukSGxpr2NY77MLQ1ScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmNTPMkGkiqt/PmqfVx7KF0BvJK3jOlcR/s
 vzc2p9DeYiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 co0oD/wJyJDy/+JHZq/BZAtMequ9A3BorEjOl5uF842dcksIJVorgAYhwAIdgyM1t6tLqbN/Pqo
 8gll31b8WC+059WBQiqYEwE3XIUwtEb0kSC6m2UINtPcx7pb2msmdkElhNZpzyog4is7nUgvK9Z
 /8Xa3ixR3x8mkElgH+q84PpjTnI/9fXoSpWEa2N6wFXVdoVuvQfNKMvoMvYXdql65AKRtdxzTuG
 gJ/C9HIhds0rws0a8My83avs8FUo3/LwM+e4NGO/ZLYLBf5/76s6YPA5Rs4M6qw2x2jJ82qmosn
 8ULu6iR7/ToDEfw9GW1V2DSS139Gn7b+pK0iNN2UyyogWmCbjo60shBX4NIebTHD/p12iuYcvJs
 CEZb+v8ql305dmJddhiBFYTTdvfZd+dw8zXYPKnSWRENswgcfpeTt2vVCV2wNhECOAvoFJdOUzc
 0y7aIb5+/anNL1UVq/7NLZvT+6l3GWLMK6ow53Sr01ZJnYTlbKf+ykf++krTuUckbEXPeCP7RNg
 grg4xG0ooTcJluVld7DSsvC96hyNOaeAbmo6ADxUHLAehGo5fdWfD7oTZ6cwGfduH+tycpsq3Q8
 pz4ZRCHiiUkd77Ny9k/pQ6eHVO9wW0GaPPAoqE5TbW2CuE9BRZ9JTVOGpO6UYRdV42m7BEgdir9
 /jFfL/c5aovbNvQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_105805_311891_732E0367 
X-CRM114-Status: UNSURE (   9.85  )
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

I hit a network error when sending for the first one, retrying now.

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


