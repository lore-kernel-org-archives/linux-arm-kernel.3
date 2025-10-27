Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D4ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=; b=B0TjoB560NBBQ2wyrjvF/rFF1x
	h9xzvhObUYKg2dfnz3MxFYa753eODTbWWB8JsjZ6VnhQqsShywPZfIaFopeNi4Pv+4U9qir8tdhky
	a0bQC23uuJTFoOgbyR6oV/Tk0ZYCbmKk+zQ2KwV3IH8MWdM4ogUjDgjc9IPneGVLVMCPzQaLyFT/J
	ewNweH3H0ExidxRpKyGN+Nycnd8Dv15LM4l64qVIJR3c/roqScV4kdwfxwH1BjPwA5gWw/zLQufh/
	aOjZWWVEQLrNGwtwdbcSEoKoXqCylQGEGMhScrDuMROYHRN8dW+twYtDOIhLGJJK+V+uSM8htOL52
	wRdSuQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK1e-0000000DbqI-0Urv;
	Mon, 27 Oct 2025 10:00:30 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDK1b-0000000Dbpt-1vih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 10:00:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so4040907a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559227; x=1762164027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
        b=W+vG1xvzQtmBSzV+bzY+cBpz+yB8fwpyuDN0A1mJy+hiOATShSEKihERjtPK+z09Mc
         1+O8m1zENRgRu26Lnl/CeptW9HT8ulzRsq3FJpfsopu78xBdLoMrR6Gx+brBvhocrTc+
         /gbizs9+CgOdQtnMvx9IvUozSZ29M+CGHrSnGZKlL/AePcRLlCc0J9ns0onAA6V3f0uF
         hUHtGsGHEIxe4kBM7lfLfRdMWQp5yd5kmpROcThUn7dHHZtrYbF+ChyFviZvTjrjuAdy
         t49lSt/hX7H3M1j4+CFlcoQJU/UIb4FbvuQwwjP8jy/ZhUzSb3mzVGive6I/dKtb037K
         WP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559227; x=1762164027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
        b=uAopQ2NgvUilvjoJ9X8VXVH+PEon1kFugKH6uL9zQAEOG3/WjXkNEB+Y+scJ0kWGeP
         SnWaBUv2DOGC5Sj3YWaJ7LpLT+p4s/foF1tek++sY2jruVLfx1x+YmTh4EuUke4cJTfD
         OUNQWPB3hTAP8LfOJdx4JdKBOtJJLIOE/FSfd1ZoTgRSrK5vC8O69wDFcCbq9NdNcu0m
         fXs3mHeAi/Ws1bW2YK4W9okqmVcBDI6LH6uG8CCePJ/Y7KcETamDRatEWrdpd1HZSa7q
         GujptjewL2paTPBK/q1Nsij+pmmgeUtWhLfZWF/PEaYR9jjrCa2b4u25UWHNs9d6BNzW
         uMRg==
X-Forwarded-Encrypted: i=1; AJvYcCXgqTl3njfGMiITvEcGxIRYPESOmY2m/kQVUwMLt2EUc8JBWUmkr5kDAsisIPVvybarEFOqZllQPG+pZz/gXigq@lists.infradead.org
X-Gm-Message-State: AOJu0YyLAfjUn4gvicm4XeODG7wjGxAHB3juasBgAyXdJlljQyaLewSU
	wAiHEWD+kAamUgpKI9USvvrkTBdF+c6xjdIsZbNKWUEyzsy3AUQx6HwUQy5gxMAKhS5ifvL6seF
	rA2sDTgrvmd1SeLVI46wAfl+lTeCYMmA=
X-Gm-Gg: ASbGncvxQsuEzy4wwxSglVFko8acwVxWw94PjNLMROuzukoJVcvHpQBACIpOC3hzQZg
	pfTirYeAkyOOOfS8r8ur7Mq9oKPIL7MNKDHEFYcxt3IE7Za7owM3ErvX/Bn4TIOaoIQ2Ez82E7J
	Q4La6ZYi69CK6Ioiwnj50Y9ZAnKpMjNq9urHOvohJjXPtXH5l3Q5fYvQe+/zwRut4wFCPl6bGTT
	QUO78ee1hp6hhPdhFsj/rLB4h1kuMtETrEjjegLkCXiyaqFKeSynFQr0mEucSvAu+MtsCGSJ4b6
	Hs4cG8xTMpPug8bVYyzxCPtiaBOyEZn2N2Y=
X-Google-Smtp-Source: AGHT+IEVKeBh2X8nn5edN2JNYH0ip6RRsXlkactmrlxMJ24ltADBqpxEPIq5x0ftvH+xeOzwVb5LwOMRmctLYx+ASlY=
X-Received: by 2002:a17:903:18d:b0:269:b2ff:5c0e with SMTP id
 d9443c01a7336-2948ba5aac4mr144470455ad.46.1761559225678; Mon, 27 Oct 2025
 03:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-5-laurentiumihalcea111@gmail.com> <aPJWUDXmGkb8QGMz@lizhi-Precision-Tower-5810>
In-Reply-To: <aPJWUDXmGkb8QGMz@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:02:50 +0200
X-Gm-Features: AWmQ_bnztc34-LVMElYU3hA5bxPnJsvEFVV1IWI00q3s-IiPzNkbThRFF6roaYA
Message-ID: <CAEnQRZBFCi9GPaAw+NdKboADSpzPKGL-1B3WNh1M4Nuxd_9rqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] reset: imx8mp-audiomix: Drop unneeded macros
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_030027_503184_DB1955DA 
X-CRM114-Status: GOOD (  20.06  )
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

On Fri, Oct 17, 2025 at 5:47=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 17, 2025 at 04:20:21AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > The macros defining the mask values for the EARC, EARC PHY resets,
> > and the DSP RUN_STALL signal can be dropped as they are not and will
> > not be used anywhere else except to set the value of the "mask" field
> > from "struct imx8mp_reset_map". In this particular case, based on the
> > name of the "mask" field, you can already deduce what these values are
> > for, which is why defining macros for them doesn't offer any new
> > information, nor does it help with the code readability.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
>
> Register define still prefer use macro.
>
> So far const string, hexvalue prefer use value if only use once.

This is simple enough that we can use the BIT() macro directly to express
the masks.

As you said you can use the const value (including BIT()) when the value is=
 used
only once as it is this case.

So I think this patch is fine:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

