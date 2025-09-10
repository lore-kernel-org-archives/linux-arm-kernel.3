Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17918CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 23:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cm+XcZVdExWAkf67mJrRQ1egxi6MvWD1BFDRBKszsSc=; b=ml8k+gdQmA3zh6Z0l6LzSQ4JnK
	09djleQa8OELVceDBuTGtyya/k0SpMaAWii+y/uD7rkFtOImqIMPUrPEtqKzprZu0ylozubdPqyRv
	+UBl5MDfZFBxOYVJXu9cGuCBvvaV+5z9E8eEO47cLvvRBXG4yfho1tLxMOuPdI40gelNcVVpQgtTT
	mHQU77STK2HARY/GfdORRfBeonqYBS87DgEQTqwxRI8kZhjfgGwwz0RPDJTyjBWKkoUgaDgzop3nR
	/dgt5ss46StW/7oUNEFHYVdcq13gmfZ5OZ+8ltYzmVGoc9NMqsE9q7t7KT3UmwLtSEgbH8ToTArKL
	iMvFv2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUFz-0000000HIr6-2JRF;
	Wed, 10 Sep 2025 23:29:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUFw-0000000HIpP-2nRM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 23:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A02284486D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 23:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833E7C113CF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757546979;
	bh=giqX8D1e03WEb190csFinToB6mmpK+SueWukzwTLrtw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UuWj9VRPzw1PvbSaCVy7gV5XIu21brGl+BUVHFYgg27kHS3pblH2z9FZm0Zjxv25q
	 vM6pT5R7jh5OKkI2NzxgMyQx5Fv8tw3d/fDKigI8SHueZNQxBPhV/8lB1uJ3ajTG9s
	 xUvNcX9o7L4/f1V7B0FTzSx33FWb6to8itCzKX1wbdB4WAu7Kpl/1brpLB1O/G3tDn
	 TxiZM+HCqDW8zkFyLasBq+7lhQXG5SZiejGqiHT2kol1gyw9+pY3SzmoJ0bhzIwZT0
	 0XZFkApfr8uVDYBu9rbQ39gXBGSk8G3BnLFiRb/55HfKgaFrdWxUE1VeN1tzfFAXpY
	 4lPsVBhr+WVCA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b04abcc1356so17578866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 16:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwTAtjeYplZctl2uU9TJp3CBPl2nlIlmFRJYxc4qjAZpZ/zEOlRcznB9Fpfs47Zii7NuotGF32VmzgiAPy1PA4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcw7A4I4pdk1ov/C9QWZWW0YIDy75Md444rnJeXW1PdxAFWD9C
	Hy27VeEAsNf6AX04KwajIx3Jf4OdgIptYXUtBEBZ8mcM35N2PTz+RKjlipQL92eCMd4SBL0JAwq
	eGdDdlZuwEmXx8B9aWoSd/6EvVPuzv80=
X-Google-Smtp-Source: AGHT+IGlGgx50+D2ydI5vBqV6/W+PuaO1JZSUd97+Jrqkz/eIi6Qj2v1ae31SM3Fqif/p17XncOr6qKwTf/VY8KBwGc=
X-Received: by 2002:a17:907:808:b0:afe:bdcb:9e62 with SMTP id
 a640c23a62f3a-b04b16c4a55mr1764621066b.33.1757546977956; Wed, 10 Sep 2025
 16:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250905084059.26959-1-ot_zhangchao.zhang@mediatek.com>
 <20250905084059.26959-2-ot_zhangchao.zhang@mediatek.com> <a7589659-0352-4d47-a3cf-f2433cc512ec@kernel.org>
In-Reply-To: <a7589659-0352-4d47-a3cf-f2433cc512ec@kernel.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 10 Sep 2025 18:29:24 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzrp-cfn_GiLrHCU629wEAxWy=egOMrRh6thYbymu+QXjA@mail.gmail.com>
X-Gm-Features: Ac12FXyyVN5Jiq60xJ95u5ez5XUlTPRrkZuzl25f4dRSg1MxKAtg591tBXMalW4
Message-ID: <CAGp9Lzrp-cfn_GiLrHCU629wEAxWy=egOMrRh6thYbymu+QXjA@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] Bluetooth: mediatek: add gpio pin to reset bt
To: Krzysztof Kozlowski <krzk@kernel.org>, Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	Hao Qin <Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_162940_738826_CA1C369F 
X-CRM114-Status: GOOD (  27.64  )
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

Hi Krzysztof,

Sorry again for the confusion. I believe Zhangchao is still new to the
upstream process, and we=E2=80=99ll work together to improve this. Since th=
is
series has become a bit hard to follow, would you agree that it might
be better for us to restart with a clean patch that addresses the
review comments? A clean version would make it easier for reviewers to
focus on the current issues without being distracted by earlier
mistakes.

Hi Zhangchao,

Please note that both btusb.c (with DT and ACPI) and btmtksdio.c (with
DT) already support reset_gpio. Our goal should be to benefit from
these existing mechanisms while ensuring that this patch does not
introduce any regressions. If the current mechanisms do not fully meet
your requirements, it=E2=80=99s important to clearly explain why, so we can
adapt the existing framework rather than creating a separate one.

And please remember to carefully respect and respond to reviewer
feedback, reviewers volunteer their time and experience to help us
keep the subsystem clean and consistent. It=E2=80=99s a valuable opportunit=
y
for us to learn and to ensure smoother integration.

                          Sean

On Fri, Sep 5, 2025 at 3:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/09/2025 10:40, Zhangchao Zhang wrote:
> > Makes the platform Bluetooth to be reset by hardware pin,
> > it provides two methods to do it for mediatek controller,
> > and it has been tested locally many times and can reset normally.
> >
> > When an exception occurs, resetting Bluetooth by hardware pin
> > is more stable than resetting Bluetooth by software.
> > If the corresponding pin is not found in dts,
> > bluetooth can also be reset successfully.
> >
> > Co-developed: Hao Qin <hao.qin@mediatek.com>
> > Co-developed: Chris Lu <chris.lu@mediatek.com>
> > Co-developed: Jiande Lu <jiande.lu@mediatek.com>
> > Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
> > ---
> >  drivers/bluetooth/btmtk.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> > index 4390fd571dbd..29d6a93f255d 100644
> > --- a/drivers/bluetooth/btmtk.c
> > +++ b/drivers/bluetooth/btmtk.c
> > @@ -6,6 +6,8 @@
> >  #include <linux/firmware.h>
> >  #include <linux/usb.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/of.h>
> >  #include <linux/unaligned.h>
> >
> >  #include <net/bluetooth/bluetooth.h>
> > @@ -359,11 +361,41 @@ int btmtk_set_bdaddr(struct hci_dev *hdev, const =
bdaddr_t *bdaddr)
> >  }
> >  EXPORT_SYMBOL_GPL(btmtk_set_bdaddr);
> >
> > +static int btmtk_hw_gpio_reset(struct hci_dev *hdev, struct btmtk_data=
 *reset_work)
> > +{
> > +     struct gpio_desc *reset_gpio;
> > +
> > +     /* Find device node*/
> > +     hdev->dev.of_node =3D of_find_compatible_node(NULL, NULL, "mediat=
ek,mt7925-bluetooth");
>
> Nothing improved.
>
> You just keep ignoring comments.
>
> NAK
>
> Best regards,
> Krzysztof
>

