Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD34D107BCD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 23:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOd/44im5/CXSgmKExZ34EPLx9erpANLJRLxew2LJbo=; b=fhFCItew1/y5oGm7GA8y5nw62D
	KFpp25CfzWudJyja1FX4pFbkPTKV1bNKRGvPfOGFB2cnkLP6KJIFU7pWJDXsv47W5SE8CE63W+bkT
	ZVVlQlrkgTkSgdrSBZXybUbMMGzAoV9X+aPUTyBGGxZaQlswAPvYozZZpf1HBRfXh/WvLJf2cSqEU
	uDP7eg4BuQ3KKSX4Zv3IgCctUYzaEyTS9AvTNvpLj5PsOOBhgXWgbgFwRpX2xr7fbQqVVVtna9vz7
	6yyqZSgE4GAXHVrlDZx9oBX2XU95vgFwSSINesbQAtttuX685XVfxxlm8wg2LpK7qkuaaJK+j6vTX
	GVuOuAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CBt-00000001KR5-3XHD;
	Fri, 13 Mar 2026 23:45:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CBr-00000001KQg-12Py
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 23:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22E5940458
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 23:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3383C19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 23:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773445510;
	bh=fOd/44im5/CXSgmKExZ34EPLx9erpANLJRLxew2LJbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KAPg71Qz3FD5nku0YGMR2OE6VVa3P4OhlQgxEFExEHqeUTE6By0F/cjfBpI4vlHR9
	 k8zQvOSlLhWoiCbVOhmK/Rhyj6KeuLDGvkkXUmoUTccIuL5YkFFlyJBtg9HvOdVZCk
	 WLJ5olds50xF6Sbb5RZEO/Hqo49M46/DUqKrcN7mYA5b1IsO9gYLN1oGahgc2IWys5
	 1N5aWnfg4p+E8Iul8lIqye6yGOT0Re1eQK0K0Va81wS/IdTsh1eJM/NdZD1iDnWqGc
	 zXriWP5NKH0q/C0Oa8U76CqrEvi/WFPaB0faqF1dDEIsPdsTFh2VQ7bguH6pgHLGeZ
	 XmJIBLCRbvmLw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79860421382so25987137b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 16:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU98njORpOqz8vQ2PHliCetlNfOtLk941tgkwcAOTf8RshlMkimQ1oabVNz7SGZu1dXaom+rQNmF323fE2raId+@lists.infradead.org
X-Gm-Message-State: AOJu0YzZVGl501XnrTmsQuj9fbu5uVt6eSdiUtk0Hbn4xgfz6lAVPSPQ
	qdaiAPDDBKbaPvBVdqQs75E/p4bPh6iPHfTJrABjUThTWajICe+zqdxS1MStQJ5TRuB8Qq2bDI5
	5E0oU7ufgFqt4sUGjnceBh8cjd3Vn1DE=
X-Received: by 2002:a05:690c:34c9:b0:798:23f:7c4e with SMTP id
 00721157ae682-79a1c1bf4eamr55367137b3.45.1773445509360; Fri, 13 Mar 2026
 16:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com> <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
In-Reply-To: <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 00:44:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
X-Gm-Features: AaiRm50-LY2Xhs76thbvINckDs7OJCXfCO8--wEHvQ5qpVOHRa3ZyCR2c8VTkN0
Message-ID: <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during suspend/resume
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	antonio.borneo@foss.st.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_164511_314130_70FB31C2 
X-CRM114-Status: GOOD (  12.22  )
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

On Fri, Mar 13, 2026 at 12:08=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
> > In the deepest low-power modes, the pinctrl configuration is lost
> > and is never restored if the interface is down.
> > This commit ensures that the pinctrl state is set in all cases.
>
> Shouldn't the pin state be restored by the pinctrl layer?

What we have in the device core only applies "init" and "default"
states, and provides these handles for transitioning to "sleep"
and "default" again (like a state machine).

I would love to handle this in the PM core, but devices are a
bit sensitive to where this is applied wrt e.g. some register
writes that need to happen before/after this pin transition etc
so it's called explicitly like this from each drivers suspend()
and resume() hooks.

So FWIW:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

