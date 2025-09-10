Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532B5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuMGDqPp6O3zCh9ckBElvKfHIEjOAq1YTWVPBtWfgPU=; b=uCQvg9W8keAXtGi8ftbZcmUUuG
	6HxAtjvrOJR125WLHPr39Ku/pgJtpPmQhjJ0KORtuKqwKJ/6ilNuo0BX1ZMbqrTLd4eyyPjRlUWNX
	c4ZsgsdL9oi7WZhiBu3ioBe6WfEDRDTMqw/YWKuMqYf8u8lJXdgjbMSuNDZdlD0zrlvCK3JPn8k4W
	vZFQatOVwD7jcP3E4X9bpOlXdZhck2yhuEwVExUfE7ew2ZBdXeiwnatUau4He9oSErrfb1BGN7AFn
	DDki2A984pMhGB8dYUFyEgeT/niSDhELoaFIb4wyDhAHLYkggBTjFfjsNYYDUWOedH0futvnsx6Ka
	Cm/DZlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHaU-0000000DO8m-07Vv;
	Wed, 10 Sep 2025 09:58:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHaT-0000000DO8A-0dCu;
	Wed, 10 Sep 2025 09:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RuMGDqPp6O3zCh9ckBElvKfHIEjOAq1YTWVPBtWfgPU=; b=Sz+aXMFgrxv4ZKCMVPONf8AgHQ
	Q9VmbCIu1liiMGFKIGObjhR4hEm5w5Ub2D4kZbr0zbh+ER4Lj9eHJVOB5FL3+D6TT9d8XpnGONAyK
	bdTMTB2bG8y9RhlyN9mEqM+hjXC7+UBz0KfoXLfaVRLuJO5/MFwQc4T314iqIQSwRfwkdrohPyGsL
	k82HVpJRyjnViwC7MANOo32T488TBEH0Mw2x9b8FKjFDkys5+aasl0TLxAh7jI+1y9yuT+c5JSebM
	hVbwfsBQY63J41JWLQQBGzcaTMYyaovcTNIWhvWlQ6zZggkbjmmz+cVE4IxX+99C9q9QIxkaItZfK
	h1b4v+Og==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHaQ-00000005oyL-0JpK;
	Wed, 10 Sep 2025 09:57:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso11062725e9.3;
        Wed, 10 Sep 2025 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757498276; x=1758103076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RuMGDqPp6O3zCh9ckBElvKfHIEjOAq1YTWVPBtWfgPU=;
        b=MucQiBc2UefQW8Hljx7d9bzEBwTQ9ANu3QwI+UB7Vba33QAnHcb613UGDJp3w/93e/
         9e51eEHE7IfgNJRQeDysZTK1n+auY0sPeHoLqq7lDNxCFa7+sCJqcOfRJ8WVZgyblJbc
         wD1kG8Ju10v+yHHIzP3LbkiyFIryB5HxyC5kNk8FuiWrd9avWoAF9YjiZuM6Kdm7btWQ
         3FtGJpvrUKsPEd/m9tI17uE/t21ZZqhBlHG268JajzEeHP3eh5GYQr/opCDCmzUGM3HP
         ReXulHYt52zuFIUJlT5C/zKbMb8Dylgit/QSz/no6hl8iK+Y5A5M//e2Z+5POHRQVWFm
         FJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757498276; x=1758103076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuMGDqPp6O3zCh9ckBElvKfHIEjOAq1YTWVPBtWfgPU=;
        b=UHW/qc9v8Z9R7Wg9XIHddntGLOFfSHjkNSV1tR4SYWqyP8Zyl2pDZo/LJxQRdqHvh7
         jOTznmSoKd0OlL0HQpnltAL/EUzW4ACIKWGqj6oq5qItDNu4ZjT0ZQWAu4EiGYHHB8Wd
         GMWNnaI2Q7svLHQ6VnIiHKDvbMzpM0U6XdKBHvkC6+7YUflAz6aX3bmAm/aVhaCowdrO
         fc4Ass6A2xza2fLUvAMrCsdSwL2uzjR9bh0ipU6YDbcBmrG8XBlUJ16e8/h3O2RaEJX7
         wY5HGp9x2plarJxCV63SX3K6L5u1Y9h8hSW84IVE9y9dSUMRZ0L7VQWQu5S1mRr9z3R6
         YJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCWT3ZPk/+BTsZOfGOdi6QGqH5d88pmyyycuiqtU5J1VtBenvmUV4A3qIF3g9LxQ+ej/tVMvDPn1RZUodpdytEsU@lists.infradead.org, AJvYcCWmp2iD3/fBxIqbI1TpqFec2pcJnQM7TRtc3mZ/Bia+VOOyFEc3vR/04brdhmFSdQu5VXTm8+f7QUu2tl5FDsk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrtjzwbrWIF33AUACkuiiZ8IdmB359UlUn4662veepN8i9VIa1
	L9wkzIywG9EQAx0rkRkY2e5DRNE6q+Ok83xpHWBHrDPBlUWvXVpR+lDOF2lzDw==
X-Gm-Gg: ASbGncsBbbhWfYDjK9zixPiBP4TbBjredp+E0hHbKh1DT8rTPi6ybwC8ltlGTD2CW8J
	g4SgCDRrV/pkr5YKEZ+f173lYLXxWakKua1dzAzgOi7nU425SADWiNAsW0Kkue8HkY1YeYPcujT
	h/3NW6nfqk6czLdouJluQm1mFZhxhDDTB4CVgYxHMnGqXoLOP7fMRsTNWfdLwdZy69Oxz9+dCNp
	Q/0LXeSe1hM3AYELk4SRwCwKd/WIL5VzgasVoC0OWmxwIEH4H9AYD5vkN3XXNen/tK4Bk7xtq1A
	4AQ1RY9s5C5/2D3Enn9+aqVrSJIrQpbyqWEmQIBFsiVv4L6gzBumSOZKHPPUUTL/VXPEi+VKvml
	jW0xFc5cbUxIjF6iwtFh4Ma4rAMjLErznJh1p2pvzM7jj1PU7z9Qv/8U4dkv3W4NvlA7tHUmm
X-Google-Smtp-Source: AGHT+IHJ4FVPPNV1CM9DnA1ftJB0zBlFiNItUpKglY2ydIcyhI27JlokKmL712d7YlJVv+f+5ztplQ==
X-Received: by 2002:a05:600c:468a:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45ddde8bc12mr145262075e9.10.1757498276066;
        Wed, 10 Sep 2025 02:57:56 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81e4563sm22201295e9.7.2025.09.10.02.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:57:54 -0700 (PDT)
Message-ID: <661a6938-859e-412b-ba28-dc6e56c39cf9@gmail.com>
Date: Wed, 10 Sep 2025 11:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Use
 for_each_available_child_of_node_scoped()
To: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250908044348.2402981-1-fshao@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <20250908044348.2402981-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_105758_292173_DCE19FA3 
X-CRM114-Status: GOOD (  14.61  )
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



On 08/09/2025 06:43, Fei Shao wrote:
> Use scoped for_each_available_child_of_node_scoped() to remove manual
> of_node_put() calls from early returns.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
>   drivers/remoteproc/mtk_scp.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..b123698feb52 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev_of_node(dev);
>   	struct platform_device *cpdev;
> -	struct device_node *child;
>   	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>   	const struct mtk_scp_of_data **cluster_of_data;
>   	struct mtk_scp *scp, *temp;
> @@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   
>   	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>   
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>   		if (!cluster_of_data[core_id]) {
>   			ret = -EINVAL;
>   			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>   			goto init_fail;
>   		}
>   
> @@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   		if (!cpdev) {
>   			ret = -ENODEV;
>   			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>   			goto init_fail;
>   		}
>   
> @@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>   		if (IS_ERR(scp)) {
>   			ret = PTR_ERR(scp);
>   			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>   			goto init_fail;
>   		}
>   
>   		ret = rproc_add(scp->rproc);
>   		if (ret) {
>   			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>   			scp_free(scp);
>   			goto init_fail;
>   		}


