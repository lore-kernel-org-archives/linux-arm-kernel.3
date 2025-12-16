Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB3D5CC89
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdbkGAZvcEXm5SWEKUVClkLJFjPHLzhKuSzzyVtMACI=; b=A4ooNrFLNHaeiT2FXwBgOmHH38
	6kmWTnKsYQXIMuW0j/0Y7ZzE4eraQ57N7DE/bRWZ9kYmSiAZhmQUkNbmXpmSYXpPcZLAtwTlynjtv
	UYctQlCl1dlQPME9Vd8RdpHJRSqUJXGc9tRRRKSAR64xFVh4+Nv6CJR6s/4pY8lTIe7rGHQtyuYv6
	A1iPbZUiRH7tzPgxj2DkZvVGK6cqn4p9alIz0xGtIenUAMx/haVAnv4pCjlgAEfiqY/7OpB99Mdm1
	M69mwhMFEhZXEC4DN4b2JIpTv8/xgtuVxlqLKLCPU54yHSD88Ra2GjyrHuoQiDGZKy/KXH5ZxsgmJ
	cPBI7LTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVREE-00000004ysZ-1BL8;
	Tue, 16 Dec 2025 09:20:22 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVREB-00000004yrq-0n3l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 09:20:20 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-78d6a3c3b77so46506467b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 01:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765876815; x=1766481615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdbkGAZvcEXm5SWEKUVClkLJFjPHLzhKuSzzyVtMACI=;
        b=G3dbaFrUIscZTL+blM37CSSMK5MAxCKr6MdsBOw4rlSSEWySreHTH4iYqV8s05Kkkt
         NIk/c6d3eJsy2EvJh9aOiUi9y0o57Kv9j6MQgwYThCybPgJBLPcvFg6tL6N8ClmnkS5L
         4Bm4W64RIu3vEqKTWvxgPiM/qKCiiadG7Xj7aNVcJD+PINK0vk2RyYmfxUdNOLS07qIS
         38B57PPehYzIvs+n9tKJvIh82eMqo24rbP7bRFH7R3dk1sLXsC5Qk5gPkNqgFNEx6D9E
         wEaA7kgBN54O0XvFdOduimUegnExJr3+Me6Nor2b9Cvv2Cia21jyTog2vK3wNdXD3Dhf
         6b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876815; x=1766481615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdbkGAZvcEXm5SWEKUVClkLJFjPHLzhKuSzzyVtMACI=;
        b=nCL4YqM5azORZQMzzvKESRX/2coTnOgKLwsaqgqJHLp9PvvWs9agy5c/qHdxFRKggm
         u2vwOQeug03LJGsRyulhTLs0L6OaqdQqNXe92H/V6c1f/J8faCLIxCFDJQh3LKdo/1pf
         l7RlmSmZc1+wvAJ2zVwVxoDOAVhsHov5cwPcNatFxT3N3boHaTa0R9MGGFH20WXR7Rez
         ZxcK6nFvoKZGrLHCD0/EkQAGjuxF1x581W4eBtjW/p9xoU+ScorPomWbe7VR4mrW7rZy
         8oh8cjw2wWF2Gs7CI6BKTlCKVNso7WsN90sASG707naQgr2tdKN5cAwXLWs+nmK3URa/
         /+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUsKAVpDaxSKZNTDJTeniQQouEvKviw7EJhSqyiZx+w+wYWTfjtDMnxFFTS/jqA4vuePOsY/qa0IjXOEpVqGRD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtc1jRjZ5GX0fLYi8vqZ7pB9yU4mtGm0Ra3DHDRrwhCipOHCaD
	W1VO0tSaS5ZFGQISbyvVqbd4huhZwNmuCezqESq3prpipNZX9pGB91ruAMRxrOKeXje5KZtBIoz
	47pQd2TPfZnTjZ6zVALNKnJba/3azH6YGAYQnNITgnw==
