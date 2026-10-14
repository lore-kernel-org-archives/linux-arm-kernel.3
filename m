Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E38CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=; b=oTI+PDAYiJK4jKHtlEfg0Ja0Xv
	2wbMT5lH0ReD8lPFmcnnKgBJXucKzHwyl29I7ozqQx7Irgdx8aluEhXyxJPpNFPDbfpEiCmYUFV6K
	XXH1ADpnk4QeflFm0X0ygKXEBoUAX10HKyVDOXmVqHFLgwU3/cWJui7+bimltMYSe3AwKBYuYW/7A
	f95q/48RmDSeHSFqgE11CRBRnpriLYfGLGqtV+4AxlvRcOMl5FB/jmHQxw7U0sHY1cCHVwmKr+HLc
	hLi0lvnsdD/h3OQG4BW0t9dk+rL2ygVg26ysncR0A/Q/Jcvv+olTuD0DwflXlXw0rUQvtYAfUSqCL
	SGl369aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt78-0000000Eh0B-2m1o;
	Wed, 14 Oct 2026 07:09:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt75-0000000EgzH-1s3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:09:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2X5YO3000880
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=; b=GvD0/BR5zn7RHbt9
	tGJLDyKHaaIRIjlimjqYqS/zHeYc35ydJFm8Yc5OXsZe3kmiKxldKg0IniHgmv5c
	5uSoEc8PiiPLqIVWHaEEUcqCqGhofbNfPLLtkNUUSrFnkYtzBa+YFgMD1JeqNNlg
	L7uXwqmpGPsyDCqheJhMH8liT/r+2K4r8g3tIdohMcrEFB8O34kGz12pKHuc6qp2
	Y6HdNvkGtb3oOsoGauYzl/EDD9DImFODjaT6nJZSOHGZlGtgtJTcOHwpJvAxbGtR
	uFcOKz6jfmNkNCLY5Q6fao/NGfIxLEsFQJ2+S/8d3SxtJBUhjmI05yQ99FGDe3Mv
	MrBM3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbetped-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:09:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so4049854a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961758; x=1792566558; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=;
        b=gCoRdlOQPNBIm5ldwRfYFgeqMeT1frAb0mMDINqTHu2SE3GYz5Ls/GXKTkSrSB7B3k
         w/owdrTw70ZOrD6d+lXSbFvrjcr52uV7lwvP/lennKviubmrenmFh9jXiBqiGthSvL/O
         0Ghh4PAsog/mpLniXrGaGpjG2oGBCx3jtx+JIE+ZjnNDcpYfGaEKkSGkz24qdVeGiXe5
         OybkgJQgZrjDzlOHWDjks8o4x7Ykx9mIxNI+jK9ebCSrS5sbcw/HVa9R10chS6FFsbxV
         gKi1giFyTCd+y/BZHg8ySKNLgPCwrph9VDoKU0hskEjW0d8mBfslewKhGB5wSpnZ+evA
         OfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961758; x=1792566558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=;
        b=NzLW8wPHT8yWkVmwatmG8U7+DPToB801y8UoywcjnZmUjou6UGTz6MbZkck/ZLmEta
         RMrd4GUm2DBGY6ARP1NXiPmhdVTMLLlSstGBKnA7p58VkJN1HpQ1GBLsOjKD09eu+3ue
         rA8fN271epIo3alWkKv/CphPcklT6owJKJvbs8dxPFNclF6qzlo/pWQNzbMtr3TuOC3X
         R3ODfJvbSInkCbquDoMs6oFcLLMYIlsMajaIl90e9SVvzOaT2aKwTZzhPkV9nd2tNOtd
         Z/Lbm6YGPPs/8zbskNcvKjYDCVbJxxKnq1fR6NxOoZiAV/SgcV/V8Q1DamzNXelSRezN
         MHTg==
X-Forwarded-Encrypted: i=1; AKwUvBzTtARNFF27wmCVIKinocJFhyzIWCf0QTEdtoe0VgsGKhq+NqilZxpnsvQIIjKlr5xPPCI5tEKyEmJBobopwvXk@lists.infradead.org
X-Gm-Message-State: AFq9FYKVNSYAzYR9fwgNh/pXPBpkR/vpiatWbC42xwfLl9ovhd9prPN8
	7+QyOIm5ZJaBDTUh8wNB4FXvasPbvWSq02W5HVCCsj1xh/APC1lOS47FjX24JwWNjv1q2JbWgqw
	AK8DJaP5p9SwZEaKkglRnbjLa48+SgEv9sF6Txfv74xdsqdMq2aOFnxjeyM+DpqT5Nnpp+1ozDh
	hklw==
