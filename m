Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=; b=acrpM2P8WOqg1c/pSAaSrKQ8o0
	k9C6zDIaZ2jRpiCJqUg/+5RGIKelK99s7UVdt0aVa98Pi4uGe9aCXxlAXTculHWGBtRkh02bJLS8w
	iVF98a7ILGyhhlAXnDkGB5756os0Vs6E/UnZRvbzuzg/DEyAd9eZl7NTfX+bCjRnwoDURZLyj7jpu
	UpYjA0SyDMLao1ktw3U97VL3I7i9QRgY4QylPXgUwiIqGM0gt2K2ALx5MDr7qost0lQV4bQAw7FGl
	5siLreg5Oa68jfxUEd+bLDJzTsLviVSH3HpWaxfmAT/3vuRCli7o6s6ZWnI0JJlVpOfYSTebZuMKK
	qhd0DISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMtQ-0000000FdDC-2Ccu;
	Tue, 30 Jun 2026 01:04:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMtO-0000000FdCn-02uc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:04:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKfXJg4028437
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 01:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=; b=gv93uNyGr4XDkHLW
	wnBYc4EtCkHhNCeQQaFsj5y2koZ8EduanBPw4E/GQeHkVE7EwJfhROq4iIX2UkCr
	2xDUUQJMcXFRhn5PpuWlMKUAVSerxjZiuHiPf4PQGblQQbR5CGNGP3eUUFIBRkwG
	wIMUXtdQfw97QAw7qbi8GMmzz+YSCrcM/uptFjF0TqZLEMaYdoN8rZY5HQGxRkxL
	J8t62A9unpII4tb6ZPlZ60pMTAdV7dP1farNzfkCx32xD2dE9pI2BqpRNFKLzx4s
	REh1wlqyVZiAwdntspGDw5dQ/fXU8f+JBzfTYtXXAo74rjkKL84ffwxmq78nHRoN
	AJSDIA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k0tqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 01:04:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso438814b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782781440; x=1783386240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=;
        b=Dmdr/oFt3OermQUn4WUNzS2ruwIltxlgcb7S6VBwam4aOj3WAZ9tR7mtYUVSULjc/x
         mIHx37LK8UQbpuJas/zudldbIE7i7NlKI66RBY1v//9GHgP/Yt9H4WFY/HR6GU3djMfg
         I2knVtA1oi7V+jR9cOyJNmpbF4xS5dg/dvq6NxewHnPuaT2oOCAd9UNSn9LSTRE2o/PQ
         t+XQfP7HIWmz3fcqE9TzPG9ia0jp4n/z7eTvjBqacbYwfrx/TPg3nbKDldZMwz+dodCG
         Gia9eu2y/mVmW/q569RdBtExehzzJ4IXSA7YPf/pnsKd4pkf1SXGqwQitjxxdE6QSL38
         d01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782781440; x=1783386240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk6KE60QR/joKK0/Mcn8xnUgE8cNmgtGBQJrVzVbNLk=;
        b=seMoN4hNRV79K/6W7D01Wq4KaGPm46JDzoqUaLeVxZ23waV9nliwU/jvZ7CPB6XAql
         g9PXrRQzzmtDgpLyKO+PPruGdkSyYXAOYSRLnvm8VFakVkc9NFJ1zb6vqPUbICG7p48J
         mBGWOSwtFf25qOOn0BTYSDskw0XaEO6ThhHui+/eNP3Nl5kvucnSMBx7VomYldzF3mvC
         RZEWN1nh8UmZy0f0A1xZGz47FxxEvvJMqM6TIvQ6HqvcVVVxhOsT0horsfIYzKIxV+aZ
         4z2zczq3JFEg/mMpv6Rc6wIW1zpMte/xFGI7CaYPyTbUrgGcUqFL9PYWIkKfoclaquTu
         fscw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8xwLfzOrhC+tnL6oCCPuNMWvTBXQDt/VzFUmVUWy4nSZKDPsDF/bRsqtGW0uSB0v2832eOJ1y4AD7OoFouUCF@lists.infradead.org
X-Gm-Message-State: AOJu0YwdzDmsI9eDKskbMFrbD7KuSWbfUoDYISWpp4OKMWRuqhFCk9lX
	pJYJ3Rdzk1mMaTVEwvZEHQZSUw0WXk6VixSZCXVObcZ2zgyTbpF9MLhCTV6+b7R3eFEKWk/cILV
	/WBl11oA1DesddvgH2VMbOVaV65PQPNs8BLpu6E3qT/T8axv7AmQbF+usUtjUbQoMsT89x6BJMD
	ZFxA==
X-Gm-Gg: AfdE7ckGJAyYMqyrhvmIKtwcq+80poddtqs75bm9if4jcOMK0NR2w80ELX3OhA+G+vO
	Qrc4n2+IZneYzuxpeK6pJ1oSvn9lQp5bjfloSYrxu7AydCF/M//HwU0jU87/AK2p/LCEh1d/zCX
	1ZfRlKv9j1x0chB44q7iBmKPSicuGL5zPCMAP/iReQKYxEjrU+vsFu4eg/jmeuFtBVQsRnliHOl
	KHJTtLOcO08nvxV2/G4W2b3u2DVMixUe3HHaKiskE8zH9ULmrnea68Sut0U4vu0etqOvhp/46Iw
	nsBsQXqO8Tyr4jWfc7sTI7jEcDWFxgPaBUphkh2lMqUPOXhyJESXORztwrtgf5Fr78K0N3Sj3qB
	Ib9a0ri14IvByDEQ2FQSSc58T3YE2g73SegKiYdFI9bJOLbLwe6jcxFIWHkzbgGRpAy7MzzQjKK
	A=
