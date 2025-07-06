Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B76C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+m7B0diOiXhfs636fv/zQA7WEVjYquVXLLYKJKTbjE=; b=eRK9580gYQ0r+U1gs3BhBzYOdV
	aZl0YMYaawpcOwAKJvHdYVXf+htAvNYca3nKbxkXRN/9BRyjOx91eyhpo5oaKuFPprKRv/y0iW48s
	tRPs1lyyJu5G9YrpaHRrXpiL05OVbxzyonymUTvaTRJU7jojHr5XUbSNt9fE8dzIjaXgHiSFWpp1S
	I55c7luyBO+q3DoSFtFYW/sb+sVOIOMdqdBGigvLAU9WAyICDxjriwULm2Rg0mXq4pjQ27f3VlF6F
	inwZQQZ3M1ciQA+BYjB4+PvVbdPdPl23L6Bm+l+QUK3WTC82re0s2xkDn5enGmOdfoXVqmyRnGhtB
	srm1BgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZBk-00000000z9b-0WIr;
	Sun, 06 Jul 2025 23:54:28 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZ9Q-00000000yuy-0GQS;
	Sun, 06 Jul 2025 23:52:05 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so2091172276.3;
        Sun, 06 Jul 2025 16:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751845923; x=1752450723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+m7B0diOiXhfs636fv/zQA7WEVjYquVXLLYKJKTbjE=;
        b=eerg0Jz2qj5qGEdhwR09DMfBprltYK1k2RQikhDQ0b3DzXvtMNx/n/depJwYIe7xee
         KQIrhhILjSX0wrwsW87hFFJOMUF8E05l1rvKz8VzYC0Kr7WiRjKJJ2DKbRbH06KAzmCX
         B9Jsg/9JO5w0AkpPQwfmBb1RfTbJ6Bb/Hj8RHRx2s/gaXso3/XEkA7tcjrNMHUPRCjmd
         h9TS2NT6VpIkmuVX85SZRBHKvsvb9QvFVXyNFgrkT5/HBWHifhd1D40rlDLy+bDzvEV+
         0jontKDo4Nd4QMCBYdDuX7/vmIWy0lezpYxypHreK0YfYZGQGnjFxzXDeiaEbUtncpGz
         1HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751845923; x=1752450723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+m7B0diOiXhfs636fv/zQA7WEVjYquVXLLYKJKTbjE=;
        b=wMvTH9rfwD9rxXTT05iziLyjcIrH1QJaV5odYTm6AzBO8OKL4nP+0gYn5DIOfoz/+Q
         9OppniaXarpj7plWhcrG8Iyt5hh5SPoxv3IeX2iGwZ5CB4KORuG1LKhXjTtVdHvdEPAX
         GY4AgwiP5paEAbV7wElF/IFzKaRBuhHnoarczX4u0aZky/Bzhjg1wnIlAp6M6saXc3h5
         ynguf45Zy03PSG4ZEAsZ0zTIXQaud4VrcRoeMO+h2VSacPaH6GxD9wP21OcjDP0jfcXk
         os4ebqtX/qDUV9Q/aaXTl7+QZ/kFszBs9lQZCO4CYFNSC2IPipZQ8OtHaWy5SC/0Oycr
         MjeA==
X-Forwarded-Encrypted: i=1; AJvYcCUTGSknsUiN/bFUWnwq3SXCOUtVsBP0qQxmfR4YL2gO7IS6ccBfdNqCcVh19xSKzvKBViWWIimoZVZQQIK0Vu4=@lists.infradead.org, AJvYcCXdFsn9MPOi0ZNecdXUkcRarxZWnbgW6Vkf2KdNwwMao9sD68jh2a7nY5qzufQpc+O29gPOJWx0AjLLTHJ6GnhJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxLULPfIg9q2i9PlYFBXFP3r6WE4wr6HUU6/ZGZtSgPvlcCsg1X
	S6uS7tuuf2g2m0n5iiqVQdHq9hs0kFQhl4/MdAt6nkI6BgURc7ExrDRPA4ar1DIWPROslVhORMU
	jCIYlQU57dxabK0GFMJM0s70NCqIj6vU=
