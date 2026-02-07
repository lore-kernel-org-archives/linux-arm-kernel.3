Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0C7EE0AF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 21:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUCVCh7hWYSlur1+31lOhVvCPBN6lg4S3qf5xRQ12yE=; b=JGZxGXt/X66VLtPbySMpB2Hmdn
	g6qHNp/WAd+MrPJbXn+l3iQGCXqR6f/ab/ri98H1hR7EcezKnqGUzI8eTgK0Kg2IugI3VinKa9iYr
	K933YwpGuKWdRkPvvyIpW65SFVN52yl5LadnSsnFh5IIi/fApIRGXmit6SsgoJqpi5brcqz4V7j+U
	PXLNNBpvuEt5/UTPUT+QrT9ZJy6+bzDcg2E8veSE9eANzmbWnac2QdfLQ95EoQeWwpjQNTPtLYcSk
	otNX+mpW34CoMhECSrpUTzQio1BQx80TEgfdnt3V/DuhwjksnL1DLPa4FxA/9zStnocwSIa02ynw6
	bKSrxT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voq97-0000000CnOz-2xgg;
	Sat, 07 Feb 2026 21:47:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voq95-0000000CnOc-22Mr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 21:47:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1426541A1C
	for <linux-arm-kernel@lists.infradead.org>; Sat,  7 Feb 2026 21:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F48C19424
	for <linux-arm-kernel@lists.infradead.org>; Sat,  7 Feb 2026 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770500833;
	bh=PUCVCh7hWYSlur1+31lOhVvCPBN6lg4S3qf5xRQ12yE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mdnQLgh4GCFMxz7tLeRnk9yRoHI1reT4SNT3/UUsse/pmRNVbz9CXmqiRPQDIVdRf
	 8HIaMsWuG5ndWqeY2qtJ3A0vCuSykNiKR5pnc7d0a5sDBVO1vMF6n1lpCl0e/gLzAj
	 1BX+uuSkdY9pGcCR5960ZRw34jYJwiR0Hq1kTxpOKH+/wcI/RpT9iTafA2tANCiHkP
	 86ydXUHeGLJysplDXO+185uX4rpPoHlI61QP1r7t4RCSev25BDtqB/bhXxytM4zH8J
	 wlQkAEXruYcb3ZvxxAoeEze3mVH/AiNsmTFRpMCxgS63Z7SGd9kN2EffWCsvic7CKC
	 wFhi3n+Q61Iyw==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ad019bb5eso1499512d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 13:47:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvDT+xBKlfj+GQ4t1CYQXIgowZMoNNUr2NuyEjbjtDFHN3nsACSDwoGx3UShZ8sgKOmab2ryl7rlUA2F2Djuck@lists.infradead.org
X-Gm-Message-State: AOJu0YzKm+5DrUjASwVvoR0v58bHSYoql/pAQLEvlLU8y6JmH34vvybg
	k5OKjMT6KyLETmj0dd4/iFs60B0S30fhAjSAwhjeFrDq8qTRY2IO5MlHXlXzBtfSEICd3aGehl8
	XURlfADtDW91JufycXmxR/01FXEyUBtk=
X-Received: by 2002:a05:690e:4091:b0:64a:da86:ed9a with SMTP id
 956f58d0204a3-64ada86ef90mr1743698d50.44.1770500833290; Sat, 07 Feb 2026
 13:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20260204164333.1146039-1-florian.fainelli@broadcom.com> <20260204164333.1146039-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260204164333.1146039-4-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 7 Feb 2026 22:47:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkV3wNe2Wxj2VNOXNBN9UgAY2cXQOQkUynQHY8diGrfw@mail.gmail.com>
X-Gm-Features: AZwV_Qi0q0LihRxjzmHgTZVowDxTeIZmBVTGNFwh3fVOe75DigbeCU8qwhhNVhc
Message-ID: <CAD++jLmkV3wNe2Wxj2VNOXNBN9UgAY2cXQOQkUynQHY8diGrfw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_134715_548668_C10098D4 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, Feb 4, 2026 at 5:43=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> [florian: port changes after generic gpio chip conversion]
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

This looks correct as far as I can understand.
I wish all GPIO drivers has as elaborate wakeup handling...
I will look at this driver to see how it should be done properly.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

