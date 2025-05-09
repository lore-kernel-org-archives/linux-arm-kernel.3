Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42057C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=; b=yaUTCUbuCtF/UgN+l5e7ayZgN+
	KdBnFlPkJfIQJTr/sBUUtSrBkSIQpZDYm1F+VvgUmhSR/9LSEf41ECokvs5ksGwCklnqrpUNQVjVX
	4uftlgiQ0Oq11bToedDljGxuetKu1muQpO4kLkQfX9ej1w1jlJROghVso3G5IPi5HCEAKle0r6Xax
	2M0uqwvYQd0g8p1lzRpeEYtd/bRA/2FKf6SxWwG4tLLQUw5dRLXCptvxvPm56leCcd1vwdRFcAB0Y
	WgXGtBkm8T+hJgmA+qAjnSR/dtdUsl3B4PNLFmOI8ljCikpsnB3a3aF+pJm/rcCCMdX337J5d4QM/
	S/BHK5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJy-00000004p3J-3AqH;
	Fri, 09 May 2025 20:27:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSSa-00000004ZjE-20Tr;
	Fri, 09 May 2025 18:28:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22fa28c761dso18198595ad.2;
        Fri, 09 May 2025 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746815315; x=1747420115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=;
        b=bXAet2Jm4AMK+LnT1BZiwP0LUbXLHPzJwcKPx+JSooSwQshgCy/7vlDE/EcEXcHiMa
         l2QVoFrL+V05tlHHHvsgzFvBrGLo3vDCmYRZUq33JtpQ3YoDIhGPqAKxUUw6VBvohKW0
         DwaQo4OYjP/67Fs1llrnQ0fpsjC2pb3jr0UBbMiYzBnLL+8IibO5VPhJnElsvJ6ZUlPi
         yaHoGnV2L6ZrtLh7kVC5El6k71G+0GpGIhav+fkFPwAcAfvVpe41A6NYm/XXfLnth2Z6
         kmBZOZokUzcIphbwnnqI3rjTrtITqor0JVElQKjg1EOekBX9qT5/+jSi5ATOnFMbkUwF
         JvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815315; x=1747420115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=;
        b=aVnpXIJ1pMmGOJZjsMWOsgX+mGlAyV/XRuXdArjvshaWoWtb3iiRbzh8F2em4plzQX
         cIYkhpWXC0Hn1lacYMGbfsYi3bk2Ud909dHJkR3SyQIowBlk7kk2unWidgp5Q5568pCn
         Clx3BPTLwebgq93sjCI+iGG5c2JyV4rqZnDwisLmOW/LcWBnrtzYqRSzpwjtd7KM7X8W
         Qi515fcWpZK7ZPl6o6/gQvEqrOSvDjIUIjC0XDwO6FLYZA1HJLN0htY0YUM3jy0DaaNz
         MeE2KB3ZOFzKPpf96eJbjZ6SvRiLxDumqcWhq5006AJ9oFzMBOludXzCDl8FtjWwyKjw
         ylrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnerI61YqRz96dn4TsIRcYSEAUoGNGWtSdzs+o9wyJolmR3lW0tbCZNl3PuC9BRbKmOsFVP6sPQPfCEjT0@lists.infradead.org, AJvYcCUzRYFlHnbICAvECAGZNyIDJmxRXymCdoWAl7dd9g1RLigKzLp7AL/o5jmKkaLY/0WUP8L1UKCOaBByiE7rY33u0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YymNI5RP/VpNWOf3gUzZ3MsNxAt5NrXtYStZpMRTABE4tgMj7S0
	ZKnTz/a4zfX+pmn4/Y35TSLz59RbFNWGLXfVi2LcioiiUDydsEgH+1kTrw9chWjMqhvM9oNArdH
	1WDI8E7SeZxJj2FuCciRWE1KKHb3c2T2O
X-Gm-Gg: ASbGnctLLVt0JpSccEHSQ6nGoPVUq4QEBnwfyPhTpzcUWnhgikcya0InGRACYdyJci2
	uxlsbpuDXDL/GkJZLoSPoQibfQbxJbrJ214UK0UOX5xDdrNUvCG+cRAz8gRI+bwDUF4U3TOY3G7
	LQqZTx+WjQaF21TXdb7/sl/avIiXmUAt2yP2menKaeMNIjl7qHfxZZHDXV1m8TNr+QQw==
X-Google-Smtp-Source: AGHT+IEwd7AiDoJxpDhyTHw6FTDd796IjH1JzgkpmVh4628MtJYKSWng6hqIPivs5wHI5s0eCiBfNcWPOBCx0dc2UHI=
X-Received: by 2002:a17:902:f70a:b0:225:abd2:5e39 with SMTP id
 d9443c01a7336-22fc8c8eac0mr65654585ad.30.1746815315465; Fri, 09 May 2025
 11:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:28:24 +0200
X-Gm-Features: AX0GCFt7pQHVyrf4n1xvCNGZ9D5D94k38mJZKPZaIgxrW2CstAdBDU6m2wUQANg
Message-ID: <CAFBinCDt1jDv=jhDoW3UtBUL8BuLL8PpJPKjpC1Sf5fifnw+6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_112836_513355_233A7B85 
X-CRM114-Status: UNSURE (   8.94  )
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
>
> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

