Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D3BCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=; b=Q0TOwVBi3jYlX5dtEhRjRYuRc0
	paXubuarHtb1SYwPYWnP1zpy6hx1PZ1zdvqorFRGt6H6TjUJ709XstOzo0XfyiaXSy61SrjaAPrBZ
	c3+IYVjnqL8wB82sgD7mfdkgPr4gIuyPoDR1anf7n7mMcMEHGOZBMWCdzjUnJvnWiS1CcPylAp6Zm
	EW6Dz4+dOVZk7EiJSbzri9SRx37+LDz5uW9baF4unQrZu2hIWB80D1Sz6EBUVeoU5fQYF2YK4oX0u
	n6mT0QUBZSfVisFhhB3ArlwdutkegCGGIeoxdXGkavFFHC2oHYcgKOxPj01UGqbefVfMDI176oCwt
	JFNMbWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Y8-000000060eA-1pOO;
	Fri, 09 Oct 2026 10:10:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7Y4-000000060cr-18AV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:09:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KG2k1625878
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=; b=lSubTwXBIZExw0y3
	mCKZ5O4RcU+/WWJNznioXRJFmxmv2GrYHrkRjOa3R3q6tSX7A7IwWV72YHThbB1X
	BuThoo8If2omR1gAoC1f2v7eykSQhm0ccmnHC6i6CM47K9us4bBUeBOAjmN3eM4n
	GIGSlqKAfQ/9VN7U0HZSYpCQnLW5jXDly/MjbPKshHYSFObcG1UJ9C6dWVHcsF28
	80m3hnNpGuNXfSqOZ/B/RTxtQ49QS/WHvEGq3kXN072GEDoeM32Y1QN9NKKszayG
	IQB869AkZhR9JErwJOvj4U7kTI5QFl7X6qj6II8IRs6KHfN8EGJSNUQR7sqSSvj/
	wZfbLg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj30yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:09:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso7957210c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540594; x=1792145394; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=;
        b=FhRXGzk5rlVR8jjC9ZYA3GQhC7zn48uSC3B51ZV1yFqqANglTXVv5zDc3oHIycIrES
         IaToTZjZAID5EtXFLveYVGIHsxL1vNqvacWQRgJ2dxiCaHPDXgbt9IM0A7inXj0JPwGO
         XHqks+hDVI6/n6/liu0rxfJhKio8RPhvLRp/8h8UZ7LUn14pm5n9ON/N2WdrAv72+iKm
         7wUwK0M5d4noGjQUFJdovqfIoyGHTaWJSyqfnd5XlGzaeJmSlwWXG7PpYUI2auJnNTRp
         LvrCuGDFRFEkxGj0OztFgDjJcazvOx0fublUHsojiimzhsk+ixE+V8KdJ/kbno9Q5OJt
         gFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540594; x=1792145394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+fBuMRCFeooJsUQbzMEzmXJA0656ALYkaVEwLsyNAc=;
        b=HsaP129nSp9pr3K301WWfN1IIKtHiYdAHY+T6odK2TH8xQJK3BUoyT8XmO3ZZ22dPi
         HnfG+XZ69FD9xu1thIHjb5ANrZvS9zvmhOEjCJJ+ponju0HvyIoxuTdvnFpKtK0iI484
         iBlqF1Pjqq5NNTzw44kYW/WVIYl1Z8vYTR2hzpMnYxLQEwb0nnzG/8w0/zN74Q2C2tpR
         ACtlX/qz5jdD1n40ahuoSmjTpZqn3IGs6CJhvk9+dhV2DhictmRHQR1ybKmcs6r2HWZ1
         xk6z3e4e9Pz09C59NEXAjXCuMrQ7o77uZNm9Opr0P4BsNjhMWB1FL7wYwKP0sLTi/8Yi
         RC/A==
X-Forwarded-Encrypted: i=1; AKwUvBw7gu7Ny5j8m66Ixl69og51MBpDimW9X4dxGrE6F0MIyI60HLbqsZul9wLewNvBSCbpkKkg8sdjBEvRidB+FSlA@lists.infradead.org
X-Gm-Message-State: AFuF++nNxhE8+P4w9HwO9zFcY4TeFFasGrhqLztP6Bllb6ubkiIV010V
	S+AfR/yMH/GsjW0VVrXHDXO9If1fJpfy36YQjGS6STa4a/xot6e+Ay1ngjr+qCdjqfWsCpMd1Tm
	vo1jtOFOTnNYUdaFxCT9mu85idTujd2MI4lkiSayr7pu9n/sv633RxKb9T4ppoEBKxCXfwq6KFp
	pM+A==
