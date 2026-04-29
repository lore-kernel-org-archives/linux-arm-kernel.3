Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579BCFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=; b=JpLoPkuuSzYeBDWB+u7uiEUNed
	Vu4oIvEBHHRBgsGWTwfhZcLlUgAZ3Zc7LYlOK5ZLianbpUxJJbCf6aR5wEqYRNmmXwNawx6y1nGp7
	kIJ3FaQ6aMJj2Sf9pVND8FrEFhdv6IFjbfSmlqiiEeL2jnD0wlsOTaKqMlkfbb1urkd0DM5us4xhB
	DCucpbZWI9tiQ1BU6Y9Y0P2wvqT/wMRPO2BxrLm3QyjtsB+JwIr8Dg0VwVA5KzvIIxm/GidUPzB7G
	Ceb7tqpCb6SARjwfl1+NQrDZr18+WnbMrf6PGO0V+teHnBNvtdxu5PWldVxtFLFtbEi6l3gzOVbGv
	oRZpKGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI65h-00000003mUk-2yCV;
	Wed, 29 Apr 2026 14:40:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI65f-00000003mUP-2Q21
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:40:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCLxSu2485195
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 14:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=; b=ef4lgzEQ0flJSMRZ
	KCnuAiih1mbTvqZvzGBYQboodTPMVkgCKfwmA5v0NlHDxRLUAe5/usrRvZ5DunCd
	Dtjq0bLjjK3NrCNYRkODrOqac+6ckiFHH6fmetbhcIKei5jHHb+guSZrHefwBrGg
	FoyPOBVEtGV92AmsE50FouavHUlLT8wCyRDvN4QBXV0ev0XkwZEoB2P50ez9bd9q
	7h7a3sEek4My4c3w+FppcLU8QeCdwUdddAENA6g/bEViMqXg4Op+3Sg7d7SJgik3
	L5inTOStIvMr3tGDYjL5P8c0QrSJPEcn26vs2X3sbdU4Ugl+yq7SJ6TS8ccR4a6y
	KsSeCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx90g6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 14:40:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3648018e142so3506816a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777473637; x=1778078437; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=;
        b=Z92Ad7QomPvRxBvL54b8+gOmuPALsfNhHsc61ngRSnD7PBi/D5Y8DYfiEcYKlUXdKE
         dfXVVOldrtXqoq8ARF3s0oMAQYxboZQ3RQD2xVDEqTjLVbIwFW+itpYGed1D0bHWRRxn
         bnmishRPlfTxTxi/i+4K9iP9x0S0y9chOclVmt2AWNuKrowm+czEe7/JyVm0qAcvhmUh
         ETjMESrfc5+ZMRFyWNON49aq2X5AqrE56NNwickL0SD9lGt5r0p6mi6kcK4setwJ4hww
         vcmFsDY1saJQvl+c3j/g6VXkH09cUChCFI9JpE4HU9JBuiBExvTHTjb+DQXHIrejx/4I
         blsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473637; x=1778078437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTvtklw7T1tb7yJFotQqtbbrKTIyjQvnhgz95DrLbqg=;
        b=Z7cLOevX5f+DkfXoTlsT0cis9Z4Fv9FADvCZOL3I612yhQlhFw//1xkKaTByWihiR3
         FUstm1eJ0F9eewgRG6SHaAvi5NIYArQCoQWDHVo2BvxJd7wrrnNQBZkFslOQDf0044QA
         WZWdmQXydVe3mr0RMPuACmvqI7sj4fTMxwe/EsNVPkCt9Y7n0Asm3gPvJeI2lQjd+mqF
         Gbf01Srg0q6xsU7Icsy4KHPiiYLEKy1KNHd/Pgq4eWDvKaovtp5jsixHqA+mtNJT6CvR
         JfGJpVLwXDYTtY66coWoi5FsBqWxnAw3H2rJMth/8b9Xjfpz0u4OUZEH7DwSXYZqWAXu
         bzsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pQKLRjLsMdd/6gKHiWKxYF6xZTJYIHRKI4+8hVz9dDzp4V8b+/jO4fdJ5oLZWuAHJJLuHhVdAT7DF8EEBzIxL@lists.infradead.org
