Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9241E674B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDlebowKLSytReXRSPBwIovISOjJgg7iMWjU9xn2E0E=; b=kVUfYD2Ewl+IuybOtL309vCo0s
	AunCkwfvQvEMnNfDfywnzbBa6zdIUOvVaOwVD+wfWY44oSgQnIamjvBYpTsEbE6PaRIowcjkE8LDI
	um/Nu7IbiNCOx+1PeML6zU7nSFHlZAmU5yBit/Qvn3f/brt7MQ+sMqhMISV9j//sW5gWQ1Ujue/fA
	+2NYJsfwOG7cQvxUS60kzB8P8rxpCQw4hdMCqch0G3b9bb8FnV7nFrzvUIUU1F8xNCRqahDyhSpOX
	rC4xqY5PB8vAr1hOgYTDgnkKPuASjPkffVPf+4Xx1p15ZtEVAMMHW6fXh84ZwllnYqY0O+nfCHbJ8
	Wb4HlIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfxd-0000000DoDf-2I64;
	Mon, 22 Dec 2025 13:28:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfxa-0000000DoC2-3Sai
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Dec 2025 13:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YDlebowKLSytReXRSPBwIovISOjJgg7iMWjU9xn2E0E=; b=Fj1bV6yxuHXszrk56Nns0Xq3jB
	6NCyV15ZL356KxtdIUrR0q6pBTD6VM1JHjV3fSjlvxy8+Oeii031g43+v3j0uVjW39cE1HcdBB4Yj
	HbmEYuovl4gvN37OeYutTebozktNf8bJDxQvX9GaOohrRRf8DpE+Jhc5eoCWJwUCPgRVYgsZDACEH
	+3txSKkP4F0wdgoh3Lt/GQBbioSpb0jqpip6UVGSsZY/UqVDDSN09l94sai4d9G59KGSdB4wbDBkg
	CL5UmC8iy70/s8NGNGUhsJRUajYWjy9OakfCJpcXdnS4L1nseCSE7FSR76tKTO1fR1IgI+iOkv/O0
	26ZFxrgw==;
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXf66-0000000F2Ja-2GLN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 12:33:12 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4f1aecac2c9so40310551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 05:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766410101; x=1767014901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDlebowKLSytReXRSPBwIovISOjJgg7iMWjU9xn2E0E=;
        b=ftvgnOOhvKF+o16FspMELX4agcTd4tkevYBZkUx6SJbHukOvAnaO3R4OPjyfeseJsz
         znBYxMQO1d2lIO2r6OxD5UHqruXIBTfLo2Z8YMAJG4UnOTJxX1T5VvyYg8VuY0tpOgLt
         MHOOVmArab2uZJloKi3S63HijJi7YKd1T5cDwsw1F/ouMckr7XdTRXJUQ0rDVVrgN1rA
         al/G6KCgIp9UCWMcVRG3dTb+e/NXglJoKzaUmgyNFOjOnaCnfVYzLMBJ2hsvlA8dPzN4
         RNE6s3HsHRS7aYzrlJ5TuuiMbQVGOMR6IBDWZE3LzqL5609OsA3CPb9kpgGPxjIPNV5E
         917A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766410101; x=1767014901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YDlebowKLSytReXRSPBwIovISOjJgg7iMWjU9xn2E0E=;
        b=YDtn2/j5TzkIl9SBnTfgk8usHH3ZXRU726e9p6Iqp3YqhhO/V+d1Nut2ZCz/qR/lKR
         uWYOXRVkvj72OaxcptAUtai/bhRioisRRl/9oQqyl4YXG21lyMsPy97YGJbW5jAoOorj
         wZSVUN+9oIWbheSb/0kKxQ5ajtxa8KV8r3vJIP7DntUEunsQha3SSzLIq66RxnXi8fQJ
         2PBcJW6FpAkL7mkrqxLVP8ba2pwV9WmncWI6ls6B2jDMzGHhg/VLBcLxWZZX9t4u963N
         dapt0gp7SdQ5etTyRAUhudtNaTmn7U4cUKK6qViVr0y3HkPh3bfqV2nWftWualxiIftL
         v3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVF7nYMNO5yZsZN7jqTsdcNihTp10t5shkNjbjxXM8iXAVBN0HrkAlWQZXL07cRqmSBRbQJphYdegHTpKcR6sDh@lists.infradead.org
X-Gm-Message-State: AOJu0YyC6gmqD7C1EKP7M4HmJ3deryvCeWzRItaKK/B+HireVKIvYOfN
	RA6hzEctgbZOrQGBFzAhjffoQx2ZwdK2h3qgHwH+VZgGEsV10Uq/V78HEBy2HkYNsHiTddZHTq3
	EC6DLVX+gmCZ9RBbtQDIajeb9FmwCwPzqAg1kh38=
