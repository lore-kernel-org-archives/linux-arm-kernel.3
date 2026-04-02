Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26262CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=; b=sDMr5sM96AtGwzsnBhcmtJlFck
	U/U05nM36kkJnfNbqxEm8Z8vqwPKmyn4kFPpzzSsstcGS5fTOdgI6wOKcceZaanCKZflB1PSOF1iP
	6fuRB9QAGMAJjEjMm2EbNgihT2iuHoFys/S0fLTToEbAzvSIvaUP4rzRS2fV+yOINXHYfBRcSKfrU
	xKGoqHV8xCAC3dZhZ+pM7Xub0LOwpGplduyeO7KZugWzL+zCUCPLOrFPddtbIyqyOXyM8SHtU86AT
	nS/L1tt5L1lZKl71aA7Nqw38XZaEmpa11F0YmUIYkIHw0ehWDwjUJ5uEH/SCVP0vRte1+iWINR3Pk
	fhcvWfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CGp-0000000H12R-1TIo;
	Thu, 02 Apr 2026 07:15:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CGn-0000000H11r-1VaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:15:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63273APC2903314
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 07:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=; b=Z0qwkRGPV5Pa3anG
	LSYxGqESmPkCyAtnYDmY5WRjqGdFCWUMEFdW2uMlPAWFjuq+m6bne7nQMdT/cdbN
	kXmUC4zM8cEAegY9lGekAmpSMFpP0aS8WZzm6i85rpjfUgkKpmlCvRra9OhYzBBr
	l9C5K6twqpbvfYkT0VDcBNOwtRzTEaVTVe5OTCYw46UQToUi5kmSOAn7Y34qpRX2
	5x283TF1G1raaCYsmIFJ29IRAgk9TjE6sLOQrw+nZWdfCExdSwNmYihr3JSeehdZ
	BjG0WBQWQKSgW9mvN5iwyEdjDyHtmQ7wyLdB0taDoNd5EYaDYNMYj2VwfCTl3Izg
	iqEpLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cbc7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:15:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so487099a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775114111; x=1775718911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=;
        b=A11rRx3sErQaWMfES5KyOOOkXWpx+DmHAMhiplEZYo2ak1SFVvChgEa2KZI4xdRf1s
         zzOga3H4zUKlEYoNw04GDBJCH2IKe+K/DVs+PX73b4fFZKLwGgRpM5iL16mq1bns1Ln7
         I2CLyvXzEDzaBgzg70bt185beWOm4qF4iEjC53c94MjI5S+4GFW225OonQn98OcS2td/
         W3bBmA/opZODuzFeeJh5J0BVo7ZJ+hrixJytJnNRZTFMJHvFnSU5lohIVvk6xuZ4F2zX
         yUecwEYMjyoKCG6khAElnEYGKZUkBwhvkiH2k6G+NlWcvnNXDD4zpHdXSldxKOgSzilC
         rL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114111; x=1775718911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHZnz1JLD7KjnjrT/icnsUWOTAJhf1tI9TDRmLu+vaM=;
        b=FMjzcoINqm2qjchxNNRfNkminCRw1JmWwc8UN04ZB40nbuxwvEmRUi+JLoDUgGrNaE
         id05B+UvWU9GOzkktsMa5+xRm1BQTz598VzcwSWjpROz+ET91LpyFPvjfhismGpSVNug
         6XUxA2eDld4XoVRtW85tv/o+E8lrnT1HYTLFQqg4cArFE6dvu4VaaBrxYSp7nqQ2PoM2
         pF15Z2WJmQOZOLFlxpZ+s2rSK68t52DsyZH1M22KuvRn2adS4Qp0bdWnih2vamKOqChS
         lDBultKcgj2Xt9TuxDrFXx4dx3pq/2OJq5eUeKv4WFlxoh5XuuCeUh479Eu/+1Ezu94g
         TCCg==