X-Gm-Message-State: AOJu0YxNhmBCOpjm/0o6vDbnje9sdrvglSLNfN/H/c/kt6SUmFVzTlwH
	uY//ef6KbDG5q5S2RPSpzfagvANHjhzMPWV2tFA29uHF5In8opEwwOltVWzJIwArIIFSsJ7RMcb
	niGuRcwQ0AK0PO83/UthdRkM2N3sy0uJCRLk2Gwqcn2UN52Hu86na5obFgdxO7pMUiwjc5Ufda0
	qkTw==
X-Gm-Gg: AeBDies85S5XEBU7+PWzALXL9mmH6MP5RH9QxPGd5izH1uRsn6i6dDg91DnxROu8af/
	LAJZE8xPEheSIWSs/08MrBYpDHoFsdFp85WnCKrLLmf2piOE1bkzz/94qvzXe64hdrNu4B06Rh/
	h9Iqc8Ihm+qJxNW+a2HgCcapDL22jhMvZb6tcqJMRzKjjxePasSMMCPFWe+kaUHFtYxobvV7puT
	JpOQTvshFxSlcSulLrMOCZAn6UncbvRwVUySxwg/vppBAgNmrm0ZTa3O8az+SRTBP7YOTN079E1
	k5WrCpakwJFyN+4bHq60LVncSqxpHentq7Af2NCN30hNAZMBZCe1ZeaZnTC3Ofy/04vK2NARTTL
	M+fF01q8p9vZy35Y5LY6/2uW9pgH4z5ZcBMCHJVq7vIPk+PSZP78WZEzq4q+PLIeSma/Kq9QITM
	6BBB7+axhC+v9gygEFlF9hU/hIvvRkRnMWFgPrm/83tnpECeRyN7w=
X-Received: by 2002:a17:90b:5828:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-364a0d2ca8emr4196251a91.17.1777473636547;
        Wed, 29 Apr 2026 07:40:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-364a0d2ca8emr4196167a91.17.1777473635798;
        Wed, 29 Apr 2026 07:40:35 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303f52sm4214118a91.16.2026.04.29.07.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 07:40:35 -0700 (PDT)
Message-ID: <e494ba66-3f8d-4d71-a82e-b37f5b34d45d@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:10:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0OSBTYWx0ZWRfX8rFZcKcnVmu3
 fttEQKY77OmPG0jQqpu5pDfc4mS05FylCZhDOy4PCUDk2NBDuInoR7tKqreyQKqgLM/iJ799gj5
 /wFX/3XZUHcmf9JK0gp49B3Iqek3wqjKraQfK5elE/qdhzBR91tZ10FKthHp812D1fgXi44Botj
 d04YJV+1zzqgETovrEWtr++2mFFz/A9XtkMWeCFpQbU8sbHuBleAHCpm4INeHdmdGhEDxrUiq2o
 QByCjLVnhabyMNMuOM1K7X3gNQknURo12X6zOKeAC5Ymu2udLXnPldmVHsHpRupDNOKpTREGZRz
 OPzf0CgsKHkiqLx3c/lGsXJEmFBDgk9XiTY3/PaoC9i3wkq4Q3XdceCDF9iT38NKlWAq1j2qjJl
 xoCZkXPBXhz/IX5su6ncn7ojJROpsMzX+cVkkQh36jJzLXQ+WNXRmVJOrL5rX2PlD2w2mWh7j7t
 saExZx6bfWRaX9TUhLg==
X-Proofpoint-ORIG-GUID: K04IeOR09f86qfoJXGu7FbVj6aq0uOWb
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f21865 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=U_Ea8TlPRqx-BgSQmf4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: K04IeOR09f86qfoJXGu7FbVj6aq0uOWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_074039_637061_128D4E62 
X-CRM114-Status: GOOD (  37.91  )
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

