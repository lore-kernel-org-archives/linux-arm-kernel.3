Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D60C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=; b=BzG1RgfUHIopLkD3Ft1wdnZIMj
	I6MhSdmXxSdr8tsoapRDj09XEnY5wENrvyntCKTnPbPR7UwywXLtd0hAAwZiMUbM8QLBYcqWIR330
	OiCU/MhzsfMIsgcln/gJV1L6Er5kEd5hfJPY0A+tLGjbdjDqzV2cHdoT01NA4NQ6b+a/YNgjrI2Yd
	GhdMWC7bS4ss/o4/crCL17opBmAuQCyCpbV4CbB0xo9fmpO7UjAsGCK02e7GA8B/RdlKrcvBXdd/J
	VUaaIv84+l/vgba6+BX9LTbxoAVjIQDPPU3QEOqRLMunx/atoTHu8ssvx5NZpZuP5pXUeMTZ73mUg
	97mtKhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeOX-00000002LTL-0CHm;
	Mon, 23 Jun 2025 10:27:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTduN-00000002G2G-1OOL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:56:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553dceb345eso4377080e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750672569; x=1751277369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
        b=xd42oAUbYUJqr+qxtVfFPd+KBf3f5VhuzzOGt+RAjkwLZRbrw6KRuvLZ1yYYcrCY0k
         upLyB0zFwS1gfR6l1x6QgNrToXbmJJfST32rEUqH2gpfrL9NnTzG2EAoknUNo2eBV9tW
         WzYqMcqu3rPK92oJ1ETxCxZC/a61BsFjfxONa2lDTEo5bVoWHxJ72tS8024ObK/I+M56
         RIKmN2eknH3cvFkglgqsOGNb3A4E2DYbGz8UkT5Qnd5qadvhE8w0E5SDsbtDl+2kd9vc
         YWEWvcyid7DXIKj/pGjwDi6f7z36O9Y9UtdIHeIZ0jYyTHHIf/hrvH1pYscx2ovn5qIX
         Q74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672569; x=1751277369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPeDtzputbBG8BYmPS4Q6TNFFvEXgzemPhqRvBeZ31Y=;
        b=wuzT5SZZCWV4KSgBKatCKLsDsHhrWyApiumPUSdVT0fHXp1MvncMHVAnOMDahUPbM5
         erOAJ1Qx1J7yF3nEBF6z0WiMjZRG09Gj6FPw6zugt8kp0O5WTci3zChgi7P1n/tlnGs8
         vWaA/mTzThkjxxNsJEPuhh2IriTRqzZOAllsaAwFHjzRLaZ5vbRHr3ZwLIPCwbYSciig
         0akky4JTzBpXOT1Gigczdla8nQiwzeUEnpQJoNSH+woQx6AKOIb+V+uNSs6YvL7iLGHk
         I6hWFdzwx4jRfW8lplCkB1Uwfqy5PCoFFwdVXgfH6CEADLkD3AIMXuSMKnFxDFKcaKBm
         D+KA==
X-Forwarded-Encrypted: i=1; AJvYcCWjfWsX04vkxm4HMDmzKpqK1ji58pfJUnPBu3OryQneiHMevqvMFGXIRuCi8crbZZGrgjxzVBloc9mxDL56viZl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7SFjHjcUTHJTjxGZsWeUPSsFFDlXOCyyNv6q9beJoAovdZ1vi
	BtwQpc4QP45UnLUurrHI5WJEKpLcnmDiV4xfDC2ZSYiQh6mNHUP561cqxmdU4PaZkSvdDzstrUF
	Lo1pnC4nbVTR/UsGq8lKvjSIAHF1BfkQoAaDKXrXn2Q==
X-Gm-Gg: ASbGnctR8FefZtZ4YXf/KPw0iFBkpD17WxcJ2QPvsgNu0wykDtPyV5wgBgkZEm3jAmp
	nLmX5OLMPsYBqINj9pFA6uFJWGmS05YUoUTUd53eItGxvnTt2E80DiL53wgJcbpJvOiLjBt2A/I
	/p0WGgPmAkqaUlZr2ELbqnkJM/7FAHjFCpB0XwgoQa2EPU2CxiFMnH0/RKWmjhiPa4uHXfGkIhd
	g==
X-Google-Smtp-Source: AGHT+IGMaE9K7TjoPvRiPlXWOuU8YRsnFELOXhWXUfRnOBAE1HlGniGGtDxisVHNWEEQuzgyMBQMIN/+AwV3/43kfW8=
X-Received: by 2002:a05:6512:3c88:b0:553:cc61:1724 with SMTP id
 2adb3069b0e04-553e3bb51camr3441310e87.24.1750672569238; Mon, 23 Jun 2025
 02:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com> <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
In-Reply-To: <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 11:55:58 +0200
X-Gm-Features: AX0GCFuwq80YRRas_rerTXxamhsQCeIBZVM5a2xh0c93mD5kLuLbXD7aaKlDuiI
Message-ID: <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025611_394377_F08B4D58 
X-CRM114-Status: GOOD (  18.23  )
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

On Mon, Jun 23, 2025 at 11:54=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
>
> Le 23/06/2025 =C3=A0 09:33, Bartosz Golaszewski a =C3=A9crit :
> > On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >>
> >> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that retur=
n
> >> values") added new line setter callbacks to struct gpio_chip. They all=
ow
> >> to indicate failures to callers. We're in the process of converting al=
l
> >> GPIO controllers to using them before removing the old ones. This seri=
es
> >> converts all GPIO chips implemented under drivers/soc/.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> ---
> >> Bartosz Golaszewski (2):
> >>        soc: fsl: qe: use new GPIO line value setter callbacks
> >>        soc: renesas: pwc-rzv2m: use new GPIO line value setter callbac=
ks
> >>
> >>   drivers/soc/fsl/qe/gpio.c       | 6 ++++--
> >>   drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
> >>   2 files changed, 9 insertions(+), 5 deletions(-)
> >> ---
> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
> >>
> >> Best regards,
> >> --
> >> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >
> > I see Geert queued patch 2/2, who would take patch 1/2?
>
>
> It is in my pipe for v6.17 but if someone else wants to take it I can
> Ack it instead.
>
> Christophe

No, that's alright, I just didn't get any notification nor is it in
linux-next yet.

Bart

