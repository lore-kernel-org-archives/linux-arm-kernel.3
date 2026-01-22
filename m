Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A8CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=; b=vnIgW4m8uG+3F9G2JftGK3ssg3
	e9nmCErAwHlgX+J535xFOZ2dt4cKxud3x/BJ00Xbwfy+NFXy/P23J5UdCB2NR2486xut8+BfNPxE/
	Oq81tQ+qlimhCx9c9fgp9o7ENvCiyzxeyuAdTx/Z+ZACTHvK08k/qc9AMIM+G2HRYf8VLTF+K725Z
	Zk06rBjXQ6T5Udw55lJXga07W6stF42g8/l/NCabMT41dFZPzivJgxzk0Oorddk8TlDgwPGAznSqq
	ZoOVMG8OMTHo/qy1BIuaSjhmkl+St3UV9Wj9rFnDTDpcT6Wof22MFzLCU98HS9s5aGp5axXIy2K8X
	bXNNp8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislt-00000006xBC-2y3B;
	Thu, 22 Jan 2026 11:22:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visll-00000006x5Y-2TrP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:22:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAlemR2915178
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=; b=hoHzaE0dFfoPb48/
	Kx8F17/AibFC6vyMzCPCV//vIzXKnSzAH6neHGGyUMqXfh1HS6KKYs2+21az1GAz
	7zrgmnbHt8cOuy2mgjBprMN0hWABpzSWZxXfKzfFPXHcC6AWlFkCrYM3RAHP0u6p
	4yBR27l6LdJizJ9MM16vCZB+mkZ5tmAd/tIQ4Q29fjdPzf4xaFAt9qc8VJx3TQjX
	Jcju3hR9Z88Ky75aEZuP69EXCFI6AWYV07J+EFu1ix1rKdvKZU2o/PFi1OIhr0YL
	XIcz4kkYvF8Yh4k7XiRxJLRbgWmXlTFGSZ1B9ahd6TmixRaADCkjtrHgqT6+D5Q3
	jtthGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujf2g2x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:22:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a08cbeb87eso9891725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769080951; x=1769685751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=;
        b=LDtTC1yfVKt/8DNIZYibGAP91jAI8Z10DxvGDUVv+PvRRGpVBVii6Y/uOA51ReMMDm
         JiedcM/4njgD4valeYtzTW6qi9eSEhPzLodwFag6dMfQ8nI4Dq1PdoBjPlWkCuZouKBE
         9s3XcMjkrxyojr+fPNVwXDcn+Ciocm1khWGqyziNX1yHyNnlKM2zmwp1Y8vOo7IJnOh+
         msjBWe6/TZePAQfvHaBQagT8+bH3ZMCh8ny9+FFvNAc8pdB6EAc8TCE2DklEYiMuQtC4
         nezMEFRhOog5R6lMNNvotVI9F7ys+9gpv8gGDRB14oiP4TvvvzYVGBDpDahQl6BKLmfZ
         7onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080951; x=1769685751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sT7Nth9tTPT+v5Mske4oo0KiXy0HY6fe5ia6z73pBbw=;
        b=M4XQbJ7+ipVK5M3DVFkdmTOdiNJ7OAhmn/tGm47a8F7V4Wr5PUXfbkQjQGjsU/wKgs
         ajd4+P3TbrrUsrRxNAUEY1cMXkfHdptHiQni8rL1tXGBs5skWO/2hqwZwpq8SSvk45Fx
         kc5t5DwK7HeaBf90LWX903/T8bLI//7Bg7QBK4AfolGjVjO5PU8oV5hcw952/ji+FF33
         iRCJ5yA7nVvA+iVjiyIrj6cTvyfgJVzrX35qaFLqksLNbgA8gGOobeINoRMX14nOpAcE
         BNMT0HmINdFr50FcukQZTV9H7sEa6ZL6utx1cmdUD/oDv9BsJ3fm7Z8VHGDLq+8ol1U+
         kWhA==
X-Forwarded-Encrypted: i=1; AJvYcCVppE8SGeKjRnxxklX6+/EXhCMKuD49YXD83X8fYDUzvUx19A/gfiYXjrdGVXR0DcfjqpZS4cibgggh4YLJOT52@lists.infradead.org
X-Gm-Message-State: AOJu0YxSF4MopUeyKMrJEjlrTNRahX/tMCDQXppUwNa5GzSfSHBaW71s
	LlVUZwm11xAT32Wf1DKzCT7g0LgraN/SjcjX/DjIbAtbV26p46tbplL8I/nPLRlKDChH6Pp/Rhx
	DaA+4mEZX+YBokDRkgqUAmfK+JZu2OAm8zHxBPAaKae89JbDwS4+xsraY9uMbHGIjGx4YVPP5e6
	M0CnwRURBx/w==