X-Gm-Gg: AYBFou08jLoESXRuHQ57txYBmuRRAn9qRY1NSwjtfYeJkku9SXIC5J77ghdQvlgS9Sh
	EEamds60g7fqHX1DUJhVYaT3cn94NIVbbJ+9AA3mcD30HYr4hAjl73fRvJqz3preRU/QmqDTBHZ
	OjtWaZIQNPCvaX4gXMGXzc3UzEQ8tA3mqSwMtmpLuIKuas7VTQMOCIkokyW3UL2vl7u04ESZ6N0
	jB1qHlhTwwgR0fRe/UpKIr8wLOResiPi9E0h6R775db7lSkilpfMXmAhqh/QyEsyTy0VViVtoaD
	cYqLIjcSKimiirqNjAEGOIMKr6LX2CA9aaFbpCHEFNvvT5BTJBDKtA6knLcUNmZ4yFH9LPMT8r5
	hY7g8jbGkKZYJbJzkl/GkIRFG8gS+d4VF8H7E5TM+EPvSot8R5jliOZXWeKpKdJ4=
X-Received: by 2002:a17:90b:4f41:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ac6e91416dmr978160a91.37.1791961757416;
        Wed, 14 Oct 2026 00:09:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4f41:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ac6e91416dmr978130a91.37.1791961756667;
        Wed, 14 Oct 2026 00:09:16 -0700 (PDT)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm6432925a12.5.2026.10.14.00.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:09:16 -0700 (PDT)
Message-ID: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yTOTtbF31axQrGc8JftxN1xg6XwFASv0
X-Proofpoint-GUID: yTOTtbF31axQrGc8JftxN1xg6XwFASv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX4eca3pqO1Eyt
 hJUhJ0l3JTAHDQoalRCQ4JB1q1dzuKrNbkY1K8G23LHzXziwd9P0HSZf9cPCxxnbj1jzULZwq2M
 1g8hiKZHdw1Ly9p6foBFTYdAK1ECqGmevgcst8hHs0DUzmYceaVFKzbcvML+mO9JzNm2s9Upxlk
 ksda6ZquR1fYtirt4sAQwbL1xhiUrQ9Gx+KyL8501x9Wqa3Fxq+wK5orv6JaomnsQf59eHkWKHw
 yH2Qi35HS9PYink7pXhNXixASVls3th33PxMd2HTr/pT4Th+wcAU2bT8g3n49z9UwfRB7oR12Ui
 bimE93rFCloN6+gNw9n+pOdO8+nzZwbNjRPGjIno2dgPmEMoEePAz1v/Q/I9Rg2TlxmTOq/OC3m
 PjgRUSCnYu6tTEe8WY5m3KsDODcy6bT/eN2e3bzRvXZNLx9jGvAsHNJF/qCcH1Sd0ch5Yd+giiR
 gy8nXRH+ZNgVYEqvqrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX27a7kNE2F4sm
 Au/3Gr4UFW8V3Cgu2u81h0nKnXH4JCtxr1u9yW7uWJ9lycUJUS7sJH+O9JHeEzJTXUGbmMwDOdw
 uvNCAl4CXs2vUAHRnhUNS5Q2Q2eqfMw=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf2a9e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lWq2qqVSSi_Om9X4mrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_000923_524232_723D05E8 
X-CRM114-Status: GOOD (  25.95  )
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



On 10/13/2026 6:37 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 13/10/2026 11:13, Yin Li wrote:
>>
>>
>> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 12/10/2026 11:48, Yin Li wrote:
>>>>
>>>>
>>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>>
>>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>>> the root of the physical address space, so each cache node only needs an
>>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>>
>>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>>> is not intended to be merged.
>>>>>>
>>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>>     1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>
>>> [...]
>>>
>>>>
>>>>>> +
>>>>>> +        msc@19870000 {
>>>>>> +            compatible = "arm,mpam-msc";
>>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>>
>>>>> The MPAM register length is 0x321C.
>>>>>
>>>>
>>>> You are right, the MPAM register space is 0x321c per the specification.
>>>> Will update accordingly.
>>>
>>> That is the full extent but truncation is allowed by the architecture.
>>>
>>> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
>>> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
>>>
>>> Does your implementation have domains?
>>>
>>
>> Hi Ben,
>>
>> Our implementation does not have domains. So 0x321c reflects the full feature page for MSC.
> 
> Truncation is allowed when domains aren't implemented. I was just trying to say that that part of
> the spec (9.2.3) is out of date and needs to updated as it doesn't take into account the possibility
> of domains.
> 
> It's only domain specific registers from 0x3000 unless you have some implementation defined
> registers (9.1.5). Is that whole region just reserved for MPAM anyway?
> 

Hi Ben, Konrad,

The original 0x10000 reflects the per-MSC register block size as
allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
use "how much register space is allocated for this block" rather than
"what the last used register ends" to avoid holes.

We'd like to update it to 0x321c to give other platform authors a more 
useful reference, without exposing KNP-internal details such as address 
holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, 
and — as you noted — the registers from 0x3000 onward are 
domain-specific; since we have no domains, those aren't used either. So 
the actual footprint we need is smaller than 0x321c, but showing the 
full 0x321c gives other authors a complete picture of the allocated 
register space.

That said, this patch is marked DNM and is intended as a local
verification example only, not for merging.

Thanks,
Yin

> Thanks,
> 
> Ben
> 
>>
>> Thanks,
>> Yin
>>
>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>
>>>>
>>>> Thanks,
>>>> Yin
>>>>
>>>>> Rob
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin


