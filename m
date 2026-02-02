Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDAE7316D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=; b=CtQhd8oGZq/n+b9IXpbA+02ChZ
	9bIcbI/b217E/6kdBkbsyj89ZeheqNVuLdMCdIJ+nDxDUd0NtQVEtxifWUqT//ikajyzpXeedg8F/
	jgACco/wRDMkX2bLbGsylJ/0j6Max90vYxMvgz/Sw6W9DpecZl3fQNHOTcRSTInKHHMif8DZAYcXI
	PJWM6bpdZu4vPv3/JfuXAxMXyc04AoNAopnDUlXb7f5jix/Wil485V75ZFzyV1+vUcf3wdRU0QQkl
	Iwvs0zdwxNp5NAdw9a0l95HJNjd3lVWcpo3gGsT9ha88GHFUf37II/GUL3e4rY+2M5VQLAjDeFE/B
	yc92I0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtuT-000000050Rb-3P7L;
	Mon, 02 Feb 2026 13:24:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtuQ-000000050RG-3Ozw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:24:08 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso6352180a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 05:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770038645; cv=none;
        d=google.com; s=arc-20240605;
        b=MRSdfwy1DJ+zo0kATYivHEzxri7bVpukALrXYrdqLIKzbADkA94tqz3Izlnqtwy9fY
         rkMpcpNT9GEVsKOImN0sCH1vSeftKLoy+U/NWVe+I65mfEzwYlamVLJnGo4gB428TVzN
         6JFFyxuSUnQqh3KbkrTytfds5T+pbazfd6BKyAr235O/z37YlcGP+jfGoATQ1WYASrsg
         Q6QyCfYKnfHWfowPoZJ9w6zvamGDsQBih3C3gt3/cs0i+tkSui8VzY4vheb9gZ40ghzA
         srk0mM/HHSdpAnFssue71VDBUPGQpJbPTnEr6b9Oigo8orb1vEsg5oAp1nixdpGADsaE
         FzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=;
        fh=JjSiy0jILk9YYMxj/jeCEozAprz6NH/7DXpgHR2GgNI=;
        b=iRW+XoYf3TFsAr0CaUREr9EtdmX0idSyKsoj7hsveIYBbRkNfVGSO7wHx7jyoGs5Dd
         THns7ktdYHbJxn5qjaPjklz1zeSx1FbFYskeidFRkdZGaWyvhfIEf5sNHi0e9Bs4Id4Z
         mEx7avm+i3+ER7INcgYBFyo5uAtEq35FW0jkvn1+ZuXquT/y1fsSJMMzRwYl0uyUHZml
         +RgWOeUR1fJ9MiWVsaNUsiU1iHD9ujMWT64Xojhy3mSBLhwLyqpOKlcuHIAIdgBb+AiT
         lpFMSYjHar4gmiLwQ3BrFInOKhuX7ZN7tEPVrCRP8pfPqEfNkyEz+ojHfOBXHDFr8jnc
         GYwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770038645; x=1770643445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=;
        b=ghz0psJ0ys6RhzpShMx7qDkquzyyLnCn1b7rNOm8MxmZk5T5Ta4DCrPsDv/tLkDYAg
         fcDkMgJQH3BIliW2NEl2AG6ZIxBzHcXjXHJjg1gz38igrupTEV9/Dw25nNoYGT/rcunE
         se+ISpiwApmvO/0Jx8GQJG/ov/S3t8JK+2ZS0CtqtJAObNgOmcoU1xC7h8QihgYjPUhA
         Y10nyI6siktHB2QbgQ33ExROHewCV3NDnptn+Szr7FEoWfaB9mTUO3bmEPOX/4BqdZdE
         GNNz9U/QJ/I5FxQ5mbDnXTttmlLKXS41O7U36plRu7L9+86IfzpWmn0S1fybtPKal2tR
         8/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770038645; x=1770643445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZtqsNVxYmUM7kVhobNJef7ZiyW1KuqLxzJ4BO5lzl8=;
        b=SGAn6Fn3vQ3SATYMSXNkhKoaQUvtZ+Pe4pDY9PcnFD4mOW5dG1dOfVc8wW24WgAUBt
         2KIBiYnKRIhnDDejn5pa5cIZQezCgGg45Cr6g1twRK6C/+XqQW8P2HWg1DlVI0/orp6I
         v9L8ORqAbqwW0JqDO9UP9GFX0Ao3FW6lgGXvviE5tbd7GKCjOuqm/5nX/jg5mxp73ZLu
         n2cOZfoa7tD0kg8gMxflP93iHrw2cucisSjxmrOSPhQawTdIq2WeSwar5lMhoJABx8hq
         DRfZdzJtGVtpONYG6wpbJcmrbUaAOJL7bKEEwk6ssu9sHXGqEdV8iRnGG/fUjo/9eUAy
         BlFg==
