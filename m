Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88516CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=; b=pSQb485c8oSO7/PSv5Z4Ydrlav
	Fht8MjeU5bohf9k/FGSajVuulT9YkaRup5tmjce9UxnZSxM2dzoEOHNYKc8nAnn9zIx4yFLNjsSDy
	W8R5tLfL6sLeUXzGdo+6GrgIKl8NWyZsPzNrZHoqwEIrNCVzRNjFQPrlsZHNtcLdrIpci4lMsxLpd
	qxueb/3Hq7oZKWt2DJJqhM0s2iOQajfZyxMcAKedV453VBizi2Z8/NXey797Xr0kACMFNevhuvUHQ
	S3prPJWcqKUCWzD79ZsxqJfyhFKYkRHzqCSQ41/3OgYEgoujAkEELzuXR5X2kku2EdBEb1ZRSpifK
	Q+1jp8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxcc-000000061c4-36v2;
	Tue, 23 Jun 2026 09:40:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxca-000000061bh-1jFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:40:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UwD53243887
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=; b=ZzAbhvDDccuFi/+2
	G8ra3h5Rp6kuV0uTKNZdVvEhr7poxkoAywa5zOs5yCLHeemKvwUsvb6YVzg36JMY
	6JzLgXh5OMAMXYdoLY0e7dvxRTATzvc63NyPGXjCu6F5lbD8AtcLgVfX4Ix9sGb1
	6L45/suxTGAw36tNBR9CV1Ihx//I+t8btlOumIV4xIMICdKEV2WO7TvYlVD2ega2
	nc1zUOnveSTfhHKfDao/gpn4K2AHi4PRvGNPg279f0FfD+cucHBUAy0E45xbxsa7
	/Q8f3T9s1tnLgoZ5VVAR1di/Ey2qT3AcYWrLedl9FUB4s6cqCWDDvP75XzIN9TBz
	sHNAnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyg9ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:40:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso88601685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207643; x=1782812443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=;
        b=abrx0T1kTh/foW/yLuMYUv1RlcwoSTWjn2BKOj5G5aygj+qhBhF32HrvBbC2MIOBf8
         HCFxS/vuj/GoxFfTZG7B2CwJI1KxzaCYXrT7KvFyDeVA063N45fq5GQay/7D4gZIxMNL
         mFizDmUMfZ1KoP2HuFkJj1aDSgSqRqlZmObBgUHN04cr1wbFL2XtWM8Vhcb4xQ/VVKV3
         K+14gcUcs+YaKSxsGZTXLEkp4Zi5zmr4OQAUVp7PCtb32xzrU1cc49RYvIlMfqxIjZAW
         QkUeLRf6tQx3hK0KTmgWZhy0sXCF30CGFmlzrffQgvjamoP+CxYp0H+THDPRBTeww8Ik
         b8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207643; x=1782812443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZWLMzUqG2/p/tMb+yic3sKJ+jKh1OhHeh2HvgJ8Olo=;
        b=kToFri+TGZ8kYe16Slf/sl8PQArXKIZJgJ9Kx6iSvQDHiTI6mHyx4jXptDKtmAXwnL
         wxNkgtN4t4miYp/qVr2foJYrhSNWQMm4mje/VdqJAPL6+wMHRUcsJ6dMKuJUp2CiAncP
         +fZasf/NVUQxOYdHpYgwY7xHlqlJaVrGBTqgSpHxx/YM/STKV7Fs6ikb9OjZzmncykpZ
         fgcc/rpa8K1KdfvjFUuBe29TweMIMLRW7/NO+Qm9iyglpsKiABpygc4Z+zIvbp7jMLw1
         FJe0PP6ou99SPuLCOhBItEv8lllCP+2wnw/QSnMsOnHwHpc5EDElEvglUbnUC7+/Jd/r
         qrsA==
