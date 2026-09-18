Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11B0C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=; b=Pdc1dl/Mg3TU0r7KSM7Uwuqzsx
	2OY0xvNdkG2pCdigKYahZw4pprQcxUob1WjTOIJJeHtr4SCiF4vkCI4r4wb/wVeeT0dFFRZ065kJs
	3/Ar5N2wagd4YH+HXLeSsYaCJjntrb3Ci2I643k0mzCAF6+B6L3jpN9kCN5FiPp1tSSwnGWCzZg7W
	sTsse552ta85aP1+heeupci7VcpPvagHt0YAD258OGBMJg2fbZ38j2uhPmfeEtVGRSDmuHlvttaoS
	TAXbK2NZytWjOh5Siue1JxgFKmjTlh2+P7JD0e43zDCqs/wROUybLtc6mKxiDx+FPfXl6Hr+wEQ6H
	eRd/7oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TJ8-0000000DjJ6-0X6N;
	Fri, 18 Sep 2026 07:46:54 +0000
Received: from mail-vs2-f12.google.com ([74.125.227.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TJ4-0000000DjIU-3EAr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:46:52 +0000
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059faso121797e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717608; x=1790322408;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=;
        b=oYgM9ZhmHwsFYXfMYdXVvvgsNDrZJJOoqtyZMQwjYL82i3CJvK8e8xoCTn5U5hYYna
         Gmv+J8suxjluRhEIpckDIdJHV3iSPvVi3EWYLOJngR2SdkU1VBro9Qq3jrLVf/fWfB+7
         v7KArAxgTFJOMZJN+5ogfGCcoOOqnXi1OUn/+a8LTphHaK5QCZMZE1Se7eA+//g73dVG
         78oEEnPS/60adokT0qZgWYlVtEh+RErT+eRW50IcADS8dMvu4Ijf8a5LVBssHdk4Wivi
         z+HhVjuav0sJiwBGLAMuH5yp3GOoeJv4PJPEQNGPB2RZ89cff5EWkVeRKnXgSDWUu9CY
         75tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrMiYQNnIxHu5mmMbFk40B7NVwfZhR9VGyFM2BaegOFmLBIm7AAyuEjCvZOraVmkFhEcpyw9JAUya25YVdFUvV@lists.infradead.org
X-Gm-Message-State: AFuF++lRD7R4lLQepXUoUf/3uhtYg5O3hsQ5Bzrn/0aEUtNkqtqL2R1K
	tT1pNDmuEI9MFbMm2zbwICpyUsnsrGG4FQVrkdbf7PbcMn8cwtuh+5Ptb6w+5E66
X-Gm-Gg: AYBFou1zNAI06QVDoSW0HIELiNpIe4v5lzhLIG4dhAa/gvgh7H8xwC0DtPCTUOg29P6
	QCU/WvUi1l6zbgufuhp9vOvQcmMie1dBDWsV26MpJi1l1CEOnnmg+51eFIJMvIn3FlyfIYBI/N7
	LEHBoCFjzjgqf9V9Kn9DbwuEXKalMVq8eRgliSDKnbBo/KSeb5kl0F4pQQg3cZvFw3mOj9wxGBR
	CVFFnJcBMKzqnES6CT6KrHFSvar3UfcsJ1zcmlajUk5eplDCIbTTG51qJ+UZa7Frndxser1Tk3m
	HbmJ7op7WSZvKCgFb5bKqDOdIFnkk0YMlWh6bn7dYfLjlJ1cqqZBnpDz5KvVsiYIJ+0JA1Uk+fW
	+3GIqZTxIbKNPqanVwqtWa2yO904qmJqp5sy7MG/559QcwFH9wlrtCP+QPkOu0sWrteAK7CAJwZ
	3Qqf76AEXP7W3UwRal3PTc5w7JJPOkx/fgOmIWB6l2vEcYC6U0nH/1nPa4lnEhfKG5qtmROWp8h
	PTQLYX6BDL8WaC+BQMjbnXjwJP8tP5sQd+k
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id ada2fe7eead31-7a55af2df71mr547996137.4.1789717607685;
        Fri, 18 Sep 2026 00:46:47 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98337e2f440sm895655241.10.2026.09.18.00.46.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78a53fe85easo152474137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVpKhwXHRd24mOOpduTJs+GsvRojoZDTeDsOVfmTkrzjbt5zPwNJaec2e5x06GtuIHu1kYZK1LpAVgz9iwMhwF@lists.infradead.org
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id
 ada2fe7eead31-7a55af2df71mr547985137.4.1789717606396; Fri, 18 Sep 2026
 00:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <1d5c56c80291e447208ac8777aaf90ad6f0a4f4d.1788338320.git.geert+renesas@glider.be>
 <20260917221647.GA4038349-robh@kernel.org>
In-Reply-To: <20260917221647.GA4038349-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
X-Gm-Features: AcwNN1XFZho-l6FTtqXfFYSmbjO5DpuymjytNtvp4sOSdCdr5EidSrnlACqjwyk
Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] of: property: fw_devlink: Add support for renesas,scmi-firmware
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_004650_818954_98245252 
X-CRM114-Status: GOOD (  29.85  )
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

Hi Rob,

On Fri, 18 Sept 2026 at 00:16, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:20PM +0200, Geert Uytterhoeven wrote:
> > Let fw_devlink create device links between consumers and suppliers of
> > SCMI firmware on Renesas platforms, and enforce these dependencies.
> >
> > This prevents probing of drivers before the firmware they depend on
> > becomes available, thus avoiding unneeded probe deferrals.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - s/firmware/renesas,scmi-firmware/,

> > +++ b/drivers/of/property.c
> > @@ -1417,6 +1417,7 @@ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
> >  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SIMPLE_PROP(renesas_scmi_firmware, "renesas,scmi-firmware", NULL)
> >
> >  static struct device_node *parse_pinctrl_n(struct device_node *np,
> >                                          const char *prop_name, int index)
> > @@ -1574,6 +1575,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_regulators, },
> >       { .parse_prop = parse_gpio, },
> >       { .parse_prop = parse_gpios, },
> > +     { .parse_prop = parse_renesas_scmi_firmware, },
>
> This is going to be a catch-22, we can't have vendor specific properties
> here. If we need this, we need to come up with a distributed way to
> declare them. Linker section tricks is one way. Maybe something in the
> driver struct would work?

Quoting myself:
"I still think the vendor prefix should be dropped, or replaced by "arm".

> Can you just avoid a property altogether? Why can't you check for the
> presence of SCMI at runtime?

A system can have multiple SCMI providers, so
of_find_compatible_node(..., "arm,scmi") is not sufficient to find
the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