X-Gm-Gg: ASbGncvzzR+Q8UxcKx+MMTcD+RKcqnkQDF2j7rynEoU09WjP21veDYza+xUjyb7jGL0
	j9Zp/ygFCOtfQsZ7fqnPNE/nEvh/R+cOCO9x0d1Odbo6vmlJBSsbxshTEjrPzbqImhMDr3/AL7c
	E7pp+FTc8N3p7oFOa6poj12ASHUsD25DIKayejD7HCZfaYjfTkBcGs8iXE
X-Google-Smtp-Source: AGHT+IGu33ZcXT4Q2qak/JrpD+2hFPhuRT5IYYS4i7palcZ3fTaJxZJQdYShxp5sOWjY0V7f4eKKvGCM6HpyE/MpNsc=
X-Received: by 2002:a05:690c:61c6:b0:70e:6333:64ac with SMTP id
 00721157ae682-71668d1e097mr151850977b3.10.1751845922931; Sun, 06 Jul 2025
 16:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <20250706214111.45687-6-rosenp@gmail.com>
 <175184098772.672740.2328928098872646704.robh@kernel.org>
In-Reply-To: <175184098772.672740.2328928098872646704.robh@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 6 Jul 2025 16:51:52 -0700
X-Gm-Features: Ac12FXyEdEOs68iBa0GWZ6aV7SXltB6qi7ZK7vbmauFADvR3IvntzZnjx5C06UQ
Message-ID: <CAKxU2N-912DUV6_zSxVOeegR03U39WzHo37oN1EO0rH++a_QEg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: net: wireless: rt2800: add
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mips@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ansuelsmth@gmail.com, Conor Dooley <conor+dt@kernel.org>, 
	Stanislaw Gruszka <stf_xl@wp.pl>, linux-mediatek@lists.infradead.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, yangshiji66@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_165204_107214_82B1F7EF 
X-CRM114-Status: GOOD (  18.94  )
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

On Sun, Jul 6, 2025 at 3:29=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Sun, 06 Jul 2025 14:41:10 -0700, Rosen Penev wrote:
> > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > Ralink/Mediatek devices.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../bindings/net/wireless/ralink,rt2800.yaml  | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/rali=
nk,rt2800.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml:43:5:=
 [warning] wrong indentation: expected 2 but found 4 (indentation)
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/ralink,rt2800.yaml: ignoring, error in schema: examples
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/ralink,rt2800.yaml: examples: 'wifi@110180000 { compatible =3D =
"ralink,rt2880-wifi"; reg =3D <0x10180000 0x40000>; clocks =3D <&sysc 16>; =
interrupt-parent =3D <&cpuintc>; interrupts =3D <6>; };' is not of type 'ar=
ray'
>         from schema $id: http://json-schema.org/draft-07/schema#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/ralink,rt2800.yaml: examples: 'wifi@110180000 { compatible =3D =
"ralink,rt2880-wifi"; reg =3D <0x10180000 0x40000>; clocks =3D <&sysc 16>; =
interrupt-parent =3D <&cpuintc>; interrupts =3D <6>; };' is not of type 'ar=
ray'
>         from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
et/wireless/ralink,rt2800.yaml: properties:interrupt-parent: False schema d=
oes not allow {'maxItems': 1}
>         from schema $id: http://devicetree.org/meta-schemas/interrupts.ya=
ml#
> Error: Documentation/devicetree/bindings/net/wireless/ralink,rt2800.examp=
le.dts:19.5-6 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/binding=
s/net/wireless/ralink,rt2800.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
forgot to run dt_binding_check. Will fix in v2.
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202507=
06214111.45687-6-rosenp@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

