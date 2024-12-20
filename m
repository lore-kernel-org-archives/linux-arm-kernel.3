Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8982AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnmgaMOYWLULeQHqhFGATty08VdlG+W/lq0TDKnDRoU=; b=uOzD2BamQvQ0/Mrrwg74SARPnL
	VaGYCuCMdCLxL9ZGfVfFPvq0/wJ8o7hQ7771snhu2hMCsx15ERZuGja3d21M6DfxtlmHJMISXWT5j
	O26X4j7BLYMMGV3OWyRuwC42doHUn1QAAS6Ujewf6gRPwOQ+g/CJzFyV71XH0eBY5wuntmMfZQtb+
	IUqQR8L43AfyqR8hfmsBpNyE82injkMCrEr2WH8JT7BGyl/L1I8fuzCCdQBRogfZ4UzjNPQcy+PEY
	25C37CdkurBDMsgLhDxXzXq0x+ybB4OQxw+iplyd69KzZ1ykCVwr+WLQamIDE9jqx1Hp3FDsKKs7Q
	FDutnitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeT6-00000005Fe8-39GL;
	Fri, 20 Dec 2024 14:59:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeRu-00000005FGb-3oXo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:57:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKE99ch024608
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnmgaMOYWLULeQHqhFGATty08VdlG+W/lq0TDKnDRoU=; b=KlG+v7xmVqecfoHN
	r/rKN6f8moNovc64PHLtNqjXkVPk9HV529JWYlSsxHWyczUTshqXaAkUlZiCIO8w
	zI/CPXjwaHa+Jx+MH/psmJ3l+7KdK+DfE7sH6QvqgMnREiIn/zGNkxxY89getx2H
	gP43WJFvZ04fbtL/ULak0n6Mpbqb/DEtDWSEsF5L+k1/djvWGPdENGvIYHJQurLK
	f8HG5dZRoDk8x0b80Urr756ZiRznJ2BIDOWdDVATp1Q6mS8O9hmyT868SYwhdkey
	damiLV3N68gwYsGac1RpoX8FAb9MDO3oiRfPtxE+FAEwZRFvRIg8Bmhz9iCBye8k
	I0Sx6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx1hvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:57:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679af4d6b7so5115051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706672; x=1735311472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnmgaMOYWLULeQHqhFGATty08VdlG+W/lq0TDKnDRoU=;
        b=WcaXYbh3QjvXCi/3hQgdZXYYcOdvC6/TOxdXQ1Im+zKlrcWYHpJPL9ED5XX+EuxqTv
         Mgar1eYdaiKxkP02b1oYCDd0waoMkL+G7zLulXpMVSPP7egSjWFbSvAuPjNb8mPgSsQF
         YVKAPXjQc4e7WVxnm1aw6thMk3tVzhKrr76TpKz+XVGNVx1MsQHd1+wul/VZ2d9aPY9l
         nrqDuQ0HIsR1bGsF7/7VHwpT6IPKmuspJ+1xZ44bJuXVO+VlH/dwsRJV7XVCAdbHLoF0
         7k3rbQCbL4Txj03fwtjR8ISj5QLGcP1h7uPYVDSaGKnzNjoarEj5PdY074u7sFnchjcC
         zQZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD2N0Fua+UcjMrPyTDytXqDNJWyI2HjGBDYkGJVI7bvMXkMUoZaEsPihRsy/bzckWGT4HIstkyW3s7RdDF25q8@lists.infradead.org
X-Gm-Message-State: AOJu0YyamlQUyPVCJSzsPMfK4s3YyFAO2L517FpC9Duux+FI6u9xfyvB
	Pv+X/AMY2QDtdkmAV8+JLwD3iY7wI493QmyQ7x6BzbZAtpovvx7c47cPmkuzGm2pixJ5MazqEkq
	bieYUmO/SfMPmVyqjKoPDQSOZG9iGHmzoWcSahO0/HH3oGkPd34l47WoNAArM5Fq3nktNnTm3TA
	==
