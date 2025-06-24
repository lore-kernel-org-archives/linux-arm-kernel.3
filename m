Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C26C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKNKAUPnt7D/QJNedcSSo/8QP0aEMGnpdAtG+3MkOOo=; b=eElJWlkGeKuWZJejEs6U2YaK1r
	xg4mBTLU494NpX8iRA9qfKfNvQLaAE/0VC0hBOfeV7r1pfqq9PH5jWqWFyBwkw4Yxkryf6GDKulP4
	yDAzVCpY7st5se2W3JIi1rZcIvFeSFvWD6WSYwLbGxz5cq/lszBm/ZA3Q7odn6x2KIDfwmCywkcQl
	niWzwMx4gQFJd+CVI2bFSRGCff4cR3PGJhUXXVbWkckOsOyQC7nTdpLZOIo69BJqzwdJ0YcNXJvOb
	tQFFKohImAL51SbjHnL+WaLo2C0ZF2FVwOljBsU4Vr7Q1Sm30i5hxwzBEp91NJgvgtvyT1j1UiIUi
	xoJ5QQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTypz-00000004zEr-23HE;
	Tue, 24 Jun 2025 08:17:03 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyHj-00000004uSU-1eru;
	Tue, 24 Jun 2025 07:41:40 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a442a3a2bfso81659801cf.1;
        Tue, 24 Jun 2025 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750750898; x=1751355698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKNKAUPnt7D/QJNedcSSo/8QP0aEMGnpdAtG+3MkOOo=;
        b=ixssTTxHFDVFrXy0LYW2zURzKz063shpVoA6NJIJ3+d0VfzLnssDKWIzaKhdH1OPtj
         njN60ZVSBye2KNKEXbFwQCre/jOCkCBx25PVJAWzI8P6kl++Zc0SMnzH3lqelt+6zaa7
         jJF7Gim21BLaYCO6577UVBffHHaae0zj0zrJSGBSN9EPe3elUmmHJv9L2yFZFGT3g2Sa
         teNLvKihqxudkGDg2C8qePbcV7UODRBkJhRHRegeSA8NHVuzv46Dudqx/p3VNnez4Lrz
         AJdZKI34kWEfUBXdXfMGBmVHZ5W9W9u7wAUFj+a2UK4bzO6qdtvVM6Fehwi02h80D2n7
         7NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750898; x=1751355698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKNKAUPnt7D/QJNedcSSo/8QP0aEMGnpdAtG+3MkOOo=;
        b=CEoi6RtyGju+yYdKyj1Cg99Bj5thbW+P9iOzEMFIENpd3BHpQVoLPZg/vbE1PtUoa0
         ryw+HUlN7ju0jIaL6JtSAAjBj3Nu65wLXL/35o1raMkC1ttLkv1jcD/M5n8fenxkymDF
         oHX4rhhk8EAhCmRIfqm6AiUrIysAAuf3lM9/4oZ3tjKNHnP9aXBMrZ5a8/o2UvvXjjyj
         grFgx0c1/JD+FPCa0d5wC7XozQjQ+J4UosuqO02Vsq0L+wjl7dHXUtPG/Y3cApypof8T
         ctj/wd+F4XMSl2bGOxHQHc8d9rKArte5Wh9cNu9UrJGjb37UO1Yue7UryOwclQXWmc7L
         X7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCU8nOmvJMxsNnMuQ84b/U0+BKJ5ByRDCQ5toSGrzfIu6uhTUK01om0p2lkyaSZDEawC04b9A8GvlSdx3G0wevM=@lists.infradead.org, AJvYcCWqmAefETXwVT7vvsBj+G0x62cJLe4dZaqeYrMIpHZeYEf+j6ElXR1e/NI8oZnPNWMmmDSKq08EeXa8a+Vo2I0j@lists.infradead.org
X-Gm-Message-State: AOJu0YzRidUG9RibmB1kpWOvD4W4XvbNfTeMoDfUgonBhLwq1rPJBYH3
	9fkG5YfJ5w7UPVnYHwaF8I3st7k1MefV46iYbhCAzjcutA8rfyxKUIA4VGLKfIiLaQ+mLQ8g3d8
	a8j7yJ5VA9wCJ4eVbDv+KXzXsZMat0tA=
