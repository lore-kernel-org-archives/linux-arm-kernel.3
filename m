Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9414ACF884B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=; b=rX9GpQ7N73B8wti/Nnnrq2D3up
	xL/6GNVCeKIdShV+APPIUdPTBTw6/XfiC1MQUrfBa00naniyqy0g92uE1SceanqOKszAff0NfQPWt
	e6xc1zcSGL036GO7RcgMbcSUzp+ijb5fbNYBp+dfCB4sT9JrtzH5OH95NcjnSBfPFNi/g+4OhTGBN
	hj00BQlwwH4ZiDU61R2DkTtRAk+6HipnDEKBcJ9rlHoONmdewD628Mw6Cq+mQMvjl7A0c9zXXjxmR
	atkgzichTcr0yU3ZKed9NQbbB1CPBu8lj7g+nZeuoaiue3Z7TMiFIEJm2L8fLUUFGFij/mqwGMEem
	Lmt9udbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3qz-00000006flV-1UWu;
	Thu, 20 Nov 2025 12:33:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3qw-00000006fl2-09gw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 12:33:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCI1aR3407794
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=; b=kj2q3rI2u7XF/Mwt
	3leJFZCxjh7CA0q/0B52pC2W3yeHY5sohSl5w3kKbwX5e673UhWuJGwYzIwHkdne
	2g/29H5cNWtbpRtPGiB2w8mwy6OUBbHw2Bt8MjFwLE65x7Mk8Uk9c2MdmymBk50t
	bF45le5cHEZY3Bf+IlskJTl+AsQKoZRFn4HpQvnZoo8OAerrIhqMbiIBkt6xrwaB
	iEtm5N3RKZwVr22o2I69N0DO6gdES6tUPH9v1ZhBFH3KIjogOPVqt6AvBX6Jy9W0
	pAfGDS8FQqzgoR96XEIlzFpNS0pvKYGheO8egcO1bZekm1o+U/i/5g4ilFRcRaKN
	k9DNlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm812qxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 12:33:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b196719e0fso26531985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763642012; x=1764246812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=;
        b=g1BuQ1pRGbh8rceTYEnApyvVmjuwUTady8pE9KI4+CFAtA+U3l0IjMcYkjGZuirKoE
         1/5by9vsnQw65HyyxbrhOt97L+LzplpyUq91nFFkp5WjBBLQycsxrQnYv1L71ip81fSq
         bqhq++XtzLvyx+rv02efhSezJD5wL+DQmlZuh79sUh0oiIFNbP62hZKcI5NyaljZK7bS
         92feYMCMtwE3qXcUyHVsgwv8bpuld1Vtr4XUFV9oOKZdSy+D3K5pGt2Ii1HyCUbi9sk9
         azOa839qSsCjBZG0WNrjLzqtv0UkdB3xOrdX4LUF4iBu9/qNOmJNUrMAS2luZFkHfDMp
         ZrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763642012; x=1764246812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hJNYrGiiTjlqMPWTxw+6seK+qE1J1erEAaW4L/7Ijk=;
        b=NPIYFROUBMTFr/q62SSECIT7pSABaVxiQn/H9WQL6U6fo3VxeR2pV7b3Y+HKzsIuXa
         RvdJUr+YikMnB0xd+7Mp/4IeB5fVRG7xUmRjYVPcJa6/S+tuVMhvP1LZ49zgSY+k2QtL
         3sufBmUKLQzNAAiansAbBJtNWJqqA3X0i/3RA8qsJpZmBhfgurWY6HJ5L2IC1XUdL4qH
         CRkRHIqLNEzgrsXphUvKvo8oqxzEBJZU9YKi4NBhxCzrcOGRYF0rJK003iQoYI79xvoM
         nYDRlwdu/gmOQIodCM3i8sszNpUVMgA1kGpwV1f1MZJ00ixO4wRfg5TAajXnNUfqdf3d
         CKSA==
X-Forwarded-Encrypted: i=1; AJvYcCXtoOgknPWHtLBN3wCvTRR5IBy/5JTNS+GMPGKjDlvRKP2ga1tlag3g8osUJfV+7AcI93GdDlGKNXAF1NzN5GKz@lists.infradead.org
X-Gm-Message-State: AOJu0YxLEAPIGwTuWOFcjIlL505ncDRHNIM97IQ//bGiEZwvzRDoavdr
	qU2f43dZQUDT+vUlOhV2YfeYVVN9yF7gpqBNSxJSJgpaKFvTy5my1v7azX2zrMg63wHkZ4CWfeA
	O8V7i9TZbCKfmXaOoZhQll0EQ8/A171UggiNxwpcyBurXU7//xvSJhomQlECv6f9zEPtw8/Uz/z
	kKzg==