X-Forwarded-Encrypted: i=1; AJvYcCXVgZcDcHZBooyN7oa1eKU8qmISMgVSUYOWRjuuzemBwXm9yecZPzQ/duTUirF5y6pJZdggKgo754o1bguGPvt7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq0kOPmz+5UaL2vKWcYkwW3alvAMRzsCQ5Nq3KAzYPYCcr/1oJ
	efXGnFrKr9z4+OywPNPUdwj3ksVMjCDU7RqVDVXSmQx0X4f3SV+9Wy2kPPZGpm4rR/vM6vnmF3U
	7wveYTk+ySkxztqxswsjgfTW3nowMkrX5DYAiTaTOqg==
X-Gm-Gg: AZuq6aIzBZyosnhIvMHbiDUpbHz6wELX8bo9YI+peGKMhcREnIBzH4qRgr96ypwSRb0
	1ZzSFc4QomKL17YMaM6w0Wh00ajNjCAygk1zzxuTKn3PiVHcRsIEma+Eiyur5fo04MiqjEDSKU+
	OTeHtetCW05fkgDdYbB4SH2/2zbokJ/oGx7oKhU/MrARipzw79dAxx+QUXTETlmlS/rOkNp5gkh
	YbuN2Vi6D0nkd89RVVuGOaqyrRt+omzghJKscS1pM7uZQr4WSmoV363wo3JQZcI2TyE273+zyV6
	AzJ4gtAWOHtGBR4cvEUhr0WU
X-Received: by 2002:a17:907:2d28:b0:b87:8172:257 with SMTP id
 a640c23a62f3a-b8dff89af6bmr705882066b.64.1770038644604; Mon, 02 Feb 2026
 05:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20260202130756.1421488-1-vincent.guittot@linaro.org> <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
In-Reply-To: <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 2 Feb 2026 14:23:52 +0100
X-Gm-Features: AZwV_QiL5Qef1fZxaIymfSBX4W3u5vzi7FPx445SS4vhFERac0glqVKsoUgJdeE
Message-ID: <CAKfTPtBZCLiq0E-a2QA5X_Bix2PxXiCyuCira1V_wBWZORUS6A@mail.gmail.com>
Subject: Re: [PATCH] PCI: s32g: Fix ports parsing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_052406_873344_2CB54C8B 
X-CRM114-Status: GOOD (  20.72  )
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

On Mon, 2 Feb 2026 at 14:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Mon, Feb 02, 2026 at 02:07:56PM +0100, Vincent Guittot wrote:
> > No error return is missing after the loop resulting in removing the
> > ports from the list.
> >
> > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (R=
C)")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/c=
ontroller/dwc/pcie-nxp-s32g.c
> > index 47745749f75c..767f5a622441 100644
> > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > @@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev=
, struct s32g_pcie *s32g_pp)
> >                       goto err_port;
> >       }
> >
> > +     return 0;
> > +
>
> Hmm. So the initial 'ret =3D -ENOENT' will become redundant and you'll re=
turn
> success even if there are no Root Ports in DT.

good point.

>
> You should do:
>
>         if (!of_get_available_child_count(dev->of_node))
>                 return -ENOENT;

or maybe

+       if (!ret)
+               return 0;

>
> at the start and remove the 'ret' initialization.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

