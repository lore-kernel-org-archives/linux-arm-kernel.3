Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6186C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVS97d7MJNsARObM2+ftRjP75nOmFiQEKsv7hh3XWUw=; b=kZwVbGPwMIiO+NySf+CbOxFOnc
	VKGmN7SYGGbV1FQOG6/dSS2CYbSzppjwke6Bus5bw++cggVmVeUEAYqraxiTjXhMncXGdMKWEs5yE
	b2wvpcsHkUVRTVRJ2ErQiioMl4Y3o3wZMN8WwN49MV8sQtn04Psyou8eWw/a9MIdFNn96n7R4pvF/
	juBWbgiGk+C3EW2p5WqSvrgzwQOSF7qyxEGSWaoY1Mb0uRUio8qxRSRiPC7OsyFQYKeDOCfCP9c+a
	Lu7sxhg50GfnwgZhCCowyj11lk6avXHu7Wtv7Tu7eiKQ0xN8oeW3f/lsAX420wZc32RNW8gVguUd/
	hLl2GhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDxm-0000000Euls-0O1M;
	Fri, 11 Jul 2025 13:38:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDlU-0000000EsHn-0FSZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:26:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBGFGs001260
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 13:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVS97d7MJNsARObM2+ftRjP75nOmFiQEKsv7hh3XWUw=; b=V1QdnfhA44Cnyk8Y
	oiW9MnIiYE5juU9bHra1u9W53iKnCh1n/4bVHvCl4GFB1d6c19FpkesKKXWSi3Rq
	6YuToKYwvn4dR2WceBhbyEO5gu4N+zl8Mudgs8iSIKLub4J3amFDwi9rULNz9ALB
	RupkJ7Ux3KDJ+WDbmfua93FxJTxYiZCmNImjTvlgLflwN9H6ocuB2xtY1VKclnAE
	djIGakjV55DDrrKbg4WpzxrUEQXi7OZSQiqOpeVtPOpxBPavJELY7CESzOINZfsx
	Y9igsqQ/Ba3+KTgRgzbLYFrnrtEkGMj8Ypo6BaFgguVmdCAUrBcuK8eO2uk4P0r+
	29QkwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucnc544-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 13:26:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dfeacb6dbdso6644185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240370; x=1752845170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVS97d7MJNsARObM2+ftRjP75nOmFiQEKsv7hh3XWUw=;
        b=fo0j+Tt6eI5xkMLTN1w80SGGE0Oh5X+JPRN6NkrG/vC6DRiWdu5aQ6TcvX4UkB9K/l
         dsns1Ez6KWdHYWnP/lTCpswx/p5cdhLtAdLr7iVBtZpsJGTRAAEpSfIOuBRmPJfRcSS5
         sGmULm0cf9AFXDwH/1Tu1ZnFztwak/iTLkwyEEflby5qG7DR4klN0bvKLNiBQx8WNUkh
         j+ZBcuvfmuJYqxxm4dKzX6GWnKD7CRQqQS1zAnILrFBnhYggBjW+GdpJFM+AW9KbQC95
         UvE1LGjhI5HwUAQWqvS9HNp+JUquDhvX2xR3L9ohOMM28bCYIMC9E+IIlfTTwFCMkCHA
         oVEw==
X-Forwarded-Encrypted: i=1; AJvYcCWW9io+rbEPW3dE1mCVqZk8vu+366UwzIWeR3cFtu34uMS2RuqRYfEdxefP6TvipmpnTJ4po8weQIc5G0osZApY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu5CjBAf83j7IM8QWyr23ODTqaLS7K7KTEUP+rypfV5lzdMPby
	NVPc9RccBNxBCjV2p7KHasqnp4BwPmamXfIs/x2e5Hno3+JgSXyEDlEaGAYNcQONXPGee+vOVW6
	eLwsxyAylg/1Y2APNU9clr20UWwxuQjvjcn+R3k4FIL/RUtpO/Vef3MStV5jP+JabUi/qeiBIwx
	BJFNH9HQgBsA==