X-Forwarded-Encrypted: i=1; AFNElJ8UTIZ7m0ZjqmNzH3PslYr1AZLJ25V2peJoulItdyY/KgQQjj9CclexsdQAaO6adThOcfaQedpjfQkM5ol9ka8a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4mmuuNq8QUMkVqnnvq94/qrNCQ5vpDyi3yD6wHuIhFiyFe7K
	T5Lp+x+5xz8x3WZ7NSBh0qn6dcBN5hcBZ/4pr637X4Y46T9LohCHrGtITQBeXS2swNlvc9l2Bjd
	mmW9O4A+HrH7CwPVQjjwAFRBa+yX8Z8Tcw5Sly0JM5eGNieggVbh4SPywf+NcqmItjXW1M+3USW
	e7F+riob9gQA==
X-Gm-Gg: AfdE7cmZZ6VDR5C9Sv/gV2SvFQP1DHiw9760GHSo0OyhQ/0ltQE3hY9OJ3doLtLc/o/
	z5YyObZOhRCzGRGzt8TYd2G6ObJKJP2N2Th/QszfAhDoKC9ps7GwI6h5go+Yfyu7OkNtI8rSfTd
	EF/Akxsj+l18qcCMpmIS2RA1/NNnfm/4pHZCg7qsRt8LufQbJwIGwsBfVkG7L+pajThqhCszHMx
	88MPutKboU0UgHXzicsT+GcmW4K8Mpgk/eMNiPcGE4HluVHhbr4d1i8/RoP7TUDBF4TUf3E+oTD
	n0KadWyaJe9HnTKhBUr4ZQglOfU/VaQrQLlw2z4XKSOYrDku9x3oxoLx+8ahjB/1ZJLmrGRCyJb
	7bb/K7/Tsmcn/yrJroE/01h5hAG/C8PV+PvY=
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr411570485a.8.1782207642832;
        Tue, 23 Jun 2026 02:40:42 -0700 (PDT)
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr411567385a.8.1782207642232;
        Tue, 23 Jun 2026 02:40:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm492261366b.53.2026.06.23.02.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:40:41 -0700 (PDT)
Message-ID: <4b60bb58-bc08-4bbf-be6f-d447050af479@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Remove sysfs device on probe failure path
To: Haoxiang Li <haoxiang_li2024@163.com>, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        jroedel@suse.de
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260623071245.1985938-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071245.1985938-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfXwclfnQZx4EdT
 hcFzfr3uE6bwYKRylfPb4YzHDAQ1GS7St3toHTJOKuN0WJ6EYGnDgdR8FI6OCRMc8shYFEpKFgK
 neKVo9YfXYe55jv1mWGddzKy1DaiSsYpdSajzAOP2kBvr0JyIbyo9cyf6xUnbZrJKB9il+cYnsV
 gpKgDMyvcu2eg3+4OZpl4i2Ixu5nDbPOWFbNleiFTrmDC2+MKrX4CzRaaVJTtYPvP6XM5VsRnrF
 /w0oR9yHUClIJyZoCjVxidT65M89Y6pyYWt4RbtMRSYH9I7pdRD0KPf+92RJcGz8coDqDiSjsiX
 vhw+96G98+Oindt5bGtY3CyetKxtlrnd3pfJBvpnNyVKuBDGinzyawCVR/AtrsI8dK60FfxyafF
 fYYQ+Xoyg1BXKX07GuJ5FN8uXkR6Wz35MjoyFkq/LnX/R9p6zPrY9k/XYRLp4aJoOAQ5DnCdyfv
 GfK9KLGhOTxhl69hslw==
X-Proofpoint-GUID: uOhEKDhycmELN5Ft6sAKzBLEqdufElDL
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a549b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=cLxE6WtmSDgmiAOwmGUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX1fji3qIHXZ0g
 ZTuHOOEAQ9TZKm+u+1HPlllwmGpShmkXh9dhAU5LegL6KMp+4CcgkmJ3C7ovCEtpj9mTNWFbxWX
 3Gio7sTSRUTe1dO+nDMidJwhmYsNfMc=
X-Proofpoint-ORIG-GUID: uOhEKDhycmELN5Ft6sAKzBLEqdufElDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_024044_468829_2E14CBD9 
X-CRM114-Status: GOOD (  10.89  )
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

On 6/23/26 9:12 AM, Haoxiang Li wrote:
> In qcom_iommu_device_probe(), if iommu_device_register()
> fails, the sysfs device created by iommu_device_sysfs_add()
> is not released. Add a goto label to do the cleanup.
> 
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


