Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D525FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4J2fuae3WtqCQsD2Ch5uOcNOvcZ88vUrJULIKtoGLw=; b=0eACruoG+4eWtxEfFVLG2ZrJhN
	FuGAIqkUyi0tyFDSaUup9Xz1sUqTgtw0xKJoS7CKsbmcboRl8q3L5mWl/CdiY298NYcS6Coj/WFmf
	W81+M6pDDn+Cig7Yw7Gt0MDSPqbNmi0Il2cYe2Z2HJN6K64v+U78bJt2GXwsnks9l1hEPbjNWrx/M
	uxhWsIzoZsPpA3V5LzXqtidEgcrBUpnhQQvu+apG09mymGRnjPFFNyqdbwfkq/YmoeTQ+t2SFAlCh
	hYWApRZweW3ZeR9PgPq7S8daHuLHs1tHIrDt6+8AclAfDtzVhfnriexEKeNFT/McukbjE7NRmdAlP
	59TuPu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTjg-00000003fRU-155v;
	Tue, 15 Jul 2025 00:41:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubThD-00000003f1T-1Xiy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 00:39:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EIhLj9026577
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4J2fuae3WtqCQsD2Ch5uOcNOvcZ88vUrJULIKtoGLw=; b=Sg6YfY7cEcPwyjdY
	j7+HmzlNxRlH2VT+HNZGcOsEnDWajo425i72yFUI3zrbStmtdDAQ0BLpxfwSr/iV
	dbLxJeUOqYDL6JxjrUjeKHTjVobzSuZgDmWOS5xMqDwUC3e6NMaREdKpbdvf5RaP
	y53boJhuXuSKF6ZR8OJruUWD/n2KICnvyH9GiNjOqU1ll1f3EQKISmwFEMnG5sYT
	ezbLy8XHWKEAkNrWsKcf0de/Nzc5KPkuqLiOit4a66TOUt3Qwhx+dgOcXAfb2LOz
	tCIibojLKJPgcLgKQjs3jnoAy8GtG6vYx6LVCLqwMyxgmKGNMwOVpg9NlKWF5Uh2
	c95pew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbe8wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:38:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31cc625817so4796416a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 17:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752539937; x=1753144737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4J2fuae3WtqCQsD2Ch5uOcNOvcZ88vUrJULIKtoGLw=;
        b=RN0k0p/VsWEf/AvItnNz2j82m/1cCmGOk6A+UNitAa+6p80YIKUNTl2uLMbaVAVK0S
         l2K2OvmNa9lxbOoTP+kE1Kuz3EIklHaTjIoCQE/7kM19mMnrt7qTNpMfLV2CcPVN/noB
         p3CcWk7hXHLD2zzj8aFPXQBSvOcrcSN+hrG09jZRRMoSikYA5yW3Uh5uNa+1R55ly/Qr
         upbGemvtYboc2wDOv3uaxbA2Rr9h9MfwgPSrPIcNEdba0ihKadDWOvtYVQrv69YVI09b
         z9dCqO0UqBep3YxMbTa+pV76YpRutxBSSl/l8pU2vTh8lRTr8bW0yRf+qI5ZkHrvlVDN
         9vGA==
X-Forwarded-Encrypted: i=1; AJvYcCWNA/qj3uC8vSI3mKFhZScZnMH8s0V6K+/n3v3UQkyIAdCUNMuy0NlmbcKvFDVDZj4R7nCHpaVoW0vuqcNIaVXB@lists.infradead.org
X-Gm-Message-State: AOJu0YxcoNdnpRrsee9AgCCpDVJ/eCCTGLN/vy+bAZPJ7Y9bWElhv08Q
	KS3vMrdtVQuYq2zyLfBoCQsOVtsAcHuJPiy6vxPng6zgDQrteeM3BNHoyUAgP/b+dDSK3srL6Tz
	ZlDZKhgHJDA2sZtckBWp0WNt2N2kUdZXvQU6hZ8iyOz2VpUF8HMh/bkcG7OpTjhsQwS8xLkrd2N
	1KcQ==
