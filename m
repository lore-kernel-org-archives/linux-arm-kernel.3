Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB7A1098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3oCvWwktJOka9q2aoujsHbZ4rvoudf3Wlq8RAfXnIk=; b=nyQXAeOjH4GFx0i+BGXVK9MXYc
	+yR8qOEsBYdFMRT5vxvzhNkSzHoCsQRsn2Ebj8hoJXPjkrD78xOaafaU56/MbLJ6ufAV6F7Xu15xM
	B0D2J8Rt5DHOD0nLsM9vNtrXysM8ylZ+vroOovVhzyWxr8scW+vNGDqAnkDQ60nFAJnzbreKIHqG0
	RF0fBSVmlklX4rQtHyTgQh7H9/bCgUQ9xDEEhWO05G8U9q86xbEXrG5Ezg9EX5L+zGiCohut2bCL0
	iwf7dEcZHeaM8c75KyjVc4t5VaRvOQtpYPeHHAW8xlYwK6Gs7fpubDMfGKAKo49T5LEMluJupw3yk
	dws+hSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a5E-0000000CrtV-45pK;
	Fri, 20 Mar 2026 13:40:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a5D-0000000Crt6-0FWF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 717C642A1E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EF2C2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774014010;
	bh=a3oCvWwktJOka9q2aoujsHbZ4rvoudf3Wlq8RAfXnIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pSbWswNCG1U+am53GXN61FyyVrA/NHtY2WmM4qZpgNbTT6uGcwitK1NnB7MwESUoz
	 W9CkAlCshbYKtU98OnBIEvmyp5Og2nNApzud/zbsoQPr+BIv+EoAfzeiSj4f7101yB
	 yi5IVR91Yw1b8BXPExgaxxl0QEYCKs+X+YZr+TL3jlrrjtXbyuj0Ae1daXsXO7YKCA
	 1wosZczUwO8m71FISeB4O6YdO710eNq5XjHIZoMh+ZOOm+2BthPag38s3FyQ9vndi8
	 UlfVeLWsGJxxtENegHwZY6Tylflz8jpybEIE4oOGD1CONDbsMgO3e0EM16y86HP3F1
	 PQcwJ4y6Ydntg==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64aedd812baso2190305d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 06:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhvTxPlECg0Za1fV+W97l5lfux1bz3Xp6z53j6DYpQU58Agpu+0TJjLguasQfBfQzE5MjypmwV84DGIh4dIc1k@lists.infradead.org
X-Gm-Message-State: AOJu0YwNWDKjMidDFZtZrt+J7iMQsaf5c6CbNaqDvhuMe+Vx9PDU4C7K
	o9deOLTGlBqoN/MD15zvgSE9XX2/97FdHucWlZ7cGKxK7pKSaGtpebMaGF/0q/xPTAX8o9eyUbR
	dokBt6YNdnYNAokyFvV3ZVFamz1RXt60=
X-Received: by 2002:a05:690c:f14:b0:79a:6f11:3ac8 with SMTP id
 00721157ae682-79a90ba015dmr30839247b3.29.1774014009652; Fri, 20 Mar 2026
 06:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260320015323.36383-1-rosenp@gmail.com>
In-Reply-To: <20260320015323.36383-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:39:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSs_zr+VjOFDcWeWd8k2fvW4D_=AB21sOzFDNeRfY77w@mail.gmail.com>
X-Gm-Features: AaiRm51td7xH5-vHG8a3FglHGrwjolWTDZvQoaQMPmI-u_KtaEKBB-jCCe9iV-Q
Message-ID: <CAD++jLmSs_zr+VjOFDcWeWd8k2fvW4D_=AB21sOzFDNeRfY77w@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_064011_140885_EBAF7366 
X-CRM114-Status: UNSURE (   7.53  )
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

On Fri, Mar 20, 2026 at 2:53=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Use a flexible array member to combine kzalloc and kcalloc.
>
> Add an extra counting member to support __counted_by.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

