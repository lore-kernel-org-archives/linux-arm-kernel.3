Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7ECF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=; b=13hvXa9caOE0OAjr/JNdTijJzG
	4Eh6WRDaTKcwX/PY2UrghD/GmcJukt+SdPYvLwge5hGWRC2jgsvpVx8GCDt0jgo9DQBH0ctRug5nq
	GZ29MWFjZLUfu2j0+vhT0yddrOYat55nm3eqa2wD9q4j1OH+OmylGGyHD74Y520yIEkHzlZDKJXpC
	ey1L073SQy3TEF+1kx9T8GCNtuNVLHqqBkelK2KwIZVzQPJ1tJBUAFSaf3eVrIfj70qAoQcxNAMvM
	UjkEorWAvhPRWAX+7uOVmqNIJCqngt/hg6hR4/anVNkoyqD6x2Ui9g04ynuTVrsYx3l/ubfQ5xBFs
	0H/FaEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t1b-0000000A7JD-26gX;
	Sun, 29 Mar 2026 16:30:07 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t1Y-0000000A7IM-2D2K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:30:05 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d7ebe11bffso3084693a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801803; cv=none;
        d=google.com; s=arc-20240605;
        b=Oc2Tz7Zy80DPKDDaEYdtr66x27WBqTzRj9KCYebNyzHXiC+WK2kjvtLg1n5arorShM
         uRnLq+HH1LJ+DBOJbGsf0OJrJR4CBt/BNavl/KPaKDsGx4/Oh3crwBBJ34C3AFytPHmo
         4ilu6hBlyiXT/T5Ek+vWirCJuDilUJsvSMOoR4rLeniE/S7ghCq36tuY/IHnRWrsC2iF
         y90hRnMQp6iIBU39UdT6JGb9CV/s9VAcMh/QLwCAMQhd/PuiGZ6E2OOWmS9Gh/1jACDB
         yjoGWiwld2o+8jKuJ/oWs8Ic7O6YChPvdJ7UMawCKgVJK+a5ke25LsOxhGPcGNzFPbAa
         Cw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=;
        fh=M2f8ZDWLjASki1B70s1uhy5jp6OxSZUYVZEbOI68Gio=;
        b=cw3Vv5dbfAadu1F1mXxqc2hcmPV/Pm/3UiYg9IqAw/o8F42dXTABRV4k6tjqcCrcfW
         iAORDr0384orbU1bzFdRq8ZLh2xlXj1Ql3pW3s3dP6EqeTVl3J3tvPAHnS5zTxtzvhj4
         GCRyFVlqDDjEQ6y9xtXDI3E/yzn3wVU2FzY/JV36bWLyzXawjCFxHtTESevc3OFqoCLt
         4yD7It6XTXMhQjA7J1CWxZTD6u4kVReEGHOrY0cG1eOps1ESR8coCBJSyEZPJfJi8Gm7
         jp9b6FcmcpTizhG2CLf2CWQ33eUWBfjKVPPZwkGTM6HCURH9ce6m7E+8Kswzj8Vkd6HZ
         mnzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801803; x=1775406603; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=;
        b=dPSZR/TjZ2Mde7KzNx4WujTTQaUy5tBcs7LzhxVrEhTzSGaqMDvY31gIoHug8atY7M
         PYgRx8/CY8N8pqFXAxzTXjzssZqIbYcTmB6LDCPAQ2amjjlgLXk2Nbq5JMV090jcenkm
         l1iOFbWcP5wHv/a2s8+ebpwSA0SF1DrAUAQAmir4onOEj87iJ7CoZz7lAVnKV2JxpJ8W
         9goHiDG55OCiYH0DMnO3nemRtsYpeYswErC0I6fxxLx/URkiLKbTyocoS0PxAPjqnXe8
         jjT6isdOBYX4gDLAf1rfPhY7A8x8pfgyQy8KJER/HCCvFyQU96G/96mlJ5NBGzTIVsky
         DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801803; x=1775406603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiD8FHcWjlfKLGbWYvCviOg7SMJ/k+r9s3JA1CV2BMw=;
        b=fHdYB8dy7zH6PFh2cidUyYGD7MmUSunEqNXzdUQ72e0kPV0ig3RQ9gNV2PQdanwyEh
         MXXyup9U6VHd+aIgMXYwEE6Q4IkZH2wOPH5UYWh6ety79jfF/ptjeVwKbHUfeHnIFfhh
         zyIIm9ZeqxAXuK/ZGCEsZz2SorHbdkNDyAUc8xbzKzDs1EnsryNkBraykYVHtRKX+9cT
         F32UqzV43EpuqPAduUG9mXLNiNsH84tovDq6vs7kqh2TAAkL+8IhHWl7B0SonyyYeD9q
         MO5SKarzR0Zuiez+YFhFZFgpC1+K2SmCMhpH+hhQKPW9TF4zkyFTHoEXLn1ySwODmX2q
         6U+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/EvlCIwPK7YXOgXv27eCJDTfz3tSLD0+LcQ4uTG284ygYmYToXf72xK+6FEdXSq9qmlKEHpYoWFfW7c7HO3dz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyay6ne+N5i91sd40UWbZj7nja6tVW7WMyhXHMZfKnvwj0r7fqW
	ZH+5VfN5Dt+MOWKfeMl7JO0nbY4ojey3IpN8MBWEXrFQ0euzOatm/CTBslmo8uXUnEnwUIVD0EB
	lS/4eMdz7HBe4wsDvBE4CwIiaoysaeYI3/zxjXk4=
