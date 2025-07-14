Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4573C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoI5BFClgTcyFuK38F1KY+FhVdU3uKRCX2U3iUvC0Jg=; b=R7j9OGWhAyYcuR1oJMB6NNUzy5
	Wh4ZWUtM4Pbht1Y8INBEwLc5Mu9WmwGBg5eOzyeoi88DYyKqMn8eh9cE/LvGWlbaOLmKhxei099xk
	Wkeu8cJNqKTwB5Q11IcLJn5W/k0qiX7pd+nkhZ+cjZG4g7I9SRbH8eg+M5bY3u2nU995p56dyVMYy
	ZR2P01+trY9V9J5ewcwCUmnK+WaO729MtpAu6feruti1DbtGsu1bsToNVLJxlZ1hHTQqKUNZXee9S
	XURQ5PAYohvOg8QJL6AORQlMLiZTNFm+mKkRA1yD9bW1YTToWonaj+VNGrHXjkC9tBurerHSRqGiR
	Q262JT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIOw-00000002BKg-2ujw;
	Mon, 14 Jul 2025 12:35:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubI55-000000028X7-06OY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:14:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EC6apR003161
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 12:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aoI5BFClgTcyFuK38F1KY+FhVdU3uKRCX2U3iUvC0Jg=; b=ThsZB4SNBrInD9Wa
	YmyWGrc2zGW9ciktJh7xytNgsEEs9g1akgkAuE6v+vHjbQTGM0sHGQy7V290e7dp
	15BBbMalNS92yhJdQzs84fRq0Vl0SXMXuNnL3RXxDfzWTxWjVBRKMiA10EpbkkFJ
	9XIKUKVVC8n8W7W+TsIILeQx7tt2ULLhBv9vgwxicXaoH8LCBpIJVOJ8u0NkdZ2A
	7sfng5mMUW0G4TS6rGT6gAwnB3+TuCrlNFkSlDdQrQcVmm85sVVmCJ+Bio4YJQC+
	on2aWSNC5m5HCOdSKchJoEPbUxIb8FHfNetrdbYkRLgOko61vPn3LAJ/e/wUJoOB
	ls6Btg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0s6p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 12:14:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7df5870c8b1so45589185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752495289; x=1753100089;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoI5BFClgTcyFuK38F1KY+FhVdU3uKRCX2U3iUvC0Jg=;
        b=em+23zNWXBt0rJJIhOejsysT9RyBk1tWg4uuQ9exOG0D51MrMsJs7uZJv7Hxmcjnhn
         zv5hWgygxVpasG299l/WQrmhNJFA1Eb84BNBLvWQmlBUb6KQONiH511OHarNGCHYVsky
         y6xrWStb87qOjcDdS69aoJagP3kX9NDpzekM0/3LN1pYbXvu/WVj6NxwmD02+gvhicRy
         vf+YVrhTfM/4QwhcR/NdDUu2WNxYlQGWsfoBzKYvM+IO3AUTer72lQi+xbYLhtUkW8Xq
         vRZOXOzyje3e3IjHGAV+XWy2nNOp7u05tFD08DosiEhmvMUalYwi4EWbBdkTaHN6zID+
         YbLA==
X-Forwarded-Encrypted: i=1; AJvYcCWAm8biOt54w8vX8DUkoJuU4GTj4+Ge67HLzObqEKHZInIwpEljTS4HPb2BwQuXWo6U464IMhe8BZ4o+z0xjpyT@lists.infradead.org
X-Gm-Message-State: AOJu0YzgA3zmyeNZ9nHSR+Du95ewGWTkHnDBSg91POWIM+JwtKF/A0EU
	A5BEvB2jLdXJFFJpXe7oOClhQMv7foaylIWiE9x/IG6KIyqetMEcsoxBLyR6ApOixKklg7uj7ly
	LEbygQ4EafZjifweHcBnaCHsdXGRfRbF2Sn77Xv4ejxDkxdyva9CItYl+IcR6cNHCra/XXhmgAd
	00sQ==
