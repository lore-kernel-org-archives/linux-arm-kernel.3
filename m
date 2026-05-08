Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D61CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=; b=F0+fSJT1iwKsB+63O1xclM3xNK
	iw31V2RCp3ZGYY4tPpasUOlzNQlrQHdzzVKbLzAc28ZvyymVq6vJrVEjEjq2Nky67Qr6iQ/0U7zfd
	equbjCUT7ybXqoPfG/S+eLAILeEzJBXDhQR0jYTNMxe0sC3VI3ARxjsuKy+248vUfl4uS4Z1qO6/n
	KHhVxgWE/P2ZOQScJHI9iGO3aCFxv1iuznVPE3UCNqZVBTOrLWrbrhUyFxwexnfKwEtiyM9H4cvqQ
	LwTnyLjc8OXYrJMtojGpZaHqxCwu5NZ9mjN8D/dbShH77O18L7RHwv1t9u3VxSEXTaVAWqNlPSRBR
	BEgGIrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSXr-00000007Wmd-3NQj;
	Fri, 08 May 2026 21:15:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSXm-00000007Wm7-3j9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:15:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so4414672a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778274933; cv=none;
        d=google.com; s=arc-20240605;
        b=Qzkhi7b0nzJAb9SLOvhHARzpHvlvIGQS45vnsb40PsPUDhb+z8NkHpP1V1X92Gyevz
         LJe7MEXQEqAaTubhaYd7ODziAzlpxd3Aq9Y5+P3NoFqtwwNwV16wkt+b3KbOe/JxcLKn
         v/XFDO64hkWou+p4D0VrJuiPjTwxF049vTaF39Evze06dN1/hMM5sfSyFMkI7Tg3/CK0
         bfW7jFX3o5f825Od9SExgDvfilA4NbqDVb1KG7IeZreb+bLKEWwjWhf/2DpM1DGTU+Um
         h/MjKflel5u9xYM2UCVv/4vgfYmBQ9SZzd8EF7/u3aI3++qsUVbTaVpThuR+AKTPzOFm
         /5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        fh=qlXX641yf0sozgKp/k5ZZtBJkZAHzPmnmaZSvus7oIw=;
        b=Un37pS/UDsoeYHsMr+QOwRb+vpid0uRqIYf6jZMgTt3JwtNZwpg3ctgnLND02w/4fv
         ZtZRG2UF15ODPoFtlM5Hk+/hx62cglox8q50+Gj1dZk3Vd1X1B+0MHhNF5S0WCiKunWV
         mOdRaZzhgG3628i86gu6ZnxdFfEWKex9AMVy/LKWG0RbAWc7W6WauaEJy4jnhZi4LJw6
         Jlzz2YAc4rgZWK4ZIkyx5gphKkizjuAKWMTp53yQe0u9PVbmkbmlPaXuG1j3hFUjnoaK
         UC8QddnCwjk/34hulDLXwA0nPdTwMwJXFo7MT5zkAxBheoY21vqC9PixAwF7SoobbNSy
         v6xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778274933; x=1778879733; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        b=rpWrr4ePAz0PS23bCU95XNVkpHRCvM/Voh/y/7QRlLSfeDAjmJso9jteQxEVZjplIC
         x3G2ChVnfGCl7Y03n5UlLos+kizLAo1xTnrnlEfgZwrqaQ4ELmpOgUAjzm/OnbB44WB7
         /tQPNHV+jGH9Zg3B4a7ASITsm0giQfxJ4Os83TYE8kY09ATBk2Ayf7+/hetspKiwl14B
         c1bBhVC/JegROTNi2Xyxw7wPALwX1MkTQOHHVPfbdIcydS1mozqJ07T+G/Yg9Gw5Gszv
         W94QzaZIaRahrAexsNfwJd3mLvOakCD4O2V74N6QnY7azU4jDKjuG/9R3u3jSXRG6Zrm
         kuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274933; x=1778879733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF4SuvsEGJOTrgo1Gj2trBLxLXz0XZiSaOSESpUWpCI=;
        b=r8NNz6udm0kgN2gPzjJi0qP/PHSpoDXGbMhXfz5fscsPI5R/BY7e8iWoIm6//SjdUj
         h8n60hmeHw+Fi6l+Dr3lJW+YfGxKOL/h5TAG+7k16NqihlmaAJUkoMRF3PJOBmo6E8vV
         2r5O2+d7+96jmf4q4oY4kGsruSG4Dz8SeezytNvrhpGpfSIn5z7O5/IooRgbE1RkSJ7O
         p1LLPeIZkdq2C6HwtCslfPuEW9faCrDwwkbcakaB5kTJ4yk7IHpVFTX5un4a6qPNqqCZ
         dxNtyNhbsvBRWxtRd75kS8H4wdTTjYgLU4AtrPsWH4aFC3eBv1FoYGO5iRardjuivkzt
         A5Cg==
