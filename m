Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBA0C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bCHCGcohcJ2Z8gKyh3s4OeACkb8tG/8ddHOZfIjF3E=; b=GHA1+lwVH5T374iMUkv//fqsYN
	G4II8Qjz34WqZ+uCuSm7YfTK24wxVMdZ7MdCOWmSShqHjsElQqfgzC28lUFRyNV1OspLepS506tZi
	pldJqzMUjniqqspztkR+XSFOuxgCSkGr5PCyj/dL7NyRo9MnAVow1EMMZhr9EdK9+DsIGJaCaiVng
	mhwcUkh1oT702hAytn3o0FwSe3nC/XAzvThOXLKZurrxoQWapbOa1lxS3efD1k3CXnMtEeHYSP3OY
	YtgoIpFNQcXDcseAs8PMLMMRsgltAffWh2G2SCKKf6MCoPMtDIHxCAyQN/rBKvrY9iWjakIpPqkRC
	+2NSgoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBlU-000000006lm-0t5K;
	Fri, 13 Jun 2025 21:16:44 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBjJ-000000006ap-143K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:14:30 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4c4fa0bfca2so757455137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749849267; x=1750454067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bCHCGcohcJ2Z8gKyh3s4OeACkb8tG/8ddHOZfIjF3E=;
        b=Dy6E3xULaVECXSf2w1pdctXYP6EyPfnZ7of3JKLdpcahFgynwL57Qd1AUeljsA+BOL
         G0t5d4giuI/biMnQRf//Oom8GVY3809fDWF9Y7IpROcWK2yJbNT8pJ4feqLXxZ5Tdvbl
         8KFrUdBOpG0podfEt4+Rz2B/2YZwHpQYyVXNX/OmjNhqbtmw5y7SMyGyILLZcIXt9u4J
         Q4CFNOFZoKwGZi6yM6klWIfN39A3CHON2Bu015nAfIMmHLP5A+PL6DDIsCJCZ9kh9sRt
         JnLM43pYTGstvCXLuznuCo4oV2BL2N9I8uh87gU48SCNY863JKN+FyHXRj5s+/0kdWTL
         Oe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749849267; x=1750454067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bCHCGcohcJ2Z8gKyh3s4OeACkb8tG/8ddHOZfIjF3E=;
        b=XeYAPWjupVQdy/mujk3kaPUYhJSkvr0qS7v+avMFT6PpQGL7OFFC+BHYku1lz9A0DO
         FQHXoNj/5yMwP4efgkMQ3dd5n2SgKyypd5jl/SnH6AxOyw7uDn621Mi7WYJLqy9+N7C0
         ieeGyA/+9c5PbDPZA+dth/a3XLYml+m/VSt78pCBup3277XAtvfkS6XZRdX/RdCk7U3L
         sDN3x3f9yzVBC0vfjn70/GI4AP72SRBgh7bLM9ygd6+0wcAF27xTwlXKnamWAXuJqW55
         h6YZ/b9H7FrvDsZ7UAQh1zakn/nhCeTA4dsAD5CBVI51/jGQspQz9WBJu1d6RnRtPXf+
         P+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGDxoUgpX6iq2VkOxzqweeHDFB2j5T2oYl09XMZILqW5UnLaIV3HjWfN8n+B5QB8slPaESgWzi0HXUsZc52Qzq@lists.infradead.org
X-Gm-Message-State: AOJu0YydZ0kKivf9TGxDsVKBzETykz2BwpPNjvFW3poL5M4R4Q+gYjj5
	NyGD10pR6cKWmbKm9oo6bQ4LxCL0+krUH6yfaANOcWsHmurjSjGBrJiE8FjjMmO3WLJnAwChddm
	ttc7SErWIm9fWUjdxk9JN1zLLcv1SazMwz0lr7lai
X-Gm-Gg: ASbGncspjF6jnaA6YMK0JBVVsy4vvcFuB7sJXRmHQXq6Fvt/JaRNGauEGT7o+4eraAt
	Of1qvJWIvZmFSn+efrPFCL2bf6Je7ZLkEMU7mW7LNKKhlXWzuMjRGeNsMT5e/P9ZLzUcvSSO9pz
	fluoynrmB1ld+uVbuNyxBQV7k4HGO4F0U7E4BpNooaVw==
X-Google-Smtp-Source: AGHT+IFDKOFSYaUuF6G7K6OfIsfpObQ96cqfG2SkXcaTm8DQdC0kgY8LOqBWYZw9a+dWxydmoDEXMMYsxWer9ReGFRQ=
X-Received: by 2002:a05:6102:26c2:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e7f61c6ecfmr1328879137.16.1749849267109; Fri, 13 Jun 2025
 14:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com> <20250613134817.681832-7-herve.codina@bootlin.com>
In-Reply-To: <20250613134817.681832-7-herve.codina@bootlin.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 13 Jun 2025 14:13:49 -0700
X-Gm-Features: AX0GCFvxcUcb0pxRJ6zcIBbIU8xYBQJLfYNKarcjHKuyfWeI8fRbEayRS0Ht4OY
Message-ID: <CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/28] driver core: fw_devlink: Introduce fw_devlink_set_device()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_141429_292954_A91F7744 
X-CRM114-Status: GOOD (  19.61  )
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

On Fri, Jun 13, 2025 at 6:49=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Setting fwnode->dev is specific to fw_devlink.
>
> In order to avoid having a direct 'fwnode->dev =3D dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.
>

This should not be set anywhere outside the driver core files. I'll
get to reviewing the series, but until then, NACK to this.

Is there a specific patch that explain why we need to set this outside
driver core?

-Saravana

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  include/linux/fwnode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
> index a921ca2fe940..a1345e274125 100644
> --- a/include/linux/fwnode.h
> +++ b/include/linux/fwnode.h
> @@ -231,4 +231,10 @@ void fw_devlink_purge_absent_suppliers(struct fwnode=
_handle *fwnode);
>  void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
>  bool fw_devlink_is_strict(void);
>
> +static inline void fw_devlink_set_device(struct fwnode_handle *fwnode,
> +                                        struct device *dev)
> +{
> +       fwnode->dev =3D dev;
> +}
> +
>  #endif
> --
> 2.49.0
>

