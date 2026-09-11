Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F1C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=; b=lh6yYytT0XAhaEMVB8nM9YOvDY
	8Zz7yV78jpuIamjtQaDA4hW0LOEre5HzhlAoHASsyKGr9ivgDclUta005SrP5Kp/uf344rTn2fPXD
	KuIBCnDBsvj37BIpt5oyxi7vcZjqcDgjdD98ppLznpsRmmzIICoP9jzxY1ViEW51sWaUx1bfE2cAJ
	kKs8wqzlbtlPa7Ss3x/2HylyPCsu/xqvw76Am7MAYoIWRgFtKTKdhCxUS2X24mQQDYpFcvmNF9DwW
	qxDXJKnFfLgn0K+7R6v33m5NeryeNxbZM99DYmlZbH+0cLKdIJKopF+7nb0Mauki1OJmQtUtAIgtS
	B6AXAUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56Ky-0000000HTqG-3lTS;
	Fri, 11 Sep 2026 18:51:02 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56Kt-0000000HTpj-3Gof
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 18:50:57 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29703cb470so52135266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 11:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789152653; cv=none;
        d=google.com; s=arc-20260327;
        b=sHg6fPL+0F8h82ByEgj9zoTVfzoR4sUbnFJJ1rdxdnIJLbdFLF13m0VeLNy1CEkfR9
         e2zpSZkjXKvMVgbjFPhKFRJ+1qm+QEvY4CrD/wn5oCoPbawBeNIl06Xw1AhtK8Ar0RFp
         A+01CpwMLyimZnxG9xRP0YJPqjGnc+7WWUEfkf+K0MAI3roFsYGlcSzD+NxlqQHA2Qot
         KpquQofWCSpij3th7t3f5sS8s6dTIq7karAs51s+YCSYp+DD5RHaisxNpYlsgabMpvIR
         79dAwuN+hAvz7RqbVN4+pAmuOHSwb4QLM1UuQM4A+Dp6FTRqeO7QgzZu4hln1SZUSZd6
         oHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        fh=4cLoCAzRczpVUMhkKEcEG4gAUmYqdyjRzEDHwRlj2Y8=;
        b=ZOQIcHCTIPfBP6eAzsHyppJbpnQAwColGIIunTAkVyhuxhuCA+6VW1lxQS3YB2ve7e
         UyzIqCoGDXvgStziNihqDu37KAbtuBy6FmcQgwySHMiO7A7xreAsWxccae7DDGcsGQV0
         ahtcdrXZgKtVzg1xOIOafwpooT7H/DQGXlpsqSE7uoEppry5nN9m9NuiCw2SBHd1T5eT
         dmzzwUAxKDmNcJtAUWvE7dAUFzQBpN6CayQUV9HnyjC69hikh222+yiZIWVZj0yZoX2N
         t91QUGZ/rWL0wVmB9nkKPEKdEy+fhEbNEi7X7Im3eKJkB4Xo36NYqIdLid7/6+SDfLD0
         IucA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152653; x=1789757453; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        b=bYK6OZCnKmF3v3dfWk6lBe7A8jdio6BIW/SXwGTh99JAyRu9sIGkIOGnA3ZNrTl1ye
         K/EkY9FmAud1xi4ixFtgCTwJ3hqQGZWnzhvyHR503nRWDo1/mqgIzyiGpKvPufeHHFTM
         VACawPHAcW9amM5chnV5aLJTmO0367zfYPT+fRwJ1HjqS8QQG3Tei8rovNTSEacb2guu
         gM3Vd1jRCOrpm78j6Kh2ELIRHYMticCHaVVvqb+4JxjNvkQ6WeG524o308JZzLNpm6gY
         uNa/rhmMT4B0RXrecAU64AjCgAMcEYGnpR3GWps3Y4g9LK5S7eqEMZLDDspY5lLiVwhP
         W1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152653; x=1789757453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        b=o/miTYsi21feSoBvJmQXxoBlLP0Z56lg08y+sR+vaHVI5c6aQ084YP04hANlzq4jUA
         286rfxe/PPKOngaW+whs9VToDqI3PgVyOAw40DbZ2te5edumIyEZwsoBgjecuRIDdMjy
         dOUTRror96jSQtcSTO6scYxpyK8QYoj0ILn3M2vL28jhfdjiR/R24Bk1kubzBcrQH+ZN
         5z+DUsL6ONvS4KYuFrAy2Wnx+/NsNqgmJN68OBkjvypTiavJGOQPJSXtWqfX7tMGJzVo
         OohuyA0Rm7ToNsVuN0YhKAg0+Gq+QapeF64lPD81W6l6udTGh0S4w61l60fN4rRjS11W
         yAXw==
