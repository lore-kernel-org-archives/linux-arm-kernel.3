Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D98E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=; b=RBjvL4A7rpJfz/yO6xnmH8qf8w
	5K3EMxe9VCUVq4L5jQNeuMLjg6dG0wx979EetGdlWa24iy7Ltv2ovrYH1/tyimXlrIAWiyBiGvQRv
	HxQoYJEiU+1IXCwlNa4Ofrh8zdLrXFZb8/Uh0Nmyoim1j+vi+A9KWUyI61CXBszgzpq/CMWPGHPLv
	o7/uPrQljcHZ3ug7WjVhrBa1YkIrk/6GIOqRpQWvQcIMlQnC6YIGme3leWHPT5iQiaWwFOHbqC2+e
	aCorUPBGvAiW9ecvCKzm3VjG6CZewRNQn55eAGA6W3M/3xjRzDKe6cftREW2TIxcIPQ2/J87X9NSc
	grgwnjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsm4h-0000000ADWi-3IVa;
	Wed, 18 Feb 2026 18:14:59 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsm4e-0000000ADWP-2La4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:14:57 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-385d9fb297dso1788801fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 10:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771438494; cv=none;
        d=google.com; s=arc-20240605;
        b=S7E4UOhcjSUD2RkL7eFnZxt1uVwrf3bjBzPoX8HZMiHbYCTLA7djxewBwiKl3myd4E
         sNhl8RaFQCqP80Yq8Hq2p5WsIi3oVwp4r5X1ODXIE/ZqpSvCfcjJ6+/Qu2xhTEZV6ZVf
         6+/9w/z94mNvFyPCqkFO4pbsFB3bLKIAUd3mpZddCokLScK7mesd+U1kcRrRRhUrFpIS
         OVjh8shJauztR+/uS/w0UZM8A8tm5LHoVDMY4lwllnDYryWI0ga+Fk8C+TKlLNRc//VY
         Om+j0H6jLHqiaPAZbN3KIblw+0Q4BL7lcvUBT/OChkvtBALRboyna63eV0Z1JYtk/WZe
         zGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
        fh=kkNKsMWYv8wjcEfTsjDtvnkC9wDvQEJWCuOtbWEYGp0=;
        b=Hmnv63Om0zpbQSKsNh/XDqnR+88E+6iSop3WYeorWOooCJZIP7sDqjOBR7FWZkN/QX
         7DC3PGiwIVneFMVig1JmI+mtq+jBay7/u+lYImRDYRgcW9jZ6Q2xWPQTUbYX+J1uZfco
         K6jiMzbQmGqsiFGg3tYu5SVySMwysvbMTZcEGCmpZOuFs+ucDdOD2ikUTHGJ53TMdACn
         5RXDE6F50I0LSsvwPCCkLGlvCp7t0985vpacndwbV5DWFdgrRQxZYrTAAAk1guwC6nSH
         eAgcqYPfTWodWKZs9q1nIcH7DM/KiHrePWLtmperqpzWfCIDrKdiT8fS7hk3BVgdmjuU
         XT8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771438494; x=1772043294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
        b=CwB7TyZ+tVYR0bFnMFwx+8qnyOo6JFZ1IBogtBddPlkKQfdn1w/xBstcu+bjfsrkPp
         5eL7DLmyZiJp6WgIfA5pPRZIxHx1OCRqXQaDGGxyeUGHT2oVnvNz6WumW8t8382nLOvi
         CodHWUTSbWFc9o2npFZb2qYlj+uwCznQ38Jjn0UXCWaGLKYlZPxRh5to7MPlID2Vab+u
         Deko5ahY0QjjMuYuQopyeRaBDtLuGjf0K32eMqTquzOqbsXlmO2Qkc/WmhxErsbL0eoI
         pMDP4IrvEZgXNfPDYNNo0Km0dNogKJeNshHQ1Rhl5keqMsEX9FodiEhn/kFJ/fX6UOBc
         RMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438494; x=1772043294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
        b=IT0+06J82hUVZ7E4jIEkfdtI7en03qa7/A8qVt8b5IvQDcdKADN/91B28yBvFyXPx5
         vq0RDKBihvutB3O/vtN9CRcDTTahBQEWjmPm/tUsrANMUMaS938zMGAEoNKkJ7H7Unct
         7AhEzLAy9/jyeANPDKnFgzRX3ePB+gsBI6n4SW3CcysXCYLRrpxZ8fuCkxzk9jHKuxqU
         5MYZ4l7qf1R+Y1DMDDE1Rg78zkWFC6UtdPCVOzwr3Uv79kGmZxTVHF8BXZthU9/qdNCh
         IQ+Z7RoQuJAbzLNXd/QKGM0+QmGqL+vMw1y0v2a4ROJ57BLqhXO8eO6FrWe20kbAJxwX
         pWKg==
X-Forwarded-Encrypted: i=1; AJvYcCV1s7BMClcMlEfhWAbs7kXwSVGeFzdR5/T3eb+UEh1Faj2hT6dn9sjO9OhxFb0HnRjz4EdVmaCzhwmdpuF5HC2N@lists.infradead.org
X-Gm-Message-State: AOJu0YwVa34cSG/he8Zt071l63uFjOTTRezv5UrmkJKZZUC+glurdR0B
	86T0/2tpOecHDBktsbu/MdbqkBdKQ8u1uN82sa6Z+x+0wRUxVYfMJbVFtI9h3kg9We2nKNe2U4B
	FQqdCNm7a7S+tWrNy+u77jOLKjz+XBFI=
X-Gm-Gg: AZuq6aJQYb7WBbXbijRufZ/azgiIsujPYYDG5Wgwy8O4BCsgZ4FVRUryH69BVHu82Ep
	IFBY6B3yi9rGjsjbxBCFlwyuP54R0HDlRP/fhX/g8OKR7U4O83XOssIvcC8rzgBlUhwe5rkp/8j
	kQPtv0q8jnRODkmcnLl6mSVN7wLDMO06C/3SnQjP1RyzDJC7ITIkgrFujBXhF0x66/s/uu8UsXa
	ZNga5dbrpAZ1p4N5Awegh00LOgDUbUvp42pUtabaQzDqZ0yDSikzDO7laylybxFZipszD8QFXhR
	CAaRJny5J/UEMR53EuGF40E2spVu7S6DrOhmtJMzOCY/MyD43mPYQFR8gm5M9lNlArcIMi0=
X-Received: by 2002:a05:651c:1505:b0:37a:34e2:88e7 with SMTP id
 38308e7fff4ca-38846ded488mr8325581fa.22.1771438494066; Wed, 18 Feb 2026
 10:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com> <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
In-Reply-To: <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Feb 2026 15:14:42 -0300
X-Gm-Features: AaiRm53RLXHEYghXfgNRCuxfYIbnDQ70cmKmTheE3k1c4d-bmc6cBGsAlV-rhj8
Message-ID: <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
To: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_101456_623386_2E324E4D 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Hi Max,

On Wed, Feb 18, 2026 at 10:24=E2=80=AFAM Max Merchel
<Max.Merchel@ew.tq-group.com> wrote:
>
> Add boot phase properties from U-Boot device tree.

The commit logs of this series could be improved. Please take a look
at these examples:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19&id=3D256feb5be482315a91c1bd1a1808276f57ef76dd

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19&id=3D2285ea3f8065f47a6a1b62e6fcfa85105c8c261b

