Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B077EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MX29Q1R/znhbbELv+j30chpVyzD/XbvcTvrQWBtD8nA=; b=raT2di1LBPLPlMeURbfB81powe
	nr/GAzqjNXDT2ksWYzdJy4GmPa6j/ltg21yJr2mF2VC4EhyIW54UpzxpW5xv5aMqPmf7P6y3Z1rcP
	XqgQ2bn//Q0xj6r60aweZsc6ZoqSnawQCkSotX7aSnb1pD1ZCb2HcFAoLHeY8UvS494HQ1SQcLzzz
	g6cbSM6Sj5/mAn6JuZjFWkyx+ITSqFPbFrG950TfZbZRsTACuVbi7GskO70+MYAeTXezEPRthmROk
	znbkRyG7i+uUhQiBNZ8XEsymQ+UFfrOOEq589xgiGUTr6W7MvyDG9eRZE66m4QNOnrX8zRhLGpL18
	Q4/weiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nCR-00000003dzs-12mh;
	Mon, 21 Sep 2026 23:13:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nCO-00000003dzQ-2ox6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 23:13:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeVN3955745
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MX29Q1R/znhbbELv+j30chpVyzD/XbvcTvrQWBtD8nA=; b=OHDhehO+S7Wg16hM
	I8MMHgjL004QKhJfR7IwzEulA+y/gXny1g993oBLd2cACzJrP/F1Y3ZeRgqZpKtJ
	yY/uhVyb3F1aCPEtaF53gSCw0ZABfM/vqcwbP7oRd5gEuvKL3hZnkhYpkGxRTY7i
	EoUXpWEBJenff+Ns40Ho/atZhVjaybQr4nJ1XLQaK41I3zfSR4EkRE3Vz909RNvN
	HfKjCAoFdfNhT47VUfL5aWApDMaGnxeZ+hxfErw6WOfO09ebKtod+hB31kQ+BmE2
	5Royn47phvx5QEoNsrvPmbB6ZIaHl+tFZZ4K51q5aYdZQPgrKaszpVV1wDT5XxHo
	GaD9GQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tshj51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:13:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3162974a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 16:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790032402; x=1790637202; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MX29Q1R/znhbbELv+j30chpVyzD/XbvcTvrQWBtD8nA=;
        b=Cnh1X6Ji0OBhc6Vho8iLgQKNVsV/VeuC+pXRiDIQaPdWdNNw5rXUQqr/MCMqc37FZO
         hBnMjeMuF5/KQk60xtCUlS8EizMDSNYPyBVjCHYWe6Dq7GvUEAAXJ7WzaYQQpk9XOIDA
         /3hE7E6JVjU7/DQCcXtVgc+Rvk12Y38swy+NGxAxkUH5aqoxqcAZ3S5yWuGdU/XlIOiT
         6cLPRqSDcU//5K5pqEWcR2/Hn4xsktQjhhbJPZcUUmMeJTa5pj7cthXsMVJrGjvZiCUt
         3sU+PqVbQkNFvCaz0h3/HhvPHpQBNHKTnTrTq0oG/6B+TgZ8i3FqKoyXIPdOsJqUgPnI
         cwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032402; x=1790637202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MX29Q1R/znhbbELv+j30chpVyzD/XbvcTvrQWBtD8nA=;
        b=JB98PsN/KKXQ2RdRwmqxPdlRaxEaQESi/PVp2Ikdfxp7tA/i/qwS16TE20yxGo5L7g
         bxDK6XwQ5VtJbvr0EPMz7ZkKFo/clZ0sdKIY81fBFMn2Ar96qWR3ONhdxZToaUlfWF4L
         ZgXGLP4nhOR7YsyevQV/SD7SWf52ugZG77W/tNkIOR97Cfi1jZIidy9H6MN7HZ382qbj
         gtqSX+QaG0sYEOGUF1ldH0m7mWh6C1+xBxvd7HGGS9ZrEEnLajgLjU2FcCgH4gTDf+36
         YEWG9TK3TvnPNAjEUAiVKmzdEW8HB58FMHub2LGcmlqEJnQn+gZ5oPxt3ttgD5wl4O0G
         ID1A==
X-Forwarded-Encrypted: i=1; AKwUvBwv9Kb5nax9/SCWHuerQeOhrWpoXSx9HpSC9jslQCoyhSRh4OjqOz1gRwUMebWMofRPsyZbNM8dDkJYuqXZmrWh@lists.infradead.org
X-Gm-Message-State: AFuF++k2D3lzMSjw8zFZyLU/WNnejn90nbh0myS8FlBSTGtCRyTax+8x
	+oxNP92xzAYMU64ONqbpw4Mrups2W3A7IpxB96N3JBBp13XFXwqMnhhs/lD5SxpC1cCBDma8q6c
	btGIIAZmdmCB1sKDwvVEFRWogDfhH7XyjxabhNPPoS2uzePb5cjC+Y7b6NUrUvLHwPqVXzJ3Zvb
	0XKQ==
