Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44DBC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r46oSPj/cje0TXqWu8AeKdhGVBdwzC0IRLo83jjaZco=; b=h6LHfW99wDn/4RL9jLTg2UH+Sg
	cVezwunn6+y1Oop19hZPj2fIs/A0BNupIhzyj4PTiwaZaDE/tweprSie4MIAOMWw32DFH1LKFUJFq
	4+r8WKa4N2x+gBTSkx4GmXTAw3LzRfBhv7U4kQ5K8Di9zBC/VxNlRo6gkXljtN3B0KqHo3S39uCOb
	FUx1cKqoSTzT5/2fn48CwM0XXrLC+XiUEF1UZ/J3H26Be5HerAxRg4Dv3sSafKmo/kdN05YpxrQMm
	crENWMN0iCohLs7umAKkDux3wxjppCm8MywFcH/w/0stCHDh/YEe35WqxMqU+Y/CG67r6rsGVJICN
	uiLz+35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkSK-0000000AJqo-3Npm;
	Wed, 19 Aug 2026 17:52:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwkSI-0000000AJqE-0wdo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:52:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHpvVl1347985
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 17:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r46oSPj/cje0TXqWu8AeKdhG
	VBdwzC0IRLo83jjaZco=; b=PdFf05gOrAZ9aW4YQUfvTmE9gfefoyctjkRJz1Jk
	Rs0Ovtnik4hRzgJVLW1u3X9PicY1Ezxx1MEJGx8OoHT7xq7sCa42uNQG3ajfrn0e
	U+eGXKzGz8RGznYC93NLHzrptZLTsWyP21FE+c4FzT1ngcDAnHZiZt1rCeoIbJVU
	DxKCWha4YupZnradZHaP3bJyD+pA9JHS6ypP+t7OPaSv2ZHulqsf6HnzdeTjcZyr
	hmEPt13+WBoWkbj+dq+wIcYzOpfWYuZWUOGMHlhkVJRDNaqtMZIGKNlvyc+BM9fo
	OQSafZd10pckbkXg0Y/N2br3bO0GvIp+pPHcet0uMkSeHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es3gvu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 17:52:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so270443685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787161920; x=1787766720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r46oSPj/cje0TXqWu8AeKdhGVBdwzC0IRLo83jjaZco=;
        b=LXilbQlNoojttaai1Kls7K6vOoi3QwLX91sbFxB3OMELmAvVAf+5Wy7BEXSNWQnD5U
         s7yAJkP00hDM6n58fDNGqEJrXdM7qM4PHfizB/72LCnGUzBTDlY9LVpfKuKdloobb1p9
         UibZK1h/N3DQcj6ga2AhtC2TGykZjZrPUCAQemOxmykt0YLydIgUKUzRafCBTmvAXjX0
         TGrqenqeIrDK7fT8pCMhwyxc97Kn33eXFaznCm/WGKaG+nSmQ0uEqJM/t11+hSGrPNgm
         Z+MgMIB28ePkpDIJ+PwTiU0TqVYXeOTrbpo8q9N0bAq14Tiu8YjfUe/hB4MNmURUuvVb
         96/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787161920; x=1787766720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r46oSPj/cje0TXqWu8AeKdhGVBdwzC0IRLo83jjaZco=;
        b=egdKKrEWZUSHZsPTxAvB8vG0I44nVLPaTqoETF4qZDLBLAqNTZlrzrEMA/GDESGxqf
         6Mlu7aJMBsfWJW1ZKjTPwDwNZkXPHx2OhG/QyYj0dY4RLxMx4Ltc+Zu0Mg2Ypb/RffKd
         TAnuU87FoANss0mLXWzZTjQN9MdEs/HoaYMcN7mJRm/uPg3BEzGXJbjN4823yX4uBtZk
         IoQhPTzA1nG5P+pEuIieoXKShZeGyQi+VmHu9V7t+cr2GefGPoIP/n9980amiwbZosfe
         a8s7E/FyABHJN7xtTyM3aeNDq1mK/W4WMFHJEkrmb5xAR4uIJQVq61+2N1e4k9Gz9DAr
         zk0A==
X-Forwarded-Encrypted: i=1; AHgh+Rrs/tIpwYfkOvgTP7TRIjCe2tnPMBv7Y0EFMVwifSxXKv6lfO2CMA4AHVaWiuH25wWY+6siX4/RxePChfHa5bsq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5MTWvPtqBwgI72XL71LZY1MvSEqB6NpcD6NiUHuZkEWs2S1Ah
	ydcKu0F43Pa6oCKsfVOFzLE+XfZgpZup0wr0S/v+XAShnrxRYhoJec5fi3dlsN73otTS1fz8/Pn
	k2gB7kCrP5en1rjGywe7tGLX5UA7Hic9tqS2V9mJMqK3cFZvZT5sOWJWr5m0ujd3fnsgnpUPuzf
	MZag==
X-Gm-Gg: AR+sD112dorjQsfTfggiFMjI1E8nXM/52XxyNK8KTk3rdkk/1SW25IlZlonVtvm7Ut9
	lLyaxcQGvhwYJKZ+Tw9yBq4v2hbLwEc6yXNXb47QN0KghOvyy4sLqQS50zhs7Ew6xDaB7tiKDKv
	OHvdfo+dCoO1vYr1hkwUFwEi8DL8OCfxUZPgRdmAzxZqfGTNEnKfEEGV10ay3eyKcY/qpVljnAW
	h5ezu9tbdPmbld1ey0bas884Gxe2sTsathdobPl1/22GUi8rwoF/TLDaTr53rVSE7kCp7kl7kX9
	GogWUznItLJgpoTBw0wMvA2jyyFoZWHgaTqj0ophOOrr2w/av6gRU9QeTozkganKY5e/zzg2AfD
	y39qLdyJjjomcoSA=
