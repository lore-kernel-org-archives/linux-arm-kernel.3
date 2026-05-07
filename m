Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F34DCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyk8eDbl85Hd7XiZtHIzqBxAFI/hqUpEHNnD2/TC2s0=; b=hExojkxqDs/9tKoIpllWjo7O7I
	tGv6Toq8f79YL6FpPNrXwVWpAAcLpC0mJV7DVcShFqW5RyofTfMTzlSebEJyZ8sWcFU4fL56HgFri
	2vAf3rt1ryIY2YqRATBezrhR0wDmAfivB7mv9oymR8/UdXNf8DBDCAbzAksaV6pPK01K3vi69WfYq
	7iZbhAQj+B4/oAQ/nj9bqZasJ9TMGScQqdHZw0MhVIqOCyRIxCUg405zTxvic+bl+YKPG6LgHgg0o
	mgx5lf/pYXqoieZjJH2kOtcj/nz/6YrH3LuiP/QkBQpuBG9cvIAglXIS3y+e6+Wlhx5jDMyxcMxss
	JBD5fjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL03G-000000046Ir-2ftw;
	Thu, 07 May 2026 14:50:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL03E-000000046I7-2Ygm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:50:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ad135063so9008895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778165407; x=1778770207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyk8eDbl85Hd7XiZtHIzqBxAFI/hqUpEHNnD2/TC2s0=;
        b=lwVvkQpwu1w9DPeoIrmrgt1frivtRWPuw5Bw/yVpiUfDRTubTvGIowBljHLpauKQOi
         d5wMbp6u3VunsDcdVvtgMNkgaJ3TfC6O459iy2EB27PEF8EASCRhgMSNfEuWSMmlLVA6
         A75hcZWuX85Ce+Iit/fLkKziTi8jGeNxpW3nC8grsie4jLNnMCVDrQcTbqSA4EEX9NFf
         gyOiYxqvXGarcUlbCAUJyGkBGvTwBWpmjWD6AWhLWnjMX/nJsqFeoqn1mQstuTNLYrHs
         KMHpMEYJoe/6osKUxDhmeoEko76izRC6if/wYn0IFjvzO8jRm+9vCFwGad0rdRl50EoC
         c9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778165407; x=1778770207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyk8eDbl85Hd7XiZtHIzqBxAFI/hqUpEHNnD2/TC2s0=;
        b=razYfd722RDlHcehdXM8tHQIATtoiakrGl3e82HVmZjLch/5L4bzoQnG05JIE5hAQu
         l6EVjcEZ7VMUVC4agXT/NMrccWrcNML/niQzjtY37/qOTvxNawgfOwwH01XPA0Cxyx2E
         EuHNLkDAkltefQ8TOwSNj7Zea5J3UBm4K8GxY82JsfHK70MwSsBAUYWstDI9H4xgDzsV
         tG2DlIXabfpKUmj6zHJWDYI+Rvj5cKdUZHJS6lGez18DM4nibIEVjb7Lj1/eftUj00C0
         TreT3wPEuyVyyT/z2EK4ajrnRIxNvIG+SebxsHiwuMdHqntswACFWYGPMteGUgNDeFVz
         CHSA==
X-Forwarded-Encrypted: i=1; AFNElJ80EP3dgAx3wcYTSpCXZT2IEI/tu1Mb3r9OOOg4/BP0P9K8Yvr5MZNzvcxVvzB5gk7clA1Ipehzk9r6wsbinDbr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqgh6K/XekumeZJc+e3vXrNQqWqGAC98k7g6P/Ts0h7Z1OH3lk
	X71XcnVxjs+BC9hl8R5yWpbnj4uUueooo0/PMZgxlyi6O8sHaxbYn+wt
X-Gm-Gg: AeBDievkHgPOPUWwYou2MzYlH2zheQ0wlo9GZijqskR7ShRYC3ZwXff3s4HWRqLLhzw
	cFyJ6Adc84SNq48Zpne8aRfH5Z+FjxFvgbOdSgqlE6mxAOZrpCM+s9sOJUR+nG1gfGkpYshoKzp
	zfR6KBs4D2oCn3JNbxgcU+mBq3o0qMcdKUBly3hT3Dg/Fy8vuTPobkjR4Mc2mFjxfYsyVbxdmEy
	5Z+mhHR0l+hJv+Bb60EX66vXZaz5eHn1E/EKwHGBV9QLcsZLU311zjYool9wY90hkkBIAaDWqiA
	Dd3MTauAjKkPwa+BQIgRCbqRHpg8VF7AoPq8HXqy5zXT4RG/LdMPpwssrUylfDDY+PkE8GqXsB6
	FTm9rF9RK+Y22IpBslW860Y8dIUbi/9ExbBZD3TSfSISjXM6w9muDum+Vvt1kuH0J1Gac5cghIX
	k8eT3nTVvTVlYQMsGM6HFdm7cI+fNy4TpSPY6bmWR4oLYOdJj+wv2XocmPr8X/oYBQJyI+7WRUu
	NiiqNKV/mFT/Q==
X-Received: by 2002:a05:600c:8012:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-48e5fb8fac9mr40003765e9.24.1778165406496;
        Thu, 07 May 2026 07:50:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm125874225e9.3.2026.05.07.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:50:06 -0700 (PDT)
Date: Thu, 7 May 2026 15:50:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - replace min_t with min
Message-ID: <20260507155004.4d537703@pumpkin>
In-Reply-To: <20260507135525.331107-3-thorsten.blum@linux.dev>
References: <20260507135525.331107-3-thorsten.blum@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075008_672187_534B6874 
X-CRM114-Status: GOOD (  17.76  )
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

On Thu,  7 May 2026 15:55:27 +0200
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> Use the simpler min() macro since the values are all unsigned and
> compatible.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

I'm all for nuking min_t(), so:

Reviewed-by: David Laight <david.laght.linux@gmail.com>

> ---
>  drivers/crypto/atmel-ecc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index b6a77c8d439c..2cf53f0b6742 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -56,7 +56,7 @@ static void atmel_ecdh_done(struct atmel_i2c_work_data *work_data, void *areq,
>  		goto free_work_data;
>  
>  	/* might want less than we've got */
> -	n_sz = min_t(size_t, ATMEL_ECC_NIST_P256_N_SIZE, req->dst_len);
> +	n_sz = min(ATMEL_ECC_NIST_P256_N_SIZE, req->dst_len);

Not entirely related, but (to me) the arguments are in the wrong order.

>  
>  	/* copy the shared secret */
>  	copied = sg_copy_from_buffer(req->dst, sg_nents_for_len(req->dst, n_sz),
> @@ -150,7 +150,7 @@ static int atmel_ecdh_generate_public_key(struct kpp_request *req)
>  		return -EINVAL;
>  
>  	/* might want less than we've got */
> -	nbytes = min_t(size_t, ATMEL_ECC_PUBKEY_SIZE, req->dst_len);
> +	nbytes = min(ATMEL_ECC_PUBKEY_SIZE, req->dst_len);
>  
>  	/* public key was saved at private key generation */
>  	copied = sg_copy_from_buffer(req->dst,
> 


