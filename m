Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF93C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54ZSdcYDtnus7s+PnlVyh1eGHNk8J873Vy4LrzmGSk0=; b=opWLowDL7Z2VblCRiplm5Phm0y
	fEJcqhTE/ODdQ1Z98CabaNIje1yda1nP3yATD2LiNSsh3nzunBEYh+D5W3UI/HFXstNJ3RMKKCF82
	XrpEFX/O4hE1PqKf7+swvJ8ZEj+2EeLjlJz5FksNs7Fo+bmha7MuG9IdDm7qxOFhj8tG9aZW140bF
	fPqvDfmthUSTjkS3C2LtXUPsiiJRWMgHKn0m2HGUBD87ZaDhGYEcacPo8remLuOuGBne/fGbFALWu
	CbNeH5z69Vq2/OBygzqVgYK8rUM9Gasd7644w31h2tFyXVcYlQJKNngE6yidb1v6Twu/XRVDOFVUd
	ZZLDwRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNUz-0000000Ffdw-2B9G;
	Tue, 30 Jun 2026 01:42:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNUu-0000000FfdT-2h4d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:42:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so3153252e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782783766; cv=none;
        d=google.com; s=arc-20260327;
        b=aL4lVX6Jpqw3Jdejxb4qvettstPwh1S4HRTyYsq9+tZ+SJHS/GKrVjaSeCcJOrXb2K
         N7DYAYl5UKUZzruWW76ceGLXTaycrca2ZA14KZnuoIOONbKGZduwD6tuBBWZZTAxJF9o
         crbEbDDAYnSyB4CW4DLa67eYdgP07D8R85CqFCz23qpdgavhB1mtMePNcceg9Oo/rQ/z
         DNopxh1OklANLwh3J53IeQq5RDAY28rmSs5rJsy9FlxWT64ApO9yHCPKXAM6Bf9xDqZ/
         6cbkrO5XM/qg874T6HpTVJWAhGGfA73VDNFBjLk1cswjLNbl/iRzUQf1mfoo5hmBCS7T
         C80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=54ZSdcYDtnus7s+PnlVyh1eGHNk8J873Vy4LrzmGSk0=;
        fh=0A9Ove1aaOxxSqbHL3lT63QnST9WGA9/bKpaXHGKIwI=;
        b=NW4b7aLjwi28R016iK8+FrP86rnc4koyhHoHWFv5e021OL8YAUCgdmgL/TUDB/QXUQ
         XnwWtymCy2hMnJpYcJvAgt5DBwKUnDEsti03tPfYsUCiuNbPudPW/0sMDaYOBZkU3Aot
         cu1IkY0MfEXI/BUbA0h+sRWFdf+AbU8Gms1cC+0fHVngArpnFnUWoY1bOm36QfPj8TJ1
         BfJOYYhGibAShf+3ZbKkeflYVwrwYgVavOL0msKGGz82yuyvdCgXqOhtWgnsjaflqDMA
         YYI7Bi8Qm72WYyh/Yz+gBCmOv1GnBHfTES4lPS0jPPu9UC1n9wi23fTODJv7dNfh/LjQ
         IDrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782783766; x=1783388566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54ZSdcYDtnus7s+PnlVyh1eGHNk8J873Vy4LrzmGSk0=;
        b=rZmOW+VC5r4ginDtjwA40idqaFFmqbB86vNXLyBHQzpa5dZKLjVtV5+iHu9bWA18pa
         QXKldyqkqnZnxQgsD2fIR+JbyXPMiZLtKhgcbbS7NRa5cn+OJKFlCRm63hWMEZcnj9LJ
         QjArDYR4j0dhN0jOpDI+e+uUzfqd198wdvLrjvI2J3veqJN5BzD0rcxWPLj2DiO3uwqF
         SGBAwooc8zN47A6KEI51cnhyxhZfIlu+tlxPqgtkYCKBLDQ4pulmGb8fSAUpvMSbbXQ3
         OeVLxfsqgS//nTs5tBd14oka018q4MwHvy8EcRCCsmgTi2vITt1gBTUGC3rr9RnVn/KH
         wJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782783766; x=1783388566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54ZSdcYDtnus7s+PnlVyh1eGHNk8J873Vy4LrzmGSk0=;
        b=YvtaOhQrePT85ccV5PsmZPINIdB+ntMfTNhe90YFPngv3q/YB4AuxpiIvpDPRgWLOT
         9oP2ZVbsiKhI+LbkxQkB6YB/YLV6b2kZI6+oJZdLi4LxekvFu3rHlqVASbWF7u4lFug3
         AnlYqO9r+ATv4AHpEV18KZ76nZEBSOcZqlUepo1jxvKTOHw3epvmEsGs7VzUhXnh8IUe
         o/HmsQdk4d7zLE/UotYJsp/JZshnbnaDciQaUjOIlvUcOePTC9/BojmsI0AzLHjvXXyO
         9dVIiWBE16QOejZ89m35c0FSayjL6FHkJqPi145zGZfrdERyC0Fj+Y3CAlvxs9Ke/F1F
         yaDA==