X-Forwarded-Encrypted: i=1; AKwUvByvsakv/skXebHgpboYH9KTYXI9vF8fzqH2xR8uuIBg7jmae6u/Hmahc1flVYGLLsl9yy9kvSPOu3nIjoDdj2J3@lists.infradead.org
X-Gm-Message-State: AFuF++mgh7EW63a6GRo+PrNwEuwTr0UHTRDqzC8v6glkfLzxvTHXaoQd
	w4oBLz9vMR3VVpfq2nBubMXkVKPl+yKi9mQ0iTTMoQzDRbr6y8hnvexBniDzebograrO4IU8Aa2
	4N/JQPG/vTSlfeR3tWeK3jcguAyrwyzs=
X-Gm-Gg: AYBFou1/FLjoRUPDWgeErmJufFHUDxEvDOcPNmR4cZb5vWnGaHuq68oERViNT3szm91
	Bo74svuZHnCtwUE2t9n68hhij8JYOOVVt2Ti6sdx4bH0FR4bHInEVALZjVlY7DsEQrawZgnGOdH
	JEWxycOrI21Cb1gufKtEdZpVar2XqD7jjR1YikINHuG1/+GS44AWsrs8Q0iqyxJuLW/yQz9yvXO
	HDAvuJhkeSIFvw1Dks424eqqucR3lH3rY7K1lGROyeWXEZnRu1c4IWjlDJAGLlua9byBdqX9psF
	YVbeqmnxBneT0dlmHAxSPJAtbU4Kv6fcxzyAFZ+LD33bi+keURceXWhYLqsij0Uch2blIFMnVEh
	Tdl6YQ8AANIJt/IX5KIlcTnKkD6eAXSzl711OZh7/b0IRomqniGGqkA8/Ppm2UifCU9JBYgUbde
	8DIvuUU2jWNl9u69oZCTRfZFdkODXpkbLB2O5jGVjCRY8zGS76HvGWFobZ6OpRmThoD1L16lpYD
	L7o
X-Received: by 2002:a17:907:7211:b0:c29:53ba:a4cd with SMTP id
 a640c23a62f3a-c29666f90fdmr483569066b.11.1789152653082; Fri, 11 Sep 2026
 11:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260910001209.116465-1-rosenp@gmail.com> <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
 <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
In-Reply-To: <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 11 Sep 2026 11:50:42 -0700
X-Gm-Features: AcwNN1UBWpQbvDkHrDHhG5kJOPM-dImHVyKgKakwlCkD2k7qVSn-bXfs2dvbyzk
Message-ID: <CAKxU2N_Z9OHUx4LBmxU+8GZ3_vFYTVuCt04P4XwjyfkRBZ8AOQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260911_115055_837517_83464939 
X-CRM114-Status: GOOD (  20.15  )
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

On Thu, Sep 10, 2026 at 11:56=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> On Thu, Sep 10, 2026 at 9:46=E2=80=AFAM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> > On 9/9/26 17:12, Rosen Penev wrote:
> > > Add it and set for gmac0, which is the only GMAC used on this board.
> > >
> > > nvram size found from a random bootlog online.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >   v2: fix typo.
> > >   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 +++++++++++=
+++
> > >   1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/a=
rch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > index c80ac16ad949..9ab618a097b1 100644
> > > --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > @@ -25,6 +25,15 @@ memory@0 {
> > >                     <0x88000000 0x08000000>;
> > >       };
> > >
> > > +     nvram@1c080000 {
> > > +             compatible =3D "brcm,nvram";
> > > +             reg =3D <0x1c080000 0x180000>;
> >
> > Why is not the nvram node moved to bcm5301x.dtsi given it is common to
> > all of the chips?
> To avoid probe errors on hardware where sizes are unknown.
I looked at this again. It makes no sense to centralize:

+       nvram@1c080000 {
+               compatible =3D "brcm,nvram";
+               reg =3D <0x1c080000 0x180000>;

The reg and @ values are correct here but not for all devices. There's
also nvram@1e3f0000 and nvram@1e1f0000 as examples.
> > --
> > Florian

