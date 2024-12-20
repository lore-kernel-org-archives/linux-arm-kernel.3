Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E3CE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB/a/gc86K3BsjbroIIz+CtH1X16E19brSWVHdGP1dw=; b=eu68XZU9jMD1LQOy0wFm5q+Oe7
	2c91ZxWmgnMELgEse7B0kqnnBzGErWgqseYHypR91e15ATx0fDJsixst+8UlZmOKeq4spELV9v/qc
	HBlqA9LmeDMmcAZdxjep2aH+dSKPdOnSJVEaT8hp5v0bcr1gro3rDIVyNF3zx2+N91STVLUY4pqI1
	8Rsuj2q2WcDzRpeJsXpuFZk6G2ILT/1C4/s6LwBMvAzbdDPhF1UsLLB51SEh4cIYgULlnDkQW1FiP
	b4UfxyiJdrZHQLgKQ6lMpRZ8hT9T87W0L7GyGNhAuMaLM311ZBeg3E3ldrl6vvCatZR2COHEbgz/r
	BmkkJhkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcOe-00000004vVk-3tPt;
	Fri, 20 Dec 2024 12:46:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcKY-00000004v0h-15Ep
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:42:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK8fuvc026602
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 12:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iB/a/gc86K3BsjbroIIz+CtH1X16E19brSWVHdGP1dw=; b=YZj++l0eyBB9rUE0
	wMa4E6/EPr9R7OMvgBhNI16/uGP2oy1C6UDJxWjna70DdUj4TvR7V+DZ8N4exDZZ
	09jGJdWfUHgG22INZyZ1Kx8WzfwjDf5vRjnBI9Ev7UOUip5WLs5p1SDimrs6nNrN
	ZsvsJaGys1OU/DYJLEyu2Fw0tpNTxbTluRZnqEphxiZMIYwkl5c+B71WzTHRyN8V
	71h+eeMTNxKY0hOCxZkKN9uTbKIhzChCXwZTGv/nGEQdrt5dgIsTTvLAbEwvGryf
	7NUOqUAynFfNagl2r5apXQr3zsLiODhPbWxCOYqcFcRxzLBTyrTC/wEcN0yonmyS
	zp4JzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n59x8kdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 12:42:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6fec2de27so45211585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698528; x=1735303328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB/a/gc86K3BsjbroIIz+CtH1X16E19brSWVHdGP1dw=;
        b=LhuN5tkwy4myQhrxSrR5eBRDsOZbT4tdgu3TPrXWRb7DPNGc5oIDFeF+TjDNk/0WJi
         eZixFuA9Ounj+Zd2mTDsVhOx1BgZEjGF9n34/rxQ1lWzIFTg9+LvDPjMva6o0kDZkp8Q
         yHXgKuyBGHaaM5aXdZ0wTlQFcSuPGW9xbinTnwoRzLmO3d5hR+bvwACmDT1PdupmqrtT
         xiwx6jFEZODSrb+NFUPpzqycUWyqoTl1VGcVb4F1IwRjXn+Hx+crzJ/m+Vsb2pHLjHw3
         5q2U7SpTMPwFjygDGPQrV/g31DPRIVU/vK8OlCGGvQQscAcl64gl9z3G8M+0PwF0CrOJ
         adqw==
X-Forwarded-Encrypted: i=1; AJvYcCXNvDLO4A05vKpAPpP9VZEfjej3DIYQAbGyGKk3cCeEIicBPdtRX4Fr7qqvBn8UYQh++tdaOu+OHywI1s07fyyK@lists.infradead.org
X-Gm-Message-State: AOJu0YxZijf7tkgseK/KtpZz4KDG//A5IT6KvFJDdmtO+4KJSLYPqeo0
	x4U6VsLQqa6JeV0KLX34VlUasfWUSq3Ns0JUQC3R5QZkw54cuZ0xR8NfwC9ai/0SXv7Eq9aDxvq
	tG8DYyH3ShI2bqv5iqNxyEFsXgcKIl9ZMbZ+/h7QKCL3zrChPyCgl4zd3tG3LtyOI+vNUU29E3w
	==
X-Gm-Gg: ASbGncttGqVzCPHtDa8p0Fxo2SeO82rWCKASFLXpyMjjUerCB6S5yRNjUpga+DnMhJK
	GidEt00IzWx2086LmcjxbZP6Aw1xS95eWxtf96/GgpvnCInkz29XH1hP5hbvgw/JXviWlVzN5k8
	hsFcQ9Y8ajFo0pesyDPDhXrX7myX4S5/xYfGVEOw8xlfvGUS0jfujlHY23pr1OQ3f66xs7L4kXf
	k5m2jtuqjWmjliqH7fLdL+WA+u6Il9MR0gmrpNtZhFbE26YDQMriot9h8tAIcjsVOvxu7d5tvbc
	hK+Ghf83qnymUqZzsEVwik6ev9cPaI3OAGc=
