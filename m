Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30755C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/j3IiFTI8KXbBn2V4TIY590Yl/+UXf61a09lUwHxiVA=; b=IstCQMhzurNoTy2ARTF7XV+Yls
	dldc0cWRhMw3chRcQVLIDW57LmYi46JC6Mck6b196he5RKq0Jk4W4w2WCsjfQTrpIb6Uw+L79FFZE
	Of+Jtn9CjxWjn3dkuq82XCpilT0eU+glWIyPZxbzAc8WumC338TRo7J80TCF2x7gZ5yDQCjaN1CIU
	Bt+dmKZoZUCzeSXEQZlw0fQO7UrlInvG6eEMYKNXw0e24C/dlBGtTPZIaq3UxQrIVa3+6SBGEtvBg
	iParVJ/8cwddxdcZaPeHtaPeHBdbJdQXZiBzvRvZo9BB7SdWSIwADn+4kunfhlvR0FlsrZWdOBcFm
	rzJwpcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCJZ-00000003mu8-03kG;
	Thu, 02 Jul 2026 07:58:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCJX-00000003mu2-37wY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:58:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3A886001D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD101F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979106;
	bh=/j3IiFTI8KXbBn2V4TIY590Yl/+UXf61a09lUwHxiVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PldCjYA4RAUI1BMibujMNOxjGmbFPydGf0II6QKP9xPm/7Mfu2E0UGQ8Uay3yY5ji
	 o3fSpH4jkrayVoCaKT1SC9g1HdBQpoxagDJ9M4krNJdsFe+/tQFT0YmssoNMT/ysuY
	 CmKdXMo9q5q3jgAjJcVaYW8RrCCvI4VO0q5BsojPWvKdgBTOMQthaPh1ZQu9GXzSwk
	 RKEWmtdWN3AxAp2kJzNaodwlItKB/ZWIt6EM2hd1Fetd5Ht4awaKfFNc6O1BElvKmG
	 Uc0yNTyBLsn+ocnwV4tfxTeYhfLugVneGL08f81NFEGfqm+i7U8uIQPB64fAgQfWPh
	 aknCaTLiz4a2Q==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so1250059e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roi/uV6bWE3/Ssu4ySPUSuKhhs7LRi0aIv673Zk0gZJZ67/HgvQivQNmrFAuGaBuK1jDVC4WsuGoFkZOPNYECTu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl2tOx34G0/tl9moT+t0sM/7023xBGQo3w+Lo9O6qjxfG6jHed
	1hE9218EaQPpg5+DQLDhz1QhLj7iRsiyAbblHdNz0B07szSBUGRB8t9Ok2U1ubBSTQngMOU1HQ7
	tMdyHlvXeR+SONQjML/yt/dhLnrEcPLw=
X-Received: by 2002:a05:6512:8388:b0:5ae:b861:ac27 with SMTP id
 2adb3069b0e04-5aec6793d72mr856369e87.18.1782979105395; Thu, 02 Jul 2026
 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-1-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-1-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:58:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLng0n4_YNy+Jfb+xwdi_qxWh_GrbYChwUEG4XtJrUz8pg@mail.gmail.com>
X-Gm-Features: AVVi8CfSGg0Rg88HPf4tmMDUA0VHM06H_sT-mgyoJj-QDfFPmE65E0qFzsN5iLQ
Message-ID: <CAD++jLng0n4_YNy+Jfb+xwdi_qxWh_GrbYChwUEG4XtJrUz8pg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: nomadik: convert nmk_gpio_populate_chip() to
 goto cleanup
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Remove duplicate teardown code that is found in all error if
> statements. Replace by goto-based cleanup labels.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

