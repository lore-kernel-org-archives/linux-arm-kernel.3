Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19661EE57C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 21:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNI4moxHzlL6mKNWIZsVYWKbjwRce0cuGLHEF0rQIaQ=; b=MTtQMfdxxIrQmT0V7tLOA23jg+
	WFf0w4aR83wa4NWyQ5URGBRwfPCkPQTyH4tEpYfDRo9/Cv9krcOQ2qEpULprDGYToA5dwFBCyjGgs
	gS9JjwDRcRA0Bc79mZyu9A9izdgiXABfvY49wDg/9pfOnGQig1bDEX1odB1YhI0oNcEetozcZ+CMl
	yBVTLHcr3pZDd3xjJroSixw+c1hlbpbO1nVqtho7EZW5SL1L56dDQcLuPtIQivohFhZp3dDVtTp0w
	ye3BjiWyuOYpSmNcR9QPMbi/Wc7K/IzD6UY3p673ndJ+i/ZXxbndRqojG2qym+RWF/2uUb4QkPcA5
	zgnkR1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3tj-00000006MYX-2oGU;
	Wed, 31 Dec 2025 21:38:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3th-00000006MY4-2jsv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 21:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50C53443BB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BFAC19422
	for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217104;
	bh=bNI4moxHzlL6mKNWIZsVYWKbjwRce0cuGLHEF0rQIaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ud1JCDQ6O191m3kYD44vkt1ShFs9vgo4JobjnhWd+evWDfkmkNYuJI5wcSNL4tWrL
	 0Z7WpJ+bn7kwco/mfx1YQUb+Cf2JEoE/aLmZRvF04wFMC+yaiiiu1Wrne8U3CLXW7m
	 rlf4vA2wklUadaJzq65C3YgpX5x29MdV+ltwo/Vd2zN8HofhUcqV8WbtJ0uksC688J
	 ++6tS4KWFBNxOPHIOXyel+T5t0WvUdmHTbHNbqpkG920NCyjtE7n4FDHgl2Y4TBj64
	 W6M7ykqRfovFexXy0AhEWH8mXR/2CkOb0cvGL234hY0g3gpG0VTXQnHhEZE4eY7Nqc
	 84vzL6TQKrNEA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fd0cd23faso78818837b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 13:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTPlJ40fKqsYZsLWCcounp8pAymlpqJ/gDe+kHBPTjS+dCwT1f0n67+wx3+6rPMrBb8m0TuYB7aBpS86cN31mk@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZPIKIaZeAIPYSEK894mkNT0EZlpCLec+tdJYbkbUoKD7p5Ff
	ExXu5YQLSCLX0niBB+pdrhjykyNFkK3/YGXLg0fIJDM6S+TFtNekUQM+N9VmZs3H21yQyg0me8E
	jr9rUO+JD6Mnd6cIlz7A0C5aeSXTByxU=
X-Google-Smtp-Source: AGHT+IHGZ+h0d0MHZDCxvMCHygNM5e2LD8BSbr6KIbsOXsE3Z3p+Mpa0Okg+bD8neauLjOFoWJ8WBhGUbfiIcHde2OA=
X-Received: by 2002:a05:690c:90:b0:78f:a9e9:f784 with SMTP id
 00721157ae682-78fb3f5d4f4mr320728627b3.31.1767217103495; Wed, 31 Dec 2025
 13:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:38:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
X-Gm-Features: AQt7F2oBzR1qfgGQMAe5k9Xw2nDJvErMxOKzOVsHNn8uiB-Wg9Ho6D3OL063WYs
Message-ID: <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
Subject: Re: [PATCH RFC 03/16] pinctrl: aspeed: g5: Allow use of LPC node
 instead of LPC host controller
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_133825_708506_FB75FC3B 
X-CRM114-Status: UNSURE (   9.78  )
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

On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> There's currently a wart where the Aspeed LPC host controller has no
> binding specified, but the pinctrl binding depends on referencing its
> node.
>
> Allow specification of a phandle to the parent LPC controller instead.
> Fall back to testing for a compatible parent node if the provided
> phandle doesn't directly resolve to the LPC controller node.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I guess when this is non-RFC I will just apply these two patches.

Yours,
Linus Walleij

