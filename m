Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F0B109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWuvruh3A7A1eblubi8SZH4AWXMTECDRo91hQWmxO2s=; b=GcrxlOjOrISIfoNaL+jr7wI2Kz
	KbdIuE75msZ/JN1RtnsLWXwQFXTpBIh2GCppGkI7b7cmMuQvI0C6J0uLsOBC01+4/18NEsE5ZjMvg
	DC5Zq96jUMPTxPXwwe4f0rAKia7LUDnBGXGkmxXB+zTkkYxa5DkH7lnSEyE37h2t77M6xLLAjyKNN
	nIpLopD+bS0b4xr8Lb7iS1nYluxReD4fuevEKki+qsacYsfEiSDUgryME3OQqfiI1YJE+YRIGDwBN
	78VNFrcVMQaZn3gstdQMQtLZ17OlFMjJcxjHLhc80r5K5ntSVbUowue6yi+C7gW2W8Mj3W64nFM66
	tW44nhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTl-0000000COmG-00qV;
	Fri, 20 Mar 2026 08:45:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTc-0000000COeS-2fe0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:45:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Xx19539554
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWuvruh3A7A1eblubi8SZH4AWXMTECDRo91hQWmxO2s=; b=IQgFVcx8ZND4/xPw
	VnIicyD5JvnuuFblUThBYDluSO2mHIQOs9GPkTxsxGKvPTqgOkTenhSkCFZrzCre
	IF+XsyC/P2ai7qrsuiMngFMhnECoEjglsr70hZuuFrr5FuQusTRN+rM3p68nk4Zr
	mWZMPwrP3pm5dmEB18l+JOFylGJTZG7DtSeMgoPtiyOdOFNP0nVXXpndSFcaGO7U
	m4EEtnLmIasI0gF3/mjHjiJmCN88pCUc2bEUZo7ogWFgjrdxq07hu/bo610ILYQZ
	kipDS8DG7+VE3LQ8NI0dPZZRdI4BMNK3X2KV1nKAAnIiQD/hLuCUxBpZBWfQes+M
	hJ0bug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0sm6hc6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:45:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b064f043adso21596765ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 01:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773996303; x=1774601103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWuvruh3A7A1eblubi8SZH4AWXMTECDRo91hQWmxO2s=;
        b=a1DHt1jOrxHNXSxksRGGD37M6MYSn/73k6wm0qTRs+R9t1ztDyoZpBclECrqMW+E87
         FGy27BjGQiHXH4lgKw21QtFgJ0bzZvAD6SbAOLYoGSsxmPJaOPweR4wL9h8Gc2c5Z+CZ
         CXtFBfiojl0HIfSCYB53ApjJOL+fiLCPT9OdDmZsx7LDjGb4dCKc7IOk4D9YRIlATh6J
         x9LvMYWsgHwlJYv1NbTQxaS3sToclK/6RozjAaFcBEXD/wzjv7R+MGUwxUDEDDYUcPxe
         jm0hTM4AlrVWnIj1BFFdn7uqsALsqRxOl7mcaTPxmfMvINb6+vuZaGSfwtvVzgFbVBOI
         TCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996303; x=1774601103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWuvruh3A7A1eblubi8SZH4AWXMTECDRo91hQWmxO2s=;
        b=pBYy3x//03iqrfOIUsg6Mmb88c1gdQuLGeTiD9tqtSWjoAQpaGC8blXukOOdL0Hsm2
         mMXYPLezBffVF5t6KBj4/1IzoTI2//vfnc85i4KFKKtXkuBXCgim05N/J7erR5YWnLYr
         YK5CHPjUKBmVbQoaYSykhiKofTkgeuhG4PXidUDuqFDZKHuharHG0YvjAuSN3I8olGU9
         0ItlYJRh4/wfg7w8f23/M5D5SERajnaVMSYWn9OAwDEGcv5ERKjxfvoH5kFnqTu0kAW/
         okNxrL1s9HWK0PlaCIVvL01cj29UoppfzgCeAz7xSXwPFtDMWs52UBdydJ08ZxYtmffj
         SZ0A==
X-Forwarded-Encrypted: i=1; AJvYcCWKvKPxUGd02So3TaMFbLeDRX21eNOGZmFdxJPkpuAEYdx5SBPclr9VPq1yY7iZdb9nymgGaBvpYLRsCZ57HhET@lists.infradead.org
X-Gm-Message-State: AOJu0YxI4wVsvsgqYi0ByZe+XOuMV03YTqh0TctY6ZiISD2h1tE43zYz
	N5OyT/MPHS/rpB4LuavNJPG7zDYC+fANwXCm5sBpRC4c2gI/YZY//80G8B9TapfNSUny002M9y1
	bZpXib8SE9wy4AS3FtByE/VlpINtHLkvqYoyRfuDg0eCugKZdI0CCaEM5Tb4WxMU79KXYEuc5o0
	UZgA==