X-Forwarded-Encrypted: i=1; AJvYcCUx32PSKxFDKJC60CloWHVIUjj2zyFTv/2XAtUyQ4xWC8KnUAtVLBlsX+y8wCcgNp8mNjiSAqFt7NejK3MyqqrN@lists.infradead.org
X-Gm-Message-State: AOJu0YwVfkkrQY9RaYUCHXovn5DRszmbLX/HD5W8vA97vHp4xxTfkmAT
	qj3naPU7gbhvBgpWdt7ffhtY6bzDdNn7N++bkyiTK3UNpN6JJuDrhYjLXSD07DpagT/OalbZgfz
	bFHp229vVsl6p8LqOPss3BSYtu1OK7stNd9DoFXQAuFZAAQJG2gq9c0kX1HypAZnoKAYrcvVcKU
	LbZw==
X-Gm-Gg: AeBDievtFeHAPnGhTi5yzLlCxTxDnD4+rDO563plRqC1LOpl/BafSKUl1exjJG3/g5w
	ZtEcm6KfXrXZwpsHCkwh/agVuFwk7uU0nWE5D3fOtifVeWbmyVZnZk64D79sGTJDT0/0O5TZr8E
	XKTeMPVihx2JU+Rye3D/cBkWT3/dGvAevQiayAiRsajmw40Nm38MmHcy6FIKiI6Bs+77SqXrJ59
	7fPvb7VW9AVFF5aJhbfUP9thj67ihNW4FanUK2bU0S9zfsay7ODphzWNRhw6R3NWg0yc+0SSes+
	nVXtgTtJRravodPj7/Z0eC2+xtn7m5eKFuZndY2qRcdpjPy4wNIRoeuCzUROuzpHP1acI6Td9NX
	WcHjNbyKluMxYF9BCyzyz0APIj8Jyu5fmSLRcwLWIVHx6Vc8mr5fW
X-Received: by 2002:a17:90b:3e4e:b0:35d:8fdb:4f26 with SMTP id 98e67ed59e1d1-35dc6e2d0camr5522368a91.1.1775114111498;
        Thu, 02 Apr 2026 00:15:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4e:b0:35d:8fdb:4f26 with SMTP id 98e67ed59e1d1-35dc6e2d0camr5522327a91.1.1775114110887;
        Thu, 02 Apr 2026 00:15:10 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.224.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491157sm1629948a12.9.2026.04.02.00.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 00:15:10 -0700 (PDT)
Message-ID: <78c3e17a-9e67-4de1-9137-5fb617ff2e32@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:45:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
To: Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sudeep Holla
 <sudeep.holla@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <acrdFfk8al80dynq@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce1780 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j/PqwQOCDgRQPIT2BnD5zw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8
 a=DkhKwNFMYnxxsx_nhJ0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 5I4Ub1FKAsNpIl7U-mv-bP3O6zOiskhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MiBTYWx0ZWRfX2vbLKzf8WxEM
 ls63xN89hIfhd5bcUPpi3zE80VOXzbRsBjUaDhcNXZSIiTNjuniLmlQRUjpDkoAgPeNVDuUJpCc
 kwnjpBO9kPywl1YE4O5+MGOD+GzRgN4xrupe88DHvmi5XJvMyIEEyU3+gNBplg7Ab8b3pc4R/t2
 0Fxgaep6JK06fthKDbLKFBR/bT76osbiQp9jDbGfXWAlG69e/XS/B9o4zQ+kwUNhG5vrcSXx9Dm
 WpPEqJiU/tcly+r9uqr3S8VOdudE0xFxjPDv2mOOt93ExxcVpP3SbLit18uG4zKeCweMMVjQY/Q
 CSaARnkJCauUkjBS8lI5l6tpOmKU3RS8REf1TdAjHUuZEn3X40/5zrF73A8hdmXUD/7P4IBxL2S
 nUOK7mws9gh7j4Ta1mRTSOeTi5J3mkZsuL8SJDcq2Yk5HrOPSDFNXWUXr0TpPIfLZn01Y0GLIPm
 L2+zuylPUtITQyB52MA==
