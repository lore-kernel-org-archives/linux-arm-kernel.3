Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771F4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+mqcC4nUfs+PmDPNc0X6w6K0gFUO863U6TSJc51xeI=; b=4v3ncp4erPUFWIyHW8FtigToWQ
	sz2FlFRhuHx38d9dQo8FreLEAABvdrzVhY3obaR0LgLVIXKbPVADDJYeJ7RGutpkNjxwdVpC9loJT
	tmsc02YPRetlOcrTMRLk93lVaMwnewLpU3uxC5D7Kk4MVPvGK9Ka4vXzkYqttz2B1rpu/3PBCEeMI
	XhEWjKRTULMZqBy1E34mg8MLpz+S3YkFBd5q5aO+kj4GcPl6T5YY30k62XKWyXqNEM0KekBDFGt/d
	mhsWIwKXyoGvhl9A3mTkMmUiCtB9nsWc6NYZ5+oIGb/+V8g+nN/80PKn97ZLSXejBgkiHpflnNp79
	zfB10M1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB7U-0000000A6DM-1YeN;
	Mon, 16 Dec 2024 13:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB6O-0000000A5zR-2XA8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 13:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/+mqcC4nUfs+PmDPNc0X6w6K0gFUO863U6TSJc51xeI=; b=a2Dn//Y/IJaox6etnTyVa8xHb4
	kBYexc8qr6kFdN8zdQfOzt5JVOqveP9j5DavFKiMcb0Q9WT/3ZG3/N8tMZx3onk0GD3/7MNHmKyYB
	Qc8GTwPxOy5HRg5JB/bIzngEkOOKvCT2pp/gRiGFOdgkfF8GdDEGtjmybgSmQeWX2asu309BHugKF
	RTpwNefvTHqhrwWQgXEshf1ECGhXVdwPzAESGEHCd3jjBjxx7jW4xszI3pdD5xOIo8VBQMXxTVyMx
	RvriZSySt1hKm1NBcfoQyRPJ6IhT/02anOHSdMISl3Siv2qKTcl+p8o7aoaBsGrSKQkUoqo64IuBv
	4uZm5ZrA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNB6K-00000004qg5-327z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 13:25:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361c705434so29164435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 05:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734355529; x=1734960329; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+mqcC4nUfs+PmDPNc0X6w6K0gFUO863U6TSJc51xeI=;
        b=a3avMeRkDpY21n4AuQFi1Msu8LkctSvoPLWLrsZqdpesn2YXawR90wpGhf0Ctya+mA
         t9njmOcRLLWX8Ck3ziQdixoJN2oEaPJhA7FpbUdbBt0TvlOnhqUI6t/LeXcMMzbJ09q9
         QjCrLFnp5HrlYrvs2uEptUoZIyeN0t0EP6V0CjmupPJtsVs+foq5rk5f4EbUqV62Py+e
         w0JpR5qAIO08fgxFJY0/e6q4O8UmN7VPPwNA3pZXSahrRw9pltqxLluqDwrdcHgXbfN/
         tXMYUCzMlse2uMwZw0M26rj2loK1DjS/yuIM/Cdfc0mBtYYRWdfUjopDxgULuUJnXB92
         MAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355529; x=1734960329;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+mqcC4nUfs+PmDPNc0X6w6K0gFUO863U6TSJc51xeI=;
        b=MXv9EYeClotgjwA5zzTChjo+UeOv7ViUc1NQO93M5fflNfOJWi7BMzP7f7gyMQ4hJl
         dotyUtRYH5WvSpSpk36awzHz1lEfr39TFNiYRTilTQs9RoI8yxDDCVu3jKafEQN1kGKd
         wMoMe5AP6y/ZA3XvkpTPl/U/Wvn9q1hQHpTPc58pZ96xjQR4tTrH25l8qx89LAbviDd9
         DBZSsxluqHBYNOhUCPc+Dp5hbKMTQOeqmisS6/Q3fXlZY0MVFOiVo44nMyHAo2oYVHzX
         xO7dcpcGFjnn5B9rImSm7odJ003/8r/uaHkNX/a5vsUHKKNStYfIvP1NAzxdrn8hBDQq
         0RUA==