X-Gm-Gg: ATEYQzzYO2EUp/D3DRxgJnqht7iliCgOm5z/HuHmG+XRFFhxEd7RP5FeRRslm0hVdUf
	qHy4VXCfHJ+LCcFpLohtnH/nihsSI9+r01LC9fnMDBtPv0S7Z5VjrQw4Y0H+ZY/FUme8oF5vqGU
	gu9Y+RVPbK7FdzHZcDaXrpzZRCSQ6w0KX6osbH+bGUkZVga283+nRDTucKlP1qtuT5wazL3mrTI
	MN+Tw1of28DlnC5//7EF+eaHTmmOpNyvN2d0p+mFGpQd5HlFKNhutDEMeZFH9VbVGLphFcRZUy4
	NJEnPfH9
X-Received: by 2002:a05:6820:212:b0:67e:2fbd:c363 with SMTP id
 006d021491bc7-67e2fbdcb15mr837332eaf.9.1774801803363; Sun, 29 Mar 2026
 09:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260226-vcp-v1-1-766c5877017d@gmail.com>
In-Reply-To: <20260226-vcp-v1-1-766c5877017d@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:29:51 -0500
X-Gm-Features: AQROBzBl1Ou1fhsJiwTmhLJSC1Vrfy8M5kKovqY1sGQqEd9y-J-hWzcG0L_WLfw
Message-ID: <CABb+yY0YNHSnkBegLhr-YtAOD52d+KH3ZyqKtjkvYp-=37Q61g@mail.gmail.com>
Subject: Re: [PATCH] mailbox: mtk-vcp-mailbox: Fix the return value in mtk_vcp_mbox_xlate()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jjian Zhou <jjian.zhou@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093004_562773_7058767D 
X-CRM114-Status: GOOD (  17.64  )
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

On Wed, Feb 25, 2026 at 10:33=E2=80=AFAM Felix Gu <ustc.gu@gmail.com> wrote=
:
>
> The return value of mtk_vcp_mbox_xlate() is checked by IS_ERR(), so
> return NULL is incorrect and could lead to a NULL pointer dereference.
>
> Fixes: b562abd95672 ("mailbox: mediatek: Add mtk-vcp-mailbox driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/mailbox/mtk-vcp-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-=
mailbox.c
> index cedad575528f..1b291b8ea15a 100644
> --- a/drivers/mailbox/mtk-vcp-mailbox.c
> +++ b/drivers/mailbox/mtk-vcp-mailbox.c
> @@ -50,7 +50,7 @@ static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox=
_controller *mbox,
>                                             const struct of_phandle_args =
*sp)
>  {
>         if (sp->args_count)
> -               return NULL;
> +               return ERR_PTR(-EINVAL);
>
>         return &mbox->chans[0];
>  }
>
Applied to mailbox/for-next
Thanks
Jassi

