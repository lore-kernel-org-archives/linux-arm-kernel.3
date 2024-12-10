Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB48E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vsa+PCKL3nkjdlqJseBSn+MXW/M4bMK4clgKtZHb1eI=; b=Wsqkd5HFsvNjD0/4fZVekgu014
	MylyTdW9NrertNimzj4wm7pJntZn0nOeK4y5u6qzjsMYqNbfw8wLWf0Tc5OifeYbLINsg6s7jV6Kx
	beN1/pcPqkwysfOgrts6+MK1FbZnl+sdFVRXO60LNCiYDJ62JFledEjcYgHEBeoQkjQzylHZFzYPW
	llWV/M7oLvbzcGeNO88UjZZvTdrayucJ56aObAHNUEfwogZ4NKfjyDeRRBhaQOuEeVAAPJqdnyeRd
	nPmg8bKn2H0ZPL7MepG6xj0PjIQyskCgzCvrWK4Z9CsIE9gD4TJV4ynwxXMkhwjRUmVRNup7lZDct
	IpLHXU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyRb-0000000BJiV-0XRG;
	Tue, 10 Dec 2024 11:30:23 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyQX-0000000BJaX-3cm1;
	Tue, 10 Dec 2024 11:29:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so7150807a12.0;
        Tue, 10 Dec 2024 03:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733830156; x=1734434956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsa+PCKL3nkjdlqJseBSn+MXW/M4bMK4clgKtZHb1eI=;
        b=KiCvvdxzY5tUWmi9m7553vRay80bZIda9Ng+QFLZMm3v90z4d/1NhkzLmpi5Q1gcC4
         /275dbxkqmWK8KeQOsB9dt8B+UYE+W05sn9bmE9Bq83dO7jAaOxyshNTnY07wp/0vXAW
         fN6xDm8QFJCIsVw0mY0Ag6ufba2vJxlQTcq1faJffrvrvwFpJXUptfNXziQFtYtBIV0T
         jI9jz1g/d/iwJA+EyJiZysxheBv4GZz0PJ/A6xqjtXYP5TNeOCxLL5Zk4v+x6Y4jPRg8
         T0QPKfGl5o56H9aDf2d0gK8KquNB/KiWycU2sGSBujRypdhuFe0AioAHoc77IY6TOUlv
         73dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733830156; x=1734434956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vsa+PCKL3nkjdlqJseBSn+MXW/M4bMK4clgKtZHb1eI=;
        b=D5sk2SohOjbxNJigY0XkjrSBdEoOR9pR++Vr+ZBPXobEA4FDyUthPKGfp8qokbSs2Z
         KXDVkvjPxT8OZttT9pQjRlaTRv65vutK+e13GpHqWs7vS8VVE3Q85Lprs6YFq0Kk9ncy
         1/GCHEGpoDREjmiuxyuFRKstlucTPu6ta/oNyYYWsuCvFxgyB0OghGtkNQl8pAKzyrCg
         ScaVgBXPxifsxI0yNlL9+xcYoUDKYSV/DQVKufxhDmhVbg61FvaaWbMEh0FKpThX2CBJ
         NRBAwz/yH8GJkpR6nS0+qXganxRsE5cjBS4RAmnTOkmhChQcgsG49JfI7X52o2ykOPMD
         +LSw==
X-Forwarded-Encrypted: i=1; AJvYcCVMdHnWH075U4dH3cbQtCvi028xAT4S8wE8f+gzq62/YeTf8wz6Xe1jViePPozPKHTF5OllAMv75Z+QU+rUyoB+@lists.infradead.org, AJvYcCWStlOOH3qsffYmbU1AKkhmGJDF1mbzhlpT8zBoByPbAWK7fgRoBxBsLzMBp6ryiAeUqQOdpY5XPKCys/DbQow=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyG8g5CF2Nl9ih9B9hPVKMzsUAhrGANfsE/oorf4Il05LVEA2q
	s7uzFqb3OE6kzwfC1QG0LY7R02Kh4HOfq3N+vmFPqeApLa09alH4X4U0JJhnA346ii559P1q2Qa
	Hnh0rv2K3o7jHPFMpa8MwJlFfIA8=