X-Forwarded-Encrypted: i=1; AFNElJ/IJNQAU2Dt4Kau12+KvSHfgcRZEPwWYF2sA5k8n8G04QanMnjfb9yeNOjZniX88nzV7AMOL4cr/HHnfz8Iaa5p@lists.infradead.org
X-Gm-Message-State: AOJu0YxkdT5B/J4YuNJblX+bj3PpPRgJeyQFS5DU2pa5syQUc8/NfePg
	NBnIJs/kqx2I0whRzV1uMQqkwJq5wjfR44guUNRVsN5MTPCcRqUda+RhfmQD6mlJowFz9DKHTFU
	O5WYYmmkvi9PV9d/HAgdSWHsAc/I4j71cCeOC8f6ZAg==
X-Gm-Gg: Acq92OHtohAuPdtwPKnpcfog9cHUsidBnpcgmFQauhwTdWtF7uJ55SH3i5ewHlj+4jC
	ctgTf+K7twr0qmQxNzZL/g39jnB9yk68ol2xKIEHFNx4u1pCtFaEPsvXCyVQGshZ4T/alUkOB6G
	D1m2XSWJ/q6OXDoj8asN0cUWVnJEoPbLgpdihs8wvQQNGDPgyufjXFZJDnVC0M2CvT7ZsydIJbR
	ngfV2yU4RunhInZbXqI2+sslBLqXatKWsffotsyX2lkwc3Lc+d6utMud+Av+T0VHB+Q83Wh2Jds
	xag/yn5lwgXydnNZSUfnv73FyWWO+9Y5XuDD0V9MgNO34KK+8+D4
X-Received: by 2002:a05:6402:1ec9:b0:676:9c6d:5c4d with SMTP id
 4fb4d7f45d1cf-67ef09b24c2mr2202764a12.17.1778274932823; Fri, 08 May 2026
 14:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:15:20 +0100
X-Gm-Features: AVHnY4INLr6tr26Lmd7iIN0VZuJDb4bQSnp24OgoULrQQwKG8Z2swPkqXTHOYdY
Message-ID: <CADrjBPqdZrpRJwgHknygW9rdB5rj1W69L26qoXwuHAgVcjrG3g@mail.gmail.com>
Subject: Re: [PATCH 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_141534_980798_215344C1 
X-CRM114-Status: GOOD (  23.65  )
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

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
> maintain consistent nomenclature across the driver (aligning with
> `txcnt`, `rxcnt`, and transfer helpers).
>
> With the member renamed, annotate the dynamically allocated `cmd`
> pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
> bounds checking.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 88a06842753d..fac88c427d2a 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -105,14 +105,14 @@ struct acpm_queue {
>   * struct acpm_rx_data - RX queue data.
>   *
>   * @cmd:       pointer to where the data shall be saved.
> - * @n_cmd:     number of 32-bit commands.
> + * @cmdcnt:    allocated capacity of the @cmd buffer in 32-bit words.
>   * @rxcnt:     expected length of the response in 32-bit words.
>   * @completed: flag indicating if the firmware response has been fully
>   *             processed.
>   */
>  struct acpm_rx_data {
> -       u32 *cmd;
> -       size_t n_cmd;
> +       u32 *cmd __counted_by_ptr(cmdcnt);
> +       size_t cmdcnt;
>         size_t rxcnt;
>         bool completed;
>  };
> @@ -432,7 +432,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
>         /* Clear data for upcoming responses */
>         rx_data = &achan->rx_data[bit];
>         rx_data->completed = false;
> -       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> +       memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
>         /* zero means no response expected */
>         rx_data->rxcnt = xfer->rxcnt;
>
> @@ -584,19 +584,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
>  {
>         struct device *dev = achan->acpm->dev;
>         struct acpm_rx_data *rx_data;
> -       size_t cmd_size, n_cmd;
> +       size_t cmd_size, cmdcnt;
>         int i;
>
>         if (achan->mlen == 0)
>                 return 0;
>
>         cmd_size = sizeof(*(achan->rx_data[0].cmd));
> -       n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
> +       cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
>
>         for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
>                 rx_data = &achan->rx_data[i];
> -               rx_data->n_cmd = n_cmd;
> -               rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
> +               rx_data->cmdcnt = cmdcnt;
> +               rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
>                 if (!rx_data->cmd)
>                         return -ENOMEM;
>         }
>
> --
> 2.54.0.545.g6539524ca2-goog
>

