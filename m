Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F0C10D14B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXSSthAi1riXzL1QOlBNSfK2F+xRMOqfNkONkV21TUE=; b=unIgsvs9Qz+KkiW4YIVzDLJW4k
	p/wuNDE07wS/OJnYEMIvLlaMhQ+f6NgMx7o776HAl73MRyg+NHN0xH8zUqeculyPVtrJJ9FZSo6oP
	UJF+LHYfIuwADd7m6WdomIyttYbCfd1Khp9bPomQvcoZzoHaRHFNGyE7tnFIhDGB5aeB+S1dN1bTG
	wq1GLlavJjdtGkXcVBDBdUrsWkeVVH8pX7iaPfr4Wsv60znvpzhlrdkZcubohLJPCxFzNMM7/SE1a
	Gm/BrS2O93MlFIQAcbp9lG90q+IW7hH3LvXCTV9PAm1rqMY3Kggtx/8u4gj3wjjD+8a+R6Zo0BU3v
	JjK9L/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Cie-0000000BMDp-0q2B;
	Mon, 30 Mar 2026 13:31:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Cib-0000000BMDK-2Ma2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:31:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9B0sU1974830
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 13:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXSSthAi1riXzL1QOlBNSfK2F+xRMOqfNkONkV21TUE=; b=Vu2NcFP7PFCq+EMO
	eDFTvpjKUmaqal0Peym/yUv8Qmbxnhx3x56YDEfJmxFXlHgFMfPkyFYe6th8a30P
	hU5SbY7mPqYdJGeUNQLdwxJLFTFTUfukiPDWkjlJ6++uAbavFWx43YlAa3LLcn8R
	rLYkib5t7gO7m+LN69e0tYU6HE/Ubn8pNyh7VKFVc2aueWqFc3r7nnV+CJMucEV5
	ERUhoPaiywO4GjYdJEt13UYAeIpizHf5ESCJ87IuQ2p1pejLI/5lXY1gyRimxObV
	bz0RA4OiAJn86e47QvrPg9cFtyQRW4c76lMDcmhxMrkJvxTJhka8nhZFrJhcpjs0
	SV+5mg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmmgvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 13:31:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso10922932a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877507; x=1775482307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXSSthAi1riXzL1QOlBNSfK2F+xRMOqfNkONkV21TUE=;
        b=IY1lLHierj5K/x+oR8EZsaOi0QeTPE1S6cr3h7tfGjcRHEmb9qe81Rn1uLHVbQOJ8E
         ECM4P3Ls3RtY4O08Gh9MXrFWO0TNf5zk1pf0Tv+++Fez7A93iuDH7TdvjwhyNrlHBwtz
         7PalI6+EY+C3nHukYka0OW2QlJ2qCg1D8M0+BHXxNsjShfKw+Ydv7oHD58j1a6Oatw3k
         V7hZLuPVjO9D1Q2y/0ltZGvJVJ8uHthVVIUlUsRKY0xEwB+rVSXT7/y/9GSpD62nuRee
         z6A/mkV3LObVnD0lJk6pjlDd1SocjYuH2a+dIfgBDbvwv6m+ltItS2QeISTU2T+DKMJW
         BoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877507; x=1775482307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXSSthAi1riXzL1QOlBNSfK2F+xRMOqfNkONkV21TUE=;
        b=HT0ukN0hKDyT6MYZdVP79IeT0UF1UnjofWsCsk7nDXt+y7OiA4AOd6Y1zsrii2NeSf
         O+ARjPwhEm0RFdJJur936Kfh563/oBlkCOeOtgnP18gg9U7zGlYto+vJPjTLPgvUOA/Q
         ACixCzGha5xd5AKvOo0gh+S8+GnzH40JwG5ZW58dtQ8D80F0YPXs/5bFJybqMWYvCiFC
         MBsDSOaKBZS4+lmje2iCIWb05252OyS7KKUnIHwYjjxorX8njeDD+acmhtkX3THbvciv
         zW+Rj/dCmNVzLayRodJ4abDjpEbUIYSdMqD0ucVsgmHZbAJGiMvEsXgckkYE0dfjZtOk
         Rmdg==
X-Forwarded-Encrypted: i=1; AJvYcCWEel5/OtKn0FHfUkOmQ0TmzxO2fI37YrEKvkJiVVBwsCnJnFubsKvzdZ98fdfT7PLq3TQxG6Zfalc9tYr+tPLk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8pCD9vmJ3EPMs8hXI61148OBYVCrgmODjDxpiDe2LjC9AaDQ
	SXh5GXVIT5hl0fmmDnjLLkFpw0MHJRiT/shDiDHOU/nv1t3y8rLghIMfwK4TErZel3Fx+pQAVoc
	Bu7Nf/OhiO3V5hMzcOQwJxpkAfP1pwxWJYkWDorQ1yGDxPepqhcsvOY5CADpU+lo0yBlPDlBgIP
	L6Jg==
