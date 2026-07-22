Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B414C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqyCT9Iq0DxPGfOdiNjUipdBGd6ZzRa4dkeRNbbVexo=; b=KyPfOeg/KK+W0KxfHRCsbV8lqM
	jgkPf5T1potXs10ZRFdZorC/Erad9eESHLIgQes990LwcsmuAj5whd7obP4wz1GL2iGoYR0KLNScz
	nrC/a0l6V/9zQgFa5NXzrKAL90FBvWByG9Emua+OSetOPOG3YD1d03yTnzsSSu8uW6EwH0Wc8PKGk
	1/VJ268K2HJRZ5JwtRaYw3fyTBEjpPuFWsS8IWRndyYYy6M84DJEREpSs3NhPdRLOIN4kGWGx2oJ9
	5ZKnUE0vS8cXxjdeHF79eufSsxR+9QwGA6R4kFlT1RR9iNQhiq2owWeXO8OjJsVqwzo4FZJCatpJf
	2KfOXJUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSov-0000000BJrE-0f7Y;
	Wed, 22 Jul 2026 09:00:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSos-0000000BJqn-1qqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:00:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKTt015231
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PqyCT9Iq0DxPGfOdiNjUipdB
	Gd6ZzRa4dkeRNbbVexo=; b=PrB530u3HOg2VClclqSZ5w6KVDmDc1YlTmje/sb7
	HT1OxOsb4mJ57P1AGUAjYaosaquV5lcA65OmQY0iQ0gfpzr0kktBTdFom5rCKXdZ
	sdy9F9+9nFWy0wAnLzyCYBvd9SHIpNK5FNw/cikpEjnhCWfrlf82dpaY1cYrKkIO
	VrB7TkHnagDKzZ+cs8VSY18z5DemTh1AD923r28N8bf1AU5I9Hgjctb6QTHqwku2
	x2s1XV73b6u+nyePUPgsl2bLzAMlWSSsUAbIL601Gz944uZjujizErXWyJjm5aIH
	U3xwRds9e7+sx/5kO9d+M9/hERkXxzOqLpc4OOMEqb8vNQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e36a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:00:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso125105455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784710848; x=1785315648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqyCT9Iq0DxPGfOdiNjUipdBGd6ZzRa4dkeRNbbVexo=;
        b=W0DyLs6DD3lgsE1ZSqLabcGsbEola8L3mpwCjkIO8pj9DBjOsXoR9i0EhF598ywjmn
         JT03hrYugCj/JvG267dgmDZ2jBrr3czjfiAw4+Uf7o5deFAk3XuYkAZrqkU08FCJCMO7
         HseJ1zO/lC4fe2Ib1V9teQVnbYwk9pwXFku9eiDbLCDC332c4vWjTQTLTo70owgNgnPz
         SeNzNmh8DmulzYm9is38WLr58TcLVSe5Hc4bm2lB/i1tCvT0DDCSZ9GV+LnGEgr5PdmM
         7SDveqKYeR7yiHhbHaXoh27w0J9lNLSUez5A1/NlZ551Tpia3ElczdyoQlW9Kr1gnI0Y
         4h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710848; x=1785315648;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqyCT9Iq0DxPGfOdiNjUipdBGd6ZzRa4dkeRNbbVexo=;
        b=QTC/NKrMHe+/KYML/qfL2nfRleeVxrskYtf+7JdCMOTQZeIT0cVrA7xtlEbAi44fGd
         ZaZ0xbJSre2Sx/oehJjNU5KnkGKV6vMASiK8jW0gmyRTCLSLuqTO5IDYip52lUPus1vu
         kDaS5xQX+4WUBpdZwF7ZlaXet+wjTQjMIePdFvpT3vWH2AS8vF22WldRjALHP78dMe/8
         tx72nwNSEnRnYyCohDEr5iVEF7GRm5EtVEe3IODCFVv0vf0zc5ZJYdWwQw3EIc+Hy4g/
         l0Cl415qv1Z/JdsCjTeVLyxDeVcj6F2z+YqvYb1D+uFjcgNlarLMsBygj0fxFzc962o3
         hb9g==
X-Forwarded-Encrypted: i=1; AHgh+RqPKPiVpgNUcGoXiP6cU+vRbWQ1anaScI53lY5EbxYIzThutpE5z49I8ieoU/lbbso2AAFR2sohmmmF57NLmgOj@lists.infradead.org
X-Gm-Message-State: AOJu0YxyjsCgU2mlbKymeAS3jPgG9oatwDoafnkElRpzujLPK6K6bLil
	Al+a5MEye04KrhcojbJnL4svLoJV1R4q47V5KS8Zd6FQ7FpigXiM8pi0QyMVTTu87GQ7xbrfI7U
	RK3jf6lPRkbaiW7ww7aFWbKkK9tQMB241fwgxx+TyUrO96av58MXv5AlNINKGXyK32EYmXfOgJO
	aM1Q==
