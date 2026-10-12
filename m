Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C7ACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=; b=yGyqRrf2g+sLYyxtExBA4JaadH
	X0TaP/XOrTdhWG1/ysmJ5+iuhs2RYErjpFTngcrj/xzdWJwYtU0mnSK48dDx5m/+9FPE2ROWrPxcZ
	KQ8z/XM/mtKyukjnx1w6XBlGxVoeIE5yckWCgF7bSWE7/8zmIXNJQPFDN8lVvRCalLHU+bir0iWel
	X5rdgNC7YTYhlU0az9htNgLq8/owefcS1Cfhx6YeQSv4s8g/rOSkhI8y+pOCse8F2KNNXC2CWGdHV
	0LY4u+S/YjsMmh1SJqofrw15eSiUlfMz6lK9oQpbUoFhI8aVUVPngFCVvS6jLh9TENytR6nD09A5K
	AxVBFI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDaZ-0000000AHYS-0kcL;
	Mon, 12 Oct 2026 10:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDaX-0000000AHY4-042b
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 Oct 2026 10:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=; b=lTqgpY2hhtg/TP8h/cacwOdaR2
	0S8UidBDTEXC/93PFuGU4nyIEK/248h0v2KLuDbzUbG6/1dH/OIVmz1ytQVeRDvIYFF2pJYjXT5WW
	NEY8DcYM+EJ9/S7/HokFvbEXz4LEfiOgxoyH8jHOoaKIsc0Hpo1Pj4B0WxlYyndlX62KfCw0MV6QP
	i8UGhTfKmex4nTF5pa/Mf4qq5KC7PTKrnkFwhVURMvRko7KBDHxYpmv8NCof1z5rihhS3wEFymNWd
	E1zsKEodfkhZsT+/3pTxvAyZKI2NcUI8oc/LQEZlm75J6uDzv+g8CqivMojioKguwlTRiX4xCop0L
	1EXgqL6g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGDaT-0000000EDMz-2WQc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:48:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Khxl1592929
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=; b=cTX0xXz9dWXoCcHn
	iZn99pEOQSClfOF4quaaGMtnmsy9WW5NST9IAh7fYTknQv8MF6DJKD3t+fvvo305
	dhEIyUjdYYD9KP3izOABe8kO/8zwc6AdhaEWwAWzs2X0/+YJtmEl/XJQIaa4o+5G
	9z8qQh+XJz5Cx7EOZKPZNTqJQC3KQV/cRFQu+sKsRlhioN/FpRiAOHUJHlvY0g1/
	p5mU0YLfXBrZ53hLEk2BOCTYr5llbPdYWjhhSFMH2QrdCE6/pfEEUDahA8QSy1G0
	Ofrousf2LGehWFlAY74nufPF/RULQv9Z8KiIyluK8axnacheEhVxzxJIYfN1eP/b
	auftYA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1dee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:48:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5c91bbc36so1592610a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791802133; x=1792406933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=;
        b=YhYaebkATUaQrCq30MGi18TXjPl1TQBde+SLXoVgSI+WV9FU949vUhDJmcFJvqtjFW
         7ufdGR9zx9XzHW2qjFlyZlfPovsHLwSbDueUaHMuqkgPI/iIMI88flEsf4VJHVoZlawf
         /n99vCil9dCQ80g/JBWFXCHfPhif0I6kxWgugVAn8x1hO6y+xpF+8WJNC1L+S2oVVSVU
         pD5JgKsAVakvBJbPCklpqwg6uqtLvH19gjXtocDrZX46WKhSe01wXfOfSUOm5UcL0LKI
         RbfM+VbmMIrQfhsyXjW0SeN7/8dhw1bLFSjRB5KmD6AdZnGsYTkg1arvBPWQcf2zz3tB
         ENtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802133; x=1792406933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJZUJeAzE2f1+m1hJgSo77BjslhwXf356FmXzxgV+bw=;
        b=jq+RHjThV5Yr5BKAYIKsm1/Klg9HoIkpqiwoJreDAIy3T9SVfmTSsczDIMGV6oHPYO
         l6MSC6UMi51+UpUT7wY5ahMN8ctrWRFHFX3HUiclBLQ+RRnTuU7cD4yNn7+rfEFDMivP
         uwtRdw3Z4PlciMkFnhuSHHsaGyPUSZFPNBoRPTa5TlP0QrYQbZiQAqM5QGq9bEQ8uwoQ
         dsAu94wzFA8w58eXJPtm/kirLUDXqVb1PhR5fOU+yUh37cPrypSBQU67n7nDn/kLeaLw
         D/Bw5Eih1+WJ8vNXZbuzxsqm6hgeCIz3qmK7lDxU+Pp2juPdgp5Xbd0DSjQNAnzZ71Nk
         zuwA==
