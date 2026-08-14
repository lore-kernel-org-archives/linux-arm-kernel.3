Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F898C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GtjVz8aSkcV8b91bhUSgFtXdsgsr8VDTaF8d3s/S3I=; b=EPD2zUEYYiBw53yFIOwvasZWMz
	VmTuBvVsxtkPk1cn7qe/VQBwjOjFB0tS4H0Jn/whAMqP8nO2I10PbXiMmoUOifiIpTYD0CLRAgiSI
	atIea91uiZa5nBYeiQ+cgEVQp1cmpZoWf5O9SkGQabNWjpWyTIMaO8EG7hjuvE/h93N2RZ35uE5XR
	1pHzWKclcBLXQRyRtCtgrhNn+kbDtnlQDk0H6PRtNvm/f5hniYsSMH12vtP/iX33Ttmb6zfmgcDUo
	PNftvvr4EUFXrXstlPaoJpt7+8kOUWkhy90MsrUEAgxZNFWlMIBcIrlczrA9bchT0J5gUWUe9kPnV
	lGgXJ5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumtz-00000002FJ9-14vA;
	Fri, 14 Aug 2026 08:04:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumty-00000002FIj-1xQp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:04:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9714409FB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 08:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3601F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786694669;
	bh=4GtjVz8aSkcV8b91bhUSgFtXdsgsr8VDTaF8d3s/S3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EgDCmVTd+nFlCcoWLX1CowPzRJTPj7xD/6ijFoL0MQqHLVeKRF4A2fli3yami7BR2
	 Sr6IdOjib8bFJxzomPosLHtV0EYwbHi9MQnMr9PR1MttWcAkcf3Q+gF3U/0BRAzUNN
	 +9SJifjUswN2fD0lS3lc7O3vjhfnKL9j7sChv2jU+sn8gOhx40en2EaWXobpBrEIku
	 L0Vpz3hYnkLxu3Lv8Zvt2w/RhHNtG8VXcZG4YE1gkdj8krbwCUNd4OibMXhYWA7IIN
	 n1hsCeIQNpLFlLGor9T6MNwh5cnm0waDTQ+Dg+3EmyyTseHUVHQMx/LbWJqdNuVv/+
	 regfGSWNlzsYg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so512078e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 01:04:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobxObn+gk8/W/neM8HjWawcJZuKdJPRUdAE4tQY2LIbo0TLCUEXoMsIpV9we9WdsRYaI3HsOmU9IwTtobGkhJ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7NYVZ7ABHFAQC4s4CAW5YgYsotJL61GSHWlX2zyWAqhAck76L
	wdo8DQQ+6lYPL1c+/Tt0eoCiW41E1+u4nMLYJgcJmHzYLRCGXl8SdW2FgemLdope6KvhUtnRp3v
	8XnfLu70JbnneNfpZzHZy5+AxbkxGSsM=
X-Received: by 2002:a05:6512:ac4:b0:5ae:bc40:46de with SMTP id
 2adb3069b0e04-5b4591a3437mr500240e87.54.1786694668515; Fri, 14 Aug 2026
 01:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
In-Reply-To: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 10:04:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=bW+fFgwjYjUyKAenY-QkxZQxrRcYQKfank-ZNcVr2Q@mail.gmail.com>
X-Gm-Features: AcwNN1UyDExcAOXw8J37R-EEDNTfffTGz3BzYB-AtaE8hWwAMb7QYzUfCwaWE8Y
Message-ID: <CAD++jLm=bW+fFgwjYjUyKAenY-QkxZQxrRcYQKfank-ZNcVr2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: sync some modify from A4
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 12, 2026 at 12:22=E2=80=AFPM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Set the drive strength before enabling the output to avoid enabling
> the output with an unintended drive strength.
>
> Also return the actual output enable state from
> PIN_CONFIG_OUTPUT_ENABLE instead of always reporting it as enabled.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Applied this patch as well.

Yours,
Linus Walleij

