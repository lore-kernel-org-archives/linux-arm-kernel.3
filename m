Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB91CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq8eejymhlI51ANjiVtGV60zs9lXc6+8/KrX0uDkPTA=; b=lrppsZThQh3GbUUqi7yMSYbxOv
	VJuS5NAhUR0da+lxli4OeDjwkoFHkYvjHxMSiH1VfYv7HnWNz0pns9kE1ib9gjOc0dTOoFEipNCQE
	Wp1kEdt4kR+6p88dd/3bLlnuBP/16PucAjcXIyqd3A2EkU3SGo0owNkDSNRsn+4shMPcERzxreEdN
	luwHauJldT5cDzpwTlhC2hLKrBLzmoYuMvQlLWm2OUdpxLvifCf790uCKjM3rcYfyrn90tzGKUIit
	peIANYVvzjA25aZ/VT62dZTjxSf3s510OCm8XdGSSLeW1Nr9cvVzuj/hwJaolZHViqvB4Pqzs7lll
	XFUQ4rzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGgN-00000005aV7-0I8x;
	Fri, 10 Jul 2026 19:14:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGgK-00000005aUa-24n7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:14:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3iOX1453121
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oq8eejymhlI51ANjiVtGV60zs9lXc6+8/KrX0uDkPTA=; b=hPjRmohk/vrlMeM8
	+8/iXn3HzLYLkqDaQvit5Lc1xJV/MylWBBlxy+GKG9uV9T+/llYgAgIH4zcUdJ6b
	bjwLJC4cd0KkqX78iKy1sBFzOORhHUAEGKRwVzVCYzINXeOK7niFORe2FhUJVn8R
	GkWEQiUdT1K0GOd1RPw/7Mz1lzJ82t3tRN3ydnJWnUr5RUW793KiXX0/++DKCTn9
	TypQ4RFhQSh7XJMT41Md30QqaM2uY6m6J+N90CxK1Byx7pNj71qoBfE40sy3XT8B
	+U3+OwpoLrojvnDuWtIhCJyAPGiKku7vV3hHG36mwdPlvekRDdAxn9ZdAFr54aW9
	ll/yJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xn0nxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:14:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so1611789b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783710879; x=1784315679; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oq8eejymhlI51ANjiVtGV60zs9lXc6+8/KrX0uDkPTA=;
        b=iBDIWUYZ6dqIkfKuk6BMl8Qv3PRFewdwAVAfPm+OXlV1s+U9wYB7fi2MBc794MlVyc
         Z9wotQs+DScRAuZL7/aBnXHjuT1YZ41reDvaKsnkE6eht/UbcRTUUFyGqiBVaW2ZProF
         jRBDTaleajzZogaxUgmnRVOnlV2oQnEablwCJrwke2PVieQTp76s2n2BEr/ClC8JET+b
         aTVe43v1RVEoWuBCKzwRZeREH/K/evZs9IvQhaGj9/d1FZlCWgYCn8/bqEeKA8BfjBPv
         ZVNnRAHv66TFejcf/F6VhlITSHP8cDcWtxd8jGBt3m0BgCTGl0RPMwnvOzoopRNBX84A
         a6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710879; x=1784315679;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oq8eejymhlI51ANjiVtGV60zs9lXc6+8/KrX0uDkPTA=;
        b=rcs16o9SRH2ppuNqzmVQBRKKAVxxCBZFk4Ns5Yo4GVyo7u08gAv14AKTDe3v9oYVhd
         70H5C7W6iAh3AwlWNw/zEqplXuz8FhsLX4nJC+JOjMr2qCuE9updTtwaIUJ/VeM5YOh6
         TYpu489FUxSZ6F/Qz7YwKq90n2GMBCRutyCMeafZNI0z+NZ5qfEFOmqOBdinT8YeCoWz
         OKeJ1w1Lb9DGhl3PBSlRCK84jN41dWuKdb96E1oQkDXKW9CZ76/ayUSeBa77FSondR5P
         ryNSPS8x58p/631EqA1Jsrc4WLkFr9eZllEcosKU6zxCf30m5FiFGFwzMa+eo/KBGuuz
         Hetw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1xFUA0+OebL3pKJBeUmFjO1TnmuQMBO3gDghLa4iLIY3n4mYk+mAiDFWFYZ2mGliYK66+/9RrOEG6phoz8DzG@lists.infradead.org
X-Gm-Message-State: AOJu0YyFov1nkP49bPOEla4z6aLx2+U0EWf1p0FGPrHphRPVUAH1JZcV
	7Rh5PaRxNIhWb6t3AqalYvagwU9HWu82MRUFK8pSvoiifswd54kEqDjNVMa7i2TWbae9jOkTFqN
	EURGkIK928BkkNub67GnanwisVNKaH4RZfCE5QwxHTmtiVU4wTHC57LYTxbC0peHbnW0FvCPkhh
	7hyw==
