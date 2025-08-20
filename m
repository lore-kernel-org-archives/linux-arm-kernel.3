Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9F6CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=; b=cio1rXnLmutvMUlPu7o4K1WdUz
	jHv71rMT5gU/OOLzxVX6vSeX2PiP5Qfm3rElIOu7xuHHlZVuHQ9aZAkj3j0sme4uY6Sc8DSywjYy4
	8p7UHAhfiXKokO05fi/z5a4aFpLToWFIZjDMyev4WNb/HN3/JxIoeDM1p9bK6D5GK69DqcRaWR7kg
	lf+206/JSM6Eb1o6nmYVQsHbiNHfE/kLNL4KlQeV8X+ZETlXzQKKNsTzbqgAkhPdC4H2wjooiOeKO
	Q+myVAeUruYfcgGIbAPChT7ufH7hnnOMS8eb3o3Z+YaQcrFlMYrPNdAa08/qCFI6ks+0J1aXoG5yi
	KATCy5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosbd-0000000FF9S-1BUJ;
	Wed, 20 Aug 2025 23:52:37 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uom7B-0000000ESdI-0zB1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:56:46 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55ce5253a57so10678e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755709003; x=1756313803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=OX4zBXiz0AjRMF6i4hWnEpdTbm0S8XJAKfeaNCJmHlLAM0KQAGFRbM8260Yd9R1+jt
         6EE31Z5zJ7fwYtpDDoxV4KAbOm/eFs8KGNXrLG+c3WqlSeSY10OcGNjhBWPhLTU1BwxN
         o1DVJ70rlAj0h3XQmKSYbDqep+EKbevLzEhEG0mUr/r01QxgCnpLE4ysfcLkB26Wux6/
         AV6IPtSOf5uaP3zgV55xlAKHNOBaLIQE+qpTWIVFogE8YHFgekYkR1Hjvh0GfdA0vAtZ
         MEWe2sqBIt/GVsujzvJRmrp6W46GrvHN4thwauKT52SFiozr6bLDxAJHFvyz5temQOxa
         LI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755709003; x=1756313803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=O1EABdahaCRoUf99Qw6rv5bL7a55qTAB+stOh1bviJOI9+U0ixuXWT/KpwiagwbV3w
         /ng7w7F8lsLiZohLbivvBZcmwbQoGGq9335Pg8z1GjYOt8aQf5Nqq+3OKI/4qM5Bx5q3
         lx/lFo4mzkuBrNk9gYxqPvCP+nS0LpU4Ln21KDR40SSOSBeN1JmH6j/xFeMeTTWHzgWj
         OYtTXqxF6V3wqujAGUSQl9EN7yHp8MUgYs+sJxY40uAAAlyyKR2rBPKUmbH2qtMLTXnB
         rgiuwL6OqYcQrQEk8kynheSC8AMT52eH7NI7KPZxy6do7FO4ivAHcFopiWWmL00K80JJ
         6aIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRXYxk/TVy/2koWjNQKciuoajDTT/16hZZ8a7iFJOH7bnnT+543I9X1MdB8g1rGbEhNimKSWPabjZjygsOTOqf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ycZlpyFg56iivUwLM9gYHbrFwtFoTyBE5LPU3GeJWXAKLyYm
	SfIyl0V/VbdYwY0thLMeQwpY0Kii1LTHdO9DBD9VPldgjtr2bQJLZA8LsUqW8S7buaGSTTyNt/3
	45RaxgJ6J5bbO5TKzMxHXh8gJNv0mz2s=
X-Gm-Gg: ASbGncur8L94NtUaX4BQSKNi3ZwlCqXDgatQRMRgAYoFeYOmbo9r0gRqOKRxaLtOUZ/
	BKHVGcfcr77ERdC7Xa9k45Cot9O9yQ+OhRbwsSghZKSdPZcjaxtOs/KorYIvNk0Myfg7z2nDJtz
	xFfxC6AfTYjUhhyOv3LIpVJw/Mc+gXfrxaUZZJ5u/uEDXGDvaZxKHUiMNNTlj4sVdE8ohn0qYy9
	V6qJKaQiA==
X-Google-Smtp-Source: AGHT+IFordkwi+zhqh14qMBLsS0rCZnAYtiWQK4SHByXpqr16/xqAHI6fvghj4M6wGzn1kjHGF8rYjLwee+S/KYPvX0=
X-Received: by 2002:a2e:b888:0:b0:334:d4b:49b4 with SMTP id
 38308e7fff4ca-3353be411c0mr11491871fa.29.1755709003200; Wed, 20 Aug 2025
 09:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-8-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-8-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 19:56:06 +0300
X-Gm-Features: Ac12FXwH4g6oMn14HY8Y29rYZvc4OR3qKCO04rOR5qjEf-HjYlk-qdZaKMvaQ74
Message-ID: <CAHp75Vdh6MQzEZi1aLf+7J7evSwd76ANKDk6WahWzEcLq1Ew4Q@mail.gmail.com>
Subject: Re: [PATCH 07/16] gpio: ml-ioh: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_095645_266148_D419ECE2 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, Aug 20, 2025 at 6:59=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Acked-by: Andy Shevchenko <andy@kernel.org>
in case Bart wants to take it inside the whole series.
Otherwise I can take it via my tree.

--=20
With Best Regards,
Andy Shevchenko

