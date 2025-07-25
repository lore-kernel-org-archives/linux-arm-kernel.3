Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF489C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mleQXqvIgmr7vuLRWiAVnrArCWUQGYeMAk8tu5qFi14=; b=ABLOsCVuYf/rUf8LDGkoeFzgqe
	RBQOofB6RTrOEmb6xIZmJoUBWr6i+wjpppMgSKbXG7Rzab3CIKBJfgsWrVmr1qMc6q5l8HNNh5YeJ
	P9CAjznI3r+wA1yd80vMF2L0zPhlRnxkyAG+Qcdbg3fAQOPaFBmhycEUOfOO4bScSsEMbhJIXMklo
	NszLD6Ne2Tc+oRUR5U0RvGeIpoNNDURrRhFsAVSRCei060ezMsR2agrPqg4NOiBVpHld2qYPj+xk+
	gk4dPlfHBJk+inKFTI6YyzLQUQ2U7+jjItKYpOuscKlPgFeRipTVF90cmsHgW3swGodXEGlA534f/
	iHVXQDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKfK-0000000A91z-0fln;
	Fri, 25 Jul 2025 15:48:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKc7-0000000A8SJ-3KSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b77683cc5bso557398f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458338; x=1754063138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mleQXqvIgmr7vuLRWiAVnrArCWUQGYeMAk8tu5qFi14=;
        b=CI4JdYaQjkSSYQb7WcRhqGMnEyzPUQNHHkCkRcrrhfhZb4iOfVe2kUVN7+z6KBaUtl
         3VGAV5pqIdKYfgpaDxAigfuQ9B5nvXhx73XW1YKjgmoAQT+/2lx9p8DpRihur9rmJcQV
         8dCaDxUBpOyHJaBOu2KsM3uLSXew02sc9OVj+r/6MYILdUoThZvnX9vJJNJsBKWEuT5/
         pI0Wccdb4AotVvfGqIPK6WLwbe/lqwAXsXW0wK2ZN7Pe54mBidmOJctvG8DMMJThMHyw
         +uGuvvtNZopVvpf2kBboq3KYHbr/S2y6vD4wNAwE36CPrA8V5DfJNaccX9Yho9rs+re4
         4hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458338; x=1754063138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mleQXqvIgmr7vuLRWiAVnrArCWUQGYeMAk8tu5qFi14=;
        b=VS2lp107oNHCPVhEko9eTEYcVqsgUJDu24NS7vEwOGC0ei1CoDf9lwhgfQ5om0KGt+
         jZPizYavFF4Kd6vCXJYsJHiDwEMQi6MU8mkhYVsmfEj7q1WAW4ZlvV2MUL8aqm179bCF
         2cxgM0VXuErKyK1vTplA/py+lo+stZqIqX11VLe5/vOBAVx0FkYlahyRyO6GaFKW0AOt
         y65xrKw45S+CUWU77TPuwqBrBEQInV77XVOI45lNtteAVdHDjTjmYBVcJK10UPkehW3l
         Lb1IUs0mCPp/XGj4qkDfilKr9fO1qPqHr/rblhcvK/kNLzfCZH8xjLem+bfM8oRlNpdd
         x1cw==
X-Forwarded-Encrypted: i=1; AJvYcCXkvBsAEOd+Vm3P+Wat0BvMAfp5deCqPbuud8RkUttTrFpXHrtsDEnE26ojkHzU6HFJ8ZtO3e3Hey+b4EEva68i@lists.infradead.org
X-Gm-Message-State: AOJu0YwDwciwlkielXGwUU9XnCn99MU/OeFuWtbf5sKd1hs1d1e5EDOl
	qKnKok6b1QI8ikEMzhK2d7ZDhWwzp+0hKYpq1yKML2O+2YSRIr24yObrIr4rYRg6hH4=
