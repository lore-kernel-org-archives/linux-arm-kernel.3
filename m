Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C214CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=; b=4FjcD98832/nMMGozzARujVm1o
	ThJZkml/r6IZNIunLQuciPA0IrEvmm+If8KTa3MaHaHRZSndX4TweTChUyjUhDolUdLEoScAZSeMI
	52nKbV3XEcItLAdIGAM/M4rHFz3U11Qf9+DUOHFCcE9BprdFc7kvQckcWjOpTzN+smLgU/xhOxSwu
	0X7WyLEMM7jMI9XF+22qJEcE6Dc8Oq5niVLbdxFCElXsDNENo/vGWrSdcRVzZNO6grtYVg8ahTJRT
	H2uNjGJSTvot5HeDkWoRCiCnGWRkvhR9DYeSa2GL3y78ptp49wdXPbhHgqh8GYNjKzJt+j8BdPXiY
	Rm32AJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGzi-00000007DiW-3wq6;
	Wed, 24 Jun 2026 06:21:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGzf-00000007DhZ-2CVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:21:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-bed19623d6eso81110566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 23:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782282109; cv=none;
        d=google.com; s=arc-20240605;
        b=WuGoudS8pYgq5Ed2Yv3vORZjZOpcVBXzj/tYJUKhmMT2NO7SS+KjLzQopjft5w1yot
         qBLnr4zRuxmg/xMur2uM7LbBHxP4P5A0slP9NlTH8QSyRc7a8/cqyLYogDA+420TXVga
         Unb5CGCgQ0nsX2L4fy+1VoFCpoJFrW4RXzWPZCXQmvudqAymWb+CC8zjtgglAuYYNEWw
         wa36oSESAXkx22rcrcBwR3phZrMoxwvm9FyjrSGY3n+yKrHWL3pGA5kayQMvfrQh5rBt
         k3gGWDysr+qxFg/6uGnc/w1JgXvh3xYue1C5f5zp/kc9Z/EVeGRL3I6Xb/h9mZiSDQWQ
         6Sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        fh=axvMyKKVQDxQcpfaC3niZmYNJEjKJtNCa7y5WA9r2xQ=;
        b=Mubxu9f+zeGEetzbbWsq9A7Lndqn5z1jvfQVjuo439Y2YTAPUlu/DkeaM1jmhY8LSx
         ezX31rWDujCe44wVA4trxgrGKmqfU/WHlzX3bGO1LbxQM2e3/tePPP+8YwUPTvuDqFP7
         OR1oQfcGLat6vt90BHOwovLh27JJ6qRA2MHjruomFo2KAY6Z+5EXHIiO/le1E8xncyEv
         XCADnwN/GvJ385/GpnTWw76MPzRfXWa4eTFJeC/3MOTEkvJLBsA7z40gSZ4DELXpzz6t
         V3XW666Jyfvk9F0EJRjWZh7MR9rq40PSNpGO5JkI2wcspwcgaIh+HgwDHHoG8ij2k+TB
         24aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282109; x=1782886909; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        b=CF6OmDSRqByd3ZMu1v3T3u4X5+bM45qD3byH+d0sqCowwMgP5rd912oPeuKfHr5PWa
         UK1uYN8jhu/F82hM/v3V5OMHdv1MDpwtkIuARRDJAbYWXv0YHN2pxbONoV8cNKj45AQx
         4fRn+hTfq79xGakKlFq9oYqJNhDw6C9R5OW9JJn8HEhFFzJWbAU/yntPvtOUyAB1GxgC
         R/ltBl6UoZVSp/PYDW6rqEnoY1MPkZvNd2BToGaDRQ+VMdR9n2BMJxT5AZYxm43DPAn1
         W+MDUPugSHBRxXk4/AuPbu96G5yuT8ynMW6uQFKBPCfvbVPd2Q+dpN/Md1GR/JIePMXa
         C0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282109; x=1782886909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        b=sZLK59yVXH9kh9CimpEEulpdvNi+T2WOpYG1Iu2WGmdu8ZqcccYJPFe3yTr6vWKA6r
         jc0iEs++mQ8gLPV4oNLVkuAobYlKAtsc2KvFOud6KIoVwcuXMfF09j/CX3p3tKvjDLwY
         rCREAPSoGsrjnaZA+2Dt8ZvKAq8qlmZpE51fWF1ugTTQL4citfi6iNovbL2wnYpB5zg3
         Z1qHOhIOZFriOS33WLqtW49x+acpcn2sE6nYgS6lagRLC75E1I1dsMWNVj3mS2gqsy+y
         lVUWVgjlV9HWB7Vf7QfAp0DcfYXgTr3JoHoqVwG6N2KvJ2y4JRVhvAGLx//Vdv605cX7
         OpTw==
