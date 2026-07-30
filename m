Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D3C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx2xLoU9ox3YzTyuhkOQkmhNLpIKdS9tw9DJDHAPc0U=; b=MxZVom4vQVLwrgTt+/zTLWj0UT
	+YxaMvujAgTneTXgY1iUrTt9sDxW5PPtN9rDfAuvJV+7PKt5E4cIFHr3lAm4Ry8WtUQrGwI/Q4KxG
	MqaFSfhESN6kck8rFWMcYuReSKU7SdMN5A+nEwZkFoGk0Ewm86dppWuIeM/7MGOYR+R8vQhrs6H37
	SFGYAcCF0Q6OM18LglTzL7NIu4BYFLdbCxlaSBNWpNYQOZI/h2Ojz4v5ykSlTgXDos4cTVAXWP41Z
	N+nZ42TSJLWf/1ma3ySXnCzfz8Fw8IpmPbvAO/AnkKMKbbQ17fVa7LgNnCw8ict1nUt1Tqg3cqvec
	6YOmOb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRJ0-0000000AgaF-3WTe;
	Thu, 30 Jul 2026 14:00:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRIx-0000000AgYL-3FhV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:00:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDc2cN973118
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bx2xLoU9ox3YzTyuhkOQkmhNLpIKdS9tw9DJDHAPc0U=; b=UIz+yc2X1jEWPTdy
	WwXtE1QE92TeVS/mdHfvjN1HOxbYI5AssW4CqRojNV+GVWWcAnYIrTEMecbvK6Jb
	fFgdCdLu2kyJ8aZU6AhZEUrfqR8Vvqmw681XXVd+zR9YEu94Z6wQAK0YHJMYjgv/
	N6HPqlAfX4h+YoiRD/J2AyvnohJFzMYurtcWM8zIxCiU3pKWE13PGOgVFc2G9Tsi
	BqWBp5xJrtCIOXCg7DmAbGDCvp/CKVFAoNscQJ/NMblywndCwTwCu4FS0JYp9seL
	Za9QOZ0URQML8NPSoTxKKXLyV9uP1UnnUkfHrekEnNGCXGZOPjbnMg5E9i89VKdW
	TCqwiw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7nv02nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:59:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so3476061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785419994; x=1786024794; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx2xLoU9ox3YzTyuhkOQkmhNLpIKdS9tw9DJDHAPc0U=;
        b=dxonxDTV0oPWA96ufFVNMWrpde1IFKqVz7WAwuD2Ra7Fwe3z+DQWJ8lPOIP5zrONDc
         5azvseVJePqnjbqCZvZS8Jufs8ZfC697nRAm1CCo3GOZXWGnZbfDDHxS/PNDtQU+5T1g
         lJnzUtz5mfPhKdtrdRTLnV/i/Ku5+uAjgWC3scfHOnU+kPoyjnc7PH19NlaJtVzr+cWv
         rYskVCVQXR02DSwFITRR5C9EdrFfWcSqq1YqzJ70T8Vgjt7pL9/TIXaqCM5cTo++8g1B
         +6sbk2ekad0zTux2pCHxTO9pbnNgiaRzHZCyxUFOrRVfW9b7OthiaANsAXlAydpLkkSM
         XsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419994; x=1786024794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bx2xLoU9ox3YzTyuhkOQkmhNLpIKdS9tw9DJDHAPc0U=;
        b=Cbx29fB7JyMxUypWq1D/8t0Hxt5GsNd/v1cx2qqUFd2KzchmAVJLT9tQ5tNIKNwNzf
         bV3aEsdrBDT+2N3NvrumJSqq+EtQteTvpcc8ijxFwg+VezL7G9BpQEfi1+kr0PNgDISg
         U0iQxR/rejD3/ZFqqGHoarAiRVIf/Icnr322n9X8+whTH9IRDm1Pfdq9qDYFIthk2rgH
         UFhzP+6zNbA2Wat1o1HAi4WHuyk6Lj6SaVCuD+ebFfXSdyA0EKK3fyj/BBYwlBulmWvj
         Dqre4DoaTNyEz47oSPiNJB9xbeiX7I9hzFiGRDqoyuszQxTQaewKwMVvkEhmmiXC9UWp
         Fz5w==
X-Forwarded-Encrypted: i=1; AHgh+RpPfeb6X9fCLnuTadkTo2d89Nqk1alQALWR/SjRmctA9+ZPfK/R8HCWDh2QYr6FWEDdE3jFPHyeaathIqzs+awh@lists.infradead.org
X-Gm-Message-State: AOJu0YwXj7cITrd5AHm5i1+0EAUnfVGSpsvRBmf3yhSJHfwsdXTBPKdW
	zOr6A72mNQr8ZfojH0yA/SqCFBVz7+aIzlDf0RLgjGQiEC34vUQ9DsmWSzuzRVHhQ9YPemAWsAY
	vJPfpM1c0gmFqOVL8LsFsnoN5vRqdDKuPuYZH33PRbJ0t9z+pHLEm3NcvM6UMAT/Uje+ZDxn4eq
	cXdA==
