Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEED6C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=; b=NH6LwxnPvxo2tZ/0nhyqIwdPg5
	4GF93szLkGszRRu98J/Mpu95Nys0hey+6szfhPTgR59FwFQ5Nww9j3HWBYhnS5NGrQfANOZoV9N3c
	RXUuXraUeijnA3IN4PDmTPxU0MC6S5OHvpCfGrJfYSRhhqGrh1vCf4GeoQ+XKnxw8dm7NRwEt71zZ
	HrEoaEeAfwD+q1G81VEBq1TRtNMQ5g5FcNv4yIzOFc9A1DQZDHFPzoKgxJrtUbnqzyJwWy/QzANy3
	fdM0mSa+2z+tn8FV3q2XmO+ryVTZJYV4b55wddJg3KTQeRuUaWpW6SIBZQ0+1540xtToV1sb/yN4v
	Cz30uBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHaN-00000002pOx-2RrH;
	Wed, 26 Aug 2026 17:38:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHaL-00000002pOB-1oPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:38:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuqnb1541334
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=; b=Rhgie42ggrY0U3yI
	bvXJiPXqlv+TLTOApxq7JoX4tcFRw/tOdvt7CK3m6xZ/e/In1+GLWOzV49yUiTrt
	/D9X8euAEiIhVPosiVeyOYkmJwcXWpynpp0a+6HaICnU0C4ez3bMFX2DIyr/fVP1
	NmULcbcse2vL/PaLMCAv6p4aFOmRtu9jbmJjxtPE9WhvNaQ2mtWHYHFIvW3+xYP3
	gemdw6vUCpTLjKgTJ44NYsfJMqjNM57nP7I7cVPfSxsgYeqFJ1j+zWxrGrj7O2g0
	8hXRkn9lvFdoKMQ86aPJT/lXYtFjyENAIfCPDjcp4UmUjLouyYaVwdaf6rhT0CpR
	GOOvtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga07598m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:38:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc15155cde2so1465821a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787765926; x=1788370726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=;
        b=jdNzhJoqJOC9yG86wb1JXC6kDMxDzROVJrnp6Op+nv5+z0o3eDkD11hcHpbKYZgEv3
         NYbkKNlYj+Vkw/FV19mqd64W+BchKnrE+F3rwl4yNukzpZ3FTCW1XZ1XeohyhuP6terX
         cE8rBXCcVfftWHbOH7kJg/WHd429BSJrzMdGhPsmMoQnPXR2zRodQU3WIStDFSXstWnR
         3IAiHTEMOlUBLOjCUOvHV2EYPhvglT8a3VMhKjQ7DUFGe4tvGbnqnIuqxdYicANpLYTv
         5pgbnnvhIWhxsQL969z+t60Sp36BwALnsjZ5fNYe2kk5Zo5vh1LnTrg4yRCnicwGACSN
         mmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765926; x=1788370726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fp90H28q+jkZEsSHWPJ4DqQX9jjsREEL+LrDkm/RxfQ=;
        b=mOsWx7bO778mGdJoF8N9wta9k830QAiAbG0KFQ8fCqSrVTDDpilIqZawAvFV6S2Em6
         sa9+9nNQ1TirlHiNi6dY66mPCCOS33bufODWzr67Cf4ANIeNki5dc1WfDTu7+Ad+ridK
         4bLUWnN122Jp7pqDAPs6UOytGoYoPLILeu0o4mi6i2aSoq+SqWF1nlbu5V5Ak63wZ8uD
         1iKF7uSaZdLRSfozoS0wd3yIsPIPliQiMx+bnDMXej5Npw+OP8djF3zdfxUVNVfBhDU0
         xHCgqtEQPcRWQfgay/+jp+NbOaKA9OrhwslHImHJlDSEmcRDhGn21OZZUrBjpNtvNCd4
         f/Pw==
X-Forwarded-Encrypted: i=1; AHgh+RpOc6DzS85gz2jPkJtqw5fOPetYjuvi6+HtLhd5vQVks/Zr/UdzqnAPsfnhCox9b2HYd94yp3A032mMpzZ6lRuX@lists.infradead.org
X-Gm-Message-State: AFuF++nZFgC1SOlZ9AMgzHfK9OgFmoj9+GOudH2voLLC+/NSqLDKUxIT
	gpOTPAb3L3AMgLACv9qBS99UOw3SlEdmShbu+k7DpnyNvRgNQ1Iok86JVIRSx67lWc3rQEGs4M1
	sWmuD675Ac+ovFC8MXvfYaSOGoh8MGDsAvsQ/BfRWoiTyiIQuMTLnskTjYBlIqAa7fRnBZdljII
	S+eg==
