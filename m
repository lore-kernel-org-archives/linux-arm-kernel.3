Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C5CCD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=; b=0lLypD0+uzHBnLUaJLtCQJ/uTK
	tuRq+8tl/whPt8nMikzfhtypWyRtXUoQq0VUUr47SjdKEnvYiJGjtuFP6SHElDard1VrlvnhFrKzH
	l/ROn2b2vTNeq/bSgjPK6zh7pox0LPhY9mVSw9/EURw3oinrKeBMxcOjPglW9gFOoxub+DC7qKLHX
	sZjGHvrn2E/1yrgvm3I9PbRH7bjGHupMYW0mefwGRNNW+GkPWvfMQlmfZkpVVx1L4lH8sVZ/G2uol
	P/AwR4iURxCC1/3tQP9KYiTWYESsfGy2JqntbS/RasWLFS4Hez5u/+YVIjj+ogvBdoWrGK1CYgv4E
	BEU4Q7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXnU-0000000AZxI-1Ocn;
	Thu, 13 Nov 2025 13:55:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXnR-0000000AZwa-1q51
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:55:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADDI0BN3764325
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 13:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=; b=J+LpV72SJATiLwN1
	sdxH62ruSbqsh8Ic+tb9+6OSbVfKojMtQ9Hy5e3qylgM3nE8Foxy+CMV7PJpRfl1
	9g469/SlTULJgYFUJ4FXrskSFLr/XCjU2JraFCHDLP+TGY0iYzHgS3LRBvGEEWAr
	ZegyHa0zEhrMAw2K6xm/0oiTYFw7++RJodiCPb7V6hWkfD8qF/zbEDCeT2xAHJNE
	Vpp530YmDV4Q/TXy1oR6ixQ6necnTQFHqsueeVhAJM4BgEIwZz+SHQhaiPEOeJIn
	MVOnfZuQF7iifHbRAVX9Cy8RdR+57iBBe+PrcffE4p6GZFYo3BmKYmkX1r7z5zi4
	P5JNXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn1drq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 13:55:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dfae179bso20809245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763042132; x=1763646932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=;
        b=du9Fy8/4tKX5Lch1zxTyXEaCmxqOBP+Hw/6CxrihIqs0kH6v/F6eQ/QexVq1JZRTj+
         3HISL2S1+5xkC2OUDRFhoVbcdC8PmNcxokAavHWHWFg6UotCLgRPbvZnb4wlf47W1bTw
         zE1ZxQtQU0EMY1QihdoKfZl3VCJgJir2jGo7mlfG4bjwo/A4wsGazG9Q3LH+d0FV6LjL
         CDdShlZVnZ2eS79TKk7aiOfEpE0se1YZ/UN422CTDNlxvXXii5A3SQ4JudmuZLDhH/w5
         xdGxO34VIYoTKUXuTPCUJmk2jRYDKuL+LTbdus2g41U8/1/xECOLhM0RTBLdaXnIot5Y
         7dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763042132; x=1763646932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYq90gPok05Ftan3q4LlS4ySOfx7eLDR6jvQPaWFLaI=;
        b=SJ1VPvnVAYz2J3wbsK1lxraA07xyz/vXYDCyj5qMSye8zjtVO0VCyF//oRZ7l5od0I
         ZxemVv974E6y9ZRqyNmz4kD2bxbx6llLfC6wC0VXtZJbio6eLNPfwT//yQDojSsLznCB
         jCkHsBRuEgO1DLtcfo9KC+dbjv3dRJsr8zqEmejKK+pUCHvcvIgyb3zxXUSiU9GM27VT
         txqFaOSxjQ5xtqOaJ6WpYCXrNE40oNDcDbjPCDp82YVZ4vukdmvyjZHxLcSu08sYJR68
         WxGDtOkCNJyLHgJpJay5lmxGFT9GtrJccT5Zxbf8en9r/T/RbjQrzkcJc5n6gYx3puJt
         nVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVVAjoY6slfyV1J1MO2n4AlCXWWhd0o+C6m8wiDYU/HYC7LunpxE7aMfnHQi6M02wqCJlJsTGSzVljynXB0tSX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Ia2V26ydHXqu/5GlhaVpvtyjskLHRUMDRxmvsfTn8lNux0Sr
	nYi+PA+8ffKjwGGGuU3CyBT5KVz/yXcTWCq/cScaB4KqjE6BbEqgTGbV/Hi8Xmgq2KyZOsZ4Bar
	nDg7DBU4gRhBWcShFwMQosnGuYJRArfFM9LNP9U7Q5wR5cx0yYDiqxVDRkSs46+QH5KCUb0SCco
	7ujQ==
