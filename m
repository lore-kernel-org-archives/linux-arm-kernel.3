Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0068BCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=; b=bWUJw+NER+kzg2LoJOxtsJHWmY
	3E8uhvS34FoGtMdZ/jIxWtz6I8tKCtW9nQDJSCECnkuXV/l4FaUbCcmRxSdWGxyYS++hFK00U7r3t
	TmDqD2uH/cJ4QNjnP7CObUG0XaQtAGBvwKGJDqKE5righJHOm1tFj5jnJAmlqF6nbAKekg7YdMXuS
	eWLzkSYXBBM5YjKLvF8iDJ9lnl/QbAGuNr1BbgAGp4b4kbCZtXgLLiw/Fb5Zdd45bKluYLnAKN4+Z
	wlRO7FFiB7qjK4YZwi/BU17JWtj+hxalh7c+TuMHxdzLy3dWo7GuGsqlyT/dg7f7PY5ZPY1uNOZVo
	k5uhpWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoN9-00000007k5r-1k8W;
	Mon, 19 Oct 2026 14:29:55 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoN5-00000007k58-40pI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:29:53 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-93e4c00d71aso210383685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792420189; cv=none;
        d=google.com; s=arc-20260327;
        b=c9/8YLVVSKTFnmDHy0tVnCK+4WqOjA6HqgSE06DBoPmhK1PWx2+FAX81gPmtZe9CQ0
         h4Rta29aKOuR6rXg9TWy3YTPJ39XTW8iblfwvZ2MhRlul9rmKBRerMBagsSmfbDPvZhy
         WpYNUbbIJZBZxebzW9BsDEA7Jjo1pVzRiPsCZQjEARMdz++QdgFAcrliSwT7YeFZ9q4p
         qeEmhNbtXG8v/x/jiQHPi0xhRPMwXi4Hw05B4kBfK7OIzfKYXF0Ppvr+GYvCEaJVMcl7
         roX0sj3LIe/X56jMUEa5yoTlwXmgnQ1YbxduZ3a8b0eheKMOxDqdpsxocjMxhNWMLby7
         otrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=;
        fh=KuOvSxzutJBbRvaybFjoO5Q9wHUckC4fNdIZwOxid9U=;
        b=Cgc5XC4RwYT+9eE/DBxn7tDBgalxU+ydAbdG/+4TB+ojAVdQES3Mk1XdqHCJdKFF8N
         stibjgpcFFrbF9BABi2cgEmZMSZbLbfCDZUPe4Xbg0nba7JrkJmRH9x4KPYxog7wUw7H
         huzGTd6YJnX/DXJeBIvaWrA29zKvddPN+oB9aAYsugXY2bh4bQW0XGHaeCML7k/g1MQ5
         9Lf6/qMgW9JMtUcpVrFNK0I9swgYqE/dW5+2msfvrzX7FPSrPV9nHeLZxsqNsN6TUipu
         MumCZLaLHXqtwKuAsUbMT2Jo2d0qRDKc2zwIU4jzEngTjNGnj39zunBqvTXMtvn0bukC
         bOYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792420189; x=1793024989; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=;
        b=AaLHQq7pSPpMXFh9c5YiZenS6T9APX/mRn21iP12s7JQPrn+LUZt8YNE9GNubkh4MD
         W4HgJqScKPHZCPKnUBnEVUTns8N7BQN/bM4aUDnjhSgD/2TaCRaJy7eBmMHnKKkwE+x5
         lu0izy6Fpn0fju9JTuDD4DvEN4QyDiCi5XrBATNyWT+wPurVvHmiIFpjw7t6Eqs37Ggh
         h+XcLfKMLKTK6zNnMTZjnNMdsww/+6FzX4LPM9FYjiJXNxxrNhRWpek+V6mU/SZ6ONcR
         277/JSuYSXyI7F0Aso4JSsB/rvvJgGA5iMDpxbpJZhpiZWoqtGMtZsEDVP/iubnV12jx
         9GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420189; x=1793024989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0dMN6vSXcfuXrHsY+C/X/nR9uDe+9XWJ3CV7QZbaZk=;
        b=ajf0jsUoprfoZq9N3QUABBj2StWflcmCGdhQAnd2C4KZOQDNr2dRIOqEsiWslt3WPh
         xOu+xhIUj3qEFKKF2lBBl6nFYd24uRoCRmYclhcBwEKib7ZzfkQq04wPNDGZ9Po9Im9S
         O6mbP5y2612gJhyvPGe66xFsCB6biesvp9jooJ+CB1/9AYp7FeXJ+PH8RzC/w7XmmUL+
         ez7RuuWlaRT/8bWZW+a1RxyXjiISEMErUI2JFOjcUlYo6vzVxw7x/dBjgW0p0H1z4H/L
         me7Urh+S8kew9cMI+lprFAC8hJ9QuSa8IxA7cY959ztacblznR7MMsyO1JpXWHUPG9ax
         D/QA==
