Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F58EC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=; b=AyR63HSofuBKU/Klo1t2qWalj4
	OsQt97H8HdzF0d8wwVEd2Pk+wlr5I4xSb6+XtEwdbTsvat5LoR2AlksmyWkp/J+fOUXTL3V6mtuRK
	4ND2imj6MrY3nmEBj+/CmiNiNxh8o5RyBm6KWPEgbax8JKxjlp0WeqG5+6SIffdBxNCzT9EDQxHkQ
	hrfuRiRQaXutk7KN7/vmmZnjpDltRbSqjQk8gkg1AOXw6ZPEPf/mRLuBxk4OnJwQ8PUFJgNut3AVr
	E9nvb+64Lpc0TUtuJXCHLkSLTVoHB+W5Up92IINn/Y9sDAgJ/24ZgyIuoiWKaXURoEqrYQrRM37cW
	mftCEmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrX4-0000000Dr5E-1fFm;
	Wed, 04 Jun 2025 17:04:06 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrUx-0000000DqhG-2gR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:01:56 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-70b4e497d96so961467b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749056514; x=1749661314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
        b=BA1DJvAmHPHYF37XGCUlndNTIdHFI2v5NecxOC4opKFlOnuEGgwjsQMzhoOC0n2zb6
         MIplgHbHjUA4vG9MGPVnEwOTcWBvgf6YCxWQeMznWLeGfdsTZ7PUVF7XWx/D4AUl1iOQ
         SI6Tvl6z2CMGZYYnr9XBoQ+yowdy1yGPWtDawufyxySv3PMed07w7zoVHv2vDcIWbHz2
         yhhWw2AvB14WY+aecYrD0zZt+0ta3h2iNYIFv18zHrVBXctJi3to+z+uTxLBSNJQ4sWH
         kpKqxaiM28cH8xukY1IGaezC7vZmtZlAtCDH7lwdjCRusu4x0T6J17grQ/P+nbje9NSf
         l2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056514; x=1749661314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4D7BKewdsk6/sKzjeJAuyPQOP5LvNsLtoRKwrLZjwc=;
        b=hYom/TmY2twWvUMj2k8qtReRZqVEdAGBb/Nce+j3GEfv+MLjlUJPrZRdbKZkR0wGkY
         mZU/ZpGFks/eBOuSWvTqvN2ol/xMmqOoDME0fhmE7B68UIuVJfuPnUYd0K4QlT7zmRWb
         RBx6QsZ1qiPbu8UBldfqwu0vtY6J0qywpjM83CZysOD8paH9SVgGvyW9rgEhTIz7tw3p
         TNp+wV+PrnQYCjpNkL4QnEzM5siDvCYA5LXA7ZBBtXFQrItBINZIaHNSr/6xL2C4qzIO
         y7sVKdublb4sBu9+3Dj8FWJgvJifgoXc2Y1of8DTYzlHOHx0LH53hkGJhr0yv809EnNw
         4UmA==
X-Forwarded-Encrypted: i=1; AJvYcCU4gFLAn2LA/gC07IzTXZuvl0chvw56OLOa1AR20au/JZP+ZiAM8sHPU35CsgINxJbGTl1i8EclzQkXt/8LzHZG@lists.infradead.org
X-Gm-Message-State: AOJu0YyxUCVsNLizBmZHAx6vfe8+PY/Ak2f02kGXdC6pXx3rJliwAADN
	L1tIIohusM2aBTU4SwgOq4IhRMsmnpx5W/eS1WV63zzbE3TR1NXw7jUeZBYcVpW8NlOMVEi/Xr/
	suZfSwZt8dJdB46LhPNugeF5itUoQ5Ljf0yysz5Y=
X-Gm-Gg: ASbGncvHbFu6OT/uKW4W/ygj7ZYueF7z4TBJ968P3K8hDZrrpCguEUttjNFToMUAogt
	zZBrVLPQybB/rSCclCz6sdUMWDkmvxN3X9Fn0soZbI5MVaHZRYX0U7J2spBFrU+BIzQJe3LRGWv
	azvuf+fFPnwWTq8jfK1pdlpaTJdiIkkHE=
X-Google-Smtp-Source: AGHT+IFIhKizpoGLqwiOSIUP8iiRAfmZbXmSeT9TIyueWI/d67XSMiKCYVWQ4BB4rdEMzKzneBplYge2hVU91ufFUJQ=
X-Received: by 2002:a05:690c:9a91:b0:70e:16a3:ce75 with SMTP id
 00721157ae682-710d96a0d66mr49320637b3.0.1749056514120; Wed, 04 Jun 2025
 10:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com> <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
In-Reply-To: <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 19:01:38 +0200
X-Gm-Features: AX0GCFsB5wB9ZHZCQ-2HQEOl8VOk15KDbCSQ2np75Eb_OgkyR8kGihI0TyVk6mw
Message-ID: <CAK+owojFg+A-_akaEO5wn=ghQpHBEvtc25bFp9qJX-vHh6SuHA@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_100155_679587_6BAB1472 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Fabio,

Good catch on both points, you're absolutely right.

I'll update the subject line to include "PATCH" and fix the incorrect refer=
ence
to the Murata chip (should have been ADIN1300BCPZ, of course).

Thanks again for the careful review!

Best Regards,

Stefano

Il giorno mer 4 giu 2025 alle ore 18:44 Fabio Estevam
<festevam@gmail.com> ha scritto:
>
> Hi Stefano,
>
> Nitpik: The subject line of your path should be:
>
> Subject: [PATCH v2] arm64: dts: ....
>
> and not only
>
> Subject: [v2] rm64: dts: ....
>
> On Wed, Jun 4, 2025 at 12:36=E2=80=AFPM Stefano Radaelli
> <stefano.radaelli21@gmail.com> wrote:
> >
> > Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> > Murata CYW43353 to the MaxLinear MXL86110, as documented in the
>
> Murata CYW43353 is a Wifi chip, not an Ethernet PHY.
>
> I think you meant:
>
> "from the ADIN1300BCPZ to the MaxLinear MXL86110"

