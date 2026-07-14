Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E53C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=; b=pJjlDPV7gN2V1/DASDrrtKTjME
	uemLFFNvL5a4K/EFJrv2s/rpBCDtmTI80SH4UjZZM/bddHoCV9O93J+59H2XsZsjJkkxmAv8QvCcz
	bW/XWIX/dLta+86oSQXQuo9nKlz5jDNuJtjcc+o2AkJY5wV3XeV9EhoFV7rL3NWYSJFhm7WX0jdJR
	ICckt4gkZcacI5SqVYWGh5BLozwd6U44e/UzVpDKuBqxxp9xiH41GPWbE12H7ZINBNIHe4DkgOmai
	InNJ3Zi9aLih+y+0d96OIR1uBk+Z9ABax6uB/oOVewOy9XwJM3Cyub54B6OYMnXJFcASbrO9rnJao
	B0jK5BNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeCL-0000000COUT-38yD;
	Tue, 14 Jul 2026 14:33:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeCK-0000000COUK-1XnZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 14:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=; b=SoW3F0mgyY+fa0ksphvORDJ7EP
	93Lr40/xpBGMGpht8SC8yfxxg5lJZOK3NmTAlPAvUPQ1BppDCD3TVf96iiIsScBXjC+X/+7kjAfjY
	umJy4lSjcBiLx4tMBpBUZYjdvl5lHmoxIGj23iNiYqy9DdmrB7M1iGiuwpJTAwsF34LDF1E+AENTt
	yr4Ogfd2hUPUnhzwHJ+mwlY4DnWguCfXaiWN8emN6ssjv3e1a6iRrF5kRj1u9XI1+2ZQuRZDusuUZ
	vOWj69v/DHBuc3S6C8HEoXAjaxV2jDPDnB0Yiys/AHfMkp//SYFhobwb4Cb9dqiKH2DgbcTHuKtEV
	V2HqT12g==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjeCH-0000000CbAH-1VNC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:33:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so6228065a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 07:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784039599; cv=none;
        d=google.com; s=arc-20260327;
        b=jX5EPJ+RmlDCH6FYCNyBnO6xe+EfOhcL1xLzj8NnNHBhmiAa13InLl1Of+bpv3KXIy
         /Ktdq1jPX4v0QINRjBHIf9+6uw4r1PHezQbgcZAsp4odhsHBlmTOhTvF56K/9mQejUoG
         +6YZ473B4lqJXxxRG0FXLwTP8NNPdyLLfN49RTUOYCPMR7s3URhynth3zaqIbP6rloD0
         pw+lBzOtzlHipykY//Eua0ZwXoN6hUm3lWu9VS7m2FWJr8PbnvhVqlCQa4Qdr6etR4jm
         VWlRxhyGK8zsABZjRa8Akr1kYq7ruV1yt5vXjCGSIuCaPi5unLJPB/+FlAoHkIVAugFr
         La2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=;
        fh=b0dmDEfxL6Hfat5jZ3Eg2lo++1EZd87D/TFzLBJ70Pk=;
        b=Qb9KuOdtYRnAxu13b4KqettWfDD5YOfiQ36LRIeXVdpzt6ZeBO0utuVJd5CfNjOxXB
         yEQ5JodTftRh+8Mq6AvHtcgxiPzsLzlCPHYk6YBZxUS/PWh2TF+Z/G0V6OqMFKCRCeWk
         wVlKN+US4OASPRCmF5iqG6um/UEvQmMVYGf8QPTUAP+WPJgh055lqy+cBoXT6kHkyb+B
         p1FFN1BpaBy2jBezdmkZ6R3hOluM83YhbKvwBFBJF0T9f8aszC9pB0nTO2it8K5Tb7Ba
         0uxG5szCwojcq+WHI0zParDI12O8Fh/Td96mDvBUpN2KX0y9umq4PxgIlQNJEXawFyC5
         HZ5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784039599; x=1784644399; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=;
        b=epWbFcqwf4mS5DC4WK9x4/WmhWoFbIqAFY97IMMui2/Ormkdxs2B3TgbA4WjUlsXo8
         dsD2dy6vDmC1/JejbF/KI9e/CokhVyjGz228iw8WXWzqQ6/1xF3ZjCB5gpNSeyaGCjIO
         UUJPDxLN//zgPmNkvSx1C0jd0eH1KorK83B2EgGNHDt03gI7C9A5WLbEFmtuLkh0ahka
         elB5450TRaydnRwtCQEK/UGGeasJBXAtKRzjaHhOD2V2PfLGNQGSp6vXl1hKaOnrPCGe
         /kLrM5KCa4xrlb5tttBOQjRoswRgcr//YJzm3rTSIFskP6s+0T/xtGdy+CQq8BVydmxa
         aUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039599; x=1784644399;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=myhkGa3cSq7N/yY58culCXKcRn2P9s26LCZA9dzv22M=;
        b=rvNF5XGvFI4kneCXfG90Kx4PKF3iY8YXf4n+TVupukg7chnFBOHT85WDjjj9UFOlSX
         DiJeYWi4XlkwN/YW08lRxfXFl9N4/+M1etlNvMKpWfIpuP4io6NW/zZCtbtBi7BO9GAC
         RrWiLbmhiqnOrnara71gCbYcxN3UcGcMrqmsxXrL3c0PSIraEr7DbwgGbi2sgrV9Qsuv
         oIvy5wtf4MyuvhY3cYLk3MQWx0u7VMHfVvFmfZ2gWVXBsoj6cLRLZx8lPzgQFnLQ3kYc
         hnY4u5yv2gHbI903T0lrpeEtFjryi8nv02Oedt1GuwPpkbT9ypmyNEJA5hu+y4xm2xV+
         +cvw==
