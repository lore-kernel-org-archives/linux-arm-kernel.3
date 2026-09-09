Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E84EC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 04:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=; b=f+iUz9rtB6YpwSBkofLFAaqqZa
	ARVMnNxnyHx01TKVissmojEa3fN7J6gJdn+WZla9Sb/uFR/5WLiPvT/A9A487DLoZnGM0dr5kJUnU
	lshuEPCPJssu8GqlLRPOISLiIvnbpa95tXCP1t3zrYN7e99hswUH/ySt+2A4K7QcnAasYaI2lxxk4
	sPMabGzOpYmVXFY0XOrOGQyM3lhQY+WEUtqOFCZAWgoAI4EF0d1AoQp6q/IZi3MHMWoReHa6Aw2yj
	534go0FEl1irFFcxT4o1cYWABeYdKIQoilb5U5Z5jWijvJB1jc8KMvHyxA+gv3hxVMNeghcEGIAqH
	LP6oF9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49ZX-0000000AjrA-3xUy;
	Wed, 09 Sep 2026 04:06:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x49ZU-0000000AjqV-3e9d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 04:06:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mg2uA965220
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 04:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=; b=KMmpulumqUHxy974
	LfPhlTuVkXLjKQydr+Jk37/5pYuE/aYqT4tC0rtx0xep6Z5Zc5hGXyE6V9uyi5mI
	L/V60lpVH2wyw0p2Mlpo4yQ1GB03B1HDEsfLxPszNNFMi7DZk1e9HUT7emg9Z9+U
	eF4pf8YDJaolfMdnwLk2Ob1sp2FIqKSbWnKarkKJyWBWmndlFso0JGU1WEB8FdBd
	XQVtgWOwao48Xfz+/PMa8Wz8mhMsX0OMm7QVNVEgUiSagatS+4lNxS8npn2CZD6j
	2tPNYbq0BQEv+Gkv8oI6hdQcVuQmAs33AnuBsN8FisVBXZ1s3GOeUYeNVpULDJZQ
	QvTgpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha22k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:06:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so7127655a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788926763; x=1789531563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=;
        b=if0qJ1QpACgQzLVodsOsGjO5VTaM+3KnvbnjiQmoNU0mZU+8HN4oBccaVQBWzueduh
         9SZEJusdrAueyzx6I41CIsVNG04LY3V+HntxPvbjXAbYEUz/tf6PpC0ZHF96M+2k5EZd
         yLxUEz+KC7dMJG45GN29we+Hd+kNjiuSkfs9MR3CwrK8R5u3siuXw6+/Up+MVCcD1Q2v
         2MoXAlTzjW1u3e/ehYwd5MS3RhaAi+X+Q1aEIxHjhI/vfXKYHwFEpeGFImVBA53f9YCX
         O0oSrpkEjGwT3FUXmNl46uTUYxe4gBN3Ne05zLLRQUzY7hDhuaKsfxBY6n+OCzyY32aJ
         lZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788926763; x=1789531563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1+atJR6FDQQspxnJlEifDjkb7d3prg4wHIrPk7shYw=;
        b=kr8m+VSSiDyj1n/7CnzySdSvVTv4PDiCc5etoTca2eIVnDwksqLFh5XNZSo5yyh3f9
         DS9gRV1CFrhoPp7KxReQt9x8Bu2zYZM3fhTYfqr814psIgvcpj3XL0HfKuvZj6RP7M08
         jC/kL6lI2fWQlQQhWmf3EybvnavYMRLZ5yZ76c4UUBKymczw35kf4+SK3Pag48UypD09
         gvEBSS5sVqoLYadidnCZ+2fTHEMp6r0AhZ1BgB3+D0zO/6ffGNmRNuGIoRayjX1qif+q
         r+QVtLFJSAh94zbrVhysx8y2uDutIjUodp75Ojshl6yDdEtyci0Qr1LKsI9UBjRgEc/E
         Rx8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5hcn7fRagRl3KhV5s2871yb1JDhJMZ0N3+cxDjWcNUQrzFOMhjdo9rtgKLjr0cBXS+aQzhcHy1tmSbQVj9qRT@lists.infradead.org
X-Gm-Message-State: AFuF++mlZ4tGhPvpgwkb1g7dnQyqXub5crRh/0SlzfUjZOwwbnmzF8Nn
	AIc35wUVi4PYmHb0Os49FYWnE+WjCzODpvomMIwd0Rk4e01kmxkWteU6LMwA3HdcBCGnj9gBM7h
	798t57JmVOhcfhWJhUJgElHhqny7rdPUUzJDx8VKodYZp4hCs3GI4Vin4AdywoAwunRIp+oZOAh
	m+l6/x+u8Z1w==