X-Gm-Gg: ATEYQzw3VPJ5jQa7AI0O9nwK/Re86PxWDBJhyeoddOoSvl6ADrqve6KdF2nVmki0oFT
	tP2io9Xzp1q/oJc+7gLdZnWwtbp69ChgnGcFi+IBshcBk1DWQmFL3HYRjeM2Nwx3SNs/wzHy2AF
	UHz83POVCqzeV5CuQM6vZH7NTeW6+PxrdbH4yfb0mrORQCCGVz8vBFdQaFyStVMEKalydB2MPP6
	iRffFuRkLF3KIPqD+HKZga8D4poDTBqOEMd40cwMN3xZwy8NoHcboLrqswdizl7eJ82C3y74aqg
	xECo84zQvYhPkfLuWOrTOmgVim/smNzj+egj2J7W+zlSHyDV64XZ1XNqUg5JCCpLrEqkc1of0tm
	b9OtroNY7zCzEC6IOlp6/qAyP3lK89m8s4PBlFPk0Zyqk7mwT+aEtWitARutbhZlcNUfA2cPA9t
	EVeVu2724Z5hs=
X-Received: by 2002:a05:6a00:94c7:b0:82c:68f6:a18 with SMTP id d2e1a72fcca58-82c95ed8eb1mr12309433b3a.34.1774877507512;
        Mon, 30 Mar 2026 06:31:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:94c7:b0:82c:68f6:a18 with SMTP id d2e1a72fcca58-82c95ed8eb1mr12309392b3a.34.1774877507011;
        Mon, 30 Mar 2026 06:31:47 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d4d90sm9379179b3a.36.2026.03.30.06.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:31:46 -0700 (PDT)
Message-ID: <ea032169-5794-4776-a282-cf4e6c3b6b3b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 21:31:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: platform: check the availability of the
 endpoint before parse
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260320-add-availability-check-v1-1-b2e39cdeb6e0@oss.qualcomm.com>
 <20260320082549.GO8048@e132581.arm.com>
 <519ca61b-049e-4e2f-a9fc-9b4621574470@oss.qualcomm.com>
 <20260320092337.GP8048@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260320092337.GP8048@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfX0is6xQnaLjIL
 1+ZsbuX1njSq4+8REGNpq7fdv+5bOOp7LfndLYaKKZqsdGwkfXP+0hKyWjpDf6zU7eyuKtGULJz
 biROpcJ8Wq4zdD3ULsT3NvIRea6plnaXL3+e3OqZSK6vE0LbdGPkTId3RTj37C6rHgVoq3inkO+
 uxU1cgs3QQCN++/ZBcyXK9qK9jCgG8oJbzO4W3dZbXWRTFKILaIybYL2XzDG5ywbDOXICsztuYL
 PilTbC/f8KXVHIa8URMWi3KQXvfaW7s++mO2vh4wd040j+qCm9JZU98I86CWXhk4UPJ9b9YZHWP
 f+wGNw4+5v/n0cpVHDeJTV8p+8L3RVMou2C6fafyuNSenONKo+dsGl8SDoYEo9KMi+2spggxzlu
 L89mSH9Z1T/WH1Y0rqZkks51x3Ma5jknsBLRRjJiI/uqj32ehssnynxTLd4WBVoMZ+bzjgXvioB
 V79ouEtjqZ0p734p9rw==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca7b44 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=ehGMhPKKDc15LuBkswwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: XC6UQ8kefngpmH7POthczSYailP6yi6u
X-Proofpoint-GUID: XC6UQ8kefngpmH7POthczSYailP6yi6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_063149_608336_1952CA19 
X-CRM114-Status: GOOD (  19.00  )
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



On 3/20/2026 5:23 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Fri, Mar 20, 2026 at 04:44:54PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> It's about the coresight_find_device_by_fwnode() returns NULL, resulting in
>> -EPROBE_DEFER. So the probe process will re-start after several seconds, but
>> always failed because we have a "disabled" device node in DT(we can see this
>> device in DT, but it never becomes available). It's ok if the device only
>> has one remote device, but has issue with more than one remote devices.
>>
>> Consider below situation:
>>
>>        device0
>>     |          |
>>    device1  device2(status = "disabled")
>>
>> The probe of device0 succeeds only when device1 and device2 are available at
>> probe time. But I think it's ok to probe the device0 only with device1
>> available.
> 
> Thanks a lot for details.  We might need to report warning or error if
> all remote endpoints fail (e.g., device1/device2 both are disabled),
> this is a rare case so would be low priority.
> 
> For this patch:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Gentle ping.

Thanks,
Jie