X-Gm-Gg: ASbGncu3UkpNOFdiHSMdZtnpKeqHaxDOxLaZMBE6G+eLB0kpPEUi3b6TeZ2CKECJerq
	jxEKlT637Pnx+vV3f0zAiaFqhEvqBtGVcNVs2/Auxs1vcHMrPUpLyj79zlLn0qkI1jDfzQY3s4d
	gao/Rl6ioMeNxFbBolM8ycleg4WUnoE/EdVY6MVbYIfGhxT2KoYKJ32qc44IuHyoOtKtyNjdF/U
	tZKTt4mo9ARlC8ypdrkmBU4IT+qf2lFNvSEDARo5Ybkagq7HgFFOtgMmtmS6870VDLUbRU22Mn6
	ubzPGM2MNVnK8GSWWD1W61k6cwd54382E1V4+VwhwBJl2+m9GQiA5lLBNwXYmvr04G1caN6nIB3
	E8OhROtEqESbCilJrXRXt
X-Received: by 2002:a05:620a:618f:b0:7e3:2d1d:bda5 with SMTP id af79cd13be357-7e32d1dc30fmr94699585a.9.1752495288908;
        Mon, 14 Jul 2025 05:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG5vZyWrc5c1Pue3RENiHkc+kjzDktP9Y1RxdkTc6cDgp35ovMXQ//H2HFsJEBRaNnVMnwSg==
X-Received: by 2002:a05:620a:618f:b0:7e3:2d1d:bda5 with SMTP id af79cd13be357-7e32d1dc30fmr94696585a.9.1752495288322;
        Mon, 14 Jul 2025 05:14:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8298f85sm824827066b.144.2025.07.14.05.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 05:14:47 -0700 (PDT)
Message-ID: <45e6873e-adb7-453f-abd6-c7b6620c9b34@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 14:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Fix pgsize_bitmap
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
        Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Luca Weiss <luca@lucaweiss.eu>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
References: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
 <6cc5bb7a-344c-45fa-a8cc-cea34493c759@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6cc5bb7a-344c-45fa-a8cc-cea34493c759@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2KJ2uegJoyH3VDkTQ2X14GvYeloKjrHn
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=6874f4ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KKAkSRfTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=LZJuRBUwro2lsZWipJkA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2KJ2uegJoyH3VDkTQ2X14GvYeloKjrHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MSBTYWx0ZWRfXxg/eOI3USNC7
 1hsm1siSCTracYv+PfAyrS/puY/m/7Ck2iYp0X6u67XudmeizAiB5n5cjHjQDRe3UJ17iQ6xjM6
 ZNwrVoLuMqMAV6eIjX1lMnQLAY8DihbTQ6U7v2gQUMFJgtA81r2OaPd2aMRfNYDC6uVSIlmkYyl
 qv5B5TKTueryUNwEZ4w31zyQgfYNscJCPGjNACxu4mxZuGm8/Vo1XGPvhU754a4JXKewmbYWfR8
 xYCCU4MhGPR3l61fmVvc6kvW8yUqp5ffZseIoctAps96rJiO09QAYFa070E9By2laVmdMVLt7uy
 nJCd8N/oVZSB8bsIctN6Sj76VXByaY4KgIkY31qXNwBqn1U0URC25DRvBaJrSZjacQ0yqHksZb0
 yJNpediZCzpuKfkjPm/1110gI4QNhz7F4WJvjaK6p+uZnGSK15631kvYuLvGJ9pKDpKdIb5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_051451_076094_030D98D8 
X-CRM114-Status: GOOD (  17.43  )
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

On 7/11/25 3:26 PM, Konrad Dybcio wrote:
> On 7/11/25 3:16 PM, Jason Gunthorpe wrote:
>> qcom uses the ARM_32_LPAE_S1 format which uses the ARM long descriptor
>> page table. Eventually arm_32_lpae_alloc_pgtable_s1() will adjust
>> the pgsize_bitmap with:
>>
>> 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
>>
>> So the current declaration is nonsensical. Fix it to be just SZ_4K which
>> is what it has actually been using so far. Most likely the qcom driver
>> copy and pasted the pgsize_bitmap from something using the ARM_V7S format.
>>
>> Fixes: db64591de4b2 ("iommu/qcom: Remove iommu_ops pgsize_bitmap")
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Closes: https://lore.kernel.org/all/CA+G9fYvif6kDDFar5ZK4Dff3XThSrhaZaJundjQYujaJW978yg@mail.gmail.com/
>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> ---
> 
> The downstream driver from >10y ago for this era of hardware
> suggests (at least some?) users of this driver can issue a magic
> TZ call to switch to (IIUC) ARM_64_LPAE_S1, but there's no
> implementation upstream, so:
> 
> (adding a couple folks interested in the hardware museum to CC to
> bring this to their attention, nothing to act on though)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I never actually added the people I thought about to CC - fixing
that..

Konrad

