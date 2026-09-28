Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4B5C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=; b=vvYLoyDv/aqD8FzWing67IDVTS
	FLPFB8c0uk9FzyRojrl6VRiOaZo/yusgyRdQha1D5qPU8PJxUqh08CvRn8U44P0P+AtuCgjPTyExK
	RPQIygLyO748FKGa/oTMfqJ0oEbChyBZ8kyjCXJAv/MC03Z3fRMpSwVD/ONwX+4irFwwuqdqgKn+4
	MzIOjEh07K2M0rnmgtfjvhhUlFEbCGjvvbj4Z+u4wsTT2CEbhsfuH2fxh5jp6Ql0iVmk0yB97egQp
	whPx2+Y41eWj3IQoWtgWZPNoS6b6vZtU70bTfYx36lEwlFrm3E+rN3nR+sN4ZaHkqHBIB9INVyNLC
	gOCeQR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAVH-00000000YeM-2uKq;
	Mon, 28 Sep 2026 12:30:43 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAV8-00000000Ycd-32BK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:30:35 +0000
Received: by mail-pj2-x0c.google.com with SMTP id d9443c01a7336-2dfaf76605dso5485305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 05:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598634; cv=none;
        d=google.com; s=arc-20260327;
        b=QwyOuZ3qTDr//qQLzxJ4g0dmDEkyxI9s1xZ+aFuNlBQNe+jT240ynTzcWm6TcRSAOS
         ub+2YobqVZTfQni1OWy7a0cSLfQli9+KORIyBPjvoCBMNQlxn+VynBB8nGToslasKvc4
         bh93wC3fxjrLmJuDqxiK3eXgAOtOtOZYCqFNcZqeuQh2O7BT5oTOevkG+QEPWslLeOVe
         0oq9+OyK7MJja3NbCr/eaGN4kHfspMbhxxkIeFqnEIqCSp0MVkiS0r6e3qZLLt7N0ogC
         b/SgQZ+p9hL8GJhCxTfyMFFMB4E3sQ9z0TIUtt6HfiH0NnGSE1V27b+xca74SduxxbFX
         n2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        fh=J32mPXhLbAOqityNnad3/FjeDepSzUQv4eSN9EhsLws=;
        b=IC8WJ9DfCtQ0k0qh06zwLMfyUeT+mbvFtQ5fTnPGlLcR2hqqjAK50/vpk5aHwQtXLi
         e6wurDqh5OXzA4s2bWD2wJJm3Ivy1nTAY0G73fiDbKeNs/ABreTZ24yAIAcJJLC72U1i
         frpOL+xUpMFoW5tstzpiqX2RI6BtmmVEavssgZQmOZ8f/Qqw3lCwgKGVvGjiUZsafBWg
         PWE8DJgTxSSCKKMKaGw1rBLXAjYmcFdcboQBGdftNOitqzwBrzuWc4Kcd3IrP4uHq/4N
         r+E0I2hs+jmaGuMcIJJ6bENY7OiKzbTWkz42h1N32KAG6BWhtcVWm7zG435c4SKA+BOQ
         0+rQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790598634; x=1791203434; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        b=YOj7g065S8t268cC+JfyYOPDaYSAMV5XNYdcuJkqq/Gs/5uG7jd8DYdO/scvgE7kGl
         O3yPoRw42QB3YcVNfGtzF8nOkXiDKhzEdI4gyWqngrxOsQuWlvfMogZ4NXY1GTKedJ4d
         N+5oEdRTg+y80M+SPIxFovLYHlzRbkZX3GL30zhntFZ9KRueWE1gHkYzuuvgJfN5pZRj
         m6Begg5GDz9xSom7rUZ8TcmNDJIUMz2mlZPjaKzffJW1AgbnAC9GwvRgg9LD6FCwEvLc
         fUOfZQbP6ydqb2ZdkYCZpqZYTSjATVer+qtSdDgRBxTnWydClqoUOA6AM4IE+20jYm/L
         c/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598634; x=1791203434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTyKOTKAooo2ab7rKhntAizVnn77+wfpctlc2hgSt4A=;
        b=mplhuUZLAy6ZuFJ6QxJ8QkyQiPiNE/gZJFHcumfaI10oHvmdgqSlpf5bfUzOo67XL7
         g1w4wbhTH8iLaxesxFL6U+xaQT+Y9nuLuKz6JfJWxRwy4KpnpvIRnkYXwQSfiySwvEMd
         1nqLIuI5MIYgh48mLucipmcYJ1iBD3HpTb/WlLl+gP8K1iZXk1Pubgxd7vdj+RrTtwQi
         xUV6mJoCSfSyC6bqanvY2DbnejAW0TRzjE15R8jNaCVn2lCRqwHj3uu6TCWcBdgBcYWy
         9POuEDgT7ybeHekTfBsXjIIwB8syajJ7Dodt6Ajr63QnQQ6MoL6R5vfCEvBa6AkM+sZg
         jflA==
