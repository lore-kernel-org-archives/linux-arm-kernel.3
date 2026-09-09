Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20797C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ajphOkjbnMWFf+zls/5ssNbY32CcGa+IxG2/SOuj78=; b=A3CjMiLQZRr2a5dquQqXpKvJxw
	487RcycySxaOSgVHs9psZoDgCfgpchN7pLS4mdRG5UHuIsnRU/NAfoe1VPLmAUVPZ6/vJ8OjIxYR6
	XYjhLZ0jK3TaN8vHBWLr7ibnRmw1U5+RJtqXtzeqDXbxBQh2MBazH5WtdV87TN0bOeFJsduQ3WeWI
	eIm0cDzDSKgwkpNqc6D7U0z0NWl/IGu1sQ/dfXLzKO2zcXaaUh+1+fVTYkWK1JqxA5oDa50VNBee+
	muSp4PiX8zPfmT6H4A1henGO4CUh5k0BxVUWlRjWIgSYyQHjUmpQpleRZMAeWndwoABFVuIvowAJT
	/nAQcVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Br7-0000000AtEt-1KyL;
	Wed, 09 Sep 2026 06:32:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Br4-0000000AtEK-2br8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:32:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892a2dh1189172
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 06:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ajphOkjbnMWFf+zls/5ssNbY32CcGa+IxG2/SOuj78=; b=DSGDtOXzrj61WcEY
	BV4edgvHYUcWAxz8Af3Sto1O+XH7khrgyCvwrRat8e1TBI/LnI7ii5fgk1TKzCa8
	FROaf9DGOTNDsM1k0YqUmxD7EOQZTDi4B0fU5IqoMHgi4zKQiPxO2EQjS1NAP890
	fJmQKz5LKnkAwvp3i5sEo5aeUQUY0MVp94ubKo9KNinGBiGPmA6HrhZeqL1+lV0C
	bADLE9z/JZMG2NWS8Qlwtun/fQ/wpzge5jwkzMhAUfJ8wgdM6S/hJtFvEKr16o6G
	Z4UMNYmdTrWgcq5whHxIN2kHOkz3nJsuxxD7itjlw9n+FesbquWKydcRlHxhp/5C
	A4Rcow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm0sn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:32:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so6438906a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 23:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935539; x=1789540339; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ajphOkjbnMWFf+zls/5ssNbY32CcGa+IxG2/SOuj78=;
        b=QkvPyKZm1atZfshCOVau4CUJKJm79u/vgEEicmHwDp3r5FWNVAKdgQ6GaO5aNhR9jC
         jI4EkzWrk1bgBsA9+lSHzuoERNNNQ75KzXiZ8T6u3jEPWGWXBvxr3J6hQ2RXDx9pUciS
         Ke9afcWFBJruwS80Mig+I8hSurcRaHKGL8NKA72uiFt9IsRTEQeEfWkV4Zhrff2OcEB+
         5PMwfzX2sL6OM0O3AFhYHrtceIpxUndl/Ut1gJD2PB5DixdOWrnnSeoGz30foiO+kXjs
         OmVCAGuii6fysUQYP0KHHF5K5r/En1WKXyMTznXb9f1UmC7Rnch6K05zTj63hU4S2FKp
         1xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935539; x=1789540339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ajphOkjbnMWFf+zls/5ssNbY32CcGa+IxG2/SOuj78=;
        b=gGqAUT+X42RJr5gXDY4cdFWz/pc4hT0Ey5qwfUHQDsAtqXmSlMBxAddvfIwOTOywQN
         bf9ANH0MNuVFDaZWHdFmnV8JNpuMna88VVmPe5fesn7VbTRKHGhMm0e1FZu3ITvskl4X
         xneuIQnZDiNkXk8dZodxjuoWySwHHgVlRL2OEtHx9ov4rDL6xnDG/P2xSnzu0c7+RzAf
         0wHW25yrbfWcawr6qzFGgQmZOKj2BPKn8BYgWBuXmiF8bytIZjwHUf1T5nQzQnAC2zLQ
         6gWnw6jIdkjxouXVTLBcl0tESKKvHn7GtHa1ieylSkqR0Swi0LOr/7i86oNLmyxnE87j
         Jlzw==
