Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9541EC36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 21:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqFv7p5NcVMXzdeHBPjYikjLO1JUbU/VCURUs/xfOEs=; b=oOlFAuJ0GxkDhY3s99HUSbbY25
	YW5XWKov0++djiZ+1G7k1po2GqhLUjc2lBuwUVUb4gGMf0E7p714mVoeXl/t1loTY4OropkMfVFHt
	XcbvsnUYWwkX0qQoCtpX69ceAUblojMIClX8ScsyLRSJz6UZMiQpa4AZvica3BMrHaLzIqek00DbH
	2Zj8Nz1oJEMBJOd860nHHciPZ/bwWhyoadLBeJurp+yOIMYmDwclGZoIHD4gYY4ABRSkjO/70ygpc
	W917DudqzyXVECunFz2cZsmfwp7AXfpkDbIZfP5Boz27A4oE9PkQ3cztXKcVsnoGYLx/xzYiFwVSu
	82w+m5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMb8-00000001PCa-1PmM;
	Mon, 31 Mar 2025 21:23:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzMZN-00000001Oxr-2eGs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 21:21:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so7843329a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1743456081; x=1744060881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqFv7p5NcVMXzdeHBPjYikjLO1JUbU/VCURUs/xfOEs=;
        b=ZxMha13qu7vfqD1uPJ3YAzR7VszeB8BnX7L+87BJGL3zO6Ua9+0WlGPPh1S5fkFKjC
         AoA8/QJC9Pqe87c51lMzbiqDcKG38q5uDjac8EAHQyO2VuEPZCCV6SAcg1LsN+TeqJsF
         ssfsNnI4Zg5bZc3nm0HC97By+rUNzWkRhx+qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743456081; x=1744060881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqFv7p5NcVMXzdeHBPjYikjLO1JUbU/VCURUs/xfOEs=;
        b=METdjiEAk4xj495+G1z/01krPfTYIZwuxXfUxTjT9DEsAYDdztaFJmBJtGjwRMwY/F
         u21Zc5MxQZrA8RiMkUGtG35UP88AqX3NO3iqIvQeCaoyrtfoO3Csx5wyTZTq8pNZZEV4
         Ofw1EPdDNPYSVBN+ifJ+Jw3pkYOQgZ/uDbIGeXtA3KZU26GsDU9Zm7YfcPQxxGSS9VJr
         af7zlZqKuN/ii9QdS2XIdtEG5rlrICjY4M2EPidm/iRCg205DwE9V22JEwlFfes2NSIU
         i8GAIhTB7WvvzGchJa7JlgpkYU+aPrkUmFeWufrs46vCkQyGBHVA2WJu1EwfwDPSyh78
         2mLA==
X-Forwarded-Encrypted: i=1; AJvYcCU+VsOLqQkWkXc55evCmZybLYVWqteSj0DWVJWNIeC+qbpvAIa1xTl2B2zh+8dzwLP9BxHem4jsSyPtkKPtrJ6L@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8XySACYwti4zxtNZk4diTmdCTxA9KUu4KLhSyZ6oMNWp4ZeC
	kSaOmxW3bP1Qc59vu0gsqqdes+xHcY5egr/3I3Cbqpb7TRxW0sVB1oS+Vvc2vkH1S4+FjcLRB8Q
	wEcsxTNy0twNKwewRi4DHrzL5FCCmCeiAXdHGpg==
X-Gm-Gg: ASbGncvrJunpRxpM7VoyIRvFMsw0DndjeX0EqplUiMHdCDGoTznzhAovy2DLP8qgESP
	uYPpKNb0bbb21/vzUsbU9UJam8VW41L7AYfvWkIU43i4JOS86cD04tfwFnlZlSVlJvZAn4irv0a
	0sk2eZiT1yLlvAPCmGPWSVTjI=