X-Gm-Gg: ASbGncs3IVGopTYlDkEMewshw0Cr/IGKq8BQEsftmRMOVAemLMpeDZHnFvv3SQesEYs
	oDFvC7qealPS/8RkHi16Kmj5PNU/DmG9coTqKsLeTkF+Xs9sE82jqdP0UDzC253cjFvwJIX4JBB
	hPZEAbNDIWaW75H905jTcjNu81vFiJHFhtp7pnOn7GgT2yTClASn5DcIxZstDeGZYtfKNkSqi9O
	mhGQ+K3Yjd5BbpCtzeWLuGD1+08hn8tqtnrhRYkTBfoRvMZZ48vH6A0cZ0X04jVQm+J9G/ynmm9
	wWdTR84LIjwRsoNDSU4FB/Sqa7kufrXVGuZBLJV0fS8+RJGevnucokmnk4NLvdYYVX2iypbIp/E
	q5R/CMsIfQijsEuBuQrOR
X-Received: by 2002:a05:620a:458c:b0:7d4:5d37:4169 with SMTP id af79cd13be357-7ddec64be74mr189854185a.15.1752240369623;
        Fri, 11 Jul 2025 06:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrnu8dcEhZSYwibX0MN3BjvYt7cX3AvTEFAod/2sdxyQmMhviAkK4/cJknuEH/hjlqf6Oc7w==
X-Received: by 2002:a05:620a:458c:b0:7d4:5d37:4169 with SMTP id af79cd13be357-7ddec64be74mr189852285a.15.1752240369024;
        Fri, 11 Jul 2025 06:26:09 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826462bsm299427066b.104.2025.07.11.06.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 06:26:08 -0700 (PDT)
Message-ID: <6cc5bb7a-344c-45fa-a8cc-cea34493c759@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 15:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Fix pgsize_bitmap
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
        Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev
References: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=687110f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=bnN0queyXqPnPK5F75AA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Lqfyz5CyLZB7DIIZzkTwwpbPrP5BQSJg
X-Proofpoint-ORIG-GUID: Lqfyz5CyLZB7DIIZzkTwwpbPrP5BQSJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5NSBTYWx0ZWRfXweB3YYu0Txip
 aiM1H+SVEQ6OKmAU44185HHH9ApEFd5o3PAWmYpDahTS08XfGpmrir3YBy7LlwYRKqL7Sgn8MSX
 2PWoNJ0ZKRYyPGfgpce6TXt3Xg+LpBZyPa66SnXevGn0VeQVG4UYzRVT+7Igb2w1C97U7Fe49G0
 XAPVJdSxbZ2iQdHUTSHYbTg9EG6i2S+db9XQ/4JBnfuPUjfPBMSqxYshsod6PenzKNXjzNrrNfK
 lkGQ6fZBvTxLCuoMWrQGC0yzI757X6svKJFLoFajzmqdQBvMn5VIfR7yFrdEO6eSuUdkfTj31Oc
 JI6E3pl4xxUJmtHagNDu5LkG1IGbdYLSVAS/qQ9NT4EHO7dvG6Du/L8+NLB2R43DAnAvA+1mljZ
 cQtxSZxmfJjtWXluR9wCTrX6c7GxKdxtcWTRm7Ql2RLQ4BfwGCfqaStmbN7tCZ+uPQPRaYFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_062612_217839_BD704ADF 
X-CRM114-Status: GOOD (  14.36  )
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

On 7/11/25 3:16 PM, Jason Gunthorpe wrote:
> qcom uses the ARM_32_LPAE_S1 format which uses the ARM long descriptor
> page table. Eventually arm_32_lpae_alloc_pgtable_s1() will adjust
> the pgsize_bitmap with:
> 
> 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
> 
> So the current declaration is nonsensical. Fix it to be just SZ_4K which
> is what it has actually been using so far. Most likely the qcom driver
> copy and pasted the pgsize_bitmap from something using the ARM_V7S format.
> 
> Fixes: db64591de4b2 ("iommu/qcom: Remove iommu_ops pgsize_bitmap")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYvif6kDDFar5ZK4Dff3XThSrhaZaJundjQYujaJW978yg@mail.gmail.com/
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

The downstream driver from >10y ago for this era of hardware
suggests (at least some?) users of this driver can issue a magic
TZ call to switch to (IIUC) ARM_64_LPAE_S1, but there's no
implementation upstream, so:

(adding a couple folks interested in the hardware museum to CC to
bring this to their attention, nothing to act on though)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

