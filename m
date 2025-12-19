Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BE2D74951
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 03:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x56mI00illQfl6akd6y5SiCn/TcBzWlA1UnduG5C/0I=; b=Epm7dr+DaAHHpQPirq+cOwQ8mo
	IQEPVWG9qM8rm6oFrXQaQdXyKfMKi8Em34yl08qHZVEX4N8RJBgkswTnQveuaFHXAOqyhlfXlRMVc
	0HkyNlhBdrq2p0+aDhvafJ2FVD8Wqc+1l3OmYuVNGtX4yK0S5jUQ2W2AKED69vVTPyQ977Roe/mAO
	UaQOB6LcZGk+h2K56ChJY3q2+eM5VXwd3EMK6zpZCa1gK74fFPNduz7fMfJqUs83lDPpazyZE1Gvp
	hNNfm59BOUPEPsI8b1o38mcIKhulSi4zTRxNP/XhEXtDmXfMfssXca2zbzzQ8JrzEq+YHNummCxCF
	xYWSQ+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWRDn-00000009YB8-2U8U;
	Fri, 19 Dec 2025 03:32:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWRDl-00000009YAY-1Edq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 03:32:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2O1GD3858024
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 03:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x56mI00illQfl6akd6y5SiCn/TcBzWlA1UnduG5C/0I=; b=SiAmNsNo2l8e5oCT
	BefH1n4w1tDlpfDUu2PyKVNGGlhNMP7CesegN4NZhBMfqteTbURIkoYxxhp4oUWo
	yuahr3gBmtzCY1Nv8DYLigBDRAMOElcHdnp3Owc3/a+3v6voNSJNW3OYzXHN0jgu
	ltRYR72xMiJDYE9okt+buUu16ekLEwWEZVVOocX2iaMegRG8cOhD7PZDITAAitz7
	M6PwLuJfRfJ0uWJQhMyl6sn8eIWEibX31ZlJosg4ApyIvHeUZ2B7dLQbODwtspno
	ELpnWtFMKSeoIJZwQIzUUMOPUP8tJFkZ7FBNPVbtkqXV7itA6SZvOYXuU6QC2Swa
	86CnZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ds1y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 03:31:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso25443895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 19:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766115119; x=1766719919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x56mI00illQfl6akd6y5SiCn/TcBzWlA1UnduG5C/0I=;
        b=Sj7lUO8Xph9PHFKFc2K1WNUVMM0Z0GY4aK+eTaclxRD8CRMgFivXX0sdKSyGcsA1BG
         yV0/IPcERbojq1xCfRIk3teIDmuOsVt/poXYsP+BDaPYy3Xo/7KhZAE1jRggACYN2OMW
         DtXe0VylYv7/KF1OPLMZ4DDCraaIs7iRIXWnJFXyOBJAF/A6yJuEK2kC4LEGo30hS+Rd
         stLVeNb9ttG9KRNL7D+FQ4UU3/IC2hUvtLsMyLaIJasoG3qsqRiYKUNiph9heUjlq19M
         fID7oDdnwZIWTKZGK8NmdqT8G9tvfokBjQQWH1qL8bJEjBFh2PYl9XINMTYovlWXPMf5
         pHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766115119; x=1766719919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x56mI00illQfl6akd6y5SiCn/TcBzWlA1UnduG5C/0I=;
        b=f11Ph374BTTsql9E67IsQ2XPGKgo43joy0Ls+BltzjfmISSLpaAZ4jN2czX3Hy4116
         O5KBh1i2Yu/3YemdZDOuoz7U5dxyfcIc1CylTT8QmYJkY5r0xQNBGN8VgG+bhiidR/mk
         bfTaNiE0CorG5yVod0SYMe9mloZYsuS/dB4a/LbE7bApQtn4VDlukVyd7fNp4J+lEYS+
         g0Dz//3bN7fgWEpnsxzSRQqbwS0VUeiFCyHukjSkKE/AuEc4WvKztpsYKa0dvdtyfida
         Z7/fDuiDYTZ5EjeqObAdycgpyS6wMNwzZsMrAR0gEeEo7WHeK/LkNsFNBevHnX4zpu80
         QAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDNzv35HltADOlSZyPeqBglzIN4WBqcvZZA/rQ6IR8mv0j+pU95LENdgQfGd3Ffx8PSf6h0rS/zSoAOubC2jxf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/XfZzhrcl/N/kunMcR+MkbUZnpsQ+fsinUydSMUAZ0dss8+ZL
	/pV6dnlFG2ysLb4kXABYilne4TWpcp5q4g6SNglG3yeNKQHvKBulF6bgrq1CNGe0xVI7IpPyCJI
	6lBcIeK5Jnd8rAbdvbh7yA0IA68drK+esKGxhgfH6nmsSZz7WWAPlr+6zLG+6eg2SDfM+hUU7uy
	kF4w==