X-Gm-Gg: AYBFou1UwQuJZTMMYzgb7B0BwnmbnWcwZdzWxflbHK8N+lQxtNsNeAs3DsfvS27eItU
	sgz4ag/yKcIzgN9rh67Do+/aN6P7PH2XBJvwCHgH/A3fSOFRRptYfGvHHRFDzvYeCZx/8tpkpvW
	3RhE+JWVapbX1wquLUZ4f/TrI4r6fEZsveBY8osrqNhzuLC/7fBkE0xIBdS9/Vw3RLMA8X2+YuA
	ekr9WOjdetUScC3fL6/3dSaWnudnfBc979YavZG9KyTDYLK/z3Yjs5UBl2Ej0mNKrz3GNB8G5Aq
	HMaLUQWgv/Pu/jF8MBc6nNrLg30JIFm9semmZuekAqbXT/0SRgmyVDXtD98CHQgsolFbXccZay1
	rPcLA95EY6jqiEHnsyhLNF3hoZxg5JqXnSQ==
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr50410115a91.24.1788926763183;
        Tue, 08 Sep 2026 21:06:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr50410062a91.24.1788926762690;
        Tue, 08 Sep 2026 21:06:02 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm46654957eec.7.2026.09.08.21.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:06:02 -0700 (PDT)
Message-ID: <dfcecd58-d6ec-4694-81b6-fe6d45d4a7d4@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 09:35:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
 <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
 <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
 <20260908164746.GC2543240@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260908164746.GC2543240@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA0MyBTYWx0ZWRfX/qqYGhUFbdsN
 kHo0ZtE/2rHuhO9FEYka3YOqMd4K5Gf+S016PejO5S3WBDWhRM3sdccUx4jU5+NUknovcID4Gs6
 kkWV2USShn6U4SU05DqNPmyK47BB7wrhWIJkJYf0rjAxvSMppFVw0MNxyE+rrSdfN3RU84S/8eC
 mnG7Zrt99HetcN+QVk/pNijfZXmChPeiWUSVMueeZI2oZH71chT2Hpd0MXiLm5zAL0ji0kpqpKN
 YFcj54QlA/E/qxEr/NRkBDaucHjXcRRw7QAwDNfld854GP0r1okqE9YKsNDsrNHc2IIx/MTlLQU
 MELcld/5gMd6WFKBmRdncbVNAkL0NY/l2Ni0mRGljp6PtZtKbRzVI7VZZfyzFv0Tv7nzfE7qZl6
 j2jqoCF6giRiiYuLDl10QuuIFGee479LcavpUkV1iY/VRsT26WNYa5M+7NuvfRRWxumnu5AJuLM
 B63pk/VcM0mgUXwFaEw==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa0db2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=zcW-mOqCcEHC3mfLxN4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: RzHZmL2AwWDtGFOIpseQnSkoQSmbX7Vx
X-Proofpoint-ORIG-GUID: RzHZmL2AwWDtGFOIpseQnSkoQSmbX7Vx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA0MyBTYWx0ZWRfX8G1MY4mKc0cJ
 tnJdBpvw1J2cd5x3j3WwsdkR/1zvIDfmyTzTXdaNYCIvt3FpakIx5uwyohhu7rqjwexewQt9w1J
 ovxQCIw/16ZFmmiWL+u91SFc1pIJGbI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_210605_697183_332A1347 
X-CRM114-Status: GOOD (  26.86  )
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



On 9/8/2026 10:17 PM, Jason Gunthorpe wrote:
> On Tue, Sep 08, 2026 at 09:36:35AM -0700, Daniel Mentz wrote:
>>>> That said, install_leaf() is shared by other callers that reach it through
>>>> ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
>>>> (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
>>>> alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
>>>> own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
>>>> notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
>>>> iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
>>>> get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
>>>> install_leaf() is still needed for that path.
>>>
>>> Maybe other people can chime in here, but I feel, from an API
>>> perspective, we should have only one way to make of use iopgtable. I
>>> think we should just mandate that users honor the updated value for
>>> pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
>>> alloc_io_pgtable_ops() call and then choose page sizes appropriately.
>>> Otherwise, we end up with two pieces of code in the kernel solving the
>>> same problem. panthor_mmu won't be able to take advantage of the
>>> contiguous bit until it gets updated accordingly, and that's ok.
>>
>> On this note, I want to point out that I tried something similar in
>> 2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-danielmentz@google.com/).
>> The feedback I received from Jason at the time was:
>>
>> "Wouldn't it be better to use the pgsize_bitmap and rely on the core
>> code to indicate that a contiguous page size is being used, so it can
>> trivially set the PTE bit without doing all this extra work?"
> 
> Still think this is right, Panthor is not using it well if it doesn't
> jump through all the hoops. Probably there should be an general entry
> point for map/unmap that does the right stuff for the DRM drivers to
> call.
> 
> Jason

Thanks Daniel and Jason for the detailed feedback.

I agree that CONT-sized mappings should be selected by the caller using the
effective pgtbl_cfg.pgsize_bitmap, rather than having io-pgtable-arm perform a
second round of prefix/group/suffix splitting.

Based on this, I will remove that logic from arm_lpae_install_leaf(). The only
effect is that direct io_pgtable_ops users such as Panthor and Panfrost will not
benefit from the contiguous hint.

Updating Panthor/Panfrost and adding a common map/unmap entry point for direct
io_pgtable_ops users are separate API changes, I think this can be taken up
as a separate follow-up series.

Thanks,
Vijay