X-Forwarded-Encrypted: i=1; AKwUvByUgeZrcPe4x6csgcwOUcjnvhE4DBloq3WLWgS0MdVBdsYS72XCvox+RYXhXECVufhfjoOIbnHT6yl7jB7SPB+2@lists.infradead.org
X-Gm-Message-State: AFq9FYLYRTTDpwHRpdskWlWCQfkc10MYyGwW9u7QlFhLCLSFWS2WKzYv
	8gzhhGBbVrOGVOfpBXxjXtLjESYUUFJwQdsk9gaJuRzTCY5B9vWrj9beVfFi6MPWL2zRRjfXKo+
	dmlos2cA7LgS1BBStbYLYYYYMda+jBRoKu57wSlSzWw==
X-Gm-Gg: AYBFou3egsZuCHekX3yfioeApF5TtcG5R/HBqZmtZJ6EG/jMUC0LWrrvzva56RW4eec
	Qh54rnc6mnY4XgnYG8DiFAGqXmVu3xOIVWMvv+dCWmYA77sJHpz+EzIy4kvO5ryv0SzWRsK3cpn
	tP8i0Hq82jHakAwqqX+IvMs7iydpLNc9mzeBoiFDTFGJp+yX063dSaNbOMjUqwdzmw/dBqdxYM3
	hpgRGLLioYX/kB6IBIH5REqzimkuxXpwffIhH+2qiTZDTVYnpbCdKmNdhmdne+3wdDI3Ea7eUvF
	33gGjLUDI85ekNQjrvhOKTbS2eKJ1ZuIMzcAhNLOPBFsvGBNWetFRd+y9wBclDx3IZm/jXp3VgE
	9jv53w0/OTIVAjqeV7oaue6A/W76uA0CLjoI=
X-Received: by 2002:a17:902:f54a:b0:2df:736b:d7df with SMTP id
 d9443c01a7336-2df7dc59ed3mr102946795ad.42.1790598633625; Mon, 28 Sep 2026
 05:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-6-robert.marko@sartura.hr> <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
In-Reply-To: <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 28 Sep 2026 14:30:22 +0200
X-Gm-Features: AclHuK_ApYIEoqpVKRFrihxpibz6Yiy03tz8KYmapFitKvFghmCeqBLThyFR5Fc
Message-ID: <CA+HBbNFRufMuhuSiPnJSgSMrGMN6DeskS3kLLogwHk97oHzx1w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, adrian.hunter@intel.com, 
	aubin.constans@microchip.com, ehristev@kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053034_766495_890F4953 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Sep 28, 2026 at 10:09=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> On Mon, Sep 07, 2026 at 03:25:33PM +0200, Robert Marko wrote:
> > Enable the QSPI controller and describe the onboard SPI NOR flash.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>
> Missing '---'
>
> >
> >  .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/=
arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > index 4012ea7d07bb..985ca31e74e7 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > @@ -463,6 +463,21 @@ phy27: phy@27 {
> >       };
> >  };
> >
> > +&qspi0 {
> > +     status =3D "okay";
> > +
> > +     flash@0 {
> > +             compatible =3D "jedec,spi-nor";
> > +             reg =3D <0>;
> > +             spi-max-frequency =3D <100000000>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
>
> As sashiko pointed out, #address-cells, #size-cells, should not be
> necessary here. I dropped them and applied to microchip-dt64.

Thanks,
Will drop it from future v3 then.

Regards,
Robert
>
> Thank you,
> Claudiu



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

