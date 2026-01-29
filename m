Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059C0D3F083
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=; b=tRk3uwsfpz4vIAx9L18tmr+vRz
	MLxWcXUUy+jQT+72dmO4nioY87gJWy6Q6HAqfwBDAgKj/CAhoKcrVajYy9ymtalOPbTmMgE2caJ9X
	q893W9nRcNS6EjmQ9PP2wDbEa3lhJh0ILgswxvwz4lzHs/FtX+Rk4NMgRLXSI0KmO/EnKpvoVm9CH
	Gh39Bn+jt90c/ZK9gkzR4NtE6P/sx0SwKguN8nptgo31s9Vc6JOvMBEXjocdIoSdUs97Bv5zUwhWn
	XypaByizsfHZLaVODT8CFxTi3tHx5lXEkSowtHXAzZN6o9zVkuA1E9UkMMLhiZULmu5CbLGmpydpo
	LyMv7O7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKZB-0000000HH0K-0dWy;
	Thu, 29 Jan 2026 05:27:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKZ8-0000000HGzr-0LYx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:27:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2onKS3143891
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=; b=HAmmDBgI8ArT+IuO
	BcB/YaPxwK6kJpmQbg+LvkQc2j8Z7Z+1ajsOGke1kIaQyyZieD3pSumS7WumuilH
	Wd3J+3abuBi/e1DI1NVJCJWtU7WyrVZ4hftIbOcGBQpQfpxf6PjFK1rOcAcZbCUB
	gk/NzhZSJKnqpDzAr6EilEIop70cp+l/2suPLl7NNXI9UvWfUizBUFplnWWV6BOm
	azsqqbes+wjXbqFjt5uwLz8GpYPqpSU7rMdzitWICaDL51KT44nkEirt9/UcEKk6
	K42yMAm6QALZvY5XGMTR/XHPjrRThGVCRc4SKfkgIdugG00HxGEI2UaB2Im73ol7
	LQ2gtA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxhmt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:27:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f69eec6so7389275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769664456; x=1770269256; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=;
        b=DSqsvgQYFwy+oteVJm3nGWw03+Xp8vRN/r1VarwnKcSHGknmwrH/a6N4vkltrBAqxL
         9BH9yiEp/jcfZMrduJZUrKPLjnIx1v6O1DKIPJbK0GkJuUxrz+QYajY4/BF9kwLV1P/o
         LvZX2AQ2GnUmQiZfBFRZ1SoQLzYGDWla727h47rXFLXjQzPAAA8nTTT8R6bkeZzxtj7O
         QyOQQh+Bi/+PJ4hQljQEUvDQeCgfpAen3ckIJQx4ryDOCwkdRzRcNeyN6+8imsjec7Ft
         LAVXBiOZ+fdPAQ+UlUUzGYCCm53m6GkgTeVMAOsZK58hiDAOgMnnAqrc4kr+h2o6YtVQ
         ZDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769664456; x=1770269256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mp07nSl2tmcDysrgCxQSISS0sVufQL1Lv7YkLibhp8w=;
        b=XfyUIRTGTQSs3jzJkxMvgNQNM9VvUsBQtgQqkPJ06IE6U3Cmz1D0uoV4cNczJKy4nP
         ycO26r/VszskjY9knzFIiS/OZx3cC4edouuaVVT5KwFyEZ5y1+DKceHcu69P66WIkPK+
         MwRdjMoGxNySgYO3vahYqtx9SuCTisHTdSOZq2JMGT15ImFZO2kW3XzS+asXd5TKCADv
         bjN+0529QMo05/+mWp26wnnX03JNN9StK1bArDvyXsmOPm0cIcomCRNGpVAUAu9l8zjI
         4E1p3YjRyR/Q3NpejMxM7YViS9EOc1FrU16MDlTHdTJcSniCB/wT9h2vi8xPKtB3I0tm
         GJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCUD0WQhIwY4pgk5JdhEONEBLkiVmkgPmP7qa53cnM5BLoee2auSiaLMU7SEF+vxPw3rSBRZIvT1V27AvgCbj4/5@lists.infradead.org
X-Gm-Message-State: AOJu0YytwJn7il3Yh+RJXRJqzi7Xmw2z7pVrcvVHjPOfjxcDvL4SnenU
	NOPlV7Let5uTkQbNCAzPXBrlL10Q6SV9O/qjEaiK7vx0k3eOFY9BvzbJSHto1Dx2O2g6/FU1XbL
	0CZAWWkjI8aYiERRMrgXdDdmUb1WXmyrW5yNShmAY5QzbKz4EBGxgBaiz2doTjIRr56SolXuALV
	nlIg==
