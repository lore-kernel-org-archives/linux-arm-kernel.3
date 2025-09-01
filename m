Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F1DCA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 00:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGA1e9SWx5rX3wnMF8cYm7WiNRZD38DWQOe4gRTSbMk=; b=gBPuDuM6EvwMcjPcULVt8v5oC+
	ipujFStG/KU0VdUutTjqVBIPVVCEJhFswJ1uyJOYRnbwoz1uQygi6Y8tB8PKtL7ffp9snnigDjgwg
	Nw9PzCbYO3mSzh2bSuv7Ka7BA9HWcPQHFEjw1+QCWfLKyOxc8d0pto6NvMTJrFAEHTSnJPNfGt2NE
	qYSfQ2SvCGGcxVgx2Hq4ZKV1q+jT4ufvFIX8vK7aU6B6SQcds1/H9zoBsobpNHkcq0+pnJatHW1p6
	K6DIyYN5M0LTudfZHdB+t37upvy33bfAyXPpH9QtSLI7/+yzsdftJh/FVpU4DQeIOUQRIw6bWPOcD
	7UB8U9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussKl-0000000Arlq-0bAS;
	Mon, 01 Sep 2025 00:23:43 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussHo-0000000Arbk-2In6;
	Mon, 01 Sep 2025 00:20:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61cf8280f02so3875872a12.0;
        Sun, 31 Aug 2025 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756686039; x=1757290839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGA1e9SWx5rX3wnMF8cYm7WiNRZD38DWQOe4gRTSbMk=;
        b=YDwI6kJ4H7tyETp3iHuXUCLFjqOeUy+HC7wPxY3vwv0qGJTFYHivWfmnfTlnXNxZHg
         RcQv3WQOqEZG7cI6gvziRfs4ikd8Y9Hmnw8WKRDEbqKvkMKZM0EFLJYmtB65UguJcLMk
         4/R0zrH/9l7X2IcBGVuLWJe3IhoPS6rveqevjb/UkSFeyFUxTlmb2mQ3LngKvGFTQJFj
         bHBboXCp3pimn6kOvfXTtGkCdP+opg4rHQutSBIgfWpsnCPJbXdbIz8pVFcNolYuoCxj
         +b2+qbB9fIlre1wiiKuKmQHDOdjGhi0dGP2T5uttSYBCSUEUCX3pkM3gFcx0Isipqz5X
         UVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756686039; x=1757290839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGA1e9SWx5rX3wnMF8cYm7WiNRZD38DWQOe4gRTSbMk=;
        b=aN9qS+si2UhIJGOIf1X0TUxY09Dn/u+2LQ1sgZp4srSMmCCcN9iUXy4zxlMzVTcSBB
         Yba6wMhgXgOk8f76MIKEDgV88B7rP4z7dQoiLi3ehRy3HrmzANwVZFZQCBaqM6mlLunk
         l3FbAMPWW5mEezLNDuMn3D6QXqwvmGhaHKnzWrD8FRRrwD4oSmwJ7j0MJac1vOC9yIyH
         2O9/ay5tmCu2ufBjFXN8MjOBdH8AO0UTM4oDTSpFsGrJhmxaulUt0Cbk3eDcSQNi3j/W
         tc/8LwskMWx88Q09n+tj50mSnbWnx4PWsq24+SjO+2dZzqe1wjXVNHVyF0Uomp37qmfk
         Z96g==
X-Forwarded-Encrypted: i=1; AJvYcCUzgGd/ksl+EOCIDhwkrEfmG6IW02AVlVq/frRaNDL22y89e54TS+Dv/S3MbQpjjKpyVwzKAzo/j1UbFmexB/Pr@lists.infradead.org, AJvYcCWCFnBA61BzBlyQHNFcj/HsgPm07PynhnTczR+wVlbyhPT7tp+9PRMBgK00MfzZMmhgmnKSh4jwOTKLVS3xeZY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/rYkfA7gcqx34+QDvIa9ckBdP/WJ1WgYNAaBwHnWXmZGLKMSa
	T61wbTfPMx66IVZbj4B0NR+lWTWtAK3RgL4xTWsuoh63NHnXBlrE3Z9uUhqzKj7AXxtjgF44LkT
	HykCuRoQ6zw4w6HSEux7OY7JRphyHwcw=
