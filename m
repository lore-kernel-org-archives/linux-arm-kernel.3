Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8905FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=; b=oUH3owA51frvF5FE+Qnjwg+GNQ
	p4G5y1UBWhxs1JjdJJHm4ke2bOU7xtPuu+s/soml4d6h0ahma7CVqq/DOJhLeF3w/ZjDfq0xXVK16
	NVqXGGYQaSkGcVuPU6yy5SshsP7lVxh4t++er9IQNOi+SpjZ4Eh+J+eQpwt2r3rS4e1+aUTRYug1O
	nWyr+cjCATZ1LDrYTruGNufJKtCeX/NyVk9h1No+FbX5bmBEWHcD5B32uOIU1haGyzgeRoPkLi+uR
	EMmNS7cuPEpO6TpqkxNOJj+mqBnikqRlZ5aZJ075lnk7MCBlbZWO20XSezgjHJ6Og8FrwYekP0u9r
	ROFekjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0K2O-00000008rNu-0qNK;
	Thu, 03 Apr 2025 12:51:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0K0a-00000008rE5-31KO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:49:25 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30384072398so658205a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743684563; x=1744289363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=;
        b=MqrJINNbYfJ52nYzjtms/yM9OyfaVvHwLFZ+Jz+0Gd+ZW89szgiF8Ci58LUmhC8bkW
         GWND5/VCnz/QFph1C1Ap9jNvrEbJbTa52UKLDN1lyaAbs+CNJiIwW59CQp0yqL4h3Dkp
         Sa1zAraLfBm0HNRwMavH7M7FPUjbRVEc68NDsH+MWmjE2g91Fpmfcf+zCQxyNQDif+1k
         vnaidn3daOa/Lw76Nf6dzzpEJQXIrwXotW0N1zgVFOV9wsJoKBVMR1QnyqiQfqTwJ5qZ
         /k8VydwhaBRuNKufkIEgmBPNagPzNQZAxTjpD1D8k58Qhs/Sg3Y95vJGW/1qb7Fo0YW4
         W5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684563; x=1744289363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=;
        b=wX1R3kWrWaA2EfukOK/FEuzguOomlkxEk8Bf0dU6bT1E3ezwYAsnRa0IuFsQPG+68r
         8klc6NG8JqfqZeHCv4LbukRqZRSZngOfjf+ih+qPzYNCSZX2gzSOQbtDuungzLzfvHVy
         gk/DE0MS24W4t8/ftkwZWWYFjqiTp0MAbfylAZpNzkLUJHsigGGTrjXepU+Ry+NjuyLn
         PzDb0+9h/2jxcqGlAohBwRPhh4e51cMIkXD92lwORJ6Jq7LoGvDQdNtCnGd/SGAucXF3
         rUTnPJJ02g0DxUfBv06YIkToYNO6a7NS4YxyY//w6Nx9P0DxikhSGlIJdPpjXhOAb4Rz
         HNqg==
X-Forwarded-Encrypted: i=1; AJvYcCWa9gRx4Irn5QVVfUyp3KTJRJfvyDPeCbtb2XoDXZbGzSaEhdSRnk//KKjDUQ2HUQqEdRgL4qQewHJg8ej0o5+N@lists.infradead.org
X-Gm-Message-State: AOJu0YxhbCcZVQ+L/pOAxZ6DuEMo3VOVcagkRYVg7SMf2N1jTayMh0Tw
	bZujauqq3m07RsJ+5tXpr9IY5q1VpAyfjOeC5qdsbKLvuMjAtvgxuHjSzDAJ/c68NhwXYLKJYSM
	hOL6PFrVgawzFPB0877n9qNevpxw=
X-Gm-Gg: ASbGnct5A3V9+fNNTXFHZHKpTHZfe5jhlkPVtp5SrYc8oTCnTp+CZcnq83oPn7gJhzR
	1l4DTkkfo4IjpnmPRgLZIg66laygeD/e8Wa4CSvYOch7mcxgsE+yZoW2w3GcluTk3jv5Gz/BPO6
	QpU1G9zkmLBER3d4XHxsO6ROI=
X-Google-Smtp-Source: AGHT+IFYW9MnslIX+WD/W4yqFkahfmkMt3j4de0kYP5osy79qxqlNhQHimSlJ+WSDyjW98VqmFgbjK1vYEjgozBE86s=
X-Received: by 2002:a17:90b:2644:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-3056ee3148fmr8807692a91.10.1743684563426; Thu, 03 Apr 2025
 05:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-3-9f898838a864@gocontroll.com> <f75fb67a-91ac-4e3d-8ce7-5e0c6c2bb2cb@kernel.org>
In-Reply-To: <f75fb67a-91ac-4e3d-8ce7-5e0c6c2bb2cb@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 3 Apr 2025 15:50:47 +0300
X-Gm-Features: AQ5f1JpOn26KtD3CJ794gf42_16EcVqDVeshPu-zxnT2qzP-_yIum74GI60JHY4
Message-ID: <CAEnQRZC9Exfb5FL+gpMuwU6jLP8vO9hjrxm1+OHQBeLy0J1Wsg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_054924_772388_89DDF850 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, Apr 3, 2025 at 10:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 02/04/2025 09:07, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> > module bindings.
> >
> > This support is not officially done by Ka-Ro electronics, if they at
> > some point will supporting mainline, this should be changed to them.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 322ee00547f6e494a96d2495092f72148da22bd0..4b3864a9852f9fca2be4898=
7d383c0671e668336 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12752,6 +12752,13 @@ S:   Maintained
> >  F:   Documentation/hwmon/k8temp.rst
> >  F:   drivers/hwmon/k8temp.c
> >
> > +KA-RO TX8P COM MODULE
> > +M:   Maud Spierings <maudspierings@gocontroll.com>
> > +L:   devicetree@vger.kernel.org
>
> Drop
>
> > +L:   imx@lists.linux.dev
>
> I would say this as well, but not my subsystem to worry.

We don't actually mind to gather all i.MX based boards development on
this mailinglist.