X-Gm-Gg: AZuq6aIHpXHsrRzyFb7IVxJd52034HbOXGVFjNaFsarNoUNZChqtyS1mmxXV4WuWKIw
	E7gOUHWfe4bNU4Xaxm9mfxsNm3KUCrbffOot7P2Iowlr5GSvS/z8GfuxYHGHnLmksst9fxnFFQX
	jA0bY75UhSYnztvA3dZcIZNw2jUXBrf0MlxXaPh2ke7JBEzz5j1FMz+ZOnj92rMAner+jUr5ZwK
	SoePskWR18v/LtVe4qoCsiW/ll6QlGBTgw7hSglygrHG92lY8mpKikOCeYU9lVs/OH5NJo4eDH3
	rPr8Z9gXNN25th8KsfrbHO9ZdgKMOgJTdzIkXTHvJsoCSZ2EX2jS5ATKUHM+0eUKokmM2ynrfAJ
	YxzZx16+RE+ef3ZrwA/4bBl3O4tBfclL/x6HfACGNqA==
X-Received: by 2002:a17:902:ea09:b0:2a7:683c:afd3 with SMTP id d9443c01a7336-2a870d4cd85mr71591825ad.16.1769664456036;
        Wed, 28 Jan 2026 21:27:36 -0800 (PST)
X-Received: by 2002:a17:902:ea09:b0:2a7:683c:afd3 with SMTP id d9443c01a7336-2a870d4cd85mr71591645ad.16.1769664455580;
        Wed, 28 Jan 2026 21:27:35 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f6c7csm39838935ad.98.2026.01.28.21.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:27:35 -0800 (PST)
Message-ID: <45e1c870-f155-4943-990d-5e75a1e8b998@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:57:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] PCI: qcom: Add D3cold support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-3-dd8f3f0ce824@oss.qualcomm.com>
 <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <63531057-ea7c-4a87-9848-04e502bffc32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mQhjIIVJRhwRvVYkph1ifmJJ0dwsr-Eo
X-Proofpoint-ORIG-GUID: mQhjIIVJRhwRvVYkph1ifmJJ0dwsr-Eo
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697aefc9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TnsRN4puekgCtVQ3KW0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMiBTYWx0ZWRfX7ROnnaJwCN2q
 OVv9OY31cIZErpjAqGEOMMVAnYIDIwbmVrGvWgO571Xhx5TnfMph/GkraALDLx2guqR7YXGi0ad
 sZraKFguDGgOjA33liht2OozeVwu8LotVNAeYan+q20yAqIODv8aG9KwR6ZR+bniAy88WfzD9by
 0+rN6tKGz/IvrzUhliuXxqGD7drv0LQWjbXuYvZKacGq2OZTzebJL0I+wbVlp1Qq28KnCqgoJzT
 b8wRLoxCwOLrbYjyJjgPon4ZRwT4PR5B4I768GBn0D5SltjDGNkFqJEjAT+TwjtD52UnbeFF+VE
 WdFC+dAODFpuRXCbGkVH4rmhlDAi1+ojpmE2NMhOb5ke0SrR/DF0Ffz9j5j2oyPPn+GhBQrcUuE
 a03bIDYONXFC4069h9oIMK0KR8KaVjqQONIZVFvD9RyPoK/UcWZl5mKnGC46Ka/XlSTyEkBvWi6
 nWGlSlUIC1Rj3h9f3lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_212738_269305_6944DDA3 
X-CRM114-Status: GOOD (  18.40  )
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



On 1/28/2026 5:58 PM, Konrad Dybcio wrote:
> On 1/28/26 12:40 PM, Krishna Chaitanya Chundru wrote:
>> Add pme_turn_off() support and use DWC common suspend resume methods
>> for device D3cold entry & exit. If the device is not kept in D3cold
>> use existing methods like keeping icc votes, opp votes etc.. intact.
>>
>> In qcom_pcie_deinit_2_7_0(), explicitly disable PCIe clocks and resets
>> in the controller.
>>
>> Remove suspended flag from qcom_pcie structure as it is no longer needed.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> [...]
>
>> +		/*
>> +		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
>> +		 * Because on some platforms, DBI access can happen very late during the
>> +		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
>> +		 * error.
>> +		 */
> I think someone internally once tracked down what that access was
As per last debug which I have done few years back we see access coming 
IRQ driver to mask the interrupts
as part of disabling non boot CPU's.
> Can we fix that instead?
The only proper fix is to keep device in D3cold which this patch is 
doing. if some client drivers like NVMe
doesn't want to go D3cold we need to honor it, but Mani is working on it 
to allow NVMe drivers to go to D3cold.

- Krishna Chaitanya.
>
> Konrad


