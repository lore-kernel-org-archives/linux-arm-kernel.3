Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCDACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdAqq6gqBND8Fs3HbuhQPOwr0iZNfL+XllM8w7ygkFY=; b=EEWjA7BoJX291jVjYmj+C6HKOC
	fQLnb/UzIPoncQQID3Uc7RGHKXzI5kFO7sUeaF0CBdKdCX2Xoc/ARtsZDl5/2iUvEfpNsQi7yJjoN
	Rm/7fT9iYqFHjmahcqp3vPhL7gdwGiYC6ZPLGCfpUhyOZi8AXkqNOLxdqV9RYRPhIE/Tq9fcJGg9O
	h5yiru7VHWOuRoj+5mPsO+vPYlsl3Y/oeoI8VKCfCPGwvJXzSVzqitw0mEgqALX7ADUGj/FcSQ2ib
	rBvU53JR8HBSJzqcjfDstcJN19QAdJcAKXTk40imt6f97UJbQZeqYZWztW1ih2KxKH+8hTzxPveCh
	Eg3y0/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRXN-00000005SCW-3R4L;
	Mon, 10 Nov 2025 13:02:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRXL-00000005SBk-00KN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:02:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8BFfp1144629
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdAqq6gqBND8Fs3HbuhQPOwr
	0iZNfL+XllM8w7ygkFY=; b=d+q2Ky/tFSl9HXhSKh09BtEuMStPhV34WMVQm4Sl
	FVNfpC5SRisHInQYah49vUOz+IFeW7d+oC4fzAlffHNosnx2fMYvjpTujpYa27qb
	hs2SUdA0SEkpgyBi5pvwixA7Ko1lTkwPVS4ArnB5mZi6eVuESyKqCwfc/Ce5v6+Y
	bxNQW/nKjvhMggEU6mYVWMNr5pBv0kjOs9vwtxQjKhg4j3a6eAFvG7BolKBSmIX7
	fgIYAV8Hbno/6ibkj25R6YcSGWDcGrZr9qHhhXoz2YHcAC0PMpid/VbJFwFNhSa1
	P1Wwj5ywSJAgQXH1VlSUS+Bl9Dwxhc8FnmwdHIX5/8oQDQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvjcsm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 13:02:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7aa9f595688so5912003b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762779741; x=1763384541; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hdAqq6gqBND8Fs3HbuhQPOwr0iZNfL+XllM8w7ygkFY=;
        b=Mx49pJtzt929Lztv5TtLgrN2fz5HKuuTXb6b7UePsyb8dIVgOnnQho4OEdiSdS7I5V
         Hvt0HTsQj4A43ACp7I7cFVUvh3bmucRqII7eyH4Nh1IdMjkuXn4dgzZpuB0RvUhu8lTF
         gg3UoZ9e1Z2lwEF3B2G4zKdxj1+ukx5avPKoaB6+DFWy7Bsv2X97rcfAsNnKlHznIs/4
         NEONL3bFx9aJ5fsJ/EeDghO9A2kEB9NB7nvZ+y+sR91lcJyymVKg2dNDbgP7X8XrKww2
         ejfa4rL7sYSsyk0oBqR2v712VSfZsVLAnd32+8qkOrsYAEJuIAjogv/pGUh312xpUWS2
         fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779741; x=1763384541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdAqq6gqBND8Fs3HbuhQPOwr0iZNfL+XllM8w7ygkFY=;
        b=v4ZJkVmJ3/ulgN/TAH/5M/5jyriwIXJ2lFFeNrMYteI6aVWFQioWRyc9sedr9yFVcU
         fiw51WeINE2QFvBQkWOYvgrULT6rZh6K5qdQQHUfoItuvXmeKiLw6GF/w2jAs2USVIOd
         /3vuTrJmuav91Um6U9JbUNmC96/CiyqujrCpUg3nIzA4IsmDB7oRkmA4UEGch5//uIeV
         cyIb+P6L8A3ojlPfkNa1HBQ2FOX+rgWRpbp5Mj3mnN9rHUcWlVbMBDvBaIuxuZTW+EQT
         iYRzHB5IiB3E7dfQ18j0GQqMc9P5U8Z1hWlumwTC86e2O5TxZa95NwyyC58DPm084IKS
         rmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGsaMCrj0txRy2kpOx/0S0k8NUPIFYVcc+DmITMJ7migMuS3bm1+h4Y7MPYg5gJznaowpNGo92lBcy/CjkqgNb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2qv9RxEugh+EkD3vHJZODJYmDjewC81VWSXZX+YREtAiyZ4Kb
	Pbg6NgP0bFzKBUokNpseiar8l3p18KUfxiU2PcpXzqj/cIXyF1ZW+eq8Ii63RnlvnNDTQ+RnVvW
	B2J3+tJnK2vkvtXuhcCS9F/ellbYCRbhULGRgaO9fTjLAPrvNvzkhWxE5KqcFGULLSUQO4tjtjR
	s2Pg==