X-Gm-Gg: ASbGncvm9YnWX+iiwG9G0IgNJdhjRh3tQQAVLRKV4f/ey6NDJrYZWbCwNgZen2FRBqa
	+ZvPVQ37oAG9fvt5gI1CpiGX/qHKLJbjVjMGU3HhP6a3KhXXL3BsZ9Ta3YMknffDAG9VldY5W42
	gGP76R4LShUw6RisY8QfeDpEGsk6Zf3YH7fevcJ+phTtShnoWQFq7g7Xw/uACbr44CuF5IUIbL9
	zZoQbAP43NLUmDsLw7CWIX/I000xP0Pz4iByPMWW+myBbDYxPr3loL2WxSE0mtRHoadt+Eel8VH
	uz1dFmm5Lm6AjWaP0fK/NgXglKhVFo9rptA=
X-Received: by 2002:a05:622a:13c9:b0:467:5462:4a18 with SMTP id d75a77b69052e-46a4a689a11mr19646521cf.0.1734706672459;
        Fri, 20 Dec 2024 06:57:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu3+VYOVDSPEPrh0c4+R4v5VJv/O9KFRtBxy8bN31SJszHdaNc8IVwgkQZ+PhUv2t29gwVvQ==
X-Received: by 2002:a05:622a:13c9:b0:467:5462:4a18 with SMTP id d75a77b69052e-46a4a689a11mr19646291cf.0.1734706672064;
        Fri, 20 Dec 2024 06:57:52 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06629esm184361866b.189.2024.12.20.06.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:57:51 -0800 (PST)
Message-ID: <db755bda-8464-4882-a72b-1d860abcb2fe@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 15:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Sudeep Holla <sudeep.holla@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
 <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
 <Z2VXgkJ4x5TJTKJ_@bogus>
 <765bb1c8-31de-4aec-b8ef-f141a3e25c56@oss.qualcomm.com>
 <Z2V4IblZNgnS4T2Z@bogus>
 <875342b7-3825-47bf-810a-effdbeacab46@oss.qualcomm.com>
 <Z2WA0o0QJS64ftVh@bogus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z2WA0o0QJS64ftVh@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VcxiKbUfI3ZnBwpcA_pzPY1QqGyH4tvu
X-Proofpoint-ORIG-GUID: VcxiKbUfI3ZnBwpcA_pzPY1QqGyH4tvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_065754_968118_9B1BCC28 
X-CRM114-Status: GOOD (  24.23  )
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

On 20.12.2024 3:36 PM, Sudeep Holla wrote:
> On Fri, Dec 20, 2024 at 03:20:37PM +0100, Konrad Dybcio wrote:
>>
>> I would happen to think that, yes. Especially since the reference firmware
>> implementation does *exactly this*:
>>
>> https://github.com/ARM-software/arm-trusted-firmware/blob/master/lib/psci/psci_main.c#L179-L221
>>
>> PSCI_SYSTEM_SUSPEND seems to be simply meant as a wrapper around a specific
>> CPU_SUSPEND state (which may or may not be only callable from inside the
>> firmware when SYSTEM_SUSPEND specifically is requested, for reasons),
>> in a platform-agnostic way, so that the OS can enter suspend without
>> providing that magic StateID on all supported platforms.
> 
> Exactly, that's how it can be OS and platform agnostic. Yet this platform
> considered to optimise by not just providing it as a wrapper(if it was
> that simple on your platform too) without running any tests and leaving
> it to interested parties like you to mess around to get it working.
> That practice needs to be fixed and this change won't help and once we
> fix this, more such special treatment fixes are needed on newer platforms.
> So lets stop and ensure things are fixed properly.

And then remove CPU_SUSPEND support if CPU_SUSPEND2 comes in a spec update
because it's not generic enough? Sorry, this is not acceptable.

If you enforce PSCI as the only way of doing SMP/cpuidle/platform suspend
upstream on arm64, you should not gatekeep existing implementations that are
actually in line with the written spec, just because you don't happen to
like them.

If you want to start the process of getting rid of those, amend the spec
to deprecate and/or forbid system-level suspend in CPU_SUSPEND in future
PSCI versions. But you can't retroactively change your decisions like that.

>> But since it already requires more elbow grease on the peripheral IP side,
>> I'm not really convinced it's that much useful.
>>
>> Plus, the optional bit of doing more work behind the scenes doesn't seem
>> to be very wildly used across TF-A supported platforms.
>>
>> So please, stop making the argument that it's any different. The firmware
>> I'm dealing with simply didn't expose the same thing twice, in perfect
>> accordance with the spec.
>>
> 
> So that it can continue to do so in the future ?
> Thanks but no thanks. NACK with no arguments as requested.

That's already been "fixed" on QC platforms starting around 2022, as
mentioned in this series.

Konrad