X-Forwarded-Encrypted: i=1; AKwUvBwtQ5vq54F4dTFXETQ7zp3CN6+DfjT9BCAnf7M6VAS5s41VkoDPiHpFnk78YyPRhj14qUVsu3HgKbKZg4ABkAYG@lists.infradead.org
X-Gm-Message-State: AFq9FYLV01CP5gVoJXXrLXU9YlRiSaTm/f9koYYlNbxfOMv8o+jR5nG4
	bRnzXPSxkvvCa+tUU2LHCIrMDwV6ZgKSS0tGB+9qYBlq+ARCI21xAUaSjsIEKJwfobWZdwSqUoP
	lwot74ho9Y0UWGYikq5p3nQVdzbfH6qk=
X-Gm-Gg: AYBFou1xv0UhnMAaSiRdiQcO3wftziSiQzoXYqPWeQ5R7AW8AHbLYKyoLy/su0ygyIA
	aJDLOJFxSBtc82gJrJWAkq8e50ecpPmiKiRMn/f3H5ur2yF16jUWXvSsVDbcwuo5KUNmRXEpqIS
	KkaMVnQCmfxZPW5r2wT9ZOpK9FI4cA9i154LvpwrJ34DySdBbtdtG/CRx8+IKENoHGxabVYAWRY
	PHfJnqAp4s85vYmOkrOw0G8+M2RMNR+ul8wesIjWHGBF41KwtLsr17I4O5EyN70lHPsFBEvc0Uv
	LhejnnBcvarGvhLiMOaUmwPJOaLBDaYf+BxjcZguwFAzlxzanfKUeXFUlSaV5IL5ZtwUImggraf
	APD/1XEa8fTLt
X-Received: by 2002:a05:620a:8808:b0:93e:c12c:f12e with SMTP id
 af79cd13be357-93f29df8430mr1133759085a.73.1792420188341; Mon, 19 Oct 2026
 07:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261019135307.2074577-1-bruceli20040604@gmail.com>
In-Reply-To: <20261019135307.2074577-1-bruceli20040604@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 Oct 2026 18:29:37 +0400
X-Gm-Features: AclHuK9cnl2EsfcrhGGH-sXis-mAncR2ezLY-0k25GrZdO9W1GU6GuzZn-sH_E4
Message-ID: <CABjd4YzjRAJ8+U+fmSNjbx7AbD8Caiit5MpE=NEL=SsmSc5SQQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: wmt-sdmmc: release DMA descriptors after stopping
 the host
To: Guanxin Li <bruceli20040604@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_072952_006653_6696D141 
X-CRM114-Status: GOOD (  19.19  )
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

On Mon, Oct 19, 2026 at 5:53=E2=80=AFPM Guanxin Li <bruceli20040604@gmail.c=
om> wrote:
>
> wmt_mci_remove() currently frees the DMA descriptor buffer before calling
> mmc_remove_host() and freeing the controller IRQs. The controller may sti=
ll
> be using the descriptors, and an interrupt handler may still access them
> during this window.
>
> Stop the MMC host and free both IRQs before releasing the DMA buffer to
> prevent DMA or interrupt accesses to the freed memory during device remov=
al.
>
> Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
> ---
>  drivers/mmc/host/wmt-sdmmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
> index 489daee4f4fc..c44befabc909 100644
> --- a/drivers/mmc/host/wmt-sdmmc.c
> +++ b/drivers/mmc/host/wmt-sdmmc.c
> @@ -896,14 +896,14 @@ static void wmt_mci_remove(struct platform_device *=
pdev)
>         writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
>
>         /* release the dma buffers */
> -       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> -                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
> +

If you are moving the function call, please move the comment too (or
better yet delete it altogether, as it doesn't add much information).
And no double blank lines please.

>         mmc_remove_host(mmc);
>
>         free_irq(priv->irq_regular, priv);
>         free_irq(priv->irq_dma, priv);
> -
> +       dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
> +                         priv->dma_desc_buffer, priv->dma_desc_device_ad=
dr);
>         iounmap(priv->sdmmc_base);
>
>         clk_disable_unprepare(priv->clk_sdmmc);

Other than the above,

Reviewed-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey

