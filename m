Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=; b=K7oz9Nu4V67wcfiJXXmQ23jVYG
	Jq/jb2+Hr4frDFQJrYsmfM+VgXcJ/NVBc0veDBVBCl9Fg7WYDZ6KuZDhwbLBDLqTX0Zn4aSoWRePA
	PtbTl8tBLF0CNYJaBJm43wR6mCuUGYz9NQzTgcn6cQTeTE4j2BfrZ+eCqw1U1sYVLUGXB88RGEHF7
	SvA7hNbIOU/2dm60LkIf5DbhczzMbr9OXdlJuscan/oG8U8tpTv5bhtoH+DPSye7BCNDpI9PEOGX+
	PkOCvuO0h6p7E4K6um17IXTQWvZK0wpHqENdZddXvF2Z8D9qagrTA1meWXd6H3bQcHsilJWV9OjGQ
	G6z+UqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgSv-00000004cOe-4BCo;
	Wed, 20 May 2026 12:56:01 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgSs-00000004cNL-3gII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:56:00 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-65c6a2158d3so3450905d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 05:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779281757; cv=none;
        d=google.com; s=arc-20240605;
        b=gAKGI/m7MnKSj0VLcM2Ne3FRpr0l7iSmcD+Mt1truPhO0Jo5QaPWk0F5e5EvMjmBQs
         TPa/P8i+G7ALlj1roej9utlKmIg9TZFt1ic7DsyzxCLD71HKjLjQIjAAt/sq24VJ0R5d
         nVX6Wi+rtePiE5wE4oqpC/otgBGfM2UovF4bdYSbnD2mL23ZkhETW90LIKKiiIXpPeDF
         3QW/3UkJDOzcUKA+rmxRPpKJMNBgURdWDBoUm0zVrDKKCBO5RDr29xz71fJo2X6lBi14
         azE2IhxzMHjc7ZSeIss2dxC4FL7dcoQUBFDl9/p0+fgyDIJVDvsC1uWfrte79oanKtzN
         Rv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=;
        fh=Jr3jj6jdA6/fw0WFxL9seeA8cN42JwbpHBLOoCDyl/w=;
        b=c8Sb84v2ZdhGhNLOz4RoiqnOEe435IdQaqRvltfg5fxC6kx2gq0sVTX9SBxmDRQw56
         FW0C/obikgMkHUufHbcwzKPyjWfESrwIccpBWPeS7lpuSLFTtmC9+J302iMO9/HzltTJ
         afS7Z78gdj8A9uA61y/rs71mSsvSf1GxlwumwZGzCtJBqPc+T7ea8q+fqcoNXh2rOXCi
         fwWZYYTQJxie2D/jAOL0SudPgC/R6j3j+lRucXgz06JXmp/ph8mJzbsJh7ep9EXpVFX7
         L5NNZ/xSnWA/G0A59VdvcHUmuGIOwXpY63CfoRckjrbg+KDldikpIrRrq8wMJFvW2Ty4
         tliA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779281757; x=1779886557; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=;
        b=LkKFTERuWHDYJcBtUmLZo/4UVOcUjSdVkH+UphlXjhX4HTC5Pr4KDgfE/8hSMKkmYM
         +3wvEDPH4ElegW2bZlZraf5SLP2PtvQOjIeDMFWH+K8Rb0E/NlYMw+LTFgycoseKIVDS
         71NiZluRJkVntDAQIONsGAv0iR8ofiBPBkQ9hYKVjaXGRmr6ZDUcrofTKmKTJ2Svzx4k
         JamQsgcUCnu3mrCzwLYD4eWXAkNi6Csqrla70+HgwW8t+eDeDGWo0kTWgq88StJ/3ozU
         Cms6luTnJ2LvluA9gh98G+31WppCv3Yml9MDq6FQjg1ifAelFO6LgxQRxRkDWNwKYQXE
         mGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281757; x=1779886557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+UZtl8z/kYGpSCumZSlladAkgazeQGoZZRlkbCob3M=;
        b=jnEuD7wRmdPKai4snYQYNlITqcHooUi+DTGy0UOBy40B8IotfmvoS0jm3Kx8x9gRE7
         IVuMupj7Uy0CPw6XUUXxjtv/t74LEAum/0MWHfaxSqgcbFl059At577YsHV55N07MpOI
         3Q/suWH8wkY6BzliBfidAYyvwuUzNexRsFy5usT7ck3dlmUIf/qMcnOwK4cJx4pEMbIW
         TOH/aW5CTjom9MgQTCt/B5xDPD4i1SZl7BMYGdHQC1R9Sv+hl1aTAQOCMFHabeHGouEv
         AGI9Am155/jMhzKttNRG95inItU3iBEIBoh3sjnoBfenDVcQgagCB3Xbp9ix4HBE9KHO
         7UQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pHCvkoeVDHqwYSj9I1oHcUSDcHQBgVEUxW/EWkNDQuaNGgHyBR/aj2K0/q2Zj/XRVgUfIIyalvIny+fEiZ9M4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Y2Zo62qWfEzpVGzLy4nw2aTMVY5dp5Yg+ppC1MusMRK4+G4g
	A1ukdYBOFEW/EFwyZLTUHGa+LdJCxzIfAQIhNHFxri6Yg2C0OA6Zufus/MOWQEo0+NRvKgVTcU9
	un9KchTJuWDvczZOkJNmr/uC4faEZCsQ=
