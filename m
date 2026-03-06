Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FC0FCC065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oFep3QUMArP/Mg+XO3iZqRWYbfwWlvGA+rkFHJ1kfo=; b=hmptVr2albIGsFJ8tBYrJrvvR7
	vUqcP6IVIcYU3aFoWnA3wU0IArvBsnwlszxum8qXZJdxWxkyEPLu1uHHPc9fsmUWPBErJwya85j2M
	ThTRxOcQZD95ruEqJsXAHolhzZ4kfTlj1bEgIIcxXhoow4Eeja2+NguhsimvMfc/2rPo76GsbuAcx
	bNLyjA2OcZJZMDSSFlJc8rYeeTPf4lC4OTANkMs/vpplKGeDRKQnTEU4toX3rXC5eyzCYdaHauABX
	3h/f94ISUjGblH/+vz+kZ91pfqe5v+vrY7QrK29haIDpYBpN5iOhAwCEYb0KIcPJScvUnEqpRAGnS
	PvjZNSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyayD-00000004POy-2WKW;
	Fri, 06 Mar 2026 19:36:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyayA-00000004PNs-3C5U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:36:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b941ec6a368so229047466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772825777; cv=none;
        d=google.com; s=arc-20240605;
        b=Oi4HkEcdwGCyF+ZoETRtQiNP6F/ExQSouVlW0uwr+NaCLqA4lw697rMvfY0qmPaJxg
         lb0NteiPN+O9B63E5mGzdxn8i5qU31uHkhRdsBaq5jLg/rDXS52VEqaK2FySsbhyb2yW
         IIeQqE+YkRhbsfFuGqKJrYYSdhm/Vs8/GVESKJ48PNiTIQBUqNiwT03lw7eeo9+zlCYF
         FzwY7VMhJld/FWFX6mKCxCzhMaZ7HBLiKMeWc7IxYQVUZbkgkYK0AkgktS886Jo04MW9
         eDBgYwGtNFQSlYEIMoQeJhphCho1TfoV80hfdgwKdQrlF1qemzKEjfM3zYk+6HFuVRS9
         bSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/oFep3QUMArP/Mg+XO3iZqRWYbfwWlvGA+rkFHJ1kfo=;
        fh=2dufbKFSi5VtN8OVnsAMi27Zf5K5XDwU7Xa+PxAbcFw=;
        b=PgjgmszzYzRqWVvVSndr2BH7xfbavF1P0enkKWiR9g1hxSiw9HJZgmpufnuK48cJXE
         Gd3OBdqmosu71AYZoi2Pw0jB/BJr9jm8/TDMyKFg+aoF5y4x7I4MhzRUIcHUTIg9MzUZ
         P4K7+qAVphAFgTVMG/CxTbn6LNNHSKoHNHuWukzBBDW3Bu9uDQ8VdnPyhNjL/fouem14
         YQvEYfSPOyIMVbhPx8SjYi14wDNocab86qbDTi3nlhBV/ssgiQ4bBdZrgG8PGl3rTFsr
         9pMv1v66z2lVTXyJdYpPm/Uzgf0gb3YK1MYGplHUXgBTTfZZ1crCWRMd/RsFojmplGiJ
         k/qQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772825777; x=1773430577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oFep3QUMArP/Mg+XO3iZqRWYbfwWlvGA+rkFHJ1kfo=;
        b=MYy5KFbprOtZDhbed9EyTsMOegDe+wKMmkltZCDMd8QT4JGrrdGzXSKoLMkKGTRwgz
         ZMwlXfgRsCGeeaX3OLLI9U5LAJyvj9h6xzgve4s2j5x7K0gUbLnM5g6J1lrYI7fZ0lfR
         SZbl72PGMaxpWQL12cre57naA5d59MRhUftzaYiltTJAuNNUXZ7u0R89KJpYkpnU7d1K
         wsiyUbVl2ty8qkKWSTbnkrCa91x9zkL4s+SWLbVD0YYP2vDbQ5V4t93hFJfaWZGmL3pK
         ynDS/M5TqJH9uhSEhXYeWpRgUCIELOhSZ9FaPbTHVfDuS1vEsqIEbElrshnKUJ5j+iXH
         QBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772825777; x=1773430577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oFep3QUMArP/Mg+XO3iZqRWYbfwWlvGA+rkFHJ1kfo=;
        b=eFW42q/R2/FRtbzg7zhe8csNXfBBaaCd8Ss67U6V666R4GV4f0eKIoabt7jOy8zw9J
         4ZENMchjL0e0dpmq2ceFMiEQLXOIJwUECN89pJJKFLBztcQcg+fWehyLmraf738mHwcn
         pdV+bKcHrxGUGJDunmA/WQdCitYuL9Z+oOpm8BPh7T0uzBWoivThtd0Hpmxmsztg59LK
         4nO0j9eG+kx8czcWP43PeY6QLlrfRCtmMavD6Kc9ra/04trWbF4hnMPvrPOeB2mZLicT
         +R/7xiFOnuBtpFfFWChjEkKyWspq8R8iFt1h7b7yMYbm/Q+nVXppE91Ysqt72R050np3
         tmBg==
