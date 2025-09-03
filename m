Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03441CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHcgIku0KtaFMYNLh4blYq4QiR038mlXkofwptYR7Fs=; b=KmTMzMJixc9Tyd3VYiyH0nvKjs
	jM5DEdamuSYeFwG0R/td6FiC3qnHOkT2Actbgig5HfFpHjz7DlWG9EInVGPa1IWSspyykxdisOhHq
	HI/CsbX6c3qCrM6zX/9ztlZb3xWqEfW4eT9rTPTvF5YVQEYN2HZPb7ocaFn7TuJ0qjX5zZETgmNqT
	nYi3QKz67GNxrXU7BbflAjoeV9Xn2QRQyGyWRLw/Ekps0hKr8CCDYT97s2rmHczOm6EPh8tSL6sn5
	jmvqAyfnjD50E97xj03tGhj9kmOHmONULtlL1m9zLV8yIxK/DNpqxdyg0/HUQ3zC+epmEWTB1IsTy
	TxWl9PkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr2a-000000079Px-3ZjG;
	Wed, 03 Sep 2025 17:13:00 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnS5-00000006Zu7-0Zwv;
	Wed, 03 Sep 2025 13:23:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61e425434bbso5631250a12.2;
        Wed, 03 Sep 2025 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756905783; x=1757510583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHcgIku0KtaFMYNLh4blYq4QiR038mlXkofwptYR7Fs=;
        b=D/dfDVEUzZsLO+g0unMARmbUd0ab09R9s/3t83oHDKhlL0cgm/ZmRRDOUmFzwNzRWk
         2W633ul7Xyaafv8Eh2GEFeXL2Ya0/7Fhz+Z+AD9LXZeUalmkGUEJwCfFxWjqmhy4eY7C
         XfTL70vNidrI3LmsI6hzJhW3ypg+Yyg/8EZsGiN0zAOr+cpLfAX1BYaqzhKm/T2NBmd9
         cyueb6HSY8FQlSLtOPpT432dSdt1SNDRjzrhboPGFm2TM7SAZqhePE+w7jXNtDro1iI4
         apohD3KKneVqSF8WGZnQcdYIu4m6qJDX8PRhuB97iAgB3RTKKGKdJnrNe7zaKelg7ao0
         DzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905783; x=1757510583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHcgIku0KtaFMYNLh4blYq4QiR038mlXkofwptYR7Fs=;
        b=MJlu6R0l0GW8iGyRZVKwsV+yljI/xLixQoawRmIygwVNsQcHkQCqghslfioHmwABuL
         1crMgSqX6nXlxi2DoLDfLKe5mWoHOcA5kjBZEMYEF+c+bQB2dUF6iijx6a9gr7zSGYlM
         jQ/NemZpEil5IBV7m2QsunPNkxTSghDyFomZllYtPy4fJD2Axqe7QbfGUNgjhUs1D9Pg
         rUvKcnqk64jjhGwT4RK2p/9HYzSSUjxGvq02aX5zLbRtvZxJ33pLeFAvwQNX9kE0Yj8f
         qqYy0XKQjluKlxNrOos6hzpcnfQMIjFV77FWVi+a6ReFIAOPYu9ocFusEQtMkhqUjz47
         c8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX/qleXZGdFj6h9fgL35a9870F1D/fe5C1VwYyVgSPmra90s4Xf8RbW4uWIt0U0CLMhPRljAg9imz8rS7VZgM3D@lists.infradead.org, AJvYcCXv/rQAjMI3FdpPodYQdXCkWpqbbtZuELuw18UgcAYekP70iCZbsukXNQuz8kvcTieDGxMTm3GQ0snydz9Mn3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYPlrgKylX7AyyPISNUOxacwVuGK2GDBLPYsuCqbU7gabEAb4j
	/palT8VZpW14uK1XwbAYFlw7TAh50i7loGgXGiTDwZQ7V7Ck9Pt6FUNCWUNvh0v47QkCM0x2aZo
	U1yIm7ZDraDdAnEz9Dem6LwIqxqwRc4TIF/CxtN9xHlHD
X-Gm-Gg: ASbGncsbEyK/VAvLZVYeTaNTBxEOdIR4rI+pwl1ZK5hfoo6JBGpJoiqEpvLUpyUcK+a
	hzWTFqyUhXjfZI1ILlGxCuK/iahecLPYatTu9GK4njlU5Jaz/TH8nQbuQSKVz3Ru47JNGw5U3rS
	jwGGQJjBVip3GhQpDn61ZF4M9MCBtJ8DeTECm4Xb0SvtGis56+AtvUeUAmj3OIoR9T+WJQ4I6Q4
	h01VD7gXaxJ71yJdiI=
X-Google-Smtp-Source: AGHT+IFx4TgsjIdX7221cyH/VERuTiLtGl1nmyNXlK5sfPZGceWTVv6FHkr75y9dprEOFMQNGBF7y7RaQWiL9wKyXig=
X-Received: by 2002:a05:6402:4407:b0:61e:ae59:5f07 with SMTP id
 4fb4d7f45d1cf-61eae5973f6mr7216065a12.20.1756905782989; Wed, 03 Sep 2025
 06:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <2235041.irdbgypaU6@diego>
 <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com> <5052759.PIDvDuAF1L@phil>
In-Reply-To: <5052759.PIDvDuAF1L@phil>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Wed, 3 Sep 2025 21:22:52 +0800
X-Gm-Features: Ac12FXxMbXuoikWFpJo4sV8u7OeNSlNP3JsxtdSLpPCiAhy0OcRlc2pHpLo5RYM
Message-ID: <CAPEOAkQ1haNBYsY_AG9onC7Mu3-52PvqtXD4fNvJErqNV7qn9w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_062305_172894_AF3193B0 
X-CRM114-Status: GOOD (  10.37  )
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

Hi,

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=882=E6=97=A5=
=E5=91=A8=E4=BA=8C 14:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Workflows differ, so when submitting a patch you can't know if maintainer=
s
> work from patchwork or directly from their inbox.
>
> So it's safer to include more people than not enough :-)
>
> Some trimming of the list can be done though, for example your drm patche=
s
> would list the core drm maintainers who most likely do not really care
> about individual driver patches ;-) .
>
> get_maintainers.pl thankfully does list the role, so you can decide based
> on that.
>

Thank you for your patient reply. I understand now, and I'll try to do
better next time.

yours,
WeiHao