X-Gm-Gg: AYBFou3naQFLZm2qlaMwpmTFZdqmhMbNZjRQ7LHNpd4MlV4dCnObRm9jlcp1Zc2D+Mk
	H+hqqn4f97/jqgYqpdG588L9M94lVU0DIWvaOHxoWcC4Z8h9P1pbmCwsxjAOEo80V0REPj4FXsN
	tBW+aXvkwsxR/IloYST7dD5/BybL+mEFdG2UsWJWDv1L71dhDwiXydxMj5oZ+x/SI/9014a/s/I
	EDzdnE3IJf8p542EnjRjF5lp+gUCRTugUEGffTmTx3Ked4vAI9hBQYeRIl12gXtDLlrzNVqvIgy
	uxgwxHZMCmskAd2rFdt4sTdgHkQs2PtlNs+IYmB+wFy9kjHUAw0S9ytUiyxnzS2hKDOTs1Gm6WA
	qucNA7CyWm5JROXVIi0juD+l79uHp8F0K
X-Received: by 2002:a05:7022:3b87:b0:148:80d4:84b0 with SMTP id a92af1059eb24-16a60de2f7fmr2202201c88.23.1791540593824;
        Fri, 09 Oct 2026 03:09:53 -0700 (PDT)
X-Received: by 2002:a05:7022:3b87:b0:148:80d4:84b0 with SMTP id a92af1059eb24-16a60de2f7fmr2202142c88.23.1791540593160;
        Fri, 09 Oct 2026 03:09:53 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1cc25sm7332804eec.8.2026.10.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:09:52 -0700 (PDT)
Message-ID: <7ab6eab6-ec6e-47dc-b387-eb380e2e365c@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:39:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
 <20260924225340.GC16465@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260924225340.GC16465@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8bd72 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=9jRdOu3wAAAA:8 a=EUspDBNiAAAA:8
 a=YC-9j5RmPirwrlDSig8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: rFt7Q4xCUm9RMW0j93A37ryv1OTWnfMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX/+LNWYkMbTcY
 quzoh29/EGpt8oOqPmz0aR7XP4iX1QhCf8h1f9xrX2KfERCiwe0L/tNhcsuy1AyPWqwal1bpimi
 k3RI9IOh4A4AQin8l3cT0EkFBPP+0YxHMGiSG0Kq1HdCYuxP15QRyV1pz2M2K7Z6tOgTocISLu9
 CE7aeYgicgDnIaAZbPPnQ2dpW7rsLREev2LbLdG6pcIhA22fewBpiB6CNvUvyB8wXLn1zOASjji
 Jx95bDQWoIKd/cTV/JqKVCz6psXda4f+r0ZFCeWJrb6iSqiAtx3Z+iQGRCVoGlGO2DyyawiMEHy
 Vy5vdgACeFq+m4F1XEy9+HN3p1gyRcFkcgOi67YCTavqq9VvceGA29OyBDU4wWiNLexAVUCLrhT
 aPLvyOTq+jNvXuYYT5/a/OvB39XMdzioFSc1RobVsQcNtD8zT654hFF0qqdJL5eDDVNLcCRytqE
 cgHARjDmM/uRHSi0nhw==
X-Proofpoint-GUID: rFt7Q4xCUm9RMW0j93A37ryv1OTWnfMO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfXzEvqo9oHd4sp
 ZFE6seyYpG1la1/ASJ3AG54I2WFCb4esy9rK8nYZ8W09VU7RR5KPwnhg0UC4I+Af9e1aglyz59o
 NejZiCkMTzno/UdsqoDqnzWU6u0sMTc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_030956_439804_E71E4E77 
X-CRM114-Status: GOOD (  22.30  )
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



On 9/25/2026 4:23 AM, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 11:49:50AM -0700, Daniel Mentz wrote:
>> On Wed, Sep 23, 2026 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>
>>> On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
>>>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>>
>>>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>>>> When a set of consecutive PTEs map a naturally aligned contiguous block of
>>>> memory, set CONT on every descriptor in that group so the hardware can
>>>> combine translations and improve TLB reach.
>>>>
>>>> Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
>>>> those sizes through the normal page-size selection path; io-pgtable-arm
>>>> then installs the corresponding tagged descriptors directly. A partial
>>>> unmap of a tagged CONT group is rejected before modifying any descriptor,
>>>> so a rejected request cannot leave the group partly unmapped.
>>>>
>>>> The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
>>>> CONT support for hardware with implementation-specific errata.
>>>
>>> smmuv3 has this errata, it must be disabled there too. I didn't notice
>>> it in this patch?
>>
>> SMMU is an architecture specification. I am not aware of errors in
>> this architecture specification that would preclude the usage of the
>> contiguous bit. I understand that Arm MMU-700 has the following
>> erratum
>>
>> 3777127 Under invalidation in TBU possible when using contiguous page
>> table entries
> 
> And a neoverse one too.
> 
>> The recommended workaround is described as
>>
>> "Ensure that contiguous page tables are removed using a single range
>> invalidation. Arm recommends using range invalidations to remove
>> contiguous entries anyway for performance reasons."
>>
>> and I believe we are already doing this.
> 
> No we aren't. Go read my fix on this:
> 
> https://lore.kernel.org/linux-iommu/1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com/
> 
> I have another patch that fixes it for iommu domain mappings too.
> 
> Jason

Sure , will disable it for smmuv3 for now.

Thanks,
Vijay