X-Proofpoint-ORIG-GUID: 5I4Ub1FKAsNpIl7U-mv-bP3O6zOiskhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_001513_420355_126AD802 
X-CRM114-Status: GOOD (  35.25  )
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



On 3/31/2026 2:18 AM, Bjorn Andersson wrote:
> On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
>> firmware to implement the suspend to RAM (S2RAM) functionality by
>> transitioning the system to a deeper low power state. When the system
>> enters such state, the power to the peripheral devices might be removed.
> 
> What is the actual extent of "peripheral devices" in this definition?
> 
>> So
>> the respective device drivers must prepare for the possible removal of the
>> power by performing actions such as shutting down or resetting the device
>> in their system suspend callbacks.
>>
> 
> Our typical interpretation of this state is that IP-blocks might be
> non-functional during this time, but typically some state is retained.
> 
> Will the acceptance of this patch result in that we in the Qualcomm case
> should start accepting/writing patches that implement save/restore of
> state that is generally retained throughout the drivers - in the name of
> "power might be removed"?
> 
>> The Linux PM framework allows the platform drivers to convey this info to
>> device drivers by calling the pm_set_suspend_via_firmware() and
>> pm_set_resume_via_firmware() APIs.
>>
>> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
>> mentioned APIs in the psci_system_suspend_begin() and
>> psci_system_suspend_enter() callbacks.
>>
> 
> With the right interpretation of what this means for us, I think this
> patch looks good - but as we've discussed, I'm a bit worried about how
> to deal with the alternative interpretations.
> 
> Specifically, if we fully adopt "power might be removed", we should to
> take actions which will prevent a typical Qualcomm system from waking up
> from sleep again.

The "power might be removed" not necessarily indicate that devices/ peripherals
should remove the wake up capability of interrupts in order to prevent waking up
from sleep.

The hibernation + suspend-to-ram is one such example, where "power might
be removed" but devices may still leave the wake up interrupts enabled.

Pasting from commit 62c552ccc3ed ("PM / Hibernate: Enable suspend to both for in-kernel hibernation.")

 |   It is often useful to suspend to memory after hibernation image has been
 |   written to disk. If the battery runs out or power is otherwise lost, the
 |   computer will resume from the hibernated image. If not, it will resume
 |   from memory

Which can be interpreted as wake up interrupt should be able to wake from suspend-to-ram state
"to the point until the power is cut off or battery runs out".

And in order to do so, wake up capable interrupts should be left enabled in HW,
for interrupt controllers like GIC (and PDC in Qualcomm SoC cases) to support wake up.

Adding Cc: linux-arm-msm for better visibility.

Thanks,
Maulik

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> [mani: reworded the description to be more elaborative]
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> ---
>>
>> This patch was part of an old series that didn't make it to mainline due to
>> objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
>> https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/
>>
>> But this patch on its own is useful for platforms implementing the S2RAM
>> feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
>> resending it.
>>
>>  drivers/firmware/psci/psci.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index 38ca190d4a22..e73bae6cb23a 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
>>  
>>  static int psci_system_suspend_enter(suspend_state_t state)
>>  {
>> +	pm_set_resume_via_firmware();
>> +
>>  	return cpu_suspend(0, psci_system_suspend);
>>  }
>>  
>> +static int psci_system_suspend_begin(suspend_state_t state)
>> +{
>> +	pm_set_suspend_via_firmware();
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct platform_suspend_ops psci_suspend_ops = {
>>  	.valid          = suspend_valid_only_mem,
>>  	.enter          = psci_system_suspend_enter,
>> +	.begin          = psci_system_suspend_begin,
>>  };
>>  
>>  static void __init psci_init_system_reset2(void)
>> -- 
>> 2.48.1
>>
> 


