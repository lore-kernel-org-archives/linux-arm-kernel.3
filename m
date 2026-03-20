Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA131098788
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqM2AKs946P+FYY/eyn1mHQZcwnT+QeDlAmSMReOErk=; b=qG7hNn8upvXCru7ddvgoN+akVz
	yWR6jMY6ecad6K7spyQk8kqFPPUlIWWlwZTMG6L0U/M3VZ4hJzsJckRvyPqcJCKyxYHJXsI4EKc2B
	y0UMhIEBwQQI8rmAUL+U1NJjnS4CvUctlQQZsDeoH+h9jowNzHSAI5htmC0rW6gDNQO6cUt2hG4yj
	SRTXjVaKeNbGS8phqZVuUm6zR+9I/fhgdtRM8/TY/BuY9LCkmt1jEQz4tsB6pmdDB0oPNoX2uvXIU
	HlT3d3ZBKV8ZpNmvBWvHzCIjsjaGGq6IVVEFD1bJnXf5pDsz9hr/Z7/h4g8HKvAhcmwSwdBXCsRao
	Iaq7aIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aj5-0000000Cvfe-0Iw7;
	Fri, 20 Mar 2026 14:21:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aj2-0000000CvfE-2szR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C64E444EF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FD4C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774016479;
	bh=SqM2AKs946P+FYY/eyn1mHQZcwnT+QeDlAmSMReOErk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rOSOvJUuGN+56iErGAdMaNJh2uWQYuprlm2Z1i/to588bU4zXVHLcEbqZtFlcZDVV
	 MnPSKtoaymN1GA9hQafgMT3hg2zMLEtJ5YZAV5Eu0gsCuYwB9ogCMs0yk+x5mnCBVe
	 4H5MMDLr8U31+rI2CKXYbI1KT+/LZP2lviVR/iH68mykPafSrkJfATJlJTW30pAdhw
	 G9B+1RpmRxnWi1kDDa3QeK9dw2Ah0or8ogKYkl1H9vdCcZ41F8E+79x+Z/b8aVregE
	 V7cclLOetUiVeg2jYkvkYh9+28miwpKNOESS5x4u+Fe0gRd+Ffmx2ZFcwL7FmuHy38
	 d9mzlM8feH0iQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79800183233so25844927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 07:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnZOvOCc+9fNRmo4zU4yvRuVCrV/kFEbetLMbJyJjaSmVPbZmg964aFvQ9u29lI0WuCbUmraEGqsfF3AsWpUXM@lists.infradead.org
X-Gm-Message-State: AOJu0YzdKNkqT+NErdyQ+hMn4oChhjZo1pQ9oIvAenlj+DR1tGB8ygcK
	GZZFyQfpy5HGTM2FgWlVfygG6WNl1aXPm/B6ZFjqItmjDYOdb4LPjMZdR0Qqfhdz8E5fOHPDKdk
	t79R7iMjEpDh6l+E4/kHpsEzg7fiEiVw=
X-Received: by 2002:a05:690c:60c2:b0:797:d46b:e86e with SMTP id
 00721157ae682-79a81a90a25mr75990057b3.14.1774016479055; Fri, 20 Mar 2026
 07:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 15:21:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLm42TDQCMrrz+8jkBZnKc7-Kbo26Kp8RR+XZhhGyow0OQ@mail.gmail.com>
X-Gm-Features: AaiRm51jFHpXl3P8yRKHiCPd9s1KCUcQyaH7BZV4EXHpuIPKoEs4F89iW4OvG24
Message-ID: <CAD++jLm42TDQCMrrz+8jkBZnKc7-Kbo26Kp8RR+XZhhGyow0OQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072120_744841_E029CF81 
X-CRM114-Status: UNSURE (   9.77  )
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

On Fri, Mar 20, 2026 at 1:23=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> The pin controller on the Apple silicon t8122 (M3) SoC is compatible
> with the existing driver. Add "apple,t8122-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl" used by the driver.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Looks good to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

