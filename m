Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3FFCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=; b=gpa/Rht+xih8wS2FckS84WhMRc
	v9ilNy2pxQ/u3z6jrsH0ZFys2ge7rpu6jHlwYNAQNuDUZKf4sEhUvbE2XiIkHbr5PDMowKkZwug58
	N1RYzeBVFDgpWuoyjREulgepEfxhdGm4024xVhtiotj6m3tTJ1FHAf0sr5sLmrfVeTyqOf9bSmuNt
	Yt03k7sX1LVZrixTioXUA23HTzejNhZLjdmd7r1lfpdaRnxqFVLkFfq3f6aoHF9ArbgZxRqyUef4D
	xAXvPM5wZprpsXeo16GhoFrZaM3IuooFtxwMTzmYFGnV+MMCXTwqjAhf1F4160u1eHJS6jgYrabHc
	wWe1dk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZWK-0000000CX12-05uX;
	Tue, 13 Oct 2026 10:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZWG-0000000CX0Q-3q4m
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 10:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=; b=Koo8q1KVjt1J3yDqI0dIwJYKF+
	1YgGwgUyk50PeT0qSn6hrjZYF7KuDgMKFNGHeehocEcD/xz0VgScL8M6ivK1zYjvS+WA6/KvrD8SC
	P8ZjkpIkFfBPtz6VG8LjVYgzPdwksnyoEKeNEerQ8n0ecMmNMuZJ7mJixAHn+nT3jH8ohrKalJOPF
	ppKj/TTtNSWxKFMP3V0sFXU+HfWCF8HXBvD97b4f4gcBQ8SH48sl7gxAI5UYDSqD0lnZElhoKwf2U
	4WtcTLP5+1bGmd0JiQqKBelweveMhD4NZIiHqFnxX5gI3zyGxhMh91zstR4HGxPlkb17yEQYcN+0c
	akvFQf4g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZWD-0000000FP2G-40p8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:14:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWiP015194
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=; b=MDAUieoO9HXtf2ah
	tUFwuccCec+P1IeZsPNTsJ9IHe91jBOK9EhWG3DnQpCxTJXC4eUIYjzFoUL2eD4A
	uy+R/yNGFdWiVXVarIvhq4fbDfr9qGmEoCEVGIS0fMGoiWFTCzKfMzAec4cJHnHS
	n4Pp6wYhzILFvzDAYDiBBRS1nf0gP9227W27c8VwsZo1u46ya3m7jGWi7SCjwKv8
	SPRztyE49rXkGXgsMp19uqnN1ZPz+2w0fEDJLqn0mt77VPOYg04D588YRiegmuL0
	No2J9y9h94y455P7jCY8nNGzcoRrnslCetCT2X3SjIphAQjKJ+Mbdor6m3DIvcdt
	wdahCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugq23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:13:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac50dc68adso66177a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886438; x=1792491238; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=;
        b=AzhNL1bMSDK2uJAglXmMDvXe3YTmI4XLSwpmvagwSQEpMxcJ2duKhUEzIASjJIz7Ss
         0SV8CKahcm7tzGajDpFLRufGeuB3MsuobSmP82e0fIIdjOutdbZ7cDcUbC0MNkE0Oa1J
         K2Hi6i9rW1WuAKiP05Unprrf2o4q17KctlaM7HV28WUPpM24ZrWRAUDbGE30KCMCbQ+V
         z+YfMzJCWb3ZGC9zLz4jLA6OrySMuTkDKgnUZ3s7XmT9EX/zf7fT9DoxYObL9JsMhto+
         O1LH8W5qcFeULSHqMZvrCCuYN/L9pJPAJotzV1mBxsb1z9212kHs9MVE7j61qc5x+VTv
         AOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886438; x=1792491238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=;
        b=SDtyJbHl13yw726MXOLyOKW/Wb6QJVjeqAytcA60NYrXs8sipM2FRokbOw3A3lFmqO
         IITsyXfO/bLBH+BGL1IlE8VtU61Tn4XvqXFZkkyxWzowTCL+acKgmsyR6rfUWTj8cBSc
         dck5t2kKbN1m4Xk494P3PsFWGCZOb2Fyv/oILFya6SCy/18GStoXLRuK4a2Xpg5QFYP/
         jBFFkwwcsdsozcjDRfeqev6oQiHP05AXLGd66KiooMAUf6xW4eNjNEhCSz2vv/4UPNsx
         iGyJ2aWOEkz/Va1+ZATr/L9n8mhBhDh3uv6/FofywRyK4nYi0Gk3Qe84CZhBpBd/ASep
         lHzw==
