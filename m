Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDD4C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jWe3GpjiIlL1nZ3AwtNcM7ezIxInSVu38CWRYqmno4=; b=PXc4g4gWxg5/kJDjvs+hIi6ZIE
	zbCzBTHnCx1tfgtTu9/7pf+nz9PAvH7eBKqrw1+MDPDaBcb8ZFhjdo2LxKPHYg0uYaAJR8lCbQu8A
	HUVWwVH47GmPmywRFBxUhDtCZtLe9jYOTfmfb0sAvfnHVcj8+chOZkBoXAs4T0J+G7pi6EzQAkk7u
	u7IxQ7cm5sF972xeAYQDoC39HDCsnzWbO3PjJ5gIIa4+X+AjQbSaK64cxN2Q6mRtIfOMGt/GDmg+W
	PauAiWuTN3kY/ooYIrSAj4GF+czhl1CXHW2C0kWgnF5vqT/16dQ3Y+KL2eGIsJm1jDSAury2rvljy
	9EfpG3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5aI-000000054T6-0kA1;
	Tue, 08 Jul 2025 10:29:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5EV-0000000514r-2sGi;
	Tue, 08 Jul 2025 10:07:28 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so3780812a91.1;
        Tue, 08 Jul 2025 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969247; x=1752574047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jWe3GpjiIlL1nZ3AwtNcM7ezIxInSVu38CWRYqmno4=;
        b=bGXTyZutTss4dSP9adoPl6YWygQNOTGfIEgtLlssLOLdjcbQ5xpdcQ+sfvOM2H5WRR
         dBAWPeaP3jSXyRLfKAaJdUxHfsP3uCJ1qYXD2Zk+b5L4RucIhv2D512nXaugHXfvqsja
         cN7PJhBzoTbxXYZuMKr37ChHccdZ09sKFxvhejgkY6tLPZQu2t/8y6cUffulRY7IVKhy
         dZb5/58PF5SP6vsL93gTuzwVsqcyQu07ADTl9lVZcdvDNBVE/RC7F++JtLmgjiVZQIF+
         vOAwOeieqSS90AFTHa6lUefHXoDrsqvVYW7xfQj4zm0ExG6H0rZ8CuzyP+VXpXNuN1pY
         5e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969247; x=1752574047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jWe3GpjiIlL1nZ3AwtNcM7ezIxInSVu38CWRYqmno4=;
        b=IgbokNXG6Z7GYZcnrXdfUsbYALsCT6sQStYSgC2WMJIFqblpRdrZ7DTuT01C97PN3G
         WgRc0thHhkX1q/KZbhl/NyQPfsUvZdKd9blrWcIYXw4MRIxqsVrx3cfBbuSalQL2RSdf
         /o+7zXLFiKR9wiJK2cltNcZJ+vfkOqZIgxnkSmzqhRxUt5OYM3xI4w19tZp4vxi3yBRJ
         gb/ept2a/KMila89kp3InLDxE3bmS1FFJlFrphiG1hlNHZDKoWpSrTe7c8ZY2zc2WhEK
         VsjEK+Ep6zTQwCL0nxlFWQIy8ufapJV8EBYEnKaksClwoqkBV5zfoRTxkEGhY1SOa8XW
         WAyA==
X-Forwarded-Encrypted: i=1; AJvYcCVBvkuHBa5x13GIHH23Tya0wjU9XfKIDyRG+87Rc/SqFZYXrNSK+KU+4elkdVybk6L620Psg0cRmcbTXEV3WwU=@lists.infradead.org, AJvYcCVx7c/hiockc8Nh6xLpRSW7mXOLpvERhVLat6+mNeNqIgTK4/my8cFQSJ8WtwBoAbRgC00B6TiWy29RQSS460e2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg2AL2aNhNpGPS2lQ3pprI+SrxosL7r9GXAq2Tyh8rNXkvZ6Nx
	RNt4nsmIjdQi1pDToWg0xr4NpeJf4oVnbTOzLBJVH+zgob6XMUranRjIb8B6KakXoZJ0keTz0Fh
	bj49uhY/uia0TX4ERyGn2FkxVxAvi1YU=
X-Gm-Gg: ASbGnctgHNsVk3yiQs3kR/EB/PAvKr4PFcBWOgrZuOoxUXBM/zWYZB3HApV25vMAG8e
	8dIVDSaTIPrwkXyBX3vwp6k+0XNdwEn1lxsGOilU0WKu2r3vPzPdUzOmm3gKNGm2ywxabs1Ofou
	oFklLX/0Yu3i9Yk7E7NddAakgUtZsP6U7G4WUPQEoG
X-Google-Smtp-Source: AGHT+IH5HS9R8EC1RTg/jg9CUL8rPNysDY/yHGuHTdZ8sVLdLzbsBYnKiUpv0L2D/dSxXO5fZVs10JjXwdkV3ew9wGg=
X-Received: by 2002:a17:90b:3804:b0:311:f99e:7f4e with SMTP id
 98e67ed59e1d1-31c21db7b0fmr3713376a91.16.1751969246681; Tue, 08 Jul 2025
 03:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <20250706214111.45687-5-rosenp@gmail.com>
In-Reply-To: <20250706214111.45687-5-rosenp@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 8 Jul 2025 12:07:15 +0200
X-Gm-Features: Ac12FXw1xdIN9U8Q2cMOcX8lGU96JDJzneChS1fP6nA64__OBK_Dj4Vk5DpL6rc
Message-ID: <CAMhs-H9oqY+noxUyVWdH03bZmyime0G+y=hUXV=1Q3MByf4HsQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] wifi: rt2x00: soc: move and modernize probe
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	yangshiji66@qq.com, ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030727_723021_9F41C065 
X-CRM114-Status: UNSURE (   9.34  )
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

On Sun, Jul 6, 2025 at 11:42=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> By moving functions from rt2x00soc to rt2800soc, the driver benefits
> with potentially smaller compiled size. It also becomes much easier to
> remove a bunch of manual memory management and use devm.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../net/wireless/ralink/rt2x00/rt2800soc.c    |  67 +++++++++++-
>  .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 102 ------------------
>  2 files changed, 65 insertions(+), 104 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

