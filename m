Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96815C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH/qbpM/oCacWT5ERGejmJZ7cVyfNVWKI9CytSuSAyk=; b=jikHKlNEmAnyno1h0JhSs6hVoM
	IOT9fxX32KGk5OyCISuXas5L0d8lJtlfJ5uDzvmJ22iRALsZ7J3C87ZgLa5QCSiS0xl3fOEnpiWtf
	3wyeMVQ7HGVvRwCuSSD4GsmF/3mg7DKjXmhqzuz+uyA53EFPB1eO72+1zq5/SEGEqJAQFpKwwd6BE
	iHs9j2zoUiJEaRHFoHvR0sZpQnLPuMc7SRVKcFKDyPAGwSMZqntOpZQX/ZJy7wD2L4z0qlQUrv85e
	HsMX3WMBQtjy0GxD7Pi8rN6styDRdeYjQZ3iG45T1U9CETydsGojQ2+nmNOaWG0PqiM4Y9f1+HtMJ
	FC99E6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7tc-00000001kpn-3uGF;
	Tue, 22 Jul 2025 07:58:44 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7pA-00000001kCH-0myD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:54:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32f144d0db8so27016691fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753170846; x=1753775646; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fH/qbpM/oCacWT5ERGejmJZ7cVyfNVWKI9CytSuSAyk=;
        b=alKpf84Zvzvb6wPIeaW92jJ1iU5NZSq1EhDod+/gVX4iV4FHyzNQjByPabAvvsdC5y
         HloE6nHyqHRpqoFscBlVBejPsJ6jPdRjt4sHd10wThbcUoFOybGBQrY9ieGIFg8wSaBk
         ld7XUQUOwjneSE24tu4yeyHmdZxzEyvv7W4/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170846; x=1753775646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fH/qbpM/oCacWT5ERGejmJZ7cVyfNVWKI9CytSuSAyk=;
        b=uDiDBZMx0WeELpm72+Xynzcbpget3uyDzPGCr8st4SzWoqyc6c+qDymSlvGKCfObUR
         j1OT3CbkNBFwxPCEANb8A1Ya3+mLEnX0XAdPNaFI5lTEgYA+9XvWHqgSpjj1tIgG7zek
         GA+jTxSTsxfXsFS2tamqKgvLxxM/0Pxfh00Y5F2hmP9ODrzV19ziP+2sK5sr4yFkZT0Y
         L8b3C8J7DhipPx8NiaGxmoRnKVRCPhbWa2YjR4qmjY2H6vhoV8rbMLIbbkHWpaigWW9j
         rVJCYMwBjfBg6BXBg/W/ogehdOhE2VzWoREH2pZE0e8vA1mUzHg2H4gPyMjUqZ63LQ/T
         biBA==
X-Forwarded-Encrypted: i=1; AJvYcCVl/nLFjs28erc1ocM4m3Etxccu6nxHOe1DYU8ZEOk/JpI+gO2SeP63VD4Kc4IzbJMVa/Z2WV2l9g7TpJOnK/5n@lists.infradead.org
X-Gm-Message-State: AOJu0YwGsfrfxkZYUQPomnd8Wt1sa32RQpsFQu77JRmq3lXuqFXSwsfY
	ZrIjCfAM77eoIKd0vMjPYB46fFJz6WL5upA7RRg1wqH0KlcHcKavO+RB99LG+MLRKM2ZtF9WSFf
	4yuwGbe6GHGP8KVWcqF96zqinVJxDytRFfO8DFgOi
X-Gm-Gg: ASbGncvxRsqY9Ga1PZtxEnMskOv3RjkYxW7SWsYvPKnpBPJCYAC0i+FLJebM4BV6WXP
	TRK5OTy9po9CuUb37sX+sZbqApy6CY5yFzj8DMyCAKidHjW4uCbbtx76vj4tmNZOc1L7Oqv9qAG
	gvTc0B8m6dquqHtagKalNkcQz3pegT0LrI27KyUzKWsFb5WB4jUoZHirTo/BQJe3NV3WnmgLt7I
	Uzgyu133DscmML+5m2j96vujhA2KOaRnfc=
X-Google-Smtp-Source: AGHT+IGL92ur7ffGC5QA28t0VJ0IAP0O69TPsrcbMFMvkXkG72ebSReqvSaw/FaQHvkyG1SDQnIsCB2Mxndj8zgqVHg=
X-Received: by 2002:a2e:be83:0:b0:32b:c74e:268 with SMTP id
 38308e7fff4ca-330d2679241mr6503361fa.17.1753170846371; Tue, 22 Jul 2025
 00:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com> <20250703115828.118425-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250703115828.118425-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 15:53:55 +0800
X-Gm-Features: Ac12FXxbLNU48YxsduL3ktDoYmrQimXCC613atDW57475GhtNzvIVTwz9Iodg5k
Message-ID: <CAGXv+5G2dVyKzrpofTu02CcX7inpa0OWw7Bhvv-5a3kEepNnQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] spmi: mtk-pmif: Keep spinlock until read is fully done
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, hsin-hsiung.wang@mediatek.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_005408_225935_65390E69 
X-CRM114-Status: GOOD (  22.20  )
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

On Thu, Jul 3, 2025 at 9:07=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Move the spin unlocking to after reading the contents of the
> PMIF_SWINF_(x)_RDATA_31_0 register in pmif_spmi_read_cmd():
> since this is the only register that we can read to get the
> data from all of the arbitered busses, a concurrent request
> for reading (especially on a busy arbiter) will show a race
> condition and a unexpected or corrupted value may be read.
>
> Doing the entire read sequence while spin locked guarantees
> that concurrent access to the arbiter doesn't happen.

I think the driver should have implemented this from the beginning, so

Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
Fixes: f200fff8d019 ("spmi: mtk-pmif: Serialize PMIF status check and
command submission")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/spmi/spmi-mtk-pmif.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index 68f458587c67..9f416b231ab8 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -22,7 +22,7 @@
>  #define PMIF_CMD_EXT_REG       2
>  #define PMIF_CMD_EXT_REG_LONG  3
>
> -#define PMIF_DELAY_US   10
> +#define PMIF_DELAY_US   2
>  #define PMIF_TIMEOUT_US (10 * 1000)
>
>  #define PMIF_CHAN_OFFSET 0x5
> @@ -372,7 +372,6 @@ static int pmif_spmi_read_cmd(struct spmi_controller =
*ctrl, u8 opc, u8 sid,
>         /* Send the command. */
>         cmd =3D (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
>         pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
> -       raw_spin_unlock_irqrestore(&pbus->lock, flags);
>
>         /*
>          * Wait for Software Interface FSM state to be WFVLDCLR,
> @@ -382,13 +381,16 @@ static int pmif_spmi_read_cmd(struct spmi_controlle=
r *ctrl, u8 opc, u8 sid,
>                                         data, GET_SWINF(data) =3D=3D SWIN=
F_WFVLDCLR,
>                                         PMIF_DELAY_US, PMIF_TIMEOUT_US);
>         if (ret < 0) {
> +               raw_spin_unlock_irqrestore(&pbus->lock, flags);
>                 dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n"=
);
>                 return ret;
>         }
>
>         data =3D pmif_readl(arb, pbus, inf_reg->rdata);
> -       memcpy(buf, &data, len);
>         pmif_writel(arb, pbus, 1, inf_reg->ch_rdy);
> +       raw_spin_unlock_irqrestore(&pbus->lock, flags);
> +
> +       memcpy(buf, &data, len);
>
>         return 0;
>  }
> --
> 2.49.0
>
>

