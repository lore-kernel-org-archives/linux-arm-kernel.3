Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD32C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqa5razpkQwxe4vQQTx47r6fs83MP5HEXihvc/yiIDU=; b=nY5eQP4GshogqNkQ+A0h8AJKp9
	bBgr8RjVL02k9MJyCeUymVYtsTOpqroE1pNWXRyq3toC6fUailMjeQT5YWHhEVTgCNPONcLwqwwwa
	o8NE8v8gi0Wq1WQMGeMGTLgZ1lr9Wputzxi7hJfX8IPQ4Z23viFZBDXpbuPByo9mhPq3akj8QmOaO
	aKpQrVC1EV01wbmAQzQ46lmY23ke1F9Oxdcn1luG0Q9glzU4zyCFNNMjx7++VUMtPc0+5pgWc8sWJ
	jMt7FR+41hrWZQPy1fcLbAKIynjY1fhglRygB30xV2YH1WJaRy4VPdC3kTm2bHOTMrUMWBfvKhVQP
	RjHh0smw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuDz-0000000E8OO-0XjP;
	Wed, 04 Jun 2025 19:56:35 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuBt-0000000E8DH-1ATU;
	Wed, 04 Jun 2025 19:54:26 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4a3db0666f2so3311781cf.1;
        Wed, 04 Jun 2025 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749066864; x=1749671664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqa5razpkQwxe4vQQTx47r6fs83MP5HEXihvc/yiIDU=;
        b=aX0mbWXGBxC98MYD5xZx2xxVfxr9nTRD3K8M49oLZGUt7VkVUrmBO1Bel4Ou0BpLQk
         S2URf2sUx5DV1zVrr1+g6zEPr4ce8yJCcN1+Kj2rpVAOdRyGKsFwo5bJVvjyeOEvB9W1
         3/K6IHBDTTMlIbLcHbKUx4Tr2mergvxUPGmv4KVr+kQgDRGv8w+x2B9slTrnEt0M67ef
         qx5D/K0bwpF070/IFrP9YlVcVjddK/BoBSzjyPR6ko8Vk+Clj3e6bg/zXLUxxJrDVPgg
         8TLREGnsxyrXz9UcdTGHEN1gQfkFXTvYQyq0TRoZ6BaxANnIud8cYzVW8C2CsgR23pUc
         rOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749066864; x=1749671664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqa5razpkQwxe4vQQTx47r6fs83MP5HEXihvc/yiIDU=;
        b=rNt9+oZ3wyQE29QCqLolDZsZyoVj1vvUvlsQB7jvxOjo5cLb6uHHOsVLTabFd94SjS
         tzSmEORYxs5nLEbYJ9OMTYJ3gSTvJwvxt82Eyi8iq0EmE5vt3oCEs4KSrGu4fjIkZIDH
         jiYLcUaXNdbqacWgeuZmS6M5H9cSe7Vqdna4wz7zIauIfaLvWO9isp0/tHLQzLnZ7D7j
         HpATHciCJ9mtzU2+VHtUagF8SIZrHG8fABArbdsWt9xXAfuEdq/bvzoMXx9ZaDxr9nXp
         1ugqRmEun2cs02URWbXz9MAKQi6XeNS+JjQaWvhEOnGOWUnkwIVVZwVmcENCuxKD7cx+
         6s8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbjnvm7QDoV4gWXVNLL0UnnVCz46o/TIoX0CN0rGE1et98Sj1c2fAi2mZT6GaSNp5bcebBbW9Gwkku/x/P5BY=@lists.infradead.org, AJvYcCXzy3rPlzuAqn8qxvVPlumSl0T4ug+DIIDri0OPBTEqOf0cGuWm3pSNdk/YmUsz/adcjgtuLmcyFzETLIYgkRfC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2LHKoGN45jrk8AolEghxjW7SU2tSfLNm9c4FEo701hyY1vMgi
	SaxWgHoID4dwHwbkiiYVHYtnX/XNnEMjDow48BK7XIo33YaFdvbTrTFKmiY95ZK4DeRmm0+6rcG
	s9/is0mTm+QUHTKd3hxDqstaU31eL9EA=
X-Gm-Gg: ASbGnct10p50plxYIIlYW7KvRgkziqQ4d+mpYBRzFL+tTpgl6RD/ikAHotG6t/2bJfb
	CIjw3Jer2pjC2wMk1Bd1LjNPnDtNxNahEuLVCYKNH3Li08ugjx89JeAcU7OmBO/hHInZ0sgCvlB
	ELyyitC6Y0A26XTkFTopuL8A/k/ybPS9c/PpVqSivq7NPrUToUX2PhABEH0msi45xSFA==
