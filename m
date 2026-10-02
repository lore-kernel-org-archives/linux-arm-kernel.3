Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B63CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=; b=0aN4IHhEbbHUEByswaao5wETQ+
	nIuJCP7ePyqqeWc23giGwtLiqu+uRn97RymBnxy4RwqkHtgMXC69epuX21/9QkdxJcz8NfRVFaWYO
	wxP3UZJQ2jamIDBIdzDXmKgyDhyubg6y9j0rMpIPaH/b7bxtIhBmpqksTgMtyTAdPE7Rv7wvu6keI
	r5THgwgz349fKJBCLdlutuODRgeJPKJIlKYQ7oPbXVdcowLBnS5ypRg5QWBWRzVcVQt0zYWyRZ2Wf
	IB+OhDJpmL98o67udZfbECD9BrxMP6h9e9wG5Wc8VGivhXUHRCTcqf76lRvbrSkWrFRJwA/nNYiPg
	uIBwC/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCh3g-0000000C9lU-3eqf;
	Fri, 02 Oct 2026 17:28:32 +0000
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCh3d-0000000C9l1-4An9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:28:31 +0000
Received: by mail-yx2-x0c.google.com with SMTP id 00721157ae682-8ab445ac183so56651727b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790962109; cv=none;
        d=google.com; s=arc-20260327;
        b=LUkqIfTAki6ZQ8n2b1dOUazST73RTQVV8Oo2h98GL0+oJutoIdqXOI73GWitl/N1Ql
         q/JoXT9Al53hllmat7rd9q2f/jyk703xpG6ogpmfmPR8n3YbMbmi/h5/fyBP1+CD+uca
         gqMTwK7SnluYmUIoq/5BJJSWXDfMciog/zFq6aOP7VNdeumlMmG5ipCT4gCQFwOiYuAg
         /lsDFJgjgt07N/hF1LCV6GOF/VIT+dirlsh8mlQJUvuf1c/M7MA0NET65otHD0GPTwhl
         BHjLKlRBSJ4duDWMw4OJ8gAErdhkiMrfU+3VSrU1kw55OLTUuRk9VxDb54kYkVYCUQeo
         Qqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        fh=Sdc0c1jY//P0S9SN8P/yjJAiNLkbc23sUiXbU8729xM=;
        b=sECsTC27/PNxIQipTfn5jtdKVuRy1qATpeOH5JPusAHuvze6wD1a5b2PBoBNsomGeN
         pJEna4OHVMdVi3qytHEE/yF/huLuSS879KxV0E/+8Q1HjrR1AmPnijuVLhWsC/WeL7B/
         X5hKIZ43X4Ok7MjlcLbsFG6ETkZCqg6QKbXf5080BHDCzZY41DBQ3wnKdFzioft596MY
         A/qIHoURrpQ3oGiomvhezhb4xLiWkhQfjdJAxXNj3fu3DhH+dPj6sVB2qVaEEVPGsrs6
         AYxrxC1dAwRg5PCuzIGAudDlXyg59OdELmuqhjAVJ2gWDQnEcEcn8Gd+GWzMsdfdqvUy
         7uZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790962109; x=1791566909; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        b=IthXBI2K7fxCHkHa07fsUjG4dNUqo10sCt78O4Y4Qj51UVBOjLozeAGtBLVkx7+1ph
         hS5WYrTO7B+sXQ1n4ymWiDpJ47XbJMOZi/4QpGZYCx97GoCnm7RYv6c4dNQaY6dEfSgU
         qiTR2S+cvqLTHcAm6M2a2KC2E6sCc6XLsfa3b3XLKs4ikqp/QiKMRwRbCTm/ERk0DrDZ
         2SdKivYaiqReAMBhUseniYR6T+eCksShtCDPipcPB6b4KiC/0qysYFoCh5C6J5MVsWqE
         EdwVsqkHOpLXZFHW6YAVYFWEOahiJLIWDZ2dR4EftaELxI9TsKnaqmbaeP2RpIOd5mZy
         gfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790962109; x=1791566909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        b=opImMOqXl0tghb4mCASS9rZBtP4AeVnk8IAucJbWZJJ4+BZ1DDBLhhhXoDr4FAtt11
         Pq81po4QbnFnaj8py55Dk4Sg44S4kX1EBLaWefTEYH6gM16NHQSEurW0CuOTQyJTf2CS
         vYyjzckfpLD6DVSoR11PsY2EriY2fP8a2BppLkUXahCNjOXkeyGWNykxgjWkiT8gYnaR
         3CFowQ5BQspiODXhn0G5tws3LhjCJMGTgtuVVg6Q9YClTUvyG7tCOBBwnhNAb0LYPUvc
         1YmY8cmzmDyo9AzCqAEA6SrMUND4t4CfvQugK3C88/Ep6YFZuYENZ/6D379XbzvNonoA
         G8Hw==
