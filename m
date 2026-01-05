Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7D4CD040C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=; b=K3LcvZM9fVvWAz0bnue2gsWmNW
	PlPCHI1ukROWwbD7dl6dceW9GtY9UY0NC0Kx3Yo3P2dYkBrig7oURkLg0GmLQMvS6C5aXfkQsS3TV
	IpkKFptHfMdTmal1yw3DcG/BzP5ernkP+eEdxHl83ky5b7m9vI2umKtHgOiGad9dHiGGK4PXCKsie
	WN956OSYTODS8bw4rHf7+vLC9gtTadbGTjDsMJKP5GGvcCC0faWAdjsZifkVkcV0elxtCot6JjHlh
	5OpD/zT3Zq94tnYRKOdtYKaZ7GCwWXc5w4VTsQWZRUszOp8/3XlPz9g+Dh0I2/fyHqlCjdt2bTtnf
	lKyw46Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsCO-0000000C8Aw-2MVU;
	Mon, 05 Jan 2026 21:33:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsCL-0000000C8AA-35C4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:33:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0d0788adaso3140285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767648789; x=1768253589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=;
        b=zzYciquNB8WHPeXYeuiiqNzv8cfMLaThzqhT3k/LWnYo2NdmSfw2iByXYP6nfiip0H
         2QkfcGn0YlGH8l887Sq7iITzUTdDDbNDjGjSoPIRJFF6XIlqLZvX8zy0rMrrrqzG2oqC
         rd/Hl6QR4stMtE+oy+wrIAJqscPPEsuQnXjlMDNQLXwJ8mNNpsuBsvR0VBIiat3hz+i7
         0hKSk0o6OAl9wh+evXlTpMRSmhxwyUOfs+/gLbDNXfpcBTUxglbZtd3/xAWipFpSYHe7
         zrTJL225zEFwbjX35JZ6k7Ska+wtAawrUxpYR8Xv1U8/7P/bIECY5IaPc3kVexAAS0p+
         ooNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648789; x=1768253589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8u80z+tPf43NlNwf3gyc1tmFsPKFLQnzJ5dp6IiBCs=;
        b=oLm8Rp8QSggeHGhS9e8AGntIJU7Fl70PxS/S98/MjEUIVUQZvat19Mw+vEZ8gJ60ML
         VNdWj3njCzElo31f9RQ9xuSSYhgtvrym8ibguiYmB3XU07LF1Ck/z8B0zVXYng8Gn9LZ
         sor90QNAQmjOKd5T7t9p6jbPaFEdiSOqZ+zKPBwHUnjUjPoiws6Cpg473/nTGB0jVSWb
         XB5gV+JTmOg3hw6ZxoNuUrA/LVMpHdThiSAV0F/CDCYdL+zaBPWKdEnzSm1fT4ysAuAq
         hDc+/tlbU9y0fWEWPR1MjKMhqVISEOGF0ymZRh8YmMa3LawZ3Q2p1+jf6E+dhwPE2lgy
         bEZg==
X-Forwarded-Encrypted: i=1; AJvYcCWKlu0Y/0QO1qV4rTfYtLYcDkiYRaXqR9f14+DZWCG1LQQfecqH8wmlY3MY/c7t6xPhLe8sHfaISj6frKeTZBJO@lists.infradead.org
X-Gm-Message-State: AOJu0YwIiYahLE6/xfSAOyKgCn5d2saxgZgI4BV3X4toBWyV8ECtoVf0
	WR8AmhKVWgGKdZcu95e7Qr+lPGxGLUa4n0O1YWbVdFw6QymVUfgEsktQTVxR+UsGmUs=
X-Gm-Gg: AY/fxX4sur24M7KyeDiWt30rtNYfaIOc5tWI2Nb9Ll1rQVvcGJFn9N+jA6Zy5wiCfHi
	LL1NFM9O54nZZOzDOfOBytWwx1r0epYeflD5rNiHlbxTLT/K9hYLtegDFOXbjn5P/AwARDyLc65
	pDcXsQLY86P5/Dr7a/Ei1hpIjsdPClh09TbH4XyOfb3VDAsCNwsUFL24fvjkwwmWXmgF3MF6/nZ
	bA3ODejVJJ+X+BQNDV36SBS/ITVPbvlu8pUR+sRcFJ3dpPRmYEbuY3Sr0FQAeBEX4QDV4F1X3AF
	yMbmdrizIodOesgBobt67f02WacN0SHnCr9d9TolUjmRQdVPsyRXC6IlqmS/eMBy4xbXtN0tC1P
	T8Wu/846twqW6jCCfWadLi69fgnpdPG43Vx+HLCYE8WFi3umphlND9EKjMa6MZYavUu3K2f7osy
	zXm8RXMnAtX9S7FQ==
X-Google-Smtp-Source: AGHT+IF0bVODhApERlsNCQrrCwCXh5Bc7cgqZB6OPyCG+4xaL0MSIbArxA2Sg2gVDzhacygsGqC4xA==
X-Received: by 2002:a17:902:fe04:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a3e2cefe5fmr6801155ad.31.1767648788754;
        Mon, 05 Jan 2026 13:33:08 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a512sm1849275ad.10.2026.01.05.13.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:33:07 -0800 (PST)
Date: Mon, 5 Jan 2026 14:33:05 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] remoteproc: mtk_scp: Simplify with scoped for each
 OF child loop
Message-ID: <aVwuEZCAjscaZs7m@p14s>
References: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102124827.64355-3-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_133309_808832_2B826170 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, Jan 02, 2026 at 01:48:28PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>

I have applied both patches.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..328541e62158 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1287,7 +1287,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct platform_device *cpdev;
> -	struct device_node *child;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	const struct mtk_scp_of_data **cluster_of_data;
>  	struct mtk_scp *scp, *temp;
> @@ -1296,11 +1295,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  
>  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>  
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		if (!cluster_of_data[core_id]) {
>  			ret = -EINVAL;
>  			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1308,7 +1306,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (!cpdev) {
>  			ret = -ENODEV;
>  			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1317,14 +1314,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (IS_ERR(scp)) {
>  			ret = PTR_ERR(scp);
>  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
>  		ret = rproc_add(scp->rproc);
>  		if (ret) {
>  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>  			scp_free(scp);
>  			goto init_fail;
>  		}
> -- 
> 2.51.0
> 

