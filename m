Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=; b=OvipWnFWyyP3mRx3FTh7/1FHYk
	40NLPcBaOjeJ3djU52A5dNRmbPq5FzsteALGS8hscD7yueH5BT9+ufiCMJFAIVGd6NSTzHbks1Dzs
	bdYkBfC+kzPUEx2TRrvzVU2s04s9Cc5DOmgZa0os1NK9AAogFBUN2XGSECGlU2Bky59w7UAWw75D0
	ro+JfKslwK2T/v4pQuzWV1mpUrG2W2K4RMmrmJU1qm1837OsaO41M/j9w3ASgrtH7GjgOGMSCFGK4
	bvuryQnPYgOPzrSG74dziW2RMjYipI5i+qIFEg+XPV3jOOHldBbxcR8ZQ51FUBF6vZKUMBMsrUyOP
	csIR7s3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU3Q-0000000GHsx-0ND9;
	Tue, 30 Jun 2026 08:42:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU3N-0000000GHrs-3A1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:42:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CLk21087220
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=; b=G/U1rECpO9DXIczc
	CdXXJFxo6nXualylOUdw7K1x8kiqi4NTIjROD9KbTKEQB3Fb84vvHR+lZKNXLhnz
	Am+N7X37E3xzbWuIAdNENwNweVMEl6QUrackh78/W96Fx+Ch8Fs7WTaBmZ582ncM
	4WR7Fcu+sg/OthS15mHy6Mg/wTomMuQCDOU6wlhv8LzQBk/62fmN01zVefx6aoRb
	7p4/hTsibd4zwX1Mp2nnKtIRYtNFgu1L8cF89NCWBUjtDny+jnKl2H35Yr96kjnI
	nwoEw2QqFq8zoLQdXbyAgEo3gAbVIyYWhTKIgKUll4eeve4SyKaodgRa2wgh6Xas
	7LLxVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qhacta7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:42:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so2410325a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782808967; x=1783413767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=;
        b=bXNWhzO5iDDGIs+P0AWpeuIJD7+EEbAeDE95fzcLGVH/e4JnGQe8swJmpWyqVYw7Et
         ZpoxmbepQkWWhTxQ7nE0GNq+rQnJ/sHu6gfIHMP2Fo1qLwjWNns3B7TGf+zwuilx8jw5
         aWO5VhcjIjdWescjrlzJPGEINeVFjQRF9E20jDDvWbBRqRwU7i//uoU+GSYFMicJUViG
         3UILBSdeWreXwTXT51ST1A1Nv7zfwaZQ2NVwJH3QeAoW2pYsy++fxt8u6u34Z2r9cRp9
         8yjvpi4twR6nWg95XF4ixFjVUPg6y9ZkV2K+tAnszMZPTJAYJcp65Z6wXxQnTEmmq9dv
         u6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808967; x=1783413767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3PkPp9OpJEAmf4QS2hFOkoU+Rq0Ib3wE4adA5BkKIA=;
        b=hrTKS29LNKhycAip3UPpB4r/RK7FDnOxU4YrLtBqUVetcr0p93nw5WDk2QDjSDU6Mp
         xg8Kfrai0F10EJVuVTM8zJqd/MYAcFmSthnIA6iy5Buo8IaiXdOislClx2yXCur/Sxes
         xY/BpSO1b1fOXbA8RNNiIKuSGrHYNInMkKKOVBKfyQkaiU376WvuHLfZHMLRfW8u/QLQ
         64HSo5n9U9P+a2/6UpUYZ2ZxMgMC4mC8UkkXcvMgOZ7fJ7+6GiwckLaeTM+AeT1+aoxV
         z14O1MSmrS0OIMdpwte6xxhdILubnAECQLnlt1JBsEJx76K3ew0Y/b/l1lzOfrrNeO6n
         LEaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wD73aj3XZjseTcZogEw/FRroBIpCB5bLMPR+EoLR6k+8o/9UibDDV5zOUfkpTNIAVTudVkKK2uhtx3IhO564G@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1lB09WBFRletto7kB1tfxwQP6M9CJc2LLuDn+f3vdTzOtBfUD
	rZBg0F4uJU3gSTYHwGLulPur8N3JqZfa+oaWFEObebOsPBXCG2R5UZQokv2iSWTLzQeSJNaIM1D
	SAFNhLYaEM+BEWzWOqAOXZO3rnikLea7J/SwSn09/SRWO0NUzlXX9pb6GL3wZywpG8BNNlR0mwB
	bbEQ==
