Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B7AE9D3E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=; b=3BIbCUM6xO5voIrwHxA/VsMTw2
	8o0Ej+vnCDLYQ1hk0EBJacCK/dJTrnQSca0bG1rj4M3KPt0AIgWI09MTa3y/U+IP/Lx9t3jf0Sb/O
	N4ENE2t3qmxyh1z2Gjds839YMLDR0X425XxZmHQsa10wNHazRtPrCNErmEjXI7hh0tQCBZgcjQLXX
	LqPfjwC6QJiDMFwhAV05w6vDjIoGgs6/mnW3sg1vgY4B1SJQZK/OyXIFaF67tZ3L/hGITAqWowaDy
	bSAQYgCK/QvCSOSGEck8CUS3KfBG9p0V/hPiRgGDdokOjJ2PZubQy7CiTOENZ2GqYUAmYE+N/sxYi
	2YNB0IVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndyq-00000008bAT-2NrC;
	Wed, 04 Feb 2026 14:35:44 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndyl-00000008b9h-3PUi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 14:35:43 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-649d4690174so2042541d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 06:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770215738; cv=none;
        d=google.com; s=arc-20240605;
        b=C7Qf8T2wVzGXmjVnTS9lxK/aWGhxcBK1qvMB5b5WS0HUZ2L1KhuScjPTwc12x7wnAR
         wHTHrs7vKG2XXV/bIB1X7mrdfX5aHIJpotBt/2+F8zaoGgByu43Ejfqz8+g6Y4XWVQWP
         Q5VYKlNiK0PpArpdyLeBiQgBG7A/IRw7L9n5RHL3t5/kGyrynfjDw8C5Zjugan0Rhv/D
         qwrQIenKmIwYU839Er8bVOhHTooBeqluvhFuLy1zAkkbq16nFt8EBPnLG2PUAKVf+NgK
         5dUZ7c/0zrF+mA/rwk/S9MfkZw131IJifNiDhha8J9Gqk4xN1rs84WWFH59u2WrxFE3f
         tTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=;
        fh=0rVHmliDOWn2V9tgbVuAm8ItMHj8XZeTlQIP/b/kmfU=;
        b=CT/S4sHMjSlazgkmpvOoUNL369+nn4y77446dQFuyeVgPBbmBzo1PeVpBJ8i6dSOUs
         WozFsCws2DQf5EC7LTIQ4QfPs+673JVrAwJLxtkEK0kBF/Uo27Y6COFCL0ch8cE/x7Cs
         ZnYaNV7+8XfKcxqUh6vL97I80o6E3/KMkxxJL6BAtrEe63iVTdsE4YLHJeF5ISccsXuo
         nQSG37rYcU1qxcvllj8TNkPzIgoD6+aXD/VingAzdSVx7STqL3Dfjn9XeNlV5tj9AEFC
         glpemq/H9r9+8BriNADdgCuDICJwyU1gE10yMmYVADxAT5hecb7RlmLWPOX60hTK8xKd
         AR1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770215738; x=1770820538; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=;
        b=cy36cYUMRUf1ecS4DWP3FeSm9OGPvgtbIE3bHeXr4mILQV2ix+dU10i1gCCM9l8IbB
         lEq2Tl826yMKuXd8InQQ1hMUaVf6yj48rYv1nDx93bYUymqfwR3zkdaIdSqmLj1n+mgF
         WKthG1xOs3OWi0LmfUX+FTjVj3eDnQuj/scJpZlBDqocekAKXEy46eYblccSL8N0Arwe
         K693/MLPp7ol/HxmZBHHzauXpxjqF9X/cHK2yodhtm0XL2y/WUmoUHfNILeq2qeY5w4P
         NgLV8YqcK6v53WXcy5CN//cEqM120c/CPNaXbX4xf9sYI8ZdvGQM1VzwQaVCubW5qyFu
         9NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215738; x=1770820538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs8kXAX9DSECmo0hIsKWGPWeQx+EzOKrLeqIOYIIodk=;
        b=GztLtxtUWWlxokMpgANFtuUEWtQnHAUm1OILeg2Yr+f1HNbSkobh50f/4o2u8MStQw
         ut8pAnKLAs4TrlUS1b9s0PS0yW6HuhCZ26j5Meb5f7Fff86CcUL6aEPXsF8H6qfnUj5M
         oTwGIjF8w8zelTivAveCbobcO+xJ4WcjXuKj25i7ke6KXO0RSGZCBFzh7iCAwS2cAPYf
         f0SgStKW6CmHm7ko9XXrEhR7422wSIh6/gUvZ0PpUwKZyTb1zi5IuCTth4o03HQkzxyR
         MFWyNX0c5E729SsgDZkEiJt77i9LwKndEHwja7KZ1kwHL4AoxrksRALvNQip19j/oqj2
         TXZA==
X-Forwarded-Encrypted: i=1; AJvYcCXcXU075fgomSG+q+yJNDKHWSASQxLW7djtvJxKazueKrDSufaXVfeHpDdbJFDXOBqe+Gww/Su51/ocQHTamvDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZRw90mhhlHhWHSu8JrdX3V04O+iI8tJFduN7ho9lJT4CJ2zfb
	B3LpXHvB4DTvD6LbltIRPPIcH/wtAn0MnUisqR84e/zezD9GjmBU7+olpFShOhTb2C5AmXD6ePF
	i8+0f7pN/+h4L5x8xuZZOz18R0bV68uj0kV589hJRRw==
X-Gm-Gg: AZuq6aLp0ya69PL94gRFr4uokQp6+oKXbMXuCEZjpp8IDkm8kBEOVue3K8pevNlbuUz
	DnfmUhd/sXtisLcbs3T5/r+7KFBJ9/WOSTsmoBrRXQbzN4oIdtX4EEmKxsBzeA9npavkcjhrdmL
	GnwV+gNL/otmHQ28AvraewshXJSXTZhcnO2qFtOLRYkBqp7DIEbGFLBypT7h+NpkX1l50aJXUGu
	bVoqCVJ2mkFEoKUH21/giobI5oQNHe+zad0Fo19OK0qoeHEiuUxvazh5kNJAJALJVFgHndz7ctK
	73Qqn0w=
X-Received: by 2002:a53:c0d0:0:b0:649:d4ce:243f with SMTP id
 956f58d0204a3-649db33fb9cmr2174177d50.3.1770215738543; Wed, 04 Feb 2026
 06:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 15:35:00 +0100
X-Gm-Features: AZwV_QjKyxhBAxAWnQN3ZmPtmDSh2TTxzwvjZf3Uhrpoyqis27NsaHph3OPTLhw
Message-ID: <CAPDyKFrGgf1+vYVA6S1SJTZ8+n9WJo91e1VWeWq8p3RNHz1qtw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: disable new_tx/rx and modify related
 settings for mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mengqi Zhang <Mengqi.Zhang@mediatek.com>, 
	Wenbin Mei <Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>, 
	Yong Mao <yong.mao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_063541_783765_00CE86F0 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, 4 Feb 2026 at 03:09, Cathy Xu <ot_cathy.xu@mediatek.com> wrote:
>
> Disable new_tx/rx and modify related settings helps avoid data
> transmission instability, and better compatibility for mt8189.
>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Should this have a fixes/stable tag?

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

