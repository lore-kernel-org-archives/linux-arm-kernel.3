Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F12C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=; b=IicyljLFS8smqbm4Mr6dorLjSc
	yZwLL41eqMVLxp5AuRnO8ElYs41WwXzHfcRmI9jTrm9J6LB3J/QBpJ1COqf5YikFkIrTKljo4sRAy
	eRcCo1LFxQVBgko8UqdvGYjsLo6o9WXj8GfnAkFPSoeRDfHrpxT+M3rX+wQZxTnzcFb1qZHK1+O7N
	e1oz27J9Qx6UqC/2MiTQNwoywZoARzJeQc3k7QxqlwRGE1cc1Nq1g0IeTgTT1tHGl6uZtIlO06P8A
	w0Ye/8H6Te3z+0Kn3e/xI8vjCNmfK7/NXy/7cPqn684jjRqGMd+9wyc0pFyj/9MgLRBshsMuVnwOr
	hAybb8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9jt-0000000EOrG-15vB;
	Sat, 19 Jul 2025 15:44:41 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9hO-0000000EOfH-3tts
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 15:42:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32f2947ab0bso23727191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752939725; x=1753544525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
        b=U4Bgh//dHYzKxFZ4JNKZagZSLM6Iy9lVj9LB4jP04ljM7RxgMMj4IyByvgB+3AXodh
         EOeShJUsVbGVsL5rJjAmxY0/oCVWzOj7wYDobEg3Sr5t4l26FxWcMukvSxavoqoQCKYV
         MZ0bmLAIhf4is1k1es+HNumjW31DNcNjhlJNEdyUMwyAP0VZGpU8M2OXiT6s4/qKN2E5
         2VZdLDBGP9eWFBnRNH80QVBP5hrAHHijWbdGiyJbM1BSQofpEh1dZmFjbkU+P8CLBBjs
         gxymTlEHAFC3ksz77Kl1qLvf+duGvKLh/R39SvRvQo6sp3xuhQnS3mZIEOibC+ViA3i0
         YGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752939725; x=1753544525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
        b=PDuAM8mEfpUZ51SJCwF0Gy6SlmNewg6MwKTmTT9zEi0d+FaWySllG6QiTLgNdV0ROf
         7DQGYpjtJTvn6f2y0kxTlUrWw+Mw80USoToCyje5OEOHYon28dI7HInFW3QIzHtSd5e/
         52URdWN9FVYsvOCpFx/Gy+wmC9hLsil0lH2rKnqRBvGKEOfzbPUlu/0R/D4pSxI3FwVF
         kM/8xh/nwFwyMJv2awMiPJB7Vn3wNy2kbTABdv/cHi7C0yZ4v+69yrGyNt1QLLUePw5m
         Jiz13ZcXrVN8doagnmlkEaCOqWS45tsL0wjounPgscLzO0HUibrovMmFBj5oRLA8hIAP
         BknQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvoKwkfL/5MxdpCRYi4FapFKV7Cvdot5HGoHR8PcNMryBOQLp48zzBHqgZljI+KXsnl4HVn0/XT8o9cOHZHBaN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi2eAXtye25Tit8g/lDc2lInoMV0YQmoW6NhftBsJcSYsv0uxG
	X/a7XWvYqYWl5Jyotekv9Z2uUmYTUGdnBeoTeOSNi7Cn9M3Jk+08C9NKBVZqkQiAZ60QoB4BYcp
	Gx15achBjTozTVxWKMxEBI3GfluTYUogDIfZYlh9BJpVOTHjtct/m
X-Gm-Gg: ASbGnct/9LSp998oZ/7x9TzdMFr4TnMVp4J668gsm1poHOk/A28zKORYMph41SIYv6v
	pa307YU2NEJjiP7j92oQDRf1CTxtxi7WR4SDWH9/cBMF6rDe2uJtNxbCQofM0hvyipe57F/ax4X
	VZfpX9xqp+3pVYdN1BFY1AutjIVnVjfLqTiIBLw10P9cmofPgxg138OKmDb9xhu9xiT8g7rgKBq
	yUMSgE=
X-Google-Smtp-Source: AGHT+IHz0AgUzYYyokGlt/TZ09DPKHJYVrOty6k/FTgVY5vV1r1KxHh9aV72LWBbI4MCzMrbevh/6hzgi1HVNc+Usj4=
X-Received: by 2002:a05:651c:54d:b0:32a:864a:46eb with SMTP id
 38308e7fff4ca-3308f2b7638mr46687401fa.0.1752939725118; Sat, 19 Jul 2025
 08:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org> <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
In-Reply-To: <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 17:41:54 +0200
X-Gm-Features: Ac12FXwAlxaX4ocIXQ1MhtIhdmA9pd8x_pk-4cH3CUUGhFSCjbZy3REqIbEaUb0
Message-ID: <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Sven Peter <sven@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, linux-pm@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_084206_973683_2B415095 
X-CRM114-Status: UNSURE (   7.78  )
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

On Sat, Jul 19, 2025 at 2:59=E2=80=AFPM Sven Peter <sven@kernel.org> wrote:

> top posting on purpose: are you fine if Lee takes this commit with the
> rest through his mfd tree?

Bartosz should answer this since he's dealing with the merge
window for GPIO, but generally it's fine, and it's even using
.set_rv.

Yours,
Linus Walleij