X-Received: by 2002:a05:6a00:f95:b0:845:c6c1:2e36 with SMTP id d2e1a72fcca58-8479f2b7e03mr1230908b3a.28.1782781439736;
        Mon, 29 Jun 2026 18:03:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:f95:b0:845:c6c1:2e36 with SMTP id d2e1a72fcca58-8479f2b7e03mr1230883b3a.28.1782781439252;
        Mon, 29 Jun 2026 18:03:59 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02ce355sm650340b3a.37.2026.06.29.18.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 18:03:58 -0700 (PDT)
Message-ID: <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 09:03:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260629142848.GB1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwNiBTYWx0ZWRfX3EY2QT6GbW73
 m5P7gaZvbAOrOrYyvqBn1P5YTET6Kk+osdw+wfIlWvmwVVDZi2GmGcNO/aa5/D0VlQPXhSs+OGj
 b7+gBTzn+QigecRVpNSXegvAT3UvrCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwNiBTYWx0ZWRfX3RnZZ3Cd13it
 S37eq+jDPw/r9EbWIpHgahnnchfk/4sSWCCm2FzEEsud8cJDbS6N4EBenYzLoIeAiA1C6ufulle
 /vz3NbgIhfO2kHqFd/R8YqUht9dD6YiSMezsqLsnWOeOYNmY4ZSsIgFy6m/L5pjGfYdm4fDV2R7
 O9drne6vvLdHukS3qKCw8tHbHbhZw2lV+dXo0lqDKV10jqvW/8FXMtmAYqcZ1Hk9ifO2nONy9u7
 xMaYBRKo5iZu1dXORthLvZH4cz8U3YgWt1CAnRee6uxcpBJG3s+4UV8yax5yfEJDwL4AY8//TPj
 YQclo7ruDmzeekXcpuczxGoIHtNjBogZIiu0Z6I/aDG/C8UrG8EW4Lxo1KKJ3bsGXsg21UXD3zW
 JkSyx1q4GaJcJu0WiQxYF2gI9JcqEWHny0aoCzBVaKCIYExYdKhgcKsuYithQdgk0p2Uo8WHQla
 JzwATD0SoFGKZeNazZw==
X-Proofpoint-ORIG-GUID: -hn0bsn5q-MJjvfFZZ51cZSrd0XTIslR
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a431600 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_zg4NCnV7t5pwXkA3fMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -hn0bsn5q-MJjvfFZZ51cZSrd0XTIslR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_180402_172695_80DA62DC 
X-CRM114-Status: GOOD (  26.52  )
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



On 6/29/2026 10:28 PM, Leo Yan wrote:
> On Mon, Jun 29, 2026 at 10:08:17AM +0800, Jie Gan wrote:
> 
> [...]
> 
>> Can I fix the issue by adding "arm,primecell-periphid" property. That's
>> would be the best temp solution as it avoids breaking the original design of
>> both the TraceNoC AMBA driver and interconnect TraceNoC platform driver.
> 
> Before proceeding with the "arm,primecell-periphid" property, could you
> clarify a bit:
> 
>    - For an interconnect TraceNoC, what would be the consequence of
>      enabling ATID? Would it simply be a no-op, or are there any side
>      effects? Or is the concern that the trace IDs could be exhausted?
> 

TPDM0(or ATB source) -> interconnect TraceNoC0 -> Aggregator TraceNoc -> 
sink
TPDM1(or ATB source) -> interconnect TraceNoC1 -> Aggregator TraceNoc -> 
sink

We only have one Aggregator TraceNoC and many interconnect TraceNoC 
devices for one platform. All interconnect TraceNoC devices are 
connected to Aggregator TraceNoC devices in the topology, so the itnoc 
doesnt need an ATID.

That's the design purpose from hardware perspective.


>    - How can you guarantee that a interconnect TraceNoC will never
>      require ATID in the future?
> 

The interconnect TraceNoC is primarily introduced to reduce routing 
complexity in the hardware design. It is typically deployed as an 
intermediate TraceNoC that connects to an Aggregator TraceNoC (AG TraceNoC).

For example, a modem subsystem may contain many TPDM devices. Directly 
connecting every TPDM to the AG TraceNoC would result in significant 
wiring complexity. Instead, an itnoc is placed within the modem 
subsystem to locally aggregate the TPDM connections. All TPDMs first 
connect to the itnoc, and the itnoc then connects to the system-level AG 
TraceNoC.

 From a hardware perspective, there is no fundamental difference between 
an itnoc and an AG TraceNoC. They use the same TraceNoC hardware 
implementation and share the same AMBA bus type. The distinction is 
purely functional: an itnoc is used for local trace aggregation within a 
subsystem, whereas an AG TraceNoC serves as the top-level aggregation 
point for the SoC.

Thanks,
Jie

>> The TraceNoC device here must be treated as an AMBA device and I am
>> continuing to investigate the issue with our hardware team.
> 
>> We aim to fix it from hardware perspetive for existing platforms if possible
>> and ensure it is fixed in future platforms.
> 
> I'm concerned that all of use end up repeatedly fixing similar issues
> whenever hardware configurations change or modules are reused in
> different topologies.
> 
> For example, if future platforms may require ATID support for an
> interconnect TraceNoC, then the issue will pop up again.
> 
> Thanks,
> Leo