X-Gm-Gg: AZuq6aIuHzeq8lw+5qaASVBIEgynHuGuJp/mK7xv6CxsBjfwo/Q2/9EyvmTcY15JRq8
	1lEPoRHrAkII07BBiK32wThLE591jptyWMu/HR5JcjIIpZhfocRcfftWfKRaN0AeSUL0w3j+Rmo
	enmeDV92UnFsHF+kkcr6nSDstJG0YtHbXysWHjXsCdNCIuLTStSh5MJ70vqU2Kj5/Jp55/3rpEs
	+jkI3jBCoqmPKvpsE2Uhkm8Uw930wAcZo3d1pWoFG2IalvQaqgU3Th5TFeixUd9M8sqNb/4gZQa
	GrYKhOt5zrEBaRh7mbGgkk/vo5uB8LobyJC5p8Rygmsds5hCh53DZKCyzJhg8VDqjoR9O2eJx3v
	oh4rTSHd3svcOZdqdIo0gi9yIU8JTvTY2yteR
X-Received: by 2002:a17:903:2bce:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a71885a283mr200621025ad.11.1769080950638;
        Thu, 22 Jan 2026 03:22:30 -0800 (PST)
X-Received: by 2002:a17:903:2bce:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a71885a283mr200620585ad.11.1769080950109;
        Thu, 22 Jan 2026 03:22:30 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193df75bsm164936365ad.54.2026.01.22.03.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:22:29 -0800 (PST)
Message-ID: <5a8fc32f-0a4d-4b76-8093-faf9207a4938@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 16:52:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
        iommu@lists.linux.dev, joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
References: <20260120151105.614792-1-bibek.patro@oss.qualcomm.com>
 <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <ctdfmzictrjcwugv66hmk5pouj56qviy5umdo3yrmhvfexqoni@kmtozbt53sdv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uF69ZNZSGJUKHzxvE4ymck3ly8QkktE8
X-Authority-Analysis: v=2.4 cv=fdCgCkQF c=1 sm=1 tr=0 ts=69720877 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=90QGV6kl6MXzLp6kim4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4MiBTYWx0ZWRfXxyEErJBH+xlI
 XzFagCM6RlBVqymZRUYHX4o0ujFF45szQ/DMlGmqfm4jlJXZ3PgSf2/EKPHWotIMrpqiBWpUOTZ
 l2/PN7zKt1qus29tLmNmwsmmqzjr/FSn36Dr121diyBu/C5jrmEMLJcgXR4QdZd+abf3MaoX88E
 uxdRlTauyfN5nb9wtUS2g6jva5ePbc1YK0M86enJYBrBBBKusmA+YNHS0Q29ovQcm+h/ABaXm5I
 UKVGY4JuYN/CEEFWqyixnmDKvYiXI9stBN59GljPGJfrOubT/DuUg8/r1EHRudYqFxZ/+0dCIjk
 WLBphTPQxN1953HtS0SjWvZoeMUqVNBIbGyCvMvRZ+Rmh9FXbQ/QFkszMTn091nCcqSm5Bh4rt0
 G37g5JXVv2Pk1StAqCllV21QOADR03ZUpWxV5Mujo+T7YPhCFqcSRZ3OdL6re6T6peq+DrEYZX6
 +h5fP+G/EZJ8NbUjMPQ==
X-Proofpoint-GUID: uF69ZNZSGJUKHzxvE4ymck3ly8QkktE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032233_761060_C56A8851 
X-CRM114-Status: GOOD (  14.80  )
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



On 1/21/2026 3:56 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 08:41:05PM +0530, bibek.patro@oss.qualcomm.com wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> The ACTLR configuration for the sa8775p MDSS client was inadvertently
>> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
>> Add actlr settings for mdss on Qualcomm platforms"). Without this
>> entry, the sa8775p MDSS block does not receive the intended default
>> ACTLR configuration.
>>
>> Restore the missing compatible entry so that the platform receives the
>> expected behavior.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Missing Fixes tag. Otherwise LGTM

It looks like [1] hasn’t landed on any release branch yet - it’s still
only present in Will’s tree, which is also where the referenced “fixed
‘commit f91879fdf70b’” SHA was taken from.
Given that, do we need a Fixes: tag in this case? and should it use the
same SHA from Will’s tree.

[1]:
https://lore.kernel.org/all/176764799410.1451727.17568755330994660848.b4-ty@kernel.org/

Thanks & regards,
Bibek

> 