On 4/27/2026 11:04 PM, Shivendra Pratap wrote:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
> 
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.
> 
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>  drivers/mfd/Kconfig                   | 10 ++++++++
>  drivers/mfd/Makefile                  |  2 ++
>  drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>  6 files changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c871acf2179ce16c80b404027e6b969c7787a6bb..333b01fa00b8fbd15e6f31a6b9af47600411624e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21239,6 +21239,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
> +F:	drivers/mfd/psci-mfd.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
>  
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index a1ee475d180dacab245510674514811aec337ad3..1a1316d11e0a2e4f61801586229f5104e2435865 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>  	bool "PSCI CPU idle Domain"
>  	depends on ARM_PSCI_CPUIDLE
>  	depends on PM_GENERIC_DOMAINS_OF
> +	depends on MFD_PSCI

Should this be select MFD_PSCI?
We're seeing bootup issues on Glymur when MFD_PSCI is not y

>  	select DT_IDLE_GENPD
>  	default y
>  	help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..a2d01810f2957abdfa52ae66503dc0cbb205f163 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -17,7 +17,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
>  
>  #include "cpuidle-psci.h"
>  #include "dt_idle_genpd.h"
> @@ -122,14 +121,9 @@ static void psci_pd_remove(void)
>  	}
>  }
>  
> -static const struct of_device_id psci_of_match[] = {
> -	{ .compatible = "arm,psci-1.0" },
> -	{}
> -};
> -
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *np = pdev->dev.parent->of_node;
>  	bool use_osi = psci_has_osi_support();
>  	int ret = 0, pd_count = 0;
>  
> @@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
>  	.probe  = psci_cpuidle_domain_probe,
>  	.driver = {
>  		.name = "psci-cpuidle-domain",
> -		.of_match_table = psci_of_match,
>  	},
>  };
>  
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268e93d1557ca6519ac96056e37e221..75ea5b47315cedfd1153899eef28614a165a14f5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2376,6 +2376,16 @@ config MFD_KHADAS_MCU
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_PSCI
> +	bool "PSCI MFD for psci child cells"
> +	depends on ARM_PSCI_FW
> +	select MFD_CORE
> +	help
> +	  PSCI MFD registers PSCI child cells and exposes them as
> +	  platform devices. Child drivers are probed only if enabled in the
> +	  kernel configuration. Select this option whenever a supported PSCI
> +	  child driver is selected.
> +
>  config MFD_ACER_A500_EC
>  	tristate "Support for Acer Iconia Tab A500 Embedded Controller"
>  	depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28afae975ac61d282b3b85af5440119..36e872b11b995135a04ca24c33fd3a4d08e4f49a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
>  obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
>  
> +obj-$(CONFIG_MFD_PSCI)		+= psci-mfd.o
> +
>  obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7affd6bb09dd83452664edeccb09290fe4f43186
> --- /dev/null
> +++ b/drivers/mfd/psci-mfd.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell psci_cells[] = {
> +	{
> +		.name = "psci-cpuidle-domain",
> +	},
> +};
> +
> +static int psci_mfd_probe(struct platform_device *pdev)
> +{
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id psci_mfd_of_match[] = {
> +	{ .compatible = "arm,psci-1.0" },
> +	{ }
> +};
> +
> +static struct platform_driver psci_mfd_driver = {
> +	.probe = psci_mfd_probe,
> +	.driver = {
> +		.name = "psci-mfd",
> +		.of_match_table = psci_mfd_of_match,
> +	},
> +};
> +
> +static int __init psci_mfd_init(void)
> +{
> +	return platform_driver_register(&psci_mfd_driver);
> +}
> +
> +core_initcall(psci_mfd_init);
> +
> +MODULE_LICENSE("GPL");
> 