X-Received: by 2002:ac8:5f0b:0:b0:46a:312a:54c1 with SMTP id d75a77b69052e-46a4a8b7fddmr18404111cf.3.1734698527673;
        Fri, 20 Dec 2024 04:42:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI5i4/Tq3kmnb/29naeiMFtta6fn+qPtx1Dicaj7zfgUjyHxh3Byyw1oqQ93vAaJmKHk7iDw==
X-Received: by 2002:ac8:5f0b:0:b0:46a:312a:54c1 with SMTP id d75a77b69052e-46a4a8b7fddmr18403781cf.3.1734698527185;
        Fri, 20 Dec 2024 04:42:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedc68sm1774455a12.66.2024.12.20.04.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 04:42:06 -0800 (PST)
Message-ID: <765bb1c8-31de-4aec-b8ef-f141a3e25c56@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 13:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Sudeep Holla <sudeep.holla@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
 <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
 <Z2VXgkJ4x5TJTKJ_@bogus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z2VXgkJ4x5TJTKJ_@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -IHeij2G5T-7hyKoFKDpCVmJAJSqqRGa
X-Proofpoint-GUID: -IHeij2G5T-7hyKoFKDpCVmJAJSqqRGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_044210_439234_B4B233E2 
X-CRM114-Status: GOOD (  29.45  )
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

On 20.12.2024 12:39 PM, Sudeep Holla wrote:
> On Thu, Dec 19, 2024 at 08:26:51PM +0100, Konrad Dybcio wrote:
>> On 14.11.2024 2:10 AM, Elliot Berman wrote:
>>
>>> I'm not sure why you'd like to support s2ram. Is it *only* that you'd
>>> like to be able to set pm_set_supend/resume_via_firmware()? I hope this
>>> doesn't sound silly: what if you register a platform_s2idle_ops for the
>>> relevant SoCs which calls pm_set_suspend/resume_via_firwmare()?
>>
>> S2RAM is what you get after entering a certain state, but currently
>> it's presented as just another (s2idle) idle state.
>>
> 
> Just to be clear, I assume you mean CPU_SUSPEND idle state. There is
> no special or different s2idle idle states IIUC.

Yeah, right.

>> That means some hardware that may need to be reinitialized, isn't as
>> Linux has no clue it might have lost power.
>>
> 
> Interesting, so this means firmware doesn't automatically save and restore
> states yet exposes it as CPU_SUSPEND idle state.

Reading the spec, I'm pretty sure PSCI calls should only mess with the
power state of the cores, core-adjacent peripherals and GIC.

Reading section 5.20.1 (SYSTEM_SUSPEND / Intended use) I think it says
mostly what I'm trying to convey:


"In a typical implementation, the semantics are equivalent to a
CPU_SUSPEND to the deepest low-power state. However, it is possible that
an implementation might reserve a deeper state for SYSTEM_SUSPEND than
those used with CPU_SUSPEND."

- this is the situation on QC platforms, with the case of not reserving a
deeper state for SYSTEM_SUSPEND

>> One of such cases is the PCIe block, with storage drivers specifically
>> looking for pm_suspend_via_firmware, but that's unfortunately not the
>> whole list.
>>
> 
> Well I can now imagine and I understand what's wrong here. An idle state
> is exposed to OS with an expectation that OS saves and restores certain
> state. Unless you tie it some other power domains that theses devices
> share, it is hard for OS to know the state is being lost and it needs
> to save and restore them. It is simple wrong to assume that OS needs
> to take care of them even though the power domain hierarchy doesn't
> represent this dependency to enter such a state. cpuidle-psci-domain.c
> takes care of this IIUC. Ulf can provide details if you are interested.

The spec disagrees:

"Note that entering the system into S2 or S3 carries with it several
preconditions. For example, all devices in the system must be in a state
that is compatible with entry into the system state"

- this also happens to be relevant here, given PSCI is not supposed to
power-govern the entire SoC, but only the CPU block. We have specialty
hardware that does power management for non-CPU IPs, but to request
a system power rail disablement, it must be done in conjunction with the
CPU requesting such CPU_SUSPEND state. And only after the required hardware
is de-initialized.

Konrad

