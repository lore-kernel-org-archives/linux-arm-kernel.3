Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5D8C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=; b=DHYmd/S82mdRn2ToKtOaSeq6Ke
	bomziOIpA78iA3m6hjubbrj1tPmWtl+QsdrMpXk4DBfc0ZCJI6o9maqfuBUFl5E2P6XztNIa28bM6
	uE9f9YRKrw6WZ2h1BnBGQDSLHGonhYOQy+L9yt7RN959yUhuu9JFKO/jFxL718dtEOyYspDy7+sja
	BWYiV1UxovBlXNimzrCxyMJoQU5w0dbD+4hHvsMLjDdZflxzspagfCcbhxiE3GPhWK761pP6SchLo
	fLBwmHbcmbZCKKnyTXrowIyii7dYIlxpuQLBRPRt31ZjNbUjCGOwE3aF2Ou7YuuX2ouAjV7QNpiSe
	n+N7xkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jx8-0000000FD76-4BaO;
	Thu, 10 Sep 2026 18:56:55 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jx6-0000000FD6X-2nll
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:56:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c1c52d920b8so20665766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066611; cv=none;
        d=google.com; s=arc-20260327;
        b=ULFbw5CB8Vz1xmT1c8fMnf3Kc6ugwQwBXWZ8TArEfCLNVQIxwkMumYgXHfvkucqTqU
         20gXLm2tqEoPigmAT9ZFVrousEERIPp7XWC3RmmDEUwghcSjv4cK14tG4LuKHPI/6fNk
         7/DO1nNJVi/WqfjAfwxKXRAROgLA0asbajpXE2yjxmK8EWuQ+7iZ3+Kl09gmkfec9huk
         5Vyje/w4+KuHygiPSYzKg17X/5XkrWbhcWffbT829g0RemcyCiliSpYDa3YRbkq0P2X2
         0PV5kEnzdw+AUp20K6jX6MXg0FzcNR46veUzvNajK4S49NZjs6td46L02uvnOdiD/3dP
         AIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        fh=UPFPrYqOKICwT10HYxSNo4qx1ctQdAECxfdhc8Sj5gY=;
        b=rzEA/l+tXD/TRMFV7imO7NwiGLjP4purCJVYF49vU/Avfn4bA8P1ZqKmyqthxoYLKN
         r6mi0rrQrmffNSmfS40BQ5PjBdbbB8rdeLL2myZrdDeSqTMHPCstJAJMzaoQXd3znj0s
         2SLF5kMWo2r6aWkM8j2mSm0sTeOgZqhEWDhG5hmAcZMFMvKqwx4x+Wuv4ndANmutKWGa
         HO0ID3F6s919dgY55CxqgkcwEar9g0YidBiz+JarAPr5u7tfkqIR4JtEsMydiozETMuO
         UcNAm5rbmQlfRY73BgevpUurh5+WamVXmD0OP+nNoaybGoIqNgv+IoZssSJzuMkxcV5C
         e+rA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066611; x=1789671411; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        b=Ts7YCbN+mDsYYt2vYMLV4DDIizvl20hiK8j6SLqmg24ETL2rDo29wYq84WqydLQgG5
         bjCs8rcm5u7+5npLlig/J5Lwktcb9AQMjc8fbSCyNYBPDa9CnrdVL1//w6IIu9MJPj1q
         lEVuCUc2omLQMR4BFATLzcrgkQOlRdwuEfY6pw+i+xgcyX7pQnZRhWQ92W79PXrkG/yT
         KJwi/n0h6uD00KDZiz4G0DHr6WIuDuoaXBWCF4etXkN7lVABZoUgnrKBn0EmNpPkiUH9
         zrQCyOC0vHAbL/O5kqslL+Ea85QQTUd7iDevzlZ06mvt4ZOURipjtefWFK4BbsUIkD/R
         DyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066611; x=1789671411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        b=YNKYg+nbyRnguYVU3LUAEhLpc93EA9qIGdPZAJGKWqgaW5X2ePYElPCxQsZtw29OXC
         8FFSPoVs5MHKDDsHEpJ373vxdi9lx4p/d5bmkurmvX+ANZGKea3+g6mpa07O2c7AL/rE
         x5lPtVsn/YDES81qsfEyz+ab+5NxIZAXAOqlZJ/j7K0+2/ap5C7A71Ct3J4eaeHzk/DO
         5Pw0udLBxm3zBtP9Euy9MxGZasmmd69nXsdxgHwE8S4R3iRfTQ7ocSPEom7+lsbDjui/
         l96AUtkGWDf7W/s+Jv48+6vbzRC2oRbBVq/h0YIN9Q0dJOgkvHUiJtJZHCOeTnWGAqdk
         GoJw==
