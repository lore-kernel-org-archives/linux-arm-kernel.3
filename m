Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99209CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=; b=g/A0A9EG3ogPaFMPuch3JM3ou4
	JxP0l5/ApJtUoo33ruNufM1LiylYqV+u7pBSpkfi1cuFqSha9HMsvMhU1yB9Xw69xl/6Qdfda2kKM
	wWsR9kohUgDw8hPgPzaOuap0oSwdhOLAugnjg5RURVTPlPTuRs12sWrOctIePUnzUmeuIczmX19MW
	LNA88dRbWJTbwESZYgdnsIF4RgMPr/7Sw0MVg3kOnkrUO/PT+Vm03WNZ42N0DQH7ZcZEy6WhxoxTG
	V7cOcprzO7B+kX1GvozACWRNqZR2dACc1kGxylB4nSLT2jso8+z3z4RSej2mSvrkK32HDsfft7HXY
	yaD09wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPpo-00000004kMB-0Qbl;
	Thu, 14 May 2026 06:46:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPpk-00000004kKn-1nVe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:46:14 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso14989125a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 23:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778741170; cv=none;
        d=google.com; s=arc-20240605;
        b=d+TSU1qP57HoKNTk/Rtadlr8j+km+f81elyb0TWdhoUCmMfkGA4K6Z3yDH/d1JrfLH
         vjteXVl+chTxoFGAZPRjp5QtahzQJlCES73y2V2Sulu0iXCaAnV5DcMJ4F6qFiEMnXSA
         /xogosDZKmKgUEc6VqO0obsmvSE+/K4aHyPiRzNm4Ixo0zgmnWbLc/0NdPidL5dC9bSF
         Jx4q31SPbNsMhA+lP/7B6U08+FRF7wZqfBQwBG9zoMTTopL5ghX2tLmRSDhLmNp0wqgm
         JO6/qmwotliim5RhDa5z1HmFUh7XvOG5Uce7wdhXa9e9nK99JyQBDIkT4x9NkzVO68MQ
         T24A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        fh=oYS+QxAWKooc5TRsZD/5Vpb2s5XhTgWvJ7VJ2bY+0xk=;
        b=MhvNy5Kl5cQkH08nbXrduqcqmzO83saDv7ulgQXAyAx+RJCdl0niaL0zo/FOLYCQp4
         74/mNnDQXr3zvQvRjeDzgy7HjMQDTwB16TZ3gosM1zZeAKLwyo2WjTcLj4utJPHXg3Xp
         pM7HyFNaTmupW3MpZ6xJ/OTnLZj6R+BS4y6jwc40KT8dIyn6ks9WsweGriBcsBtMCiWq
         eylPn4WNBEDnvom7gtDFFWKZNkp2ETtmMP15OecGMVoOIrcIj0mMZ42e9IXPnaWjLOha
         UVeaPgs34bTQxPWHWKyRDoiX8C6PauqrwMJ1U++eNzGHdMtBBx/aHDQpM3d8klD81lBr
         2yrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1778741170; x=1779345970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        b=Qv2vh/uc2/Rp/CYszwM8Y+c2Vt72P03CE6q36ZLzAyOlUny35QkwqwrW8whjopivrv
         P35khQtaAlPp8j443z6XmIZTyeSJiya5QDnfdSH2OrydYaIcN38uGlCrH0DII3dHIO0D
         TTlHrI6jVQP3PCbWxYvKnNOeEOUXcU43q3/X70ub17n+jJOIda+hlC+oDmsSHSYB7jky
         ApLrM44i92KssK/qzVxvGnsi+NxSLDB1taEC8s1zYKdEZBb6UE1ylzkIPWsmh0yNGlVQ
         FBcPhBYeX1mQZuR+QfKML5hcEnZOgAJ48G6oqGCnTcEXjcHHavlARVU3W9xiGxicGAkN
         LjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741170; x=1779345970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwWW1RLqow3F42bqTyKYH/fkZiKfkBMrFPf70+Vmgkk=;
        b=TWJXRBJbmIqPn6TSDUueft5/8pEcBoPzof3faRozwnSucP43+h9iC8eMv8X0Dbh6do
         PQpBZ6M0zmav2QNjV1EwS1ia7UtXJBUEaac16XudhD7D4najgEfFl4w07p9Sju0/1CCs
         XEi7RQjJdShO2ykFoZkwxbXgZaVB0iUuuAr+/UFviAlV6fFOcVsZXsnNKyyn7F7yPTNu
         hrRYamKVci7wsY2a8vfsV9YtSeWUqJEnaFr/DWLGW6vx4bYoEXIx9tkMRCc/4UNDeL1l
         qPYizd6HGxPPWiuv2iYRM5aw33BxU9bm9ImVvo9wLxCs6WI3g59t7cxgYcPJNTRmCGqy
         a7YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zH+rZ8libwm9Vo0FZ+5G6CyFP2QV6G3a32Ce5IWHe+Aa6HwzRT5usZEVhYcZa8is6fNTRtBUKDV8yblFGCkg+@lists.infradead.org
