Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B40C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMuUitFtpxg4HIwjXPXk2NVd+fQLMlZkoGPUZSp/E0U=; b=N/0oeBIGQcruuyAbUTLseO32mm
	U0zlh0FqDSLjiKQj9BYlIqbvP2fu5WBqDF5v3SnKS9R/ITjOH3PJZBqIuQLvEo9OiRjLM/VoIAlF7
	T3CcEz89OOqUW1ijtPkgwqGnobwL6NWZgEQuvg3p+81lKnWaXWgznBXaoWPEMYHq2WdzfUD5kZKeF
	MFJJZ91SO8lnR217U3MpXa0E1iLs0j1iV4vmF5exGaKuCjMU8tGZAtzBIr/1uM9GviJeQuJjiaKPv
	ngb+qoFR0r8qvWrH+VVyjEuJ5CLnB8NUqkp0d5DrHY11vrfAwKQGiymwdvP+iKQtILK2WZDj3HTMK
	3jn/1GFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwu0-00000006AQv-35XA;
	Mon, 17 Aug 2026 12:57:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwtz-00000006AQ8-0I0r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:57:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E73160A58
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B372C1F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786971437;
	bh=yMuUitFtpxg4HIwjXPXk2NVd+fQLMlZkoGPUZSp/E0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OmhobpQjoS+6L9WtCoV3faqmSY8+5uu0hUcCDQZH298uinfRO7U1LU8Fc+m/S8FCx
	 MCIET7CjS3P1UVolUMXP4WX0qXFgfLIjT9b6FzDozJe6J7LJCHqtvyOgcrcv6k4aPn
	 N/rAPxv928QWcFRRWUOvKU1H2CqNI5b7ja1XEm0cIh/SJDcGUgO11ZCt38Dtfmoc5k
	 kE5SE+WgPLkug5z6u+HvQiS/nHGxpwFPDmUO+3dL6iFbq1t8fbhQlAydqQWAIyB8e5
	 CEWVTh9IW0yP2PfHNzVYXdY29gCsiIHgWhlJErt4ROPdFJxeji+kSLSyZFExuA8509
	 MTFGVOXQUpwRA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so4011000e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqh+YmkBr+ZNOh6dgchGCsL8tyQ5U2cDNG4Ifuu+DdtBKFkIHJ476pa7NpZAgrY8hfajO6LUtd5tkCmkVP4syjU@lists.infradead.org
X-Gm-Message-State: AOJu0YzK5XQpMzKyHHeXLHllpaxoSgd5GDJ4rjSBiAqcFjnnRDpWGm58
	Ib6D/+fPQzuAtK6I6Ny+SRuj1bnRoUjaceRdhvpTMO+OsJR3Ho3ratNNgoYnxBOU4DFuGCf/o1c
	t0lHXLlI7BCb1qjrMfOK5Mvy5HvIPZKw=
X-Received: by 2002:a05:6512:48d0:b0:5b0:1433:13bd with SMTP id
 2adb3069b0e04-5b453baa6d9mr4605381e87.9.1786971436523; Mon, 17 Aug 2026
 05:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:57:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDJRJMb2jrmTO3WSKHw+5t9uWJsibp47N1UkdYe54gzQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xvw2LSRWcZSMjKKrZ79yk9hYmZyF8Kta8zS68H0_RKHsWW6aSjf7zDgKo
Message-ID: <CAD++jLnDJRJMb2jrmTO3WSKHw+5t9uWJsibp47N1UkdYe54gzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
To: Liu Changjie <liucj1228@outlook.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, mfd@lists.linux.dev
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

Hi Liu,

thanks for your patch!

On Sun, Aug 9, 2026 at 12:08=E2=80=AFPM Liu Changjie <liucj1228@outlook.com=
> wrote:
>   dt-bindings: pinctrl: stm32: add STM32H7RS
>   pinctrl: stm32: add STM32H7RS support

If there is no build-time dependency between these two patches and the
rest, could you send them separately based on v7.3-rc1 once it is out
so I can merge them to the pinctrl tree independently of the rest of the
patches?

Yours,
Linus Walleij

