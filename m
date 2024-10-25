Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1E8D0C61F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgU53FZ8la9axnoKCOcvjKd+4k0u7BILSfDtxg0QRPI=; b=DlbIMKTtKChULZLH321ZHH8cAQ
	PSfUcePUiz2OHA9SnTpP0dm36OA6gO8G8Q6F11VHdgjbGqKzykMLsPxYWevKR63+nAQ0sOfWON6ak
	B/OPQVr4xTWdPVs94x662Pv3NKwx9m57zG339HostLzsLeqhhR/llHhm3Dte5ncCJtvgRlNm4hnrm
	OR4B4GReAOmh7stK+rHx/UnwGnoSOX34cYb+ToxVXz/5xqbqoqxLc4VXjY1YNiIyORZ7PAWzpvULn
	4peEPA5EGMMHY8iMSEFZWE7xBEREfaaiQQfFtlnb9gr8RvmURl1D7sCg7NfJeWbqz5kDSFTdLeY1A
	qrRaw+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4M2A-00000004Bq9-0m3R;
	Fri, 25 Oct 2024 15:15:26 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LfP-000000045ZK-1tMe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:52:08 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a99fa009adcso141501966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729867912; x=1730472712; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgU53FZ8la9axnoKCOcvjKd+4k0u7BILSfDtxg0QRPI=;
        b=GfAStLJtRzHEId3nLJrTLOQPwgFomFxUAsoHMqwL/gDUTruGkyGEHJC+ncxLwExSsL
         dpHfBBIFoymMtlvRvXgXGtTeklfYDGtH1JaJUKYj//3pGjJVLIi8ubQw3WeyQs+ynlBK
         V8JHv7c1z6NCDbpGRgr38AlA64yDEw+47PWn7DammApNj8ZEPry4EMJJSXfdqR99DuA+
         vTpyhoKNRig+YT5uI8Z+pdXAuYw4HbscUGQ0PwFWUgX9nOdYw6oCHGMws/+2iuw7KrxH
         yikUB0TN1vt+rmODLCsL0jx5mHiDTjPvZNGc+jpjDg51Pbm53kXv0kQCFXpxgedJfGhk
         8AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867912; x=1730472712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgU53FZ8la9axnoKCOcvjKd+4k0u7BILSfDtxg0QRPI=;
        b=ZguZSF8lAFijFPYQeet4SjVaukoCFMin5ng//uxFEMs0aV7LYPHJbl1dVy/YUDMb3q
         xNXK2IfF/VACSUXO4AipYpZgCnVmLJFQgYlMJv3g/gpawjbnt+tqjlJpAuvQQzd9+FwX
         lMRU9xZiDZOv6Q7Bf+JHWSBPLaTL5/rxrcMZm23tQXiGQkxn7aC/Ac/8sbWPPuM4v6bh
         00kKjmPrNiqRQA3uzkoLGQTOW5HEwTbpLaXm5hDHeTGimE1s9IJRt7zErfailgSbKyz3
         p5Z8cqhH3FqvGtQKePp3iVOLCYRnCXHUMIC3WBAqzoFD98AbTcjFHp65N7/FlHLEAmYo
         jDfw==
X-Forwarded-Encrypted: i=1; AJvYcCVZXESJoRfLNpsh0VTvgIwda4zANMZRTbjrz/yYv8eTd+3+BICoKtQfUajYdET5Qnlq+fMzlGZYxpSzMB96gO8b@lists.infradead.org
X-Gm-Message-State: AOJu0YyXiqqtKkKB/AXmedaSHp0E9KGJlK0Woz7TKVBOkn8qzos715oe
	dQQREA8IDWqFU/euUFBvgvUgfm6CrHfItzPZBkg2VSEkApJjStjrBw+CruNFW3KFYDEVCbYvhn/
	nqtp+agPVBweawA6bz8nVGJ0tvGVfQ6kEbbwgnQ==
X-Google-Smtp-Source: AGHT+IHnFb0iOpZ/0Hp5TvXS/ZuM2bGwLzFWSn0pQnl2sSkvF8LyDfB90uSqrDGmm+JEY5ML+QSfDQ6nhEYL9j8MdQM=
X-Received: by 2002:a05:6402:254b:b0:5c9:34b4:69a8 with SMTP id
 4fb4d7f45d1cf-5cb8af7eb66mr11748618a12.6.1729867912198; Fri, 25 Oct 2024
 07:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 16:51:13 +0200
Message-ID: <CAPDyKFrtKgqY_7MkZ6R51NhdD3s=rcp6RN41pQJr6JJZv6ugNw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add mtk-sd support for MT8196
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_075155_543931_2F1AD94F 
X-CRM114-Status: GOOD (  23.64  )
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

On Fri, 11 Oct 2024 at 04:49, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> There are some new features for Mediatek SoC MT8196, which include new
> command/data transmitting and receiving path (abbreviated as tx/rx), and
> two modified register settings.
>
> The driver code has to be adapted to implement the above changes, and the
> compatible string 'mediatek,mt8196-mmc' is added to driver and devicetree
> bindings.
>
> ---
> Changes in v4:
> - Reorder the first two commits, and update the commit message to explain
>   why the settings of stop_dly_sel and pop_en_cnt are variant.

The series applied for next, thanks!

Note that, I have put patch3 as the first one. Updates of the DT
bindings should come prior to the driver updates that make use of the
them.

Kind regards
Uffe


>
> Changes in v3:
> - Separate the settings for stop_dly_sel and pop_en_cnt to a different
>   commit;
> - Add the original value of stop_dly_sel to the platdata of legacy SoCs,
>   for unified code setting;
> - Change to return if host->top_base is NULL in msdc_new_tx_setting function,
>   to simplify coding;
> - Optimize the location of assignment for 'timing_changed' in msdc_set_mclk
>   function.
>
> Changes in v2:
> - Use compatible string 'mediatek,mt8196-mmc' to replace 'mediatek,msdc-v2';
> - Remove the 'mediatek,stop-dly-sel', 'mediatek,pop-en-cnt' and 'mediatek,
>   prohibit-gate-cg' in devicetree bindings, due to SoC dependent;
> - Add 'stop_dly_sel' and 'pop_en_cnt' to the compatiblity structure for
>   different register settings;
> - The SoC's upgraded version would discard the bus design that detect source
>   clock CG when the CPU access the IP registers, so drop the related control
>   flow with 'prohibit_gate_cg' flag.
>
> Link to v1:
> https://patchwork.kernel.org/patch/13812924
>
> ---
> Andy-ld Lu (3):
>   mmc: mtk-sd: Add stop_dly_sel and pop_en_cnt to platform data
>   mmc: mtk-sd: Add support for MT8196
>   dt-bindings: mmc: mtk-sd: Add support for MT8196
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       |   2 +
>  drivers/mmc/host/mtk-sd.c                     | 166 +++++++++++++++---
>  2 files changed, 147 insertions(+), 21 deletions(-)
>
> --
> 2.46.0
>

