Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B78ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vABprRdHi0+jMSnKJHgOu7qPrGQgpls9Hi+j8cLzctE=; b=3IVEFwWGeL4ZG+VJfZCEhMgAU+
	0GNU89el7cYHwlf9n9TIniDX6ZvKVEHIdPcwYmMCniSrrt3QYuXC6DcN1XYOi7DHgaQKlCBC70pbJ
	HUc1JLgcI4B+GOJ53StBYPLjo6K4KYNVIWcdu1pZsh8SqHBK/fQ+eNekTIebYb0ZmgHAWaASot5SV
	A4cHAHit3H8axFPqmCjSpUmJyOcCxfTlOTtsRuT61Fwq5V0tso5kp1FCiiOorpGsS6x8eIhWhoyTe
	uU18sa1tuK3X/l0UrU/qm5eMQob/qBgnw4HFDU3aydi1XnIDA8Ei8SJuvC+u92B/4NXiBOqdra92Q
	5o9n16+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAHF-0000000BfDO-3vWJ;
	Fri, 12 Jun 2026 22:23:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAHE-0000000BfDG-2Xwc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:23:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F21FF60008
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 22:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BBA1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 22:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302979;
	bh=vABprRdHi0+jMSnKJHgOu7qPrGQgpls9Hi+j8cLzctE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aiR7H8QqEcmIZig0yc9a796CB/vlfHlamkRhrEZqns0LD//voS5rIqkf2vgSITXwL
	 lqmlFfoKK+zs0uMszJ46WsPVcojNgTIWU0IR99Bxb3L4SNQt7L2x9h77XjOuUfFARl
	 iqGr6s7YZQOtoND5ewAgLO7Aadl8ajVK7OQPd0cGv1sv3Xga3LKyZ5qxOZNKqryu1Q
	 +TQ54C8YUEhMgnN3YdKPTqZz/n/aW0kB336olU+WrrBVy44ANJ7vk/c7eSOZHPiY5g
	 sy/B9kVBOibRJ/95dnzj/qoV9BYgkpuCNL5gL9qdOS9ODFfUDYTqFQBgb6sQUtiEy1
	 grdI7ogVaFdhg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so917777e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 15:22:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Kfbi8iIJ9DeVMCL0Y4Ri/iE1QzUYDSFi0fR5bwccArUSjpwHSgka333O12gbOrkp6eiJWXa+tTe2cRC9tLm+4@lists.infradead.org
X-Gm-Message-State: AOJu0YzML6I968gNzF8O6p5G+Yz1WR7IGE3OnpD0+KjXM9/MQmFXHZSB
	aD7pQvo7G+a3YfhQDvOcGTX8hgL+vVSr0au691kjUp5CSRU7fK8cK0TDLCU0hy3JupyOsNaNJyI
	38ENPL6opDj7JUDPpP14yVkmwlBuXg+4=
X-Received: by 2002:ac2:4895:0:b0:5aa:6d0e:9d2d with SMTP id
 2adb3069b0e04-5ad2db3aec0mr1112788e87.20.1781302978525; Fri, 12 Jun 2026
 15:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260612214939.1883911-1-robh@kernel.org>
In-Reply-To: <20260612214939.1883911-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 13 Jun 2026 00:22:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkbPN_UKj6bVA_jvRFAaDjEKtNo8fKZGDqnym+BcmeKrQ@mail.gmail.com>
X-Gm-Features: AVVi8CepGFY0snqvsoBINOTrVOumoNZcMuGaGS0hHzSaIpqAZRiRaNAz0dBo-S0
Message-ID: <CAD++jLkbPN_UKj6bVA_jvRFAaDjEKtNo8fKZGDqnym+BcmeKrQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Match DT helper types
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 12, 2026 at 11:49=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> The affected pinctrl drivers either check for the presence of a standard
> property or read a property documented with an 8-bit cell encoding.
> Using boolean or u32 helpers for those cases disagrees with the binding.
>
> Use a presence helper for "gpio-ranges" and read
> "microchip,spi-present-mask" with the u8 helper documented by the
> binding.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied because good fix.

Yours,
Linus Walleij

