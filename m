Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843B4EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VhdsvctOPPInwjU04C8i7FrYJ3pYmp/oUZ4sm6hWN0=; b=CYQoj+FvMM3sX+pdONcvM8LUsR
	aoYc8X97ohMCrDhOGQpn02NqO9gjYhU8szXMY77n6pOyo7im3fCT8WNAFYGzTe9kbN6/pvByjv7OL
	5pM8buIrtcGKvcRSx13uSAgMIxZox4CSXKY1JuOXGqRit3QteeXVPy+hpLRj+8ErxeauiuEKpCiDZ
	BNIv/7MibqVtt0Jh472bT7DjY5iVblY1xOxNy/vjJROqQIU24t49oRmBVe+Q9nFAq91qVKZbx9lfZ
	K0LrYuv+smBvW5NRFSNXKZYoLu7AK4Ez6q4mJMyd6GfPjo2X5o1nD5JAw28mXTOMPC0IuThn0GgnV
	xjZ/0XhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztJV-000000094xO-3Zy6;
	Tue, 10 Mar 2026 09:23:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztJT-000000094wv-2mZf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6936443DE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A6FC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773134618;
	bh=1VhdsvctOPPInwjU04C8i7FrYJ3pYmp/oUZ4sm6hWN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tsYBKMyqewnDvu3QnwOXJpTozeaW1Cq2NAPg8EhFJmB4tCuJIdapTdEhLjO4cLWPZ
	 knpJacCfmAm1wQ1p7hgmcxncaQfbWZjiCov+9sEV/sOyTDhPvdOvkVSYyejK76nG8s
	 OncqWBk6Jcq42QU12EjGreRzzY73Jub3byNj20PPwwDtCufPpqvU6oiBaVvJjFy8Et
	 5897+Bbu2YUVip7IrFOUs78qvSjOY/Mqxn0tZd9V+XQ5UVYXrJh7K5YSbVl4A+mqNu
	 IUv2IPIGdphCq3emrbViDdggTWU74Nsjt26tc6WzsxQd2MbOeiW4Djc/fRpYBOP838
	 yb4qFKuYYNGYw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79800183233so171055347b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYdBVib4B+yMATlkJz0/XcFPzUKGGq7avRzPggnfEHqa719Q+wFikIWq5SnrrOnzDRjHgjktcET5EOM1NRujGD@lists.infradead.org
X-Gm-Message-State: AOJu0YxxBuNGLgWS7WlbBaz9aK9O8tHKRIkQ+nxDoPIPZPkZjF1pqZEC
	zi92o6JMLkXiQM8GTCleFCSJgsezH3xlzvZDJVg3TfbBfu4ioAU2Dp0Pv59IYFKGFi5ek3QyeoS
	tnp/3vx4M35xITuFN93jCnyN9Dl+HvtA=
X-Received: by 2002:a05:690c:338d:b0:798:55f2:de33 with SMTP id
 00721157ae682-7990a67eabamr26807187b3.7.1773134618046; Tue, 10 Mar 2026
 02:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260306063411.2041232-1-rdunlap@infradead.org>
In-Reply-To: <20260306063411.2041232-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:23:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDfPRvD4EfHpLjbF5rvcZrBWM4A-+BmRwXEYEcWJ4QpA@mail.gmail.com>
X-Gm-Features: AaiRm51Mv6PjvWvJQZCUmGPcNRXEtPZ2mMosgtjimcuxjz3z5nZjwgEkkU8MbrE
Message-ID: <CAD++jLmDfPRvD4EfHpLjbF5rvcZrBWM4A-+BmRwXEYEcWJ4QpA@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: s32: correct kernel-doc bad line warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022339_968085_3FC7F948 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 6, 2026 at 7:34=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:

> Insert a "*" in the kernel-doc line to resolve a warning:
>
> Warning: drivers/pinctrl/nxp/pinctrl-s32.h:18 bad line: this group.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Patch applied.

Yours,
Linus Walleij

