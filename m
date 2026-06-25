Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7329ACDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rc4UgqM02wX3WS4+otXhhGGHCRsw59oov9SQ5Ze024I=; b=KhlmoHBBxIhghCvuNNzPN95ByM
	IIBNWYOE4UtyZTut8FE5OVynCLcscpAOMxB0fJbwL68XuPcyKFyT2I2smMGj8N3ls4vGvGtusA18R
	/2zNbKwx/SJ8reB4TdKN06TGT573FUyiot6RCd6KoDOOAlADqNUN0ZI9JglKKmtZ9H1+L+rD3BYHo
	CZY1P7/9TjhuKayypRagKLdtWTN1S6Q3IfA32G80Mzg/vngSaW3AolK+vZcGvYhqOdxugez4adHJQ
	DuYbJT6IMVvEWXrtj2+8HNHMg7abh5QLIqFNJBVa75J3phRX0Szan70xq6F3PCChMhigPvO8nMxq4
	NyK4K55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcf4O-00000008oH5-3tDh;
	Thu, 25 Jun 2026 08:04:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcf4N-00000008oGz-1uny
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:04:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8CB4418C9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 08:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D7D1F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782374658;
	bh=rc4UgqM02wX3WS4+otXhhGGHCRsw59oov9SQ5Ze024I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ijFmScwxca4yR6X2sojGzTpvpEOxVMIDOZiP7X34up80RQthP1qXskm8aS8DDgDiE
	 KKreU0ZBugIqqLwHUybFLSHwZ8jjVe1WVo3bFXlZ0Rb+BpJAGgb84T8cPGoDsXrGZz
	 +QRwiwDnZPQMAQRPAy9gLPmU4SEFKb7Zya/OpZhmXy9iR8LxjOGUKFGgriwGv6uIWy
	 5uw0SSvyg3DR4l9ebbGN7VVfnj4MnQuu2wEPXNESMkisuIMPMkhOCLdkyco3teB066
	 PNaWCYq4IMxzg3+XZoqQlf+ncw7LTJKai3oLZgleWWmKG0DN8dkSaSCd4fq6FFwqFk
	 enieRGwLfB9zA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aea1e180e8so466295e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 01:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roz7RjBSVXd4sHK/98cjdwZuwHo49HKRx6wDkpURWA4DGuZ3LuXdv0M75g3Gce6q+DaSXxBWBTGW7bNB1WFJpfp@lists.infradead.org
X-Gm-Message-State: AOJu0YwQa+0uq8ilgYQKHskA/kPTVxcp8YrBbK+VyiVyy3vdrEXWo7xb
	vOtCrahbvObccRJXwNZ6Tt5DhRzDa/aiGZQnDi7SztBdeVXkoyJ4cY/8FrGj4kFWTXpYsylYuNn
	NQ3Kpx8d0xaJtvCppRvnvU49YSh59IIQ=
X-Received: by 2002:a05:6512:6383:b0:5ae:a18e:b06f with SMTP id
 2adb3069b0e04-5aea1f66658mr405055e87.35.1782374657529; Thu, 25 Jun 2026
 01:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 10:04:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjYBygmV-SAbGgdcCCsY_4Oj8DV3qt=SfyThPDL_ZZ3Q@mail.gmail.com>
X-Gm-Features: AVVi8CdrfAs76i3SCWe75sXDLmxrew_W8p1Qr6Cc1VDBJuXIucGhy5y20pIOo3g
Message-ID: <CAD++jLkjYBygmV-SAbGgdcCCsY_4Oj8DV3qt=SfyThPDL_ZZ3Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
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

On Sat, May 23, 2026 at 12:27=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote=
:

> for_each_child_of_node() holds a reference on the iterator node that
> must be released on early return. imx1_pinctrl_dt_is_flat_functions()
> has two early return paths inside the loop that skip this cleanup.
>
> Replace both loops with the scoped variant so that the reference is
> automatically dropped when the iterator goes out of scope.
>
> Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function no=
des")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied for v7.3!

Yours,
Linus Walleij