X-Google-Smtp-Source: AGHT+IHwfY9YDI7gAxVEnaSnjkABdZZOKgGT0o+XpttcOyVXA2GQq0jvYVFLH9NQlhONNF8RbNEGEwVheCtAyPLI7IM=
X-Received: by 2002:a17:90b:570d:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-30560949feemr889884a91.26.1743456080750; Mon, 31 Mar 2025
 14:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch> <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com> <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
In-Reply-To: <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
From: Da Xue <da@lessconfused.com>
Date: Mon, 31 Mar 2025 17:21:08 -0400
X-Gm-Features: AQ5f1JogYqSKmDgBJP4R985J7fldNhdkXea2BS9P9NlvEC_qQFM2qGPLO_OsWfE
Message-ID: <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Da Xue <da@libre.computer>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_142121_686210_C4B57915 
X-CRM114-Status: GOOD (  31.62  )
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

On Mon, Mar 31, 2025 at 4:30=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 31, 2025 at 03:09:00PM -0400, Da Xue wrote:
> > On Mon, Mar 31, 2025 at 9:55=E2=80=AFAM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Mon, Mar 31, 2025 at 03:43:26PM +0200, Andrew Lunn wrote:
> > > > On Mon, Mar 31, 2025 at 07:44:20AM +0000, Christian Hewitt wrote:
> > > > > From: Da Xue <da@libre.computer>
> > > > >
> > > > > This bit is necessary to enable packets on the interface. Without=
 this
> > > > > bit set, ethernet behaves as if it is working, but no activity oc=
curs.
> > > > >
> > > > > The vendor SDK sets this bit along with the PHY_ID bits. U-boot a=
lso
> > > > > sets this bit, but if u-boot is not compiled with networking supp=
ort
> > > > > the interface will not work.
> > > > >
> > > > > Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support=
");
> > > > > Signed-off-by: Da Xue <da@libre.computer>
> > > > > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > > > > ---
> > > > > Resending on behalf of Da Xue who has email sending issues.
> > > > > Changes since v1 [0]:
> > > > > - Remove blank line between Fixes and SoB tags
> > > > > - Submit without mail server mangling the patch
> > > > > - Minor tweaks to subject line and commit message
> > > > > - CC to stable@vger.kernel.org
> > > > >
> > > > > [0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACq=
vRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=3D8=3D9VhqZi13BCQQ@mail.gmail.com/
> > > > >
> > > > >  drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/=
mdio/mdio-mux-meson-gxl.c
> > > > > index 00c66240136b..fc5883387718 100644
> > > > > --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> > > > > +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> > > > > @@ -17,6 +17,7 @@
> > > > >  #define  REG2_LEDACT               GENMASK(23, 22)
> > > > >  #define  REG2_LEDLINK              GENMASK(25, 24)
> > > > >  #define  REG2_DIV4SEL              BIT(27)
> > > > > +#define  REG2_RESERVED_28  BIT(28)
> > > >
> > > > It must have some meaning, it cannot be reserved. So lets try to fi=
nd
> > > > a better name.
> > >
> > > Indeed, that was my thoughts as well, but Andrew got his reply in
> > > before I got around to replying!
> >
> > The datasheets don't have much in the way of information about this
> > register bit. The Amlogic GXL datasheet is notoriously inaccurate.
> >
> > ETH_REG2 0XC8834558
> > 29:28 R 0x1 reserved
> >
> > It claims the bit is read only while the BSP hard codes the setting of
> > this register. I am open to any name for this register bit.
> > This is the only thing holding up distro netbooting for these very
> > popular chip family.
>
> Which interface mode do we think this affects?
>
> As a suggestion, maybe call it:
>
> REG2_<interfacemode>_EN
>
> and possibly add a comment "This bit is documented as reserved, but
> needs to be set so that <interfacemode> can pass traffic. This is
> an unofficial name."

I found this on the zircon kernel:

#define REG2_ETH_REG2_REVERSED (1 << 28)

pregs->Write32(REG2_ETH_REG2_REVERSED | REG2_INTERNAL_PHY_ID, PER_ETH_REG2)=
;

I can respin and call it that.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

