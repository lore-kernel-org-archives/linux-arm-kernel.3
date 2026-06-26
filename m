Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676EDCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=; b=1V5jfX993p4IlwMAQbo4zTZJmC
	A5jAdwD+jNmMgFmWY/Up9OsAVGLCqRulIDBLXPbbVOq+X55FZmQy1utrRzVOyeWlPY5cKyFOVazv8
	kKqYejjQlTSTnbnPfJDPZ0Ck9L3A60TiwiLMEMbjCr1LKInxLv2vB9rmL3vTWbsd45kl3/oBQFg+P
	8dJIt0cv6MwLDx5gNOJGIlcyeeAkGfYjWXjcZYY7YqJQaIY+QKnzXLHdDxn6Rozj/aAShfDo0YT6/
	J8NHMQZrtIx/qFOQo8iYmetkrTK4Jq2fXo+QfOlNRFaVx35T9BsUyGngNwi0BB0htPiSf+IDMHJoX
	STQ/fVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Nr-0000000BINu-2wBT;
	Fri, 26 Jun 2026 12:10:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5No-0000000BINV-25nT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:10:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcmVP1190041
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 12:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=; b=f5p5xX+X6/f6fpdR
	K26gIX/+aXlqDiIERDcNT708mo921FaqNWz5VlJtoyNUgeHMZC0i6zE1dyucfOta
	7nkQIlRLOgiRHyWTWUD5k0icuPL6+Q88hpMnfaNiCvGozZ0f2X+SnovCks0Bu/9b
	6d8Hw45iulsDrcK8r/1bkeGImDEP4p83QKzpCDV2FpqdcbyQKbRKTxepPuHO0UTA
	ToqAUMH2SQtlXCUCzPGtydCpRaGNJtOrn9Jf+GbhCI1kEZ11EPWOY7S5Kimr85MZ
	GrplTelwJbDAkG6QVasDQ5zEOMGjDr2lUWkI3gdO7Ai6Nq9hDTnpfV35VBL9mxa9
	KgJoKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1askudbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 12:10:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a9bbcc53so9099345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782475806; x=1783080606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=;
        b=HgCymIs3fPfLr75z2giz5Fs0q98Sl0anRwyH14KqqpYAHcgNWAW/JGndoOHrHgp0DM
         KuukkFrtsJqKUxHGYnihYORokR2zhjGAmpiCBIEnE1Qeps8I1pe7Dh4ZO316dTQ9+898
         2ANBCk5/PHp1vWAigRwXzGLqhjfbcaqTRBNN+AQ/p9wK04F84fPmZ/HhXTkvnDZFs9KL
         Gd+S2ePpTdXEgbqCtYWfjVsPEywdsU4wC2xVtDHp+cpQanzBmQjLoeTKZbCtrswU4mdv
         djRxEiZP2S/sfEXBVPCA5E+IoKHpoSo43RKNT+6dMmuKMtdpHUngkVpcMQ5pDiloCL1q
         q26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782475806; x=1783080606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSiaVRVWFJVBQaB5XydkF7gUNK0imSHXFahJpoXMMt8=;
        b=GLN9CxP1j2br2Gb4f/n4zKVTGKnXZE+CbekdQXUn6wj0MJEX3gxDKoos5tkltJNbvv
         zGaCXquFRxwwjZeGTDEo5+z4kVE6xw5NcpJlHcoYwNRbK4zsPZFjD+D35Oo3LWX1U6a+
         nStA3Kz656z0I1T6IhlSoEceF7gFyG7DspR+kfPTSHm2dLrIHA7EuuYDfsS6JbAsL3sE
         CkbG5BX9/OI+DXyfvwk1svHcgWaimPqnrZ6HfECIfwUTrqXacsIfCzGqsodm08MKj3FO
         UVQMxODo1X5HE9qgOMmA3AjZib8+3bNd9RPVMAMJ7Eo7gbo6vjLFTVkt4tJVwkSvEPR8
         aGjw==
X-Forwarded-Encrypted: i=1; AHgh+RpY5a7e33lHusnaDLap1nRDi5Q4mcYlgK2Q8XzHj6BNOvEx89/7QeaNOyL255FSoEMlX1rALO6X8OTfqQHzr6g7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn7sFRmdBm+DrVFOLsNDu3XfMicMUI83HDcRTuOnIXs/kNcdyb
	L/1k7POMQ8dmQbksfxLMag+fFOaN3CL0L4usPdqMwJSQvJB7L5YsAiIWD015XViVAMvVfbcGsqt
	9eECAhWUF2cys7DS0e9gwQVqJOOPOg4xgaUl475QVTLlEkegCO2Igwce1zb8BuTAiEt/I7kBrZh
	aMsw==
