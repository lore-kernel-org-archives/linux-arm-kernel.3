Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020E8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 18:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALPvAyKfQjtdHFgs68bECM2yVyHmmPwO24e9jJdHfv0=; b=sTNv1vn/3myx54UsFF29z+CGav
	XPc64rLyzCVUAvI+/7GLaN0OLOIEbInqAsWWx97pQvtbIngaUtbOfsonX8wcmn8K4GgNBvnCkAgvO
	ATxkLgjKiRhngUttiGlkoRSjYREqGabiFq4F76E6IgQRiqFozvVQxWhzqHJGeHXRqkNnaD9lPs7eJ
	CyqtBQ3OOgCWEjTRixx+lUOJIONzjeHGhUhavbv4OVV9p+X/eOvfcWS4UFgR+YleGUNugHeCKBvYc
	ohaxMFQFCRpHWv09BM56v9Fx+DklOC1G2j8FrUrGLgmHOakHf946QhZjWk/H/QtQSOsM1f0NScBnw
	jHxc/EcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucq0n-0000000DJzi-2426;
	Fri, 18 Jul 2025 18:40:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpxJ-0000000DJUo-3NLm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 18:37:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEu2Wa021536
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 18:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ALPvAyKfQjtdHFgs68bECM2y
	VyHmmPwO24e9jJdHfv0=; b=P8XqDrW5iPG1Zr+qNYrNvxjbOiTer6Kt+/d6Vte1
	U/MkzM1dytcaMlu0aj78H5itvp5IMCpGjxy4Tr0j8VO6daAVabH7uLGgt70TvUit
	UjofSgTWIoF8kkxkMpum7buUxBLgxVGoko/N05tbu/R0p948qF3/4/vy6S8pkNnM
	zeR6189Rz37Cr/c2wJumOJ5j/DYZGwIxN+mp8qkBhfd3N5T+gODgkedqQW7ySpHP
	lI5pkGZdb44ABl6RHSCz4X2wfzp7fVtjK6+Hwcy+v981IgTMULCtGrMW37R8V1VF
	Y+8s2w9sWCBHf9o7RNJpZK0iQTgVJHcL3m3/rBu6N4+w1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpqp9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 18:37:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e32b9398e4so299443585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 11:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752863832; x=1753468632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALPvAyKfQjtdHFgs68bECM2yVyHmmPwO24e9jJdHfv0=;
        b=w4WTqhkj0XgHto6mwNGcHwY3JC0WO8EA7TdNUnt2pn7bELAw4HmQh0ASzV61gKtBwa
         H06p9S8zu9RaLEBDukQnOhaou373pwLQewppANq0QN6s7XdJ2aFOUckdvE7bRjK5yGfj
         LneYMpoFjLBbBbFPGGoKs4TlP2BqUimBEysaTLITQtVgejk39ODz485xDbuuSe0GKEpg
         nuNUNkKarLv5jdQTRG5ga+ENkK/aPIvH3Ml5yREsfQZp6qp9FX5MLr33z9VRX4T9Vqi8
         y+ObBgueIr6lMaTIHPx2pGYkSgIpKLnCUDK0l+ubGNS/YhVyqsIvkGl5DhB/jk4gbN/z
         z9RA==
X-Forwarded-Encrypted: i=1; AJvYcCVAqdVP3jS+lSNi2+OkfBH8Y+/mPHCGVvhvVP8Pogx0iqf+pHxXvdUhH/u7wuDzUcqOVcPDK+scOoQgEpwQB61z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6pa00gZG2u6DajQ97mIOWdrXvPg/UE1itFJnkX760Q8p/i8GC
	QmgbYoVCfR0wHf4qEmIsfeJCjCoq/vF/NRPouyMvqnTBizIM4i/ay99tqTOMNELke+IkDn+2x1u
	r7HiMZrhzjteIK4G83+FrmVKQphMReF/JC1mafsJuByiM3fBm/GM+H3y3uwHJH9i6awyNS8vsN2
	dhVA==
X-Gm-Gg: ASbGnctLWLGG/6wKmnXC/NxpwgmYLTI9ywEuz9HQm+P9ySZWhk+mVKpU5/2XM5uvUEQ
	SYphl3R4bxsQVboEs21yTKoRMtqfA7TPh7O/NofJAsqs3Dvgb2E5NT1WuA9pkK7FENUJRiUtXJz
	2kaN8T75EeMWessopOcCVxoEHL5EJiCH9ieXJhQiPgYl1Srtgh8kKFNFiIe0xStSJ8ZW9AplZoX
	8vsRrfROUbwKdvGAhpAqjV2zP9kb+7SV7gc7qGVMPWWJHE2G5bbzyiYGKjkz10tCoxC5kE3s5+X
	ZDUrNDoSQLheZ4uOsRA/4x5O5iY9K5lBq50vkPLvwnYM9BDX5PTEROM9CSYZRl5c5uQ54zyvH/9
	gzHRRoFf75PnWmYZ9FAHZNRAiJmFjXB9ks9sgKb9cjuPw33Rsg0Fa
