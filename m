Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD66CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=; b=bUt+cyM/+rCe0VrWbDzFjCSu4T
	3GOhVlbSbC3WexJTS/NudvAYr1iSw2Y1/wAqKUUn4wxbK3S+MCK/GdI3hNcHP8oldiFoyUwa93TKu
	o9i0zCs9NQPmI+1sibU3WHdARIh5BjakbtCf8wjxBYK4DyOErEGHLSVcN+4RkSzu9XxBYRAhUdC3q
	TvICoWknu/UFIv2iFHKTXMOGL7ED9M9XGBVVZOaIlYfgkNwfkG+HSJS4TZkLecxw62K/FjwBTLtdm
	MwXfTMwIe6OfPqd3/oi3K9VFd7Et4Ew7pqDH8UvLnAAQ0Bldjv84z4DFIrDxCBdVbJiE1jsX3JDw6
	WmlboU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoept-0000000Cr9F-2gvk;
	Wed, 20 Aug 2025 09:10:25 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoe28-0000000Ci42-0Cwy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:19:01 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1337561a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755677939; x=1756282739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
        b=GHa/UdOQz8bCp2ZsDCbqSD6U9ttN90Wo8M3QmV4UiPQa3iZ3QSq42Rl5VGDqpSJaLI
         g78R35u8RMvKnM0AZjSqYYOk/H1AGvvSV6lSENEUXS+4Z11rA/f2tatwQWO+vCnrvlI5
         BXTB7c5fso2zIjX0mMKQ56t3CmYD94Zq61BW137wp7ZcdGPQpCRz2bFEQx4R1GS80Aau
         92oQ4F392q64Vf44ys2OtTRL6mgoyE5vvX/FrR0LqJURjljvr5sAEk+g+IsuXX6WbJZC
         2pCcv7CtDtcIZJkOXJyNO+199oxmZytjVeRWxWKuNpR7FrjLt5BZjGn01GN+eDWCjORo
         shXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677939; x=1756282739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUn65ndWyyECy779FroH88LwpGWaBPZvfehi8phsszk=;
        b=DBFp1LBRWVfkOWvWmZWSgOPpo7cQBbw3Iq5BJLOQAqwvlIlAT1JV3V1Ld2gSoG660g
         XKowGjNFY3uXv5UN372NE28MEcXThKEfJ0qo6XzfGHQnrAoCREF0lm+JhzvMHJ8d+4gS
         1LAnxf9zvqBZSTBKy0r2Jxa8tFfVLE3oloxS4r/Uo6ljkyoy5DMUxZ5CaThT8J6KA85O
         05WpzmVWGjBs1IZNbxr1nHDlkxu93gG1Yghe1yaAEVkcgUyu/1MlfXtu3fE7f+0Q6hnw
         PJE6927B+G+nah1QfALC9SZAkOb9bIukd/7jVJ/czB1rcOXkKDDD+QvrZt7XxU/S5+9S
         hQbw==
X-Forwarded-Encrypted: i=1; AJvYcCVGjCGQUf7RDpzYXUeTrIdF16NuFU2NKnyxI8BtcPBoL+bTrS6QWyYivV2aRvCK9oelZHJVOUs6X+eGyKOEJS5P@lists.infradead.org
X-Gm-Message-State: AOJu0YxX4zW2NBfFkVpPk6oMahhA7QaQFQ9b8zTTMw3e7DRe3CkQuLWe
	qdGnxfoPwvsg7pCcv+YTIsk03+/DO+CzRAPEpYuik7Rs2okmqULPSW81I94d3MELkRsHPFwOzdK
	+SQ2LO00Fvq2b6JnMFFqX6K8Imm4QtB8=
X-Gm-Gg: ASbGncs+ue+lji0bEBZosv9wxnbuLDWtbJ/lx6S/EHxVTJa5g+m/wKHbL2F0xqLy621
	j+PTJOp/dz2N/Ce/b4x6655jRBEU2RIvazPgklb0N52Rjs/C4cqvviks0j/qpE7Tci8ZQw4ainb
	OM2oM7Td0cOKBDUM+MAAKHJxO7fnhT3YgO86YDMyRM7JYWinyFlJ0qkk3fboax9YAg2a4mTVfsH
	boE
X-Google-Smtp-Source: AGHT+IHyS319ZtbgIK5QZ2TPQXhA0Y58me3odjKXWmlmqSDihLpOV/ytvp3iwfpabPjgDac+00Icnjn6G+Cpo8Pj+bM=
X-Received: by 2002:a17:903:18c:b0:240:96a:b81d with SMTP id
 d9443c01a7336-245ef0bf2bcmr23609915ad.5.1755677939214; Wed, 20 Aug 2025
 01:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org>
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Aug 2025 11:21:09 +0300
X-Gm-Features: Ac12FXwDgSq5YSRmZRgmCG7R1pa20x6uPGQw-yiLKpdR5FfgZLxMT4en9AePre4
Message-ID: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_011900_087820_108D2565 
X-CRM114-Status: GOOD (  10.88  )
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

Hi Rob,

This patch will break IMX RPROC support.
<snip>

> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c

<snip>
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware=
 *fw)
<snip>

> -               priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev, res=
.start, resource_size(&res));
> +               priv->mem[b].cpu_addr =3D devm_ioremap_resource_wc(&pdev-=
>dev, &res);

devm_ioremap_resource_wc works only for IORESOURCE_MEM resources:

lib/devres.c:124
static void __iomem *
__devm_ioremap_resource(struct device *dev, const struct resource *res,

=C2=BB       if (!res || resource_type(res) !=3D IORESOURCE_MEM) {
=C2=BB       =C2=BB       ret =3D dev_err_probe(dev, -EINVAL, "invalid reso=
urce
%pR\n", res);
=C2=BB       =C2=BB       return IOMEM_ERR_PTR(ret);
=C2=BB       }

while the devm_ioremap_wc doesn't care about this.

So we cannot use devm_ioremap_resource_wc here unless you add
IORESOURCE_MEM flags
to  of_reserved_mem_region_to_resource as discussed here:

https://lkml.org/lkml/2025/4/28/759

The same issue we are already experiencing with Sound Open Firmware
where the change was already merged
and we have a bug already reported.

How should we fix this:

1) Add  res->flags =3D IORESOURCE_MEM; in  of_reserved_mem_region_to_resour=
ce

OR

2) Use devm_ioremap_wc instead of devm_ioremap_resource_wc.

thanks,
Daniel.



Daniel.