X-Gm-Gg: AY/fxX7ae/EggkBWPsjz7Y2EDK9wKsXr23Ixc5y0k6cLCseDrWDke/EIr0eeNWiAlKh
	vaE4n24Q9u3hiO2qnj+3SedZS9ZvpRTcBRWFUN1NL3JCw0TA13OEPGwgGyO+TBQH1gBOORylths
	v/iz6y2/KhOaQwfJsNhxZ3zFvLcpYH/ddrcKWIKtDF1T4bkyPYfnMxquXzadWjGJzuWfDNc/9l9
	pAh+37EPXMShVtu6nHo5CcEbXL5p7WkKbvY8mhka2lSv22spBSQd+L8+B5kuxhpFyErTVZvstWl
	323D2WW//hA904d5ZQ0UKNpCHTCRnL+2/CmicDeZgOXQVSIEifAYEkLq2C/tLHjdPh8Z+erYKEO
	cpn9zlNnJ726s9gBVrGc+AWzQbbk4pauRgI1PyUveyxirGLQSyvnJ3WCQyhUUfJSfMCrDJJ/FlE
	s=
X-Received: by 2002:a17:902:e808:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a2f23277f6mr12926535ad.24.1766115118404;
        Thu, 18 Dec 2025 19:31:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjXE0gcT+I/3vqOt36tBsA13k0DFicCrebhOEGFHe67ozPzsjJOg7E/124merh6ZejBtJKhg==
X-Received: by 2002:a17:902:e808:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a2f23277f6mr12926245ad.24.1766115117770;
        Thu, 18 Dec 2025 19:31:57 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d20dsm6838525ad.67.2025.12.18.19.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 19:31:57 -0800 (PST)
Message-ID: <f049f546-5df0-4d17-a025-e1a46eb035fc@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:31:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
 <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
 <a785ced7-95ae-444b-b8ca-b40aecb35230@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a785ced7-95ae-444b-b8ca-b40aecb35230@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6AHfUi6vj5OrIdjqLDSVIyE_yWGYB7T4
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=6944c72f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CvuRUKyVQJBZ2Q8Vu1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6AHfUi6vj5OrIdjqLDSVIyE_yWGYB7T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyOCBTYWx0ZWRfX16Pb69RKBvSJ
 ThHpTYqPpvGNEtlUQ3Bdgv6Kz5rKIGk9D+ZyHFqTYMjxWaap4ThRhJYfHxwSBId30PK36sP5R23
 M/4ajf7bkNkQ5B8fB+epr+x7erz7/CcjB6y/7yT2zouRsl3soB2Fb9DjGACeOwk7WDQH1uayCG7
 4JJhMkbcMoWT3PIrXSob3soEgfcg5iL7lvZotyztyrE68Q733EDqQ7lNEKqANJIcE+xHpHpGFHj
 KqiEVPoLnFN0rsoJ6EaHpN+vFigrMY0ilciIsDTV9HYDjtkCHpa9HfLYy298h8Yx+/5AI9hc7gG
 b3ztA4NpB74DnY/9S2vnhCnVp5fIrIRuJCahxZOJSx6IjCh2+wSZMGD6QCrVlyS1ZKore7qz0V/
 nHKb62YKxUjjwbWovfNvLOB+DlbrwsLSAGGxJp+qW7V41AKzUdJPn7+nacn/Kgf69sfc+dxnJ5z
 LlzplYfcEQJNcLerKQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_193201_479653_A68CCE8B 
