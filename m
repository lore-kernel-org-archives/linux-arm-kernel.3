Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C3C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=; b=l2VXacyOTVKmDmOn0FXW/4um26
	73dKIuVTgz6Sgzz8QzX7agFhRVQ0+msZHaVQKk5PVOL0sYpRkp2jaMGzYuzG1yATtromU6q6v2Ujr
	9XwhP6gKFVP51VL5ySUS9+24R/7v/QjMsK0RTFWR/yZXZoKnVi/gu7uw4+cIBfZx70PL0X19epe5X
	NH+yD/kYvt2IhprsnDfbfJvTOGRwYiLrVvocU9vg1DFe+Jftpt7yB1YHxqduVbBVevxnhTEfx/8kN
	swFE0MEJtPunaKga62hH0VxsW3MMy627/NCfwoXxrAu41W+uLDS3Wzlqs9eW/zaISkMQ2M620g9XE
	G3lr6KEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9Dl-0000000C9yK-0wfa;
	Thu, 20 Aug 2026 20:18:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9Dh-0000000C9xO-1zgv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 20:18:40 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c1c52d920b8so38304066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 13:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787257115; cv=none;
        d=google.com; s=arc-20260327;
        b=qkRYDGvimXnDPrrUjNuxJn8Yd0MH5qvJIjlCw+RKImwdkzMl2Ide5IGWITnX5X0dCV
         bSdsDIrnvyaClKRd+whgHpHLe0tim6k0Ui/AB8DdEHh5SkUwyrkXCnbIVgWEK0QNgORO
         kc7E/qC1ZYOajbuugMF5biwXxcryWS9hrMp+kcun3bmBwkTfWJaR+TV6hLjeeJmHS4LF
         XpLdFQ0PztxDPDuyB2RjxOZInDhEK13/lhOkNTUOZwaadu7c7W6mYCfkE3YusGC5ykVe
         cozobcYTy/DYCH5yACrlZY6b4mnJjuo+23BOcPXT0Pl1XmULWyaOY5NkBlU/Rr6GkKhu
         oF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=;
        fh=ajG1wS7DZUmzqqn98fbjx9YeIUo4pjiyDWtHNBA0EfE=;
        b=ROP9l9Bn32iBsnZDpW6oEwg1kTnN94EX+mmjz2MvHURoxI6PPV4ktDKwHYCztPGn3n
         5iRVd55x3gSkGPKaxjbB2rKda/MaoPFWWf+0RQrq7rQWj8O/VjZGoJEyyVtV6sLqje6J
         Ftj8GCNuQeHD8zZXREu8M/e64fBvTeymvHcsYZ/oWyyUZ7H3ho4GM+9dL4+Gg03m9cJo
         mRgwEwFBnPeOQV2m0SK0mxEDPpTmf/HpgRti1canFzh+WFeUfWg8I+sAlqj/BUeerTP8
         IWv9ok7sRdxHeDwaAdmFHs2TXaaBaoEs2cARbAaWFvKPqmHRXBvfgB24ZAOqzDiOcmEM
         BnXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257115; x=1787861915; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=;
        b=eOI2b3YszeE/+KTuZSi2/decbn089dzgnz/6ToKDi6za3UvK+TxW26COpXGGa6mk5f
         lNwz6/YtiapoK5SNpgYbvqdynkPGehmr2TlsR07AgbSgjtJFGa4DPs0a8UBJ1uMOPmuY
         0/Isc2Wmmuxpv9aPImA01f0LMHmYXMQ8DmCIgasJm7vy+91WMtNjoyIqyQ2lPPo0asSZ
         B4DYwZ3CQ/DmaY13BLIPtwsWIdTbEBRTygABQLJzbmWl1AJD3eVDe7VoIcO0mLrYuyel
         ZKZUIVyi2V03/vDnhccwciyeZ6siAui/gHclDw/eDrscq7IapOj7OdZwiJIkyenlg2h3
         9EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257115; x=1787861915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juNQ1Ri6l95QwdEXhHnYdn7aFisOSy5EEtGzSyCI12U=;
        b=kmS+6mmn+vcA5ymnm25Jwio+OXGC/Qfhq21aiiLBiKE0yoeEdpwIkKiI8Lz/C7xOi/
         4KqhkfJLb94xRTTikxNt7nVzVQIgj40Bo6Dq7Qnbwfs88VHpUzrn44VoFHhUZw0pj5wc
         Sk0ARSqYehaSNaY1XrR7PtYIwLKpY4Ime/OR37S9/eVGJTOTUdvaHvvCL3yiTo/K26HU
         5+SOd8/4zsGCNspYGpooeGVEqe2Im5K5FR3ibTfAFbftw0W//sZV9a3hIUTMQVB3HIzy
         9HeadpnQbchDkMAR9KX0X0Vg0A9Wy6g31WKTuLLIsul9ay+TW4BErhdJrlgsPaIcYCBb
         Zq8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8qxy5BJJ5lKhB+/OW9CjiDJ85nhJG+lxF+0biasDufcaDMkk1/DEgkpJ9K/V8MWrRwy57FeWmTYXVdyt+UES7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr6DzAdKYmqIVVxHpo3iTaxFHfp7S5OI8eXLJ2741rwZ9wXWl9
	BIBtOjUdzylrX592ZE3zKy7dUIu7kzNYWx4Z0yfMdvO/rztkKJ8M0Yv/oYbab7oDa+EXjfK3IHf
	VYjbJfKV+Zx5NMDIMKpJcrxj8nKztGg==