X-Gm-Gg: AfdE7cmn/XpqGdnyTSWXhM6Av08NYDS1QHbo6agLh4C2lMz1cgx8tAon7x5mNqCE5kV
	4V92bGAh7n5kx7hT/99WD3royDE+x+DlClKkr73g29v38kslI2bslgJcPiDol/POixjmviIxia+
	Sj1UUIUeDqBMerEqYJfvJvUOlfHPk7i/CIu3UxF2HcxWQzwSW9IwPgGizbfXStNdgnHZgRNOcWe
	uK9smVUFOHzV/vlaohlYR6D1PuEueAlJQW7NWNrGF9kWlJVgcsD7vhSZbD8Vu9o5a09yU2KQAal
	DxvB6RgydByJPO5wMRsA53cBjXRoPDA7JE70qV5RUAH8dgqRciH9ooGufG0mXx4rRK3MWL11FRp
	hXXMs7h7F5nUq7JfuaqrlZy+V5Mw95+BjkIF30r4UXHYjoSvvyO9jmiUd/z7WLlmGAOHPRVOCmP
	g=
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr69578335ad.21.1782475806143;
        Fri, 26 Jun 2026 05:10:06 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c7fca15745mr69577975ad.21.1782475805623;
        Fri, 26 Jun 2026 05:10:05 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ae5ecfsm38353295ad.21.2026.06.26.05.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 05:10:05 -0700 (PDT)
Message-ID: <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 20:09:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260626103015.GE575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5OSBTYWx0ZWRfX9DPEnqjUGH3A
 /qUKY6+vZb9ZgDIncsRvScTXo1+hvMumy8KWuFw3Nx6zKO05IxNnrrwnr7pTTMKmMJHty3exoDE
 v/XXwXgs6MMLrwDsnDUC3KwPsXQvxWs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5OSBTYWx0ZWRfX8DGXIcuK/Oxs
 IydOfPMXC1OG9mnScfv8cKxHOInG3n9PrclBO86YCRPvUXEyTlRMa/l6KA6yA9SQSIoqKA9Q1Up
 FxfPtoEoXWFXSQgoTcspNzsB6Lseo4+EEyGpUxcKqGYDnrrUj4R6EMFzWk3ts3mGQksreFckJgb
 CQR3qv3sXn3LL7O79nUMFGXbyzlOQXX5UcNBY9I55EwAOddCKXLwpR1ElSHWoBx0xiDPUosxSvu
 J4zRsaCaROFBi+8e+b4x0nKK8Rm/M7gmF19Sc8SyKEBBKHLm0Dcif5jUjFzQj01pz5p95cndC1n
 6taK+0FI5gOdW5LeFXPiBAf1U3ohvIn1oHMHHWEynWcqPvnCa8V+a4DaKgmdN2a7x/wK2eGxuEZ
 3PPZKqQqsP5/hrPfPrSr/XMsCU4lETTxJRQMLVGyj7q3A5RO0dTZxbBjEIm+kPKracSrl7j1GEo
 nFr3kzzit/lLUq+GgWA==
X-Proofpoint-GUID: OygcNbXFNZ1G3C0roxQ2Jgy4LX2riPZ4
X-Proofpoint-ORIG-GUID: OygcNbXFNZ1G3C0roxQ2Jgy4LX2riPZ4
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e6c1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7eVLfvEy65BM8Fiv0Z4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_051008_692508_72171195 
X-CRM114-Status: GOOD (  25.65  )
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

On 6/26/2026 6:30 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Fri, Jun 26, 2026 at 10:03:41AM +0800, Jie Gan wrote:
> 
> [...]
> 
>> Hi Leo,
>>
>> To be honest, I would prefer not to modify the interconnect platform driver.
>> On some Qualcomm platforms, multiple itnoc devices reside within small
>> blocks(one or more than one for each block) and are connected to a dummy
>> source. In such cases, two ATIDs are allocated for a path (the dummy source
>> and the itnoc), which is inefficient. This is why the itnoc platform driver
>> created to avoid this waste.
>>
>> The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which
>> connected to multiple source and link devices, aggregating data from all
>> source devices into a single output path.
> 
> As I said, it may be fragile to couple a specific device property (ATID)
> to the AMBA driver.
> 
> You're now facing a case where a device cannot be registered as an AMBA
> device, so it cannot use ATID. Likewise, I can imagine in future where a
> device is registered as an AMBA device, but you don't want ATID.
> 

Agree. That's possible.

>> This device is implemented as an AMBA device but lacks proper hardware
>> configuration. As a result, it must be handled in the driver as a
>> workaround, which unfortunately breaks the original design intent.
> 
> Seems to me, it is not reasonable to pretend an AMBA device but AMBA
> ID registers are absent.
> 
> How about add a new DT property ("qcom,tnoc-enable-atid") to force
> enabling ATID?

That's a good proposal.

I have another proposal: what if we allocate the ATID in trace_noc_id() 
when the device does not already have a valid ATID?

Possible scenarios:

If the itnoc device is connected to a TPDM device (which has no ATID), 
trace_noc_id() will be invoked via coresight_path_assign_trace_id(), and 
a valid ATID can be allocated for the path.

If the itnoc device is connected to sources other than TPDM, 
trace_noc_id() will never be invoked, and therefore no ATID will be 
allocated for the device, saving resources.

Thanks,
Jie

> 
> Thanks,
> Leo