X-Forwarded-Encrypted: i=1; AJvYcCW25Y6geOpJxksBYFrDQ5wNDFw2hQrSQzdqMcAljKd3ghN71OxF5GRv5Z0m+Bqq0x52sXtuuSrwYVMaRIhmcmkC@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFh6+eYZiDhJ9kIShNnjWs3fJQ2KQdNvD7I+bWQ99/CmqetiH
	U0wXbNOgfECYufRF+5AfvPLDf+5k5RlLgrhMFAwogsEWUdSyL3I/4B5tfEiAC7m3CPxLK0bk//k
	I+PMtXudKZ1Hkr/J9wsqCkYPTrHeZy+U=
X-Gm-Gg: ATEYQzyvaligBvwm58WTkp334sU0RIMYqAcKnIqYaWDWS2JCvJ/4AM5kXqqFRTgJIvq
	XRdlKmNCPJqsp52oKJsnyap+TR+VgQo/t3Z6Rcm2YJ2T84Ly9i/3CCdSEuueyK73iOIWYPuCRUh
	wsgEXdtIJvO8Y8XbN452ewRnB3XQzEGlsOFCJcRU4DPkC9Bs+yFZmGU8vsiAmfSYGVXeEQbKyDY
	UVswZh81MqSPo7iMv4tm7tO/gcZvPPHvzimjZpIOEMFB7esJ1goZQQUhibTllO5qRil2XpSkKkR
	0Gi70Z42LgSaOqFvA+BX364Xtmy5LsI5MwIFpcxBBn81Weg3X2KeK7AX8HKIszB32cUYEHR4HEG
	M+SJb9Q==
X-Received: by 2002:a17:906:9f89:b0:b8d:bf38:7025 with SMTP id
 a640c23a62f3a-b942dcec7dbmr224391366b.16.1772825776547; Fri, 06 Mar 2026
 11:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20260304232848.469446-1-rosenp@gmail.com> <72e8b51c-4dcc-4c42-9e26-8ad8f9299c76@embeddedor.com>
In-Reply-To: <72e8b51c-4dcc-4c42-9e26-8ad8f9299c76@embeddedor.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 6 Mar 2026 11:36:05 -0800
X-Gm-Features: AaiRm52MbBKFLewPkU2F6yezblScaa4YRJUtrHXt3-c7p3yL5wyd8k_-nrQOniE
Message-ID: <CAKxU2N-+hE8BZ=cf3VF0Kkac8G9KWrmvQaCnWfcVSzv3MCm7CQ@mail.gmail.com>
Subject: Re: [PATCH] phy: miphy28lp: kzalloc + kcalloc to single kzalloc
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: linux-phy@lists.infradead.org, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/STI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_113618_811687_955272F4 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, Mar 6, 2026 at 11:28=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 3/5/26 08:28, Rosen Penev wrote:
> > Use flex array to simplify allocation.
> >
> > Allows using __counted_by for extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/phy/st/phy-miphy28lp.c | 12 +++++-------
> >   1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy2=
8lp.c
> > index 43cef89af55e..fd931ede7162 100644
> > --- a/drivers/phy/st/phy-miphy28lp.c
> > +++ b/drivers/phy/st/phy-miphy28lp.c
> > @@ -224,8 +224,8 @@ struct miphy28lp_dev {
> >       struct device *dev;
> >       struct regmap *regmap;
> >       struct mutex miphy_mutex;
> > -     struct miphy28lp_phy **phys;
> >       int nphys;
> > +     struct miphy28lp_phy *phys[] __counted_by(nphys);
> >   };
> >
> >   enum miphy_sata_gen { SATA_GEN1, SATA_GEN2, SATA_GEN3 };
> > @@ -1168,16 +1168,14 @@ static int miphy28lp_probe(struct platform_devi=
ce *pdev)
> >       struct phy_provider *provider;
> >       struct phy *phy;
> >       int ret, port =3D 0;
> > +     size_t nphys;
> >
> > -     miphy_dev =3D devm_kzalloc(&pdev->dev, sizeof(*miphy_dev), GFP_KE=
RNEL);
> > +     nphys =3D of_get_child_count(np);
> > +     miphy_dev =3D devm_kzalloc(&pdev->dev, struct_size(wiphy_dev, phy=
s, nphys) ,TGFP_KERNEL);
>
> This is bad... it looks like you didn't build any of these patches.
Missing COMPILE_TEST on this driver. Will fix.
>
> -Gustavo
>
> >       if (!miphy_dev)
> >               return -ENOMEM;
> >
> > -     miphy_dev->nphys =3D of_get_child_count(np);
> > -     miphy_dev->phys =3D devm_kcalloc(&pdev->dev, miphy_dev->nphys,
> > -                                    sizeof(*miphy_dev->phys), GFP_KERN=
EL);
> > -     if (!miphy_dev->phys)
> > -             return -ENOMEM;
> > +     miphy_dev->nphys =3D nphys;
> >
> >       miphy_dev->regmap =3D syscon_regmap_lookup_by_phandle(np, "st,sys=
cfg");
> >       if (IS_ERR(miphy_dev->regmap)) {
>

