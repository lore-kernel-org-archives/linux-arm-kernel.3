Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D71CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=; b=NsS5tK9CIyFGjJS2E87uRFhPF9
	1yftc6UqGVZLbE7r963mPh641INRrGNRNjGxDQk5/RYu0RHuoHWzDpABrOn/3BLrv1ySlF/f4BakI
	NLoMK6QwWUXfK+bt7rCNcrsnJKsBUEAQiZ8YgRm7hcLDVdI2IJbqBi96L8wiGuvlgkzne6AQoZ30q
	URay168XmHYmcvG4faSXTMDSYd//CcjKU6mb4EG0K9FI3bMgPeHYtP3J0Ga4wFkAH5/xwxf0DQpEJ
	q6jqgDrf8EUx7pjQ24c6TVZYmMeYCHKNKjO5gF/2ARp/h1BCb9QSbDTIJJJyV3b5kYp9b2ujcM003
	2mMAVeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Un-00000009499-1hhS;
	Fri, 12 Sep 2025 12:03:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Uk-0000000944i-1vY2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:03:15 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-560880bb751so1818962e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757678592; x=1758283392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=;
        b=FkAYOMyUAU1mzDSLEpYpfdAg0FfCh6ZpRz6zFdRCdyc/ooPP9nJI9QpSSqytLnU6dw
         5nvzMk6at6GFPPo97FdA5U/ocSM2g2+Ss6N37m2Lk09g3wCdKPMwEEF3sLVz/Le8THZr
         u1hcj34EugzgF8wh/mUaO6hvTghejWka2uqzv2zQlQLiUjPvh9DCrFLayEM9/WSfXCpC
         GrU2sFJny3ZmH2a1X6JmzpjsWcKupKv4Rzj5QjqaukiQ6qOzbsf0jPCP0iOGKLWnJ02Q
         jQTlrWw/CTNqtKPju7RJJR5r4gCOgsfsx5ir/Y/C7dl8kOxQy7dzL7WPPcc7rpB4Z+0j
         PezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678592; x=1758283392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PdFHKIGbwFEvO78k7VYipO5DNz3mTKctmHS0mOU/VI=;
        b=H3/dygcLKgAe44P1tt26DDQ5DscuIKegsA4EdLji85nRoHgPapBkI6wscWf4DVszjT
         BGUd/etAnjm5gl7SWrdqFV5Ebl8cxorpjcQ7j6wzOZTpkAd41Z2lzDtwfwdbdRHATV4k
         kETk31lIvCabOoS4Dwg5UWkTh7DFJ9sWkwhamW/8gbYj+bN6Vk1fLDw7mygAg4TwfLKw
         66qwvqeitkMXtDgQXQV9EY5JxTeMF7BX1UGvuSqQuBTJiuwvupEmmVYqlwBsdH/NU02Y
         u/Av2aoJaYX3B+FO/3J294M3hTfqAdpRQ2qkSq7eTatjeRJ4M0QFA2xJWAILOqWdnG+V
         7PqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMEggf46rYlx1uNg9madeyTr0E4TSqQ+YaNY6FyKWksaABLQ82HBmyHGTCJb8hEylkKN7XEQjCcu9xrytYY30F@lists.infradead.org
X-Gm-Message-State: AOJu0YzI8DvWs18IfSKchsvWXR1gkkrMqNx5pzFiNJ1EBfdjuYypcqWU
	Zi/lihuVN5C5RQt0r55ln1x3G7/zFdlLWntSbcGadGHbqF/moqvoSgVgCvs/MoLewJTJ8hskSwP
	d5stIb65Ib5z0PWuTt9YMeeW38MesktX9GhPHqYjOgngkVyKSuj7FxPk=
X-Gm-Gg: ASbGncv+3UKePJLpGXarSLwpfWWFK32ksw8D98NI6+wqEcBUbJuydfBCHvEE1MJtq7F
	rEkLS3Up0qObD6JN1wqQIrJg6vaZameDdvyb7mPKHJ8AgBj6QsE90d3NJy8iaVfUnyEn1WPcLAF
	vN42gDPpROEMfJc6ejvAcuDo4ScCBSTM9sHW0C7GbVi2BUinAk7p5suLQCBYbbwK4JSEK6wG8L5
	N7/SEU=
X-Google-Smtp-Source: AGHT+IGSZOlTW8CCLhnbl5TBUxb6BdFbzV6+OuHe7/KsFBuH3oWJWnilJXYkrdME2jw+G6yIQ8lGS/eJCMYe6xHrNns=
X-Received: by 2002:ac2:4e0e:0:b0:55f:493c:ba2b with SMTP id
 2adb3069b0e04-57051f3c661mr692236e87.49.1757678592231; Fri, 12 Sep 2025
 05:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909181841.102103-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:03:00 +0200
X-Gm-Features: Ac12FXwqQ4S6LsJ5ISymFmSoLLy-PySRhoETtxxqmtEpkSI7Fd-SoneEsLrhhRs
Message-ID: <CACRpkdZAt2n2gd7TuwRiBzUwjKy-LH=d7EYC7hg=j753UxKQYg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.18
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_050314_506322_168E59A9 
X-CRM114-Status: UNSURE (   9.76  )
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

On Tue, Sep 9, 2025 at 8:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.18
>
> for you to fetch changes up to d37db94b078197ec4be1cadebbfd7bf144e3c5e4:
>
>   dt-bindings: pinctrl: samsung: Drop S3C2410 (2025-09-02 12:31:25 +0200)

Pulled in, thanks for taking care of the Samsung drivers!

Yours,
Linus Walleij