X-Forwarded-Encrypted: i=1; AKwUvBxOSsfsKihKlOGbLc9TVKiceqqSirMkKRL9ZG9gN0BF5JqmzgFNZHHkkA5BACS4PuS4We394PhdTLqM1y7xmv8Z@lists.infradead.org
X-Gm-Message-State: AFq9FYLnMw0dRi77QkNBlYak+iG80Qb66LcoV4HF3SuMKvFoWTf6mWdv
	3nk3ql9Mkcm7ik6Y3bQhoRl2PMP2cmCmkUXgAiewQCzizzHRHK+z4SMOW2wGo3sXP4rcjf2MEa9
	HPyubOxbSR1cp/I6CBKeKVZPE1/6nukgWo894Dq/ZvPZnY8f3tCAqq4fzLW1IIityEucS+lKUQ1
	r6uQ==
X-Gm-Gg: AYBFou3QbJ5IdfSN9GvV7DzxQc17UhWFye38OGRAwmiOdT6rYy7jdAjtRcFhCtw+hB/
	ktxIEf9/8VW7AfSpAU3CYEeR44fJmAUDThYMn6/w26SqXyHI529aH24KUmlpEBbUcwYKKztH8oi
	Mt++76hqGUYRzsbvOXcJL5vjrSnT/CrK7XCBiSwMOLzg/8h6JhsEvjniwvJ7vL1QDhygh8YsKlO
	7bhqC/UabE+KSgaDui/IhDtQWtQf994Oc/DNiwCKwsyNXM0ntFF4Jf5jRvTe8QHTGKamjrFwHQb
	0qHkoFAEOkTLbuAmsgKoOgVYqRkeMQYHhPwLSPUb+9fCcOwc8R7Jctnoz+wvc2YtptAt8vHnAMN
	YeYmyhUI75KqqUa02SA==
X-Received: by 2002:a05:6a00:1f06:b0:87a:23b3:1064 with SMTP id d2e1a72fcca58-897c634e069mr7068346b3a.11.1791802133396;
        Mon, 12 Oct 2026 03:48:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f06:b0:87a:23b3:1064 with SMTP id d2e1a72fcca58-897c634e069mr7068328b3a.11.1791802132846;
        Mon, 12 Oct 2026 03:48:52 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm1581695b3a.45.2026.10.12.03.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:48:52 -0700 (PDT)
Message-ID: <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:48:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008210004.GA1318789-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accbb16 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8_2XKLfCnFwK6P8hJhkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX8BICxrd3U0dI
 lKPWFtaYYNTydWc9fGWs4FszaFNim5ZmbG9xqzt3QC2h7w8lXKLCqaIL7nr80Ij/Ei9YqTQnd6t
 90hDknmtndIT86rIwlv6m3f3hIduKWTMQ02+or7b01JY+AAVhDng18geFBGZG1xqytmDPkPviK/
 Sgdco1rGb5W4HHW+GohbL0FK2tJlJNL6QdJWRVLDDRSsGT3lBfpXwmjxhL5eTYxFQQPyg4hbjjf
 f+fztH9w5oC/RjlKDiaeWUQB8yOwsLJq9jq6KovJP1+xe5Ibsi5/9emlRaxwQr+vZ1DfqY/QBvz
 xk6ZwELPxiQ+Ardu9hfGRB7Uc3Cn4qEGMIRS/lS03BpFdJQqSOJBVC33OWQikqE600pefWGaDs7
 e4P42c3lK0uvTzVUR5Rmx7jJGYpMRY+j4mSgCpXtl0XhN4CDFpllsEq+PXkD6HsB5OUSWJLoy61
 RbSX8Njlt7znV8zueLg==
