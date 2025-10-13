Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdLBpMQJKF/WdkdrgqI4Lr7gfqMU0n7ItqvnZUJi0J8=; b=Ju9Qs3jRj9eTnfsTfJ6p36CoOC
	8A5/lFKH67hLAU7oRiVWh1Jf7eDl3YPExT08sPZirT2hDfytaVvbrqV7EAFeMKoLQT/EECP7ydt0/
	hk1TonSz177/a+NC967WQoDqM7WSqRSjNb+UmX4rhvIVdncnffGdqgckwC96klnwfi1scmxnvk7wG
	IDRDoOjIVWShEjzqIlW14b2t8YKXGcxvnMT+ZnPjqvuJ3BaNJz3Omlj3CY7wft/ryUs08GU1LO5uu
	FgqnxLRdXYi9q4a8+vwoVA6VuJV6TFLv2ktG7hrtCRFnXS0NVMmvqtHqVIl91XnXrjQg7jO73iqr+
	I1MzmoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FXG-0000000Cs0P-0uUi;
	Mon, 13 Oct 2025 10:12:10 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8FXE-0000000Cs03-0sHf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 10:12:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-37634d352dfso27199571fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350326; x=1760955126; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdLBpMQJKF/WdkdrgqI4Lr7gfqMU0n7ItqvnZUJi0J8=;
        b=VdYNPr6EmrRlBiFMOnMpML2KPMAinsYjj4cnh3mhma7BiqvX6UOf/MyNjylvxJRz0L
         NZqTRvKSDcaP7RWBx6QJdn4BJLg7UD/QtwYaRMCRVg2yh/HSkmfRcBcA1wXCWWpGIKDY
         cwOgwPqQh6HlU7PWY1oWBdAYSuJihDyBGqXsRCBOKEl4qpjZtOIXvehnDqqOzI9FiDFf
         UFKIxZaZZNnU14duwMGoUk9CLh6yh7GAnHMyl1YbAXvhWt99YitS1h65a/v27Ab5LQt0
         MKiUmCpQJC54meilCkIVNJ1hFxFONMn1KMYsLXJJXvHmSQOD7OovLzXjYUQ3n1V+TuRt
         WqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350326; x=1760955126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdLBpMQJKF/WdkdrgqI4Lr7gfqMU0n7ItqvnZUJi0J8=;
        b=TnWLcMZ+BW9uUmsS9QFx4UNF5lYNXnEgFcCIQ/+akt3Wvh9ew+PRtoobbudbcNZz12
         MZkxBH14kTbqZJMi3lyrEAgo1caKoTBAcKk/9G2hmxH+v3ospC6mlX3BP4F3YrBVlud8
         O+Sh77Udu0Bya3NhSLTfMETgCPTvwkq4ArlntULEppBDXzxb+e024veLY78c40kHpjNh
         VM9xR+tqXVNP9bqfSQ87yXbg5eXRbsQRH4hf5lEQ+BZbvs0t90r8ixp8hoZklztAMC7u
         nA5r/Vu8k8yNfBoKb2znj+z1ifTZy9V4xLrtgAbzpPCLDjyS1NE9wcZjmnTA8KkSAEQM
         VRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEwAdCF9wuO6ryoY/4Js4p6LkdfSGcNCmag4kG4jyhhgkgLKBE15MjfU7oIPxJ/VkinEqTJkOlo1BnZkvdkgS/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28gMmFzMM3TtySSY5xC0PcqabEgKFBJzD5EPwbewJhCOnFZSK
	ZlySD5IMSxeaIHaRymdfsx/GogqMvFtV2wGoUsx4CQkwrLz3lBQ9Nupl/y1FEMaHaIDxrKFyFj3
	BTaKAYuso6daCRNlNGT04WXSIa6pU/jur/tKgC0pAqg==
X-Gm-Gg: ASbGncvgpvNSmoIVJ9Bd9TN0NtUOZR1ZnJnCVt67N5cp8/OjB5jPJtIOb3kcOEIUGXO
	tDn7A4jSWt+rN0fTGY1122M2KoUiBhXV0nqBjpyF/2ZJx0yVU7vik2SOp6Yd8bklt+Gn+GTAkLj
	puylKW+NEgVT4JWd45RH83I9VbaPqzE3KzTTxGk8CpdQo1I9+fv/EgjyLFxi6ssDQT5ikCNFoOL
	zCuSVnSMfVUdWW1z2l1KXzKuweG6nkSo7zFrXXq
X-Google-Smtp-Source: AGHT+IGgRJrGAZEzxavCYvBvMxkV4C3SuTl/tY5kwvQvzOJPw8FV39401eLsZgGg76AQQApcgWo2R0o9i9pCt7zAw68=
X-Received: by 2002:a2e:bea5:0:b0:336:b941:4ab1 with SMTP id
 38308e7fff4ca-37609d788ccmr52889461fa.17.1760350325946; Mon, 13 Oct 2025
 03:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com> <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
In-Reply-To: <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:11:54 +0200
X-Gm-Features: AS18NWCXTgDlcXu1qYOFDjPkHsaBIb9mh58rrY4q-gih-VvDw6C14D0uT1gunyA
Message-ID: <CACRpkdaG02uXd8q5shNJ1LS2R0hV52OcQLY0MmXoihJYU90zWg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: pinctrl: pinctrl-single: add
 ti,am62l-padconf compatible
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_031208_254271_4D11F4B5 
X-CRM114-Status: GOOD (  10.79  )
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

On Fri, Sep 12, 2025 at 5:40=E2=80=AFPM Bryan Brattlof <bb@ti.com> wrote:

> Add the "ti,am62l-padconf" compatible to allow for some changes in the
> driver in the future when needed.
>
> Signed-off-by: Bryan Brattlof <bb@ti.com>

This patch 2/4 applied to the pinctrl tree.

Yours,
Linus Walleij

