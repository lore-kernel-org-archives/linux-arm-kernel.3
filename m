Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E383FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=; b=3gH2y1Cat1VTnhBweDmkj44nIi
	THCHv6aoZUZ7NGfoXrNRj/rA03qav//heTBoVqpwmTj7h0su0SmupqZO4ZY5r8i63CHNxI4QXjKzc
	mjbnuRtb5tFEgLF+QZCt/91D2gX6v6wtOTMgUbjYQVdImy1Idn2fXyLWKoIgu8klAUJ/9liZiWRUI
	dEENhjpiWby0brycUAA1r3OtUUsBqr2zOPoIWmPENVUhR8pBAdBOtdgJOVYXIgjvWy3vIEZ+PKZ2D
	V5S9paFqmJIg/kD56nL627lc6K5kU8ehQ0nH/wQfHzqSbwrV3DFgd4aWqvb1E5f1S/AcwJ72K4UG0
	1wAXZZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmd-0000000Gz7t-0B4Z;
	Mon, 27 Apr 2026 13:13:55 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmZ-0000000Gz5t-1Qdz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:13:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a337552604so9167930e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 06:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777295629; cv=none;
        d=google.com; s=arc-20240605;
        b=H74th5x9EoNOVnTovgeBXWDM2VzaioDBeZsBtnMVXt9EkASA1r6W23Pc05Ax43Plim
         SKKvC6lDr3Wl8d/LcNr7+LMNumiE4BUJbaL2eYUFwrC/cSFZWpYsG5kq23Vp7eS+JWvD
         UH/gsn1RA4sDGC6+EqLQRXwTQUN56qz/YpYecOIRHe7zLWO+E+M/6JQZfHSYxYXO5Wbf
         Zy4nYDYDYGqRsSDZ0l+V15Mcl0CMjcPCqdxh09yu8CRFcBXA19WGoblc4Rr3BPIU+WC2
         B7cGzplrmRYeSwkVsOWcYNwcvUw+Qj2TXcCzgcvGKCM92sB+hXMx8tvZvNm18/U7wrh0
         NJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=;
        fh=Pm30WBE/87hES8+tlZ+4ZwdeGRKWki1bJ3uy0w8DcOA=;
        b=OdiU/5q3zrv/OvGZ4QdLeQV4Muw9ob5ssC5lLomKHaz8/8TOg03+QLLJX7NPpYfKYj
         fUx5by4TBgrxRtqCmG+pgcdkCAfaqjmKYfRq6270CbnZe+lGer4mXPfMdkScDrh/l4dQ
         3MpeaRG+Y2qiH9tidvmw25RRvKSoup+CRQjFXLYclalVWxIieOOvjMerSCYdQHUXg9ie
         R6jeQuvbFhP4IQpBH4bR0O4yzjgc4uKnoNLQxBx5XeQQoZfPZuhPaMEhepyPMpw1ZhX9
         NQv9fFTfyGl2dw22sJZbM0IRGfl1Y/nLQaz4cUmjw70dwX/ziQyBuIA0nar6Jxj10QLH
         RSzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777295629; x=1777900429; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=;
        b=V3HdL5ujHrahwb6LcApHXUMfbFDGgGRPtl/hG3jDYZa1dBln/ktelGF1qFzGcRLMmT
         R4JDhuN8C/Lg/6CTiXN+2xcKFXvbkwspo15s+7GM8VEMDYTrPN7qk1qWnYWnHh2qLuMR
         pPruKMnpzMc+IfeDwcjRSAnn2SniFeTWsDvoRT0NCiSktREK1EIBFKF6ycE2L4PllDe/
         7/IxRwc/0n6N3yAxATiHj8PlKumSC3vPC4TSrmu8B8q4itwCr3n9JFsuNATkmVRTwSJO
         5pLWPX8qiad6jgpVRunBQ79j4ZX2hFewk2rjYgjY+bASWDq4N5LZ/YA42T7a50lDmCkC
         cvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295629; x=1777900429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=;
        b=l6s+cl9105+ZnphA8JPWUaw/90Uas/9gQeBY9tnHyMj1U/mIDn6UKMek+wDWAgC6iZ
         heDwhTTpVKfEwzVX1FM3JnfjYkXYAle1LN5kaj7sbR2yHi+1wg7tLab9ODFKBtKvRa9R
         k9LvRUwK5qK2MxqJ3aECfFpjV0GJOUxHgfZcn6PgOU5TGtde4xnqMQ/z+wA3u2hdbbK2
         jFQqwCtnjoNGVM7WKPBR5Xbmd9Rqwe7iOV0V7he7BWgYlBHKr/BpgPcdc8DNpcTw5GN2
         +ZrfoCt8zna/atxSC+5zkbFgjW7VmPfD+RnjeRnWot2C13Y+hnfxh2I/QoPte2lj4gS5
         yWSw==
