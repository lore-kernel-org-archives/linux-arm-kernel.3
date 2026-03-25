Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E395FEA83C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=; b=VxHajFGzlQkJzwR0+edpu7PvG5
	snMHD0b6YgVLILJLiPgpweu20W1izQKigpumL2qrO7CD6pnG17AIO2UKIQLuBJ5agxkBua6RPut8+
	vr1zyVB2aQirC38ykVBigZ2hV7g5vfYXoMFvJ9HZSRO4woLJ2kZvIZ5mqxfCNdaL4NOrnmvbjiFQ5
	OLCWxhcgUu9EvnBs/yT9yrefc7S9y6dKMr8rNJ3LKQg3vnyQ1Dk4L0zCiuDAT5NN7ctNlqEbvbeoT
	L7d+OusaQMxs+JB/wQJCaCC2mj6yHy1X+0bp2+wsQJCBavWj2JnLk3BYsn3v/jGJpY9IVZyahWDhL
	5gUQy3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kcn-0000000340J-2DVo;
	Wed, 25 Mar 2026 09:34:05 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kcl-000000033zI-1cnd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:34:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59dea72099eso5849339e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431241; cv=none;
        d=google.com; s=arc-20240605;
        b=HYpDD4dqUN28PBEw85U70H1EWm1r78oGXpw1qpd/LUohc4dfasVVxdmho84OIclCwp
         GPWl+5Dp+ho+da6pQHDWkpV5QkyAEXYuxStU95CxrPmeaclue5oDa402CMn3rGhfF+05
         drN+YtCnvGsYCp1uuTUs2oQUYzCUlNCuGXFich3aGwi/y0/pdG08g0H0KxOeu0cXXajJ
         K/pj9tD+8dqVgjiSUFWto93k+Ob91m6oI6IN90LfAiliazyepV1PrYmKNTjYeyk5PDAh
         2R9BT2PG7vh5uyobtHgoeIhoI4WI/Edj4JOysXLLGIKbaDczWPA86JLEEN7tULinZr5Z
         9yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        fh=CtqEDP/QjUoLIQUxwMX9PXFg5+TU5lIvKPOyIt2NI3w=;
        b=j7hLf1hY6jb2lL3rKWWQW8WNILYCaxUE7xASs9ABXLVX6uuDa7U1V5ct1naqM/FDw7
         XSNGfKyx1Q3V0Vyz3JtSOeUf+E1YV0HbX1N6JXMhUCs1XwBWJkkCtBIckCWgTbDEDjZu
         hH0+gVfvtu2K3DgoBe9E5SDINMltuGxhgWBE9OWaEfpQrVcoUzqpLVWc+XeqAlTS74up
         DK0nrp7JLujDgSph9Yf2RX6pEnmTmEEOooeRnnm38rxZFm1c0cskg5m/kF7XI9/0hr0h
         gVyicZlM2CTDakBTGYJbBbev/Ds4NmiUsIZd0tAM93kiLYx28cpIoRAZOegYcWLZ1Au1
         sDlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774431241; x=1775036041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        b=Z7+c4VZffI2YFB1gU19s73DpUlvX6lEeJqA/bZHvE86Dqmt/vpP86WVtUCSSaBBc+d
         Rc0Eh8UtSUxwXv56NwY5IzZOCcx0DDZPE590pxsQCeEUMm5zqT6V+2HZvkCUH7AMp6NA
         MYBWtfYrVOI5a5BY8yD9CVneWgACKfjTyPMfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431241; x=1775036041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MY2gl1nH38Ouss3TR0Op2BV2a45ltxMnBfWmMEGs8W0=;
        b=PEbN2pqM5LFUuBqDcEVmpZucMX5AyoeaVvY/ZeCvVMy6QP1DN2Lv626lgwslNU96b9
         Pg91tOcjg/M7U1rfn/NOf5WG/NcAaL9paQzGByLGCVrlK3pE8NHzDFiXmx4NifTF9T5o
         x1touFbvzbTP+ddlNoYlKlVILUb7zexE/p6rlbEkewgDPPBnHtaOaNwVARRL6HezjO2b
         rwsrOiPomRc1axIEjHadiErcUL/EAkZhNJxZS+sOk3061U1yNsV81cw49Wef9S9PA5OX
         qDtzUp0Q+y43iqlYKwNAySwtINwDGdssC/gkScb8Oh3heTZcxMrk1D5hyByDYwP1NUoV
         AcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+OB2F7gl/X8W98uxbATOsffHCtYwbYqR6cZwsRGu4IV8ObqA3MyPWI2iFMQA6/B6LquSccPeNqOmw/hlDUUI2@lists.infradead.org
X-Gm-Message-State: AOJu0YwR761sKB6Dn7MumvsVFUEBueg+M3cLxDRG8lVlYvi0iQLD4vSm
	yPiZ3RpgQhoBWzxbKxWYdfeI0D6FPdERuzvuZ5KwWfX26YEWj7hi9iq3826IZpKjWxPrdKJ56nW
	MJyms2YQo6BT8km1lmV2CBvm8OMOhYziIWVcDlcGA
X-Gm-Gg: ATEYQzxvZ1cLqz+AZtxOpIuFsnxLEsr4dzMMZ0m8sXr8Mp3M5r/W3t2nozef6qhBh7a
	BMPM6Ne14dU5LX5amZoVUB/qBpgmgPPyaR58ZOEsTulXDTpKeOdog1nQT2H1ks0/SVWZe5UODik
	ewlDBENizaazvv23QV8VDvoKl1DMKLU01Dl/iyZLcHMiZAqm6600LM5WjqLivELPWflVj9nDL/B
	5cd/fQSjFKOwY9n8V8Ocx1EV9eJ/CQN7gVdsnluQf6ESGfjbk2LZHndSQcnpeH7GYQgkGt0nlNl
	NAmfSzNp+OXi3c1aB+gBzWD8oNc4tRObgHHX
X-Received: by 2002:ac2:46c7:0:b0:5a2:95e6:8349 with SMTP id
 2adb3069b0e04-5a29b995620mr642031e87.31.1774431241276; Wed, 25 Mar 2026
 02:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn> <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260325082546.1572405-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:33:50 +0800
X-Gm-Features: AQROBzBoVW0M0QSdDVNGtSFKBNttJVM9VIsbTSnjXBMQkFjb8Ekw7FmKmmCMyQE
Message-ID: <CAGXv+5EEFtifhMeTKQ9uCvih+Le8XPafxASiVXzd8BW0swaRng@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mateusz Koza <mateusz.koza@grinn-global.com>, Frank Wunderlich <frank-w@public-files.de>, 
	Gary Bisson <bisson.gary@gmail.com>, Cristian Cozzolino <cristian_ci@protonmail.com>, 
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	Max Shevchenko <wctrl@proton.me>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_023403_441847_4FDAFED8 
X-CRM114-Status: GOOD (  12.32  )
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

On Wed, Mar 25, 2026 at 4:26=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> The current mt8173-elm-hana.dts file only contains compatible strings
> for revision 3~6, makes boards with revision 0~2 to fail to match a
> revision-specific DTS and may fall back to the rev7 one (which lacks
> some gpio-keys).
>
> As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
> the base hana DTB file.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

I couldn't dig up which revisions were commercially available, but
our downstream kernel says that regvisions 0 through 6 are all
compatible.

Acked-by: Chen-Yu Tsai <wenst@chromium.org>

