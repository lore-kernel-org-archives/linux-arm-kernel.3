Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B1C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMLIJy5K+V1KFSJoFVS5kB5zbFlvRA0wTQQev5uwOYM=; b=gpNKzz6IFErvs9nGmtYEm64g2+
	zW1xkb0nR413+ia21DUKAAwYRgZSGpHBQJ9Mue5sNLHpgXEZ3H6QJ0Hm84cARGJNfRaDImDHNnsFI
	yq2+q7Viae1abF45nYPhEMyHFGdmZCe2kGMnCKT023rH3JtwFdFRQP1OZ15dAHTC6Xzf1bSqQgAzk
	qaMzV1Lega+Ve4kyJs8xIQiDu+iotX9k/QqTAP6GvRyQ8Z00fDDjdTi2tkRqs50rXoZc+p462eWnQ
	/KUPcjiXvfvhEfiTy3XTmt//hv4N5kdlBYfd5ghb/c2xKMSIAAVk+i+FuDOTSSYV/zZL3Ry5i4rEv
	6YXB1rHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2vu-00000007oGn-3XN4;
	Wed, 29 Jul 2026 11:58:46 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2vr-00000007oFp-3lVD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:58:45 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBI56t3953689;
	Wed, 29 Jul 2026 11:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IMLIJy
	5K+V1KFSJoFVS5kB5zbFlvRA0wTQQev5uwOYM=; b=obE8Cn4lQtm0TRPp1PPCCp
	OVdkhqiP8tOz2EBjQp7u58YYrCT0O/RFUrQisuI20kCmT/yZYd3cIwghedHJOjNy
	TVGYcMNd7SXbjgjP410Mdko++Q5SX6v4DoTeV85hEV3Gmfx+MgRGsLiVZgappiVw
	tsFeCFLqDCRK9prsrXaBGPtPFM2ZBSXMHwbEb0sayn/AeoCIEEjq5DqPeQ2KoIp1
	W1+FbvIyUwAEZTNYziptoxoOD5I/pKLWdPB7KCn2iwSNwI+GANApMxcLDFaK6mQT
	Ivpesxs8WVyP4ZStsGSjl9RhIS/tX5wbWLV30ub2zjz9v4yb7gPtRvPvJS2DmGdg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmuyj9pca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 11:58:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66TBuF85014077;
	Wed, 29 Jul 2026 11:58:32 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fn9pgebjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 11:58:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66TBwW5j31785566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2026 11:58:32 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A75358053;
	Wed, 29 Jul 2026 11:58:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34B1358043;
	Wed, 29 Jul 2026 11:58:28 +0000 (GMT)
Received: from [9.43.93.217] (unknown [9.43.93.217])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jul 2026 11:58:27 +0000 (GMT)
Message-ID: <9759b052-d95a-4835-b252-146ec114db0d@linux.ibm.com>
Date: Wed, 29 Jul 2026 17:28:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc: Move CONFIG_QE_GPIO to SoC
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5NyBTYWx0ZWRfX9Qv12SdRGKdV
 O5qBuw0QJRqxOr846gYR7O0pkNDka9+aQ4yrR9w+L7dV2gzzmwb7B29A64hQp0Rfc5+58G3dKdB
 rL7SdV51sCHUy23o5kblRGg6j8DQMIM=
X-Proofpoint-GUID: 804KBYjedgKlQRFvQnsJPgulInbxiJP-
X-Proofpoint-ORIG-GUID: _u5JEvL4JraQDTsUjubds0jTmKLLyyWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5NyBTYWx0ZWRfXx5i973mDxkzk
 dT5ySa4qiycRmNfyhAu1Baz+z5KZt77pq3/FHKrM2cXCVKa27Ww/a4XoLtshs2GwzwMV6KVexgY
 HJpOhw8c5N4fPWVVsMUZI6iqNtdEtLiySnZLc90l6/ltuMtDdv80gmofcmOU/FzroLWl4hQQGGh
 eDAonRXrU7ej9EhH4F9bIZZD4Fr2+wvMJ9WboiDnnFO7zOr9kGn+fnFmKAgL8x5IjOL8BtANTN5
 yY35dkcLatzgSKmGV0RyDK3Mc/MyMinTjX8IFO+lvkrQoszntUTvQtTZ4uO844W3XeRTXVe7hhh
 Q3DtzbSgi/J01gylhJM8xAV2m0eM0cwtdecmi359QMohtmKZCUKuF3tieTGtvMyjXlu4kZwpWsB
 kI/UTXZ2i5Mm5AjfnW9ZNzT97SK0guC3YAgHa8VJc40hjld5A6s+9xbtShCUvaCiAfgQYfI/QfE
 z1VJXtUv9fEPgB7MDkQ==
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a69eaea cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=IKTH_r9ZaJ-rAjPogqsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_045844_059082_FF5D7F32 
X-CRM114-Status: GOOD (  24.82  )
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


On 7/27/26 2:15 PM, Christophe Leroy (CS GROUP) wrote:
> Commit 7aa1aa6ecec2 ("QE: Move QE from arch/powerpc to drivers/soc")
> moved QE into drivers/soc including gpio.c but left CONFIG_QE_GPIO
> in powerpc's Kconfig.
>
> Move it to SoC as well as it is the only place it is used:
>
>    drivers/soc/fsl/qe/Makefile:obj-$(CONFIG_QE_GPIO)       += gpio.o qe_ports_ic.o
>    include/soc/fsl/qe/qe.h:#ifdef CONFIG_QE_GPIO
>    include/soc/fsl/qe/qe.h:#endif /* CONFIG_QE_GPIO */
>
> There is also a dependency in USB subsystem for CONFIG_USB_FHCI_HCD:
>
>    drivers/usb/host/Kconfig:	depends on QE_GPIO && QUICC_ENGINE
>
> Because that USB driver selects CONFIG_FSL_GTM which is specific to
> powerpc, it has to depend on CONFIG_PPC.

Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>


>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
> v2: Add a dependency on CONFIG_PPC for CONFIG_USB_FHCI_HCD
> ---
>   arch/powerpc/platforms/Kconfig | 8 --------
>   drivers/soc/fsl/qe/Kconfig     | 8 ++++++++
>   drivers/usb/host/Kconfig       | 1 +
>   3 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> index c4e61843d9d9..2f797ac6f1b3 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -228,14 +228,6 @@ config TAU_AVERAGE
>   
>   	  If in doubt, say N here.
>   
> -config QE_GPIO
> -	bool "QE GPIO support"
> -	depends on QUICC_ENGINE
> -	select GPIOLIB
> -	help
> -	  Say Y here if you're going to use hardware that connects to the
> -	  QE GPIOs.
> -
>   config CPM2
>   	bool "Enable support for the CPM2 (Communications Processor Module)"
>   	depends on (FSL_SOC_BOOKE && PPC32) || PPC_82xx
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index eb03f42ab978..b35a8fd30ebf 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -67,3 +67,11 @@ config QE_USB
>   	default y if USB_FSL_QE
>   	help
>   	  QE USB Controller support
> +
> +config QE_GPIO
> +	bool "QE GPIO support"
> +	depends on QUICC_ENGINE
> +	select GPIOLIB
> +	help
> +	  Say Y here if you're going to use hardware that connects to the
> +	  QE GPIOs.
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index b3b1ec696bf5..10cff12a3f31 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -611,6 +611,7 @@ config USB_UHCI_ASPEED
>   config USB_FHCI_HCD
>   	tristate "Freescale QE USB Host Controller support"
>   	depends on QE_GPIO && QUICC_ENGINE
> +	depends on PPC
>   	select FSL_GTM
>   	select QE_USB
>   	help

