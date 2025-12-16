Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA153D5CC89
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGYedUjMSAQqTTCfPBzG7GGpp5/HnFYa13zWq/TfU5g=; b=XMBvlE8o3VNDdZs28OP/feNBJe
	AqXJ0qwAuy14+ETqtH9VgfUJ3HTpOb10JF17Yr2gZdmhyNZzTEaFceObgefkdZ+9vz90RJcn3TKYS
	Mvn76rtxX6yVG2g6ANXD1qTvEEM3tG7C0lVTD/xRgUc+Hxy+kma+bAATczRnb1fj5r8EhaHxXK02K
	/hgAiaPwj8OHteUmUoos+v4KuepktUChZQ2AGpMnZODBtp51b80A3QwxUBxlNc28dXdddrefQp0Ux
	EwjMUoK1RHy2Q9kc/XC4JEkKyUdJNHrBh8F0xr7rK6f3F+Xd6ybpE2pygwF4hnGXwTBCRFdNPfdpk
	+OjITVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRFN-00000004z0R-0hB8;
	Tue, 16 Dec 2025 09:21:33 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVRFK-00000004yzj-1U7x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 09:21:31 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-78c686aa4f9so16527547b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 01:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765876889; x=1766481689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGYedUjMSAQqTTCfPBzG7GGpp5/HnFYa13zWq/TfU5g=;
        b=k8K1bKNhieD14ssjHevfG1NABG8et+nFERYEpwBir/RIwmauV3kaj1HWG9XIlfjIPA
         2iIxG2zYZuOGj7UG3PktoeJYk9YIgoD1LTPIKZ1ZBRFOiCIXK01N/L7lDph+x+rwVaxg
         IuL6sRww7AQOEAK5tklcysKHKitivDersGkFA0lbAXrcOjX0odXf0P0raP5CD7BERhhU
         ts1gISczcypHv/EOyOmS6ALUTcbxYRDyrTLyFqFWcyOk3ACNiFTfEUlg++6eTu/jRb1C
         z4VpXha0JEb5DpE0caOcOQcWfnTyRmUGZVtMFDGjl2QLfR8L+9OWu6vcQcOy0mekgl8l
         W+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876889; x=1766481689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGYedUjMSAQqTTCfPBzG7GGpp5/HnFYa13zWq/TfU5g=;
        b=uKy+z5Pvcvr/KGEel6xGIYvPDx7JYE8B3mMxO0np9ToR5/32rMMTszJ9JEMYhgkTG5
         EYDtkbJOQPoCkf4azHGbmdS3UHyo4QPcL1QHq1Ui2mL1HSRQsT49qDB+jrHpvQZl0xA/
         5iA84+ee36oefUn5srssZewObRJB3n383mJPofyTDCSbmHeSvxDAsGcTZGrKfuZp5eRE
         Avip9MCqfCDITfbIh8XdyZdg2TchTDvzzNmNI8UXlvtYdTpYP56R0XlrCXCLqRWxYmmI
         q5VqL7yB4ym/gLMWCkY1/7iU9H8udoRrohkuarhhxe6jcsSeTTTCqp7U0drnnZ86PECc
         si+w==
X-Forwarded-Encrypted: i=1; AJvYcCVaoOFwVXPrWQQP0n+a+Z32EbK3u1LlK054xkVpQw8vjadUxCIJRcP19nzok8HK0SkEmQiGgNG3kc4v9AyG5tbC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy4swufU+fjEDTKBH0O9yizg9XfdwTaVIqhu6VkGcqxeG1pMsZ
	BjjnI9b5ZgjBxHkw5wJ62SNHKdyn9mOBOQeJuskeRUQPXgsINfxxxGJK9Sb6gvSuHstu86h+X62
	0lGgpsYjwLSx+Ie1AsDZAk7Zmh/alocQGRDkC23fQNQ==
