Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 02:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsW9bulkHJOywC2vSc0zo/W2H3K/TyzL35br8IJ+ghE=; b=rAzitrECLhJog8sx9t/kkRHLTJ
	7ddbPCFW/1HRzuc1jXV/RhLOxb1c3BSzSn6rIYn0F6HHOxBVBcppVmbLuEelZRUhVMTur7FcjEkMD
	7/coJJVZSQbvf76sZ4RtExFJ+Zc9aAuGkE3kR8gNIUqKze5sCU92Mi/SYd0D+8qvMuEW5s8wrHQ/2
	z3zDW/U9LpFUf8hpxg1K9IQDAV6VmaR2SBOxiBXu/ejA/bOj3xdvLDeWdFey9WixJYArzGYJmnCz0
	97OcvO6/EZ8qxwP+CQMOj7u3SM7spX3S1WdfnbMEUC04S1AbW+YV41QUEkiawrEQgO+yEYNnOcbMI
	GuWb+RzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIHrQ-00000004d4Z-2Upm;
	Mon, 10 Nov 2025 02:42:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIHrO-00000004d48-0IaF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 02:42:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DUUZh736629
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 02:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsW9bulkHJOywC2vSc0zo/W2H3K/TyzL35br8IJ+ghE=; b=Ku5wY8+BGMALbOHr
	IrFXDYaZQTwqNWl0rNbFmXBx2CICaPKs56QkhacrXlnQTU5uthXGxE/pIW2htvtr
	m8OW19m37e84rtsTLKLJq9cl4GH3wxkECkyNxoB5fIF0kwY8Eij7N4lWaZajZlQj
	l+WCAxArmlQDGYxrMza34QHtTTcssTR7t/9QJOfF53mh6eAc3RoWGLJkxRhyMwnz
	F4o2cWxe9SAKdMqHXR8qWmqOqU/Z4jC4SKYkEuEAHGIRChCLSM5IyRORGiMmeQ3V
	6ouA5Gz4N+p/iecfkRfe9L5rclZWsX8f917X5QYQ5DTkcc5XLNoHOUxNQtjHw20P
	OK2VRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuek3u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 02:42:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f3710070so37976395ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 18:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762742544; x=1763347344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsW9bulkHJOywC2vSc0zo/W2H3K/TyzL35br8IJ+ghE=;
        b=OPSbSHKNpR+bUahC5vFn7nkRvjJhrVE3JbAB3871wyYxAfZAPU+NcD6uNLVJxYXURg
         v6y4kaJ5xFsrSeklxQerFriQB8M51WGf9Ys3HMRuynxkfEswCwavrrDjCmix8tTzQycS
         TvRFtNMUA/jPXzih4v2yNn6a7d0u/5RMg0GtUAiYSj8osoN/jhGVoU6+2vBzk/rmn0BB
         J+QmuDdOXnd6Jh2Rg1wdjRbN0bc+soOtGG0kakzyq056uU0d0uy5aCP9CcWmxEpEIKc9
         xJdVCGIxcqEynqyPR03q3/+mSPmQbyuxz7speuHHrNf91z0L85hvSK5vCBKnU+kDKzc0
         U/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762742544; x=1763347344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsW9bulkHJOywC2vSc0zo/W2H3K/TyzL35br8IJ+ghE=;
        b=TckHarGP0F7PE7VkEYovRxmLZKFgg5vyol00KR8I5+xBnykPb6qwg7JqMW7Umd2paR
         idktrxb42+sAwKgUG7m9geQNEiNXdO5BFPux2rhaPXER8aXLEEK7Tc7IRwYLaB8c0KaM
         VshY+m+xzWNzv8B+y7FHwdtIgak9gZYEXkbNjOq1Rjj78B4zKjQlt3jXirlViOIkH8+j
         eHm3OrB9jR6OAH56Gu94vOOTMrN2y3m/KLs4iBxHkkbac9/pwZ47if35VyN7GkES7jhM
         jcGorkKyDCXYWOBePp98geNueD2uEXOLzASzyoxYbun0+b43OmjOP/i8bkkNb3PYSAN/
         kE4g==