X-Gm-Gg: ASbGncvlfGhcevkib1EaehQOtCcfhUXeu/9ulB/UuM02KeW/rjyFbUmjaE9zTo+Hq8q
	8YmBvdZ4a0RH0xyqYwNQRXaByO9Kh+d1XFwOstk863cX7vQoaT2aGrTibmsjIoWoa3VyzG21hVc
	PGzFuMMFCSqjkEm9/TQFUf/DwA/XFT9Cxeu7A3QYGzfrFf4mvQxQLTzwheAZtDljk4MHLgP1lIz
	KScAmzC4OHO8BMDexUjEWbUzc39Iqmgav0u8uyayhVWJUT0l8jkLbPrZmY0w6a6LXcqLo4uYseR
	HsxPG11ArT4q2d5T1YNWClSGasRfitA0ovxW/O0Vg4f65paUQEPunxmojxAeAK0lYvQgTc5i+0G
	dGuH9ybHvdQNLQHpJ/8ZgcBzA
X-Received: by 2002:a17:90b:3c8f:b0:30e:9b31:9495 with SMTP id 98e67ed59e1d1-31c8f9bab10mr1778275a91.9.1752539936793;
        Mon, 14 Jul 2025 17:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDza662yRgiFSwwfp7ca/WsrZ50+RlnfoSXKRcgI8DgPoMrM2ZRqD6pgfsoivNJPe+/C8jWA==
X-Received: by 2002:a17:90b:3c8f:b0:30e:9b31:9495 with SMTP id 98e67ed59e1d1-31c8f9bab10mr1778237a91.9.1752539936298;
        Mon, 14 Jul 2025 17:38:56 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b22sm97642945ad.98.2025.07.14.17.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 17:38:55 -0700 (PDT)
Message-ID: <a2136746-a9fc-4bb2-a7af-7e7cde5068bc@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 08:38:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Jie Gan
 <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
 <3551dba1-0c5f-4000-8b95-6a04cd81a027@kernel.org>
 <2e8366b3-c060-4bb8-9704-0a8f41901706@quicinc.com>
 <9c11bd92-ff2e-493f-8e71-fd8d3f8b32e6@kernel.org>
 <cbfb9159-1c80-4db4-b5d7-036980a1a44a@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <cbfb9159-1c80-4db4-b5d7-036980a1a44a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAwMyBTYWx0ZWRfXzYnT7XwhUIMe
 Bl+YodsK8NpvUq/m/c+SI0QuW2TGMwoI+UM3iN0KjanWDlhxFtSxmsJdzSY78TTEQJt6jo9Y3QM
 ZVMWgL3ocAsAo1yEHoO2P9ndxba6tACe2d49Q4JW1frXS5M2hZNmlqqk5qgzyJVhbgv4v61no6G
 bGEYckLiOEOBj8edc4gvcALEws1Zvpnj5Lx/EYn/zGU2HSiSAgsVQYZJ+5B/TKZPSFTkOir9jm4
 cQ15NcIS4IGocd6p7yihLoyf5crhXn+sHl4hZ7Ioiawk/EGMF91q1KpXzGoyNcICduTa2uTwvYm
 7CWgkI2w7FREPxyL8q0lJ7UdjIoP5roFbSa4/ZYNEBRgAm0e6Tpci1BYny3VaC6zGKxj2Fw0mBh
 2OG6k3rtZMiNan5/wQZquecQO74qXUt7IgATPrw6TqG/QjKfSZN1qS8B5AZYawk/3+5Ij0uj
X-Proofpoint-GUID: xlZbyda1i_Yaz6u_6y02HRSCL_dnEhTI
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6875a322 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jiYdY7Ay7elLp-qxoG0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: xlZbyda1i_Yaz6u_6y02HRSCL_dnEhTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_173859_549433_C78848D2 
X-CRM114-Status: GOOD (  16.03  )
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



On 7/4/2025 4:14 PM, Jie Gan wrote:
> 
> 
> On 7/4/2025 4:10 PM, Krzysztof Kozlowski wrote:
>> On 04/07/2025 10:07, Jie Gan wrote:
>>>
>>>>
>>>>> offsets for the ATID and IRQ registers, because they integrate the 
>>>>> same
>>>>> version of the CTCU hardware.
>>>>>
>>>>> So I propose introducing a common compatible string,
>>>>> "coresight-ctcu-v2", to simplify the device tree configuration for 
>>>>> these
>>>>> platforms.
>>>>
>>>> This is explained in writing bindings.
>>>
>>> Yeah, explained in the code lines..
>> I meant explained in writing bindings document. Please read writing
>> bindings first.
> 
> OK, will check, sorry for the misunderstanding.

Hi Krzysztof

I checked previous comments and document.
Can you plz help to confirm that we prefer a board specific compatible 
instead of a generic compatible, am right?

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>>
>> Best regards,
>> Krzysztof
> 
> 