X-Gm-Gg: ASbGncvbVenZQvhq3aCEalXfITEUy3rumK0MvYPsyK/+nn23cJke8sQeIaXWcK1BxYh
	4PLtZZBy93d3/l04XEdZDiwhowz4STR70eFi36c/7MR0BNB8/4qFBHX4B6N4/EVLQnmvcA6zf/d
	GxYRZx1Kr6RVNFKu4ZaKVPM+gYJItJgKEdqsiDFZyy3OO2
X-Google-Smtp-Source: AGHT+IEDGLS37RdVuVTLyiWi72882P6Ur66vSqt4x922siqznIehdApjnUNKJjUln2CWaZvCSrI3sSbQZbrzM/jeJS8=
X-Received: by 2002:a05:622a:134b:b0:4a4:2ffb:5482 with SMTP id
 d75a77b69052e-4a77a2cc1a2mr265925901cf.38.1750750898031; Tue, 24 Jun 2025
 00:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil> <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil> <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
 <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com> <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
In-Reply-To: <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 24 Jun 2025 11:41:29 +0400
X-Gm-Features: AX0GCFvp3PWrRWMHpH1qL680ohOJqKJ-nlrmN6zjVvYMRsQ73MM5PJ-3DQk0ZRQ
Message-ID: <CABjd4Yzj+fMoFRWVYBSvWTHHxs0Bx25dKaGn5Bo9QqHKOr0Wkw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	XiaoDong Huang <derrick.huang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_004139_431914_65A6C27D 
X-CRM114-Status: GOOD (  22.52  )
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

Hi Jonas,

On Mon, Jun 23, 2025 at 9:40=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wro=
te:
>
> On 2025-06-23 17:02, Piotr Oniszczuk wrote:
> >
> >
> >> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 23 cze 2025, o godz. 15:58:
> >>
> >> On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov <alchark@gmail.=
com> wrote:
> >>>
> >>>
> >>
> >> Okay, I've bisected this.
> >>
> >> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> >> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> >> v1.08 and earlier work fine.
>
> v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
> rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
> what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
> support is known to cause issues. At one point the latest rkbin tree may
> have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).
>
> Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
> and mainline U-Boot [2] ?
>
> [1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk=
3576

Thanks for the pointers! I've just tried the same with newer rkbin
blobs from Radxa's repo, as well as the tip of your rk3576 u-boot
branch. Same results: new blobs act weird, old blobs work fine (up to
and including bl31 v1.08).

> Clarification:
> Following boot1 parameter activates use of 1 GHz hrtimer, see [3].
>
> This parameter was added to rkbin repo before all blobs was updated to
> fully support use of the 1 ghz mode, and is the source for incompatible
> blobs I referenced above.
>
>   [BOOT1_PARAM]
>   WORD_2=3D0x100
>
> [3] https://github.com/rockchip-linux/rkbin/commit/cbbc6868221fb416d4f0d8=
6a10e493dbbbc1f117

NB: I'm preparing the combined TPL+SPL+u-boot+ATF image
(u-boot-rockchip.bin) using the mainline u-boot binman-based approach,
not Rockchip boot_merger. So I don't think boot1_param gets applied
anywhere (for better or worse).

> > I suspect it has something to do with the topmost OPP somehow becoming
> > unselectable in ATF starting from binary BL31 v1.09 (and similarly in
> > opensource TF-A). This time I couldn't reproduce the "permanently
> > stuck" CPU frequencies though.
>
> Open-source TF-A only seem to support rates up to 2208 MHz for cpub and
> 2016 MHz for cpul, see [3]. The opp-2304000000 should probably be
> removed from rk3576.dtsi.

But both 2208 cpul and 2304 cpub rates work fine using bl31 v1.08, so
maybe the TF-A needs a fix instead? Or is this another case of
"overdrive mode" OPPs as with RK3588j?

Best regards,
Alexey