X-Gm-Gg: AY/fxX7ieGod47Gq2mEuL8mtsbhS4JL4sSNjX1rWjyZZFNC8mke+u3OzDbj1AtsXVyB
	oU1gnsxkeagbqg08hRgdzooZYGUAHy+zyhxxZ65R1tX2XoJvejIeX1HrjFByDuRTW+6bn0d4uQj
	P5zS6rbpUtrfaECgA/n5VjzeO9nKQNGpExE208U0GbLCNmeP8/Up8gI/Mel2fz4ycI+QQeBsPq3
	Uc+m795tOdXf+fyZ4F3ZYngPiNs2JY42VtbGe1NVl3AsyM9pZxAof6dazX+aoV9ag2/aB34n5va
	WVF0MIfDF6iuOfOea4/WpAg/
X-Google-Smtp-Source: AGHT+IHAC1B0IqYscWngHVEOOgH6nPUg7BF7svekT7WeCJSzKv/KaP+4UG0eF0tY45F5jYxheY2blzrxV+thgMpT02A=
X-Received: by 2002:a05:622a:411b:b0:4f0:31bd:2aaa with SMTP id
 d75a77b69052e-4f4aac5db91mr179071981cf.4.1766410100766; Mon, 22 Dec 2025
 05:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20251201-nanopi-m5-ufs-v2-1-ece9c0ee17c4@gmail.com>
 <CABjd4Ywc-L0jvXwk253MDZwgN3srY6WQ5EhoKZ6wb+Hae376_A@mail.gmail.com> <119070978.nniJfEyVGO@phil>
In-Reply-To: <119070978.nniJfEyVGO@phil>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 22 Dec 2025 17:28:07 +0400
X-Gm-Features: AQt7F2ofyZnqEtwWu-6gIroppVlUF0KWZIJCYmIw9FL9qTliLfl7M3hB0GDErVw
Message-ID: <CABjd4YyCgVBFP4GG5FK5xO3SY=at5fpYicTO+ghaSCJaP_+XJQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: enable UFS controller on
 FriendlyElec NanoPi M5
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_123310_727841_8A50B3D4 
X-CRM114-Status: GOOD (  28.25  )
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

Hi Heiko,

On Mon, Dec 22, 2025 at 4:41=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Hi Alexey,
>
> Am Donnerstag, 18. Dezember 2025, 15:05:39 Mitteleurop=C3=A4ische Normalz=
eit schrieb Alexey Charkov:
> > Hi Heiko,
> >
> > On Mon, Dec 1, 2025 at 3:35=E2=80=AFPM Alexey Charkov <alchark@gmail.co=
m> wrote:
> > >
> > > The NanoPi M5 board supports pluggable UFS modules using the UFSHC
> > > inside its Rockchip RK3576 SoC.
> > >
> > > Enable the respective devicetree node and add its supply regulators.
> > >
> > > Link: https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_24=
11_SCH.pdf
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Describe UFS supply regulators
> > > - Add link to schematic
> > > - Link to v1: https://lore.kernel.org/r/20251127-nanopi-m5-ufs-v1-1-0=
d28d157712c@gmail.com
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 27 +++++++++++++=
++++++++++
> > >  1 file changed, 27 insertions(+)
> >
> > Would you mind pulling this one, or do you have any reservations?
> > There hasn't been any discussion, but it looks like a pretty simple
> > change, runtime tested and schema-tested.
>
> Your patch fell directly into the dead-zone between -rc7 and -rc1 ;-)

Understood :)

> > +     vcc1v2_ufs_vccq: regulator-vcc1v2-ufs-vccq {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-min-microvolt =3D <1200000>;
> > +             regulator-max-microvolt =3D <1200000>;
> > +             regulator-name =3D "vcc1v2_ufs_vccq";
> > +             vin-supply =3D <&vcc5v0_sys_s5>;
> > +             en-supply =3D <&vcc_3v3_s3>;
> > +     };
> > +
> > +     vcc1v8_ufs_vccq2: regulator-vcc1v8-ufs-vccq2 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <1800000>;
> > +             regulator-name =3D "vcc1v8_ufs_vccq2";
> > +             vin-supply =3D <&vcc_1v8_s3>;
> > +             en-supply =3D <&vdda_1v2_s0>;
> > +     };
>
>
> But where does the "en-supply" come from? For the life of me, I can't fin=
d
> any reference to it in either the bindings in the kernel, nor the dt-sche=
ma.
>
> Can you please point me to the part of the documentation where that is
> described?

The bindings [1] describe supplies by a wildcard pattern '.*-supply$',
and the device in question is a DC-DC regulator (see page 17 of the
schematic [2]), which produces the 1.2V power for the chip, its VIN
pin directly wired to VCC5V0_SYS_S5 and its EN pin directly wired to
VCC_3V3_S3, both of which need to be active for the 1.2V feed to
appear - thus both are 'supplies' of sorts. VCCQ2 is similar, but
implemented using a simple gate circuit. This is done to ensure
correct power sequencing, from what I understood.

I've just checked the fixed regulator driver though, and it only
handles 'vin-supply', not any other '.*-supply$' - thus, technically,
it doesn't currently implement the full schema :) Not sure if there is
another existing facility to model multi-parent regulators that I
missed, or if it's a good idea to extend the fixed.c driver to handle
an arbitrary number of supplies?

Any guidance would be appreciated.

Thanks a lot,
Alexey

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/regulator/regulator.yaml#L246-L248
[2] https://wiki.friendlyelec.com/wiki/images/9/97/NanoPi_M5_LP5_2411_SCH.p=
df