X-Gm-Gg: AfdE7cmTmZ7bu8z6BfDiTHi+HrBK9OE0CPDYL0n+7TTfnD2rni9m15ofq2az+tknFy2
	hhLD0Qb+p/QhENyFjr8sufvh4YZx70bvqwYJSVJAXLYECFZB4aR+yvJVvHbUcj01yygyOI/kU/m
	Ajlhh7VjrpRHN4hhDKVneslY/1UwXKnZUExNRIpAbfXuXYoWiUhqTMiNSIPnfOU759R/aNxa0S3
	zG5dgZpVu5PfhaiLDdiHjBR0om9wjMstfMLLJxsRv89WFNdJgG44YHswPuHFNXOcKyyLroBwUCV
	CJC7ztEqOIBYmGli+27B7Lqow1WRSJRvWMVsKQ0uRxpxs2IyCJZTVf4K7CSyvkA14RR0P3JMS1K
	SwrWFoF/Hai3s9eqh3DJnNyzgY6sBQxJ5XF4O
X-Received: by 2002:a05:6a21:6e96:b0:3bf:b523:2aed with SMTP id adf61e73a8af0-3c1100383fcmr321990637.8.1783710878669;
        Fri, 10 Jul 2026 12:14:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e96:b0:3bf:b523:2aed with SMTP id adf61e73a8af0-3c1100383fcmr321970637.8.1783710878257;
        Fri, 10 Jul 2026 12:14:38 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm40574288eec.4.2026.07.10.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:14:37 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:14:33 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/16] arm_mpam: prepare mon_sel locking for MPAM-Fb
Message-ID: <20260710121433.00001ad6@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-14-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-14-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JJYLdcKb c=1 sm=1 tr=0 ts=6a51449f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=TWr3UOjz1xACnXJDHjEA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: HRi-4T3XXG52-GlrAFDeIIYQzMzUMUkC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE5MyBTYWx0ZWRfX6e3fgoq67xxM
 LtmezvPqPJzWwQ2ZcYeIlXngCNgC4Cv+PIbG4HhAykfAjEQq/lTV9CAQpuVynL2mk1rcVMT0vaY
 AxvhRpSyzc/uUcB27Cy452q0VA6MMfM=
X-Proofpoint-GUID: HRi-4T3XXG52-GlrAFDeIIYQzMzUMUkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE5MyBTYWx0ZWRfX6D5++PAdoiLC
 +LQ4+ZCj/TQFHWXwop6Ba5NADcCdZjIpHFsPUwQZoVos3VHCy74GA1E5bE7hWiU0XcWuQUEoU1A
 8JgHPaet2HseI+4ekQ+BB3TNuwMQGMxLASmiTSMjiw39axnc/usupVB3L75N5aZlMX74l9ELG1z
 iXjT7EVDVHAIZNsq8KqMamiTEL3SI5PpPF7gvGm/9jpDGH6EmJJZfG76RhbnQIq+6dWWKkJOCpf
 wtnP0CdY/wA97ib2bmK8Qph/C07Hq1Mt8YHHS1N35mk6Sw/7zY5mqIuxpr1srnQKXOeNY894QHC
 vYVP3CbtiaMJYLLfJiypgk5o7OlCgU5WIz3QSvVsyxWFh5apItOR69OHOr4P/YQxrD6ub7UsaEZ
 OQUXTzgn1Ao84eUaH+1IY5UsGI6YvoEikrX2W/R5lNcssGVQmoK3WfMqcdOFHqROahQj0DP7+hh
 Mrr4xQGiOYbvfOVNxNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_121440_541586_74A154D3 
X-CRM114-Status: GOOD (  24.21  )
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

On Fri, 10 Jul 2026 16:45:17 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSC are not accesible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with SCMI
> mailboxes it must be able to sleep, meaning a mutex must be used. The
> SCMI platforms can't support an overflow interrupt.
> Clearly these two can't exist for one MSC at the same time.
> 
> Change the mon_sel locking wrapper function to only use a spinlock when
> the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
> mutex, but only if we are in a sleepable context. If that's not the
> case, we return an error. This should not happen, as MPAM-Fb by design
> does not require an MSC access to happen from a specific CPU, so there
> is no need for any IPIs or preemption disabling to satisfy CPU
> constraints. And since overflow interrupts are not supported at the moment
> anyway, we also wouldn't meet the other case.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I've not been paying attention to this topic, so I might come back
with some more feedback after I've had time to think about it a bit!
So trivial stuff only for now.

>  
>  static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>  {
>  	raw_spin_lock_init(&msc->_mon_sel_lock);
> +	mutex_init(&msc->mon_sel_mutex);

I'm not that fussed, but maybe add a call to mutex_destroy().
Most likely it'll never help catch anything in this code though..

>  }
>  
>  /* Bits for mpam features bitmaps */


