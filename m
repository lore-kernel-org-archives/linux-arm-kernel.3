Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BAACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkcYFdv239XurAuQWK16RSzXc9uSR2TrVqUONTo1E+Y=; b=PF/6u4kJ151okiWRHX27bHj+nf
	0RQtMFDAylxR8twpJ1VLU9m4Pt7vRAVsVE26Wbv1T7hOwe75F9AVcifiava1Wwq1hBPBBswTF3B/Y
	ifXMtTv6Ov/rVuVt5kC+q6RsdkpYZ9GZHo7r/zejbro2YlavDdJccaYO1SX1B52vfs8BwbvfFUlL2
	abw9jSCua+z+q3uht8coiEV/gb4e/mntAoIaWrEyA/AYIwPIHm1SOXOdlU6tYXuyfvaGz0esoTOQ9
	eLct8MyOkqHXiyHG7uiDinwCipB13rGB71zM6qNgv76bxUaEtXyPzmbAk14ZPGANJfrNBk9KRC7oN
	Aa1S/BGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYer-0000000F4vR-3haE;
	Tue, 28 Oct 2025 01:37:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYeo-0000000F4ux-1kix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 01:37:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RMZcxB2752247
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 01:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kkcYFdv239XurAuQWK16RSzXc9uSR2TrVqUONTo1E+Y=; b=ZgYyQ3emINn21srt
	ThBSNBeMcclusKHpHoexPMb3eoPXaSZhxRDEqDWcYnf3DhUIq1rXjsMJ9suNWOMH
	0PHqcjpBIhqiW/l6Ro3hNncHRri08RPdUiDaUZwnS7V2LC67DrTK5hEfnc9s8/CI
	bmqniLxvHFLPgYz1cJOVYEjs7tPvQJ4YO431QUhBXI/B1UaYq91nVqIj/LkEgpiN
	Ay28MRp3ANH0W8okaEWT5LKKmQ6uSikf0A8FHmLpqeSWuIHg5A43UjZoxjWhotXL
	oj062JncBf3u/kRrTV5tQvZ8WwSKjA/Cw3KmKwZ5aTPVMRw2eFj30nmZARRJe5zD
	fLIOTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swj5h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 01:37:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a2885329beso2616284b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 18:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761615471; x=1762220271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kkcYFdv239XurAuQWK16RSzXc9uSR2TrVqUONTo1E+Y=;
        b=Rs1th3CUh+6cFdL9t2o2Hzf1OcmV5RQAzzi0Pf9f89m+giOGfEs0X/q6sr8zh9ElDq
         RTMCV92uGv92OC77laMowoYxhnSJrBp8Lg5Pmn8FC+fQhQKQXzjyjfewbStOAWGmz9Xe
         xuUVF7mZvCAuCxa879KFHGO+ErgGAPRVrEXZt7kIo6rknJKCc1J5Ao6rylAsxVYZpIQY
         6r3cZGECBh8/HC7X2429I3pKqPxFEg4WiWMHhjJu5XYQZhUDF43Qa3tun8FkaiwKGQ+/
         OS9tN3EcnBiLhQjy2Bedr1buDBJdI84FvTUXqmEFUAIxrv8RNkjaPSg58P2Wq7nk7IpA
         6Fqg==
X-Forwarded-Encrypted: i=1; AJvYcCVIzYjjqPfEbeMeTnAEE32piwiymgER2aIY0wu+1YF5OE7EqSreScpAhrbJIsu6a1QjBzCfJBIRwMJkR1Z0Twz2@lists.infradead.org
X-Gm-Message-State: AOJu0YxNRTYeuGVNiav2DplQqrpTkvGMU01utQJGJCXs4oZCJAWugFpp
	cDg+57SkGp9JQls21gLmf7xLSMkf8NalE98Dh3+BZvdQWeoDK9GYPO/uO/RVGEq9Q5jtW0Oei1u
	r9IpPLciuzxqOe6zqvf3uO26x0nDR1272x/Ys3sU8FKj4J9tiTqDXIl1Rgsi3hDMVB/6/Jj7hdp
	qnIw==
