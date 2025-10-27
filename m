Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E85CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=; b=vPICDpXta/jmxNwHlg65xGVNRQ
	ySymQr9fo4wRiOrKmnHkNiaZ9fsQNQ7nM0MyM7lA+4z0+N4BBggN0MXcSIc+HDkJaQmBMQYNh/aT1
	6ewkkDT7RAYGZP2Nc1mxhUxaKNstu79uGDrxAh8T3o96/91RQrasOURU0TGkYtn15Yk5TdV2gGUFn
	sqyrQ5JI91m5DCMfzvF6rXfN9jCuT9NERrYCb9z0wx24041nqFKO5uOEAQSKW3xMTzNZah+U3vzpY
	fLz/h2+rBRL8HP21Ize9mQB9gFVfiIFpXIXQ97Hj+XFEEFpjD3WH5vEV+U84V4zWOymMPdakwV7Zf
	np6BzdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVTZ-0000000EqO0-2cMM;
	Mon, 27 Oct 2025 22:14:05 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVTX-0000000EqNR-2m7N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:14:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-378cffe5e1aso54828491fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603242; x=1762208042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
        b=htp7a8YTcLevdk8SxWfjklH3N+6YHDcMOQHZoRv0HPxfHKRWpfRG1H9cbU5kSy9wJ+
         yszuX0oMDhOHf3h4+FMRDJRcXe1xMGPMKpzu/xpsWxniWdPbkaB5BVwj3j0p1pgjpMkx
         NisMKNQYHAbqqV5T+fHq7tFAHGIUGuF9CIm+JF/wI8y55TG0gY7RqQFWNJ5eCdhVRyNI
         adA6UboF+qUYfMvnbngusWz8bXtBuQ4d51ALdb3CucY/ls7WgUJsWzvM7m7k9dZ1mutx
         zmPWUL5wRnffyC4qGlzvx6Bs/T0nNjWCLYB5rAey3w7FvaEt/ZGd53B67KqoW0N3dD0Z
         YpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603242; x=1762208042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
        b=QnskhLdZwvH9zqRDrNF38t76CYZFEW9ZQRPr/QuC0wRQPHSNlZTUKO7t/nedInJyKA
         xUlEU1s3wiugtc0uduFelsFcssCuvYCPU25nABYDi7TMC/4kvziruWFdg7JrSuNw2sqO
         qStBCqAkET/tRAm+ji7d6JE8Xbe0cFx4Y8JkJnjlLqmxynvZC5QlbtbnV5n16YaaT44F
         wW8UiUfsrB5AxZsXha2HrLeM8plIzid7FUYdrbbzPdE/7yueI5rj64tCEQQlIIZjellv
         b9eM40svOK1+vJiFYAWTTiw7oxGx9K3ZsLuxUBqnAptv3snnbkYHbGjNLZh1y2b1UZts
         aSOA==
X-Forwarded-Encrypted: i=1; AJvYcCW9o645jK+5dblin88nbTiiPdqEAEkGHcV7Ul+TG9zLkBGYX/VY8unjCvEEUyQVSM4WcWqXaOSImo4mjJFu7sY5@lists.infradead.org
X-Gm-Message-State: AOJu0YyV+qcBTDZ9N4L3IhNItpyjDXEd0XiHGbqW3aKBA97KLP2/N5N4
	lFciR2haUPRSXmzYGFLcMY7dbmDFvCl0M65QmkAGBe2qLJ7BFwLXpFtx/eQtxvOqvWArF5rkj6V
	HH2Gh+yKG2EbMC2dnUQpaA3DomayaGHCT3rE0E01WKA==
X-Gm-Gg: ASbGnctfU3LsvsCtgpcjckkn9GEiiaDvknxYQ7tzP0BKyZkxx1fr900pIC6rjRZUR9Z
	3Z6ntZH/llmNf13ixFwonfTzz8PEQCi1GbplSM+YDcJilUd7+ao81hipc1i5oDTLczB6nOl4eDy
	YPe1oxqYThfuNWIDttB9MLQ4ri68tLAUiAjNs2fELhM0K1BruRmQ+dgrjLjyPuXj+r59L/n6/UH
	l+p7dIejOh8fqvH5fZLJLk3PEiMchwl0Tutnn7ClR94JHPv+bRqGK61f7VGQgkvwt/88b4=
X-Google-Smtp-Source: AGHT+IGTHGniqnqswQZQSU1fhk8hxerxmT/RZLzkXLtCHwAUJ+0N8EhP8qUlWdXk3822xFbRTLDLonsWXqEkAXahWao=
X-Received: by 2002:a05:651c:1503:b0:36a:a87c:d139 with SMTP id
 38308e7fff4ca-3790776da7emr2956771fa.42.1761603241771; Mon, 27 Oct 2025
 15:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-9-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-9-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:13:50 +0100
X-Gm-Features: AWmQ_bkjaJPnQvsqyBKfvEn0_gjRiWDur5QLSrzsQpj3h_gRODNUm-q5XFQgAKQ
Message-ID: <CACRpkdZrNKgoxy0aHTVQmyeryiDbu3Dc8FQR_KhbubwuLxcc9A@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] pinctrl: stm32: Avoid keeping a bool value in a
 u32 variable
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151403_708391_30D7CEDB 
X-CRM114-Status: UNSURE (   8.66  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Change type of variable to avoid keeping the bool return value in
> a variable of u32 type.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