X-Forwarded-Encrypted: i=1; AKwUvBy1vwcjtbLCZM4wUa8GUIN7ib9nSjGDgni7LHKhvcoYP5hgkRyd12HozaV06F/qDEYgwnnHmSE2x7jOs7jSZiq5@lists.infradead.org
X-Gm-Message-State: AFuF++lTJW+P7Cju9VctH2DToS5thIjlhOXSWwNxXayVljtX5wIHHrlu
	QMoUiYv1LBB3nr9PQMbJTnMZ2OZayGrZCGYUa/rQAQOusnFsHMPOGbNQqZUXic1p/Q1hHubPcTO
	ZTgDebVpbuNhZcUW00TQM1O6oA4P/gxL7BgsS5civcqn3j8fvxG6pT8/Z2wba14sHcyT3QM4SkQ
	J+UA==
X-Gm-Gg: AYBFou2fl/dLNcd1KkuzqaITBb2WoE9fuq5g+zIka++4/ouQi6ICeq9VrLcYwYgtGzV
	gGL+QRylXSZncgBZWVEcTArgIq0OErq0h+CLBXiwBJTkVRa5Xu0TFCLf+IV3DTRCv88eR439y2C
	hbxSzM4UdPUW+np7f8tXIJ+n/wb71fdHEVaR1MgrZFZxLijjJOVA6UiEp7pI8OXMWlf7o53Jt8K
	u2o+rH0jp8pqF0qnJsSrSwbw0OGw4eITXhb2bcrxLKKSNlN6R0GelKn8fRbn90j0q54R64FIjSU
	gnmRp1oI73UdKfqsoJO/WIFAhr1zEYv8shJcYSJBxM2wcX36QijledAGFJ5326LR5XMGw6iVbQH
	rFxPEi2jE/4HZfbv1Xgt59FCGbQMo1nI=
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr51435535a91.21.1788935538941;
        Tue, 08 Sep 2026 23:32:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr51435476a91.21.1788935538373;
        Tue, 08 Sep 2026 23:32:18 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35490264eec.4.2026.09.08.23.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 23:32:18 -0700 (PDT)
Message-ID: <4e7dd5bf-28e2-4c81-8e8b-7629f298b92b@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:02:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfXzWI7uUN0htjy
 kDfZ5kdAaXDQPb2RakkLVPB3FJpb3fNM/6WktR0uvxW/9Yoy6Eo0LKqmhjK0G52KXeutWS/tpxl
 VsdDqAfrx9TT1n1cKQC5pStUZjzPquQ=
X-Proofpoint-GUID: 2MxcgeUgg6YiDp2bjhn8hhPc3nmnatoK
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa0fd74 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rpn9IkJt2xtg3tKW1hYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 2MxcgeUgg6YiDp2bjhn8hhPc3nmnatoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MiBTYWx0ZWRfX7wPloJX7k6Oe
 4Idfs0RWYQP4LN+90utnpoD2Euy/h3utI6TZyEZP7+1lnLUN06Mbgimlsa1Ic3wF4r7wQx+vN2C
 SeCbI8LJxWILNIdH6sOWPBlyya+rZwbFI5bYxLOdghjIF0q2p3RuI22onLIcs1xlOKXZy2AcJ/A
 DfUEk3mwxMx0NkUc/gbHRgJA5IhTmq00XlSVhZSal9slX0L/Y4aA6ezjmIux+V5DIuQRXZKTz0p
 1tBYCjjY1GLZWIIlQ5CfzKA3drWscVZ0vveYcXrH+/sdX8hcr6dJl6SWQtArKA/qw/jHpy8gPi5
 ZoEvqOSgRdPlALCO1vGfRxVOQF7WlJ3JD0ryEQc7+0HAKp9KbD2642IQaGwE75x//cCcCFU2HaJ
 him4nYLvGrQWz9VCMl+HG8yl+N91y48yhPoGYMt+g/LbUZLG+5PBYgXChaMRMPxZl6rqO2yASq8
 8oOaPlTX/26QB3to5/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_233222_781431_7192761C 