X-CRM114-Status: GOOD (  29.78  )
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



On 12/18/2025 7:10 PM, Suzuki K Poulose wrote:
> On 28/10/2025 02:02, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>> These registers define the characteristics of cross-trigger packets,
>> including generation frequency and flag values.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 230 +++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h       |  27 ++-
>>   3 files changed, 299 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..80e4b05a1ab4
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -0,0 +1,43 @@
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_async_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger synchronization sequence 
>> interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FLAG packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FREQ packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable the timestamp for all FREQ packets.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_flush_req
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
>> +        global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
>> +Date:        October 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>> +        Value 0 means raw channel mapping mode. Value 1 means channel 
>> pair marking mode.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..a9a27bcc65a1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -147,9 +147,37 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>       u32 val;
>>       val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    val &= ~TPDA_CR_MID;
>>       val &= ~TPDA_CR_ATID;
> 
> See, below.
> 
>>       val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
>> +    if (drvdata->trig_async)
>> +        val |= TPDA_CR_SRIE;
>> +    else
>> +        val &= ~TPDA_CR_SRIE;
>> +    if (drvdata->trig_flag_ts)
>> +        val |= TPDA_CR_FLRIE;
>> +    else
>> +        val &= ~TPDA_CR_FLRIE;
>> +    if (drvdata->trig_freq)
>> +        val |= TPDA_CR_FRIE;
>> +    else
>> +        val &= ~TPDA_CR_FRIE;
>> +    if (drvdata->freq_ts)
>> +        val |= TPDA_CR_FREQTS;
>> +    else
>> +        val &= ~TPDA_CR_FREQTS;
>> +    if (drvdata->cmbchan_mode)
>> +        val |= TPDA_CR_CMBCHANMODE;
>> +    else
>> +        val &= ~TPDA_CR_CMBCHANMODE;
> 
> Could we clear all of the bits that are configurable in one go in the
> beginning and set the appropriate ones based on the setting ? i.e.:
> 
> Do we really need to retain any values ? And if not, why not start
> with a fresh set of values and avoid the read ?

Got it. We can start with a clean value and set the required bits, 
without needing to read the register once.

> 
>>       writel_relaxed(val, drvdata->base + TPDA_CR);
>> +
>> +    /*
>> +     * If FLRIE bit is set, set the master and channel
>> +     * id as zero
>> +     */
>> +    if (drvdata->trig_flag_ts)
>> +        writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -265,6 +293,206 @@ static const struct coresight_ops tpda_cs_ops = {
>>       .link_ops    = &tpda_link_ops,
>>   };
>> +static ssize_t trig_async_enable_show(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
>> +}
>> +
>> +static ssize_t trig_async_enable_store(struct device *dev,
>> +                       struct device_attribute *attr,
>> +                       const char *buf,
>> +                       size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->trig_async = !!val;
>> +
> 
> 
> 
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_async_enable);
> 
> ...
> 
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
> 
> ...
> 
>> +static DEVICE_ATTR_RW(trig_freq_enable);
> 
> ...
>> +static DEVICE_ATTR_RW(freq_ts_enable);
> 
> These attribute are boolean and looks like we could save some space on
> code by using dev_ext_attribute.
> see tpdm_simple_dataset_rw()/tpdm_simple_dataset_ro() . You could
> 
> #define TPDA_TRIG_ASYNC        0
> #define TPDA_TRIG_FLAG_TS     1
> #define TPDA_TRIG_FREQ        2
> 
> 
> tpda_trig_sysfs_show/store()
> 
>   bool *ptr;
>   switch (eattr->var) {
>   case TPDA_TRIG_ASYNC:
>      ptr = &drvdata->trig_async;
>      break;
>   case TPDA_TRIG_FLAG_TS:
>      ptr = &drvdata->trig_flag_ts;
>      break;
> ...
> 
>   }
> 