X-Gm-Gg: ASbGncssYaAHeQ/XOnk0YF5R+U+jQTYA3vVmnM1q1cj96Xu9hgmqkYvL8LbqDQ+5NSP
	tlThL6X0pXeq3id4+oQe1kFXfc8iAyjMkzHvoqCb5PpoTJmMAvxnaFPnoqgzsDg4lzadrkjwiQD
	q/e2/QH6sXKeLlPPSXEWje7vk/Q53qkc1Gjnw/txXBE/89inOgSU7LE5/PBBry9QrnIgtf4EXgb
	3mcEc5bYWRhJA==
X-Google-Smtp-Source: AGHT+IE2lhwT6Yzu3q9B3kLM5n807WkxfNRIG/AC95Pv7jUReWAmbkcsG8EsO/ckMMSuQjMFJIJQfLO5Xj7HXKZ2xPM=
X-Received: by 2002:a05:6402:4303:b0:61c:deac:4693 with SMTP id
 4fb4d7f45d1cf-61d269881e0mr5843191a12.12.1756686038562; Sun, 31 Aug 2025
 17:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-6-cn.liweihao@gmail.com>
 <3368190.aeNJFYEL58@diego>
In-Reply-To: <3368190.aeNJFYEL58@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:20:27 +0800
X-Gm-Features: Ac12FXyWs5ayjwnKI44Mb7gtjPKcOLOC6rRUCDyygTcTJqSzEgRm03n4Up5wwFo
Message-ID: <CAPEOAkRZbnVNCRHQnfJu610TK6gkJ0+YrpoL3-xsqTWm7NUsWQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ARM: dts: rockchip: Add display subsystem for RK3368
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_172040_591899_C6F2284E 
X-CRM114-Status: GOOD (  16.83  )
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

Hi

Sorry about that, I didn't notice this before, I will adjust it
according to the documentation.

Best regards,
WeiHao

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:04=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi,
>
> Am Sonntag, 31. August 2025, 12:48:53 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > Add vop and display-subsystem nodes to RK3368's device tree.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>
> please use the appropriate patch prefix. For arm64 this should be
> arm64: dts: rockchip:
>
> The one you're using is from the arm32 side.
>
> Also please sort things appropriately both node-position and order of
> properties inside nodes, see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/dts-coding-style.rst
>
>
> Heiko
>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3368.dtsi
> > index 73618df7a..0e47bf59a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > @@ -858,6 +858,32 @@ vop_mmu: iommu@ff930300 {
> >               status =3D "disabled";
> >       };
> >
> > +     vop: vop@ff930000 {
> > +             compatible =3D "rockchip,rk3368-vop";
> > +             reg =3D <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0=
x400>;
> > +             reg-names =3D "regs", "gamma_lut";
> > +             interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +             clocks =3D <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_V=
OP>;
> > +             clock-names =3D "aclk_vop", "dclk_vop", "hclk_vop";
> > +             assigned-clocks =3D <&cru ACLK_VOP>, <&cru HCLK_VOP>;
> > +             assigned-clock-rates =3D <400000000>, <200000000>;
> > +             resets =3D <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, =
<&cru SRST_LCDC0_DCLK>;
> > +             reset-names =3D "axi", "ahb", "dclk";
> > +             iommus =3D <&vop_mmu>;
> > +             status =3D "disabled";
> > +
> > +             vop_out: port {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +             };
> > +     };
> > +
> > +     display_subsystem: display-subsystem {
> > +             compatible =3D "rockchip,display-subsystem";
> > +             ports =3D <&vop_out>;
> > +             status =3D "disabled";
> > +     };
> > +
> >       hevc_mmu: iommu@ff9a0440 {
> >               compatible =3D "rockchip,iommu";
> >               reg =3D <0x0 0xff9a0440 0x0 0x40>,
> >
>
>
>
>

