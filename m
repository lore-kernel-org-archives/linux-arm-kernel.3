Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA8AFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eiUPB20olboYzLGxwVsjmcLRmImAdajLHbAqwdJJTs=; b=YNJsW/aTqgt4UEl4lFeKbXVKu+
	7LvSp+WhRz/+Dv41ku5ea4eoFjquP5EWLnsyWLdDivRx53ky3Xv73Ls5h4QixcQSkROXA3iU7arvq
	mw7q6yCAgvNTGKXIcSLa5jryyVuay5cLfEVRufI5eN+ZMmMzN84q9v51Qy5231+ZHemDHTmOU7bpF
	/ngGxZoTlbw848KPQVEMtXpEBtclhpyDyUUkGgp/tmw5VlPCeNujYOZFCJLYOg3/FcxDOTuwobyeC
	0S4lQHEqJmUCt5BM4M3no1/gqEOr8u8VG3q6ofbGTDj5roaTfkQcaYWmWImXod7vh8REq/aHKfVYL
	IzSZFDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIti-0000000Geuz-1ELk;
	Mon, 27 Apr 2026 10:09:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHItf-0000000GeuL-2spo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F235543501;
	Mon, 27 Apr 2026 10:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4E8C2BCB4;
	Mon, 27 Apr 2026 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284538;
	bh=/mPQLeHupRSRLsmcAjweHGpm/avj6Qhw5mgYiS669Nw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dwwLHypFL3Vu7SN74THQy72oh3hKaW60ohna3WTxkcV4aemcVBdKHiQZ9LUsA0H09
	 W6ZynK29DFaxpTcaJ5Gc7QVz2zW4o9fcHZkiVIdWJTcams8sntT2z9ycbNCl3QY4mY
	 wv0X9hM/f7YXvFFJql94zMgNIgXw41AyW1fNTG2Tdm6k3qejyqWBgQBiEjMQw/nzhM
	 KLFGAneJIP7DHwuE0dvtF32r+Xze0wPW1cwX3xEayfxfWM54V1RpTLjS1wX2VEG2w/
	 TD/Jqbn+ZYxvACqdEDN7YYH6r3XRGPya76okYZjoCWppQ5EGvSjLf2nPV3HzNcSeSR
	 sD9gjlq2xiodA==
Date: Mon, 27 Apr 2026 11:08:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Caio Morais <caiomorais@usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, michal.simek@amd.com,
 nuno.sa@analog.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH 2/3] iio: buffer: industrialio-triggered-buffer: fix
 includes with IWYU
Message-ID: <20260427110849.44bc83b3@jic23-huawei>
In-Reply-To: <20260426211834.3318306-3-caiomorais@usp.br>
References: <20260426211834.3318306-1-caiomorais@usp.br>
	<20260426211834.3318306-3-caiomorais@usp.br>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_030859_759202_201FEF62 
X-CRM114-Status: GOOD (  13.36  )
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

On Sun, 26 Apr 2026 18:18:01 -0300
Caio Morais <caiomorais@usp.br> wrote:

> From: Caio Morais <caiomorais@usp.br>
> 
> Signed-off-by: Caio Morais <caiomorais@usp.br>
> ---
>  drivers/iio/buffer/industrialio-triggered-buffer.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/buffer/industrialio-triggered-buffer.c b/drivers/iio/buffer/industrialio-triggered-buffer.c
> index 9bf75dee7..a91d439d7 100644
> --- a/drivers/iio/buffer/industrialio-triggered-buffer.c
> +++ b/drivers/iio/buffer/industrialio-triggered-buffer.c
> @@ -4,9 +4,11 @@
>   *  Author: Lars-Peter Clausen <lars@metafoo.de>
>   */
>  
> -#include <linux/kernel.h>
> -#include <linux/export.h>

Why?  There are numerous uses of EXPORT_SYMBOL() in this file.

> +#include <linux/errno.h>
> +#include <linux/linkage.h>

Wow. That one is obscure.  What needed that?  

For these, IWYU patches, I prefer to add that info after the ---
so it's easy to review them without opening the code up to take a closer look.

>  #include <linux/module.h>
> +#include <linux/stddef.h>
> +
>  #include <linux/iio/iio.h>
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/buffer_impl.h>


