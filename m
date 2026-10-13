Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7778CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=; b=LbOxBx2Y972bcVUBI38DmZy/2u
	1OjLysaydDiWxQuow7AcnR9c+12EOZ0StH/0sVjxHbSXdcHAgprZbW16E1sYkOj05hcz3AByiR2P8
	OZJIKp+5WlMhLRId3iXyJi8s8BbLAKmWjOeNvCZk7o9dROJspfipYg9rzFaOgz0AJ5ZdCJoiL7IFa
	txHeOQp2Z10COI30wWr89tkU3yfTVvJpV7Ls5HSJomDCK8hwQpxkGx+3F5cEXXU8D5JIpmBipPz+n
	q8pljCb5bP3YOojWpFmDlQ/HKA1VwSP0wN318mjMBUHdWvxXiT34Uu70YroWMD0olnsJHIGJSNTf9
	GagHxsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGa9D-0000000CdRA-2UoI;
	Tue, 13 Oct 2026 10:54:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGa99-0000000CdQ3-2sMh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:54:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXjR015275
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=; b=Y0dQ5vKBnEF1RQJR
	heApgmIEPAVPIo/tTxiW+kdDcPiNl4H1cvd44WvGQrIjWNGykMQGEj0HGk3Wsxov
	b0vCO4+yB3AI0ZG2D836u29qpR4iOHEPHIR8gLfh/d6LsiU9nqVP2ifenfVlKPl+
	K/zXIOsq/GHPgCFezdKyf8k8EY9UAxLCL0u67qf46kAzxs5v1cKkYkV7Q1qmDpmU
	hMFHyau2H1D/HBmMdfULDTZmGmpVy/NS+uWNflxTXoM/k/x2D4lu7qwt90YpkJWi
	x0CduRPdV5x1qYCTLq+j0t4vqGTcBrJpn/KSAXrE4421zN6CkfnF9KQEWsmLWOSz
	fBLlCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugvff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:54:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso44739185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888853; x=1792493653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=;
        b=FVS1rlXnYwpBM2rE496bJnQHr9yCtDB8+f9Npf31nqJyA99IuiiQdANx4lIZ0bcA6Z
         tLf7xrjiR/3wZJXvCmHv2+Jy/PP81MWBcY+niZLSy9x6AnE2/8l5NOC7QROFmgg90/M8
         9liDmr2hlvzShKb66dFzpdvUiM4146foFqpZJb6OaCg8tseeBXIc4KkecGosofqVmnX+
         4y+bmaP+7ELNQxaIv6gdNEE6g5WM03bl3dS7n8X2QPSVmMJuqovnBrThTTZr2rehYNsh
         7tIRoE1f6TyISBzMJY9fD+srK1zC4OqjzHizCnuNsyew8gcevj8R96AzG168THksm/N7
         szJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888853; x=1792493653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=;
        b=uuCAqCbEBPVIs89jJz4M7q5i1Lnr/G/+NhBmU1HaiVkJOJATmroZHH9/TNAZytXmGe
         +4OHBASyJXrpQm3uzc92n4arc8o0Ce044QOjf3QkKg1wSrC5kYtPpbvrbQ3q+5sArngL
         IrVjDZlhDiyRlLzU9niYC18Jtqz5e8m5+at3vIdcIc723ftJz7A8OPwv92T/NxCnIkNB
         mpGWWEVCqbTVNEfvD/WDIB+ZnP3SN49+Maael7qKRiIfcRc5l0iUgenT7X+73gTW5+Fu
         ZkOWVGe17GtYC0q5OxsFnbv0vAJFbsfy26aFL97mB7T+vZYQhX2gwMwW8GjcrOCfTyc6
         FWvg==
X-Forwarded-Encrypted: i=1; AKwUvByATFEX0Uho7yxfZEDEXqwuUoSebNQW71TpbXeN1t8QYOJLloVJdpb0sl2vL2GJ/5XyNQFzBQgHhkNRRoDxv4UJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIfF1lb0hBXRDN+Og4cZUgoGThLW7J4uiS77YUxjcYLM87gG1Zm
	DdLwjqFgwXZqTIlQMWu5GymVWFvQaxrj/TglUtl1F6FxBGAdwRstlLFKWOCZCQg5gkSsJY2Yqg9
	p8cFUzEeB7pr2yPOZLQgahoKEW8qpa85rjWlWcxREwPBEZ3ZLd1SVrDG64Vmg6ERu47GKvZUGl5
	ZMiQ==
