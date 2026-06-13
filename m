Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB39CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aaaLGtGMdloDgmx4w88ZqZn+UMMDoCbT7BG6Ejcd2Y=; b=mxSzsBER06o+QSqYysGrx4Ycc4
	SMRljts1z/qvUoMPflRQc0LQJeOWX2NguSYa6yjIwAisqMUBjxYuX1J5OrvetLBMTQ209nTm9icRJ
	eBghCl0aShXNmnIRJIFYPbeqRJtZ1mwle/B4d6ZMG2WXZ28fIQZYEBhpwE0gomrBW/hWzL66aeEXM
	fS/Mr2vOS3q3lQr0BpDkmqLmVcWlrk1hzqdAh217puieiw/JFB2U61gUL008jt3YQp94fblgEvwpe
	cWlucEk5FViXwmRNdO6/epE2hYibUez39QKguTQSYiWRsQtqSFlNw3js5Jy/Ypp+edVrmX3o3OeKH
	taVd42Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYChX-0000000Br9p-0bwZ;
	Sat, 13 Jun 2026 00:58:19 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYChU-0000000Br91-1u2N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:58:18 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-44273dcaca8so774873fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781312295; x=1781917095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aaaLGtGMdloDgmx4w88ZqZn+UMMDoCbT7BG6Ejcd2Y=;
        b=SdwfmPogSbgpSNUY89TvvpX6aP1EmeU6dqAPCLXclOqU3uXBhGcHkoNtayLkW4/K6Y
         2V9UVk56ZZKY2VbSm8q9jIFi8zxVZmxJQkln1qowFsCHpc/3JEmiGnAKnUNX4G9M6zj8
         Wi5cQxhgtAvuqggGpbY+B1XFeM7WZerbuzwWVHZVbsBb9xN/1tsAwCcSNRlZ3xZqBPRk
         c71Yv/og0tLgoB4LuQDheWhurlG/YTtA8RhF+10YrE4QAnPIaqgqS7OmkPqrpZ1CtlQn
         m8fWs8SdLFYl1nQAZaf3D0cITOIKuAorQhtzBiw74/rIVJHVLpfnf61ZUBdDbe72rneD
         lCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781312295; x=1781917095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aaaLGtGMdloDgmx4w88ZqZn+UMMDoCbT7BG6Ejcd2Y=;
        b=ermWH/mZq86pTDIWwwcTc2CDoJGXxYYjXeI1DNTCKYPGK3fzBtERdrMoRJqgetCG/3
         MiJBvwzCnh8ExpE9HycdK++gb9wUPVEUMvKOgI0lZHvjfEesb6m45UECR9TyOKI9JQn/
         sEzZev0HQ0Yi8P62JflEcrrPpQtHtroaxKLVRBd6xeybQ+8o88GIBKKZcbL+aFum29Bl
         3pLARXjuH0KUOiRlMoAbauqb6E9OacRsgtNb5OF37LbcErL21kz0/w40JNaSKAUYpx51
         lcj9ei3FUf6xgACxMeRvdB/EkN728nHFmB2+w79kP1xA1l/ONvqH1O1zrFrrRbD9Qo+f
         wEYA==
X-Forwarded-Encrypted: i=1; AFNElJ9kzPBlDOqshoEi69zKjpaFY2D75gzRemM5UyM3u/6/Jj8Xl7aX6YWHKTJVNC9OJOjwrsBR0Q/N85QfabGh2V0R@lists.infradead.org
X-Gm-Message-State: AOJu0Yybatnq2anaWyvXAImeYdC4/2JJWV2DGOOJEFpaDbPUfxgvCz+4
	hRAXWZsn/6XeGwWv6ynSQO33EQeFqMrHiFyuDwJ8LQI+a/EX63JsT3Ko
X-Gm-Gg: Acq92OHZmtVbm+YTeUgX+zMrhvHYIToE0FdrrQrI7SxH/oUShOL/kFKqyfNjQzBzMJs
	msbVgltnOlRMj5EggZ5J2/8V9NBqVLxkW0lS9AG8NCdxyVvz4Lf0bZTaNj6V2Ej4DUPMpVqo5J7
	Wv/KTaT3+IXDi3jc7MMGijWkJAklGo6lGD6MX+yNA2oxFb43uVhtoqWq+QRQXE4K54CImUyZzBQ
	ttA9WM+QzoZuK0Lznk+tyoifa8HarzPo9aBf6vjrNUcWPTymaOU1pdWTmVvuIhnECF+TSMfKrFu
	Rl6z9QWz4T3izInpo3GRHCgKJCZs+GR0kMtTMghpljLYu+Jjc08C1npZQj+KKspEVcA5b9EQbXJ
	a0HyKqSH4WpSZiKFEnrNbHV5uOAYI3iZHg9StZYDZ/B3ZCfWOqsOUrgj7QuQTUmDC3V+w5CNpAi
	Q9q8bV9CTQf80zVjuZl8yo+7Vd9tdXWuYAwfqmTwmkmNo1DICJPshlVKeWzA==
X-Received: by 2002:a05:6820:211:b0:69e:3868:a739 with SMTP id 006d021491bc7-69edd76b56emr2093232eaf.24.1781312294619;
        Fri, 12 Jun 2026 17:58:14 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4426abf260dsm3150731fac.6.2026.06.12.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:58:13 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Hartmut Knaack <knaack.h@gmx.de>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: [PATCH 0/2] iio: adc: Initialize completions before requesting IRQs
Date: Fri, 12 Jun 2026 19:58:09 -0500
Message-ID: <20260613005812.160572-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_175816_497661_8B6DA6F9 
X-CRM114-Status: GOOD (  12.48  )
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

Hi all,

This short patch series fixes the issues raised by Jaeyoung Chung,
Sangyun Kim, and Kyungwook Boo regarding init_completion() and spurious
IRQs. The report is linked below [1], but I will also put it here
inline:

"lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
spear_adc_probe() in drivers/iio/adc/spear_adc.c register their
interrupt handler with devm_request_irq() before they initialize
st->completion with init_completion(). If an interrupt arrives after
devm_request_irq() and before init_completion(), the handler calls
complete() on an uninitialized completion, causing a kernel panic.

The probe path, in lpc32xx_adc_probe():

    iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
    ...
    retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
                              LPC32XXAD_NAME, st);           /* register handler */
    ...
    init_completion(&st->completion);                       /* initialize completion */

spear_adc_probe() has the same ordering: devm_request_irq() for
spear_adc_isr() before init_completion(&st->completion).

Both interrupt handlers, lpc32xx_adc_isr() and spear_adc_isr(), call
complete():

    complete(&st->completion);

If the device raises an interrupt before init_completion() runs,
complete() acquires the uninitialized wait.lock and walks the zeroed
task_list in swake_up_locked(). The zeroed task_list makes list_empty()
return false, so swake_up_locked() dereferences a NULL list entry,
triggering a KASAN wild-memory-access.

Suggested fix: move init_completion(&st->completion) above
devm_request_irq(), so the completion is valid before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>"

+ Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>

Quick note, I ended up editing the report a little in the individual
commits to match the driver we were fixing.

[1] Link: https://lore.kernel.org/linux-iio/20260610115700.774689-1-jjy600901@snu.ac.kr/

Maxwell Doose (2):
  iio: adc: lpc32xx: Initialize completion before requesting IRQ
  iio: adc: spear: Initialize completion before requesting IRQ

 drivers/iio/adc/lpc32xx_adc.c | 4 ++--
 drivers/iio/adc/spear_adc.c   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.54.0