X-Forwarded-Encrypted: i=1; AKwUvBznC12HakmMX+F2waHVSqg8itW5E8XrZOCXn4rdqLdk1CcsmwyTCQfs32VZzRUJgSoxWSW1gYMC826T/64htI2h@lists.infradead.org
X-Gm-Message-State: AFq9FYKlYi01t+V5aHf9wQcyEmJ+VZwDBnFtkjZ5ML1oFmlJSLtBGL87
	0TJDTtIfyQm757fZMG7rAya+aG4r4VEQpcPBOYEXuw0++WAAr9dRBfh4TfdUxMiKjWE1QBLe1Iv
	JI8fIztcKbkCAbXDFh70UQ6Evb2SWshEkmECb26b5d4nxzMouwKKsSY4dcidyz2KSOKkN9cj80Y
	Vn3A==
X-Gm-Gg: AYBFou0TZaGD3cj0lHyquD6ovevJvYb6YK2lgO9WKtfHz4MCrap/pB+odmKaom5YIBS
	xb5f2XiP8TunDUezkWJNGYlRLbZOJKMguwLQZZ3lRTSfBtwPrqEbnHaEicxTuHOmB/DsT8gxYl+
	GnAPNewURncRF7bNMiI2N19e5ktOKId2jwkJqmnUmcWJ7fSersN+8nS2xlHylCmxsyvK1IxMJZ5
	dxHyqsHQihRUPQaktcdkEkgkwX3hdsoLR1FFZ0lrFNEXu5TALofh6kHppT/h5uw3YdCKAeRMx8Y
	X7yGsc1dEgD8JCoR9lgZ/k9/r6/VbjczKu+lhkx0wvkchkFygzY4yUJ57Rcx+zFGJJTykQJ7VZi
	0xCHiw+8m5OvEyVhrM8fu1VQkp5GtotCciVQ/MLwpShVwtl/3mcf5R9MvDN5A2pM=
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4583242a91.6.1791886438494;
        Tue, 13 Oct 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4583201a91.6.1791886437842;
        Tue, 13 Oct 2026 03:13:57 -0700 (PDT)
Received: from [10.133.33.200] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm21143079a91.17.2026.10.13.03.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:13:57 -0700 (PDT)
Message-ID: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:13:48 +0800
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX41PV1gchEy/z
 8LXw/f78AlUhmobLobZPJW1sOI7DqrntNfnL57xSNx6AVRKlOAsf+xElzd0h0zA7BY36c62sLKq
 UWPxlwA2+JY1Ycn8mGqPM/TIegX0RYwMErHR5yWZ+QNbFPkdpMq9LKtznXNEp2qKUASrZe4aFdT
 8Y012XwXUgDaAYl+0IiuUu0fAFqpDqKf/RFl4V5WNmw7dGmA/r2hD4MBCZePz/AyfujB1jRM3u2
 u07iM2vD+n7lCsnsYozpyErqcs2/Ln4MINU1YZYUsUVvTZmTLI8lNAdQkENV7tyTqgs76dTMG51
 xyZhpXyjT61Ki9gYd4I7/KttUE+oKG1KkW0PZsaCXBAzCJ9Hc3lmJYiC2GW0uTUGnZM8BblYeqN
 GGGaov6cx/eZMFihfPtIKfHzNy/PyFcCttYTyEN4gINEIYZjbvy3tQ8EzHRQFj1AOvCmKvV5UX6
 6qp5T/ztT9v4Y/XeZmA==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0467 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i3Ix9vWbyZrPCULteTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: i2hwYPIuLOBVJ-lG8ppXeRkWqiEvnK4b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXzI4w8opF1Ddm
 Sm0y0+ORkSI16IpFrV7MeYqq/8XkHEga1ud2rqdDyF0xPuJDi4stK06H9v1wo0hjmDSAkEXto5c
 c1oa1PUFF6voq/Mh2lcchHRAdNIIK/Q=
X-Proofpoint-GUID: i2hwYPIuLOBVJ-lG8ppXeRkWqiEvnK4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_111402_384950_30B3A544 
X-CRM114-Status: GOOD (  22.90  )
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



On 10/12/2026 7:27 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 12/10/2026 11:48, Yin Li wrote:
>>
>>
>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>> parent device and its CPU affinity is derived from that cache.
>>>>
>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>> the root of the physical address space, so each cache node only needs an
>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>
>>>> The nodes are disabled by default. Production firmware does not expose
>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>> This DTS is therefore only an example for other platform DT authors and
>>>> is not intended to be merged.
>>>>
>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> 
> [...]
> 
>>
>>>> +
>>>> +        msc@19870000 {
>>>> +            compatible = "arm,mpam-msc";
>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>
>>> The MPAM register length is 0x321C.
>>>
>>
>> You are right, the MPAM register space is 0x321c per the specification.
>> Will update accordingly.
> 
> That is the full extent but truncation is allowed by the architecture.
> 
> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
> 
> Does your implementation have domains?
> 

Hi Ben,

Our implementation does not have domains. So 0x321c reflects the full 
feature page for MSC.

Thanks,
Yin


> Thanks,
> 
> Ben
> 
> 
>>
>> Thanks,
>> Yin
>>
>>> Rob
>>
> 

-- 
Thx and BRs,
Yin


