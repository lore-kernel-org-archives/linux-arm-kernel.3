Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F83C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq2RtujxGrJTIGd3DVkk78kzCYiIFx37waJS5UewyY4=; b=RHwMEq+47oH+mi3DsFonHnBr98
	LvpOwzcZd0lhDcyE+pBkh/EgG9j0Zv0f40c3/X5BdNoiahMxNw3b8YSHE0/7q3E3MXEkDIfsdOuS5
	jG0Dfa7/J4aBtFCOv4GwORpqbwxq7/fafOP6sLLDjhJWwAY03q4uuD96iJUSk/JeWqI+7NaP+ecwy
	UTG1jQFxqyLUgld3ZKQ87uODo41PSX7LSWFIjWDR0GFUNXw2+D97LcR5m7LCuY4v/OegW9t7rSFWN
	/kco95wgSceALz+W8VYZcbwa+ZR0s/HvzL7tmi/UjWymjy0eAfVuYv4aJ1rBMTMFhdievLUN4JDpi
	C15vYPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvKQw-000000049WB-3oeU;
	Sat, 15 Aug 2026 19:52:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvKQv-000000049W5-2keF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 19:52:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A40960052;
	Sat, 15 Aug 2026 19:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38E71F000E9;
	Sat, 15 Aug 2026 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786823564;
	bh=Eq2RtujxGrJTIGd3DVkk78kzCYiIFx37waJS5UewyY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EYVc7dIkz8sAGGnIifOr7xcYSgycnMye4jiiP11Hr7c1BQBb3L07YlIzSFIt0D8Sh
	 LleR6bQftlhHsbF0iBXN+WAAKwOVt0nIBddZo74lSopOf1tMeh3oX73IKsm3Wrsn7G
	 JX4RvkdUAU8S1s3bZ2DX7Jbo1nl1Rp41kZQY7nnLH5SxmEjm3/1cYGWogWpRCx8Jk7
	 KnU9mfFSXAic3PLY1/I5h8Fm4cHGVt0MLLMvCqqj/dZAYxAqjQY5seTx+txR4UKrXt
	 cD+1nOpQItDhVsC8bXS0YQOUxp0zue/ukMunnWD5RSCz4+WzFgAdyMvE2M0vyjQcb9
	 wfY1XMXfm+1aw==
Date: Sat, 15 Aug 2026 20:52:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: <ehristev@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
 <andy@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
 <joshua.crofts1@gmail.com>, <jorge.marques@analog.com>,
 <Jonathan.Santos@analog.com>, <jishnu.prakash@oss.qualcomm.com>,
 <antoniu.miclaus@analog.com>, <duje@dujemihanovic.xyz>,
 <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/17] nvmem: add DEFINE_FREE for nvmem_cell_put
 cleanup
Message-ID: <20260815205238.6fbfb2f8@jic23-huawei>
In-Reply-To: <20260806074024.531259-3-varshini.rajendran@microchip.com>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
	<20260806074024.531259-3-varshini.rajendran@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 6 Aug 2026 13:10:09 +0530
Varshini Rajendran <varshini.rajendran@microchip.com> wrote:

> Add cleanup.h helper for nvmem_cell_put() to enable automatic resource
> cleanup using __free(nvmem_cell_put) annotation.
> 
> Use IS_ERR_OR_NULL() since nvmem_cell_get() can return error pointers,
> and passing an ERR_PTR to nvmem_cell_put() would cause issues.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---

Srinivas, if you are happy with this header addition please could
I have an Ack to take this through the IIO tree?  If it's useful
for other series, I can provide an immutable branch that you can
pull into the nvmem tree.  I'll probably spin one of those on rc1
once available anyway just in case someone else needs it later
in the cycle.

No huge rush - just good to keep this moving!

Jonathan


>  include/linux/nvmem-consumer.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 34c0e58dfa26..5315bd862f5f 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -9,6 +9,7 @@
>  #ifndef _LINUX_NVMEM_CONSUMER_H
>  #define _LINUX_NVMEM_CONSUMER_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/notifier.h>
> @@ -243,6 +244,8 @@ static inline struct nvmem_device *nvmem_device_find(void *data,
>  
>  #endif /* CONFIG_NVMEM */
>  
> +DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (!IS_ERR_OR_NULL(_T)) nvmem_cell_put(_T))
> +
>  #if IS_ENABLED(CONFIG_NVMEM) && IS_ENABLED(CONFIG_OF)
>  struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>  				     const char *id);


