Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF1C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=; b=ibjE3NrCgNJEnXd6IWeK6gN1uG
	RMYH6YGMoVDW//XaaYPL/OYPhqvS+xmqWO5wbpQMRgG4uLf3giTNEPV73YS0QGWKxDS0tN7QsEnAf
	VdKc0czVPkMAwi1kiYpKtBUoTMmGzqE9L6Hml8Iht5/lFkHIGjbuK3S2WwpT77pLRHmArcYjK6NVG
	+pADYR0+Sl4XQmMRD1ux13d47vHVO6q2Aogqc+YZddZdoPiC2dtAtKWHke9tESsXi/UHIfjd6EcCq
	e3MEjzIrw2SKD2kqu7NNV4o97uwte/uHiRxnG4gAqcTYFZmEGeSeLY9TgJacWdn/mtc9vOVfAiBvt
	lwbuqhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xyJ-00000008ylh-0X0W;
	Mon, 31 Aug 2026 09:06:31 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xyG-00000008yl8-468c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:06:30 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1c7364550so3398125a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788167188; x=1788771988; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=BKudmVInUZZ+uJ7q9DlLcHW2twAdaSmqOueWbvo6aTKAEqlK3BurDc3+1SYvcX3w7/
         a8KrMJjkgcK6Wo1MbB+oGmwEgWh1hfrQB4qFwUwn5z7BZV5MzffBtx08ixaNqF2As12x
         rvTw7l7JIZcooTACGaw4SeC3HYJe+mheqj3ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167188; x=1788771988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=RyrCUGjJew12N8CYGmkDUG4FA5mIJxDbgmN+ZFXrMrQv+B2gVyqZx7LpSU0Yvt6A3/
         JogbOh45Fe3a7qlq9XkMRUAqX5/QGIy4W3qJJ9CppgrpTjHP3voIJBkUSi0Ks3Rp3mGd
         VwMXWA65SQCdNZpImIebuG68sh2t7OXGTt9QZQxfnYpmQq3fLXpTqFCblSHZE6C6C58m
         fQ4XH+GnYvAlTljrN8yh8JV5ZOgaxmZo8lFRgNfRIqCW7RRmfJmLXuib2xgStnJVLDx9
         gZiBwkL0kSueD/iU5hovhdoXLRpAtzvumop8hkVEPlq4fz6TgfMhabZqCE9dtpBK7oXN
         lnmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnuRIpqFsf8K0D7PQwLYHeIDYTt2ZYOj3EjE2S6OzCaIyFWgAopiuNrvNrM55333i3U0M7IL1mxzJlYBvD9AhV@lists.infradead.org
X-Gm-Message-State: AFuF++nzyShcIJ1wAwAvsi6/RK6G/q2weMzobVKkN2Kd+ie69BBg3USC
	IziHOgm/8Y2P058fI4cu9qiWYaYSgoZUL33viYx4Oopn2wTJ6OSDMSkP+8hg8JvRju13dviabeo
	cHfDczVs9
X-Gm-Gg: AR+sD10G0IsT+zGhPw4wsTWiMXW9V674m6j9bphqyNyx1OhvzHCLS26ABguNuPP1iRx
	/1o15bb6gJESvgQuzyuxgYXU46SYjD3cBZiCLtT1fwdbrxeGwGJmS5FyDdLGWAkfrM0eqFJ2kvX
	ckIiHMu5JNI/7rdsjBGOE2d0XWG3C7b8NUB/t3JDa4RKBFeFSHYUMcZKNY9T9w05IntAGChP3OG
	KknUIDsZRakfnxGR9A4n3wa6jhtwxt4a8tFCrLFyCzvnSDBIRjW2Ml9ASAiqnvNlfD2ccatWJyu
	g/pc9smG2Pu3Fi0+FGZWarCJ9I+VNOOWSm6nwzmQ7FRFCVCpNQWsr+mrkUfUfFocamfVoaD6sHv
	qkGz1EbzIprCUitdHI7ouIPKoZu7Z4dkr2jaPA+koTGJ32JZvBYaSjt6I2O+FPebTc6ePMXLwda
	JxOeW/VtpUK46X+TSHgjUgIUv6Byx6lXN5UZlM8jDs1jrlY2mylEIg+mMUxeE3mbVXqoZOB6Ni5
	h/x0S9KKfT3jKsbD6oucruw4A==
X-Received: by 2002:a05:6a20:6a08:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3d3aec25077mr22628208637.24.1788167187781;
        Mon, 31 Aug 2026 02:06:27 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36aecb6sm3668136a12.18.2026.08.31.02.06.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:06:27 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3291008a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2+E2VIDo0V5wcQaLI4Nd/MGkGx+e4rqY1TDDeAquymv0X5Yqv7IjHG5OsD0kZQdDLA5JmThSjyi9LsqzSW8/I@lists.infradead.org
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-396d0d7b94bmr39842739a91.4.1788167185477; Mon, 31 Aug 2026
 02:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org> <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
In-Reply-To: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:06:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
X-Gm-Features: AcwNN1XQTqww76phd4AsllCU6mg1cRdglEfcZzeuamdPB_miugwlSSd3Y9nMY_k
Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_020629_015898_87CF0DE6 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Chen-Yu

On Mon, 31 Aug 2026 at 11:03, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> > adding a depend on OF, the following warning is triggered:
> >
> > WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
> >   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
> >   Selected by [y]:
> >   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIA=
TEK || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]
>
> I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

It was triggered by media-ci.
https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/17368=
35/test_report?job_name=3Dconfigs

A way to repro is:
make allyesconfig
scripts/config -d OF
make olddefconfig

>
> > This patch explicitly adds a dependency on OF to solve this issue.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks!



--=20
Ricardo Ribalda