X-Gm-Gg: AR+sD13oSFdmcyffYY64cCdZk8CR3NcE3ON7qOXKoFsKUky1GjMGg69U59NNMtGRZ/H
	thWLND4bVmEjsL2FhceTDQ5tdOHyYg4KFS8yxQmiCFwszF1DvkbEb+sNLS9RkOVE2rRM6GI9Sug
	tTdtilU6SQm0DAMLE0u1KiKnFxkIVEnhQV+qVo/pW0R5KOq5ETsS27IuCApITkwwiRkU6aGAf55
	DIPj5MaW5Tv4pF9EUVqfxNK5iWaXMgBm4o5gP0F+DnnxqCalvq6FNGjdHRP1vrUOygdWjWHdyFm
	0kZCdD8tFmjX+pyZtFVQE/CeG8hJRm1XOp7RKEMNIh9/l2Q1Cf/j9kGhG/7eTg==
X-Received: by 2002:a17:906:ee89:b0:c20:f95c:9088 with SMTP id
 a640c23a62f3a-c246a30c3b5mr104918666b.4.1787257114733; Thu, 20 Aug 2026
 13:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260818182829.1580811-1-vladislav.karmanov.dev@gmail.com> <aoSnqurLLgdVT_Eu@makrotopia.org>
In-Reply-To: <aoSnqurLLgdVT_Eu@makrotopia.org>
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Date: Thu, 20 Aug 2026 23:18:23 +0300
X-Gm-Features: AcwNN1UY78trrCBEnBsV4RrWx-VvGxpQcnmILGMnFCzTNSxNa9AqTH-okMtaf4k
Message-ID: <CADDoYm63JMq=5CyNvqkTo65BgS927iURKMmhvhD=B-ytqq3Ygg@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: mt7530: do not advertise EEE on MT7621 switch
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, chester.a.unal@arinc9.com, dqfext@gmail.com, 
	sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_131837_552342_591C37DA 
X-CRM114-Status: GOOD (  38.51  )
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

Hi Andrew, Hi Daniel,

Thanks for the review.

> Do we know what is broken here? MAC or PHY? If it is the PHY which is
> broken, it would be better to put the workaround into the PHY driver.

It is the PHY that is broken -- the MT7530 internal GE PHY (PHY ID
0x03a29412, driven by mediatek-ge). Landen Chao (MediaTek, 2021) puts the
root cause there: "EEE of the 10-year-old MT7530 internal gephy has many
IOT problems, so it is recommended to disable its EEE."

That would point to the PHY driver as the natural home, but I think the
DSA side is actually the right place, and af3b4b0e59de -- the commit this
patch fixes -- is itself the evidence: it removed the early EEE disable
from mtk_gephy_config_init() on the rationale that the disable done there
"is somehow enabled afterwards", i.e. a PHY-driver-side disable does not
stick (something re-enables EEE advertisement after config_init). What
does stick is the disable done earlier in the DSA setup path -- which is
why MT7531 does it in mt7531_setup() and why af3b4b0e59de considered the
mtk-ge disable redundant for MT7531. The catch is that mt7530_setup()
never had that loop, so MT7621 (and MT7530) lost their only effective
early disable when af3b4b0e59de dropped the mtk-ge one. Putting the
disable back into the PHY driver would reintroduce the "gets re-enabled
afterwards" problem af3b4b0e59de removed it for. So I'd keep it on the
DSA side

