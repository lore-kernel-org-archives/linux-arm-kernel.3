Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC7DC982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfRJWPNyMdJHKo2akk125gwRYNd7f+UhHFoJMmOUa8s=; b=N5NK2LD2rukDSoNNZjMybLcxFb
	9ez7sI37Fyos7/2ud4NinCpHJxmfnnp8Fayo4Jdal/7KiSHz5bnA/ASqEPlv9vYhu46RdynQxV7ZT
	9dj7c9bAJntvJUFQcYgszzZjLqiMukJIXmhxv0Xz2FznLYRpgA4kOLopEjzJOh1C82YXFr7jcicaj
	BvNZy6XEWrrcFQRdO104weWvz9h0RM4rUV/f8Px19UeZMtRrh2KHHXsZq0JjDFrR49DCchQ0LK8sA
	WUcE0XmZAzcGkjPkRM3bdgg79dMW0t2xobvgpTsG5zPpYF1ZViB0FjKYpK7qRNkydFliPW5j69fHD
	rBX+FRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnHZ-0000000EY2s-0qNg;
	Fri, 16 Jan 2026 17:06:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnHX-0000000EY2l-37Wp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD1E1601AD;
	Fri, 16 Jan 2026 17:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59269C19423;
	Fri, 16 Jan 2026 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768583202;
	bh=JKEmFkYFW4s3s3wijhd1JieDXl5kE+3cp9wD4zvj3+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OpgCkyziiCRsP7dfrc3qGS2vCtn5X2s5ZakKZxR9NROzT8CTc9cTgMKA+hr8clxeS
	 VQDZ5VUNN131UbCf16hyGby2EgniI/wsGBd4yzSKBqRZ0U7eNGfeIXZKiiEvsHi/cg
	 JmylGdn+SZW6TAVJgGlAH+cLtxApSIP2X+rEMh0yitMC7mB6sysxxgszwtUgqNG7p1
	 pCBodCQH9XXZadM2QMiFBLZ4D/ukqjqOydZRXK/IrleiidIJOHZAnsVhKKo+DpiEQF
	 LKQPBVGi4f/Jw54CjamzkMiYHLLdiYLahCdrl5Lt35J9qZkaHkkFu5TOX3m8Wbegsw
	 rsC7Cj+eZDMYQ==
Message-ID: <c68c778c-5576-47b9-9ed3-2b0fea545c84@kernel.org>
Date: Fri, 16 Jan 2026 17:06:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
To: Harsh Jain <h.jain@amd.com>, srini@kernel.org,
 linux-arm-kernel@lists.infradead.org, michal.simek@amd.com
Cc: Ivan Vera <ivanverasantos@gmail.com>, Ivan Vera
 <ivan.vera@enclustra.com>, Harish Ediga <harish.ediga@amd.com>
References: <20260106103748.3993455-1-h.jain@amd.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260106103748.3993455-1-h.jain@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/6/26 10:37 AM, Harsh Jain wrote:
> From: Ivan Vera <ivanverasantos@gmail.com>
> 
> Buffer size used in dma allocation and memcpy is wrong.
> It can lead to undersized DMA buffer access and possible
> memory corruption. use correct buffer size in dma_alloc_coherent
> and memcpy.
> 
> Fixes: 737c0c8d07b5 ("nvmem: zynqmp_nvmem: Add support to access efuse")
> Signed-off-by: Ivan Vera <ivan.vera@enclustra.com>
> Signed-off-by: Harish Ediga <harish.ediga@amd.com>
> Signed-off-by: Harsh Jain <h.jain@amd.com>
Missing cc stable
and

WARNING: From:/Signed-off-by: email address mismatch: 'From: Ivan Vera
<ivanverasantos@gmail.com>' != 'Signed-off-by: Ivan Vera
<ivan.vera@enclustra.com>'


Pl fix these and send a new version.


--srini

> ---

>  drivers/nvmem/zynqmp_nvmem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
> index 7da717d6c7fa..d297ff150dc0 100644
> --- a/drivers/nvmem/zynqmp_nvmem.c
> +++ b/drivers/nvmem/zynqmp_nvmem.c
> @@ -66,7 +66,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
>  	dma_addr_t dma_buf;
>  	size_t words = bytes / WORD_INBYTES;
>  	int ret;
> -	int value;
> +	unsigned int value;
>  	char *data;
>  
>  	if (bytes % WORD_INBYTES != 0) {
> @@ -80,7 +80,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
>  	}
>  
>  	if (pufflag == 1 && flag == EFUSE_WRITE) {
> -		memcpy(&value, val, bytes);
> +		memcpy(&value, val, sizeof(value));
>  		if ((offset == EFUSE_PUF_START_OFFSET ||
>  		     offset == EFUSE_PUF_MID_OFFSET) &&
>  		    value & P_USER_0_64_UPPER_MASK) {
> @@ -100,7 +100,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
>  	if (!efuse)
>  		return -ENOMEM;
>  
> -	data = dma_alloc_coherent(dev, sizeof(bytes),
> +	data = dma_alloc_coherent(dev, bytes,
>  				  &dma_buf, GFP_KERNEL);
>  	if (!data) {
>  		ret = -ENOMEM;
> @@ -134,7 +134,7 @@ static int zynqmp_efuse_access(void *context, unsigned int offset,
>  	if (flag == EFUSE_READ)
>  		memcpy(val, data, bytes);
>  efuse_access_err:
> -	dma_free_coherent(dev, sizeof(bytes),
> +	dma_free_coherent(dev, bytes,
>  			  data, dma_buf);
>  efuse_data_fail:
>  	dma_free_coherent(dev, sizeof(struct xilinx_efuse),


