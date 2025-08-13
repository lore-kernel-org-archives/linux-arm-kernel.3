Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB54CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=; b=4xLwSdEgkQ+7YSsGdXmHKHWcsX
	kCK+4VAc5r7/oOA3AfmyXr7rlNTY9xpIgI/6c0UIlRk6VJQvtOyp5lIb3uo4xxPM1uIOPaWxbX39C
	P0tGvvH1ax71gnnJrQC5YJNoOP2ZjoeQx9oL8WYvyh4PHICyW9xs2VJW9Xb74iACAeEd7keaWrSKb
	xP7AkcJOWc/bjGYU+oAM1qf5I6s+aFDb/ybH0SuFq91WCq1S28tzU1mJJheZSl1b4nzx7RT67mEQf
	BVJlrZuCQZyusNCXr4xJtROYh58xgfy/7WFuQSZ4MF9B9FQZcssxrJlfIupay+VpaHoQkHM02EQT9
	EMPZym1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrK-0000000EebC-09Fb;
	Wed, 13 Aug 2025 18:05:58 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEnD-0000000EUPB-2Hgo;
	Wed, 13 Aug 2025 16:57:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb73394b4so11705166b.0;
        Wed, 13 Aug 2025 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104258; x=1755709058; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=;
        b=H2A/hCvJ3Tqud8QwFDpzFzQA5SyAOCl7A8ob/iCZggqVLZdXu7gOnjoYSXzbZnM8dI
         j4QWQBZlz+1n5+N6+BeEfoKVHg5EMIeFlet3Nf9pyoWz5aVm88QXM05Rxj64QFJwW4Mf
         QhoYZkFKYWAeHcrCU5pubK+zrOFw6Ry7cF684UV0EVkBc6vKeMXiJI4VGD+jorui7JhY
         ZyK75EGmmCnwXka2oEtmCF8O8PYMcj1DpSGSlDKmG1Ni09lzBHhdT49fbO1JnEmD1SY2
         hVK8tQMrisY7u14iPEjcdrih2+OUXQ6Igw7LhDB6aOsxAO/Unz/n8PFk6uZgkbjbut4T
         3l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104258; x=1755709058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=;
        b=CTJRiGSVxyuPPq+OGI5aiJaUDSAO1DxupbtanrpMhcuxVY/2HVpwLmIh0/6eG4z46q
         +LKzlseQCDRueKLH7+TB3RMMUGX1Rk4Xz/QNcfD25Llnll+lLwYSHevk1FQklGbPpfwn
         UkHOSn8xm7pfgq7lE8D5Bz4sSdIIf+DLM7WbeYDDk2l7fx6spWhpn8f0Tz60FXY18ON+
         DYxQ5cAjLxf7BRCic6cL4VzW6So7/fkpFeXmSGe/6p96I5dDg/kLH9PeIyVZS4+Kn0mq
         huPT76QxTjR5GtSrOD4XHDAYzNKflZWtvaLka6z7492VDTXKbl2k5ktaxlfkEAag14i9
         IpDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQNpz9txENDFvbnnv7ozpACrv6mOlcQFsjvzUZKH6+sI8UQxO409J/g9kfgBLbJIZZu4DhBXd2KPVd4UuhkvU=@lists.infradead.org, AJvYcCXxj0dKGm7lChNxDk9zGSZmT21pe0El6yMqjoMcWUVZQs+iWx752b4EZObzCw3jjuxG11pIoBdy/kCfewEq0zo9@lists.infradead.org
X-Gm-Message-State: AOJu0YylDKqUujS0k3w2lx0kGSkXQlZbLQoqNJ/CL/gKP+kgA2hnk1pi
	gd9aDn83d+DGyPDk1ke9nxxBfngCpVDZW48t/Yh616JwhlSQcz/gEPfmqbdQQyR3bQ12TvVLPP1
	EK+c9Nmklx4Wta95sBp/o0kP0EZOFNkQ=
X-Gm-Gg: ASbGncvAi/ELRB9hOjF/axF/f6meh4ShMXOLhccvbU7cgkUegKHb9lpvCTbFanwfhlP
	lQx0coPqMRppCWYfCeWlL6FPyr4hVBQLISq2+vvwmrxU+v+G4jU5u9HMnQK3MxDVOtbUeixHBKB
	KxqmZ6wlNQH4v0fbsmo7AvN0sCbuGB5Ms6ZtQ6DPNfrxnt8ItbxhXH0ExX5SGziGuWDbUDPckvJ
	AzS6tZI8g==
X-Google-Smtp-Source: AGHT+IHbk44OEj1r3kasIcTcyEDngMuhrBuyXGAMgY2npDrtdlj0x5dJHeL/vjl9xwrgnQvrGKpG6wybKFGCryjWMzw=
X-Received: by 2002:a17:907:3f0b:b0:af9:116c:61c4 with SMTP id
 a640c23a62f3a-afca4e44cd7mr358157166b.48.1755104257569; Wed, 13 Aug 2025
 09:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Aug 2025 18:57:00 +0200
X-Gm-Features: Ac12FXzRwEdbOG7WcfkJrIX52h7RVyVAx5HnOB8PpoXFNYyQXL2enxp09SWUXag
Message-ID: <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_095739_586894_F72A693F 
X-CRM114-Status: GOOD (  13.48  )
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

On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data pointer.
> We're also working towards reducing the usage of struct function_desc in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.

...

>  #define PINCTRL_FUNC_DESC(id)                                          \
>         {                                                               \
>                 .desc =3D {                                              =
 \
> -                       .func =3D {                                      =
 \
> -                               .name =3D #id,                           =
 \
> -                               .groups =3D id##_groups,                 =
 \
> -                               .ngroups =3D ARRAY_SIZE(id##_groups),    =
 \
> -                       }                                               \
> +                       .name =3D #id,                                   =
 \
> +                       .groups =3D id##_groups,                         =
 \
> +                       .ngroups =3D ARRAY_SIZE(id##_groups),            =
 \

Can this use PINCTRL_PINFUNCITON() ?

>                 },                                                      \
>                 .groups =3D id##_func_group,                             =
 \
>                 .group_size =3D ARRAY_SIZE(id##_func_group),             =
 \

>  };

--=20
With Best Regards,
Andy Shevchenko

