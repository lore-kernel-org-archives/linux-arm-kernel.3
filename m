Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD47C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=; b=J+zMQ8AoWUcJO15Tt9h1J3QGvu
	EsC5uEOF+OHlI/T+9brkPbElCfsi94ogHuViAuxsrnSFzRc/Tcn8hG8ZvnUPlVsyf+0ZhiIcr7aaQ
	5Hos8oXk09QD2QW8iVOhCbXxl7fh9xOKNxksD86Qsz1M3bncSqohDHG4UOtjlROKazp9OhCKWHSYa
	DnW7ezpKaSbGi6R1K5Cv282bBOiUVu9lVbKpkZ4UD5qUdnlZyF0mPdLll5qgM+MbOUBN42U0e+6jN
	W4VTytW3gk2I1trmS5hF0/vti0alcrCKjg87GrBM3rBUMTFj6SO/8setVeV08Us0TDI+zX03dlikU
	tj6KVQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExaN-0000000DbHb-0Udu;
	Tue, 13 May 2025 21:54:51 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExYG-0000000Dava-2J4X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:52:41 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso64217871fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173158; x=1747777958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=aFUTfQbbX3uJax7TPkTfosDcy47KFeFYV3hDL9rbf1dOX6nBgoNY7xvMyBL5fy9Faa
         wrJ+4x4WtXASqDJf0fpOZLRSlw5WEJPQUEnV8GOJoVDBD/I3te+tEKdlucMgH1IBdtI+
         zlww44HWUmRRh7e8VugMLNgyz1leOdh+a3XcO6xqpBUvjqz8BDAsLVtK3LqfHjI4u1Nq
         lUNBAZ9tsJTcXxw1nCYfNV7dxbSHWDuBIufLWc9nuWhMUsSXXAp2qA5j6yJsBxewFQxR
         AGpSOab/E00quEBJLGUbzYs/q0/rcm64wClbPZimCV2GptqaDxZ4IOFNeJWGLst1ta9R
         PEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173158; x=1747777958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=Yq+7bK4+FRDOT9aqS0u+HdGMg/0Wnbgoni6R/F6GLffU5Bnp8Aeq4XWgNAXeC/46hv
         UXETwJdGyvPPAALAXG9Zxqm5tom33SfhpxVv5qjKKgv/9n3/FZcpQztBBc8ZUUfjmJC9
         jhYiNUPNrfapqIufXsuwskbySVlFuGJkQVL2gABHrEEuNVV+ZnQVLvht5Vwik1VEhU+e
         QaZ6TAuxwraGsp+BuKohEAufNDucVfpxiI6n6Sa+Em3mdUYVuk7w+kOssVrhPGcVl/D9
         8maEUCe04Ltbbiolt2GyeUIIBNoUL+XbylVpO4P5jTC0mw5vdNz2UhohOleiDSlyma7Q
         0zKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkXQQm30FxAFS/HDD2X90Y7f0kLSyi22zw06TnRf1uVAz6qEKrm/8BK4WvhlfK4ElURe+aQpiTA1wHqx/DSlbU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+VtLFEDz+bAH/3pmT1I38AThKU6dR+eQE1vQ+64aXLo1kRSic
	PmG1iEtA11HKEVL0EMyUinqxIq4Nn4aaqJgmJk5jGmNAtz5LSUrMKuF/ye/Qt5k6xIsI2aKmhCt
	q43c6INWC8fLoo04XLCX7vK5tExKlEt4EDuZDng==
X-Gm-Gg: ASbGnctKg0ydCJD01hKYVl+Z9oyB9aed+T7+l6/8bTPOOBHEBJMeceGwjiJRU215/SQ
	XzREIdX57SIilX9AEvePsRpKJYMDS8pwahHZshJ1gKiQ2BdXr0GMJrEqLJeE7Zox3tzo2nKtG4d
	+dlpeaP15842PKJIW+1ELXbts1cwIIBeQk
X-Google-Smtp-Source: AGHT+IHdxGQUgnLEP34p77bnggpFFcybep3eX0SRsxItjT7bGVq1s7hLEPXvIi67p9M416/+sOFwds+OUhyOtC4jV3I=
X-Received: by 2002:a2e:a545:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-327ed0d64b0mr3515771fa.9.1747173158581; Tue, 13 May 2025
 14:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 23:52:27 +0200
X-Gm-Features: AX0GCFuybBjzXgbZgpkhrGy02_JvRvbutbRLwY2ZvnnqoSf9SNzjLph5-OzDFPA
Message-ID: <CACRpkdYwTcHh5LZ7j94LbGYv7BnTCtrJO33j17YbP6s_s3TeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145240_603151_EF8354E9 
X-CRM114-Status: UNSURE (   9.22  )
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

On Fri, May 9, 2025 at 5:01=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

