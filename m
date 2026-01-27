Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0FCD13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SPwDp31xuURn5O8xpFVfUZEJIeCSV4mqEXYsNyRU6M=; b=QJju179mLz6HajqkqFwEGqmAHh
	q/H9d+ScoUnjhUAuxOCh9EpdpYJE1sYvaWeGNWIokXUkij9rJ68+A+TVBGHxqJbM33HQcJCA+qSB8
	vIGJbugkfB7vQGmELAKY6EUhE6Mf8tQXcsXdOufEKZInOTRCK0eLaLzjqk1+Kv8DzWcIg8suHw3zF
	TOE9DA/iv3FKywqrjwnU3aGM9yakhmyepK1cZNFqYTjj1qfgFh/c+ypiNPJ1Evz+LYAzSDshxRfAf
	BQvAHOeJK1kqHorhHm5UjmKCSPLFjjYU3rKiBMayQndIfSNd2Ib4+uknu80cSsZe8PaSaKpPIt5KI
	hJgcspcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfX9-0000000Dxcv-391W;
	Tue, 27 Jan 2026 09:38:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfX7-0000000DxcU-2yyB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00ED944399
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D9FC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506728;
	bh=AcR5zocr/5NXdXgf8kLx9UzhMZgfu0y6OzDuBzaSEBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FFfr2b3WJj63ZLybMwJSVI8nLM7GkMoJ7DS128OPj3Ur/Ck6gvvD+T/0YyIrqN7jk
	 IfER4ehyxf6hJpkpnkCV8Zv+VPKiwakmdbdHFmOKQcNJhMM3LGHuTrNkBL7ymtOH5m
	 qcCORynpVi93O+bVbgEea35z06s5o4oQAsYwrbCam4tABwcHIvrUmdX1jCFE8Q+hee
	 +ZbkYAH4gQZkAI6j2Iiw7Odlfq9PKcSinNI14gqPDp4jzvVEm2sd3B7zLiHZZL/sJv
	 HjWsgTbM7YZuZiJNLcZY6pC8YxVrm+tkTpfO+X2FHAzvxxPJGJzodPuLpppUDo7k0u
	 9vcWqq8WieY+g==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6496a048323so2478599d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:38:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9ULjkmRoWXxIXFLXUZS9yrtxeOK80PQT/k3xOyMWZ3vzjtI9MUx0lPIBgMreDTVfpimPp91dQ4DlPuHI1gpsM@lists.infradead.org
X-Gm-Message-State: AOJu0YxU8O2Ia0wddaRctnUG84YcPsqurpzreDIBxmnn1Aq00IqoMO39
	3HH1ZHBYJa3SL7kcr0Hz2nncAII9iDm2Hs9rKxyAk5EnEamHQOxcYU6yTLfwdzlY8kABCbcMJWj
	Yv2br5bf1aXH+nyO2Vwk1DMX56qfXLc0=
X-Received: by 2002:a05:690e:118b:b0:649:5e99:ce3a with SMTP id
 956f58d0204a3-6498fbf1c3dmr591413d50.32.1769506728263; Tue, 27 Jan 2026
 01:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:38:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLmjr-XSZJgJrD7cgga2US6EUwzPWZGTsdwff_ZngWbX3w@mail.gmail.com>
X-Gm-Features: AZwV_QjxNyEYQ3cox-qvZu6uGhFsKYJM8HbpE99pr-bqcEaSY_2yQ4dJQVfr56E
Message-ID: <CAD++jLmjr-XSZJgJrD7cgga2US6EUwzPWZGTsdwff_ZngWbX3w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013849_789217_35BC720E 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, Jan 21, 2026 at 3:20=E2=80=AFPM Shawn Guo <shawnguo@kernel.org> wro=
te:

> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Acked-by: Linus Walleij <linusw@kernel.org>
Exciting to see what will come next, long time no see Shawn!

Yours,
Linus Walleij