X-Gm-Gg: ASbGncvfQwdTRv43AETppQk+8XJ9OBxqP5FTlD/BJGFEZedJxLfYRCvpnHvdWCryBYW
	5hJZV8zCQGjvgEiBDR/RlSuMfoc/udXIhhM/6ttk77fuYYXlBJi/XKISeWJDREHgIS4G17cVY/F
	f/qg/IoY4hKOhEMha1xl7i3RvBBv0N74W1D4/3Z6OZE+OFSv3RItCw+f15L4jVOP2nYK83slXX2
	fIK1wyDZupMKksq3iHHIS70S3FOHbLenk+rA8Oqbr/gj3CNtC+2fLMtKgAnKnpitsG7hOYydRNl
	XscwH9yI4zmIvYB4f7VybN7MxwWt0bPiIdRjyQU0Olc1dcffj2D2w9V9JDfZV4XMZvQCCCjcbQu
	neq0eeZb/y3EFu/ocVY3IrUMPLP8weCa7po+y0vSid1NxNIhNnipCURypbbDmfYKl
X-Google-Smtp-Source: AGHT+IF+Z8jEVkmX32G585PaBNthqQ5rTesPtNg3nHS9aHQXVJv4rFJcGdiunHYW1cmdEB9sybuEMQ==
X-Received: by 2002:a05:6000:4282:b0:3b6:deb:1b43 with SMTP id ffacd0b85a97d-3b77666a7e6mr1833864f8f.41.1753458337861;
        Fri, 25 Jul 2025 08:45:37 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f106e9sm216675f8f.65.2025.07.25.08.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/8] pwm: mediatek: Convert to waveform API
Date: Fri, 25 Jul 2025 17:45:04 +0200
Message-ID: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=i25yPyDYxImkVBf5DC1DPyGwN93bkwil5G8qHmo7mwM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aCn7lXpMFpj4nJUtawseBPtyk1rpuckaGTy 8/ihh5ZIQaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmggAKCRCPgPtYfRL+ TohQB/0bOXtYPsC8OuS08IRX2/7IZcy11cYkRTXW/3eSRFYwZkytdgmFcQMW1o5axhen+jOLYL7 93VmEllRWyUILSC57dfXRC/5OJgKhYUmZbTPE/7rx8QT3DFm6MOoGVjqZBQve+r+rRzk8gRyazT On9W7L1gKeKboz6WooyBaMkO9YckNei3+HiGZf2mO80DnibZg/VL8+B2UBz/mBImPPdz2Eztj1t xiG2JkGbK4pcyJj3PqyZ+k/QZyCM/ENI4hy8KYTD9CWXH8DR/4PDjbUjN2IW7sRuDD6XKm3jzFG 46qZnZXzwJG29lxfKavjdY9g/P3BXCIVEWX8Q0IbUhQUr1Km
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084540_070594_ABD19C6B 
X-CRM114-Status: GOOD (  13.17  )
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

Hello,

here comes v2 of my effort to convert the pwm-mediatek driver to the new
waveform API. Changes since (implicit) v1 (available at
https://lore.kernel.org/linux-pwm/cover.1751994509.git.u.kleine-koenig@baylibre.com/):

 - Rebase on top of the latest fix for period and duty setting
   (https://lore.kernel.org/linux-pwm/20250724210041.2513590-2-u.kleine-koenig@baylibre.com/)

 - Don't report a disabled PWM when the PWM is disabled. Though that
   seems counter intuitive, this is the only way to allow the consumer
   to query the minimal period. This wasn't necessary in v1 because back
   then the driver claimed to provide a non-disabled setting for
   duty_cycle=0 .

As before the patches in the middle don't serve a functional purpose
because the last patch removes the changes again. Still I consider it
useful because it reduces the last patch to what is needed in such a
conversion.

Best regards
Uwe

Uwe Kleine-König (8):
  pwm: mediatek: Simplify representation of channel offsets
  pwm: mediatek: Introduce and use a few more register defines
  pwm: mediatek: Rework parameters for clk helper function
  pwm: mediatek: Initialize clks when the hardware is enabled at probe
    time
  pwm: mediatek: Implement .get_state() callback
  pwm: mediatek: Fix various issues in the .apply() callback
  pwm: mediatek: Lock and cache clock rate
  pwm: mediatek: Convert to waveform API

 drivers/pwm/pwm-mediatek.c | 454 ++++++++++++++++++++++++++-----------
 1 file changed, 319 insertions(+), 135 deletions(-)


base-commit: 68b9272ca7ac948b71aba482ef8244dee8032f46
prerequisite-patch-id: ec97edc20a72c4e283e74cec97c8cc6036e2fd01
-- 
2.50.0


