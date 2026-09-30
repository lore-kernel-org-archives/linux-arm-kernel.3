Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7AACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x75/A4gCqzcZrGvIrjJ+sqJbv94Ey0wVQQ18KutMg1I=; b=4YtkXMDNo3M+3V1l2xLQCMNjp2
	/63bxekZLoPTnGyD726W8wjtH76tiMFJSGuXcdf78mLr9MXYVkrxGWK93822y42t44UPxLm9vHmp6
	iizp7gMb6903cZCKZrhW+/0n9I6qOTUlamYrb0WK9U15oWhw/h+t7UUYcVLDlJpZ792wCUo5I3mBA
	Q2mbcoDc9Jl8Q/8OD3l+UxvGltEsAnwTMe0TEOT09EWDodc/z76IvoWq14P0zsoTZ3ToYHMMuqihh
	WPRQkz/CDyeR9Bhmf5zPIGEZH3B7s52fIo6HMgNjO+wfjfolQc9+84nlJOw60kB1uR5wcvjJbBNCB
	Ij67Jjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC26S-00000007HQA-2Yqa;
	Wed, 30 Sep 2026 21:44:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC26S-00000007HQ4-0yK8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:44:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC67F60A57
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB931F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804679;
	bh=x75/A4gCqzcZrGvIrjJ+sqJbv94Ey0wVQQ18KutMg1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MABWld2wIzPLvtaI5dmjY6APKTlFRidOZdEFdKyrd8ZtXE5pUM46eY9a8s0c4yDOr
	 ov6KOwIYvxpwGb2i5+DN3bV5vXfuugYtilfrc79ZZG5DoWo0ji7nCaVoHayGlaOukM
	 i55YgFzDi3G4eDaoCxpxoKU5FjuGpmRyr8oyOeErck0yM7+gmUjypzWnPqor9BagWN
	 16QTnwYcI0px3ytzs67ROrJvjVSwWaF3dt7x+XPWQUsZxYIn+h84FDcOb3djn+vZBg
	 0c2QPNHkcY+jvQVVGeasvlXib/pibESD/Q3Ikr2CLTcQPiSCVzVTjjE9sKklCKwSFi
	 v+KjKMnKaZf6A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330dbd67so1982838e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:44:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxffWWRysNxz5uo5GDsOuLUFpRXju6v8Oz+G70jb82K3BhcKq66/xobjVdJ73khQbta8mOnO2K1XPguof74FAB4@lists.infradead.org
X-Gm-Message-State: AFq9FYIO4sc1QZUhQM7keJOgt4FTnp0FZgxZpAu1CFomCX2DLFgCVH8o
	7p3nFQUh5VirDt1KPnTSO8DsjBA3z4KfIXJYtszEUOSb/PfA3L65quSSrX4Ww4avOqnYgETNl1R
	MCIo+Tss8zekOrAYvNJY95SrYV2GDlcs=
X-Received: by 2002:a05:6512:3e0d:b0:5ad:5c4a:8221 with SMTP id
 2adb3069b0e04-5ba4026960amr1187056e87.0.1790804678165; Wed, 30 Sep 2026
 14:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260922031954.320895-1-phucduc.bui@gmail.com> <20260922031954.320895-4-phucduc.bui@gmail.com>
In-Reply-To: <20260922031954.320895-4-phucduc.bui@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:44:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLmE+Hjiv7UahoPXTXHD1KdYmeHLMhSybTt=3rHxSjC2LA@mail.gmail.com>
X-Gm-Features: AclHuK_ndMT7hGc647CUvfJALH_COJ36nJJO_gqn7uNKeHTlIiNYpO8FKvA5GLg
Message-ID: <CAD++jLmE+Hjiv7UahoPXTXHD1KdYmeHLMhSybTt=3rHxSjC2LA@mail.gmail.com>
Subject: Re: [PATCH 3/3] crypto: sl3516 - Use pm_runtime_resume_and_get()
To: phucduc.bui@gmail.com
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	davem@davemloft.net, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Gilad Ben-Yossef <gilad@benyossef.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Tue, Sep 22, 2026 at 5:20=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
> error handling pattern with pm_runtime_resume_and_get(), which already
> does this internally.
>
> No functional change.
>
> Found by manual code inspection.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

