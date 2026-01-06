Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B371C47BCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=; b=J6ax/i5i/lEBsWa6YZg0IJ35LQ
	y52LKrsyaVRRRtMSYvM9ayvB1OcjET+0ZcV2WWmsWPzZBQtR6Yu7tud9cmRg+RLz8PBft046tJ4ts
	FOrFCx4RZ49dAAAlCnKLE6HyICbOnPYTK9yiIm2Lob32HZMlVWoQYkC3oS9rz+YYgfHAxPv8QOS/e
	RAEphj/m/5owu4juq8B5VNMpUTTBSrNWytDCBzCCjSuaLVVz+GoISQLxozHUWvTMHDfpttMxHGRq4
	7gzfqJVMCSJ+09gfiCGPCnvWcCZD4CAa1ZQZ6PJX3nMufrov+ECXt2Ojg5nz/gWvwEWH6ors33q9+
	1HcJPq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2t0-0000000Cecf-1FfB;
	Tue, 06 Jan 2026 08:57:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2sx-0000000Cebj-16yq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:57:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a07fac8aa1so8602975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767689870; x=1768294670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=;
        b=M7Ja+y6lQ1h8Bt5yNtv0p3+jdk/3ArQyyRGU4N3MT1sRHkR76MatuWI/yDKukLcuDn
         3WtAlohXNmdD/Fu1QsIBVwmVeVnvr0T4zp8tEk/DwOgOE3vxvKPR89CMbz9K9Lsi0yRQ
         jQKeT2I1SVDQOWWG0bn3U8SoXvV/e6kSpdQbwzq/UkrfgEUQPlCVd+VU+yTPmYqEkTgg
         pSvR9LXsvae21wwgJHjwAtY1NbFTEsMU25WhaOdH8lVz++eglawptqB2gdZO+i+wgINJ
         0vYvgKYo7RQwwMVcnTG9o7mSbazuFnlxl/dxZNY34uoSYfXy7UlWSYDqhr5LEAA9mtv4
         JfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689870; x=1768294670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIEziJptyk5NU5d1R4im25WNnI9+PWCcCW6Jz9T4txA=;
        b=Ro9Gs8/aSraO22vYSPUBY5ltfqpFpBi7kiwEfEdR1W3mi+K6akeYMnPcAV6+FqmHx0
         RJOI7lTyXjkIVMzMKVGSXu7wST/mRpEGbtW7YafKwQOIAh78LTWkgoKDqieH3q1Mkz07
         mT/x6zwBfT7OjavJxfojcQrGyyHsqtM8fVZVDkq6jIomrWdKjX0Ch3MRpSpBZqy48i1S
         ilszV7YLLP0jehie7W2OoVbn+AMQdr5gPmddCfbdDYcVkW2M8x9f5CWOZfwXiMCjBD41
         xT0+FNRyWhX5z9UGv+VWgaCVCMML/GI7Sd7Q9VJtYh0P3HD2n+3n7P+3gpVgZgxQzx5/
         CfYw==
X-Forwarded-Encrypted: i=1; AJvYcCU9l7/5hIpi+GSYXnB/qfQeDLYW9qOdeuDEhSnYHpIQCYCIPCgm34pXyNCJlUXsmrJr8g+125RtnYtslDAZ+Rco@lists.infradead.org
X-Gm-Message-State: AOJu0YynIDwkDpCvwH1/fDyneqkYyXNCS6IE7Jid2d+V8f8Vhs3AiH9m
	3hckxIKnALLq5N2JWyqOepKJLUap/DY7w/IJjZlZHZ/kdiH5bYOWHQhMZhcWRwkPlHlcTuGzZZS
	CmCjIkZ2bt9/mizp0FZJdnD3hRyaCwoo=
X-Gm-Gg: AY/fxX43stDh/cr4mdGGyzRZFRuIHriVj6ajPrME6iQqDSw5Q89lpZSqZqzMJ5fO31D
	3cEpAqOYS0XIyplYjUzETzW7uSEi5E//qeVE35LBrBAwy7z7fcNk2atYsTLCe5GVpnVvxebtDly
	nkRzWQUj9Jq8fKdkZPZzK9SmTJuOXECZgO76V1GW94Gpa9XXkUQHcQiHz1IlKj9SdpMUGbMR67e
	Qo0Q9RVR/gNDhX5C3o2CEniFWp+R3mqWwK/H1iKHd2e8MhqxKOeKoJBCKIvziLGCS+9tX+Ui+Rq
	AwdmXn1uA9zwlmn0ETNbXlMMQLA=
X-Google-Smtp-Source: AGHT+IHqqVT35RqtKhqDVDeUn1JSuMEyVNYWSpbNfyaLVeAjnwJc+ZCsnwel1Ct5vYHiZKJmXURlUF7dYeogNEgy608=
X-Received: by 2002:a17:903:1aab:b0:2a0:89b8:4686 with SMTP id
 d9443c01a7336-2a3e2d1987bmr23189115ad.46.1767689870271; Tue, 06 Jan 2026
 00:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 09:57:39 +0100
X-Gm-Features: AQt7F2ogEhOYqvAtPAq6OIcx9b6m5SyZMl6Xih8xD56bOOTG1yFuzVoJm_ASy1o
Message-ID: <CAFBinCDfV-f98c+3EXWVqFkBidsm_OZmfBZOqh7F5wWR4w88tA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005751_304981_7E95E6A2 
X-CRM114-Status: GOOD (  13.46  )
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

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization.
>
> This can cause the following lockdep splat with shared GPIOs enabled on
> boards which have multiple devices using the same GPIO:
>
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
> kworker/u25:3
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> INFO: lockdep is turned off.
> irq event stamp: 46379
> hardirqs last  enabled at (46379): [<ffff8000813acb24>]
> _raw_spin_unlock_irqrestore+0x74/0x78
> hardirqs last disabled at (46378): [<ffff8000813abf38>]
> _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (46330): [<ffff8000800c71b4>]
> handle_softirqs+0x4c4/0x4dc
> softirqs last disabled at (46295): [<ffff800080010674>]
> __do_softirq+0x14/0x20
> CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
> 6.19.0-rc4-next-20260105+ #11963 PREEMPT
> Tainted: [C]=3DCRAP
> Hardware name: Khadas VIM3 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   __might_resched+0x144/0x248
>   __might_sleep+0x48/0x98
>   __mutex_lock+0x5c/0x894
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_set_config+0x40/0xdc
>   gpiochip_generic_config+0x28/0x3c
>   gpio_do_set_config+0xa8/0x194
>   gpiod_set_config+0x34/0xfc
>   gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
>   gpio_do_set_config+0xa8/0x194
>   gpiod_set_transitory+0x4c/0xf0
>   gpiod_configure_flags+0xa4/0x480
>   gpiod_find_and_request+0x1a0/0x574
>   gpiod_get_index+0x58/0x84
>   devm_gpiod_get_index+0x20/0xb4
>   devm_gpiod_get+0x18/0x24
>   mmc_pwrseq_emmc_probe+0x40/0xb8
>   platform_probe+0x5c/0xac
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xdc/0x164
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x80/0xdc
>   __device_attach+0xa8/0x1b0
>
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@=
samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

