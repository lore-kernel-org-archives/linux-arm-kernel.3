Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1519CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=; b=DjXMiOPh4goHxpTrfZM+zztrnr
	Ckz8qkD3OjtVE4PvD4rZzq7z18viCdFobwSMm6b4QDI5uOcKfWqEt5tn/49SV17Rc0KYQHXE93/o/
	K0OyusRB6QOy6l/T8Z1xytOUxrLo2W7O+XxsBUGoyd4b+2mritcfYfVjUgXjHMT6cx3ooMD+HK34z
	+9HZiLSGX7/vIeWNHUf5SGxJGH4aXz/IxtWez+zKC+qi4evQn/BAKs1qe7Ig6BlEUuRAOEauRtsuP
	Rnce0gy9CIGaK/jH1CDcbjFt03TqoZPRSA+R3R2gSFsusMQq+fct9qgJQGlRH2Uc6nCoq79EaSZRN
	6i758sAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNke-0000000AorR-1osQ;
	Tue, 19 Aug 2025 14:55:52 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLJ3-0000000APTz-3WBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:19:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-333f92f1911so38633311fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605952; x=1756210752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
        b=KQUQjs6RxiUujNOB7qpt3C6yy8EeQ08XP96Gi2wZDUanYqRZbcsdpS+3MhN0tFgDeH
         IyEd9DVazKmMLnfDHtgFH9KmfAeKuvCeNF1xcr6it1JVlE8rwrMf+HwOpmucxKRObfEa
         jW3tDr7g9Aab9m52T6r+Q0GpWA6HEpNq0+wIsWvP1R4/T+I5kFAH4ui8IoC9uPqCzf8S
         w42zT0YzgP2EZhUq1v3tYXRjKcbqjLK275yZWcnU3G13+SnErvA5CC/peypChXBy7Ouq
         P9pJINBNbTOWVGpGdk02JTS74+KgnPtMgdHjbYziP2YvpgQhbvgJ4DBc0VclbwKUQCHn
         fcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605952; x=1756210752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
        b=AWnhjFJ/LCHUBSlMPyJoY0fV+36JwNGOwpjx/H+6PimHssKlwTfH46JoU8vtzHZnuD
         ocMTv1I074IwbNDRuCgW9rTPrQrz87Uo/Ah2hb851dlfD4H86xcz4VZkjahuOOfazKot
         +fm6HkYAZgChyubNU0dmIJNQuHR2x3L3KWHmF0uhHo0QIVzbVVH0FrH60TV2vhU0wpxe
         Cv4E5roUO6vazk1kYkuVT3X3pdoXkp91/fTXbosphaX0VMXxMI10ApNQocF9XRgg9f0K
         kfIPS/gjtrZ1dajo3XxkznrtEA02qLIrOiZ0kiyy8wSG5Uo79wHj96Ja94Wb4VNpmIP4
         6TIA==
X-Forwarded-Encrypted: i=1; AJvYcCXKXDUcgaK5XxkNTjv89s0PVdOrDYoNvyqFdK5Z7y3c711hFN9Nqd1pOv6eT1DSxOHZxx/m2E7GTuDz1sC0JjIb@lists.infradead.org
X-Gm-Message-State: AOJu0YzFZg7TJcYMMtmoYb2LukF+BpqVaxaC9qLI9rKuYJobOQN+dW8Z
	LbU7pDUd+usG8IrSqQ3VZkvtOJGulAsPnLcsdKFX8t2weB84CNbMVWZ4azP3iRTEL9pYp7toN7a
	kdZsbFHXO9eP3yJFzikZ0uzRbGYyp6Qdx1HqBCsP+uLsQj85ie6Dzam4=
X-Gm-Gg: ASbGnctEARn1gDUPsmwPYaA55j4Wrt1TBZ1Q5Avtkpga1vDlnI+ofFPCSlnxJv4F4CZ
	zpsgNrOJHs/pCjMKc1WBzSkz4Qd9YTsOGzleN5yN97X3gMbEZOu996CmAuSf89RBVl7B0hPX/4v
	guyLyrn74dNdQRJAZzq9YuBr73wd0DVylodmnB8bMydY9qY6gxT/upD4/4qKx2N9+urSsVOkjLa
	fgf0rms3icj
X-Google-Smtp-Source: AGHT+IHsaqPH9hjr7u54X1LUFS04SWJNAP7LPz98uFiQfhrqMU6MDbmAcQVfPn//Z7iM44rJEqEQbl5npay+fB7TPz8=
X-Received: by 2002:a05:651c:1503:b0:32f:45e5:df46 with SMTP id
 38308e7fff4ca-3353073c91dmr5858371fa.37.1755605952075; Tue, 19 Aug 2025
 05:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250814181236.1956731-1-da@libre.computer>
In-Reply-To: <20250814181236.1956731-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:19:00 +0200
X-Gm-Features: Ac12FXyeObfcMrouhnaGZFteU5KOKCRkIGy1hUn_EywbJRo053Gro_IOs7It1sg
Message-ID: <CACRpkdb=OTwGyz0ArKPDdcBWU3nzrBF5d6LMHgNRgVsb9zH=bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_051913_910725_99981DBA 
X-CRM114-Status: UNSURE (   7.98  )
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

On Thu, Aug 14, 2025 at 8:12=E2=80=AFPM Da Xue <da@libre.computer> wrote:

> Amlogic G12 exposes PCIe clock request signal on GPIOC_7 pinmux func 1
>
> Add the relevant pinmux and pin groups
>
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied.

Yours,
Linus Walleij

