Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD25C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRTDJDK9EW1jEeZqKwFH96oBkO/dZl6A0f1ILw5pqSw=; b=peBOVBILxb882yrk21TH4oYoBl
	rapuMAw+j+eSIkx7oIXNZCjd+p5SN/NfgF6GL4gf/bijumNyy4ky3LTTDUkCGbOUHb9He8qBUfIwu
	83VTP1/6bXSX/Ah/oPmRX93XrZhzA/UIy8lRgdtDQlY9yOWibeM6jJj4S2zgbYNXmRK3oAE57Qbxo
	RpXTIMaFrhenh3akRnPDepI/epLDAbBbtgNepkF2qsdZYOwTfA4FGZ2g1b5JOR9hFu7epqz7qmzBl
	ODb7cw4GwVLqdOCThwim++MNArWLHv+X9QfS+rVXfgXZXGBnib2lagotDAvIrl5R0qYhsXpSrSAxf
	4U8Ev4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wFQ-00000004ltv-0gCY;
	Tue, 22 Sep 2026 08:53:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wFP-00000004ltP-1YOI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:53:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C84FD43A44
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC811F008A0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067186;
	bh=pRTDJDK9EW1jEeZqKwFH96oBkO/dZl6A0f1ILw5pqSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KlhrzD68zCgzYUViZwYOFPRjRUzOuT7fyO3U3rwgTcrxAwfyub62TdnRVitovVoNp
	 KWR1turWzPPoOsSjEPUqt/wh4YDf90diNBX7nNV/wALDLpdn3no6oQSm5JN6+t7cA8
	 QgoUDdm21iIOWcklji8pn/dj35y9WuWqJBfhjrIhVgs5/w4j/Jho9oOIlIdxXWuDbn
	 2GzOscwzHZZ1WjYL2JNx3hMyXsoOt8KKhLnbODpQzmtR0uF2b4e4r7L2mrlQWbfjIG
	 +qvXp6/aJSnfv+UKTYepNt/zYwNG/0QZirBMWlcIaTxqup2954a3YhRCFQwu/wKdtc
	 TYC/JDJkPEing==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so5874224e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:53:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMs4z228Z2Z0TwvNQ8f27Fo627aF+bh1CsvD36uiQiU2R+034469QqWazB94v9U5njzCINJeoDk6BsmVMwWnh7@lists.infradead.org
X-Gm-Message-State: AFuF++nuCmeqviM0yU5TaHdz0W6NIpKpmtcW0cb0U1EXg3HnhLdUnV1F
	g5B2hsL8X8/CCqeUmJ8kMkuqOPmPs/8X5xktRvDYqFgWnaMC9XRlxGhkmTonn7Kw2wA9C8vmhG6
	lG+Jc4nxyqaOkEozRppZOX/uuKMefNVs=
X-Received: by 2002:a05:6512:3e08:b0:5b6:172a:c36e with SMTP id
 2adb3069b0e04-5b8c17f2023mr4223635e87.8.1790067185256; Tue, 22 Sep 2026
 01:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com> <39641ec4.7a73.1a0c848bfa4.Coremail.zl020895@163.com>
In-Reply-To: <39641ec4.7a73.1a0c848bfa4.Coremail.zl020895@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 10:52:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLkZ9F3_KQwGDZyKaFYBzO9PXVq+5v8geFE+oOM47KmagQ@mail.gmail.com>
X-Gm-Features: AclHuK9Y1QMax6-R6N3W6XKZsP5OW6rOHXGLWKISlcK8k5n-6-JwlZacROssNGg
Message-ID: <CAD++jLkZ9F3_KQwGDZyKaFYBzO9PXVq+5v8geFE+oOM47KmagQ@mail.gmail.com>
Subject: Re: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 22, 2026 at 10:44=E2=80=AFAM zl020895 <zl020895@163.com> wrote:

> No LLM was used for coding or testing. Different developers are responsib=
le for
> different parts of the code. LLM was only used to polish commit messages.
> Could you advise whether I still need to disclose this?

We add it even if it just used for commit messages, we don't really
differentiate.

Maybe this is to coarse but it's what we have.

The tag doesn't really mean much, it just mean "an LLM was
involved with something related to this patch", it could
have been used just for testing or review.

Since we have Sashiko reviewing everything I guess in theory
we should even add it if we looked at the Sashiko reviews,
but nobody does that. So it's a bit arbitrary. Nobody's gonna
be upset about either, it's just some helpful metadata.

Yours,
Linus Walleij

