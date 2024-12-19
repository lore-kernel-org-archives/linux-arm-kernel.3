Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57389E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC9j4qn/FyLxEEbFjtOVAun4nFzq1O7REVlrQjx9BsI=; b=5CepabrMZiaj8d+Reb+P2BFGJg
	0SUiVuEspA176YPGJu9nbc27FDzSWDjWnPuDEe34ELBAdRuISR0/9XLjZvtKy3P9wFREF90sksjfe
	a7m3BOZ0P8kYapWwcMjiYgoHOvu3w+vTSiGzRhm2Rp480P7WK21q8T0AfyKDu2clq9W5GbZ1HtuOa
	D+tn5m+UFe/eupQq1q7pHTfSo+DTrZjNWDJyyctNcxN7UGAP5mW4ieRfgjPBF76zm0b6kRiDWY6KK
	s6WtcDyqRkWdMefmpi3uL0W68YkgsQgGUL2ndFAS3LywhpHGYIsUPsP3kDQItHykKUMJL//Axhmaj
	0PQA28Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMMY-00000002sVi-2bDc;
	Thu, 19 Dec 2024 19:39:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMLR-00000002sMu-2oG3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:38:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJIxRmF000422
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HC9j4qn/FyLxEEbFjtOVAun4nFzq1O7REVlrQjx9BsI=; b=LbzZoI6+c5IoPcsK
	efvq37ZMWpDFitAeu5cWfUfS5hNJ0qkyZvDOPKpsZKULhcb31OQzZH4ZHyBQOD1i
	kwwdwFjcHv480sqErgmBKA4cBiFQXr39aV+IMef5upUznR1rNm+wWyyXvGtAPXQq
	rE3lHTvK17aGF4hw/7nFCQ8UhUQEwUGCAMqlPWN98iK8oVA4H3spHRo6X6Ik61NP
	9G3ivCiuGhrU1Dk+9K0VDE/ypczEdquU79edyRqOPQmssQt8baO51ax4cyJWihTp
	p2CaFuRQN1jeQV5LQoXWI2D5IRYykXdqSx5J38Symz+jFbY3NjIaVvlNMqIwgIQ5
	4Y/ORQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mg98spe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:38:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so2847311cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734637079; x=1735241879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HC9j4qn/FyLxEEbFjtOVAun4nFzq1O7REVlrQjx9BsI=;
        b=OyD3r916HYlxSUOakTpfGRsFdFVkBf/CHKawr0HE0SBMNJ2qS2wIOJuYJHh21iFP4m
         yn/lPX6LOXBsLV20jC7ihQJAW0qg3hLNBUNDMGcyRlaSFjwAPUoeVLFae997Vu4Zm+iQ
         FkjTNFOtvJOMORxA9BhVhMaz7+DQYoy8iwus9r8DpFDO2lcXIIMW9869TqhyBfi1QWaG
         +xNcFg4oi4QrdAnOvNwdlaNJjedJnKw16NSnNcyWqaIbQ6rFhSig9pUgasK3jv0Pw0rO
         6rWzjIhonbKZYFYvguNSfFoz5tREL//Y0d9vXfmy0qEgV1Co9DlzElZTKPX/+BXFkQ5A
         FoUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXIOvNU5gGI0iVsTKw1afAHfdkzbzXx3vrCF4QuOmMZd8x/URNYxpC3C1NvqLjFEHfojgRqP5qUG5c5fu5kehg@lists.infradead.org
X-Gm-Message-State: AOJu0YxCadfnEVMRgHWZE/MtLMSZSjF4SOQ4Arbrk6Kuq3OuVot36M2F
	vJgtHDrry9PBMiySTn9y1KpnkEDkbJxKEVDPOGB3SSSnE48ugXRENy1eOfuv/vbw1yuDIAUMX9j
	O26PoutEOxAoWlEKwBm6pjjuhWs1bj0EEspyTiCiEKclYCN9OEoFypcEiJ/Ym2xeu6K8dMC1DjQ
	==