X-Gm-Gg: ASbGncvVgDL6G30uKDBOLc0nduLhiMNoy+frc73RwDe52k5uw3mZehJUPodRXoxIxzW
	NuEAEt/gxr5G/j6wBGKQKGBA4durwTx85+Jaaffxx8/IB5DTbwIprkj+awZ9I9gFkxNOjRGXdAb
	VxlYEQviUCRYXWOg7f9JikouLFKOiOZK6e8qopKJ9b7DR2Tla7IIBGZIYwjx2Z+riFToxg8i7OJ
	hkCIvXJOepNkaL5u8oGqOKTqHmUIWQ0TKsCTT6mMAGS04I/8NKkqdB/4D7VxaZQ2TVw87c0vYPn
	IYOIzl9RwqruhCF/nHIzzB75ozElemaTI7JxT1mCCiEKSTPSBUu/H+GiiyvbLfE6x++jYCIuAwT
	HtYhKDnYL0glfLORurARK9heMALWMuz++6cIc/tkm0a2qKxmeZshvC43BXb7pjO3O+24=
X-Received: by 2002:a05:620a:179f:b0:8b2:9aba:e884 with SMTP id af79cd13be357-8b32f384876mr126004485a.6.1763642012168;
        Thu, 20 Nov 2025 04:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH8PKV1YzPz57vibeVrtCc9zDlA5YXlsyN2nZn8xrRbGWLU4MA677i03AksflHjajS1E7evw==
X-Received: by 2002:a05:620a:179f:b0:8b2:9aba:e884 with SMTP id af79cd13be357-8b32f384876mr125998985a.6.1763642011516;
        Thu, 20 Nov 2025 04:33:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765503a990sm194688166b.63.2025.11.20.04.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:33:31 -0800 (PST)
Message-ID: <09b933ab-eba4-47c2-a667-370dbeda2749@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on sa8775p
 platform
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
 <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
 <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RpuOpqs8TMuPeOIcAWirUG-LJyeOpkb8
X-Proofpoint-GUID: RpuOpqs8TMuPeOIcAWirUG-LJyeOpkb8
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691f0a9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Cn4BvpCIsXtoq-7YWPcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3OSBTYWx0ZWRfX7FHVyDOtm7UD
 MK6ZJJBqWe7GLFUdDI0b9UBnytm8Q/oniI/cmckStYzU5Zmm2rWB3K+ehSyXLG0ZlCU+m+z+pdR
 iwdr6e4v0JsNBgHLrvj+jpRBcSAC50wdZh3hKMUM4OGUSW8EujQdTCYg1FOTy7GqHxkzYDI0SLm
 hDcFBiDfZT1M49MaG5w8uZ3xcQgr/EENAUke+XizN5LARiJi2KgwBxln0DpCZx8vTxwz6rw6fPy
 +RwahQi/ezBmbbMqar69w5qnvly3ckXs1BNH3+tihdjEJ9qTroIe1zBXjkCV9sKVv6906RaUugF
 oTujqiWxRH928NuSc/VIGyLTlha20OzzKbTxAIFtllZCZqIXTTgt8SF0uTYoMwi0QCyJV9CokXZ
 vRmIf8/DMvtb7C0d6KcFX6c9AAp05A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_043334_089986_2EAB34CA 
X-CRM114-Status: GOOD (  22.43  )
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

On 11/19/25 7:06 PM, Charan Teja Kalla wrote:
> 
> 
> On 11/18/2025 11:33 PM, Dmitry Baryshkov wrote:
>>> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
>>> This is achieved by adding compatibility string for mdss in the actlr
>>> client of match table.
>>>
>>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>> ---
>>>
>>> Changed from V1:
>>>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
>>>   2) ACTLR table is updated per alphanumeric order -- konrad 
>>>   https://lore.kernel.org/all/20251105075307.1658329-1-
>>> charan.kalla@oss.qualcomm.com/
>>>
>>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index 62874b18f645..0b400e22cb00 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>>  	{ .compatible = "qcom,fastrpc",
>>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>> +	{ .compatible = "qcom,sa8775p-mdss",
>>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> What's the difference from SC7280? Why don't we need to set CPRE?
> 
> Sorry, I'm really not sure If your question imply to talk about the IP
> level difference compared to SC7280 for mdss?

"SC7280 has MDSS, SA8775P also has (a slightly different) MDSS, is there
a reason these two have different settings"

> Regarding why don't we need CPRE -- these are QoS settings that does
> control how well hw behaves i.e., related to performance settings not
> the functional ones.  I guess, these settings are derived from factors
> like how many masters are sharing a TBU, how crucial are masters using
> that TBU(like important ones may be allowed to +7 or +15 and may be
> others upto only +1 prefetch).

And this is a good answer

Perhaps you could reword it a little and put in the commit message to
make it clear in case anyone has the same question in a year or so

Konrad