X-Gm-Gg: ASbGnctHg6G0RSOydG3xAeODCQH9cGsFocNjl5bc6tfkk3GXl5SiGdn1qJpgnbDSGuz
	E+9p5f21+Mo1/9qVULVXY8tT6ihvknuzwD7mMRaxiAQ0r6XUvElNBPnuJksa8d67Xw2yc8JKwtd
	NjauXLRoc8QqbGlRuPv+1z9JXk3XcaQOFOcJ+cQ33v/1K6oW8vzXbDrMigjNXBS0lutsAdmqQRb
	NH10LzKVjRpobcsI9BDm1CxX+cwCHHR4ynZbFGYm0oXIlxsKa3CFxZthvNQIuRejI/bRTwQZLms
	EvBBh6wCw/lAhah+joVz7huTAnSoQVIU6u9tFp4yFHRLMfSdiJib1xRrG4GN+6LwmaK4mJnFL4r
	JNqgNFoCUtfuiwELJBM6SxrnOHKxE
X-Received: by 2002:a17:902:d583:b0:295:592e:7633 with SMTP id d9443c01a7336-2984eda9ademr94497335ad.29.1763042131771;
        Thu, 13 Nov 2025 05:55:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1ffqRPXlTOuOE+KE3Wz2kdPEseeGi4tLYYplf2iHM7EojlOZXfQ+bTEJ192e9zzGd1U2mQ==
X-Received: by 2002:a17:902:d583:b0:295:592e:7633 with SMTP id d9443c01a7336-2984eda9ademr94496775ad.29.1763042131113;
        Thu, 13 Nov 2025 05:55:31 -0800 (PST)
Received: from [192.168.1.5] ([106.212.255.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm26803425ad.36.2025.11.13.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:55:30 -0800 (PST)
Message-ID: <1db3d7f5-0cdf-449c-bbc3-dc40c89ab27f@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 19:25:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
 <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
 <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=6915e354 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=pJoDNl42m32kJ7anCML+mQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UTFmerWDhw6whTtWHmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: _CFes4_gj-Rl7H-0PYqONNVs8DqDCGHz
X-Proofpoint-GUID: _CFes4_gj-Rl7H-0PYqONNVs8DqDCGHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwNiBTYWx0ZWRfX8dUvTvLKFs3d
 7KpCMqAJF0vEwpLZRf0OTMD3hdZMYr6GYtZ/9HsiTniTuDd5pJ6r8ODcFruV8Gu3EZOw/dixLqg
 szW9JVo7lc6a77WoL1KfG6sMNVEHVlAPBrH7EttKEBw5+GaoTGTjGxMpln93iCxoSAmCcAxKaZC
 f/a+h6ZvPSPUFULjJhvnbq9OnXiefekPz4bm7Z9RU08srMZdGHqE8Vwxn7/UF4X24alI++WIQLK
 wHRRfm6+kqwYnWcGZig3Rm820BGPLlZgguc1Tk2WuGKEf/w43WIHczez88R3e6MH4v5WK8B9gbX
 11aasczyYXGDyaAVnAPupKDBywohFRAQEXNT85VcFaqKcVUF+RGoe7zB32DghcA9CBoPLb1Lz/n
 WNoCPJV9wWoPe4VfAocDfLCKlVvLPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_055533_492485_4204A948 
X-CRM114-Status: GOOD (  15.05  )
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



On 11/12/2025 7:04 PM, Konrad Dybcio wrote:
>> Hi Eric,
>>
>> If a device has multiple SIDs, all serving the same functionality and grouped under the same "iommus" field, for example:
>>
>> iommus = <&apps_smmu, 0x2141, 0x0>,
>>           <&apps_smmu, 0x25c1, 0x0>,
>>           <&apps_smmu, 0x2161, 0x0>;
>>
>> In this case, all the SIDs will be associated with the same context bank. Even if the three SIDs have different ACTLR settings, since SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will share the same ACTLR configuration. This is why we designed it to be "per device / per compatible".
> Does that suggest the settings may be slightly suboptimal?
> 
Or it is limitation to use the ACTLR?

> There's some work being done to allow more granular association of
> the passed SIDs:
> 
> https://lore.kernel.org/linux-arm-msm/20250928171718.436440-1-
> charan.kalla@oss.qualcomm.com/
Sorry, I am unable to link this limitation for actlr setting with the
work. Can you elaborate please?

IIUC, unless the SIDs are totally separated per actlr settings and
attached to CB(which are limited), this can't be achieved...but may be a
question here to check is it really a __valid__ to associate a different
actlr settings SID to use the same CB?