X-Gm-Gg: AY/fxX5GpIcIkOK1XQi2qmXhiD0tkJxWNaer0ERWKbbGoYi3CTZYcUQg0FyVLTTEXza
	B44nPqJJm3RIjt674S7A5oIOk3FwIAgcihqVJsYY9LD64rLeyQ2YR8+TK00/QohwEdu0U8Ro2IZ
	h38xlaa+YjfQYdos6TE0T283Qoe59kMoDURN/iXZ4/Kk+1GAHXWAA6wFDlnqTaYlxtuGSdC9B3O
	XaR31J49FyXN8J2ChyWzFax0Z7+qGlvaF8sY9Erhnz8AxClk50w0nnupDMUc8aRmPytjfVZ8BNI
	Vvk4P7xS+/9MSWAmhtuckg8q9aAfnki3HFbUUpXx1Gqq2lhbgzWbqIoJQ/T2U0noTzBkW1PokQm
	DKyWaSdn7MxmlMb0cUxTeiyLcUgyqT+FiW/QS0uUEX9w7XjnNfULONb9biOIw8hTibvxJ3BKXS8
	MFQ//0YIFMgtLbib2LgNiN5yZ9VUuRtftGoSERW2Xj1mZuz+QD9DpqhHjuMKAgKMIFxjevlt2m5
	2V4YnbRra5Uart6fnoDhgGt1LkBLmW8hKtZDPOnEEkwuXlQzBI1Rr6QLsTWC+LrJJgEJ9vhw5gZ
	aK59I6kMGg5s1NP+y/lp2ZdgdS6uuhW0
X-Google-Smtp-Source: AGHT+IEAFokQb5D1JItH9s+uj3Sa3EAOeQhnCG2QizFVOaNkP6qUDXOVMm6HltsGpBU7JI8LFSpiz0VIaHoanmm6gBM=
X-Received: by 2002:a05:690c:688f:b0:78d:6c06:4a0f with SMTP id
 00721157ae682-78e6809a375mr112570247b3.0.1765876889065; Tue, 16 Dec 2025
 01:21:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com> <6a56ee61e485703d548e9e44d53b2920b4e43ca6.1765791463.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <6a56ee61e485703d548e9e44d53b2920b4e43ca6.1765791463.git.u.kleine-koenig@baylibre.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 16 Dec 2025 11:20:52 +0200
X-Gm-Features: AQt7F2rtv6sYjRJcPW49bnernszF66e86Q28fTD0Bfhuswf7pxXDfIzUWVoUNmU
Message-ID: <CAC_iWjLG7o96E=9W-cjJ=_622RFg-b9t6hQnMrSmgHS+ThaXyw@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] efi: stmm: Make use of module_tee_client_driver()
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
X-CRM114-CacheID: sfid-20251216_012130_407472_6B0961D1 
X-CRM114-Status: GOOD (  16.58  )
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
> Reduce boilerplate by using the newly introduced module_tee_client_driver=
().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  drivers/firmware/efi/stmm/tee_stmm_efi.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/firmware/efi/stmm/tee_stmm_efi.c b/drivers/firmware/=
efi/stmm/tee_stmm_efi.c
> index 65c0fe1ba275..5903811858b6 100644
> --- a/drivers/firmware/efi/stmm/tee_stmm_efi.c
> +++ b/drivers/firmware/efi/stmm/tee_stmm_efi.c
> @@ -584,24 +584,12 @@ static struct tee_client_driver tee_stmm_efi_driver=
 =3D {
>         .id_table       =3D tee_stmm_efi_id_table,
>         .driver         =3D {
>                 .name           =3D "tee-stmm-efi",
> -               .bus            =3D &tee_bus_type,
>                 .probe          =3D tee_stmm_efi_probe,
>                 .remove         =3D tee_stmm_efi_remove,
>         },
>  };
>
> -static int __init tee_stmm_efi_mod_init(void)
> -{
> -       return driver_register(&tee_stmm_efi_driver.driver);
> -}
> -
> -static void __exit tee_stmm_efi_mod_exit(void)
> -{
> -       driver_unregister(&tee_stmm_efi_driver.driver);
> -}
> -
> -module_init(tee_stmm_efi_mod_init);
> -module_exit(tee_stmm_efi_mod_exit);
> +module_tee_client_driver(tee_stmm_efi_driver);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Ilias Apalodimas <ilias.apalodimas@linaro.org>");
> --
> 2.47.3
>