X-Proofpoint-ORIG-GUID: mFoGO1h3BmKbL9zwkbqNppJ27fgRQu74
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MiBTYWx0ZWRfX8AI5iFtTenfc
 CGDZ3usQUc5QOXm26cacPgBDxKRW9ISzyF0QmR3HDtxHlhRffZ5T2+EfPA92OuQ1spP/C/PPVHW
 8eQJPNYHIU1sAHYBRY1pFayZA+7pPJM=
X-Proofpoint-GUID: mFoGO1h3BmKbL9zwkbqNppJ27fgRQu74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_114858_012366_3CDCF8ED 
X-CRM114-Status: GOOD (  28.11  )
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



On 10/9/2026 5:00 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>> directly under its L2 cache node so that the cache node is the MSC's
>> parent device and its CPU affinity is derived from that cache.
>>
>> The L2 cache nodes are placed directly under the root node. The root is
>> the root of the physical address space, so each cache node only needs an
>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>> a physical address. The two caches use distinct node names (l2-cache-0
>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>
>> The nodes are disabled by default. Production firmware does not expose
>> MSC register access to the OS, so these nodes can only be enabled on a
>> local test setup where firmware permits direct MMIO access to the MSCs.
>> This DTS is therefore only an example for other platform DT authors and
>> is not intended to be merged.
>>
>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>   1 file changed, 38 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 131fd2a16c54..b1dcb1e9c570 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -48,12 +48,6 @@ cpu0: cpu@0 {
>>   			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
>>   			power-domain-names = "psci", "perf";
>>   			#cooling-cells = <2>;
>> -
>> -			l2_0: l2-cache {
>> -				compatible = "cache";
>> -				cache-level = <2>;
>> -				cache-unified;
>> -			};
>>   		};
>>   
>>   		cpu1: cpu@100 {
>> @@ -120,12 +114,6 @@ cpu6: cpu@10000 {
>>   			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
>>   			power-domain-names = "psci", "perf";
>>   			#cooling-cells = <2>;
>> -
>> -			l2_1: l2-cache {
>> -				compatible = "cache";
>> -				cache-level = <2>;
>> -				cache-unified;
>> -			};
>>   		};
>>   
>>   		cpu7: cpu@10100 {
>> @@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
>>   		};
>>   	};
>>   
>> +	l2_0: l2-cache-0 {
> 
> cache@19870000
> 

Hi Rob,

Thanks for review.

Good point, Will update on next version.

>> +		compatible = "cache";
> 
> You need a specific compatible here for your implementation.
> 

Will add a vendor-specific compatible:"qcom,kaanapali-l2-cache", "cache".

>> +		cache-level = <2>;
>> +		cache-unified;
>> +		cache-size = <0xc00000>;
>> +		ranges;
> 
> Are there any other registers for the cache other than the MSC? If not,
> then:
> 
> ranges = <0x0 0x19870000 0x10000>;
> 
> If there are, you need 'reg' here.
> 

There are no other registers under the cache node besides the MSC.
Will update ranges and the MSC reg accordingly.

>> +
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
> 
> You don't need 64 bits of address and size here.
> 

Agreed, will drop to #address-cells = <1> and #size-cells = <1>.

>> +
>> +		msc@19870000 {
>> +			compatible = "arm,mpam-msc";
>> +			reg = <0x0 0x19870000 0x0 0x10000>;
> 
> The MPAM register length is 0x321C.
> 

You are right, the MPAM register space is 0x321c per the specification.
Will update accordingly.

Thanks,
Yin

> Rob

-- 
Thx and BRs,
Yin


