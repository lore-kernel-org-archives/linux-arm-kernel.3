Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C812DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlQ0Imi4TI1g2HJ/WhDlE3//wGfnD+n5Npq7eYW5xxc=; b=EWlSGYr+VCd6bmxAMW+y1L0esZ
	qe/yk75aCSwefLjXjL6G9T2NFX6bBrXhlV7XPPKaw6slRRFVcHtwFg8e9B4aX1NkVcJaNjCglN+ZM
	5pGz5Q0brWu7H1VGT1OwmrTFz4X3qy+/W6cZBCAcoaVDA81I/t54rzueJn/WZvnvZP3ry+75TU/5J
	ld5iuLS3qn2a2d5RINdQhtyhDhjHiI9tSbMBIVwwcGD2aI2fIOCe0rPYUZdRg234zwmXVInSxNksZ
	g4mH9L5CrhcsEbIetjLRcoxng6saifGXQiyQaiQ9qedDRs+AyjXqb/5Gw6xIvu9tSNIKCBQ2HFZyK
	OP+v3SQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcS1U-00000002mzr-3IL6;
	Mon, 27 Jan 2025 16:31:40 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcS0B-00000002miy-0svE;
	Mon, 27 Jan 2025 16:30:20 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-518a861612eso3153560e0c.1;
        Mon, 27 Jan 2025 08:30:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995417; x=1738600217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlQ0Imi4TI1g2HJ/WhDlE3//wGfnD+n5Npq7eYW5xxc=;
        b=Pa8jtr1Yhiq849fYAFm9hZ87+z0zVCm3H8LXRw5qOox2zKihUaNxMdA7v+lqW0PYoj
         u9Nw8WeLHL2SFublBAqPftxDTWVYolBSPvi4TKOL58yuz1mSn3fkH16yZ66v7faHKXwH
         pDMy3PX0g15Wmf1eksnpveBQjXbs7ZSXITlsYUmjC6mgSIGlD+L8rYEZn+y4Txd5uorQ
         7CXX6tbS9yxZnMgrKddz0HvlBpplkLcviyPPTKz9GQnIwObMP+njxycCwr17gYbGmU3l
         D5Jtc+Aog8EamUVw2q+uKYLI2TYgGBh98WSzesXPJQjuwbMEypMxESCDHgSGjb/UlDGG
         PbTw==
X-Forwarded-Encrypted: i=1; AJvYcCUD40o1XfmYJPiE9ZgSMfdHbyawlWqs6Hobycg7XGyDb7z0llGUJdxJnKV3MzsCDjr3GgolXTH5F1YvLRLV864=@lists.infradead.org, AJvYcCXxG+K0aLpgp84pcnd1KzXtCXh0fr8KJpAXsYLkr/EP0w5DdXQ72BrfwEjdO/za4sxFmiKXTtlW8moDQprS0oIu@lists.infradead.org
X-Gm-Message-State: AOJu0YzYXjYTt57ZEk4egXgJ+fon3lIPt/6hfnHELs9PBPf+lghbFh24
	wxg5JPUM/2nUMs2VNDeWonQwkhP6pr6/F0IHLRnulAn/d3wD++MzMr2Hm6uakVA=
X-Gm-Gg: ASbGncte5kLVaCNwhBlaBjvb4jQYhSxl/UkUBhtaFL3o/jJ2D95UhCG6xBAzrQAj4k4
	XPC5VMEb+FZ22fSmFUOBFosWAz5LN6UlFoEzacC7ohK1ePqOziIKLbdq5RpaAi6QsG23MEQ8xEl
	sWjYpzZPmZ56RkK7+FKVYIbT9rPVLOzHiJ+dDQNRPo1D6O/5uioxvFnt72xv0my9bltIlp+eJr9
	18nd8Mw/76YE4cua6cMtLL7o/ElqG2NnDETc9w9Qc6PJX+j/Lo8BbyIZiExj9+y+Op85Q6hW5YP
	7oDGhDJSlBwedvW/shCiWsWl0LbP5gfBUSl/oFILhHE=
X-Google-Smtp-Source: AGHT+IE7TcI+wZeczxQQ7Ikiku10xmwCXdvnLayVtAW+2k/Jbg1rLXTlA4zfq56P4T71Do7cEm135Q==
X-Received: by 2002:a05:6122:2402:b0:51c:93a2:d809 with SMTP id 71dfb90a1353d-51e3de6de6bmr13973146e0c.5.1737995416960;
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebea379sm1458656e0c.42.2025.01.27.08.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-860f0e91121so3089183241.0;
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuQup78sfUfrXG8zMFxr9mEulwkLPRwH5aG77MPT2wuLuaZ+Hb1kmlGfQJQv9U9Ot0uU+ebTzjlrgydy2zElE=@lists.infradead.org, AJvYcCWg7MgdXvqtn2GwRzJdT4zLw/2Z17BVwIDEZuZNIrGl3MDRVJGINbbRtoPTRKUbJ4GGh+TT0jO4F7nX6aGzCbG0@lists.infradead.org
X-Received: by 2002:a05:6122:2028:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-51e4fb68a06mr12748400e0c.2.1737995415897; Mon, 27 Jan 2025
 08:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 17:30:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7GwMNm5tYvWugehstM07W9JkLdKrE9hwPhxcEab8ajA@mail.gmail.com>
X-Gm-Features: AWEUYZmGy-5V1Zbo64bUIwl2HUW8rq3_GydwTJUAoMljjyEePEDEnt0EQDD7GTM
Message-ID: <CAMuHMdV7GwMNm5tYvWugehstM07W9JkLdKrE9hwPhxcEab8ajA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] AHCI power management cleanup
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_083019_255875_EDAB1852 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Raphael,

On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> w=
rote:
> Several AHCI drivers expose suspend/resume functions in a way that can
> be simplified.  Using pre-processor operation can lead to errors, while
> relying on automatic kernel configuration is safer.  It also shrinks the
> kernel size when CONFIG_PM_SLEEP is not used[1].

m68k/allyesconfig:

drivers/ata/sata_highbank.c: In function =E2=80=98ahci_highbank_suspend=E2=
=80=99:
drivers/ata/sata_highbank.c:590:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98ata_sas_=
port_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_highbank.c: In function =E2=80=98ahci_highbank_resume=E2=
=80=99:
drivers/ata/sata_highbank.c:607:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98ahci_port=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_arasan_cf.c: In function =E2=80=98arasan_cf_suspend=E2=80=
=99:
drivers/ata/pata_arasan_cf.c:938:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98ata_sas_=
port_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_arasan_cf.c: In function =E2=80=98arasan_cf_resume=E2=80=
=99:
drivers/ata/pata_arasan_cf.c:948:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_link=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_suspend=E2=80=99:
drivers/ata/sata_rcar.c:936:9: error: implicit declaration of function
=E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98sata_rcar_suspend=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_resume=E2=80=99:
drivers/ata/sata_rcar.c:973:9: error: implicit declaration of function
=E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_rcar_resume=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_imx.c: In function =E2=80=98pata_imx_suspend=E2=80=99:
drivers/ata/pata_imx.c:209:9: error: implicit declaration of function
=E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98pata_imx_suspend=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_imx.c: In function =E2=80=98pata_imx_resume=E2=80=99:
drivers/ata/pata_imx.c:232:9: error: implicit declaration of function
=E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98pata_imx_resume=E2=
=80=99?
[-Werror=3Dimplicit-function-declaration]

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

