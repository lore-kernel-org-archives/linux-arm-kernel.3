Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A5610A3D8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=; b=uZBtGyTQUKdsV8ODHRD434iAYE
	PBNdFEFzijMcLgzalgbjsH7YzL7oaeirBNSGcdf1zOcZpfRg3FC24MAIOcwqeHyN1u0suy1MkUexd
	rmqto9pqN3AIgf04OFiGinjvCeefMIIDISbvjUtQihtTUP4TFduFu/CR7PcvCOn6SPPgB8XlKD6Od
	ECF6O9XEJENMw6reqEF/XKOL6i8Fs9s9FqwyCmIRXYbu6AZAAEa68RjCoDL/C2R2tM1WXA9T/fMRE
	YcX7IwGRLu9ztOFCVwrqw184QLYB7SSfdfV03jkspQG4hfdFuoVRQ1ozcImFog7w/POXKQ3OvGrsd
	T9rzX0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jvP-00000005SF0-343m;
	Thu, 26 Mar 2026 12:34:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jvL-00000005SCy-2Srq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:34:57 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a27bfadca9so1353789e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528494; cv=none;
        d=google.com; s=arc-20240605;
        b=lXM/IuIasvYD8j+QtwbCNe+kO8lQBVueMjH2nWyzINzrFlioXTdKddaapp3L3MXTB+
         7y72f+w0mwNiyUflgwFCd8jma3s16atIK4r+V5LXSEYBs6GKl/z4gnshEKA4XYlWsSrj
         oclzAKoyxsaeqH4nuKmaI6ubL8H0erTJIeqo88+/cId8OKheer5l/XqV8Ch231FAkj/B
         /eVhMWMqukLAY8ujaOkMc7ayb0tb8fYw+BLoJ0h3GxsTZWZADBdL78z/V4flAW5jzSln
         ydf1AtNfNX+F/U81l6jc2vE9RSJL7jvzHo6gkmTlVSjq51vVF5CZs/25A4nStqdRYBVK
         gnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=;
        fh=qqQ0IAvU79/4ey9qmlv1y8m51zxZp9yWkwzo/RT3dxA=;
        b=MweNm/ljKRxUMkpFMyGNAD11VDr5cFuG+EqbDGVeAjXTGWeCe7pQC2/Twwj7YzaBFC
         lRuNu8+X9yJt0+iaEb4WtaDAP5IW/a7EeQ4AZTLUrXBIw8pPNle5g9iOGbyNFkw5tPPs
         QR2HdpxfN/91j/ZhD6gbep3t3RtGS3dDT/8TZ6rqM8Z0Iu/38YEQBWOKFTeetJoqFHJZ
         ulE6blWSxahLrEU5+oH8GPAHKe/ZV4qcrPoDRltQSf3a2pfYDLw+1aB9FjDG/03U6qC+
         ez2xF3M5hnizv40H8hXpgE/HFJztC7cYZYXliV1qIHO+ghUyo7GH9CjvFe/mEEfH5lOF
         N+0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528494; x=1775133294; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=;
        b=l0FTWJ6c74bU4Bdc0QVkVMzP6cZQkipi6v2qy0J6csKot6JyuQK+Olld3CWwY92b/c
         xkNO4zlgBXhBT0rmLsZDxMSYHlSsJlu68xXa/A7MKOkiVsV1HNzrpTGaqCVWuWsf2/Ni
         3sXU+RrvN5aDrwmtWIkTuveQ9LABt+aRahXVWE0+T9ciylqP5I/SK+zGoUUnxYq2MK/c
         7f0ctv513+Q8oHqRECgGG9ri8CzbyBYlt95qT8rQQplL4XjiNQ5eGbLpIi2WtVFfY2mM
         oLKTbrMQFYGbNDa4r8rcBF4uv7DFACXAjnMkx+VgrgosbS2mpdzeHYxzQN+fnhSaEPd7
         GmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528494; x=1775133294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMtjTcJq5eIA2qihI+2nGicxmL8Td67ZjB3pSoQD8ho=;
        b=j+IuYq9aD4Oblv7M89C/4yDDBJTVDCGR13AZAW2WIuKMsk6LbK4Rh2tpBTLbMKq/sN
         fSNqMLrk5tPToL0huQZT5Pb9cQ5vF3YoMLHzS/QcDhfrWkwBaLe2cRpTuIaGQwOiI+Ps
         bbAzJcRWgIg9rGF85jV+ESQlpDHo3uS3YJUCF4ArKEfP907f8T0t4DlQfrT9njhWdduz
         rvN5rM/DXLvmRPGJFEfRt4TIDmmd0X+Jq2PMu9i3MZGfZl1YC5W9nrfTAfFk7SeMIPSv
         tgj4FKNkh/8WYBzaM9gC2lExqhQlLDk5l/S/ltgmlJVHhuk33IubPE0/ENJ+mDBoi09O
         KvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtprkNCTk+oyDghoH7fsBYuzvDnCHjPKWHHVATfAWOWUCy5itc5O3G9n56mwmlBNRhukx2tDuSVSeaLtOmSQ0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+yv3DcYuD+De5h4LsvteQpX1GMNcAgRana/4O5Yg58hRzKbG8
	LxiBysgiZOujq8/hhX4r/4Xm6TN3zh9j6j0lDbQ9vFNA9K6uVUSJsl2h9H9sNuK/C6l9dH1EZ0s
	nlZ2cV8UaMnSBd5FZi+m/68gisyud/RBHRxB7pR7uIA==
