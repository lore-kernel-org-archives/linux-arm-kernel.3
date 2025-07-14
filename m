Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7F5C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOhXIN5KRXmAOlmJ/gr6bLaXlBZ7q1R2HcVzTvVEZyg=; b=dN1WllQ0yD9ev6RGH9rL91JI6r
	UEBVkNPyCLKZVRnRC9WbO9ZvuUXDv8q32+aD+rkcbmO8UqOsCLiJEsXOe7OptS/4vbaI1lZ4ePmnX
	YKzXbWdNVqgziRcUx13j8oOM70uOD3si98bSjHjqms55aWdq5GtdKl0iyozysslJpR+ayXnsJPnpb
	tnsYqNO4QTs5dayTlaL7RBU4s6kWBgAKwtfs/NRVX0AnpC01M+qxXiUh6MQoo2Q0DhnlVFZ3ueDcw
	gCUPUzvFenF0RjItFy3rwCW2Oqx9Hi8qqBK+MP+WyioRmqyPTR3C5ijPKD4hAu1ykV4Cp0WRzqJvb
	N3PDFw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHLe-000000021vV-2wtG;
	Mon, 14 Jul 2025 11:27:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHHJ-000000021UD-2iyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 930185C4B25;
	Mon, 14 Jul 2025 11:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429A9C4CEF4;
	Mon, 14 Jul 2025 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752492204;
	bh=DY/dmG6LZNxcbok7TxYUWpoHqR8O26mknUUoN8ACEog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYIReyAs3klRSmt6LYTsKyntQGMMST6uGgl1PMjXnRAetY7AQsoBiwJvrRzLUDJjQ
	 9+/oIXIjiJhUZxDMMT0hOetBJm/rFzgXsyWvVGoFfG9IorBcVt6IDqTXbarJ0ymFy5
	 cimWTCGF/JHusIBPqWcXsNf1Dtg0D91D84wCbPQrrmKBW81Tly1rxv0rbBcBMBR/xW
	 Gdo8CS5XaNtkcQnVELn4XZe/Mvm7dITTDR3V/84LWU04Oo8y83I4h6EQpKiAnLWm5R
	 FFZnXmqk6VgYiH19Y5vzqCYtAwD+NKa4L4ZFs7ffUDEQ8RgL2mQkrNuokVSZPW0sT+
	 /Sf3orGKxjPFw==
Date: Mon, 14 Jul 2025 12:23:19 +0100
From: Will Deacon <will@kernel.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: sven@kernel.org, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
	joro@8bytes.org, robin.murphy@arm.com, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/dart: add missing put_device() call in
 apple_dart_of_xlate
Message-ID: <aHTop3m5gdS4vwvk@willie-the-truck>
References: <tencent_22664B08ACDCE35DE10E5546C2FB26B59605@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_22664B08ACDCE35DE10E5546C2FB26B59605@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_042325_734705_2116C375 
X-CRM114-Status: GOOD (  19.76  )
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

On Sun, Jul 13, 2025 at 12:16:24AM +0800, Zhang Shurong wrote:
> The apple_dart_of_xlate() function obtains a platform device reference
> via of_find_device_by_node() but doesn't release it with put_device().
> This patch adds proper device reference handling to prevent memory
> leaks.
> 
> Fixes: 46d1fb072e76 ("iommu/dart: Add DART iommu driver")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>  drivers/iommu/apple-dart.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 190f28d76615..811bf5176568 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -796,8 +796,10 @@ static int apple_dart_of_xlate(struct device *dev,
>  
>  	if (!cfg) {
>  		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
> -		if (!cfg)
> +		if (!cfg)  {
> +			put_device(&iommu_pdev->dev);
>  			return -ENOMEM;
> +		}
>  		/* Will be ANDed with DART capabilities */
>  		cfg->supports_bypass = true;
>  	}
> @@ -805,8 +807,10 @@ static int apple_dart_of_xlate(struct device *dev,
>  
>  	cfg_dart = cfg->stream_maps[0].dart;
>  	if (cfg_dart) {
> -		if (cfg_dart->pgsize != dart->pgsize)
> +		if (cfg_dart->pgsize != dart->pgsize) {
> +			put_device(&iommu_pdev->dev);
>  			return -EINVAL;
> +		}
>  	}
>  
>  	cfg->supports_bypass &= dart->supports_bypass;
> @@ -825,6 +829,8 @@ static int apple_dart_of_xlate(struct device *dev,
>  		}
>  	}
>  
> +
> +	put_device(&iommu_pdev->dev);
>  	return -EINVAL;

Why is it correct to retain the reference on the device in the cases
where this function returns 0?

Will

