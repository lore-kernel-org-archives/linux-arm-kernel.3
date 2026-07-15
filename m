Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C66DC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 05:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=; b=FY1stsgFeh/o11kUydLvsHJTBd
	QEU9D962p/LgqBBYf+Op4huy5ykPPVlmpgED7rBWM0B/5x9M8J2JGtGCxHhZTeVRcHLL966Q+pT5b
	rJrCYuWB63vi8bM94Ad/vXBdo7XKZe1d9wm4J5oofIg747HXEfyAmR5JwTbavrKr4ZlXleY+JwyH+
	USQlNOpfhzGMQN7SU0YbKtDshkoJ9lZ9/okSMqE7RwPj2mfxTrzZpJI0vmdu6Fn3VQ70AQnxz3SYj
	3glpv/TASU8aqw6GvqgwQOV8i7hn4vp16kL9bHO1kctBgx65qz0ZPclpRl741hg6d4hBuqd5nYaoS
	6PXVVarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsbJ-0000000DpyN-0SLU;
	Wed, 15 Jul 2026 05:56:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsb9-0000000DpwM-2scs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:56:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3m2Cj2406373
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=; b=L9w7LnyFUmzSTGLy
	yK2/duhNZU8lZP+CmJGkP12TeN1qlqOHUgI4rMbR7OQVLjvLvgd9afCBbQuXrUr+
	ZqJUp0wmuFzSDngL1udumNVEj0hCuv08mZi1Y2f9SeZsv8+/6spv5FTfgza4x1IF
	fNEce1u0eLMc5e/suI5aYAfswvCcbnoxb+MC1trsZc9S2iMNwSOubGNTP+7mFl6w
	j5tRExgm3kDrWzzjXAwC5XmQawIX6IpFwNBjUGbBhyQ72BR3dfVOv5rnoBg3q3EA
	zO5nNb/j9MRaK7z/baBtednwF0k0s6KGI6KBvG3WvqWoA7pjyfnVoLg+huXqN/eS
	F/iVzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0k7t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:55:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so7213336a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784094957; x=1784699757; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=;
        b=KupO+Bnc043FHRzDuvQ0YcuITsDzPFSjozg7QzoWRVYrwbEccjEKu0l1+Ef2IUGcML
         d9slu8PhHbVaBJv7NI4RRqmDBElnkmJDMrMPS0GTzgtp0jhPcWon8v+3Ggj3UWXPnN+S
         nT5sgp7sR2u+49hz7+tcN2cZqpwkgM31Q6QMR5KsPW6s4degYwZvDJ3kIlgfeSUU+MSN
         qnwZk9ZS5MIGkCCyHbnOp3eWntI1XNjRPV503uh4SZ2SwoTfLvatwB8EJgRGLY3MjApf
         C0N4Cy7ogvR1dwfpgUHAAnIBg+XhMYcvVTxTWgslDAwnZdhvn3NlZ/2tvIe4ASpFIU+e
         jYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094957; x=1784699757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB/j4DvH2ZOcHrab8vDDXcKtg1x5ii9LH73zX87n3Ko=;
        b=i5z5tgv7rzKMpxX6NEnupdNDPxSY0T/0c7kxyBaJUzjnSu6Y7nws84iGgbgBOgRSxv
         kqOQVryvWa7zgWRbsCRAgRLvwpV27wosiECbJ+w3RxUfaq+Pc9KE+pTUF0Pqzb6OczXG
         xO3+gTROEX153xRlVYKQAZ6e689xzVxB0kb/QHaOU2Y1jd1b/ieXL7IN5B7VKewH7bE9
         QA0uzg+rYo5CzB3ZB+nvnElTJ8+iaHo2VVoW4JwNrfIYfTA7Hku8PksjZvxFYcU8o/21
         Bc4LPGBHDRwmKLqegUKSH0jcx6lO0JSmRu61Ca7eUGsO2td/1G2UZGNuSJnMApKDY29U
         hCoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlbwfmqF0vEfFXsAIGXl6fXd3UXv55rIYF9rs2Bfx8/d5CK+Smc1Te2CnkhDhqJE1H4IKJqx2WzkbDHGnOlt6M@lists.infradead.org
X-Gm-Message-State: AOJu0YxcnYjhIMAi+2vAbrGStuKdF6EzLesel74mYEy/FTE/DGm2qP4X
	vryCxaFwWy5cqG5Bf3WPwP2gjGUuF7sRbYQc+hzeES8ZeEyBP3cxcohLRaC+qIf9Di3bhsi0KQb
	BMInMgnNzEHKa3F15PWlUdNCHkyuAZln8CzZyQf8svk2FuyqxPJglHFHblr5h/7HW+B+BuJ8wl4
	W6NA==