X-Gm-Gg: AY/fxX5xOx17Vaodj+lqbITMZbDY1TE+VJgjscz5P0sgYDvU/bT1WPJ0AzOxDA0eTWG
	kJoZR8Nc3psYpleMmP1DMPZ/Loir/Y5LeSjDCPIRZhoTjQMoQxBz0BbNqEd1N4Y1eKGa7R1lmzU
	4Qozq5TmUM7BEa2g1CV8wHOWouOWP8yan2bCls1XlwBncL2RI08zqSltO19QXlL2hD81/cJOEt6
	bAZMiZ8ToYB/9fNc9apj8aAjy71OugM81yi+zuQNSY901iIpXdm3iZkgEAPMtfVmxAvv43zjz5J
	pV0NuTE3lZqrDunUWqDNkvrMFB24sWGSxyqShMMWkJPrQ+6xp3L9EYqiHB6CCWZ7tPqc5EWVuNV
	HdxTJVlzwqw5lha7XISjwcAOLLfQgZpPLtie1DYx2137CMqy1qBkq+lmInxPwgrShTUxbseJaLU
	9H3YhjFlP9LLf9yr2hHiPS3K/mCi7JS00Klqu1g01KjXBtfevEwKmVFYp9GjFTtVtRA8/kxK0YM
	ll49thrvXzlgKduasZyaSYhhi2MOg8Chh1c61HFF+tHvXZ80Rv6gP/dK+LOGmukJGJOTYGuVmQ+
	5IQsMnMeVpeqjjhnEtWYZ+acJqdr3Xx2
X-Google-Smtp-Source: AGHT+IEctBGbOPb8tWUDebvS3L7V3SseQeGkk4xalk8WHK1PQ+/ej2AUM8IRRWIxM80NV5FFMSeI1zTaZrQqMMcHcdA=
X-Received: by 2002:a05:690e:d0b:b0:644:60d9:8660 with SMTP id
 956f58d0204a3-6447a5a7193mr11828178d50.44.1765876815167; Tue, 16 Dec 2025
 01:20:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com> <b70ad65c88a82cf56c93cf17cf326213f8273e37.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <b70ad65c88a82cf56c93cf17cf326213f8273e37.1765791463.git.u.kleine-koenig@baylibre.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 16 Dec 2025 11:19:39 +0200
X-Gm-Features: AQt7F2rnkMoQPLRnnlXil8zyHYfAadd5PzbCSjslnX3-94C0khuY7zIbQk2gds8
Message-ID: <CAC_iWj+TevKq7TzPQ4_eEhu0rJJ03PV=ASf7SwTszp-mJY6Vzw@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] efi: stmm: Make use of tee bus methods
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_012019_292617_17E9AA6D 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, 15 Dec 2025 at 16:17, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods.
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/=
efi/stmm/tee_stmm_efi.c
> index 5903811858b6..7b04dd649629 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -520,8 +520,9 @@ static void tee_stmm_restore_efivars_generic_ops(void=
)
>         efivars_generic_ops_register();
>  }
>
> -static int tee_stmm_efi_probe(struct device *dev)
> +static int tee_stmm_efi_probe(struct tee_client_device *tee_dev)
>  {
> +       struct device *dev =3D &tee_dev->dev;
>         struct tee_ioctl_open_session_arg sess_arg;
>         efi_status_t ret;
>         int rc;
> @@ -571,21 +572,19 @@ static int tee_stmm_efi_probe(struct device *dev)
>         return 0;
>  }
>
> -static int tee_stmm_efi_remove(struct device *dev)
> +static void tee_stmm_efi_remove(struct tee_client_device *dev)
>  {
>         tee_stmm_restore_efivars_generic_ops();
> -
> -       return 0;
>  }
>
>  MODULE_DEVICE_TABLE(tee, tee_stmm_efi_id_table);
>
>  static struct tee_client_driver tee_stmm_efi_driver =3D {
>         .id_table       =3D tee_stmm_efi_id_table,
> +       .probe          =3D tee_stmm_efi_probe,
> +       .remove         =3D tee_stmm_efi_remove,
>         .driver         =3D {
>                 .name           =3D "tee-stmm-efi",
> -               .probe          =3D tee_stmm_efi_probe,
> -               .remove         =3D tee_stmm_efi_remove,
>         },
>  };
>
> --
> 2.47.3
>