X-Gm-Gg: AR+sD12UWiP2DxX0akKUpNSbP0JxnbKstRM7XBn86ZJBlxdxBwRfR1iPC8B5ayAziUL
	sX+FcWtaabKqV1MmLXyimBo7xbkcGWKICpsoICV7CMUMzjRXJ9g7Mr6qeTjeI1SDQXiHg4fsJXF
	Os+Nu159dYnzp32HhJOt/hMxHEJjr/UZRIfs+wghRNxyYXRZMWBDyBiT2bQWR3CpvekUqP27Ca4
	iXGNN2CAYF/lZsmKfJUh2r1Ug4j0lKRSLPLwwhpDw4emEjyS2bo5+MI4mtdgqJmIt3FyOMdlQ16
	F3hAGgrrEaqGFGteSXGwksn7ust1JDl+wu7UK6ZKMCHXfCKwxm+EqfWTI4Twy9CSoULeJ818l4E
	U8Nc9Fc+SMZkCRLPODeBVIm4Mfo1ImaY9Cw==
X-Received: by 2002:a17:903:291:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2cf348acaedmr221823445ad.18.1784710848287;
        Wed, 22 Jul 2026 02:00:48 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2cf348acaedmr221822565ad.18.1784710847561;
        Wed, 22 Jul 2026 02:00:47 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm7167019eec.3.2026.07.22.02.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:00:47 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:30:35 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
Message-ID: <7b1dad52-b9d3-44a7-aedb-62911778f3ad@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-GUID: QZhSowYxUjkr_HkOWQ_1WWIgvNFXtAOu
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a6086c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jeYV839nRbxY1CX0_0kA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: QZhSowYxUjkr_HkOWQ_1WWIgvNFXtAOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX0vRE4Uj0ZglS
 7dTCzRRyAzUJkRWuliDjyQUWx58JZxQdKcKb/ucClY6coh+dbV0BcLkprVUNFSF/tsgaeokq8v4
 l5yIYJ/TBOvi8A+wp2VoKFdBxXaIjuKNlTJUqYWbDcnCBq1Embz6+pIRqtt/wekYHcevy7TPGQy
 A8YucFDDbFtCY1nZeYSs42rLv0lMXt7dEvkRq7ype4il7lU2e6T1Plxt8GnQW7DDBGp5qpq4kP4
 jfd+csxg+/7+k3+ZM+22JYJCGqtEzqokjYzhzkDrxEJaJRSexFAtRcYngV1gFRJaomwibBNhG82
 sD6yEhjELHHIZJtf/UMhkynJzg0CUmFf470+Aufx+MAmvCMR/gOELgWgtQwwHMPUvupfzV92nse
 hF9NP7PVx1PypKa7r84fq4wL+YWS6zgSE3SbkUEqbQ4ikn92sNLU1mHtlV2VkJ7/zhahymwWsHF
 Qg2/E5ztU9HxBLQjlEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX62719ccvhErR
 KyvgXyD4qsXYYpmSrL9Kq9rAJmbJzR6jUCOa1zt1Qz05mtXGGMmpIKVrncqgYl26WRueOxQM7qI
 1YN6DfNlcDL7Qygu6rHNhVHHsUpLTvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020050_501417_C750FDC3 
X-CRM114-Status: GOOD (  32.48  )
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

On Tue, Jul 14, 2026 at 10:46:35PM +0530, Shivendra Pratap wrote:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
> 
> Add a psci-reboot-mode driver, and define two types of PSCI resets,
> predefined-resets and vendor-specific resets. Predefined-resets are
> defined by psci driver and vendor-specific resets are defined by SoC
> vendors, under the psci:reboot-mode node of SoC device tree.
> 
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
> 
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |  1 +
>  drivers/power/reset/Kconfig            | 10 +++++
>  drivers/power/reset/Makefile           |  1 +
>  drivers/power/reset/psci-reboot-mode.c | 78 ++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1ed6abef62a..4910abafa170 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21576,6 +21576,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
>  F:	drivers/mfd/psci-mfd.c
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>  
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 124afb99febe..93e4029d9506 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
>  
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
> +	select REBOOT_MODE
> +	help
> +	  Say y here will enable PSCI reboot mode driver. This gets
> +	  the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +

Since we have added predefined-resets support, why are we forcing this
driver to depend on OF?

For example, `reboot psci-system-reset2-arch-warm-reset` gives me
warm reset on non-DT systems, correct?

>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index d7ae97241a83..02948622fe3d 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>  obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
> new file mode 100644
> index 000000000000..955ed68f1402
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/psci.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/types.h>
> +
> +static const struct reboot_mode_entry psci_resets[] = {
> +	{
> +		.name  = "psci-system-reset",
> +		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
> +		.count = 2,
> +	},
> +	{
> +		.name  = "psci-system-reset2-arch-warm-reset",
> +		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
> +		.count = 2,
> +	},
> +};
> +

Thanks,
Pavan

