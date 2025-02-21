Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433A3C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ug5SJCeUtM4Us9l64osKbi0C5iCf3occVKXeUSjbr6M=; b=QpruExo1o2QrWLwUu13Ibm6iPT
	e+nJMANBtn4skmaWJM6+Ltfbwoh+uiFr3ReVT74jsUPaWeeW1dOPm66oI8NRp60fsgca4S3DOg1FM
	eVzdbTVoXbY33WozkgM5BfnlTESEc0l6GjP3vr7ciIguFfyX+IZeyHc9CQtZ2lTYQNSpiXfGHYM/c
	KdDOqIzRFLj+TCwKVw8r029gfzQj/rG+2H4nYFOigBH4J8+je/J9EFy9P0WyPp69p88jDZQmUjlU2
	NMm8aD9o64uW2VbE3HoTpoEw3XzD9c9tyA58byHYawlcIiBW2SLGiW7qJu8e1MT2+oH5D5d/faHyv
	uyZahNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXjL-00000006WbM-0MeZ;
	Fri, 21 Feb 2025 18:26:31 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWVz-00000006Jdi-1ZVa;
	Fri, 21 Feb 2025 17:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A4DF6157C;
	Fri, 21 Feb 2025 17:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E397C4CEEC;
	Fri, 21 Feb 2025 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157718;
	bh=s5eo+jWFRpAipFm09lCIDLtuXzM+294r4TRujXXE5u0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GzjWBLIbRxpFtvcpYed3KJH5oTstoyhONMh/76infiaUq8+BKchsHfECQe7rxsIqF
	 qFcpc8lIOphgU56JOdmPiHKujaATg0VW9uoRwxwBPQfyI3sPAXrly4pFA18F7KGWNL
	 NwoG9XpzqWnq+f+a0L78ehWlYynKd4CiEsPHyaZrD4oAmPCR9IYJYgqMx1K2vds61F
	 FEmTYM4LhyFNfXyTfRI0N1ACovuQO4ZA4AeXRs5g0uVERIQI+fDEDiDFZmPsvnKVm8
	 pj9479jGjo1KY/PzySQYuxqdo61I+bvpRxMZCkBO3lFaJX9yUMRAOjxaBY5wzIgPsG
	 yBAgKohor6mFA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso3679379a12.2;
        Fri, 21 Feb 2025 09:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULaCj4oPIElmwWoazcudSwk7pUHmZGt8+18bKBR7g9DZXHERr3AnD7fMDSuoZkoXcWjNQGx2VmsaD1D2DLiSY=@lists.infradead.org, AJvYcCVZrvngXpYatSgbh8+llFEk8lwdPX59T5+z1WKTrvqylt0Agp/mOl3pJAt0J6q86Uon4X/fufVX0rg4A4PzmccE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4hiXLcknl0GS05FiZoK3GmwcCXKBAzu2ZUVDJUfUenVQhBKb
	+ujqZOdePWSlglWc7/udJ6Wv1Im09nbbf37ueMnZl1AFRykGknM0ri2iyWc5LubX/FkGdWKXJej
	EFznYPWuDh6BNDgtrkve+t9nSBg==
X-Google-Smtp-Source: AGHT+IF3O3vdI8KmOvbFRUGPLCBofMuxQiMkHrsWb3wzJcHfb8wAPbp8iF9eEU1cB0o4czpk21gl9NW97USVLhVQ01s=
X-Received: by 2002:a05:6402:e02:b0:5e0:9ec6:12d1 with SMTP id
 4fb4d7f45d1cf-5e0b70f0800mr4060556a12.18.1740157716547; Fri, 21 Feb 2025
 09:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 21 Feb 2025 11:08:25 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
X-Gm-Features: AWEUYZmwuM1JP26BKUCaWcwByGaIWjPB3I55aqksnOcD6mvIR49_PbC1vcSeCe8
Message-ID: <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, pablo.sun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 18, 2025 at 3:04=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add compatible for Display Stream Compression (DSC) IP found in
> the display controller of the MT8188 SoC.
>
> This IP is fully compatible with the one found on MT8195.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