X-Gm-Gg: ATEYQzzAG3LU9lbsjaSMhy1vzQSBgOEaG8ri/vW/n31RNVc+E+zfntJDnVBbtp0e4Yq
	8a4JoTGmM6h7S67vKieA+QvMLcq60uqBeoZH7qYzWxFQVUnnY7l8bO2xLvDWejudnoD3jqyElwC
	PSnhVyYLDaQuZ/Sv9G8ndmzBjf+wZ14dkAUWi8WBvJ6nWghJ7LPLmF0AKoOQ5fxDhTvRvU2Fn1w
	9SyBOMAylDyjf/06tUJhg56ij7bcYHvhMeF+fp/uPfV260ayZvETY0j/Ve5OR1D1Lh+tOvM8rOo
	eWT0J4s=
X-Received: by 2002:a05:6512:3e0c:b0:5a1:43f3:764a with SMTP id
 2adb3069b0e04-5a29b979b0amr2997503e87.5.1774528493504; Thu, 26 Mar 2026
 05:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260326030759.8107-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20260326030759.8107-1-ot_cathy.xu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:34:16 +0100
X-Gm-Features: AQROBzAUMJTYzzyeSawXUe9OdLfBc-C70N5GR1BByMjzhb7eLn_1dlJggBGZnww
Message-ID: <CAPDyKFoemi7Ss8706XVUCu6L64CUgcdGQNe9jBFSxaOPp2umEQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] mmc: mtk-sd: disable new_tx/rx and modify related
 settings for mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mengqi Zhang <Mengqi.Zhang@mediatek.com>, 
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>, Yong Mao <yong.mao@mediatek.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053455_644362_9865DBEB 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, 26 Mar 2026 at 04:08, Cathy Xu <ot_cathy.xu@mediatek.com> wrote:
>
> Disable new_tx/rx to avoid data transmission instability, and adjust
> .data_tune, .stop_dly_sel, and .pop_en_cnt to fit the overall
> configuration after disabling new_tx/rx, making it more compatible
> with mt8189.
>
> Fixes: 846a3a2fdff5 ("mmc: mtk-sd: add support for MT8189 SoC")
> Cc: stable@vger.kernel.org
> Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Applied for fixes and by dropping the stable-tag as it's superfluous
in this case. Thanks!

Kind regards
Uffe



> ---
>  drivers/mmc/host/mtk-sd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 302ac8529c4f..b2680cc054bd 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -682,15 +682,15 @@ static const struct mtk_mmc_compatible mt8189_compat = {
>         .needs_top_base = true,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> -       .data_tune = true,
> +       .data_tune = false,
>         .busy_check = true,
>         .stop_clk_fix = true,
> -       .stop_dly_sel = 1,
> -       .pop_en_cnt = 2,
> +       .stop_dly_sel = 3,
> +       .pop_en_cnt = 8,
>         .enhance_rx = true,
>         .support_64g = true,
> -       .support_new_tx = true,
> -       .support_new_rx = true,
> +       .support_new_tx = false,
> +       .support_new_rx = false,
>         .support_spm_res_release = true,
>  };
>
> --
> 2.45.2
>