X-Gm-Gg: ASbGnctUP6lvkqxp+13R+B9jmLTx/mgE8GfDrQ6LyEkbzQsMarugVg7ekQ9moXgCYzl
	3qmbZhdN9QJSljJUc49NOz9mLzujIVzOF70ffTrGP1QHqESwmH34+3nsiYD9/gfk//3UiCSL1GE
	DW4iQjkkebiZF9AxtO93S4tliUo0nS0A1RKAZxNXuZijWxNEghMAxvbNjmxNynstTlhIOauA+uA
	D74nYDa5PJHtzk6+wiqTOpYx7sXVE7sT+wrFNkmZ2qEwDKCCo5sYo9p7Ri+IrkV7i7B5Qk3vSbc
	TcIO37hxdAv1jZA8cXrW1b1oqKkjfGIZ7nGegEKB0IvYH/NtXG59l3CXueixxY9OYLs9YgBlD5Q
	se/e2NKxsPlcDmWnR6l2SNrKi0Q==
X-Received: by 2002:a05:6a00:4b07:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7b22669dee0mr11189854b3a.15.1762779740430;
        Mon, 10 Nov 2025 05:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhpkm261mrE/5oxpuaFgBIprvalMVyj0gtY+UxkD+iayB45fXNN6yALoTWNcWUZ4aTaxY9NA==
X-Received: by 2002:a05:6a00:4b07:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7b22669dee0mr11189754b3a.15.1762779739516;
        Mon, 10 Nov 2025 05:02:19 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff8538sm11894371b3a.28.2025.11.10.05.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:02:11 -0800 (PST)
Date: Mon, 10 Nov 2025 18:31:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <20251110130159.pzfmh7mr3p7xz5o7@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=6911e25d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zIWh1NZzt5suZCnL7JMA:9
 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: M9Cuq6upyQgBZk8y0CXtWEEINu3QOpzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNCBTYWx0ZWRfX2ICs+z3yFZy9
 1tvTHvewIDmhXxSL0Wv/E1FcPNwOp+IT/AKZm1r25lZz+BkR4clrmKkpJvIOHhdDpruTIjVnzv3
 9qI8DSqKEfBJfMBjx7C3Cl5NTqYY0Q30XoU3p36vYtLF4qQ2reg70uzsPrYeEg3rweauGcGEScl
 QCUMOVcM/G3pp8XyXZTFC1OKPgNL6wEcehNDruCBJ0BoMzr20YMgXLE2mJYCBf0hNuC0+gNT7M8
 RLFABhGdeeAZQCTlEYlcdnkLRDaHyz5Q37G9XgSwMX+XHtGpnUbGUjydwY5Rd8NSBSA78sVB98h
 G+fIlJVSm5NRyyjLdDcdRb+Pujf5XaVnyAjLR/idotcNOp6h+SCoMd4uPX+IEjjcWObAWC+ZJXl
 Ynt8TNtT9dp0Gee5cOlKjKMF0wcMEg==
X-Proofpoint-GUID: M9Cuq6upyQgBZk8y0CXtWEEINu3QOpzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_050223_164703_B6678889 
X-CRM114-Status: GOOD (  27.17  )
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

On Sun, Nov 09, 2025 at 08:07:14PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, and they should be
> avoided in shared subsystem code which is being used by multiple
> drivers. Avoid using devres based allocations in the reboot-mode
> subsystem and manually free the resources.
> 
> Replace devm_kzalloc with kzalloc and handle memory cleanup
> explicitly.
> 
> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..ac4223794083f36960b2bd37a601b7e1f1872de5 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> @@ -71,6 +73,7 @@ static int reboot_mode_notify(struct notifier_block *this,
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
>  	struct property *prop;
>  	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
> @@ -82,29 +85,27 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
>  
> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
>  		if (!info) {
>  			ret = -ENOMEM;
>  			goto error;
>  		}
>  
>  		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -				info->mode);
> -			devm_kfree(reboot->dev, info);
> +			pr_err("reboot mode %s without magic number\n", info->mode);
> +			kfree(info);

This as well could be avoided if we move the above memory allocation
after of_property_read_u32()

>  			continue;
>  		}
>  
>  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =  -ENOMEM;
> -			goto error;
> +			goto err_info;
>  		} else if (info->mode[0] == '\0') {
>  			kfree_const(info->mode);
>  			ret = -EINVAL;
> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -				prop->name);
> -			goto error;
> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
> +			goto err_info;
>  		}
>  
>  		list_add_tail(&info->list, &reboot->head);
> @@ -115,9 +116,14 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  
>  	return 0;
>  
> +err_info:

free_info ?

> +	kfree(info);
>  error:
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> +		list_del(&info->list);
>  		kfree_const(info->mode);
> +		kfree(info);
> +	}
>  
>  	return ret;
>  }
> @@ -130,11 +136,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
>  
>  	unregister_reboot_notifier(&reboot->reboot_notifier);
>  
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> +		list_del(&info->list);
>  		kfree_const(info->mode);
> +		kfree(info);
> +	}
>  
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha

