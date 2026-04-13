Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C151E9380E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 02:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEGzIki+1N8cNLyklAPy6pAGy9378thqjB9kewpojWE=; b=dEcUHDtruJQL18t89/bBS1DAv3
	Cwwv0CEy/iErGCNW2BYUDyEmN/fnRwcrfAmHKJshmPWYJdSpI6+lnPJtEzsQ0n+m5Ld2Ea9sTrtIl
	rLxgDl8A1gmNPs6s7iLUeVtQBA0W/kv+i7Z8QzI+lJuQUpNJqXvyCIXzCdYxA/j6MBht4HeDKGq2i
	6ttkbHZaSwkOZynWeatdc0PWJDCoe18fVCi4xCg4HADsbPyt6IjcL+ehEek/AuFx95KhCXYbNFUpH
	8iR5s8WWs3oWfWrvcuMP2pSeRE3Z/lOoeij2J/e+9VBV6eXbTEfpaqhV6zIKCPnLEXqHkKujP+hJ+
	zZrkOdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Vc-0000000Euks-2b2T;
	Mon, 13 Apr 2026 02:58:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Va-0000000EukW-0vZO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 02:58:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE6Z1T2786424
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QEGzIki+1N8cNLyklAPy6pAGy9378thqjB9kewpojWE=; b=XRo9VdKR28FixArj
	/8Jm/eqTZ66OEQswA1dI5uc2vIzMqk+rXI/syIRcU5ZiKJBFDVoUs1TRG+G21B28
	zcD65raBcZmy8y58GSdFMxvnNCNoSsWpC0EZezjsapsvsVMy298bhI2PBMtYDWZ2
	HkF08jidQYHouD92lHLMgY6M/CA+IyUFDOfSHFiZXwYvf6A8Y/oe0+dqZmGrXHiZ
	/j1sDun/PcD0ZDREssAbWeD2cpHJZ2GhCc4G7UxQsca3pcHXwBodSBuupORKI6W3
	E8miRuR+41rs7e7CUSiKVDD4y0fYHOjHy8SLbv9o6JFFdsmmKjPlIXr/hfjdRh+t
	2WlJXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpb5xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:58:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso38893075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 19:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776049121; x=1776653921; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEGzIki+1N8cNLyklAPy6pAGy9378thqjB9kewpojWE=;
        b=E5AaSD+j1ONIxEKOWez0FyWBrvhUpS+qNZav3a+b6XM3gEmmw6QKJVlW7T3HQ2W94g
         6pD2qDvdFyFThE7Lg+3FLYlLAhXOEVWKkOtM2rKEeLxHfYUkPi8ONF10hZgFp4fZ9kP/
         1AiQ73hmPAu1fyie3FQliCVVd5FKHgzt9AdblBfLwPu0n3IntUWL1uBjqOf+uYMTYX73
         LNOYSUppeQmYWEDVAabWeNR+5p2hIWG6ROzZ50SoVha6TghfjF3qdB8mxx5ijoD0dENK
         XZadEGKOdRaNzzUgn+fwTevuWH6iTkHnF1pn6D8652nHpf7062pVwD5j1w6ukXSgWH9m
         1ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776049121; x=1776653921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEGzIki+1N8cNLyklAPy6pAGy9378thqjB9kewpojWE=;
        b=cjGr23q/yr1NJzIb6G5WN7Q8qWSNYcz9MUJ1yyeViJp4ybfl7opGeuTxQF7UWR9h/j
         32bxXBSXIEGk9H1truiv0CmVZirwKOEQbtkhQY/Ejjt1r56EGpsVq7CIMbbKipa46nLo
         D4GOqVbXHEuDQBAk4ND13KMOXpklqvwFs2Avvulv3wR5ER00M3C2e/fmjY1bTEthONAh
         QUcuFJnLv8dJrPRxKeE63+NiNK4MBXTys5kSXPenp7A9mY5M+b7Q1SN9Hh99AAyz4kUD
         aXcirYENK/E+MYDqhlf8VEMCoK4aXyACZ86Qjom8o3s0DAnuv/wGtjRn2hhWxrY6Lcb8
         qOBw==
X-Forwarded-Encrypted: i=1; AFNElJ8+9277KpdWoWkNeRl386+yi8jNMzUr5ffWJ+aUjlBoYI4Pym+uok1dV2fzwCtmH2INRnCrCNzVf0KepbAzZlRW@lists.infradead.org
X-Gm-Message-State: AOJu0YxH9AYodtqhzVX38TRpn6PuMmXYu2FLSYT3Bl6bPANlwkhrWFJ8
	/p5WUyD4kUk/QrMMbasZr/dmVGciTRiR/peXC6sgCPjbrnUuBIT+P3qCCuighd3Hf/6cn642p4o
	CJFTOuATiB49XHgjvSRllOpOU/06Ya6fxGEFayBlTANNnrNdwiZsLkW9z1HH8i+IY1ExhTygDT6
	fYSQ==
X-Gm-Gg: AeBDiesq8lBJAp1RCTdpogj+yajLHKjm6cIa0u7xHIQlo9oI2ik/Y4VO+HxVvpehA6/
	QluZ63gjU+eok6oZoZmZ9RYWie49uW2cBgp/hjDTNMEpjne8hSuygGvnm6C6MXSeue8sWonQ0uA
	2ibAGe29A71GCHCIfX/dVJ/ItXI2R12ZaFJ+vqqd3/wpb+SB2Oxk4f6uc8IRhkRfIworLVZBSXx
	QBM5IeuDotTkldUBZqCOQj+y1SxylfkStBZXIT3ggSJJduj13xdq20SnB8spd8t5NYhUsuxSMgm
	H9S0sPR9plEPVZnMu65njxpUwPMMP4BOgPAg5UoRpWOWt7gRlPXX2gGzMr4HiXTBSzDcxeTJkNb
	t3bCidXvzEUPzVIH+yYeTf6/9tBaDfu4Td6fvywFk1TvyhbJL+3TzFbsuzDuRzDji3ZvxspBTw9
	bCWYcHiXNRFw==
X-Received: by 2002:a17:903:1b6c:b0:2ae:c5fc:b2ea with SMTP id d9443c01a7336-2b2d5a387d0mr115078405ad.30.1776049120774;
        Sun, 12 Apr 2026 19:58:40 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2ae:c5fc:b2ea with SMTP id d9443c01a7336-2b2d5a387d0mr115078205ad.30.1776049120211;
        Sun, 12 Apr 2026 19:58:40 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb742sm100231215ad.27.2026.04.12.19.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 19:58:39 -0700 (PDT)
Message-ID: <6ed0ee60-caa2-4a76-9e01-5d2b8c9af701@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:58:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] coresight: etm4x: introduce struct etm4_caps
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
 <20260412175506.412301-2-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260412175506.412301-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dc5be1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=s9qJF0ULUEalZJ-qjl0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: y49aDBIKZNOxEjE5HBw_G7xCXC4op8Ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAyNCBTYWx0ZWRfX8nJt3Lsp05aV
 9YtjC+shxeHIA/a+Ch1Fpc908HJdex/2T3Qz1vMlV+z135tJBezPmQ75vEeOPRKDYKXriy/kMW2
 B7UeicwP3d/l1b4bfsNfZgQNwTx8EoJ8I9kZ5SLmnr9cMBFE/1RmOJuZS5U9QcxtrfWqJjCAFVm
 AwXaY42IFH7HSGenoZgyaAbsdV/nvZyP6wvRChepw2GSsKvyuqivsvq5qHeUCTw3Os7aEcMTUhR
 h+229PtyGkyuhjUqadq/Rc7LCRB8OTDRDM5cGG0okXIRCCMKgKZnv1LMqh+CLawjIiOkwnjpC9j
 kPqvvDfbe3tugMXbpi5oXC0jYyGUwOZQN05qVv53vPJdUvbS0dauOsHpYDYt3DXf7ZQXu62Ok2V
 4l3q9sAC0kuemhPOCXZa4auSDQ9vH1NyyTBawXrTnmBC2C4dUZWoWugO6aGvuSofG+DSxQ91pSQ
 w4CCg3Bs+GkNNw0EFLA==
X-Proofpoint-GUID: y49aDBIKZNOxEjE5HBw_G7xCXC4op8Ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_195842_359011_F0CB352D 
X-CRM114-Status: GOOD (  30.69  )
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


Hi Yeoreum,

On 4/13/2026 1:55 AM, Yeoreum Yun wrote:
> introduce struct etm4_caps to describe ETMv4 capabilities
> and move capabilities information into it.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 234 +++++++++---------
>   .../coresight/coresight-etm4x-sysfs.c         | 190 ++++++++------
>   drivers/hwtracing/coresight/coresight-etm4x.h | 175 ++++++-------
>   3 files changed, 327 insertions(+), 272 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042..6443f3717b37 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c

<...>