X-Forwarded-Encrypted: i=1; AFNElJ9tgBP4pD7vGcmwWyomuMyp9B+zFKAzigw/rZJVt0mgcSoY+mXur7c+yUALSCMlBbSIi+yPyNnNL55/fi5ZZEzB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ktGEPNM1ilraIAq4YmZw0Oj97gMAiSKZFb57QNq2Y1u/w+P/
	UKX0fGPJDynuucgfIrf6G73G3MwPZp5IJ7NpUN2FmPWACTCR1LaYIQZ9h8dzf99bw+VjY1agOkV
	9mn7u9/NFwrDo/VAo3oC0fOUjDy+r4nk2Wln8QZCdgw==
X-Gm-Gg: AeBDieuJ6tCeic9AlMC72RcbHzAyCEESIyRrLClkyo7YGFZwjrog8GA+NhN7utdBVHs
	cc1vZ9O0Nm6K8TR/vda3roKuQCeZsa/KXyRriLsbo0hOUbsuW7CD6ST2oS13sv6mmiCKJ9TXdRv
	epLUdKmy11LO8Y4EAJJOYA1ZYU9zamQmnK5lLjSqacPL11J6BevYnr0H8TUaovSn8ZhuHh8kFmM
	hyE53MqKb+lkBnXUGrp6AFINEDxKxt2dIJ1KIapwg2IYwpN3UpH4YagPVxb4iDVhdq3q1iDeB++
	XSv1fu+mEv0i7b/EqlQ=
X-Received: by 2002:a05:6512:3193:b0:5a4:1672:59e0 with SMTP id
 2adb3069b0e04-5a4172cd574mr14121153e87.19.1777295629037; Mon, 27 Apr 2026
 06:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260408141121.386522-1-vulab@iscas.ac.cn>
In-Reply-To: <20260408141121.386522-1-vulab@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Apr 2026 15:13:12 +0200
X-Gm-Features: AVHnY4KIw0y71PHOTou49MhZ1vsAm_GUfrl6yfolmci7Zff-_TktbzdbSpL-x1c
Message-ID: <CAPDyKFrTG6tp9XbuiUYjgMYkHYQwVsyXBuggCc3Lp=J_NcKTyA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: fix use-after-free in scpsys_get_bus_protection_legacy()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, nfraprado@collabora.com, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Adam Ford <aford173@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_061351_464001_D1CDFC33 
X-CRM114-Status: GOOD (  21.98  )
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

On Wed, 8 Apr 2026 at 16:11, Wentao Liang <vulab@iscas.ac.cn> wrote:
>
> In scpsys_get_bus_protection_legacy(), of_find_node_with_property()
> returns a device node with its reference count incremented. The function
> then calls of_node_put(node) before checking whether
> syscon_regmap_lookup_by_phandle() returns an error. If an error occurs,
> dev_err_probe() dereferences the node pointer to print diagnostic
> information, but the node memory may have already been freed due to the
> earlier of_node_put(), leading to a use-after-free vulnerability.
>
> Fix this by moving the of_node_put() call after the error check, ensuring
> the node is still valid when accessed in the error path.
>
> Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps retrieval")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e2800aa1bc59..d3b36f32417c 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -993,6 +993,7 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>         struct device_node *node, *smi_np;
>         int num_regmaps = 0, i, j;
>         struct regmap *regmap[3];
> +       int ret = 0;
>
>         /*
>          * Legacy code retrieves a maximum of three bus protection handles:
> @@ -1043,11 +1044,14 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>         if (node) {
>                 regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>                 num_regmaps++;
> -               of_node_put(node);
> -               if (IS_ERR(regmap[2]))
> -                       return dev_err_probe(dev, PTR_ERR(regmap[2]),
> +               if (IS_ERR(regmap[2])) {
> +                       ret = dev_err_probe(dev, PTR_ERR(regmap[2]),
>                                              "%pOF: failed to get infracfg regmap\n",
>                                              node);
> +                       of_node_put(node);
> +                       return ret;
> +               }
> +               of_node_put(node);
>         } else {
>                 regmap[2] = NULL;
>         }
> --
> 2.34.1
>

