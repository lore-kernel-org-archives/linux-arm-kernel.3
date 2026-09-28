Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BB9CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LbniYZ7fnuS8HEmKzDH2uTF6sC0/heSzXV6COCGwWA=; b=wmZYRQzikQ3mLsHMyD7CHmtMnT
	JNQ0GSf3PB0NK9LlCugObWXRAjD+ZsH1HZGr4MMDkD8y39FbeC8NapUmBrrzzvVQzmvdybnlcp4BF
	EDlGLyTihYWVijCTY/xdSrrO5otVwsraB0rt13A2WS8D4E9vu7NkJu+A56eJocNghCUQrugWSGsXZ
	dE8T3C58TcSHZTPy+kPnXeIzPoDv7semOBBtKoZx3D2EGhnIQpBaSQhRsJXXrYr6EL0PcLTb6fwEA
	5olIPPT0XtqJhso52Wcyj+JGIQ7MKQ+AeNHNkECY7k4G+YQGGO1kiOVuc0nBQ4Y9J7Xm6lvNk9ax8
	A9OJcJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK2Q-00000001n8p-27Hm;
	Mon, 28 Sep 2026 22:41:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBK2N-00000001n82-2Rzq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:41:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SM8RTF2878689
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 22:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2LbniYZ7fnuS8HEmKzDH2uTF
	6sC0/heSzXV6COCGwWA=; b=fjfMX7DCgOmRzT/SXFHOJcxZhAEzsF0iR1PEIrfP
	2PdEa/zcK13cRf9T1vNbL0Dg8hnERdJYitVwMvmb37m9I0krzX/UukT9vhI69UR6
	lqjvxKl7o0WKuEzRtia83YRly66FDBtlLzXVBaGcIArK15GzkI4+V7Jo3qKnHnNB
	WWUDb7rAFiT8n24DIErCVv0m+IweYpsJ+XJts7I5Bkj7v6LNsP5UPChyMg5YTwnl
	17gWs35BJN0fTOILqfqy4rlkyEq34pwWHwWd1yeiQZdc2JeUqsGdNEtYpt5jJydc
	cMqZhq9/NSp4oyuHDnXG5V7xrXjmrPUkuhFGqdQp+AYaAw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4r39k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 22:41:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34316295d86so5713617eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 15:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790635289; x=1791240089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2LbniYZ7fnuS8HEmKzDH2uTF6sC0/heSzXV6COCGwWA=;
        b=IkOEynGVAK0E1g0ctI/rZy6VbUlxR2vN08yvS6oWvOCAfgr8H28FVDjqIkYg7HCLnw
         0QYqFZ21/k02cpnwLgMK8pbe+JxK4K+6y0MvQg64VR1eMur2EmLxcAKO7wq7bO6HHASo
         7x65bognWln3RfpGv1rON+7lYkl5UeuNpRfnAT5DfmOcyuCEFNL9hRPdDWOZm+AqAmse
         BRvIVsfeYdIvwm2g96p8ZNiNSdVAqmZDBnTiJ2pFapxia2u0QXAU76v86fB+ZHiaNDUF
         5cN2j5k+7ZbYz17Rr7D4D3ilNb1Lp6Vlmflk7MQF9UTnfdHi6mEUCg8tbcMNy8ciCCBX
         D5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790635289; x=1791240089;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LbniYZ7fnuS8HEmKzDH2uTF6sC0/heSzXV6COCGwWA=;
        b=GwZknDToprQNwi6v+BE6pyVYtMbRJ3+QSfnIxan1h+vwACUvOzYeNThVqe6UwmP6Lt
         3ju+LApAz3Q9FUmIN4tZzVSgEjyzM2ulRFv+YhtWy6HzNsrcTNdUo5qjDcnYVeNUXZet
         JjaAZTScoIBukEx3JQPEI6jxMFn8SK/1Ik8n8XRMgRj4/TckUePmpgt5bcID2KDTE51L
         TsAN/OSYDuipKDiScCedlo2CRi2enR/+DQI7NMzuEyEEgxEbwysYsqTN7KGEtrTeB71Y
         7tX1j1NKC4jqiE3WjuFVoqf5RnAuaMRxeFDUjtlo5bjnRHI/Hc1/c7oxhdnbSkcR9VOq
         +axg==
X-Forwarded-Encrypted: i=1; AKwUvBxtvQeWbjWtZHMRG1egcSacO8+ikxR7aZZbvu9BJWxH2u13YTDj4i/CCHTNppUbQ3arBzeAiuRfujrCthuXCJa/@lists.infradead.org
X-Gm-Message-State: AFq9FYIX01uWd5o6C+1F0ULIAvFLuYadN85V0hpe2xT2VGdlQ/r0qd18
	bQK1KsMEA2Bw3INid1hTCNr4izIRXw/lwFufZ1Emvp7x4Od3OAKvIRXTqQLq++vKKcu4RC4ag9w
	hxuOc8ibtisBbzRChcufglSd7yCejaJCt+GsoXRUnwWSFBVtCbH71M6/R/LRaEaX9F/SSKVX0C/
	+wEA==