X-Gm-Gg: Acq92OGZJsid8AmQcmYL0wL0zdvNS4MArs18kuk4/DuzSPjLcjg7ThNMm5k5pH+xxfM
	5R91+rWAc6+I5XJrjElBj7oNxr52tJGLwSMKFJQHk48n/lPHIZtI9Y2I3kK2oiNhNbC+0qEbfdW
	m3xGtxx7iyDNrxNB43CnUb7IxSY7XoTgcZLCX2K8q5ll+4IzYQNqT+Bj6MwafykIINJtkdSEd35
	cttIA/cgND9aVgK+8RXcDSeetkeFaqETYR166WawtVvU6UKIV4lX66C8D3+BrNuNZNCXRqL+3lh
	wklymdu898ZtsN0Oe2nEJW9eTsDkwv+YScTrvzLSku378aHIKsYOHe/mmN9ckZTYFJ97og==
X-Received: by 2002:a05:690e:4293:10b0:653:f72:f482 with SMTP id
 956f58d0204a3-65e2275e8fbmr18516144d50.22.1779281756819; Wed, 20 May 2026
 05:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260520021500.13504-1-liujiajia@kylinos.cn>
In-Reply-To: <20260520021500.13504-1-liujiajia@kylinos.cn>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 20 May 2026 08:55:46 -0400
X-Gm-Features: AVHnY4JAx00s9RY77VuK7Nfrn9COGaPLhAAlt5GNCqKcZP_N4w4YPkGy2JQbhi4
Message-ID: <CABBYNZLLNFNuSv0UBNQ7C2HTTg5W2m41hBTNpPw822GMAVNuhQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: remove extra copy in cmd array init
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_055558_924098_03223B7B 
X-CRM114-Status: GOOD (  18.13  )
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

Hi Jiajia,

On Tue, May 19, 2026 at 10:15=E2=80=AFPM Jiajia Liu <liujiajia@kylinos.cn> =
wrote:
>
> In btmtk_setup_firmware_79xx, the data length indicated by wmt_params.dle=
n
> in the cmd buffer is MTK_SEC_MAP_NEED_SEND_SIZE + 1. Except for the first
> byte, the remaining length is MTK_SEC_MAP_NEED_SEND_SIZE. memcpy copied o=
ne
> more byte to cmd + 1 than the remaining length. Align the length passed t=
o
> memcpy to avoid exceeding current section map.
>
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>  drivers/bluetooth/btmtk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index ea7a031000cd..53cba71cb07f 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -188,7 +188,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
>                                        MTK_FW_ROM_PATCH_GD_SIZE +
>                                        MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i =
+
>                                        MTK_SEC_MAP_COMMON_SIZE,
> -                                      MTK_SEC_MAP_NEED_SEND_SIZE + 1);
> +                                      MTK_SEC_MAP_NEED_SEND_SIZE);
>
>                                 wmt_params.op =3D BTMTK_WMT_PATCH_DWNLD;
>                                 wmt_params.status =3D &status;
> --
> 2.53.0
>

Have you tested this on the actual hardware? If not we need a Tested-by.

--=20
Luiz Augusto von Dentz