X-Gm-Gg: ASbGnctdQa6i6qiW226hylz0EZw1gcuPuQy5Q8x5gZKYM1J8C3T+RaAzm6Z7aMIY4l5
	x55GH5odZjX7ETfJEe9IZ1LRmkm359casozE+W02rc1r79GXtZlXusonOZLC/5ccnKXGQsjsjH0
	I4NrmFNrgPqrLIV6l1yS6wTsVxBFJwlDIKNakwnmCZFcyVdOkcUOF/OhBjRISi8gGx2my1I1yMy
	+pxJsG2ntXkWvVGuT+ArBR5tQe5EBHvVTL39EVR9oWul4/5z4R+gZ1S6FDqkebjIqMmmPvXZdQN
	Y5cnD1z475witbssB0bILZGdhG6C0g/kvTQ=
X-Received: by 2002:ac8:5dce:0:b0:466:8e17:cd1f with SMTP id d75a77b69052e-46a4a8bd2f0mr1692881cf.3.1734637079452;
        Thu, 19 Dec 2024 11:37:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6eZ1hPm9VshRpaWBtbzEdzv9YXH+aJGXnq0b2h5XRFijyIzlrz4xKKzK4e8BD9Eu369c+Jw==
X-Received: by 2002:ac8:5dce:0:b0:466:8e17:cd1f with SMTP id d75a77b69052e-46a4a8bd2f0mr1692571cf.3.1734637078871;
        Thu, 19 Dec 2024 11:37:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f074sm979025a12.25.2024.12.19.11.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:37:57 -0800 (PST)
Message-ID: <c970cf8d-a174-4c10-85ca-00f66056a621@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <CAPDyKFpGrw+vOs=-TxfChBeORjzkpaL_iVB08MtmaC4sFNKzcg@mail.gmail.com>
 <72add0ff-db2a-44f8-b4af-0b5fe5f65f20@oss.qualcomm.com>
 <CAPDyKFq5+HWmHK4E4ERx1rb8O4mubHGqRHP8AAiq2KyZyX1GSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPDyKFq5+HWmHK4E4ERx1rb8O4mubHGqRHP8AAiq2KyZyX1GSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lsH5KtbPKpMW0twHdEGaNf5aizobkhyA
X-Proofpoint-GUID: lsH5KtbPKpMW0twHdEGaNf5aizobkhyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_113801_724170_85213E86 
X-CRM114-Status: GOOD (  45.65  )
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

On 6.12.2024 10:53 AM, Ulf Hansson wrote:
> + Maulik, Vincent
> 
> On Thu, 5 Dec 2024 at 21:34, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 14.11.2024 4:30 PM, Ulf Hansson wrote:
>>> On Mon, 28 Oct 2024 at 15:24, Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
>>>> CPU_SUSPEND instead. Inform Linux about that.
>>>> Please see the commit messages for a more detailed explanation.
>>>>
>>>> This is effectively a more educated follow-up to [1].
>>>>
>>>> The ultimate goal is to stop making Linux think that certain states
>>>> only concern cores/clusters, and consequently setting
>>>> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
>>>> NVMe, see related discussion over at [2]) can make informed decisions
>>>> about assuming the power state of the device they govern.
>>>
>>> In my opinion, this is not really the correct way to do it. Using
>>> pm_set_suspend/resume_via_firmware() works fine for x86/ACPI, but not
>>> for PSCI like this. Let me elaborate. If the NVMe storage device is
>>> sharing the same power-rail as the CPU cluster, then yes we should use
>>> PSCI to control it. But is that really the case? If so, there are in
>>> principle two ways forward to deal with this correctly.
>>>
>>> 1) If PSCI OSI mode is being used, the corresponding NVMe storage
>>> device should be hooked up to the CPU PM cluster domain via genpd and
>>> controlled as any other devices sharing the cluster-rail. In this way,
>>> genpd together with the cpuidle-psci-domain can decide whether it's
>>> okay to turn off the cluster. I believe this is the preferred way, but
>>> 2) would work fine too.
>>>
>>> 2) If PSCI PC mode is being used, a separate channel/interface to the
>>> FW (like SCMI or rpmh in the QC case), should inform the FW whether
>>> NVMe needs the power to it. This information should then be taken into
>>> account by the PSCI FW when it decides what low-power-state to enter,
>>> which ultimately means whether the cluster-rail can be turned off or
>>> not.
>>
>> This assumes PSCI only governs the CPU power rail. But what I'd
>> guesstimate is that in most implementations if system-level suspend is
>> there at all (no matter through which call), as per the spec, it at
>> least also projects onto the DDR power state (like in this i.mx
>> impl here [1]), or some uncore peripherals (like in Tegra's case with
>> some secure element being toggled at [2])
> 
> Right, I certainly understand the above. There are different parts of
> an SoC that may be sharing the same power-island as the CPUs.
> 
> The question here is whether the NVMe storage device is part of that
> power-island too on some QC SoCs?