X-CRM114-Status: GOOD (  37.41  )
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

Hi Ulf,

Thank you for review.

On 04-09-2026 13:26, Ulf Hansson wrote:
> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
> <praveen.talari@oss.qualcomm.com> wrote:
>> Hi Ulf,
>>
>> On 01-09-2026 20:22, Ulf Hansson wrote:
>>> On Thu, Aug 27, 2026 at 7:59 PM Praveen Talari
>>> <praveen.talari@oss.qualcomm.com> wrote:
>>>> On firmware-managed platforms such as SA8255P, there is no Linux clock
>>>> handler available to determine the appropriate SE source clock, source
>>>> clock index, and divider values for a requested protocol frequency.
>>>> However, these parameters are required when programming GSI TREs, where
>>>> the hardware expects an explicit clock source selection and divider
>>>> configuration for the serial engine.
>>>>
>>>> In contrast, platforms using Linux-managed clocks derive these
>>>> parameters through geni_se_clk_freq_match() using the source clock
>>>> information stored in clk_perf_tbl. Since the firmware-managed path
>>>> lacks equivalent clock information, protocol drivers cannot reuse the
>>>> existing frequency matching logic and instead rely on a direct mapping
>>>> between protocol-requested frequencies and performance levels. This
>>>> creates a separate clock configuration flow and prevents
>>>> firmware-managed platforms from deriving the actual SE clock parameters
>>>> required for GSI TRE programming.
>>> Hmm, this sounds like moving backwards when it comes to keeping
>>> drivers as portable as possible.
>>>
>>> I understand geni_se_clk_freq_match() has been around for a while, but
>>> fortunately its use seems limited to only a few qcom specific drivers.
>>>
>>> Rather than continue down this path, would it not be possible to find
>>> a more generic solution for "geni_se_clk_freq_match()"? Can we replace
>>> it with a common clock/OPP API? In this way, we would not need to
>>> sprinkle drivers with calls to platform specific  code.
>> I agree that protocol drivers should not need to know whether GENI resources
>> are managed through the clock framework or a firmware-provided
>> performance domain.
>>
>> The intent of this series is actually to move in that direction rather than
>> introduce a separate flow. Today firmware-managed platforms cannot use
>> geni_se_clk_freq_match() because clk_perf_tbl is only populated when a
>> Linux clock
>> is present. This series derives the same clock-performance
>> information(clk_perf_tbl) from the OPP
>> table and populates clk_perf_tbl during geni_se_domain_attach(),
>> allowing both
>> resource-management models to reuse the existing
>> geni_se_clk_freq_match() infrastructure.
> Right, the goal makes sense, but I am not sure the proposed solution
> is the way to get there.
>
> We really want to avoid having generic drivers like (spi, uart, i2c,
> etc) calling platform specific functions. This isn't just me, it's the
> general way for how we do things for drivers. Of course, we have
> exceptions, but I think you get my point.
>
> In this case, why isn't it possible to use the clock and OPP
> framework? Is there anything missing to make this work?
I agree that protocol drivers should ideally rely on generic frameworks and
avoid platform-specific resource management logic.

The challenge here is that the OPP framework currently provides a mechanism
to select and apply an operating point, but it does not expose the 
GENI-specific
information required for GSI TRE programming. In addition to selecting 
an operating
point, the GSI path needs to derive the corresponding SE source clock 
frequency,
clock index and divider values, as these fields must be programmed 
explicitly into the
TRE descriptors consumed by the hardware.

