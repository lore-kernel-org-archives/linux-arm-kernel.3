Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C8CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRbIKtsqOqygVzGsujZN6/nCxuJYbBISgZetm9P74vE=; b=fFOO3+2oRqJSPX6LIgYQPyPIws
	Nv0gAnxJVwlg84nbzy17JdEsqO/jNFGbKZzdNCTkWiZRVPFNKNGLrr3tlf44+eiQtTRq7IsSPlRyL
	6KbXjqkTgO7JbmuvA4w6I8Ay0m0eRNeg8w458NefK0ucwmEOTS012x7fStbhkh7bDJTPKbyN7R4eJ
	sg+wUIhwfG04biz1IEaq84kEcFotUYl1xfZSbsx1zf+Bqea013KTTILNw8XM25uditZRS0IB2pcmL
	DbeQ6CDxVHfNJtIEk9J2JKu3r/jaZmjFj86wRlX9Jykej0rLSieuWBpx6ijOzsIe286x4E0lwag1s
	McnyVzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCFu-00000008Bgy-2tiP;
	Thu, 01 Oct 2026 08:35:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCFu-00000008Bgm-206a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:35:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9994404BD
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 08:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747821F0089F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843705;
	bh=nRbIKtsqOqygVzGsujZN6/nCxuJYbBISgZetm9P74vE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3SlhvcuQrJSyZoW9VcteJICxeUldHXylfc0gTU6cl9V9f74rwDXanedOzcCzlsIM
	 vswt64LHLMRnb8NHBIWe8gc2vmrkKOWVKRS50WGHUdmcOWc4zp53V+H+C4nVaKGVDl
	 w+Bt0IS+IF87pVzi8Xvf8rZEHU+gahzeTbYeUA66BZ+fVKM/OfEKVbuGt4tL8AqSkn
	 rMf9Laexa3+O37DxX/FCz++g8+RYLyck4j5xVNQmOJxFvjKFGzfCCtDzbLkSrFglKm
	 EvcOg29Wr+wBRsMF/lvqePmxLAiUdDkLgkH6xS6+gkFUOR9saE6Izx186mwo7itaga
	 4H1QiGn/AsfMQ==
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so2969378fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0IrlLI0uxcQX2wx/VEoeZ3n14pMiZEkX7V161IGJiaowCThBR/hdfFTXN//POIX/xOWQnfX7jwZnAN4CaZCHi@lists.infradead.org
X-Gm-Message-State: AFq9FYKzb9vHSSRB2lvyAnBs8o8dG3jtTYgglB9PkDyftNdxHaBlxOKC
	++XQwl9uAq1/MEd7+tdjpW1jerTW07Des+7928GF/7CD8o5wk65aSSfAwjt0gDOJxQJwE2obDz2
	wJKkttL27o8vJnzI4pxrBzDF8ZQd6+y0=
X-Received: by 2002:a05:687c:20d1:b0:491:88f1:f3aa with SMTP id
 586e51a60fabf-49dddd46654mr4533364fac.26.1790843704807; Thu, 01 Oct 2026
 01:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
In-Reply-To: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:34:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLndGJmGzeMvHk695Kh9y56Zxye86DiFTuoKBiWTnvkmLg@mail.gmail.com>
X-Gm-Features: AclHuK8ING7eVXmVQv5H-ajPOg6LfXVJcEvYhwqQVDz3x1__fBSswtm27gPTJNQ
Message-ID: <CAD++jLndGJmGzeMvHk695Kh9y56Zxye86DiFTuoKBiWTnvkmLg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode array
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sat, Sep 26, 2026 at 12:04=E2=80=AFPM Chuanhong Guo <gch981213@gmail.com=
> wrote:

> The wf0_2g group contains nine pins but only eight mux values.
> mtk_pinmux_set_mux() indexes the mode array once for each pin, reading
> past its end when configuring pin 78 (WF0_2G_HB6). This can select an
> unrelated mux value or fail with -EINVAL, preventing the Wi-Fi device
> from probing.
>
> Add the missing mode 1 entry for WF0_2G_HB6.
>
> Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 S=
oC")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

