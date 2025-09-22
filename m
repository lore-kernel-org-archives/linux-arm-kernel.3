Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A82CCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ug0zAAEr5kbnK08BBV4RWvp/VJgoebn0vXwAlF1IdfQ=; b=l0MwgslEnQYGe4t/epsCIpJssf
	yKoHRTmfaWWEnRzan5QzZpL4C/buXffFW+pemD2OXaD8nQJ07vN5ze79uuiYjH7sx9FulFLdlEWTr
	dlhO4D1r1GZdr07aVrbWsblCx5NWfvLIS9Se5kYnwaUCIxUguTToP9gsUOaqdSvWXI5MA2i8Eu5Lb
	csBT2PrQ1A6Kc7SWZlPaiASI4+8QR33B+7ZoyDF6oCp/4IRXlVY/P8mBYqm7HCgOO/m92PGLnoHd9
	qbWu6KQ0c886uKaIpoeSmMZ5W/OLvdHgDA+lKRUCyhr6iHoV8q1IsnhNV2H47LwGmT9Hdiotn1bmM
	lmb0qhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hPf-0000000Ae3H-324p;
	Mon, 22 Sep 2025 14:21:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hPc-0000000Ae13-2TQu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:21:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so1982609e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758550862; x=1759155662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug0zAAEr5kbnK08BBV4RWvp/VJgoebn0vXwAlF1IdfQ=;
        b=whuizOuYjT1oqqmtUigzSsXjDlFt7rWrgBj3mXxyUhInwjDiQG0ajCrBRXAMOLoySi
         /+ANJbMN5Ipsbnr1AyB7Mg0Vv853W4a+I4sGkHaFaliU71At4kDkIRBSDsMoud6tJN9D
         jZQPyiSAerAY+0tq609Oma+DRU7cAHwzbiRBGzWi7sMXWKTp29N8mXGTfqQrpWVDYwJs
         fAWxq+gL0X4OlSUfd1h0EPD0kaWLKeHclwRFbj5OjY8oDp1X2cBu6sYlxZ0iOAHg9o54
         HNbXF0m3ZT62DXFMP7t4i9qE316Or3Xe1D03d0C/hD9T696FSohn3qNMkg+f5dM2IdUs
         OpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550862; x=1759155662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug0zAAEr5kbnK08BBV4RWvp/VJgoebn0vXwAlF1IdfQ=;
        b=dP5UXTmNLc9wVPfj19Cw6DcdAFpigktsWUAGTePNKf1N0pnOy/WsfuyRt5MM2yXJ95
         ooIPNpt0eCz9x/tH/mYcphO3r60kspMp/JNFKzUbxTxic9QEZnnQJxrmTUjt3gdcZM6/
         oK7FWqlPCoVxA7qpK7rdqUutrP1ArBfKLUTUeMRJ/JbgAw9E+LgSxkscbUYluDKsfzK5
         XDmo6jr8+6Mvk8/KlxSMxHd4XJVGBGxOJG3Madv6+vhYH64OdUZEbspoOntaVaU6dAA0
         o9Ds0au3xXATSs/3DP+0kw5QhxPDVhqEoN3k8xd46HHykPrqUBp+u6UikaOD7QLynQ1J
         qqAg==
X-Forwarded-Encrypted: i=1; AJvYcCUXiJhwaVBH8UcPINboHHwU1LFOiYtGrGYUvfd23ly7qAg0H8mGijg5nTQQcigVj2VmHiwpFZQwwiU9j7OZib/V@lists.infradead.org
X-Gm-Message-State: AOJu0YxU2JjjB8pY1CjOdYieGNo73jcuOSdIIGh8J5yioMDq9rI86gQe
	Mk+zCM4+nP0nz+NCrA3qh/XGezGOKWcpueTq6AodKFTvaXFLFJ5B5x9lgYoJO501oRow4jScfkn
	dkM8hmmvIBjA+7oZa2x1SzVa4vqBa58y8tbajeSWawg==
X-Gm-Gg: ASbGncub7YuPDqPjaRBFWN0pPuMLSS6ZtK0l4W0WrjdMXjpdP+Wc+9xFtDrcGDcy5Ea
	FKt5OeGpWV17BO+ry9dLRjkpYRYlEIyndRwPoK+avVpqMbg9HBLHZ7wpXoylEuNaSeVctF4Jtfz
	peq6idN/E3AZx0Cxo8gV658Ef7g2SmENnMOq5yG6U44gQSblgI38tFFPKAcBRf0iHp2vthgUmxQ
	khpORoaJ4POrXZRm51nzTqZO7Mn6Ps1a9xZsg==
X-Google-Smtp-Source: AGHT+IH7ov3L6MY+/rmciyf47ro1aYeL/sC/ClPN8jzfMPrPzjD7iBzVpIdeYJWjKJ4AasrYgahlFBVLjb5jrV6WEng=
X-Received: by 2002:a05:6512:2305:b0:560:9993:f14d with SMTP id
 2adb3069b0e04-579e1b68f17mr5336192e87.3.1758550862286; Mon, 22 Sep 2025
 07:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org> <20250919-rda8810pl-mmc-v1-6-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-6-d4f08a05ba4d@mainlining.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:20:50 +0200
X-Gm-Features: AS18NWCnht0SxyHuFtw_GctfcVE1YPQlre0zCChnlr1t9VjjDpuBjNY-9qJgvpY
Message-ID: <CAMRc=Meh5WJ_C1wMjAk9CzFW729QfX_Fbq5diZ99GtsR43k8ag@mail.gmail.com>
Subject: Re: [PATCH 06/10] gpio: rda: Make direction register unreadable
To: dang.huynh@mainlining.org
Cc: Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_072104_641374_62BD068C 
X-CRM114-Status: GOOD (  12.12  )
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

On Thu, Sep 18, 2025 at 8:49=E2=80=AFPM Dang Huynh via B4 Relay
<devnull+dang.huynh.mainlining.org@kernel.org> wrote:
>
> From: Dang Huynh <dang.huynh@mainlining.org>
>
> The register doesn't like to be read and would cause all the input
> to be switched to output.
>
> This causes the SD Card Detect GPIO to misbehaves in the OS and/or
> may cause hardware to malfunction.
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---

I have responded to you already[1]. The commit message is still
sub-par. Don't say "the register doesn't like", say: "Reading the X
register causes Y to happen. In order to remedy it, do Z." You haven't
answered my question: what will happen to existing users of this
driver?

Also: you have not bumped the series version to v2, that makes
tracking the changes hard.

Bartosz

[1] https://lore.kernel.org/all/CAMRc=3DMeHQf_Oa2DRR0T7tum-Tuk3qPh5r5gimxGY=
3EXTyvoKZQ@mail.gmail.com/