X-Gm-Gg: AfdE7cmZrJ6htu+hensf3S9Me7IjtYHDVRW+jYLtM5M+luKMJaSuJpzGaxEv9XKLB8L
	QSwGpbZzQk/9RimvtxbE0Mj90NxFO38fwNwvh1KnvNqGqyyTG6gWxlWiM/S2RBcEUpFnlhkpKx/
	wnCFMnfOgvkmBzbYqYVmWXwyIWZk7oDOcI8C6/c6OIMPa2emvwt1HKk3FInY2cbK3lveS6ewRV1
	s6WnckPfIXXfIxK7TlZhtiqsOJhkBDJBK4wP0nzHlLXeob6N+gRA/Snl0FClw3fVIAPlO8fFyWf
	VlxgQF2eM3pvk8cSU4a2gcuwNDkBmxskOXHVKmL/7Pk0WtVcGL6R5MJARMYWvoCYKlRbTUq/LoL
	QfGVzPWkbRK2+XU924Go1FXn0LgMS6JpwISAuEOshl9t0qxPT8UgeX+GKZwYkRxcbJ5lcxh22z3
	Y=
X-Received: by 2002:a05:6a21:398:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3bfc50664e7mr2352349637.3.1782808966658;
        Tue, 30 Jun 2026 01:42:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:398:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3bfc50664e7mr2352319637.3.1782808966200;
        Tue, 30 Jun 2026 01:42:46 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95c04fsm1124404a12.21.2026.06.30.01.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:42:45 -0700 (PDT)
Message-ID: <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:42:39 +0800
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
References: <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
 <20260630081021.GD1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260630081021.GD1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A6MB6LvvNFRnuHAUL5gggn6-boJ3RuCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3NyBTYWx0ZWRfX/iQ2TS87M2PB
 r6JuCesEfpBmmKUXpKg6IZy+ccqSkhbdhiA2kkwkge9hmzjV/6TWUMQmf44wHR8gumj61aVkcJy
 XYpCr2CpJcmBFeiBDOp38ZlHSqkRWVYjCV2pJP6zOReVvNuQDCvFpHV7KY0bI2qahh07mYiVfeU
 Nx6rLXIC1XwFm/Byauzk8plIvKrZj6srdmH/S4e3stVyibxzCh97e5GCY/zL1kYYskfdbIMpPoZ
 PZU2ZzD0nUK3NO9YqpqU/hp241ySEgdZxzq2TxTVVStYOrtFWl41xoi1ptiZ+Ao0hPPxmnfUEda
 vST78iacGXxB/pA04L8dmgTUblICIew5TFLlkJKSODLjXk5Dg0ZAFXeL58p8wOL2N8mhcoKFpK8
 4vMjvATpfEweUlU1/fgSgHYs6nTAogKTxNA4BFIF9fQWxQSfCwuswebwqW+iMg7ZyDzKmFPR56I
 Vc3603YyI/KYoO8BNYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3NyBTYWx0ZWRfXxEKw4qnhlpx8
 Jf8UvuH28JBPj6IPVPWBqW/QIHdw470FAQ/gKmRAw9A+ZiqK4ni0yZ6pIRqFgAD5VN6D01vge7s
 eXMJcf0kJjiThha3ieDaxH02B5zd6fI=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a438187 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=9NUdbc6MOnRMJlQJ6ZEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: A6MB6LvvNFRnuHAUL5gggn6-boJ3RuCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_014249_918511_7758AD84 
X-CRM114-Status: GOOD (  27.22  )
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

On 6/30/2026 4:10 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Tue, Jun 30, 2026 at 09:03:52AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>     - How can you guarantee that a interconnect TraceNoC will never
>>>       require ATID in the future?
> 
>>  From a hardware perspective, there is no fundamental difference between an
>> itnoc and an AG TraceNoC. They use the same TraceNoC hardware implementation
>> and share the same AMBA bus type. The distinction is purely functional: an
>> itnoc is used for local trace aggregation within a subsystem, whereas an AG
>> TraceNoC serves as the top-level aggregation point for the SoC.
> 
> I'm still not convinced that adding "arm,primecell-periphid" is the
> right approach.
> 

I agree we shouldn't need to add arm,primecell-periphid for the AMBA 
bus, as the hardware provides the necessary registers to read the 
peripheral ID. I used it as a temporary workaround to resolve the issue, 
but I believe that solution is not correct.

>  From the description above, I'd expect either the hardware to expose
> bits in a register to distinguish these two module types, or as I
> suggested earlier, to use a DT property to indicate the module type (or
> whether ATID is required).
> 

I wanna distinguish the aggregator traceNoC and interconnect traceNoC, 
even probe with platform driver, but the existing compatible is too 
specific to the interconnect traceNoC device(coresight-itnoc), that's 
why I didnt try the DT property proposal.

> Or have you tried to detect the last tnoc on a path and allocate ID for
> it? (You can retrieve csdev->path).

As Suzuki mentioned in the other thread, I think it would be better to 
add separate compatibles in the of_match_table to distinguish between 
Aggregator TraceNoC and Interconnect TraceNoC when probing with the 
platform driver. This would allow us to allocate an ATID only for 
Aggregator TraceNoC during probe, which is consistent with our original 
design.

Thanks,
Jie

> 
> Thanks,
> Leo