> +/**
> + * struct etmv4_caps - specifics ETM capabilities
> + * @nr_pe:	The number of processing entity available for tracing.
> + * @nr_pe_cmp:	The number of processing entity comparator inputs that are
> + *		available for tracing.
> + * @nr_addr_cmp:Number of pairs of address comparators available
> + *		as found in ETMIDR4 0-3.
> + * @nr_cntr:    Number of counters as found in ETMIDR5 bit 28-30.
> + * @nr_ext_inp: Number of external input.
> + * @numcidc:	Number of contextID comparators.

@numextinsel:

> + * @numvmidc:	Number of VMID comparators.
> + * @nrseqstate: The number of sequencer states that are implemented.
> + * @nr_event:	Indicates how many events the trace unit support.
> + * @nr_resource:The number of resource selection pairs available for tracing.
> + * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
> + * @trcid_size: Indicates the trace ID width.
> + * @ts_size:	Global timestamp size field.
> + * @ctxid_size:	Size of the context ID field to consider.
> + * @vmid_size:	Size of the VM ID comparator to consider.
> + * @ccsize:	Indicates the size of the cycle counter in bits.
> + * @ccitmin:	minimum value that can be programmed in
> + * @s_ex_level:	In secure state, indicates whether instruction tracing is
> + *		supported for the corresponding Exception level.
> + * @ns_ex_level:In non-secure state, indicates whether instruction tracing is
> + *		supported for the corresponding Exception level.
> + * @q_support:	Q element support characteristics.
> + * @os_lock_model: OSLock model.
> + * @instrp0:	Tracing of load and store instructions
> + *		as P0 elements is supported.
> + * @q_filt:	Q element filtering support, if Q elements are supported.
> + * @trcbb:	Indicates if the trace unit supports branch broadcast tracing.
> + * @trccond:	If the trace unit supports conditional
> + *		instruction tracing.
> + * @retstack:	Indicates if the implementation supports a return stack.
> + * @trccci:	Indicates if the trace unit supports cycle counting
> + *		for instruction.
> + * @trc_error:	Whether a trace unit can trace a system
> + *		error exception.
> + * @syncpr:	Indicates if an implementation has a fixed
> + *		synchronization period.
> + * @stallctl:	If functionality that prevents trace unit buffer overflows
> + *		is available.
> + * @sysstall:	Does the system support stall control of the PE?
> + * @nooverflow:	Indicate if overflow prevention is supported.
> + * @atbtrig:	If the implementation can support ATB triggers
> + * @lpoverride:	If the implementation can support low-power state over.
> + * @skip_power_up: Indicates if an implementation can skip powering up
> + *		   the trace unit.
> + */
> +struct etmv4_caps {
> +	u8	nr_pe;
> +	u8	nr_pe_cmp;
> +	u8	nr_addr_cmp;
> +	u8	nr_cntr;
> +	u8	nr_ext_inp;
> +	u8	numcidc;
> +	u8	numextinsel;

missed kernel_doc.

Thanks,
Jie

> +	u8	numvmidc;
> +	u8	nrseqstate;
> +	u8	nr_event;
> +	u8	nr_resource;
> +	u8	nr_ss_cmp;
> +	u8	trcid_size;
> +	u8	ts_size;
> +	u8	ctxid_size;
> +	u8	vmid_size;
> +	u8	ccsize;
> +	u16	ccitmin;
> +	u8	s_ex_level;
> +	u8	ns_ex_level;
> +	u8	q_support;
> +	u8	os_lock_model;
> +	bool	instrp0 : 1;
> +	bool	q_filt : 1;
> +	bool	trcbb : 1;
> +	bool	trccond : 1;
> +	bool	retstack : 1;
> +	bool	trccci : 1;
> +	bool	trc_error : 1;
> +	bool	syncpr : 1;
> +	bool	stallctl : 1;
> +	bool	sysstall : 1;
> +	bool	nooverflow : 1;
> +	bool	atbtrig : 1;
> +	bool	lpoverride : 1;
> +	bool	skip_power_up : 1;
> +};
> +
>   /**
>    * struct etmv4_config - configuration information related to an ETMv4
>    * @mode:	Controls various modes supported by this ETM.
> @@ -819,8 +907,8 @@ enum etm_impdef_type {
>    * @cfg:	Controls the tracing options.
>    * @eventctrl0: Controls the tracing of arbitrary events.
>    * @eventctrl1: Controls the behavior of the events that @event_ctrl0 selects.
> - * @stallctl:	If functionality that prevents trace unit buffer overflows
> - *		is available.
> + * @stall_ctrl:	Enables trace unit functionality that prevents trace
> + *		unit buffer overflows.
>    * @ts_ctrl:	Controls the insertion of global timestamps in the
>    *		trace streams.
>    * @syncfreq:	Controls how often trace synchronization requests occur.
> @@ -971,61 +1059,17 @@ struct etmv4_save_state {
>    * @mode:	This tracer's mode, i.e sysFS, Perf or disabled.
>    * @cpu:        The cpu this component is affined to.
>    * @arch:       ETM architecture version.
> - * @nr_pe:	The number of processing entity available for tracing.
> - * @nr_pe_cmp:	The number of processing entity comparator inputs that are
> - *		available for tracing.
> - * @nr_addr_cmp:Number of pairs of address comparators available
> - *		as found in ETMIDR4 0-3.
> - * @nr_cntr:    Number of counters as found in ETMIDR5 bit 28-30.
> - * @nr_ext_inp: Number of external input.
> - * @numcidc:	Number of contextID comparators.
> - * @numvmidc:	Number of VMID comparators.
> - * @nrseqstate: The number of sequencer states that are implemented.
> - * @nr_event:	Indicates how many events the trace unit support.
> - * @nr_resource:The number of resource selection pairs available for tracing.
> - * @nr_ss_cmp:	Number of single-shot comparator controls that are available.
> + * @caps:	ETM capabilities.
>    * @trcid:	value of the current ID for this component.
> - * @trcid_size: Indicates the trace ID width.
> - * @ts_size:	Global timestamp size field.
> - * @ctxid_size:	Size of the context ID field to consider.
> - * @vmid_size:	Size of the VM ID comparator to consider.
> - * @ccsize:	Indicates the size of the cycle counter in bits.
> - * @ccitmin:	minimum value that can be programmed in
> - * @s_ex_level:	In secure state, indicates whether instruction tracing is
> - *		supported for the corresponding Exception level.
> - * @ns_ex_level:In non-secure state, indicates whether instruction tracing is
> - *		supported for the corresponding Exception level.
>    * @sticky_enable: true if ETM base configuration has been done.
>    * @boot_enable:True if we should start tracing at boot time.
>    * @os_unlock:  True if access to management registers is allowed.
> - * @instrp0:	Tracing of load and store instructions
> - *		as P0 elements is supported.
> - * @q_filt:	Q element filtering support, if Q elements are supported.
> - * @trcbb:	Indicates if the trace unit supports branch broadcast tracing.
> - * @trccond:	If the trace unit supports conditional
> - *		instruction tracing.
> - * @retstack:	Indicates if the implementation supports a return stack.
> - * @trccci:	Indicates if the trace unit supports cycle counting
> - *		for instruction.
> - * @q_support:	Q element support characteristics.
> - * @trc_error:	Whether a trace unit can trace a system
> - *		error exception.
> - * @syncpr:	Indicates if an implementation has a fixed
> - *		synchronization period.
> - * @stall_ctrl:	Enables trace unit functionality that prevents trace
> - *		unit buffer overflows.
> - * @sysstall:	Does the system support stall control of the PE?
> - * @nooverflow:	Indicate if overflow prevention is supported.
> - * @atbtrig:	If the implementation can support ATB triggers
> - * @lpoverride:	If the implementation can support low-power state over.
>    * @trfcr:	If the CPU supports FEAT_TRF, value of the TRFCR_ELx that
>    *		allows tracing at all ELs. We don't want to compute this
>    *		at runtime, due to the additional setting of TRFCR_CX when
>    *		in EL2. Otherwise, 0.
>    * @config:	structure holding configuration parameters.
>    * @save_state:	State to be preserved across power loss
> - * @skip_power_up: Indicates if an implementation can skip powering up
> - *		   the trace unit.
>    * @paused:	Indicates if the trace unit is paused.
>    * @arch_features: Bitmap of arch features of etmv4 devices.
>    */
> @@ -1037,46 +1081,11 @@ struct etmv4_drvdata {
>   	raw_spinlock_t			spinlock;
>   	int				cpu;
>   	u8				arch;
> -	u8				nr_pe;
> -	u8				nr_pe_cmp;
> -	u8				nr_addr_cmp;
> -	u8				nr_cntr;
> -	u8				nr_ext_inp;
> -	u8				numcidc;
> -	u8				numextinsel;
> -	u8				numvmidc;
> -	u8				nrseqstate;
> -	u8				nr_event;
> -	u8				nr_resource;
> -	u8				nr_ss_cmp;
> +	struct etmv4_caps		caps;
>   	u8				trcid;
> -	u8				trcid_size;
> -	u8				ts_size;
> -	u8				ctxid_size;
> -	u8				vmid_size;
> -	u8				ccsize;
> -	u16				ccitmin;
> -	u8				s_ex_level;
> -	u8				ns_ex_level;
> -	u8				q_support;
> -	u8				os_lock_model;
>   	bool				sticky_enable : 1;
>   	bool				boot_enable : 1;
>   	bool				os_unlock : 1;
> -	bool				instrp0 : 1;
> -	bool				q_filt : 1;
> -	bool				trcbb : 1;
> -	bool				trccond : 1;
> -	bool				retstack : 1;
> -	bool				trccci : 1;
> -	bool				trc_error : 1;
> -	bool				syncpr : 1;
> -	bool				stallctl : 1;
> -	bool				sysstall : 1;
> -	bool				nooverflow : 1;
> -	bool				atbtrig : 1;
> -	bool				lpoverride : 1;
> -	bool				skip_power_up : 1;
>   	bool				paused : 1;
>   	u64				trfcr;
>   	struct etmv4_config		config;