X-Forwarded-Encrypted: i=1; AJvYcCUZMGAdEJV0B0xBkzatI8Wt3uUlOW2AXOYZoG7Dk7pT+P6RSO/JewhIbsq/YGeF1iNq2bMTse+wEY9IQAzbl9nz@lists.infradead.org
X-Gm-Message-State: AOJu0YypoGCG0KZWT4k+mcNu4f6rPebrzbpKAcGI3NkXAjSvs2eiYYsa
	i5fKlayc011DSo0U6Mj/WTP3/5RByqt/OxDjf5BH/+03NS+X8UJFMKskrpFZRl038DMdAT21el2
	7
X-Gm-Gg: ASbGnctlWDbRLRTw47HJIf24+88n+P6Bog2bNrKpTiBwEC9r8lDv3asPTf47+/mkflU
	kxJKALrsDoGXj5/77H0UMf2ygpsaYEmiy/5LonepNHuk0yjZlFchg3o3kYCoJdgRkRhLO60i9En
	2LHDTzTzvX+TCW8V4ueQo3fkZY4rpEnNKiUa7OZUlR6tReMsyIq4M+qsP0+DovY93+eP2dGE5yd
	SzfwWjMQWRg4BAt70VrKmo7WksLC30YEhRcBRf7WRCVj7Q6D1t7Z+4Q
X-Google-Smtp-Source: AGHT+IGIyE4iqHy6qjfXtXiJhLI3MnMB4y90ql3yNDbrxX8BJ9U/zPgLvNusMt/FrTysNv6gm8bzUA==
X-Received: by 2002:a5d:6481:0:b0:386:4277:6cf1 with SMTP id ffacd0b85a97d-3888e0b5977mr11178475f8f.39.1734355529380;
        Mon, 16 Dec 2024 05:25:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1663:6fb7:239c:2f51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80601desm8136387f8f.90.2024.12.16.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:25:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] reset: amlogic: rework auxiliary reset support
In-Reply-To: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
	(Jerome Brunet's message of "Mon, 09 Dec 2024 17:04:33 +0100")
References: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 16 Dec 2024 14:25:28 +0100
Message-ID: <1jmsgv220n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_132532_983479_DC9E92D4 
X-CRM114-Status: GOOD (  16.76  )
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

On Mon 09 Dec 2024 at 17:04, Jerome Brunet <jbrunet@baylibre.com> wrote:

> The current implementation of auxiliary reset controller, with the
> registration helper in the same module as the driver code, does not
> allow to properly decouple the registered auxiliary driver from
> the registering one.
>
> This patchset removes the registration helper from the auxiliary reset
> driver and changes how regmap is passed, to simplify the interface a bit.
>
> This patcheset depends on:
> commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset implementation")
>
> The above removes the only user of the auxiliary reset controller, restoring
> old implementation as a temporary solution, while it is reworked.
>
> The commit has been applied to clock fixes [1] branch and will eventually
> make its way to an rc release.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-fixes&id=5ae1a43486fb3febd5ce78da13eb354f16d049e0

Hi Philipp,

FYI, the dependency above has made it to v6.13-rc3

Cheers

>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (2):
>       reset: amlogic: aux: get regmap through parent device
>       reset: amlogic: aux: drop aux registration helper
>
>  drivers/reset/amlogic/reset-meson-aux.c | 85 +++------------------------------
>  include/soc/amlogic/reset-meson-aux.h   | 23 ---------
>  2 files changed, 6 insertions(+), 102 deletions(-)
> ---
> base-commit: 3d99f9231bedcf9acfb965a97645a8ecfa93a40d
> change-id: 20241209-meson-rst-aux-rework-e26c716c6762
> prerequisite-change-id: 20241127-clk-audio-fix-rst-missing-0b80628d934b:v2
> prerequisite-patch-id: 8bf55ab8ba9db1abea5df2554864a2f4f9c72e77
>
> Best regards,

-- 
Jerome