X-Google-Smtp-Source: AGHT+IHAyy7cOKoQrKo/qrn3FqhxEupKgT1BOK1u+EwZ6v7KzrpFo7ToVVNkwt6ARpY9qanwEAnINSvWr4g7fwW6JX0=
X-Received: by 2002:a05:622a:1927:b0:4a1:511a:b99f with SMTP id
 d75a77b69052e-4a5a573b2c3mr68994861cf.3.1749066864086; Wed, 04 Jun 2025
 12:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse> <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <23482965.EfDdHjke4D@workhorse>
In-Reply-To: <23482965.EfDdHjke4D@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 4 Jun 2025 23:54:14 +0400
X-Gm-Features: AX0GCFuLXULnMLr8rryeq8foOrYa4cmHNsLuY_-MFNEhem-Gq9QzyGKN9mE70Mw
Message-ID: <CABjd4YxBHn4f4QRVxk1uLGgt7-n=VQqF0_ZSJsKSxZuVtrLiaw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_125425_318471_09FFC7F5 
X-CRM114-Status: GOOD (  27.97  )
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

On Wed, Jun 4, 2025 at 11:23=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 4 June 2025 21:12:35 Central European Summer Time Alexey Ch=
arkov wrote:
> > On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey =
Charkov wrote:
> > > > List both CPU supply regulators which drive the little and big CPU
> > > > clusters, respectively, so that cpufreq can pick them up.
> > > >
> > > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > > ---
> > > >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++=
++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b=
/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > > index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04=
e6d677cdc98fb50353418 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> > > > @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
> > > >       };
> > > >  };
> > > >
> > > > +&cpu_b0 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > > +&cpu_b1 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > > +&cpu_b2 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > > +&cpu_b3 {
> > > > +     cpu-supply =3D <&vdd_cpu_big_s0>;
> > > > +};
> > > > +
> > > >  &combphy0_ps {
> > > >       status =3D "okay";
> > > >  };
> > > > @@ -215,6 +231,18 @@ &cpu_l0 {
> > > >       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > >  };
> > > >
> > > > +&cpu_l1 {
> > > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > > +};
> > > > +
> > > > +&cpu_l2 {
> > > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > > +};
> > > > +
> > > > +&cpu_l3 {
> > > > +     cpu-supply =3D <&vdd_cpu_lit_s0>;
> > > > +};
> > > > +
> > > >  &gmac0 {
> > > >       phy-mode =3D "rgmii-id";
> > > >       clock_in_out =3D "output";
> > > >
> > > >
> > >
> > > Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > >
> > > > so that cpufreq can pick them up.
> > >
> > > Fwiw, even without this patch they're picked up by cpufreq-dt for me:
> > >
> > >     user@trixie:~$ sudo cpupower frequency-info
> > >       analyzing CPU 5:
> > >       driver: cpufreq-dt
> > >       CPUs which run at the same hardware frequency: 4 5 6 7
> > >       CPUs which need to have their frequency coordinated by software=
: 4 5 6 7
> > >       maximum transition latency: 40.0 us
> > >       hardware limits: 408 MHz - 2.30 GHz
> > >       available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz=
, 1.20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
> > >       available cpufreq governors: ondemand userspace performance sch=
edutil
> > >       current policy: frequency should be within 408 MHz and 2.30 GHz=
.
> > >                       The governor "schedutil" may decide which speed=
 to use
> > >                       within this range.
> > >       current CPU frequency: 1.61 GHz (asserted by call to hardware)
> > >     user@trixie:~$ uname -a
> > >     Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4=
 20:32:52 CEST 2025 aarch64 GNU/Linux
> >
> > Frequencies are fine, but I don't think the more power hungry big CPU
> > cluster gets any voltage scaling without it. Once I try to load the
> > system enough that the governor decides to bump the big cluster
> > frequency up, the regulator stays at 850000 microvolts, causing random
> > reboots when the whole cluster starts starving. With the patch,
> > voltage oscillates between 700000-737000 microvolts in idle and jumps
> > up to 950000 under load, and the system seems stable.
>
> Okay, that sounds pretty serious and in this case you should add the
> following tag at the end of the commit message, usually as the first
> thing after the line break:
>
>   Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 boa=
rd")
>
> That way, our stable kernel robot overlords will pick it up and
> backport it to the kernels that already contain the mentioned commit.

Will do, thanks!

Best regards,
Alexey