Will wrap in tpda_trig_sysfs_show/store().

> 
> 
>> +
>> +static ssize_t global_flush_req_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +    /* Only read value for bit 0 */
>> +    val &= BIT(0);
>> +
>> +    return sysfs_emit(buf, "%lu\n", val);
>> +}
>> +
>> +static ssize_t global_flush_req_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    /* Only set bit 0 */
>> +    val |= BIT(0);
> 
> What is BIT 0 ? Please document it

will document it.

Bit0 is Global (all ports) flush request bit.
Set 1 means a flush request is made for all ports.

> 
>> +    writel_relaxed(val, drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(global_flush_req);
> 
> 
> 
>> +
>> +static ssize_t cmbchan_mode_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
>> +}
>> +
>> +static ssize_t cmbchan_mode_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf,
>> +                  size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    drvdata->cmbchan_mode = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(cmbchan_mode);
> 
> Even this could go to the dev_ext_attribute magic and reuse a single 
> show/store.

Got it.

> 
>> +
>> +static struct attribute *tpda_attrs[] = {
>> +    &dev_attr_trig_async_enable.attr,
>> +    &dev_attr_trig_flag_ts_enable.attr,
>> +    &dev_attr_trig_freq_enable.attr,
>> +    &dev_attr_freq_ts_enable.attr,
>> +    &dev_attr_global_flush_req.attr,
>> +    &dev_attr_cmbchan_mode.attr,
>> +    NULL,
>> +};
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index c6af3d2da3ef..0be625fb52fd 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #ifndef _CORESIGHT_CORESIGHT_TPDA_H
>> @@ -8,6 +8,19 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>> +#define TPDA_FPID_CR        (0x084)
>> +
>> +/* Cross trigger FREQ packets timestamp bit */
>> +#define TPDA_CR_FREQTS        BIT(2)
>> +/* Cross trigger FREQ packet request bit */
>> +#define TPDA_CR_FRIE        BIT(3)
>> +/* Cross trigger FLAG packet request interface bit */
>> +#define TPDA_CR_FLRIE        BIT(4)
>> +/* Cross trigger synchronization bit */
>> +#define TPDA_CR_SRIE        BIT(5)
>> +/* Packetize CMB/MCMB traffic bit */
>> +#define TPDA_CR_CMBCHANMODE    BIT(20)
>> +
> 
> Why are these not clubbed with the other TPDA_CR_ defintions ?

I should put this bit after:

    /* Bits 6 ~ 12 is for atid value */
    #define TPDA_CR_ATID        GENMASK(12, 6)
  +/* Bits 13 ~ 19 is for mid value */
  +#define TPDA_CR_MID        GENMASK(19, 13)

MID here is the master ID which is used to identify the TPDA device 
itself in received packets when multiple tpda devices are enabled.

Thanks,
Jie

> 
>>   /* Aggregator port enable bit */
>>   #define TPDA_Pn_CR_ENA        BIT(0)
>>   /* Aggregator port CMB data set element size bit */
>> @@ -19,6 +32,8 @@
>>   /* Bits 6 ~ 12 is for atid value */
>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>> +/* Bits 13 ~ 19 is for mid value */
>> +#define TPDA_CR_MID        GENMASK(19, 13)
>>   /**
>>    * struct tpda_drvdata - specifics associated to an TPDA component
>> @@ -29,6 +44,11 @@
>>    * @enable:     enable status of the component.
>>    * @dsb_esize   Record the DSB element size.
>>    * @cmb_esize   Record the CMB element size.
>> + * @trig_async:    Enable/disable cross trigger synchronization 
>> sequence interface.
>> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request 
>> interface.
>> + * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>> + * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -38,6 +58,11 @@ struct tpda_drvdata {
>>       u8            atid;
>>       u32            dsb_esize;
>>       u32            cmb_esize;
>> +    bool            trig_async;
>> +    bool            trig_flag_ts;
>> +    bool            trig_freq;
>> +    bool            freq_ts;
>> +    bool            cmbchan_mode;
>>   };
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
> 
> Suzuki
> 


