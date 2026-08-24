Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4378C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=; b=eHVbFqAwfh3ZUsxiz9qAuBOZ8Q
	SHTD575IV5r4c1ILk4P5OnErrMYSCGsy7KTv7SjsWMGquO/ij5rSDwi4+oLanwU+3BzOZ2I4sd3Ux
	Hrz2pp0Pv6mudaVCfC36Y8vzevmLULvJUh1hLKhu6q/JFmlGJA0phv6xnPzgRDg1LDZubRD3T3KMb
	hiV3xGOEz1ge5MQf4S8izOFm2umXpNaqjrR3q1N90PHprNJvS21nsFp3Fr8yEPvHozlHpoozmTENL
	HXsIE+i9Tu+Vojm+kW5TPwwUuAfHtbrXdafq7aLcg8+Atyr6UIMo9eegGY+fpP56LLwWCqKeiPrS1
	B7W9i+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQjM-0000000GHn4-0kVW;
	Mon, 24 Aug 2026 09:12:36 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQjK-0000000GHmH-0Cgc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:12:35 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-66c8e41f703so3749148d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 02:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562752; cv=none;
        d=google.com; s=arc-20260327;
        b=L2gsUYP/AOuNMtdR5438a5PvYWRY7QDydVzXDdUiLk3WRofwZPtaXLjO7vTkIhdzFi
         NdoXxykJBd5GtylfjRoPt7+fP6PytUdYBq5vHex9oZdNB/Sl36JeYoZJHKQ94I/rIgLw
         4b9/yvpmrlKf1hCWjaKbQR/3UMNJZoR5ZZAMDRWiKa4HcW5dQO+KtO4mjVGBfciEUPWH
         FJfRMSMQ4RNbNVYVvjRGP0eyuUO0hzeph0mnbTKZfkF8n7NaK8Nhi8MDVdWnABTI4Qv6
         5HhfRvf2fWRnqf2dgO4iZhpo5GkcREVxcWuKsxRpOPGoWOIu5nF3BCunIIQF7m34Gkka
         VGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        fh=bOml6+VXDWcWpLBIjmn4J9zv7nKJN2D+cTcTlvuqbqU=;
        b=km1biQyzdwVwB+BfxzslNV2vZ4zfqEZrmbFbtkDbA6WFqRmI1L/VwpojOoYxQzIGbe
         dT3YlV0k2ZZmeh3Pwvj6O4SgOcK3JGebD8cv+sjMijlIHd7SiV1O11SNqdK+XQCtrmeu
         yljmis8DRbK80B5EcJLjeoVTSZ/x1hfdmiOU3ctJKNBQXa7EQ/EPPxBHFp4ZtxM443iw
         JlGRICTjcMhlwQTpc/uTUFPN6xSCE+0GvaaMv9X9bwxPEJS9cHSCZz8J014Xw5M3zElm
         XO9kjKh0vPtUbFAgjYUFO9aamJPBjW5BtQPj/hKxw6dYKQyz+tewH2VWYwUFeHXLwKQO
         diuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787562752; x=1788167552; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        b=Etl8xhJLqd58UnKYMUYNmrEVBFIEfRC96idPMb1fcoG4McG+6ZHVjp5JCjeR88ByI0
         snm0K4KjW0PUhy+wYGZxDGYI+plkVm4zS5h6gDG8oL3Iy9BASGilRBDs7Ohcx3UguXBg
         8ege9zYcIlAXv7NlNDHpwX9R+TYsE+xqzXyro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562752; x=1788167552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        b=JyRPLxKOCIJJ5fL78PA6LAv40Y38A7x98iI2ssuHhtD2ygXTZClgr/4nmE202ppRoV
         +bpq/m9igYfA68v1kL5NwcRUS+lEPIc4pHpzfib+sJrttZvUv8cNVd4lD4K5irMHIn/v
         tvL6C9e+zSen8MFkM/AHWp4qpLSfOSFSCCyrlDsqTBzPjux42BIL4GUAmv6wCFBb3gBB
         Z80PwgTUBo0D3xdzTLIp2wuyWse8o9bXgjjSMov/TxqKypCaB8PULdUZHm1RvpUgKUvi
         q1lLyRlo1i9xlbnQTjcKCsn1+0iWPUDETdAcFneDVg8BXqXqS3/SkwoncMUx1VRsu2RX
         E3+A==
X-Forwarded-Encrypted: i=1; AHgh+RrUpo5C9If83owQ4OO4wfR9oLjCs23o8o8WKZjMvIv9p9Nu+0lbJqjEjdLUUC5KFmbt74ibTlXKI2MvlZBesOVN@lists.infradead.org
X-Gm-Message-State: AFuF++ltHJeYK8zDeY8pHDtbIRTIIFsQmiwNN+zDSETV3rfQ5GK/3Ero
	0lTiT+duJ67BAM/yQvbaDRZMto8N+TxwdGTMhXckTGcgty3T3uCWypPrpUOSAnqXKD3pRvDmxXg
	XOTCN4MJmxvnKO2tgynbRfDmtNZyPAI9Wj4P0nX+R
X-Gm-Gg: AR+sD13tRFS9DibBUVwE8d44f4R/0zavD/5v3T5kWEJ5WZ4Z/2DEg8cgFlH8NtiP5U1
	tAMp5SlVx3KZ26ghyDvaD646DbDvVi/aF+4F6YJYzxMBY0pz0c57R5lIHl/qnBwXtGGJ542Omb4
	KiR7IdZAkfy8pJ+B3XWOFKRyX/bNTYh6OeIsNSoCj/Fx4Qn6PKk0AA6LOq5FGecyGvOqfysHOYJ
	Zdn/tgQniUoc283W/HbGAztL9L3RXOx23mYf5EuLcE2woHYpmH2wypZGqjjjC7sVeSlZB8fy4OH
	jpgam4pyZlC2pu8F118pXwgiygPiGPk3bPSfFSIUcWkTTCC8HyyzMr1r6audUeWH1qIxXZfRxL4
	=
X-Received: by 2002:a53:cc8d:0:b0:667:a285:7624 with SMTP id
 956f58d0204a3-66ce4b02a7cmr6592191d50.35.1787562752511; Mon, 24 Aug 2026
 02:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260824090409.203230-1-justin.yeh@mediatek.com>
In-Reply-To: <20260824090409.203230-1-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Aug 2026 17:12:21 +0800
X-Gm-Features: AcwNN1UaUKwCCupiOXtWdw-rOGn8WYmR4nT24X-TqWmsTUf3H_iO0AMalDMrH3U
Message-ID: <CAGXv+5ERR61sdVK6VYugeCnOaEHt8XBUZZAfj_GXvAJg0hiWTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0
 memory region
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_021234_129468_704D69E2 
X-CRM114-Status: GOOD (  20.42  )
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

On Mon, Aug 24, 2026 at 5:04=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com=
> wrote:
>
> The SCP firmware in linux-firmware for this platform
> (mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
> drives through scp_c0. On top of the segments it loads, the firmware
> allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
> outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
> over memory the firmware uses.
>
> Enlarge the region to 9 MiB. apu_mem starts at 0x55000000, so no other
> reserved region has to move.
>
> Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first S=
CP core")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index f382f90c48f5..35f60b5bba6f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -166,7 +166,7 @@ reserved_memory: reserved-memory {
>
>                 scp_mem_reserved: memory@50000000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0 0x50000000 0 0x800000>;
> +                       reg =3D <0 0x50000000 0 0x900000>;
>                         no-map;
>                 };
>
> --
> 2.45.2
>

