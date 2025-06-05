Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6054C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=; b=Sl3zY1y3OZHhzl7Dxz5AdKIHD4
	VM+EGmcDIRyBnbGlf8PWBZM0KG0vDqsmGx6RLEm9HdwOkIOsm3hibk9sghxn/EM0ieh7cjMUqzZUH
	0MmPvqXyxC9qVg0nEqp3zLFrzRVre77P11AqTRrsdrvRAfoxw04hBEcRsnamKjre7ibkd8/e0tkY7
	vb+oTmIC5Mc7Xhd/MT4BT+JkJcny9wfNQ1YPzhUUsam8aOWhjZucXyo0MKD6yo9/QTrH6bVYhjEU9
	4IZVjW/pmBuedzr3OxOz5x6wueS91f0gtlkCA8UBZZGSg1xw+ZXAkvyf55jCYkKX97W94n7fzNugx
	R5Nv4Asw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAR7-0000000FaM4-1K3B;
	Thu, 05 Jun 2025 13:15:13 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAFI-0000000FXuk-0514
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:03:02 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54b10594812so1075934e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128577; x=1749733377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
        b=h7fmz+fJdgSM6pK6zT/Iycwn0Bfa0hTMtlt+3KzcrTpOJCLo8HlMpYvYlxpqjbbPBB
         +lctTv1LsQy/dUm9zXj7tsFk0ZDEROkBgyfNYJ4VMUHzFy7V/hwGxZgwhNVutJLdXuHd
         NHIu0gIBOVwNSwe+KwFw/9oxTr7Jh0Q9UrzKMpHUmF6bj4mK+IzoStwFwpJwlavyA/Vo
         VxVVMR+GPklBYbJaiaODUuXgcG/8QxW0uSQyqEsJpNh68tfOSX0xV+14dMtNaasaWG+D
         oj2ap84Emg3fYIaLxX1jAsQLCtrwRYAWakwtOsCrPt23Waf6AERiLVtKXffQTcNKSaqy
         RDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128577; x=1749733377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
        b=eqmja2ORz2bquN4zmabDwnVWjUWKEdBKiYVVn94mNseEX7HdIfO34ugJA0+W20wKZ7
         FtwkJvqVjOfWBnsZCYLfJjnISO/jzRgi8CuwcJTnB1pp2rt0AGjM6FKMfeJtcNH8njzF
         P3FucoZqRBVtjLzDpaPuFw5z5fwu78x3geRG1IYDThKC2i9vMbrQtsel5pYcfNV6MY0o
         J2QOjRs95iHn3+poY78ixJ0KH3tbu6OrFAWhu0Ni+6sMbN5fK3s0JynZEaendV0XTV1E
         jfHSzS0kEIYyRLRXO0cuaU+YU9En3pyQWjn9tQbMFhht83ZLDJJTYoIhfIygqbiyM20v
         sBTw==
X-Forwarded-Encrypted: i=1; AJvYcCXBrpFHqomay3dHjHHRtU3IQ2udC9ow7vbX+kCcwP7xUF/X8Nrp6Uut/8FKy7Kl9Lg4nM1iSATicTyD+5tPdMPA@lists.infradead.org
X-Gm-Message-State: AOJu0YwF3r0ST+tX4DRMUKPdXyVOfuG5R7Nz5tAC2+/qv3oXXtaxyB+c
	qlKJn+4fhJ3JwRF2YK/bQHpp511p6FtaleH8SMFrDfgOHv92J50dDYVWt9++7bb9H5qTGzZuGty
	uki5KvoC1CcKOKavDakGf/9S6RWytJ09OSd0qi4g5uQ==
X-Gm-Gg: ASbGncsKdEeHa3Y1UzzB8Si5dgw/iMKB2b47/BhwG4aO3r8UWDkf3hEjx6f345J9WZh
	p2XgqjyUBdZ+DE9xs7SDCtvxA+r/zQVcyB9rvI6N30vZBm4ktAieJ0wYCZQdYGWErRk4bQ8i4Ma
	ehqndh2UKEXgX9qJPPlj/FxLJ1fyi8yzeV
X-Google-Smtp-Source: AGHT+IEtlN9LmFKCqkTfr1fMDsTcWr6BPb/SNfXLFckAF9Sr8ZXGsmd9lFBvMAQkVfe0s88El5iAUEXMpQYKE5AAkEc=
X-Received: by 2002:a05:6512:3043:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55356df2aeemr2183360e87.51.1749128577147; Thu, 05 Jun 2025
 06:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:02:45 +0200
X-Gm-Features: AX0GCFun0Zlf8oI1kptxrVzEZHeoQoovvg-1R2vISTKQmzQE4bFTIdqUSf5gGUc
Message-ID: <CACRpkdZsyUR6_Rbxcbs-yUUm=U9UKGCuFp7kmmogqsUAxzTZuw@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] pinctrl: stm32: Introduce HDP driver
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_060300_074876_65E964D3 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> This patch introduce the driver for the Hardware Debug Port available on
> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