X-Forwarded-Encrypted: i=1; AHgh+Rrisx/AGbCOdkVL7GpmafOa7/fZPXeRTh1dwANB/RSq5kNuC9GUIWe1KTFMDwcsnm+5Dqn5BytzU+qrcUoyRs3b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3yAFbvKqG5ObrTrVHasqQfVTGj9eCw78ONp+sdoXGYot+EKhG
	/cDZqbaBviyfS8N5scK2bSCO7OLM30zLjTyyrpv9XjB91wRz7Dcx3J2zs2satVEhg+IXIQ0kU+H
	QvZMQ88sGXseNv3VLLnMz6Q0GNkXXzyA=
X-Gm-Gg: AfdE7cmu2UQiutZUZzwdGgQP99722vIzP1GfOHW0AzfIyac1GXZJaCZk/QR2SeHLGgH
	f+wt7S5iYCmCBdf3g3/0aR/+wz/DwlbD4/TgTpZNzzKZdhGbKHoYfz4gruPhH5+qF5GLTwPjB0U
	6GOpNDWUHufZnx6iCelqKaxkls3VY26IiMpPIZGPi+oQpE7tILlN/iMjxhAlbOeQaKvDGQbnVht
	gjcta/M3dkkhP+k7P/KNeoR9O7ZOd7D/7mLM3RUS8ixgs4e19qbPe/2j3b67umOZXm5VxGQAWO0
	VrdDpqHB8F5YI7YGg/6Qx3i3/AxxhsZUXghguYTnZ5WJwQCr1NKLNPQQ28kbBA==
X-Received: by 2002:a17:906:4791:b0:c16:71:d9ce with SMTP id
 a640c23a62f3a-c1667996520mr142371366b.8.1784039599064; Tue, 14 Jul 2026
 07:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b0a22171f3ed68e156a2fa84383e99c23ec6b2ff.1784037977.git.christophe.jaillet@wanadoo.fr>
From: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
Date: Tue, 14 Jul 2026 19:59:36 +0530
X-Gm-Features: AUfX_mxwZgJqJ1IU2yY6JoQF_Xog1NgxPfEe0ScKaP2Rhn8fgDalvg7vZYXv3JM
Message-ID: <CA+LZ_WZXo2Dv_xTXT+raGCg=HMfcJ1O=8W6wJ2MAy9-iEYM4Vw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: Constify struct dma_descriptor_metadata_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_153321_514278_907D340E 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, 14 Jul 2026 at 19:45, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'struct dma_descriptor_metadata_ops' in not modified in these drivers.
>
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>  120635   21584      64  142283   22bcb drivers/dma/xilinx/xilinx_dma.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>  120699   21520      64  142283   22bcb drivers/dma/xilinx/xilinx_dma.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
> Compile tested only.
> ---
>  drivers/dma/ti/k3-udma.c        | 2 +-
>  drivers/dma/xilinx/xilinx_dma.c | 2 +-
>  include/linux/dmaengine.h       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 1cf158eb7bdb..fb21e0df5ab7 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
>         return 0;
>  }
>
> -static struct dma_descriptor_metadata_ops metadata_ops = {
> +static const struct dma_descriptor_metadata_ops metadata_ops = {
>         .attach = udma_attach_metadata,
>         .get_ptr = udma_get_metadata_ptr,
>         .set_len = udma_set_metadata_len,
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 98b41b8f8915..bef2b031dba1 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -655,7 +655,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>         return seg->hw.app;
>  }
>
> -static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
> +static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
>         .get_ptr = xilinx_dma_get_metadata_ptr,
>  };
>
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 6fe46c0c9452..fe33a20abc61 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -631,7 +631,7 @@ struct dma_async_tx_descriptor {
>         void *callback_param;
>         struct dmaengine_unmap_data *unmap;
>         enum dma_desc_metadata_mode desc_metadata_mode;
> -       struct dma_descriptor_metadata_ops *metadata_ops;
> +       const struct dma_descriptor_metadata_ops *metadata_ops;
>  #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
>         struct dma_async_tx_descriptor *next;
>         struct dma_async_tx_descriptor *parent;
> --
> 2.55.0
>
>