X-Forwarded-Encrypted: i=1; AJvYcCV1ShuP2oyRlewRu5StcOppCG3GKVzToSiC1qOMrioYbnd2kx1YqqSwtlL8Qk1Kz0G7V2pmdiEErcX33FMFu1oJ@lists.infradead.org
X-Gm-Message-State: AOJu0YymKORcFyBu0LyY5nxYFb5fxpuOffG5XssAyTMalfM51V9ZmAOO
	LUvEA+h+B8FhfecbSOdTnypqdiaHkWr0kNcLJwB4MvC5N68U3IZEUt+6DvIkpMt4HViH6hFUc2t
	GrFs97CbnG3r2oZnRLolGUtEwyj8Vllx0VFHGVTzYV5tNRIuhXTOw+kAmHj3gSW912NaaOd2Wek
	dWRw==
X-Gm-Gg: ASbGncuK6VMr6ZfJymREEhejZ1iHEzVfHFWgIkA0WkxNfWQzUE2o9JRHUpq1IILQB/g
	WBUEDcoVPb6jdj26k2G1FgPxvCytrDx2lf+1sJGcdM1HJn5kJd76IUBGbB89o/V47k1b4W1nxL1
	K95ad4HsWgDMdsv0YCfSoxJoQ0uaK4RnuupmVxdVrtVz6rm1lRWxAiL7S7I90+NPg/yaZlq+OnU
	MCU6tY1LlYyl84W3u7oaiTmY0KRSAUqPcrBp6y72nYTt9Yd2ouICXkNSyP6S0FBbjD1haTpET3C
	xrM5pYl+NNKNPR+TzPuczzGmnAxC65cjOgW5H/pvkNrieKU5SXuXxejf1Uc4a5xpZpjuwuh66FW
	C03i/36uaN8f5ypnz7Dhfpqpj9PjIICnZoIEqSsZc73vbTAxmSm1BFPZ4XCE9DFGV
X-Received: by 2002:a17:902:d485:b0:294:fd3c:6de2 with SMTP id d9443c01a7336-297e5408d00mr89906885ad.12.1762742543745;
        Sun, 09 Nov 2025 18:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NVHwCXqcL83f9zw0coAZMOtqfj0Uy6PSoNGjLNcOLPwcx3nLqWE6a1Jjg4u4EQJp4JwPEA==
X-Received: by 2002:a17:902:d485:b0:294:fd3c:6de2 with SMTP id d9443c01a7336-297e5408d00mr89906185ad.12.1762742542978;
        Sun, 09 Nov 2025 18:42:22 -0800 (PST)
Received: from [10.133.33.229] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297ddde1e7esm66639765ad.77.2025.11.09.18.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 18:42:22 -0800 (PST)
Message-ID: <30cc9d63-72a2-4dbd-89c5-d3a84e5a36de@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 10:42:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan
 <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAyMCBTYWx0ZWRfXy0/TVMSkLIQi
 3Q5R/pqlbf9X1JfzZ5MPYI3McxyEsl6co+bKxd2munnYfJpB3lRbiOnkszxFr/4SvSvUdjUB5co
 3WtnOae3+RELL8JB9kDiujejJLvIlttqvQi39srnXiR1XDK3gswFjLP3Jp+0KnIFZ2T2KiIjJu9
 i115YpO+bQ8IYUguXFdUAA7/9fkppIDqBw3EgEA59MKwLhTMbK6+HMiETAUVpBbHHtsRTMYzBkN
 b9NfHfiZXCjhA28gss/Xc6yxzcecH+/7NloX3QQUCAFZKMP+/S5qg8q85t0lMRaj+FIoJ+9EXTb
 32MIe8MNPYCFvH82RRsHFOWz+il1ad2dcoUmmDHruP8kANIiHSi4ppRd7TuoAXd7qnaf02x82aS
 +HRlotzaSH6XxY7gqRRMNj6gq5wxYg==
X-Proofpoint-GUID: xKTWyZ8SyH5zmYC-EITAfOL6j2wgX5nX
X-Proofpoint-ORIG-GUID: xKTWyZ8SyH5zmYC-EITAfOL6j2wgX5nX
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=69115110 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DxhRIveLkXWR0EuVxScA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_184226_237819_F9BD5160 
X-CRM114-Status: GOOD (  14.18  )
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



On 10/13/2025 1:49 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

<...>

> Enable both ETR0 and ETR1:
> echo 0x10000 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> 

Gentle reminder.

> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
<...>