Today geni_se_clk_freq_match() serves two purposes:
1. Match a requested protocol frequency against the set of supported SE 
source
     clock frequencies.
2. Derive the GENI-specific parameters (source clock, clock index and 
divider) associated
     with the selected frequency.

While OPP can manage clock and performance state selection, it does not 
currently provide
an interface to obtain these GENI-specific clock-configuration 
parameters. This is why the
existing GENI helper is still required.

The intent of this series is not to introduce another platform-specific
clock-selection path. Rather, it allows firmware-managed platforms to 
use the same
clock-matching infrastructure already used on clock-managed platforms by 
deriving the

clock-performance table from the OPP data.

I have removed platform specific set_rate callback in patches for SPI 
[1] and Serial [2]

[1]https://lore.kernel.org/all/20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-6-091697dbeb02@oss.qualcomm.com/

[2]https://lore.kernel.org/all/20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com/

>
>> Likewise, geni_se_set_rate() hides whether the underlying implementation
>> uses
>> dev_pm_opp_set_rate() on a perf-domain device or a regular clock-backed
>> device,
>> so protocol drivers no longer need platform-specific callbacks. The goal
>> is to
>> converge both paths behind common GENI helpers rather than maintain separate
>> clock-selection mechanisms.
> The OPP layer already has some capabilities for managing clocks. Can't
> we use devm_pm_opp_set_config() to prepare an OPP table with the
> relevant clk data for the devices, as a way to abstract things?

devm_pm_opp_set_config() with a .clk_name lets dev_pm_opp_set_rate()
internally call clk_set_rate() on a named clk — but that requires an actual
clk provider backing the device. On SA8255P there is no Linux clk object 
for the
SE source clock at all: firmware only exposes a set of supported 
frequencies as OPP
levels on the performance-domain device, not as a rate-settable clock. 
So there's
nothing for devm_pm_opp_set_config()'s clk-integration to attach to — 
the OPP table
here isn't describing a DVFS operating point of an existing clock, it's 
standing in
for the clock itself.
>
>>>> To address this limitation, the performance-domain OPP table is treated
>>>> as the representation of SE-supported source clock frequencies. During
>>>> geni_se_domain_attach(), the OPP entries are used to populate
>>>> clk_perf_tbl and related clock performance data, allowing
>>>> firmware-managed platforms to leverage the same clock frequency matching
>>>> infrastructure used by Linux-managed platforms.
>>>>
>>>> With this change, protocol drivers can use geni_se_clk_freq_match() to
>>>> select the closest supported source clock frequency for a requested
>>>> protocol rate, derive the corresponding source clock index and divider
>>>> values required for GSI TRE programming, and apply the matched clock
>>>> through the OPP framework. This removes the dependency on direct
>>>> protocol-frequency-to-performance-level mappings and provides a common
>>>> clock selection and configuration mechanism across both firmware-managed
>>>> and Linux-managed GENI deployments.
>>> Rather than adding yet another platform specific method, would it be
>>> possible to extend the generic OPP library with the pieces that are
>>> missing to make this work in a generic way?
>> I agree with the goal of using generic infrastructure. However,
>> geni_se_clk_freq_match()
>> derives GENI-specific parameters such as the source clock, clock index,
>> and divider values
>> required for GSI TRE programming, which are not represented by the
>> generic OPP interface today.
>>
>> This series does not introduce a new clock selection path; it reuses the
>> existing
>> geni_se_clk_freq_match() flow on firmware-managed platforms by populating
>> clk_perf_tbl from OPP data.
> So geni_se_clk_freq_match() is used by two consumer drivers today,
> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
>
> Beyond the $subject series, there will be even more consumer drivers
> that call these platform specific functions. As I said above, I don't
> think this is moving things in the right direction.
>
> If this can't be solved with generic frameworks (clocks and OPP),
> please clarify why so we can figure out a better way forward.

I believe above response can answered your query.


Thanks,
Praveen Talari

>
> [...]
>
> Kind regards
> Uffe