X-Gm-Gg: AR+sD11YqHX0+8E1SWW12x4luvSvfUHXDGV4hBLb/MKzu+lWfY/mMr5nIgV9yw4vxY+
	VVsCFVv8aMr0+g/IAmTWcR/ihbCSVZsa2/nC3AYi4cohufLN7ahMHdRYECO3FI768S89xL2KIkT
	YhTsuhkUPP85aMmh4ik0+0MMjefxWNxCB4R6RwxVid2o+EyabIidNBbN6qPqIIp3ppy5Oxq7CAO
	gRoYdABPRpZWiYMs9LxNBHKx+pggfrOW6z3TgtpIHGAr3x1xsbkAfoe8Uc2o2xmmqig8M0iMLyK
	dBH9H5C4liByP6Lopt4MGJsMfGtO2EP25dI3bcxhGynRffFh/8b69ZmVW1FkqXjwABv3qVz0knu
	SIg2VYr7jrEbfC2z5S7tAIF5HBJaXp5E1Jim/E4PFQ1T5ArNLdpCK3bBHtXGEh5Zr/UhPpdJz3e
	v7e8qiItESwsze7ohAWg==
X-Received: by 2002:a05:6a20:9f93:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cf7810f7a6mr17119389637.7.1787765926500;
        Wed, 26 Aug 2026 10:38:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f93:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3cf7810f7a6mr17119274637.7.1787765925967;
        Wed, 26 Aug 2026 10:38:45 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beae6484sm1288684a12.4.2026.08.26.10.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:38:45 -0700 (PDT)
Message-ID: <35c1a38c-c174-455d-ba16-ecba1f7990ba@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:08:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/12] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-12-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-12-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EfGQ1u_rv1pLeae0lyYF0fjpF6AEvit5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfXzpOAzsVM0opA
 FHkhG6tgAQ6cggOhDEMhd1ukXWYGRSDL6WzCpV84F15F4VKvlWIHtJseLzx4CccR16+awXxiiS2
 Lcj7CNB57lljvPkWJhgzcHgHLM3wWDomWDxZd+qDG8IbdtWhuPKduXhR4wco0LM5Ow/58xo4bnN
 mAYBsqDS9hGNYnKoLX8jp3/PG/sJScXUVlhQofmiJuNyFSpL+3EuYOMUN+tlX9CiERQP3x88Bl3
 p0+4SvNtnLJ/2OUVitTzffrK4AcR/DwDZnX8u641c9oMboHMaQfChUz4hnkEm+NaNaRJO7f6IRg
 KwJcfsf0DILZj4lJ0JGQpA6OG1pwr9tv+oOyP1BsmpCIHemB93LCi1B33I3cAPSjshQuPtS1y/4
 hsU6p5SISslLO+KvuHxnYXxeN4DBOJxaLQcBEBuAKUq9NBGB5+bgd241GQN4B+gDidl8UqSmLJK
 Hw+BOu6DlO+sPeK9Iuw==
X-Proofpoint-GUID: EfGQ1u_rv1pLeae0lyYF0fjpF6AEvit5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NyBTYWx0ZWRfXyRXxKwkxLapn
 nQJWeu1KkM7ykZPqZglu7Tx81s0gUsbVP0YVkvk3E0BRMsBwwGx5zJJxnfW34YyUDP4gq0580JB
 /BtZVWOwSwVwY5j2EX4b2R42kMcHAvE=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f24a7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ChElBHoWxOA9GRTPlqMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_103849_592269_BD269D10 
X-CRM114-Status: GOOD (  22.00  )
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



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> a (potentially sleeping) MSC access as well.
> 
> Change the error IRQ handler to be a threaded interrupt, but keep the
> handling in the hard-IRQ part for MMIO MSCs. This is needed since the
> CPU affinity check in the MSC accessors requires a non-preemptible
> context.
> When the MSC is using an MPAM-Fb based access, we push the work into the
> threaded part of the handler, where the accessors are allowed to sleep.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> The actual IRQ handler learns how to deal with errors. We cannot really
> handle them, but we can try our best to disable the IRQ anyway.
> Should the level IRQ line deactivation fail on the device side, we mask
> the IRQ on the irqchip level, to prevent an interrupt storm.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 77 ++++++++++++++++++++++++++++------
>   1 file changed, 65 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index fb2fba5ba96d..4b1382fce2be 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