X-Forwarded-Encrypted: i=1; AHgh+Rphge+tzYtFAceGZe3i09xAdrY5s+TLt/RPF0952MuuXWGeAlxF4rMOxLLna9H6qhv9YXJJ2VAwUonMGPLuTqMt@lists.infradead.org
X-Gm-Message-State: AOJu0YzQCCcHnlCnuEayroxYPh05bYoHApkt04PZBSe1kIxG4ro9ErrY
	apbYgyROP23kkBJgtrRCKSHBFkhp5vmsQ8ZynoTPA+WfsopUdH0rRl4VKJxeio47L9yMvqc0mQQ
	91gkL827n0MIl2noMKPDMqHw3onRsaB0=
X-Gm-Gg: AfdE7cl1LFQDGHTcOGU8qFJ2zPSyTcPpPZFdUHpKJwIKghR6NsVzhCHUpJIm+urByj8
	RwJboGlxRqBGZwk2Y3M1JyBd+xnG3rRu0vnFNPFs6AiquIULvju3OIpmIfuzht7VC5R3uwiZhgA
	21J0p/SegPsEkuAz+OiIvlYibSFdcW2zBQ+uc81RBO1AkclSn6rZ+POYk63umiuKXkxSv0Bnu+B
	2yBQAYqmbgqpEHm67uX1QDvHhdMPXqHiatQ9MiKdl8nW7MDwcR+YtV3O9ZzD4e4C4X6y3ooy8xb
	iX/DHDN3rVFRQw9W8QxMtcl1cSQH0babxwW0II6RohCeQfC1NSOjkRVedmpBraZvpcqKI6jlebu
	IOMIf2rkRv75iSeLJ8QYoAK3WYu8=
X-Received: by 2002:a05:6512:15a7:b0:5ae:b489:b844 with SMTP id
 2adb3069b0e04-5aebdbd1019mr285139e87.32.1782783765734; Mon, 29 Jun 2026
 18:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260504031209.618949-1-rosenp@gmail.com> <20260506110910.su2s6ncsi2xfdiwm@pureblood>
In-Reply-To: <20260506110910.su2s6ncsi2xfdiwm@pureblood>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 29 Jun 2026 18:42:33 -0700
X-Gm-Features: AVVi8CfGsOdNjYThOJxFiCSIqzZLS1O4KyLXKY4lRZyMqOtKIckcWa9Mym5j2e8
Message-ID: <CAKxU2N8PUdxo54oHtcroqe+Q88k0obxPg_9OCRsNsoOwvcS25Q@mail.gmail.com>
Subject: Re: [PATCHv2] firmware: ti_sci: simplify resource allocation
To: Nishanth Menon <nm@ti.com>
Cc: dmaengine@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Vignesh R <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_184248_720776_E737EA75 
X-CRM114-Status: GOOD (  22.96  )
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

On Wed, May 6, 2026 at 4:09=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> For some reason, replying drops the CC list. manually added them in.
Found the issue:

https://lore.kernel.org/lkml/20260630014129.1548147-1-rosenp@gmail.com/T/#u
>
> On 20:12-20260503, Rosen Penev wrote:
> > Use a flexible array member to combine allocations.
> >
> > Add __counted_by for extra runtime analysis.
> >
> > Fixup k3-udma as well since ti_sci_resource is used there as well and
> > needs fixing up to use kzalloc_flex.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: add k3-udma fixes.
> >  drivers/dma/ti/k3-udma.c               | 180 +++++++++++++------------
> >  drivers/firmware/ti_sci.c              |   7 +-
> >  include/linux/soc/ti/ti_sci_protocol.h |   2 +-
> >  3 files changed, 98 insertions(+), 91 deletions(-)
>
> Since majority of the changes are via k3-udma.c, if this could go via
> dma tree, it would be nice. Else, please give an ack and I can carry on
> my tree.
>
> For the following:
> Reviewed-by: Nishanth Menon <nm@ti.com>
>
> > diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> > index e027a2bd8f26..04d99c1fafa1 100644
> > --- a/drivers/firmware/ti_sci.c
> > +++ b/drivers/firmware/ti_sci.c
> > @@ -3574,16 +3574,11 @@ devm_ti_sci_get_resource_sets(const struct ti_s=
ci_handle *handle,
> >       bool valid_set =3D false;
> >       int i, ret, res_count;
> >
> > -     res =3D devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
> > +     res =3D devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNE=
L);
> >       if (!res)
> >               return ERR_PTR(-ENOMEM);
> >
> >       res->sets =3D sets;
> > -     res->desc =3D devm_kcalloc(dev, res->sets, sizeof(*res->desc),
> > -                              GFP_KERNEL);
> > -     if (!res->desc)
> > -             return ERR_PTR(-ENOMEM);
> > -
> >       for (i =3D 0; i < res->sets; i++) {
> >               ret =3D handle->ops.rm_core_ops.get_range(handle, dev_id,
> >                                                       sub_types[i],
> > diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc=
/ti/ti_sci_protocol.h
> > index fd104b666836..7632bb11c862 100644
> > --- a/include/linux/soc/ti/ti_sci_protocol.h
> > +++ b/include/linux/soc/ti/ti_sci_protocol.h
> > @@ -599,7 +599,7 @@ struct ti_sci_handle {
> >  struct ti_sci_resource {
> >       u16 sets;
> >       raw_spinlock_t lock;
> > -     struct ti_sci_resource_desc *desc;
> > +     struct ti_sci_resource_desc desc[] __counted_by(sets);
> >  };
> >
> >  #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
> > --
> > 2.54.0
> >
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource

