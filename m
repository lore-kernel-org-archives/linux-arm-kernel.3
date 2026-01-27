Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7C6D2FEF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STl2Nd+8C8kVbSoxZDbbBr4CfdlYXAHmLXHpMVDXU2A=; b=k3RTsgTwWKahuyWI/xGaz3a76+
	6m5WcyvqGesnigeJ7FpqOT62dNsr76kH17+9yl9nado8VQgoMwLgZhMM9F1+Xfy/rTYswSdaB53gT
	EPdUHWogDIDO9znl7q24jLdhXhUnii/0VJrAYwIOpjUI/NaL9jLl97Mp/GBdH0xbocN+T24Ae16QY
	UYWoDRh1bhHstuQJx5il6OzuRexB6HaodwAxps1OCkjDpYRFTep/AxV62jIC4C0EwZ2h1QSUe8+ZF
	1MPrm8q+7Hplk2Xqlf9BqC9JL3wCAJHwpeQsGVryQxPMbUuQ1DWJmFjCtVrMXsK+Wd8agr/a1fJqA
	ZZibB7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrMi-0000000F66v-00el;
	Tue, 27 Jan 2026 22:16:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkrMh-0000000F66l-2DTa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 22:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADEDB600AD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 22:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE53C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552210;
	bh=STl2Nd+8C8kVbSoxZDbbBr4CfdlYXAHmLXHpMVDXU2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RR2aHX7paHubKnV6HtXKbhKp+T/UGREZ5/MfYOmf3/8P7Ty0DoLwWcZiICLAEWxxg
	 qZuojRBOkV/S8RZDU2SQ0+vifFnSOVDJVx24L9GyE+Vyc893J/fFHI76LZDP8ePbxZ
	 ZkNIcHpZ+2yxbRwam9XStiuYF1CtKJVShO1H65LQmWfEr/Aq/tSTQYX+tmWNpqZG8f
	 8ml5/7ucLM1isP4nKNsM8+cCDB5fCTDpjvDsJPqTSiDDHSNTlW99UzInq/cab80nSL
	 5X/2QD6IpTkpN3S0nYZ/JfKdLXzIBf+SviQQBAiOuZQlyUVLD5xAvfZKnTjaut3k6k
	 8q3CL6DDDvKkA==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64965ee303dso3744689d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 14:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWG3PQaOt+FL8dRTfay4owrO+N6TV0tDshCPO0FDyfjGFcbyvsBYm6e5plhF0wwTvD8EM6IS0lB8nRJqIGvJdUb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqn3lEK5JN4PTOZEUQXyFBqNasXjG4/7J4u2LTmfNClDtiJxAz
	QegjGi5F9S9ES9OQm3l1khwCvbOjdhY3FPTd0MxuyZvdShAA4XkE73fjWUKD8WdpoH4lHwb1uIm
	UG7VzcqW1yVvlpTi0jKE8IoHdW7HxeIg=
X-Received: by 2002:a05:690e:e85:b0:645:556b:62a4 with SMTP id
 956f58d0204a3-6498fbd9503mr2445332d50.7.1769552209753; Tue, 27 Jan 2026
 14:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com> <20260127214656.447333-3-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-3-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 23:16:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCnWkuq8Sg6Jf_t1euYLN0PXtdmtQTFib6Cu--PAhPqw@mail.gmail.com>
X-Gm-Features: AZwV_QjcX6Fq1BTf-DABgaLxE6ntCk6R2jLgUlhkHKHsGn9r4S8GfIZgM1YdP_A
Message-ID: <CAD++jLkCnWkuq8Sg6Jf_t1euYLN0PXtdmtQTFib6Cu--PAhPqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: brcmstb: implement irq_mask_ack
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jan 27, 2026 at 10:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> The irq_mask_ack operation is slightly more efficient than doing
> irq_mask and irq_ack separately.
>
> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Co-developed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