X-Received: by 2002:a05:620a:268d:b0:7e2:769a:c857 with SMTP id af79cd13be357-7e34335131amr1702165985a.1.1752863831608;
        Fri, 18 Jul 2025 11:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHElvVFF8dizfyr2Wk3GnhytPZl7LLlYnIUcaoY5rC3+dyUZxZapzDDTomhRW5XbvK70xXqrg==
X-Received: by 2002:a05:620a:268d:b0:7e2:769a:c857 with SMTP id af79cd13be357-7e34335131amr1702161085a.1.1752863831040;
        Fri, 18 Jul 2025 11:37:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d8db4sm2741471fa.74.2025.07.18.11.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 11:37:10 -0700 (PDT)
Date: Fri, 18 Jul 2025 21:37:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v11 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <y7xhfbiwkduo3lytb5gbukdu3yptx6uajtbngbspqbqkyt5dzo@gy62zoxwr6ah>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0NyBTYWx0ZWRfX7psYynEsVSjM
 wedIVpfvmLzwiqWYOaaeveHsyNk2V5RUwciVm4wiDa+IMk4xR8n2qiJBI2N8mt0z4GKj0JpClqa
 oeYhMuHUzywaC6ngSfYKtnHSCtWIM2gT1hXYaxGB82Fr5F5aHnFsUnfIqrzi5RnlJLj0w24xedh
 1AtTadMhwdzxfnNBFHgAzBxz+0xyWifNqVb6ZQ2oqKFxK7ZeBy1ez2qXA4DuILGZPznK8R0AkGI
 B+fP3ChaFZm2Ksz90w5BNAx9YWNUbaNuhOSijTZyFSlVftjEJ2jBfzrgf7H4Wl0nBcte6Qh8FJy
 Fn0Go2mIlAIQAPTr/0UcN82p+yGzKwKOImvys4Hpfwn2+FhuVhhLmDR4gWdqmUrYdmIPi72oqSM
 4QYsjrC6BmV8WUS2JH4USQI91mqkm0hu0zVhKUoTSgpXawU2LeJphDSUPTgUNdzRmwnaqWZL
X-Proofpoint-GUID: e-95y8GPhW57K9AzwlgH5GbP4GZwmc_C
X-Proofpoint-ORIG-GUID: e-95y8GPhW57K9AzwlgH5GbP4GZwmc_C
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a9459 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vZ9_uWrtemhWx8VJ4wEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_113713_849024_1B30442F 
X-CRM114-Status: GOOD (  32.16  )
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

On Thu, Jul 17, 2025 at 06:16:47PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
> 
> Remove the dependency on struct device and introduce support for
> Device Tree (DT) node-based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
>  include/linux/reboot-mode.h       |  2 +-
>  2 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>  
>  #define PREFIX "mode-"
>  
> @@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver
> + * @np: Pointer to device tree node
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int reboot_mode_register(struct reboot_mode_driver *reboot)
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
>  {
>  	struct mode_info *info;
>  	struct property *prop;
> -	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
>  	int ret;
>  
> +	if (!np)
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&reboot->head);
>  
>  	for_each_property_of_node(np, prop) {
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
>  			continue;
>  		}
>  
> @@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		} else if (info->mode[0] == '\0') {
>  			kfree_const(info->mode);
>  			ret = -EINVAL;
> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -				prop->name);
> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>  			goto error;
>  		}
>  
> @@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
>  
>  	unregister_reboot_notifier(&reboot->reboot_notifier);
>  
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {

This feels liks a missing lock.

>  		kfree_const(info->mode);
> +		list_del(&info->list);

list_del should come before kfree, otherwise it's possible to access
freed memory while traversing the list.

> +		kfree(info);
> +	}
>  
>  	return 0;
>  }
> @@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
>  	if (!dr)
>  		return -ENOMEM;
>  
> -	rc = reboot_mode_register(reboot);
> +	rc = reboot_mode_register(reboot, reboot->dev->of_node);
>  	if (rc) {
>  		devres_free(dr);
>  		return rc;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -9,7 +9,7 @@ struct reboot_mode_driver {
>  	struct notifier_block reboot_notifier;
>  };
>  
> -int reboot_mode_register(struct reboot_mode_driver *reboot);
> +int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot);
>  int devm_reboot_mode_register(struct device *dev,
>  			      struct reboot_mode_driver *reboot);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

