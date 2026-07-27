Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05895C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyC9mdpjeVMS9mEWtOssGaeZCvP0zDJ8dCOHi6clafA=; b=HGpXrtv+Yh/ujReU83qi0LQSI0
	1Qa++l0SL1XElVoU2J15xVrWNNFDM7qV8TH5EOWurXAODQRTBoIj4yBonhyyRVi8U1WNUC+jYJY7v
	Y0obgYfknBOMC0yzdPD02aIBbQKNOXkz5/yzBKdUmpn8OtJogLQXRwjHjWtIGuuWRvWE4DMEFPIyr
	s3QLAyvmUMoRVipSin/GzU9mfEMNCm+arXrjGsBtxnFrsP9piOc58HbwIMuh4sNe7WzC2Bv7DcwVn
	Giv2NxCUpM8f457FlGh/+iIcDBrqXEoEGaF7JZbaJ2EAIZ4TqaURtVj9FFhePanrVpfvIvGFAVSay
	bz5iSQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJYx-00000002ahp-0vAF;
	Mon, 27 Jul 2026 11:32:03 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJYu-00000002ahO-3Ifz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:32:01 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2009816a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151919; x=1785756719; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyC9mdpjeVMS9mEWtOssGaeZCvP0zDJ8dCOHi6clafA=;
        b=kfAtyMkWNxwfePjtEGztWzOBCawf+joWS2s9OWRYAt5e2JQt+7TJON1N8zHmj4DVS+
         M9Uqyi1g1f/KcvAzk4Ntt4ny1OZXFI/5hWcqvq5uifZKIUhC8xOIpHewToqTbYAMFQnv
         wx0lZU0pPa2J2GyVH9pNfHqup1C0AQgSqxx8XoDfQ4IKyUJEeUqCLhj7cxFufBVQ1N53
         JAb0uLt+mktyfc7JWu3cYDItTxbRW6syR8k9EkVkdfYAuykj/nk5hVNFmHowij9gF5Xj
         nAwDnI7Gs5wGsoNAZCznTgSVtvhsWyUkgJ42bNkN8FeRrqu8Jhmzb9F0trgP+b1wrKyn
         7qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151919; x=1785756719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QyC9mdpjeVMS9mEWtOssGaeZCvP0zDJ8dCOHi6clafA=;
        b=XdYvF2aXp+K382J9/lkWK9Q/4pKfAr0M2NJq8K7f192Rz+AIsBFUhLhg7IummyTKUK
         vwxZ44dJNUTjfga4IWZ3tgk3+68t5AFM1ASBlTmWsQkGPtArXe5nABgoEAK9IBWIqJHW
         gbA/Sdb9nVQmWoPEaoAI5f13yVXgtrlWQBjUiPcY0Mww61KYQDXhpYcNZ2QGMDcdg6VZ
         ElpFVb2IO7TpDQKBBCkkuol4u9TwAjSaLOTuUG83LkNHGHN+MdimPIj1sHbudd0t0wjN
         2J4J2Xx9rCLpDQ6SZSJoYUEVmXi8YE5vX0IQeQvFgkhgG9VcJvB15zEkRSH1kIk2bFqT
         IOzQ==
X-Gm-Message-State: AOJu0Yyftu+tafwRq1E2IxfFbaA3V5liBC9rVUWYMU1YnCKkfUhUQb+1
	fdCyTa7OfFLWLbadWD80kOSZPzp/UBSSYBLnG/JN77A4rb9otKah8z8E
X-Gm-Gg: AR+sD13ZfI6BVP0DAVUkVb2D8a0I/wMy/8TrxX6bmzYnzspnvQSbC7ZH+NZfYm9MkS5
	oYVudnyLQB6PtW969NLtdvyd+Xdijc8EUqUFlhRFl/D6SVg/r0JVb276YZpYPVvKRoL5hQilmF+
	77C8QDKpqF6ggN3EIYcLK8dL2mp97QNPDFYS3b0DzzC1NxtZinWOK/VJ1UsauFn3JU5RVzZzbvU
	+QuhsNdN/DHcyORXoCbL3g/OWaoW+63tbKweF6E19F360j7INmmx+v8jDcjwJxTTdVCTFGQ9dOr
	+kbfc7zzcmEZr7jEBy9g8JHsUcyHcdg5YOfBI4Q9YkU0iZQaKJd9RPVR9w9rkJxSvrc6IrxRLeD
	Ftut8VhydgwWrn7xQg8VzhmlEIDOmWNaYDEOZvlPwNMaJsYbnM6CcplAKIAXUKAjEpeXmZ4Wg
X-Received: by 2002:a17:90b:5710:b0:38e:b3fd:d584 with SMTP id 98e67ed59e1d1-38f2aa99deemr5981029a91.15.1785151919217;
        Mon, 27 Jul 2026 04:31:59 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f04175c1asm4880106a91.12.2026.07.27.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:31:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:31:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <chleroy@kernel.org>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: fsl: dpio: Use scope-based resource
 management in dpaa2_io_store_create()
Message-ID: <amdBqQfIsAjxMsqX@stanley.mountain>
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6607bb4e-a747-4791-b93f-f82f26e4a334@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_043200_853998_4B43775B 
X-CRM114-Status: GOOD (  22.51  )
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

On Mon, Jul 06, 2026 at 12:38:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 6 Jul 2026 10:34:43 +0200
> 
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> Introduce __cleanup() based infrastructure").
> 
> * Thus use the attribute “__free(kfree)”.
> 
> * Reduce the scope for the local variable “ret”.
> 
> * Omit two kfree() calls accordingly.
> 
> * Omit the local variable “size” (for another memory allocation).

Why?  This seems unrelated...

> 
> * Use the macro call “return_ptr(ret)” at the end.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/soc/fsl/dpio/dpio-service.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
> index 317ca50b0c2b..b252c3c7fa65 100644
> --- a/drivers/soc/fsl/dpio/dpio-service.c
> +++ b/drivers/soc/fsl/dpio/dpio-service.c
> @@ -652,23 +652,17 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_acquire);

Missing #include <linux/cleanup.h>

>  struct dpaa2_io_store *dpaa2_io_store_create(unsigned int max_frames,
>  					     struct device *dev)
>  {
> -	struct dpaa2_io_store *ret;
> -	size_t size;
> -
>  	if (!max_frames || (max_frames > 32))
>  		return NULL;
>  
> -	ret = kmalloc_obj(*ret);
> +	struct dpaa2_io_store *ret __free(kfree) = kmalloc_obj(*ret);
>  	if (!ret)
>  		return NULL;
>  
>  	ret->max = max_frames;
> -	size = max_frames * sizeof(struct dpaa2_dq) + 64;
> -	ret->alloced_addr = kzalloc(size, GFP_KERNEL);
> -	if (!ret->alloced_addr) {
> -		kfree(ret);
> +	ret->alloced_addr = kzalloc(max_frames * sizeof(struct dpaa2_dq) + 64, GFP_KERNEL);
> +	if (!ret->alloced_addr)
>  		return NULL;

Why convert the ret allocation but not the ret->alloced_addr allocation?

regards,
dan carpenter

> -	}
>  
>  	ret->vaddr = PTR_ALIGN(ret->alloced_addr, 64);
>  	ret->paddr = dma_map_single(dev, ret->vaddr,
> @@ -676,14 +670,13 @@ struct dpaa2_io_store *dpaa2_io_store_create(unsigned int max_frames,
>  				    DMA_FROM_DEVICE);
>  	if (dma_mapping_error(dev, ret->paddr)) {
>  		kfree(ret->alloced_addr);
> -		kfree(ret);
>  		return NULL;
>  	}
>  
>  	ret->idx = 0;
>  	ret->dev = dev;
>  
> -	return ret;
> +	return_ptr(ret);
>  }
>  EXPORT_SYMBOL_GPL(dpaa2_io_store_create);
>  
> -- 
> 2.54.0
> 