X-Gm-Gg: AYBFou0RCKjflRJ/yGjijy1puboiXCKHg51FsF6B3wQILKluIy+4WMSAPZdl321UEmu
	UYQNMRhSeLzzvtUtQRJAEVUqUBo/s/p1NqHmaaxmA5MPfJzVmhMDA9tSDQLfwMAURmN9ViKxHOB
	yKnDs84+aBZSjmPx8wn+jEjnszCXU3Tyqm+qcyB39b8VtSyxJY9E/048uNEc4vVTesiWzXk4wjT
	tUJNfS7WjLf2Z1FrAorJ8lWatOWfYp3akcuKB+TtkcbXvbYtwkVlouXgFD3oS3mCPbR4/1OhMRW
	COaHnjJD9x/KjIfhp9Bt44I9TpOScex1ubSWR/RedsFGJvqkztbpG8IU4d2ufdACFeeoU/s5ZbT
	Hk/RLuf74lPc2tGX9zXdfIdWdswvcnk2GIq9qwV/MMIFcOTrk/Q==
X-Received: by 2002:a05:6a21:3216:b0:3cc:917f:f302 with SMTP id adf61e73a8af0-3dd8c4051b9mr19071899637.9.1790032402341;
        Mon, 21 Sep 2026 16:13:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:3216:b0:3cc:917f:f302 with SMTP id adf61e73a8af0-3dd8c4051b9mr19071858637.9.1790032401785;
        Mon, 21 Sep 2026 16:13:21 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612d0c6bsm264508eec.20.2026.09.21.16.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:13:21 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:13:19 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
        catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
        maz@kernel.org, lpieralisi@kernel.org, liaochang1@huawei.com,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH 03/38] arm64: interrupts: Add common exception state
 helpers
Message-ID: <arG6D5eYMJjhVk3u@hu-ashoraj-lv.qualcomm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
 <20260914102102.68597-4-vladimir.murzin@arm.com>
 <03e261b4-10da-4530-b28a-5512e399d2e3@huawei.com>
 <38ea1138-cc80-41de-9eb5-cd03571c4717@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38ea1138-cc80-41de-9eb5-cd03571c4717@arm.com>
X-Proofpoint-ORIG-GUID: l90mUKIzXwiJdr-nKVkOhDo61DL4Acjv
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab1ba13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0o9yN-7XVkLi_kHPPjMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMzOSBTYWx0ZWRfX+g8qJrJm2FrD
 obV5XWAxA+egQoCEDe1gI3VI98b06YXpPypOFkMuMq+5LBCCad8ary1uRslrCyojBdpyX0HTpDv
 4qJ/l+oavr2Pv5petAQaKBI5gGRZOYM=
X-Proofpoint-GUID: l90mUKIzXwiJdr-nKVkOhDo61DL4Acjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMzOSBTYWx0ZWRfX711QFp0pLhpy
 kBBLZ9DYXMwLtnRv3FvJYcK6rHfoVCkx21AfL3UTW6d+zztJBv3AsdjJ6mAl+orVrgWpQKd0MXC
 q/cg8L3N4I3W168FItc5jD2HL5nTYjh5zJ1j2mKa/kuRqc4lCr5FTyFu+M0FcVioFqQekeEoHi+
 Z5JHxyl358J/UjHEeJQXv938gZSEYpjIe0V1AJiw33SSLIKkT//4sksKiVcPtql4rXh5GzX73W5
 MFfg5u6swY6wEYQW6il6TAJt6pDLy/y+Jpml61R6OZIPMLBeBMJScmmBwsFJe4R7lR9Bi5zKYlr
 +8fZ2FOSOy01W22x30WHx7d7RY8Af5nShNPWwOtCv17tRAb8Aj1HGix7Qg1zRYCRyNCN9b3gJZC
 CCyXIW8vUPZ+Cs6wptd3yd0dTk3MnaseRER8F3xe8H6EaEKs0mG/ACLxcsnylq76suTkK2py7qJ
 GG15fVJRy2RGFKdA8Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_161324_748687_E2494D6F 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Sep 21, 2026 at 03:10:32PM +0100, Vladimir Murzin wrote:
> On 9/17/26 10:10, Jinjie Ruan wrote:
> > 
> > 在 2026/9/14 18:20, Vladimir Murzin 写道:
> >> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> >>
> 
> [snip]
> 
> >> +
> >> +static __always_inline
> >> +arm64_exc_hwstate_t arm64_inherit_exc_hwstate(struct pt_regs *regs)

Minor, this isn't inheriting but rather reads a hwstate out? 
maybe arm64_exc_hwstate_of_reg() or something like that..
> >> +{
> >> +	arm64_exc_hwstate_t state = {.daif=regs->pstate & DAIF_MASK};
> >> +
> >> +	if (system_uses_irq_prio_masking())
> >> +		state.pmr = regs->pmr;
> >> +
> >> +	return state;
> >> +}

Otherwise 

Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>