> I'd recommend disabling EEE advertisement on MT7621 and MT7530;
> Hence I'd suggest to extend 'struct mt753x_info' with a 'broken_eee'
> bool instead of maintaining an in-code list of EEE-broken silicon IDs.

Agreed on both. ID_MT7530 (the dedicated MT7530 IC, e.g. BananaPi R2)
uses the same mt7530_setup() and the same internal GE PHY, so it should
be covered too. I have prepared  v2 that adds a broken_eee bool to
struct mt753x_info and sets it for ID_MT7621 and ID_MT7530, gating the
MDIO_AN_EEE_ADV clear loop on priv->info->broken_eee instead of the
open-coded ID check.

v2 follows as a fresh thread with a lore link back to v1.

Regarding older Trendnet/Econet SoCs sharing the lineage: I don't have
that hardware, so I'd rather not guess the flag makes it trivial to
extend later if someone with access can confirm

=D0=B2=D1=82, 18 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 21:43, Dan=
iel Golle <daniel@makrotopia.org>:
>
> Hi,
>
> On Tue, Aug 18, 2026 at 09:28:29PM +0300, Vladislav Karmanov wrote:
> > There are hardware defects in the MT7621 (MT7530) EEE support: with EEE
> > advertised, some link partners cannot establish a stable connection.
> > Notably, on a 2-pair (4-wire) cable where both ends advertise gigabit,
> > 1000BASE-T training cannot succeed, and instead of falling back to
> > 100 Mbps the port flaps in a loop and no link/DHCP lease is obtained.
> > This is confined to the WAN / phylib bring-up path; the DSA/LAN side on
> > the same device is unaffected.
> >
> > The MT7530 internal GE PHY advertises EEE by hardware default. The
> > eee-broken-100tx / eee-broken-1000t device-tree properties only take
> > effect during the late PHY config_init path, which is too late for thes=
e
> > link partners: they negotiate EEE before the OS disables it and then
> > fail to fall back cleanly.
> >
> > Commit af3b4b0e59de ("net: phy: mediatek-ge: do not disable EEE
> > advertisement") removed the early EEE-advertisement disable from
> > mtk_gephy_config_init(), on the rationale that "disabling EEE
> > advertisement before the PHY driver initialises keeps it off", i.e. tha=
t
> > the DSA subdriver already performs that early disable. That rationale
> > holds for MT7531, whose mt7531_setup() clears MDIO_AN_EEE_ADV on each
> > switch PHY -- but it does not hold for MT7621, whose mt7530_setup()
> > never had such a loop. So af3b4b0e59de removed the only early EEE
> > disable that covered MT7621, reintroducing the flapping on MT7621-based
> > boards (regression reported on ramips/mt7621).
> >
> > MediaTek's own recommendation (Landen Chao, 2021) confirms the hardware
> > is the root cause: "EEE of the 10-year-old MT7530 internal gephy has ma=
ny
> > IOT problems, so it is recommended to disable its EEE."
> > [...]
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -2518,6 +2518,15 @@
> >       if ((val & MT7530_XTAL_MASK) =3D=3D MT7530_XTAL_40MHZ)
> >               mt7530_pll_setup(priv);
> >
> > +     if (priv->id =3D=3D ID_MT7621) {
>
> It'd be very surprising if this limitation doesn't also apply for the
> nearly identical decicated MT7530 IC (found eg. on BananaPi R2).
>
> I'd recommend disabling EEE advertisement on MT7621 and MT7530; and I
> suspect that some of the older Trendnet/Econet SoCs which share common
> linage with the MediaTek's Ethernet switch and PHY designs could also
> be affected.
>
> Hence I'd suggest to extend 'struct mt753x_info' with a 'broken_eee'
> bool instead of maintining an in-code list of EEE-broken silicon IDs.
>
> > +             /* Disable EEE advertisement on the switch PHYs. */
> > +             for (i =3D MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr);
> > +                  i < MT753X_CTRL_PHY_ADDR(priv->mdiodev->addr) + MT75=
30_NUM_PHYS;
> > +                  i++) {
> > +                     mt7530_phy_write_c45(priv, i, MDIO_MMD_AN, MDIO_A=
N_EEE_ADV, 0);
> > +             }
> > +     }
> > +
>

