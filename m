Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BB7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTJc0cMLK8/kUGnVlLkEpjMd1IDc2KhUACzQgpu9b34=; b=VBAKwEOrvQJPokzoSsg9ZATKKk
	TjZ0w5DpgmGned9l9z02xkT5MWzUA/DZrTTwd6O69W5pu1VwYEhSzqGScdEeT5h662zUEAEBShZ0C
	YlFkxifDWvfe+pWhNMJJhQ2u+56yxC2akYk289dF9b5KDmOJKDWV3fbIr3dmXc6HLnfCkmdNu3PHa
	ZnAJ6YaTrn8ynU9N9JxflNG7dqfmh5+CDVwpfouhfs47m+nN4+2tJkx9UEO49vsrpp6KYpFybGmmQ
	N3Tns5nqFtOtSgI0GZAKP0+ngvslOzt0D8ezcjDmrk10OcmKLLu5+7QWTRx9FNBmupUmmDdDOZayn
	+BpTd9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirfS-0000000EF4k-1MKY;
	Fri, 14 Feb 2025 09:07:26 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirbW-0000000EELg-0OUi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:03:23 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so18397911fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739523800; x=1740128600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTJc0cMLK8/kUGnVlLkEpjMd1IDc2KhUACzQgpu9b34=;
        b=uR+1P/1zMw8IIXNOyRy8Ofc+hxgMNiBzP4hlYu3bHrzFYHu/RQuHQpCnnUq5T9ygpZ
         Kwnz6UNWjSd52qUuUYfME+VaS+A/Aozm5Bmq6fKGNs7JkWosYeNOfWqXwdBcnW9mN1Qs
         LZ9finx2NgyschWxS0ujojcP9Wm+rC1btaISZeVYKdlycdt2J7OISBl6h6HR6IZCg8R+
         9sGMP4tcL8EziSQS6GnymyOmXS14zquRP1CT0kLFKOMORpLu04mOQyVaU0rnrcinzuOz
         irhLkfJB7xUWy7rkgyhduAGbX6leKHKuNdpQ2GvdezhSmY0wfqGPVT8nKtuaiCJDwpxS
         Trdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523800; x=1740128600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTJc0cMLK8/kUGnVlLkEpjMd1IDc2KhUACzQgpu9b34=;
        b=ljmzzvcQjICnHCYP1EorxpdTFH5FV8PMVC6lGofjrIqXtMOtTBjbpFPBKxwYunEupC
         kScLcvjIZV3prKAi9KUAfjQOss99vP/8MjyFOLd+q1cLyPUuILot4nVld7T/k1wOK0nJ
         C5BL0mlzmgyMqr7PS62lIFv7771SM2OxY4IzKq2WAj4meAfcha3sceBBafY26nAYWXa4
         AIvAejmRjFWp7rkqbhXczGY+n9GE7mfK8Bigtsg1T69s6xIR31qtukqkPajfWdaHudaz
         XYTeXeLI3+KY6gZ7yxAsr9H09vamBwhdxdrfGEoZY+V31PjZCjuAOLjDhprEabIHa8cG
         WlEA==
X-Forwarded-Encrypted: i=1; AJvYcCXY2Ab0UHhQ6q60fBjHJkAarmBSxRSiL2zGw/PccM7ZfLH7UjijsAR0+dovuPK2OUCS9NulLEn4DjEm835DPwTR@lists.infradead.org
X-Gm-Message-State: AOJu0YwPnKfoVvorVl7jGgVAlgsMuBY6WgqDaPhdHkctjvFJuZnAwizd
	kNpPc7OSOGY3DzR/F6zvLcEVL5Lh90YtfWvxTJ/CvURSorOmIe33iAduMld49b5Z65C4F5/DUvU
	qydjG5hrrXyTSWb2UVyiPYjboocurjbTwbzn5OA==
X-Gm-Gg: ASbGnct9666DYiOp5QsgCV+9gyunG0e9pCeGKsdHyIfHwZpO9TDp/mM5h7K9fB4qqOx
	T5F99YJtPwILVNi4pBfWPGLmcld9TWfciBZDu+KZf6P8SWLuk+x5ueALKavBDN2gAYid7Z1wK
X-Google-Smtp-Source: AGHT+IF3HDdrnSW3BLW3bq9cqh3LStu3LTvk4uCfYArhbMCiGtiuvWWNtxSZE4wwSFlSY9sTduBuIBS2XR5LiRCWzdc=
X-Received: by 2002:a05:651c:221d:b0:300:3a15:8f1f with SMTP id
 38308e7fff4ca-30903927410mr38426071fa.32.1739523799914; Fri, 14 Feb 2025
 01:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com> <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-2-e7cfac9b2d3b@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:03:08 +0100
X-Gm-Features: AWEUYZn7NND4I1Mgn5Kpd46GvIrBPpNFG6Ldn40L_YZFFLWpE1zhxOGmLe4jdWE
Message-ID: <CACRpkdbwVdEa_xgR=wRfkPN2_tpYGnbdpQkTtvgDMRSKPT-GEQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: bcm281xx: Fix incorrect regmap max_registers value
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Christian Daudt <bcm@fixthebug.org>, 
	Sherman Yin <syin@broadcom.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Stanislav Jakubek <stano.jakubek@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_010322_132009_F9346F1F 
X-CRM114-Status: GOOD (  11.01  )
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

On Fri, Feb 7, 2025 at 9:02=E2=80=AFPM Artur Weber <aweber.kernel@gmail.com=
> wrote:

> The max_registers value does not take into consideration the stride;
> currently, it's set to the number of the last pin, but this does not
> accurately represent the final register.
>
> Fix this by multiplying the current value by 4.
>
> Fixes: 54b1aa5a5b16 ("ARM: pinctrl: Add Broadcom Capri pinctrl driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

This looks like it could be causing regressions so I pulled this patch out
and applied it for fixes.

Yours,
Linus Walleij