X-Gm-Gg: AYBFou1bZ63NUlLwyZ/lRJ/g17iXI8i4mdxCuSa10pvli1OVp1wByyQSxdBjZBDRPh8
	4bw/oxXN6TwN3mdmBRhJ73tYSuGfSFAQmKbRPRGqo6G6CSf3xN0M1Gob8mCI7zyyB9Yff+8hDCZ
	DsDi65iI4kQMIqjbl68sUrMTWPUc24oyKUlaAoxoeiektmS4u/k/+fkMJP2fI6+myrHDrj4iA3S
	9VSDn1CLNPm19XdheZfauuNtFFOPc61cM25xGewIBH2pO9OZObSZ7ZuikRy8v+FeUH3RwfJWHqP
	73z3fdBzmlGU2KoO6VQOXOnY1JchQW/pEOSfxwquBnMINO2wfHSLJi4WUTS3bSl583wXITjv6Wm
	krmWgxcvUMkLaa8+S0GnG0Q==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2381550985a.2.1791888853252;
        Tue, 13 Oct 2026 03:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2381548385a.2.1791888852789;
        Tue, 13 Oct 2026 03:54:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ab4esm570186466b.29.2026.10.13.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:54:11 -0700 (PDT)
Message-ID: <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXwcBEjrlmvLmV
 9//K2HwK6qYQvICgmZLq8ZbKU2PkayxTaW1R7vke2iOnqkADMGHJji2lIDbXAo0IjXguRZsVcL8
 4wfqXNt+BPbcZ3Kp+GVMRX+Gk332g+agR2vcmR3YdqlH9HcUcaqDZ8nKx+ea0F/53QoOPZgyChT
 gwWEpO69Rnqhsd7YOd69D8PE/rk0OyA0HcaAkpS9kQb612KGrEzL+SBpkqRSjd2n3L31THdarHl
 Booed9lzV7n7dKpN/ZNbcBi5gA9dYXii1K8PVmuXivO8ZsVAZVFkYGpHo7OiSY0XnQ/+P9EkEln
 Xc4kdbSR4EaKFXMLUO/mFPdO0le8GEP0I7E4zLOqFrmYJxrHfyCX6S5f8NfEtmaLKKTAw5cj/Lg
 M12e/ddBwZkAjgN7VN1Hj/q+26uS1KRNdrpruR7lILRMohWGbGFx2RmRI/ws09Z7wQMy2o7IBZc
 +tK8+ip6QmIo8ZcTXAw==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0dd6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KDyaIH4IrjeDIlzbfNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BKkii3XqJ2N_uEg3fs05GC3VbyPjQWjv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX4D/Z/r9g3nok
 MFgXoJsyyQUxfGmCHc0rBCKJCg9wIySJOue7icYGT4uk3icP3WL1H3SnDFNr/Fp8HMS+RZd3etc
 u4X7DOSfkl2YS6mATjUJ0XYUjXPr9J0=
X-Proofpoint-GUID: BKkii3XqJ2N_uEg3fs05GC3VbyPjQWjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_035415_730577_51C29EF2 
X-CRM114-Status: GOOD (  17.51  )
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

On 10/13/26 12:13 PM, Yin Li wrote:
> 
> 
> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 12/10/2026 11:48, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>
>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>> the root of the physical address space, so each cache node only needs an
>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>
>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>> is not intended to be merged.
>>>>>
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>
>> [...]
>>
>>>
>>>>> +
>>>>> +        msc@19870000 {
>>>>> +            compatible = "arm,mpam-msc";
>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>
>>>> The MPAM register length is 0x321C.
>>>>
>>>
>>> You are right, the MPAM register space is 0x321c per the specification.
>>> Will update accordingly.

In Qualcomm DTs we tend to use the ""how much register space is allocated
for this block"" rather than ""what the last used register ends"" approach
to avoid holes

Konrad