X-Gm-Message-State: AFq9FYKAULGI/XvuOut4RIqXUjEmJQsv2Xq6N+LAs79U2tsQ/P12SGpw
	ItQQv0SNGZAGS6LwAW/Vp5Fj0LU73+GTSE2EDO3NoqWLh4ojgXRs0w/TIeA2OwBdWXJXxSYCf7J
	ovdLoLF31SIs4U16pnm+vMymvQiTA1+U=
X-Gm-Gg: AYBFou3Sx1JaQ/QH8FYQSeL4yqQKjSkg9Ip0txOEbAcu1w1zYqW5A0K4XOCOuXZhySx
	gg+6gKqX5gzTygw+ZJ4FgDJq4/OxeIddc6Be/91w1g6JBD6Jl8ioRN2+sLsyPimh0ZXBRw5lz7a
	9SKNo0ZIyGhaG3Yt+xb/+GpMK12xOVmeyd8GB8s5rA8+bcbCZKaWjbdFqDHMaEEnt+9zqBkbWU4
	yOlvqsF2JKQLDfpfXkvKPpzvDDlBnlJiCTKFPaPD7vvqdDI1IkV62uRZ7+Zy5B0fA3qyQNxu2KS
	hUJ26uNRn2KL5n5DIUQ/tY2GY9fagTpm8nVStfR5kPJGHBUlvMeZ5/dBog==
X-Received: by 2002:a05:690c:4191:b0:89a:63da:cbde with SMTP id
 00721157ae682-8ae39c24e90mr13846367b3.36.1790962108737; Fri, 02 Oct 2026
 10:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261002131634.113680-1-prasanth.padarthi10@gmail.com> <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
In-Reply-To: <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Fri, 2 Oct 2026 22:58:16 +0530
X-Gm-Features: AclHuK_-cjgeNcqjWWE-fRWp3-4f5pXhe0bXkxn9mUfCwvl8hZuFbXmIKRHKAIY
Message-ID: <CAMFFDGhCMr+9OV4ceo+SG=xrsoASB2AiFSUZwMJpyQou+eR-fg@mail.gmail.com>
Subject: Re: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_102830_066144_5AF63313 
X-CRM114-Status: GOOD (  37.14  )
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

Thanks for the clarification Tan.

For context, I sent this RFC to document the hardware-backed experiment and
request guidance on the correct kernel-facing implementation.

Using the current OpenBMC integration with the B650D4U hardware, the host
can be powered on through the standard D-Bus command, and the OpenBMC web
interface correctly reports the server power and host state. I validated th=
is
on the real board before sending the RFC.

The RFC was therefore intended to obtain feedback on whether this sequence
belongs in the kernel or should instead be expressed through the existing
GPIO and pinctrl configuration. I understand from your review that the
separate SCU passthrough driver is not appropriate, so I will investigate
the GPIO request and pinctrl configuration and withdraw this implementation=
.


