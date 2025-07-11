Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33705C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=; b=dKXXvDAL0UfWuAoP300poDMekk
	LYoim6n7LRTAP0TnbKqdxg5w+n3heRLtBZxpbyFt2vLTqccwQxz824zMqkDOZkSg9ZKikVBwxY6j5
	vtrvLBcxmAJN5b/Hm5Bz4giOJyJF1kcPgwmYiHczE0fioH3qTJejML254MXgXmtl0uyMCQ6b+F0Gy
	APeRC9uVjPFahtYNRE2LYXsQkBZXIMAQvPCcILTYKPPzZlf3E76c1ZnQGoF9ElNGuZlcfw9eI/wHz
	UwGv7Fe0EHH861gKMNan6Af+NL8Gbm6kCctl+3ueSes6WLkeKYd4xtqEFk0+dWNGCfrBPymRkRis0
	H7jnhqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKEs-0000000FmNC-0BBB;
	Fri, 11 Jul 2025 20:20:58 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIs1-0000000FaNR-03Ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:53:18 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e812fc35985so2152221276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752259996; x=1752864796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=;
        b=cOJxjb8qgXEaRyH6r3MrKTUjQyS0+ZhdxSxOrorFYzNxcI+s9AqEWRly3mHm27FhZ9
         xFhPYtZTr7R37i2Xr4+nTBeMkM9juls7Pj9+C46XSzvWhMlBVx3u1PKbRJPe9QlD4F2N
         cb+klfFA0Ei9Rxq0hX6OuVnTNKFUkmfoKHrpBKWHLL3IL6S0t8mM5ygmIq/t/ZMDvQBc
         TKZXOTgeNmBDqxxu9bfB+vmPpKjiC6FuLr0PU0IXIvdK1Ekf2jRxGFibPLoBoF/KDsgn
         9ik9T4aMmRLf6fgciF94a2wJ8F8y3l+cQ8zN+/jiEIETsh1akiIhGL9npuisOHdpoIeQ
         UsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259996; x=1752864796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=;
        b=FuxWgQzfqZ0DOEOib6pQj+1fvhq62b/EizFFbb/g+UvFQKwNdDl4U/GNJkoU/P0T8D
         ch2YRcJyXZFbfJDqo8BoLyv/dKX9Dm0j+qzTZIgyhx9piBVynCzVNVUk2iRoLBm8aDgz
         Rrgr1z9kc6SFQZ9oyWvvDPSRSqetufpup0AScbb12p2KBUdIknIXues8XJhxDqn5EfqY
         1p/4fui5okw/GP5rKx59mowRufXkFseEQzY3xK57UT0OuXbCD4uaNBNl/nYJ/k5e1kuG
         sUkjinvMCiCpK0U0iioDbQtPSYYbMk5E5z6CB9rTcpm5EMcuQjgNLqH4BJFscJTvu0lG
         +N6A==
X-Forwarded-Encrypted: i=1; AJvYcCXDXJmj6/Dh7/PEDwQzoT0qMbzhvBE0QyT0SQDFY2V087KkX5pJwS8+l9xjc++lv9OeT1Jcfy6flGEFfwfXuDoa@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3zDYfPWegqk7Jyfv4IyUS7ZaVn6fS0AhRaf60Xh9YJLuCXJ7
	QQLiNodN9JXMjPmEY56zR02kO1JXup2tLACYyTTNkDQcrHn5qmR78A1s5nfHSYOw4K58yYbSKCl
	CMQuJK+Mk1bbkzy+3ZbgLiODM9mJD3x2vIOlCMV2tJQ==
X-Gm-Gg: ASbGncs9K4E4jkNu00C+4fNuTYSnAdE5GslhW/RijAw52LEbadYkRt0kMdejsAG07nd
	m30W/ZUwptzOC676qdJYXQYqpSAMTfSniiUq+JszzJ9aYMkeRAxNRcBmz6WVytTCnQiqzPvvem1
	HOKH/kdJOjaNvIYoH3kUCHXxU4Z7i6DBKi4c6cN0FMQYD1K4mjVaKtPruGsycndI7ht7SXdqbTP
	9UOYJQIjynJq7G5VA==
X-Google-Smtp-Source: AGHT+IHNGHaJapXfEwRUcTXNTWlTsMHXEiPIQ/b0KTpye4KQsUdp1sxBRmAZdNG++EC1bw7xLSQza58HYJgLAxUXYQU=
X-Received: by 2002:a05:690c:6282:b0:70f:87c5:5270 with SMTP id
 00721157ae682-717d5daccbfmr86777077b3.19.1752259996008; Fri, 11 Jul 2025
 11:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:52:58 +0200
X-Gm-Features: Ac12FXxLjA7peUDZIWJhb4cndI_Q2FwVXxO2uVEd8E-6LJKHyzTLqNgXqkM6VhY
Message-ID: <CACRpkda9M6R_vi5FMGvo6PyThB8OJjX7PMMusHjjs5HcX0OF4g@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Introduce HDP support for STM32MP platforms
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_115317_052980_56DAD348 
X-CRM114-Status: UNSURE (   9.07  )
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

On Fri, Jul 11, 2025 at 9:43=E2=80=AFAM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> Cl=C3=A9ment Le Goffic (8):
>       dt-bindings: pinctrl: stm32: Introduce HDP
>       pinctrl: stm32: Introduce HDP driver
>       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer

The three patches applied to the pinctrl tree.

>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinct=
rl node
>       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 b=
oard

Please apply these through the SoC tree.

Yours,
Linus Walleij