X-Received: by 2002:a05:620a:408c:b0:930:b5e8:a40e with SMTP id af79cd13be357-9371e2cbda0mr630360885a.23.1787161920205;
        Wed, 19 Aug 2026 10:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:930:b5e8:a40e with SMTP id af79cd13be357-9371e2cbda0mr630353085a.23.1787161919507;
        Wed, 19 Aug 2026 10:51:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e805a4sm84320805e9.4.2026.08.19.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 10:51:58 -0700 (PDT)
Date: Wed, 19 Aug 2026 20:51:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: Re: [RFC PATCH 1/3] pmdomain: core: Allow a non-CPU device in a CPU
 PM domain to do power on
Message-ID: <gkeug6e7thc4j4drwjreirzgtdq747vj3u7jsulslbhru6qjjb@s6ypnqwi3szh>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
 <20260819151457.256959-2-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819151457.256959-2-ulf.hansson@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UIrt2ify c=1 sm=1 tr=0 ts=6a85ed41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=u8BtVuMVLpZXKRMe:21 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3nN8jbBxjk3cumxNoKQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzOCBTYWx0ZWRfX1Pkt0N5C0k2v
 VYcWf2UANg+MmLI8egcYOFhuOmb/8npFWk8JqS/B0rVUybmNCCp1mFco9eOPFC14t3x7IaO8v01
 BAm7P8MC6ZbGKPIXsdJmWZOqZh27FwNcixC2cQVixtGfXQGgTeLhoshxT8UG8i32Tkq/QW3GbKN
 +pJc3Y/mXV54fc1GSAJ2n/JbKWRMJTtDdn2uicrOmy1Dk+yv19s6cJK01M5rEnd7+fXpgfcNy0Z
 GyIet73TXa6YGwBlcKZY3qQ+GQ7rpU4zj3+B73z7FPGQWKBsGQl4uZHZ0a0CFcCVtMwmc3d+qjy
 WyfqcWizeW2WB2BvDYnoAvkHi/x3UY72XH97jGU3cIqXEmqpfE71u/J6WU8Xtq+dQG8tXjrEZoL
 VTOvMB6dQRgIpX20AdzQl4c5+w8r9pOQng3RgKbg80DHz1upl3jmeYlb6frvL4SRsaJNP9MPFLT
 oKUQIJgecnOV0Yjs9mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzOCBTYWx0ZWRfX7+XGTWF1tCsp
 45PakwWlGsoW8Q0M1lPtmU/7grNmXx46CfgIyBLg81cxVr2TNPuKBTDsepFRMhElimsYrtCepp2
 CQoOiPEqc5wr7xijsTegTXF9H2cvECQ=
X-Proofpoint-ORIG-GUID: cfNhOFDPOItmy7bxaQStgzVtx87YzI6b
X-Proofpoint-GUID: cfNhOFDPOItmy7bxaQStgzVtx87YzI6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_105202_384279_64913320 
X-CRM114-Status: GOOD (  33.45  )
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

On 26-08-19 17:14:51, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> A driver for a non-CPU device that is attached to a CPU PM domain (the
> genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
> able to power on the PM domain. More precisely, to power on a CPU PM domain
> one of its corresponding CPUs needs to be woken up if they are idle.
> 
> The current support for a non-CPU device is that its driver can only
> prevent an already powered on CPU PM domain from being powered off. This
> leads to problems for a driver while probing its device or when it needs to
> call pm_runtime_get_sync() to turn on the power for it. From the driver
> point of view it looks like it all works fine, but when accessing the
> device it may end up with various errors as the device may not be fully
> powered on.
> 
> To fix the behavior for these types of devices, let's adjust the behaviour
> in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
> when it's needed.
> 
> Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
> Signed-off-by: Ulf Hansson <ulfh@kernel.org>
> ---
>  drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..7345c06f1d55 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -10,6 +10,7 @@
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
> @@ -19,11 +20,14 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/sched.h>
> +#include <linux/smp.h>
>  #include <linux/suspend.h>
>  #include <linux/export.h>
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>  
> +#include <trace/events/ipi.h>
> +
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>  
> @@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type = {
>  	.name		= "genpd_provider",
>  };
>  
> -#define GENPD_RETRY_MAX_MS	250		/* Approximate */
> +#define GENPD_RETRY_MAX_MS		250		/* Approximate */
> +#define GENPD_CPU_ON_POLL_PERIOD_US	100		/* 100us */
> +#define GENPD_CPU_ON_TIMEOUT_US		5000000		/* 5s */
>  
>  #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
>  ({								\
> @@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
>  	}
>  }
>  
> +static bool genpd_check_status_on(struct generic_pm_domain *genpd)
> +{
> +	bool is_on;
> +
> +	genpd_lock(genpd);
> +	is_on = genpd_status_on(genpd);
> +	genpd_unlock(genpd);
> +
> +	return is_on;
> +}

I'd change the genpd_status_on() to genpd_is_on_unlocked().

And then this one would be just genpd_is_on().

The rest looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