On Fri, Oct 2, 2026 at 10:17=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 10/2/26 3:16 PM, Prasanth Kumar Padarthi wrote:
> > Add the AST2600 SCU passthrough selector support used by the
> > ASRock Rack B650D4U host power-control circuit. This RFC includes
> > the driver, Devicetree binding, and board node to discuss the final
> > kernel-facing interface.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> This is definitely not the way how to solve this. I've already said on
> linux-aspeed as well as off-the-list, requesting the GPIO lines is
> enough and enabling GPIOP passthrough here does not make any sense, as
> it would be disabled by pinctrl anyways.
> There's a whole implementation in userspace to solve this issue (at
> least if you use OpenBMC). The issue you're facing here is, from my
> point of view, a configuration error, and you'll not solve it with a
> kernel driver that literally just enables GPIOP passthrough...
>
> So my answer to this patch is:
> NACKed-by: Tan Siewert <tan.siewert@9elements.com>
>
> > ---
> >   .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
> >   .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
> >   drivers/soc/aspeed/Kconfig                    |   9 ++
> >   drivers/soc/aspeed/Makefile                   |   1 +
> >   drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 +++++++++++++++++=
+
> >   5 files changed, 148 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asroc=
k,b650d4u-power-passthrough.yaml
> >   create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c
> >
> > diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4=
u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asr=
ock,b650d4u-power-passthrough.yaml
> > new file mode 100644
> > index 000000000000..e6451d17955c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power=
-passthrough.yaml
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-pas=
sthrough.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASRock Rack B650D4U power passthrough
> > +
> > +maintainers:
> > +  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: asrock,b650d4u-power-passthrough
> > +
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +required:
> > +  - compatible
> > +  - aspeed,scu
> > +
> > +additionalProperties: false
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > index a4e384588a54..86291c250562 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -32,6 +32,11 @@ gfx_memory: framebuffer {
> >                       size =3D <0x01000000>;
> >               };
> >       };
> > +
> > +     host-power-passthrough {
> > +             compatible =3D "asrock,b650d4u-power-passthrough";
> > +             aspeed,scu =3D <&syscon>;
> > +     };
> >   };
> >
> >   &fmc {
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > index 11e4db998c06..1b0281e0bfb0 100644
> > --- a/drivers/soc/aspeed/Kconfig
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -58,6 +58,15 @@ config ASPEED_SBC
> >         Say yes to provide information about the secure boot controller=
 in
> >         debugfs.
> >
> > +config ASPEED_B650D4U_POWER
> > +     tristate "ASRock B650D4U host power passthrough"
> > +     select REGMAP
> > +     select MFD_SYSCON
> > +     default ARCH_ASPEED
> > +     help
> > +       Enable the AST2600 GPIO passthrough selector used by the
> > +       ASRock Rack B650D4U host power-control circuit. This selector r=
outes the host power pulse through the board's passthrough logic during pow=
er sequencing.
> > +
> >   config ASPEED_XDMA
> >       tristate "ASPEED XDMA Engine Driver"
> >       select REGMAP
> > diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> > index 5f61bb4cc36c..3e9618d1eafc 100644
> > --- a/drivers/soc/aspeed/Makefile
> > +++ b/drivers/soc/aspeed/Makefile
> > @@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)     +=3D aspeed-uart-=
routing.o
> >   obj-$(CONFIG_ASPEED_P2A_CTRL)               +=3D aspeed-p2a-ctrl.o
> >   obj-$(CONFIG_ASPEED_SOCINFO)                +=3D aspeed-socinfo.o
> >   obj-$(CONFIG_ASPEED_SBC)            +=3D aspeed-sbc.o
> > +obj-$(CONFIG_ASPEED_B650D4U_POWER)   +=3D aspeed-b650d4u-power.o
> >   obj-$(CONFIG_ASPEED_XDMA)           +=3D aspeed-xdma.o
> > diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/as=
peed/aspeed-b650d4u-power.c
> > new file mode 100644
> > index 000000000000..22a6925539dc
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/mutex.h>
> > +#include <linux/kstrtox.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/bits.h>
> > +
> > +#define ASPEED_SCU_PROTECTION        0x000
> > +#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
> > +#define ASPEED_SCU_GPIO_ACTION       0x51c
> > +#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
> > +#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
> > +
> > +static struct regmap *b650d4u_scu;
> > +static DEFINE_MUTEX(b650d4u_lock);
> > +
> > +static int b650d4u_set_passthrough(bool enable)
> > +{
> > +     int ret;
> > +
> > +     mutex_lock(&b650d4u_lock);
> > +
> > +     ret =3D regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
> > +                        ASPEED_SCU_UNLOCK_KEY);
> > +     if (ret) {
> > +             pr_err("B650D4U: SCU unlock failed: %d\n", ret);
> > +             goto out;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(b650d4u_scu,
> > +                              ASPEED_SCU_GPIO_PASSTHROUGH,
> > +                              ASPEED_B650D4U_POWER_MASK,
> > +                              enable ? ASPEED_B650D4U_POWER_MASK : 0);
> > +     if (ret) {
> > +             pr_err("B650D4U: passthrough update failed: %d\n", ret);
> > +             goto out;
> > +     }
> > +
> > +     if (!enable)
> > +             ret =3D regmap_write(b650d4u_scu,
> > +                                ASPEED_SCU_GPIO_ACTION, 0);
> > +
> > +out:
> > +     mutex_unlock(&b650d4u_lock);
> > +     return ret;
> > +}
> > +
> > +static ssize_t passthrough_store(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              const char *buf, size_t count)
> > +{
> > +     bool enable;
> > +     int ret;
> > +
> > +     ret =3D kstrtobool(buf, &enable);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D b650d4u_set_passthrough(enable);
> > +     return ret ? ret : count;
> > +}
> > +static DEVICE_ATTR_WO(passthrough);
> > +
> > +static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +
> > +     b650d4u_scu =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node=
,
> > +                                                   "aspeed,scu");
> > +     if (IS_ERR(b650d4u_scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
> > +                                  "failed to get AST2600 SCU regmap\n"=
);
> > +
> > +     ret =3D b650d4u_set_passthrough(true);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to enable power GPIO passthr=
ough\n");
> > +
> > +     ret =3D device_create_file(&pdev->dev, &dev_attr_passthrough);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to create passthrough contro=
l\n");
> > +
> > +     dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id aspeed_b650d4u_power_of_match[] =3D {
> > +     { .compatible =3D "asrock,b650d4u-power-passthrough" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
> > +
> > +static struct platform_driver aspeed_b650d4u_power_driver =3D {
> > +     .probe =3D aspeed_b650d4u_power_probe,
> > +     .driver =3D {
> > +             .name =3D "aspeed-b650d4u-power",
> > +             .of_match_table =3D aspeed_b650d4u_power_of_match,
> > +     },
> > +};
> > +module_platform_driver(aspeed_b650d4u_power_driver);
> > +
> > +MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
> > +MODULE_LICENSE("GPL");
>