X-Forwarded-Encrypted: i=1; AKwUvBxrRZS71uanoJSU6iauJCG+v0GNe7Vn9Lcky+XJRkZ4jhFtVv2fuslw1lhvx3rkNXHW47UebXepVSTzYQFQRe60@lists.infradead.org
X-Gm-Message-State: AFuF++n8bemuBHySaoasvjHwOOZB4/WZur/ZdaSTvPOE+ximEPyN2vhy
	gnSc3DrDUkhfC9vR77QNAlr/kji5ziksmiT6b9qMnupSrCF0eYxGM/lw+Nze+XRiG9mcd0ai2WV
	JMkGVX/Oqm4e39zy+wd8Be/C8L0Fuo0E=
X-Gm-Gg: AYBFou3fuyxphH0yFgg5uEJIg1yqX2nQNeYKoTirIUnWCJvpjrGpSzMZGp2XbORNO1W
	nek+w5oUSrvYLOIFa4EvGvX2ToSM3wgCNqjYXsdhNGhSgJojAtD5vgQv27RLXI64/xq6exOIgxq
	kTqzqEoe+FIOHclHJzhYVlm9FCgKO8fLesuTU4is+3oGJFi5WuUrlHZLicK0nJsyVv9nULquT5f
	nTafKzTvChIUJV5utJJV8MCIwv1riMr+xtzw5DCb73zMAh80dOuS1V8bj4MhJ6uvqR3nMpDFd6l
	us3yJu+9KBfjCpqDvjbzMT/v9QdpHLSByo9SiQTcYjTvR8SWRVPlEOGciegqx14pgSGNRmE+VjP
	3ekJKyNISrt4lFHCKBJnV/4ProIo+TAKRoaz+AsP2JsybpnUm26xPJR7dh16IqY0g/NQvPM2yW9
	JzD3mPooe2M2H2PTrgLzD5XheFwOF0KHHxP+a0Qk7CZ7j6SLWe2OZTLbQhPzm4J8LTlQ==
X-Received: by 2002:a17:907:3e87:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c296668deb5mr944166b.30.1789066610568; Thu, 10 Sep 2026
 11:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260910001209.116465-1-rosenp@gmail.com> <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
In-Reply-To: <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 10 Sep 2026 11:56:39 -0700
X-Gm-Features: AcwNN1V6aaA1o2c79sKoypMBaKIL_zofsrFDIKG1O8uwY83YC9Mz1J-mEf9e4HU
Message-ID: <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115652_731146_040D7E47 
X-CRM114-Status: GOOD (  17.19  )
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

On Thu, Sep 10, 2026 at 9:46=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/9/26 17:12, Rosen Penev wrote:
> > Add it and set for gmac0, which is the only GMAC used on this board.
> >
> > nvram size found from a random bootlog online.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   v2: fix typo.
> >   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 +++++++++++++=
+
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arc=
h/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > index c80ac16ad949..9ab618a097b1 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > @@ -25,6 +25,15 @@ memory@0 {
> >                     <0x88000000 0x08000000>;
> >       };
> >
> > +     nvram@1c080000 {
> > +             compatible =3D "brcm,nvram";
> > +             reg =3D <0x1c080000 0x180000>;
>
> Why is not the nvram node moved to bcm5301x.dtsi given it is common to
> all of the chips?
To avoid probe errors on hardware where sizes are unknown.
> --
> Florian