X-Gm-Gg: ATEYQzw2AMfIDUl31pQlok6Lly8ZTrocatj2rGYyhceQOjcGnu5msirENnpKxcMQqex
	0f5eZ9rqMr4IPftPUTTxNKbxk0M6KZyac40qGWbCMSJRdRZFnAjjU3p2SrK5cLXsp27sbC3NcN8
	MsO8XnoGP1HrE7H8ZqflzlILI0jum7nBW8HxAusbnlEXyuf7CsZM45ZF+CZthpDLQV2uk3vDKbA
	vl0n7I9H5A322p/juPtA5Q8l/qjELsteXFge02gk+Dd4ccschYKNpqPz+HV6QfhCYY+WtqLeuJG
	BDH3SUfLrjS8pKt4MXN2WK8Mu6GPB0SNJ8nIM+h2TJtrhN63Mza/qbhc0RAcv9EO6s5Wr+z3Rhd
	fwDcLNkrbtCZle9Km2gGkDyN+4GYCdCS8G61EAhEqe0MIzO3o+d/8X0tyXaKYWPT/nAYI3QFvT6
	31DuhcyRaVN8E=
X-Received: by 2002:a17:902:ec92:b0:2ae:ac0c:5a2a with SMTP id d9443c01a7336-2b0826c6976mr20275665ad.6.1773996303283;
        Fri, 20 Mar 2026 01:45:03 -0700 (PDT)
X-Received: by 2002:a17:902:ec92:b0:2ae:ac0c:5a2a with SMTP id d9443c01a7336-2b0826c6976mr20275345ad.6.1773996302732;
        Fri, 20 Mar 2026 01:45:02 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b5dsm20723185ad.52.2026.03.20.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 01:45:01 -0700 (PDT)
Message-ID: <519ca61b-049e-4e2f-a9fc-9b4621574470@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 16:44:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: platform: check the availability of the
 endpoint before parse
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260320-add-availability-check-v1-1-b2e39cdeb6e0@oss.qualcomm.com>
 <20260320082549.GO8048@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260320082549.GO8048@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XrXPQAC09IJkncp_bpF3TDH7KFN6Up8G
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=69bd0910 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XMd_ep3at93-ufPvPDIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA2NSBTYWx0ZWRfX5gmtjQbd+9RP
 Od7XwOeeYO6xNZEEKZpUtiH0IvzpzczIluFa/iut+uqG/5FyIOfE8oTx5FDvfQBfh4tWsvKiInJ
 TjZs19sqkv2SkbNEVvwSLk51uctF/Kz4mzfIH7jYdBARHHw5pnNGFtg3b/J5F4iyNeg1O3QTw50
 Hu7EmCDqEh3fBHq9eYl81rwBh5JIXrOqUTbWgNlHhEdZTjLAXhphgvDLfG2itdZnOf/e5jmWxeW
 pINsElAZA3pjl46i3rzPY/VSARkn753jm8oljOIQ82rUh9h9/5ETOzRaAS2lFA0APgohD/McJGs
 PMvZc8KwgEvW8nrGzA4JLhdX4x1oAuW1OAELJqQmI3IdPe/uzH4dUd1fHsRcPeNQj2i0S/oQqyk
 BwLmvk3yXYx6/Ev/9J07xPRbQhtKtgSWcDw85+x0kaq7qdAG+JWMMAnSsXVB60JfEvf5VvpJC1f
 z3iy0ytk+szVQHfhJew==
X-Proofpoint-ORIG-GUID: XrXPQAC09IJkncp_bpF3TDH7KFN6Up8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014504_759716_7D37334D 
X-CRM114-Status: GOOD (  23.77  )
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


Hi Leo,

On 3/20/2026 4:25 PM, Leo Yan wrote:
> On Fri, Mar 20, 2026 at 03:31:12PM +0800, Jie Gan wrote:
>> Check endpoint availability before parsing it. If parsing a connected
>> endpoint fails, the probe is deferred until the endpoint becomes
>> available, or eventually fails.
> 
> I want to clarify a bit the failure flow.
> 
> Does this mean coresight_find_device_by_fwnode() returns NULL when the
> remote device is not found, resulting in -EPROBE_DEFER, but the probe
> never waits for the remote device to become available?

It's about the coresight_find_device_by_fwnode() returns NULL, resulting 
in -EPROBE_DEFER. So the probe process will re-start after several 
seconds, but always failed because we have a "disabled" device node in 
DT(we can see this device in DT, but it never becomes available). It's 
ok if the device only has one remote device, but has issue with more 
than one remote devices.

Consider below situation:

       device0
    |          |
   device1  device2(status = "disabled")

The probe of device0 succeeds only when device1 and device2 are 
available at probe time. But I think it's ok to probe the device0 only 
with device1 available.

Thanks,
Jie

> 
>> In some legacy cases, a replicator
>> has two output ports where one is disabled and the other is available.
>> The replicator probe always fails because the disabled endpoint never
>> becomes available for parsing. In addition, there is no need to defer
>> probing a device that is connected to a disabled device, which improves
>> probe performance.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-platform.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 0ca3bd762454..e337b6e2bf32 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -220,6 +220,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
>>   		rparent = of_coresight_get_port_parent(rep);
>>   		if (!rparent)
>>   			break;
>> +		if (!of_device_is_available(rparent))
>> +			break;
>>   		if (of_graph_parse_endpoint(rep, &rendpoint))
>>   			break;
>>   
>>
>> ---
>> base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
>> change-id: 20260320-add-availability-check-4cb2ee6e520b
>>
>> Best regards,
>> -- 
>> Jie Gan <jie.gan@oss.qualcomm.com>
>>