X-Gm-Gg: ASbGncv84GdwyFZ36lzRZlOYkEntF/re8KtVvNJeoQgcVNSTnw5d0lQMwtxxF+PN/rS
	oelZ3y4S0hEaTIndXsu9zpX6eqQg+QBunBmtjBSRUCwnLMTfphs/lkEK6LgMtdi3cmf12UnOsv9
	UYI/KwEszAIEQFz+eyIIMagdkPLvwBDdkS2ZoVzBcLuUnr2Tc3/s8YKAnl+/sspkjQjXg0OWnbR
	4Y8KTR5jnjmoRUabRy3JmxQ/u5bKFOn4jesv5Fa+AbqM/I3BSPNQlzmf3p0xDzU/lbjCWRPwsTR
	jnKDXz6zvkHZdsAJEq9+2qTHUVntGOhp5+siJrO4x6tHCluRWQ22TJWA/gFUUkOex3pMOEx4Fox
	vmJOmpsEe/L18JUnU9Ntt1Q4N+qGoaQi/55WOe0DH9mMHY9QkuwtW
X-Received: by 2002:a05:6a00:1ad4:b0:7a2:7c48:e34a with SMTP id d2e1a72fcca58-7a442ea3e89mr1495021b3a.13.1761615471548;
        Mon, 27 Oct 2025 18:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwXWqh7EbCSdKjDTIqMe6IMuQKXRMeAHV3HeqrZw04+sbIralUpoGvEob8jqGjOgpdwAFzGw==
X-Received: by 2002:a05:6a00:1ad4:b0:7a2:7c48:e34a with SMTP id d2e1a72fcca58-7a442ea3e89mr1495000b3a.13.1761615471088;
        Mon, 27 Oct 2025 18:37:51 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408c4dfsm9638069b3a.65.2025.10.27.18.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 18:37:50 -0700 (PDT)
Message-ID: <42c0477b-87de-4b7d-930c-67ce6c9e4557@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 09:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
 <d71e09ff-c063-46d9-8d02-f69c18b6efe5@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d71e09ff-c063-46d9-8d02-f69c18b6efe5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _wnZjmwhMaOwnvmE70K2m1_9iq6JU4JP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxMiBTYWx0ZWRfX0VXrr9YpJ/YV
 n7hjhj4motUC8Y+fczWv2AXe+OlIby20+iBKEu3skFi5N7XmVYkzrIJHGFWcHW3A3mbGLZDCPDa
 KjsKfAn7FyULLgs9aiRpOdz652RajaVYV91qRjD9lTlu5I1sSPwfw4z0WgklzbJcFDcEpT1MI3A
 85HpH2bHDNXpzzw73gwYBf0yX5Z21HtSwI3kMETyPWhpSYT+O/WrNLQf1Jz4zFyA8Gx3dRWIbc9
 27SFBumv99snx8+aOJH+iBo8TbqeFjUxhrTRJL88ftnTUBlUC0soZFTZCkoU4f6XCBpqVqHJnzg
 P3JsCxTNsGzHjIVGQ24j9zhaDFVMAuZAEvTmV7kzQYl/E6PqXOTINGj1CBuL8V6ZumQlYNrJOaG
 h3PINWtuCcrVkqgw70xoRtnZwPC52Q==
X-Proofpoint-GUID: _wnZjmwhMaOwnvmE70K2m1_9iq6JU4JP
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=69001e70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=otdSkCFsg5a9Z_Vg604A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_183754_597097_7B6E0132 
X-CRM114-Status: GOOD (  17.67  )
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



On 10/27/2025 5:29 PM, Suzuki K Poulose wrote:
> On 27/10/2025 01:14, Jie Gan wrote:
>>
>>
>> On 8/27/2025 6:55 PM, Jie Gan wrote:
>>> Patchset 1 introduces configuration of the cross-trigger registers with
>>> appropriate values to enable proper generation of cross-trigger packets.
>>>
>>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>>> which determines the frequency of ASYNC packet generation. These packets
>>> assist userspace tools in accurately identifying each valid packet.
>>>
>>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>>> specific port, forcing the data to synchronize and be transmitted to the
>>> sink device.
>>>
>>
>> Gentle reminder.
> 
> Please could you fix the dates and version to v6.19 ?

Sure, will send a new version with fix.

Thanks,
Jie

> 
> Suzuki
> 
>>
>> Thanks,
>> Jie
>>
>>> Changes in V3:
>>> 1. Optimizing codes according to James's comment.
>>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Changes in V2:
>>> 1. Refactoring the code based on James's comment for optimization.
>>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>>> jie.gan@oss.qualcomm.com/
>>>
>>> Tao Zhang (3):
>>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>>    coresight: tpda: add sysfs node to flush specific port
>>>
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>>> devices-tpda
>>>
>>
> 


