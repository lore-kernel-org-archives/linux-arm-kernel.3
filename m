Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E78106F315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=; b=AKOUoT8wZl+vskdaNDJ+iTbyC3
	IGdgOgtfBYXAy1fu9FkOzieX8gGAAXrvhkzyvLvkIuPpyMOYMTYoC2VrcxUSREI+KjlZ9rMQxSCXN
	V3SAA8YzSVnlw28NY/5XpXbmQGaA4ZYfnImMjaEi/shHcc+zDzoe1nVIrBs3KIC/2Pbdx//yyqt+a
	Br3mlaCE2QTKCPErLB7JTyTB9TPUwSzRtccdFAkmlmRcL/a9aW92DR0zVT2igP24OVhJn4lCFzgyT
	Q+E8q5X9H7d++cDNsNZiR2J/wceshbnjcogT+IKCCDNpcWupbqxN1VYLZjxzI+yAmdhmRMM/Sc7ue
	H4LY5eNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hLB-00000005Bep-00xf;
	Thu, 26 Mar 2026 09:49:25 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hL8-00000005Bdw-0f1M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:49:23 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so1034442e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774518560; cv=none;
        d=google.com; s=arc-20240605;
        b=ihDpV7hL8ZfAsaDG8p7OxZ5oXshrojA0dtvLATqB7BDDTvlI2jrJ2qyERKNeG4+5vo
         wALaDA1tCzkN1wIX4/RNecEdWi5oezw1wMeQ+EauX0JlOuu3mirTPrRFIl7T2NPH8meO
         milJboFFyuNbWZpU1Z82WKEd2XdMtsFbVnZBfOh6Kv1Zyaj+6syRv9oz0xSc6viw2RoS
         pICFntQP2OzyX4eWY8GWiFhf4OiOCGe+osw3f5GOb7G9O/uxAKHdZwF/sobyDPtnlBSu
         j3D/nl8be/8vbxdfEkIgWJXTVrPruf76iclY0zAKWAUfov3OWhYnPMC2Dht9xol55DsT
         JK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=;
        fh=qFb2871S3K/9HPqh3vWnGB0HoHyVS/J6XGeLq2rDEkQ=;
        b=IoUo5UCguAi4NIUMWWTPraOScqlut2oi4oC99GPlc3jCQ/XYKW3MNlkheaaiu68XXk
         /RDZloQYB7OGYlx99N4hkWZAub933CYOxI7OadfSR00N3hkqkR5zhdENFmRc0PBIC83e
         6Gt59T5RVzGt5Lk3Z19ffl5zEXLsH9Ffwj8dQ7nfKpNK0TDRgoYyCUeBXu12lOd//Ao9
         3z5injg0gCDIxgehBwBD07QQUf42WG41c6B8B8AFkhE9jmXqiX8KKPMknpFE/dBjapGe
         AV42GhWzAVKAh0ElBBvtzcbt1Hw0x09j+vNBkG6juVTdCKFYh1kqM87MKCduZSt4G+Mf
         JaBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518560; x=1775123360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=;
        b=cImS6t8LY2hTfUi/3bXF60Pl1mVjo9JctYL42iFbxQlEKchALHXFBxwv1Q5VMxe1yf
         U2b6LJra3BDG5LX8yCPGIeqzhXiymHK7YrI1Vf8Td9yQrsA6nm1+vIlEN07v33Rxmh37
         cj2bW2yu8Sybrrf46PIptaY3DU74UjtKeA2xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518560; x=1775123360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=;
        b=DQwWHvjYUQNnXHaaGeDn6c+1re/rMbPJZDduONcwMUJfqQLs+N2Wpx9YLtRXxBwTJ+
         TkFu6lJrWl0rrtmIhfrdF6Ghs7XVl6sM5oYynpeEYajQ4LpmHCehK8p5gdNV8OrARO7L
         fsLCmyr9GJnff15hxUfRM32mJLI5UKU4pLt4aQopjrSpEID6LP/tDfZOVoace0VaST5L
         xKIgY4Uac4MC409GAzVsMSOYTM5GJh1sml8h03voDQndeCNx2ZyEdATNgSm+EvVxH0oz
         kP6tvozXeTJjq/S0BLjiCNR03m8L/JACCTX9DCfiJJEjY3hu1BBWdN0heio8KyjFZmVm
         cUrw==
X-Forwarded-Encrypted: i=1; AJvYcCVf65ljBwH1jK0dQEeYiz/2VqnZIehXTzeg8Ulp//1M/kQm51xLFX72m6IIKLAmUe6BTJnAcr2L+Hk2By/6Jh8z@lists.infradead.org
X-Gm-Message-State: AOJu0YyQXk5PynnfKGn7ijgmcZtO/dOtN6BrI7knBikM+jWDU1Jww7Y/
	1I/rIBvBvfbv3emJCiIO9D4ueeKCatJogU1lxbNopllO/tjZT9IiSlTXskqHrn65M/tvATKLi4X
	0bxGacntSjCzP4hPNHmGZ7AAEfHfWAGPQ/xNHS3HzMx8FH6x/cfw=
X-Gm-Gg: ATEYQzxfEx8LP770eiFLns2xk+HJASUX4L6DeCcSQc8TU1pMOrAVyyNwd8qALXj9EpP
	eTeuJBZjDIbZP7Sh14UwNQ5kCWAhziQicyL+9uHoCArUqjuTpjRtuZ/b87qkF64zaZicQKGA2g1
	QwNuENKTtGKZigpqPn0mgGoLUVxF8oqV2F5O6scUxPxVFjp9ncfhaIW2gOLKG/m4L1It/Ilgdv8
	4EtNTh/Ogl5feTtLH+Kz5L3/zvzxRfJw7fLiJ63260iFoAfsWIGs8p9F5T7KsS/SI8HdyiO4hKY
	YIC7shhfMxKL1Z0idvzgDjCKE6TUA+EUZ2/MOA==
X-Received: by 2002:ac2:55bc:0:b0:5a2:8570:299a with SMTP id
 2adb3069b0e04-5a29b995643mr1745645e87.34.1774518559747; Thu, 26 Mar 2026
 02:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260318084621.4127757-1-adlavinitha.reddy@mediatek.com> <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
In-Reply-To: <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 17:49:08 +0800
X-Gm-Features: AQROBzBAalqKzp35Y91nZQL13UXSFnXuvsBfaF-bjpY0zqhQlozBnv2cKghChRQ
Message-ID: <CAGXv+5FYSCG4NYqUcBTBAvG-6=EQNStS5qRnzYV0oGzJ9dJ1bA@mail.gmail.com>
Subject: Re: [v1,PATCH 1/1] i2c: mediatek: add bus regulator control for power saving
To: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024922_209645_752B1757 
X-CRM114-Status: GOOD (  11.23  )
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

On Wed, Mar 18, 2026 at 4:46=E2=80=AFPM adlavinitha reddy
<adlavinitha.reddy@mediatek.com> wrote:
>
> Add conditional bus regulator enable/disable in mtk_i2c_transfer()
> to support I2C bus power gating for platforms that require it.
>
> This implementation:
> - Enables bus_regulator before clk_bulk_enable() if vbus-supply is define=
d
> - Disables bus_regulator after clk_bulk_disable()
> - Only activates when vbus-supply is provided in device tree
> - Has no impact on platforms without vbus-supply defined
>
> This approach provides power savinggs for platforms with an extra I2C bus
> regulator, while avoiding runtime PM complexity.
>
> TEST=3D Build and boot on MT8188
>
> Signed-off-by: adlavinitha reddy <adlavinitha.reddy@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