X-Gm-Gg: ASbGncuTi+Gh/I1+P6rRorSpYYV4M4kXzIwUm/pq4h0yeXZcVKfOm3CZWwBMBcuR+ka
	VD9OSXIyhcl2nl3H3zlh1AB+xyYwJVjZ/fnWw
X-Google-Smtp-Source: AGHT+IFH5n+zWAxeaP6Ebg2yPGAGyKrxuqKNK29gHMryFKRfiM7VSwvTxu54I6XWT3mw6cto3WCv6aezpiIGED9xMrI=
X-Received: by 2002:a05:6402:210f:b0:5d0:b60a:2ff6 with SMTP id
 4fb4d7f45d1cf-5d418612cffmr5077206a12.22.1733830155765; Tue, 10 Dec 2024
 03:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-7-pgwipeout@gmail.com>
 <2b68c2dd3618e5904a4eac1ec87d29a7@manjaro.org>
In-Reply-To: <2b68c2dd3618e5904a4eac1ec87d29a7@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 06:29:02 -0500
Message-ID: <CAMdYzYpj3d7Rq0O0QjV4r6HEf_e07R0QAhPT2NheZdQV3TnQ6g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Remove address aligned beats
 from rk3328-roc
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
	Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_032917_902775_C66C96C9 
X-CRM114-Status: GOOD (  28.42  )
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

On Tue, Dec 10, 2024 at 5:45=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Peter,
>
> Thanks for the patch.  Please, see some comments below.
>
> On 2024-12-10 02:30, Peter Geis wrote:
> > Since commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
> > RK3399/RK3328"), the snps,aal, snps,txpbl, and snps,rxpbl nodes have
> > been unnecessary in the separate device trees. There is also a
> > performance loss to using snps,aal. Remove these from the rk3328-roc
> > device tree.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> >
> > ---
> >
> >  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > index 6984387ff8b3..0d476cc2144d 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > @@ -155,12 +155,9 @@ &gmac2io {
> >       phy-mode =3D "rgmii";
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&rgmiim1_pins>;
> > -     snps,aal;
>
> Huh, I see that quite a few RK3328 board dts files specify
> the snps,aal node.  I wonder was it a "cargo cult" approach
> at play, :) or was there some real need for it?
>
> Actually, I see now that you added snps,aal to rk3328-roc-
> cc.dts in the commit 393f3875c385 ("arm64: dts: rockchip:
> improve rk3328-roc-cc rgmii performance."), so I guess that
> your further research and testing showed that it actually
> isn't needed for Ethernet stability?
>
> >       snps,reset-gpio =3D <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> >       snps,reset-active-low;
> >       snps,reset-delays-us =3D <0 10000 50000>;
> > -     snps,rxpbl =3D <0x4>;
> > -     snps,txpbl =3D <0x4>;
>
> Unless I'm missing something, the commit 8a469ee35606 ("arm64:
> dts: rockchip: Add txpbl node for RK3399/RK3328") doesn't add
> the snps,rxpbl node to the RK3328 SoC dtsi, and the respective
> driver does nothing about it when the snps,txpbl node is found.
>
> Though, I see that rk3328-rock-pi-e.dts is the only other
> RK3328 board dts file that specifies the snps,rxpbl node, so
> it seems that removing the snps,rxpbl node here should be safe,
> especially because it was you who added it in the same commit
> mentioned above.  If there were some SoC-level issues, all
> RK3328 boards would've needed it.

Good Morning,

You'll notice the author of that patch was me. Setting aal, txpbl, and
rxpbl was the original fix I came up with for the rk3328, which I
applied to the only board I had. Someone else later on isolated it
specifically isolated it to just the txpbl and applied it to both the
rk3328 and rk3399 directly.

This was just something that was left hanging after that result.

Looking at how rk356x was done, I suspect there's an even more elegant
solution. However I don't have the deep level knowledge nor
documentation to implement it.

Very Respectfully,
Peter Geis
>
> >       tx_delay =3D <0x24>;
> >       rx_delay =3D <0x18>;
> >       status =3D "okay";

