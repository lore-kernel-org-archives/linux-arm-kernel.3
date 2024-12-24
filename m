Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CD0E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03ARuXNN1LYC6Y56lO4Z0KutZ2KDzQyEBAbl6atBMq4=; b=xnVuUE6mG3cDxYw9VwpJTM/fab
	IAr5HrbQ+bmIa6LXNGlMl278lSw4o/lE+Ee9PnQvi19L7wL9hlhdiaLAGK1JlRjuWdEFtERsC5Plk
	kWxilcDp6nqQ2Fp71ERTBT+bEkUgDg1MBqhee8RjPkZ75hs6iK7+z8izO0rw+NvRkMXCbXpTXGD4a
	gSML33UMIuoIKW5+hWQ9b9HLszHIsUulBtNPYaio6pxDogO1FtGKMIF9jJIZ8DS9pGDZ1rmXIbFRi
	ROQOvaqGeYVVRPot51liefiwEFXxzZfEr3IKglpw09bSz5IgEI5b6hgMp1FbApFpHY6iH+JtuUoJv
	7YQSZKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ39n-0000000Bs0J-061q;
	Tue, 24 Dec 2024 11:32:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ38b-0000000Brs4-18QR;
	Tue, 24 Dec 2024 11:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D76885C5EA1;
	Tue, 24 Dec 2024 11:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587BDC4CEDC;
	Tue, 24 Dec 2024 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735039904;
	bh=03ARuXNN1LYC6Y56lO4Z0KutZ2KDzQyEBAbl6atBMq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VhSxux5OjALWeX9mJiVMA1KmH3gKWvY+37UDf0WLo2/An4aMSHs12zWW9u5uYHdtC
	 xsOMmh3QAC8HKxB0/zvHtlZILXhAhsEmzJGJceH9eczG1gLGXemamg6GBdW2OyrXcb
	 P4JhHTHiuOcsma/8QJXTgqdMPbt3qeQYlwFD/WNt/MMUiNio4iYcVOUX9KhW5CN7wf
	 AY8SyTfbZw35bw6LkY07y0CGwVaHljO9XtZwYjtbzqwckaG+cx3OXSWAVma3yXNV5p
	 jvg9dPkTLOtjHIXpAoTNO4sLNJSKupH/um9bt7bQxbmG+NqCnZU7+LwB1+JoIevYhj
	 HYtzM5wwESR/w==
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-218c8aca5f1so59556535ad.0;
        Tue, 24 Dec 2024 03:31:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMAv6PI9T0KArfFsm/OAkDQ+gZnQF8yMw7INYlDAWOXsgmpfQxl7oSo+MqhxkF0rr0kCUAsUDVmTKq49C/z2k=@lists.infradead.org, AJvYcCVi63L61yxqP+tV3Chekh/a55CdTD0+zDsksXUHZ/8oygYQ+wtSZHSDGaQ0PsmawJHfseEMMD8Ejm77jyCVbCbp@lists.infradead.org
X-Gm-Message-State: AOJu0YxqBXgOSnlab46lFhjhdtHetRlWSUrpEItF4bhzzZ+xs7wt24MO
	e1tSqp5pdjRpT9my2RIdnpTS2D22812M9fXjbHYd7EaDYN/C4TxCabmhR/GQJEBD/M1P7BdZp9Y
	/z32UYmLV+cZVH06uuScfURp+Tw==
X-Google-Smtp-Source: AGHT+IF0Z2A1ZpCpDpYV0wej1AcD2Tjd35Ya5woNBEnskBD/S7v7TPAd15rnS+ywO0yVT1bM1GTtN5IF4uyo/ZC9CPI=
X-Received: by 2002:a17:903:234e:b0:216:46f4:7e3d with SMTP id
 d9443c01a7336-219e6e9fa68mr217969135ad.15.1735039903928; Tue, 24 Dec 2024
 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
 <20241219181531.4282-2-jason-jh.lin@mediatek.com> <6cbe2f57-a63e-4993-938c-7696a869dc2f@collabora.com>
In-Reply-To: <6cbe2f57-a63e-4993-938c-7696a869dc2f@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 24 Dec 2024 19:32:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8mUutkz+q4-JggbmQRpNn6tukM_GuQ-0rwVRCoOd0mGw@mail.gmail.com>
Message-ID: <CAAOTY_8mUutkz+q4-JggbmQRpNn6tukM_GuQ-0rwVRCoOd0mGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: ovl: Add
 compatible strings for MT8188 MDP3
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_033145_356737_5CC55486 
X-CRM114-Status: UNSURE (   8.04  )
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

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B412=E6=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:=
12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 19/12/24 19:15, Jason-JH.Lin ha scritto:
> > Add compatible strings for the MDP3 OVL hardware components in
> > MediaTek's MT8188 SoC and it is compatible with the existing
> > MT8195 MDP OVL components.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> Waiting for an ack to take everything through the mediatek tree :-)

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Cheers,
> Angelo
>

