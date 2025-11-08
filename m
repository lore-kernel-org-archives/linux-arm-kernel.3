Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4465CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=; b=OdkX6MxB9HTzMxYkCN10+xSAmH
	EOTbKzK/yxaDYnIdejdhCJ+XzC12GwzWwD8u8W2sO20rwLjsPEe4hP10YDAI97/7OBOvQ/hdMGDgb
	UWSRDqaw0+FMlX+0LZssCRpe05y2tkVZ2gJQ5WpalGAnugAJvrgGUsqc221SfxaTIq4azuraFGkNJ
	JADvS8gHsmL2nIhWkqTkTvMxwH/kk+OdgwPEQqyrRCma5atUV+Gn4M0eQoys4Rk5Ulr5bFJsyzTu+
	hJxQGEigznatMBCQWDMjy8acfyJQVK8nqSGTL8PUtbGuJp2QTTUGfhkZKwqMcSSc2jCCP+BxKzSK4
	2l7Ts4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfWx-00000002zyh-42Bk;
	Sat, 08 Nov 2025 09:46:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfWv-00000002zxd-2qXC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 09:46:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b71397df721so175235566b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762595203; x=1763200003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=;
        b=LRS+PxKbcx0I22zb3AfN74ZKRzMe4oTb2F18PLq0KCERv84G0wTJ03wfIIvq4GhgGZ
         m7hpvPq1hv5kvcd5SNLeSPxEPWz19oPNEqC39O/8BFeHK/pVznymHd3eX7foUjVQrBlO
         1CIZEzv6rwiMgIFqCSrC91KFrLfrPao/BadQuxzNxzHv6cktrwiAaSORIAp3e/LL65a3
         DiGy2S84HuYttKrHFFKfv+mQ9JM3Mu566jvAf+gVvc+loHxcRan6O89mZvuaWeu1H09P
         i9m+BqEcH1x+V2XHHAILHrHQUPHv1MLTnEpmEvW5afbnIorzobdl9mT+KWQevO/e5o+n
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762595203; x=1763200003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSUW/WjMhCO0Veyp/5U9fPi2v4UQHFyEZLh62h16fCE=;
        b=Ci+/Q0vMHzAVbBNEIeIYg9wpuHWhRp9l4mY4DdK9BZ+5BORs1Olyc0EHkOncGZnEcR
         fZqRtvUytFh2/qecx9o+kO7WS82GYllVN0uyXsChKNOku31Ijtz1C5bKKiuteUGtvuD5
         mpofrDVg35JOuTJXItCYQZYw2Y0n0iB0VhL2T8hozotbDpwxD+Yp/H76JXC+2BHbbf1O
         4+hfzpyFv8ph2HWk8JPyBMf1fFqjjtzwh5Tsv2hXF2jEz8GX5Z0/P7AAH9GLPlgxnDl/
         Yq+eHNXiJRslPnJzuodQ6KNAzVts6ujHf6dZXdgWxWpLf9196KGGTInIowGXPQRD9Z/1
         JT1A==
X-Forwarded-Encrypted: i=1; AJvYcCW7lXzgWDt5uJFyDBgc4zmOoVzv/FMl3KbHEqr6i/m/0avZwC1Owbim7klI/shKQ66LJxAsK9xkalIaWb4aPbI3@lists.infradead.org
X-Gm-Message-State: AOJu0YzIa6OZtW3Nyj/fBouUr1zjb8N392cAdmJjqmu1ehRia1kiC6nv
	AkLPD78XEqsg/LFKN1u/Eo6Vz4QHF3gGPeRbXzDY8BtyjcMR+09+auc9
X-Gm-Gg: ASbGnct25TE0lf4DWDmLFiGd6nkU4pA8GT3tFMQur+D5oVJAD8OrUsb/syB5/i1w4m/
	caHY+eZd/kOhqSOh8wkujDFl557pIJZtbzqzfM4ZhhmTnGxdLxw9S68KPY4acrm6086vx9yEaR9
	UDnYo59CgQummu5dOLWQkuLP99iI2U28qJ0nagKa9D6rvBSNO3tJNDOHUmyXEpdIVOZHueozDxW
	NIrQ6LE6fiLFM6aAN37jtsrM8yL7on+ONTOESC8EffxnpGMaVOt/uk/x/Ue5vx+kjSncsrvDasC
	2C1QiH+93cEntgKINS/xBb2bS8mGomPb7/aRW2pHuemD23UM2WEE7gxNoXHBhEBDD3Y07gmqI5A
	yksN7PoMF3R/GeShX6Ua1EZzxMfx2u2zRgs4WUEwbl0IkicFHgmKzWvzE25XrgYI5Mhj1dk5MwW
	hV4EPtX/frJCp8H9jAFEMs7A==
X-Google-Smtp-Source: AGHT+IEF4CkxscNYi/C2XNylHCh280mub3VhXy2YsQtWnD+IOuCk3xiDthoT6Cd2QfMZg0xUKQ0czw==
X-Received: by 2002:a17:906:6a27:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b72e028a602mr227544366b.3.1762595203327;
        Sat, 08 Nov 2025 01:46:43 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72d7996c4csm291514066b.5.2025.11.08.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 01:46:42 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Han Gao <gaohan@iscas.ac.cn>,
 Yixun Lan <dlan@gentoo.org>, Drew Fustini <fustini@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Guodong Xu <guodong@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
 Joel Stanley <joel@jms.id.au>, gaohan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/3] riscv: soc: re-organized allwinner
Date: Sat, 08 Nov 2025 10:46:41 +0100
Message-ID: <4692596.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <cover.1762588494.git.gaohan@iscas.ac.cn>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_014645_735494_5AA21CE8 
X-CRM114-Status: GOOD (  10.97  )
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

Hi,

Dne sobota, 8. november 2025 ob 09:20:22 Srednjeevropski standardni =C4=8Da=
s je gaohan@iscas.ac.cn napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
> using different IPs.
>=20
> d1(s): Xuantie C906
> v821: Andes A27 + XuanTie E907
> v861/v881: XuanTie C907
>=20
> Han Gao (3):
>   riscv: soc: re-organized allwinner menu
>   riscv: soc: allwinner: d1: use the ARCH_SUNXI_XUANTIE
>   riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES

This series is incomplete. It introduces ARCH_SUNXI_ANDES symbol but it is
never used.

Additionally, patches are not organized properly. First, you should introdu=
ce
reorganization and only then introduce new features. Also, not a single
patch should break existing functionality for bisectability reasons. First
patch breaks compilation of DT files while second restores that. This must
not happen.

Best regards,
Jernej

>=20
>  arch/riscv/Kconfig.socs                | 22 +++++++++++++++++-----
>  arch/riscv/boot/dts/allwinner/Makefile | 20 ++++++++++----------
>  arch/riscv/configs/defconfig           |  2 ++
>  3 files changed, 29 insertions(+), 15 deletions(-)
>=20
>=20