X-Gm-Message-State: AOJu0YycPWvH5igqHfzI3a+F2mxT3uMFLVFVUQWjBb1BmamIjn44iEUy
	9lY1vfx2aCmUhMrPnEsmG8iSBkY19p9Lm0ladw5oQB50Y0stBw0UedkR8w2mUX2ahLXX9f1q0or
	AnV/Wwa+1rrhfMMnQfoHyxZ+Cdm+bkSlzswS2+reelQ==
X-Gm-Gg: Acq92OFqWJF520IzaKxX9T44uiyMg2NhCHZlO4dlENXoo/jdfz0qAlEFAtuVatKdk0X
	VsjxuDEPYhXKalLkuMEwkATWhVvOUzY2NdNz2uoEz7NFnh01KFPP6bVIjJ1zHoF8kk/yxIGpzOa
	+4LodbnL0x/MClETCOeTFE4KHkQW7C3gXp5DqEwR/MB1uVHQOkmbx8bx5aLNz6JODmlL7+Yzebb
	iIzhpEIsU/RPhiOeKK9ylGmCSKtJ+vsi39KXMM/dM/PBOFBZCRa5SV54tOWtMOZMVrlCHl8IpQ9
	l7WHwyLNO5E4HXeD/MuyxinoJUnvnw==
X-Received: by 2002:a05:6402:5512:b0:67b:6d1b:475b with SMTP id
 4fb4d7f45d1cf-6830b0f742dmr1311888a12.11.1778741170088; Wed, 13 May 2026
 23:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260502074912.12193-1-peter@pcc.me.uk> <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
In-Reply-To: <6dbefb2c80964c0394771ae11fd0f9e05486db29.camel@collabora.com>
From: Peter Collingbourne <peter@pcc.me.uk>
Date: Wed, 13 May 2026 23:45:58 -0700
X-Gm-Features: AVHnY4Kp0uXaRPKAoYXDkfobOxz_it19oo__Cj0m2cZABYgqpxJ1WuoISo_LWOo
Message-ID: <CAPQLkRgeb=o2psp_bjLzdZiW_5E+KBSDYdBBtGVTqYyLS+zCGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981b: Add PMU
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_234612_481551_972C03E6 
X-CRM114-Status: GOOD (  17.75  )
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

On Mon, May 4, 2026 at 11:49=E2=80=AFPM Sjoerd Simons <sjoerd@collabora.com=
> wrote:
>
> On Sat, 2026-05-02 at 00:49 -0700, Peter Collingbourne wrote:
> > The interrupt number was taken from a downstream DTS of the similar MT7=
987
> > [1] and verified on my OpenWrt One.
> >
> > Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
> > Link: [1]
> > https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a1=
4b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
> > ---
> >  arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > index 4084f4dfa3e5..3c6fbb6c5333 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> > @@ -38,6 +38,12 @@ oscillator-40m {
> >               #clock-cells =3D <0>;
> >       };
> >
> > +     pmu {
> > +             compatible =3D "arm,cortex-a53-pmu";
> > +             interrupt-parent =3D <&gic>;
>
> The parent node already specifies the interrupt-parent, so this is redund=
ant.
>
> > +             interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +
>
> Otherwise looks good

Thanks, sent v2 with removed interrupt-parent.

Peter