X-Gm-Gg: AfdE7ck88aNco+iFcGQhCcMPPnZVQ42xO0iYTB/j1qie6fCoteLFhRC/BWgELTgGMSS
	At8CHQGtyukQzku12H5znavGDhPB/xG92EErtHz3EyoHDeyQ+UwTwexh7ElliZavhVzVw4KC+Gg
	sUSNj0qETYgMwdcviEK4h0plrHXVU+NMoI17ZP8A3ZNRRtZRXn7qvc9VoSIaGNwjSxJZsEZiyck
	foQgFGr+k1Vxr9V9J60B0Q4DViX1N6Wx2B0yu0Qu2Qa2brohgsQE0bhU4qURkyKUNTg4a6DZUIn
	7oD7vB+Apry/RbqYvIuJ/EwgxoTO78K4IX5Rk3CZeR+bUnuvXqvo4+aI/USYeJFwawgxGAh3EBa
	hvq9y2l+1f4NH3FZ3/M8velthAuyEIboNYC9BXkfKunbk
X-Received: by 2002:a17:90b:4a:b0:388:cf45:d72c with SMTP id 98e67ed59e1d1-38e1aedd604mr5217136a91.15.1784094956855;
        Tue, 14 Jul 2026 22:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:388:cf45:d72c with SMTP id 98e67ed59e1d1-38e1aedd604mr5217113a91.15.1784094956377;
        Tue, 14 Jul 2026 22:55:56 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172fd17asm2560963a91.12.2026.07.14.22.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:55:56 -0700 (PDT)
Message-ID: <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:25:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260703161228.GA1948451@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX+iJNlNvIOB7m
 txC2hCOeLFmszEqIVm5obW+dWiQpBHAmLGoOltWw7c78FS4B+8jIBfWb9CyQms3ClZ4hCejx15t
 vevZYzSffU3VIqAN5ql++29bCKSCTWQ=
X-Proofpoint-GUID: VfuRJP39X1gGPLk4xqX2gWvaNlyP0zXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX6m8lAU2sMGN3
 cVEVM+Yp2A+7NkEvXSSLBD9JCYdLI3Y9zjAOB+TIAEcQK4ajDBNnoBJLa5dWmMJZ5EuSAYALb7G
 VhriI7gxTVmwItz/uSeyaZ+Ko/RigGCoqSx+EPJzLtfng79gy19g0bTl7xinyz/GhR3DJmO/4Hg
 5KS4Osw6bpLEsyCKxtDPiucYpmIrEGCKygjBJ7NRmB5uei9Z2vMQx39OEAfIBz8gUvRGiZydbIV
 BwCbnXAMlsreEO5H4kRCJkzZEVZRI9La+itqlklTTzQaVJqmzhiriULEkJhtdstVsI3V8WiieOx
 ka5eHpfxG8O3HUoSii5bJLb01LmSNehv87PlwLgClUXXYsIcyg4T/tre9WHxEVXiLupPbQbhV2E
 ahkXx0BqfAXBIqBBO7FVXTLpPwUNRx8mNcN6md4KAWfNIJqX8to9MFpDJtr0yq4IIJTPQ2Q4Kta
 lSuLuG111udjKNp+3Cg==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a5720ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fcmBhDXz9gjiIA-sPNYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: VfuRJP39X1gGPLk4xqX2gWvaNlyP0zXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_225559_752247_32207221 
X-CRM114-Status: GOOD (  26.91  )
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



On 7/3/2026 9:42 PM, Jason Gunthorpe wrote:
> On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
>> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>
>> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
>> When a set of consecutive PTEs map a naturally-aligned contiguous block
>> of memory, the CONT bit can be set on all entries in the group to allow
>> the hardware to combine them into a single TLB entry, improving TLB
>> utilization.
>>
>> The contiguous hint sizes per granule are:
>>
>>   Page Size | CONT PTE |  PMD  | CONT PMD
>>   ----------+----------+-------+---------
>>       4K    |   64K    |   2M  |   32M
>>      16K    |    2M    |  32M  |    1G
>>      64K    |    2M    | 512M  |   16G
> 
> My series to convert smmuv3 to the iommupt takes care of this and
> supports all the orders too. I'd rather we move forward with that then
> try to patch up this.
> 

Thanks for details, I have gone through your series. As this patch
targets io-pgtable-arm.c directly and would benefit all its users (SMMUv2,
Apple DART, etc.), not just SMMUv3. I think there will still be value in
this patch for the other users.

>> Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
>> provides a compile-time opt-out for hardware affected by SMMU errata
>> related to the contiguous bit.
> 
> I reviewed the errata and didn't find any related to contig that
> required disabling contig, the driver was OK with the ones I
> found.. Did you find something specific?
> 
>> On the unmapping side, the CONT bit is cleared from all PTEs in the
>> affected contiguous group before any individual entry is invalidated,
>> following the Break-Before-Make requirement of the architecture.
> 
> BBM means you make it non-present and flush, it doesn't mean you clear
> CONT, this is wrong..
> 
> Jason

You're right. The arm_lpae_cont_clear() step was introduced to support
partial unmaps of a contiguous group — clearing CONT first so that
individual entries could then be invalidated one by one. However, as
Daniel also pointed out, partial unmap of a contiguous group should not
be supported at all. Since v2 will enforce that an unmap must exactly
match the full aligned contiguous range, arm_lpae_cont_clear() is no
longer needed and will be removed. The unmap path will simply write
invalid entries for all PTEs in the contiguous group and issue a single
range TLB flush covering the entire range thereby following BBM.

Thanks,
Vijay