X-Gm-Gg: AR+sD13Slffib+WpjxZGvD522A4wr/MQdt5AVRMB3wet8mQ5txnjeeVHNJZyne/EALu
	G8MXJvSNEn0uA8rMNapJhOme07+06O92gYIWh6pq4LggxT2qpu+dNo0UR7uuacZoRqZLP2sPI3s
	ce+mIg6W/CQXPxmcKJnCEm5egy1J+9xt3YVY73vgKPkyrJZHOOqHhJchIrKjkBVPdEyRfcM7Q5Y
	iINBa2rlzUAhZ+dPMrWIj66qSIP6yIm/csaf5rvBhcnQQqdDwfaHbijGcUo/PwuFfOOONo0C1Od
	vq86hAltqZlabx0kWiBMw3tzOosFNE1bi1tNtnomZXeRkqSmBZEK6bBIBrjdcO0KfrHsIChcLoa
	Uw0YIV8oTZaRMob/ff+e/M/e8
X-Received: by 2002:a05:622a:a990:10b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52b42b4deb6mr3958141cf.2.1785419994018;
        Thu, 30 Jul 2026 06:59:54 -0700 (PDT)
X-Received: by 2002:a05:622a:a990:10b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52b42b4deb6mr3957631cf.2.1785419993517;
        Thu, 30 Jul 2026 06:59:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8576a3dsm71944066b.14.2026.07.30.06.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:59:52 -0700 (PDT)
Message-ID: <9d43109a-6c4a-4339-bf8f-de3aae6e25a6@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
 <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
 <h3rfonvwkxkmschyypytwgwxbmnq4rou4iyk6iq577c5tcfdl2@zrz3xhfzpmlr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <h3rfonvwkxkmschyypytwgwxbmnq4rou4iyk6iq577c5tcfdl2@zrz3xhfzpmlr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX/rIcF4GII9Y+
 8cve2EQJAib6Gvh27zQlWiofjMLqIa7ZmA86D3D78iBCh2ULM2L4FjN7sPw+K2KK3c/KzrpCZTn
 Hp/owFGYstTEMRMKVymYZzGNpHdP6TEQuqQQqRGQ6uHYzeB0c5e0bSOJot6MVjdkLkKVkwK1IdI
 2IutvbcqFOYIqpArJpZVKVgiuRvHuba4oH0qZ2NPjSpgX9fe5V/R9wCgZZBcqrNNqH0Ro9F2P4Z
 1cqTFxxg4L9FxDOXa5e8wJhKcdAUaySbogcWPzimLVl2P9KwjWDIXQ7vecuLSl4CGv1a5eSyzA1
 GJ5NL8EjTZSnzFcxc03sO+kr+w9OhLX0Q6klH36kvXr+hcxbW+cxA6sA3S1n9l4sMfyMl4cshSV
 JEiO8d6CKUC4bxMabpb9ybiEqiFCyVb7I/1UsuDzYM/KT802hIHI0jeD4HItOd7ShpScLm/Sz3+
 EDA5AL8LqLNjAYC1qEQ==
X-Proofpoint-ORIG-GUID: Ttk56GnKY-nBu2EqE3V-leOWiozLnt0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX1mZCHxItJnUK
 6SYPwhQrOuh/43+98crToLzLfNvTW4u6tbRKokLUyP29PIWAyUYYAwqiE3VvN2ZlMirPKpK+rFi
 Fimai+p9DOB5CxC22VzN2FYIInCnjwM=
X-Authority-Analysis: v=2.4 cv=Fpc1OWrq c=1 sm=1 tr=0 ts=6a6b58de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FAOltU6waKXSbT9yybQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ttk56GnKY-nBu2EqE3V-leOWiozLnt0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070011_927505_309A7404 
X-CRM114-Status: GOOD (  13.20  )
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

On 7/30/26 3:58 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 03:42:58PM +0200, Konrad Dybcio wrote:
>> On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
>>> On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
>>> dma_iommu_mapping for every IOMMU-backed device and attaches its domain
>>> to the device's IOMMU group. That domain is neither the group's default
>>> nor its blocking domain, so when msm_iommu_new() later attaches the
>>> domain the driver manages itself, __iommu_attach_group() refuses it:
>>
>> [...]
>>
>>> +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
>>> +#include <asm/dma-iommu.h>
>>> +#else
>>> +#define arm_iommu_detach_device(...)	({ })
>>> +#define arm_iommu_release_mapping(...)	({ })
>>> +#define to_dma_iommu_mapping(dev)	NULL
>>> +#endif
>>
>> I see this is prior art, but should we support this config being off?
> 
> Yes. For example, on arm64.

Right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