X-Gm-Gg: AYBFou2nr3iGgMjEFBxZ5swy52aS9JmnZ6G7VEAw++z1V3aWYHuntq7mgguxMOvwhGa
	fr5iN/HheMvPV8gR1quZkjs/aWP8QpZrxwJVoGXsEBRD39fEzYXJZrVqBaZ6QqHAG5Q/DGGOd2L
	gqA/GZeA8NbBDFn7aArchskcwIrrjI5F5jEafgby5WMTpBNrxe7Imr1TuqYsxpU4b143KedCInA
	vRYl7Dwv4wVivZTdG08OxSNrjcfwHjoLx87Zhyh5JtsiCbXDhDZB/C7F5/8Yej+gu3a4K1OKKSD
	8KCQNgk7m2vgueTWlY6U4lhgA13AfALvxPQAoGWS+tFNCR4rL5+fNLYjMjYrTRfFW4PkRiMOqqG
	fRO4iRWpOxuts3leE3PZbvCPxcR5gdAElmLSyr9WWxmT3jKJS
X-Received: by 2002:a05:7301:428a:b0:344:bf6:cd8f with SMTP id 5a478bee46e88-3440bf6d66amr7350715eec.31.1790635288862;
        Mon, 28 Sep 2026 15:41:28 -0700 (PDT)
X-Received: by 2002:a05:7301:428a:b0:344:bf6:cd8f with SMTP id 5a478bee46e88-3440bf6d66amr7350648eec.31.1790635287162;
        Mon, 28 Sep 2026 15:41:27 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a49febsm32699771eec.2.2026.09.28.15.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:41:26 -0700 (PDT)
Date: Mon, 28 Sep 2026 15:41:24 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH RFC 10/11] iommu/arm-smmu-v3: Add IRQ mapping
 -EPROBE_DEFER handling
Message-ID: <arrtFFtK7KgQfr0z@hu-ashoraj-lv.qualcomm.com>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-10-2c62125d0085@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-10-2c62125d0085@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA5MCBTYWx0ZWRfX7E0AVqN4pFTd
 0hpNlNHb0hmDMjPONPqOmHhffCts38NR/dqsy5poP9TSfaLP9ZkiEfPmiM1v13iPfm9JQcEa8N7
 s+HlcOrKafsCUAP8W5lBylpR+kDurQE=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abaed19 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ZUgflM6HN2uMUVLQTkcA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA5MCBTYWx0ZWRfX2JHujUGcqNSp
 2WzMCxtsblPEWhkVCuOXSfEYnE8dob4g2Aji4thTNLlHzWXsRTqM0YcGNFFx8QON2SFIgf932MP
 ftJ6/P4rrS/76BhZueTP/bv5KzpCEBRHj0YbVdEJfDjiU84vE4obMZRpuxuLyEu2eNthxETG6aM
 m6LPSwdVIHxl+bMlNpGUoiy7PZCdHOTKXLa7lbSwa4sLrBUweAFrjlUpfYu8iaqPIwOib5uUaFg
 jYT9B2yHSsr88KzfY+jT7ccz3JF2WrBW7nFUXfM1MYWytNUugASZPrckm3DMzifx9spjMBVAYrc
 ypzWpLaXwEqIlLSwz6XFCgNLY++vJDGKsSdkS6OzkIWuIUWFQKmRd0WdmZKeuaykeYX+T4UZRYO
 9kzai0VcCmd7vO9n1vte+xiZv7GnZK20go6RAk22qoFCuRiR317yrAvEjwbizccPzWWmwn+KUB2
 zz+gEYPq4R3y3MdeXFw==
X-Proofpoint-GUID: HWR1Yxrf8_xB1xdSD-twaz85c0tbIKDu
X-Proofpoint-ORIG-GUID: HWR1Yxrf8_xB1xdSD-twaz85c0tbIKDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_154131_643153_2BD8C436 
X-CRM114-Status: GOOD (  22.32  )
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

On Fri, Sep 25, 2026 at 09:48:09AM +0200, Lorenzo Pieralisi wrote:
> With the advent of GICv5, IRQs mapping can fail if the interrupt
> controller the wired SMMU interrupts are routed to has not probed
> yet when the SMMU driver probes.
> 
> Handle -EPROBE_DEFER gracefully for IRQ mappings failures.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5732f3ba0122..1832389916a4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5562,18 +5562,26 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	/* Interrupt lines */
>  
>  	irq = platform_get_irq_byname_optional(pdev, "combined");
> +	if (irq == -EPROBE_DEFER)
> +		return dev_err_probe(dev, irq, "failed to get combined IRQ\n");
>  	if (irq > 0)
>  		smmu->combined_irq = irq;
>  	else {
>  		irq = platform_get_irq_byname_optional(pdev, "eventq");
> +		if (irq == -EPROBE_DEFER)
> +			return dev_err_probe(dev, irq, "failed to get eventq IRQ\n");
>  		if (irq > 0)
>  			smmu->evtq.q.irq = irq;
>  
>  		irq = platform_get_irq_byname_optional(pdev, "priq");
> +		if (irq == -EPROBE_DEFER)
> +			return dev_err_probe(dev, irq, "failed to get priq IRQ\n");
>  		if (irq > 0)
>  			smmu->priq.q.irq = irq;
>  
>  		irq = platform_get_irq_byname_optional(pdev, "gerror");
> +		if (irq == -EPROBE_DEFER)
> +			return dev_err_probe(dev, irq, "failed to get gerror IRQ\n");
>  		if (irq > 0)
>  			smmu->gerr_irq = irq;
>  	}

minor: 

Maybe consolidate the multiple if (irq == -EPROBE_DEFER) parts and
consolidate the return to one place?


-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc

