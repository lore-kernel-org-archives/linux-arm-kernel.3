Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC3C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTFP6ZpMn/k1zzIlbPVQLLkt/cLEj8+uvjfAYF6d4HQ=; b=uRwyWZUC04IK57tYNWM63R+QhN
	gwKbT9u/+OLdqlqPT8fTW6aN6xXQFJ43APTF0+u87rP3qeaIgCj2qXyrwRdQl63vyUm2ayHEZKzRS
	EoxH67SlHYJOEZJjull1XJAqqRj/ZSizmcBLmaN59CSEarpLaTTIzkl3yrVQZ0xwDe47G41UxdOer
	3fy5w3joI80/x16n6FHZ2TM4YCYV6z5JMudml3/UNH7Eumcu9EUH3+HDUo95kj6TdaZHItjIhAHUC
	THmeK291+qX1QYDYfDXv4I2me46DirE03Yel3R289PJoXUY9Xi6Xdr4NEOXZd/VUnaI0Y+tI3TgU3
	lvKbzfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1cP-0000000BgdV-0UlX;
	Wed, 15 Jan 2025 11:31:29 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1a5-0000000BgHj-3bR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:29:07 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3047818ac17so56163271fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940544; x=1737545344; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTFP6ZpMn/k1zzIlbPVQLLkt/cLEj8+uvjfAYF6d4HQ=;
        b=gtQFkbGJ9ckuVcfdNRxVlSQ2//dVED0XiyqbrDgN8azvqc9KRlfcTEQf37yitI+YK5
         0VteJwpXXGE5eeISRJmFOw8SswedofSImTk+rY1Iq1WEF2lGrhpu4zHHDqWPswWjRNi+
         6HorDHGqeiBJBZDOYh82gWELju2fxV/puxMXBGazUn5Ooa0pworPKK+vdcFo4jSd44Ud
         uzs7B6W6LJcrmetMfXFfezy6zcEY5s2xX5jk8433OPw13cmE7bSz4bzVldmTjDrB5WHs
         B5J2JSvehgTL3JcbeaVXHWOIZZlQrjpvYpDd34u1fsKJ7m4hRpFOjmm8kPew6PsQdIwG
         7jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940544; x=1737545344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTFP6ZpMn/k1zzIlbPVQLLkt/cLEj8+uvjfAYF6d4HQ=;
        b=JHoytVTsE88h8qi7JTCteeSpl2um7FNyebq7qWkUtWXMTSQ09l1SOQsrCEMsq+/7Zl
         KuTNkbyfhghoryusagZ1Zr/9YzQSz1A/YUKoHgJgASabR/7bocEWEkSiTbol63IGHUm8
         I/uo8RLr4m0rJKzPIYA6BF8TFLieKyC6e7aAxY+EygdP7yQTVk2tu4OZQW+Y3OCTnlu2
         1kjanzxdCYv2LG+MfgsM2NjHhUeldNIba457Ou/xcE/Un0DSagG1Hy0SWCBSJWKdW4gH
         s0sCRkrY15X4BMqLAiV5TiEIMvpmnQAw5hWvGy1X3dYKWU3aufvYpAYoKf+SUiXUY/4U
         zQWg==
X-Forwarded-Encrypted: i=1; AJvYcCUTQXzMXVVV28Nvyw5cqrBBccUII1j1mMu6SsVm/2o5Ogyx2X291FKVnxnya8HdxfLdPVe9S1aGn9DJH9q8o+og@lists.infradead.org
X-Gm-Message-State: AOJu0YxOpobas9dqhNyZ6MnpM2PHuFuUFW1qfz9TN2U06rGBEsdrbYlx
	PPscrsYLhszrY9ZgG6obSxpiyVB452EnAqVJ/vaWL3v8tDfF03wPHPLrKuKYZOWGs6qjzilF7WU
	MBI1iv4E4T/Q6IzsMeZzcj/nqq41GqHJI6LlEzw==
X-Gm-Gg: ASbGnctjrb7cX+hep7aupTk07js5OMqbj9SZEGn8ewer0S3OcBSeUJkGatNbQI7ZCnU
	SAXQ/3KlE88qTyCrhIbAmBP+cWvnCqZTuz+nq1Q==
X-Google-Smtp-Source: AGHT+IGozXlEMI3LBw/qY3E+yx+y/orU2yG5EeAWz02nrW7RaGJmBfZlWUTPktBH/YT5OusvKQ2aNuo9qsZVZYVAgKY=
X-Received: by 2002:a05:651c:4cb:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-305f459ab0amr99799851fa.22.1736940544130; Wed, 15 Jan 2025
 03:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:28:52 +0100
X-Gm-Features: AbW1kvauKuAE65tppT9sI3Z5Re3aLNOVxZNOfHCRFI6_U39r95LgRscj7MPl27o
Message-ID: <CACRpkdacgLmfusCtN=beYoL=pM7_f7VzHa6pzRbmAdYoYPA7hQ@mail.gmail.com>
Subject: Re: [PATCH] clk: nomadik: Correct str_enabled_disabled() SXTALO case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanislav Jakubek <stano.jakubek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032905_901681_0168B4D6 
X-CRM114-Status: UNSURE (   8.73  )
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

On Wed, Jan 15, 2025 at 9:19=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Commit 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers") should
> use reversed check for SXTALO.
>
> Reported-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> Closes: https://lore.kernel.org/all/Z4diEj__bbQl4ULS@standask-GA-A55M-S2H=
P/
> Fixes: 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks a lot for fixing up this Krzysztof!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

