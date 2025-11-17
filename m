Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=; b=BUZgJNZgal5Acj
	SGJPhSQ0bEdo66Kq1796aKFs4bB1bCJqJ5VEDzyPVc2TWR2cZmfdVi2q9+Zu3u2l/rCJeonejTYId
	rrWbj7GQ90p8E+2PiCVXf/z5JxTXP1WE5b5VS26edPiZ3MMKHfIq0T7Nwc0XtNbGlYvmAmdMISXT1
	W/wM/qL8XmtRPejMWQSuczyk4eCsKn+G11vCCbgTVY3TdeINHqjD+AGUdSVgcElCD6mona1fqAzoG
	vVPNvbTJBO4W/956/CM6gAI0LTWILmeSYnPwsbJ9bMN5OQCUEin4MU5u6zM2+uRK0GC0n8MTiP+9o
	ygutaWE+34e715CLkQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB5-0000000Fjxy-2nbL;
	Mon, 17 Nov 2025 09:05:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB2-0000000FjxD-3njU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:05:38 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5957e017378so4614983e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370334; x=1763975134; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=G1lwu6Yn3CEyu4h1J6YrvUiORJemYjKFXV/tYZ6FuNwre4wDW5dV2gJLNzxtv9cP76
         ekVGWFWuTl99eJRyG8qRpU3uVu1CVtw/QkQ24WNLdrsL3TzWQneBI0EXhfImlTWI6W/S
         0jzOHoNiepoLAvp4/Kj7H++FyHx2jEZt1p0AG+FYGiRzjsxT0dKDV7dJjqXa2GL3WOXl
         VbpmtuPzJHlAr8Ojy3q/JYUlvWk434Lfbnyse87phLEKQR+0SglQgiIz/4Wplh1/w382
         j6KALnPwS0MFzFJhTEhIrkZ4JP7kIHkEtdccC//zB55KxcJSzW2JoOgU1jc0W6eT3iMy
         YLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370334; x=1763975134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=Ffrk3nTkvJINHRsd1d5XjzlL4sZwodkSh8qL7mgS5R9hUNaXf92VUoykha9I89J+nQ
         CJdOmYdSRBkhjrvbtl9Tjp2dgUX06a8DpieUEg0qWqv+ARliyNLamYhrImJ6sAw8qQmt
         Io1HfimnTsYqaFkfEShlD54BlY9ry1B/knuR+peyg4Widu0w5WZpiQiozdW+gkA0LTCT
         KK74ysG/j3uFa8OquZ5tomkNp71b26YzAZv2pEDN+rdBKWwgOsAkgYId46AciolpuSyb
         5ma/XGzLjxoYGjyfAAIBI3YhGm4CiZOvyVV5PJvaZMEUnbcPLT8OLb5TxkhF1Hreuj7X
         +1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCV5n6q81QFXD/mJ9oAenlBK6rdz1umeIfDyfCfrANZNgdCvv01m8/pXDjQJEGCNrUImaoTepOmI3cpndB6G3+40@lists.infradead.org
X-Gm-Message-State: AOJu0YyyHVvHVriVdvFsezcfMderDcypHxxje1ttj+bS6AFcqaiTkwFp
	k8WflRNwav+CYhLnLq/F25mAhzZnTC+jCzeGC8wj7gIrclmKowRfhbRY
X-Gm-Gg: ASbGncuX+tbiDbAZdlAyNF3YlKeuHT02btSpkO85+uoHCohRER9jTdKLwXA7zc4QqQ6
	/mFpaoCA0tYxW/Q3NglldoEjHNuR739h8ncH8uiaB3crPpCmXGJQGa71kGJstbWmxEtBt+VIvQ2
	0EEdHoEoIjFp3oZapTZ7vDcRXbIKMM4F65neiFEIIcES44GrXik1witO8Z+QzXc7yX6NsAtdkcv
	T7htBuk1kRBctjacFG44Tm2WRd2eX0TrjpkW2CnPDAFPJWTUYdaP/PO+wm1+Qjn4bzXexnbPaIb
	3+Z/FIVdL4g+fFJMwSklhTkilQANpkbaWXgMr7G/GiMuFO+ocPIkyRFJA1xVe6wYQ/sYnrZ0v1c
	YURlyjIgnxb/KbXJ0WPBqJGAMk2DF4MqbmZYko3bC2KdCIuqgYlJdB1n1XkeV+AJrwi/I0xT/3k
	rCgLi18nZhixfDOzet43VuJuEWtOunPC2yDWIPBF9Ow7ROW+qd/Hg8CYrd
X-Google-Smtp-Source: AGHT+IF9iVW0fdi7kfbYLREb/n/Cv1Xn4XKgZU7eShHWEirTBc55yfsSKxO9Mv0CCYMHSH/dq/K+Qg==
X-Received: by 2002:a05:6512:230c:b0:595:9386:6b8c with SMTP id 2adb3069b0e04-59593866ea9mr525912e87.52.1763370334306;
        Mon, 17 Nov 2025 01:05:34 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:33 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Date: Mon, 17 Nov 2025 10:04:57 +0100
Message-Id: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVAk+R8nVxy9pFlAJFZVCkYDRmQFIMODmwqp
 f8QEmABpyKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlQAAKCRCIgE5vWV1S
 Mn7yEADVderhvJe3xkcl3xeQxYz7gC+48h+X12wE5mIKuteQz8HJ6ev//FqO2/SZpfZLeoExA1J
 zqF8QfSRIqwxIA1ReLbQl//ikrLvi/7jHu5IoTcwWkpNO2PKhC4sPI+DqvmTBNgM4tHAs3PPYt1
 bNroESpygkBxpoQgGgiZSbqgUGL6DJDZYFR4SYp94gKC2ZNE+XQBozJgJ46MejWqRS6XvNb0gYn
 gvxnVy3UzCXsruZKTQ974XURw1HI9k3zR+BaWjdf/yNkhfyI01Qib4fOyarbaqqjav7+fsmRVyJ
 5yH60InV0sOIvflQVmK0/sw5GZmrtpMr39UocK8UuK410cETtEbDj1jpOcMFY2Tm2YLN5UgXVBT
 Gs93fkhnHwmwh8Ur3Gh3gG5ndm9luU6jMOxOVL5Huf51qv9D7tKfY6eBMvW2OTSagIgaEmbKSxe
 IWGsdC8kumhYD7+i1qGcvMYMkafacR1nHBlMeCdXAvNCbR529It4/dKvuXMnXp9XN/ziGHkDmMv
 Aayox0mFoLos2rZv0FhoAqln/GM7nU/2JHQmCtMf0T1YrpL9/XiX3ANkGtwzgbZesGKtQzaQvzb
 Ub9Ji9lKbXgGh/WTXkjMvEbJMPZ9g444ZaqqNa8l+lZP7UykZnjjGrWiYdkD3HYJLVIbILm48ZX
 H9+ggXzn3Ss/jww==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010536_987276_B5398F1B 
X-CRM114-Status: GOOD (  16.06  )
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

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 324 insertions(+), 22 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