X-Forwarded-Encrypted: i=1; AFNElJ8X1Q/1Okudac2MYi62vQ6idIRrb7JC+ub+anI+T41q9YaeAZsmSq+zmZHs/fdtaQw1l8UQY7c48mugZcfaiN/L@lists.infradead.org
X-Gm-Message-State: AOJu0YwqgSpLfS7t/HZz2BiYkciLIeH8pn8hcmxw5gHV8cNPtkaL/jIh
	kUwDt92+WRKsnsc5su5PJ1I0qJWjKjQX/IQPrVNE8b10n/4UcRwM2G6H4DRQVsuISd9sULBiAa8
	9AlpN76lnReYdn7Pa77hW7yfedp5ocQ==
X-Gm-Gg: AfdE7ckR2JMjMFIUGjlG9VZ5k1oc6PlJbyxi5hjKusq4JBQHRiQxW+NfrVYy7DVZi+R
	N6s2u24OCnlwh+UmG+4ih6F1utQBFe9XohsLfxXzf12VHAtRilPLzkqb8sSH3GbYuiocstNhmaa
	XDie1yJdTui5ObWQJy29ganbwQIBM38f6zYV/AfySpnolO5dXve85VuowS4GFVe8euvz+2PVpfj
	nR9aom6nHdpX6qJy1gXJkAaIEP0bFH/Va1+b6TBzNgL3vI3y/riAhywQeEf6Nqsgvx5R0ejpusk
	z5HOJV4dGzSYe6pteeDoVXAR
X-Received: by 2002:a17:907:c001:b0:c08:22ae:6f46 with SMTP id
 a640c23a62f3a-c10810aa410mr290153966b.53.1782282109214; Tue, 23 Jun 2026
 23:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260623094125.95791-1-mhun512@gmail.com> <ajqZoOv-TvmOMLCh@redhat.com>
In-Reply-To: <ajqZoOv-TvmOMLCh@redhat.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 24 Jun 2026 15:21:36 +0900
X-Gm-Features: AVVi8Ce3Z-6QUrlwc1vKC_mNWrwGm9QCSsydSqBSnSiXLAHJBuAdHPRbOQVKR9I
Message-ID: <CAGEsz8H7FAq8yRp+GqQeWZosB55ABzShCX8pgz0HvS0Cccni1w@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
To: Brian Masney <bmasney@redhat.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_232151_592215_7122D5AD 
X-CRM114-Status: GOOD (  23.34  )
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

Hi,

Thanks for the review.

I will send a v2 with mtk_clk_unregister_plls() moved directly into the
devm_of_clk_add_hw_provider() failure branch, and I will make sure it passe=
s
checkpatch before sending.

Best regards,
Myeonghun

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:35, =
Brian Masney <bmasney@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Myeonghun,
>
> On Tue, Jun 23, 2026 at 06:41:11PM +0900, Myeonghun Pak wrote:
> > mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, w=
hile
> > clk_mt6735_apmixed_remove() unregisters them on driver removal.
> >
> > If devm_of_clk_add_hw_provider() fails after the PLL registration succe=
eds,
> > probe returns the error directly and the remove callback is not run. Th=
is
> > leaves the registered PLL clocks behind on the probe failure path.
> >
> > Add an unregister_plls error path so provider registration failures unw=
ind the
> > PLLs before returning the error.
>
> Please run your patches through checkpatch.pl before sending.
>
> >
> > Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 ma=
in clock and reset drivers")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> >  drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk=
/mediatek/clk-mt6735-apmixedsys.c
> > index 9e30c089a2..04cf9665ec 100644
> > --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> > @@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platfo=
rm_device *pdev)
> >
> >       ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell=
_get,
> >                                         clk_data);
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(&pdev->dev,
> >                       "Failed to register clock provider: %d\n", ret);
> > +             goto unregister_plls;
> > +     }
> > +
> > +     return 0;
> >
> > +unregister_plls:
> > +     mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_pl=
ls),
> > +                             clk_data);
> >       return ret;
> >  }
>
> This fix is correct. Since only one path will encounter this, personally
> I would just put the call to mtk_clk_unregister_plls() inside the if
> statement above to simplify this further.
>
> Brian
>