Yes, but not exclusively (i.e. there can also be other voltage rails or
similar that may or may not be manged by Linux, depending on the SoC)

>>> Assuming PSCI OSI mode is used here. Then if 1) doesn't work for you,
>>> please elaborate on why, so we can help to make it work, as it should.
>>
>> On Qualcomm platforms, RPMh is the central authority when it comes
>> to power governance, but by design, the CPUs must be off (and with a
>> specific magic cookie) for the RPMh hardware to consider powering off
>> very power hungry parts of the system, such as general i/o rails.
> 
> Right, that is why the "qcom,rpmh-rsc" device in many cases belongs to
> the cluster-power-domain (for PSCI). This allows "qcom,rpmh-rsc" to
> control the "last-man" activities and prevent deeper PSCI states
> if/when necessary.

Problem is, today we only describe the RSC connected to the CPU cluster.
Newer SoCs have multiple RSCs, which long story short allow for certain
IP blocks to operate and have their power managed without the CPU block
being involved, or even online.

The CPU RSC can only reliably probe the CPU online status, as all other
IPs can be requested to stay powered from an external entity (e.g. a DSP,
secure world and similar), so the driver can only do its best to try and
prevent obviously-going-to-fail idle entries when CPUs are online.

>> So again, PSCI must be fed a specific value for the rest of the hw
>> to react. The "S2RAM state" isn't really a cpuidle state, because
>> it doesn't differ from many shallower states as far as the cpu/cluster
>> are concerned. If that all isn't in place, the platform never actually
>> enters any "real" sleep state, other than "CPU and some controllable
>> IP blocks are runtime-suspended".
> 
> We recently discussed this, offlist, with Maulik - and I think we need
> some more clarity around what is actually going on here.
> 
> In principle, it looks to me that using S2I with just another deeper
> idlestate specified (with another psci-suspend-parameter, representing
> a deeper state) should work fine, at least theoretically. Of course,
> we may not be able to use that idlestate during regular
> cpuidle/runtime but only during S2I, which we need to control in a
> smooth way and that is not currently supported (but can be fixed
> easily, I think).
> 
> In the end, it's the psci-suspend-parameter that is given to the PSCI
> FW that informs about what state we can enter.
> 
> That said, using S2I may not work without updating the PSCI FW, of
> course. For example, there may be FW limitations that require the
> boot-CPU( CPU0) to be the last one for these deeper low-power-states.
> Whether that is just a FW limitation or whether there are some
> additional HW constraints that enforce this, needs to be clarified.

Yeah, not being able to runtime-idle into that state is one issue,
and another one being successfully entering the S2RAM state may
require us to reinitialize some hardware. Currently, Linux has no
way of knowing that state is any different from the rest, but
marking it as S2RAM would allow to check for PM_SUSPEND_MEM vs
PM_SUSPEND_TO_IDLE

>> This effectively is very close to what ACPI+x86 do - there's a
>> co-processor/firmware that does a lot of things behind your back and
>> all you can do is *ask* it to change some handwavily-defined P/Cstate
>> that affects a huge chunk of silicon.
> 
> Yep, there are similarities.
> 
> However, ACPI is for generic device power management. PSCI requires
> something additional, such as ARM SCMI or QC's rpm/rsc interface.

Right, we're not yet fully there with "for_each_device(fw_shut_down())"

Konrad

> 
>>
>> Konrad
>>
>> [1] https://github.com/nxp-imx/imx-atf/blob/lf_v2.6/plat/imx/imx8m/imx8mp/imx8mp_lpa_psci.c#L474
>> [2] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/nvidia/tegra/soc/t210/plat_psci_handlers.c#L214
>>
> 
> Kind regards
> Uffe

