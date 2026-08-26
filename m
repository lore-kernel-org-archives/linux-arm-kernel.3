Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4994AC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=; b=GSY8vjg2ar5H1Gl7aEUONgwGkV
	tDjYsxEdNbB+qKwMT1UVsBZFD0hTzVJd2WcLQSMUc6f/sYB4fYi2qnlSCRoL+POTMAVtB9sB4A4xz
	ipsLjL4lrGo+4bGB5ySZktT+OMaAsV9mnRiLloPl34b4yFQK1nZWt/wD7r2phCq06sDcLfitA6tgX
	zG75sNbpcavabDfABcqupsJHxUnvjp2LBsFnAfRfqbITM84kxDZRA0OYFEkYe6OH86/xdO99jC5IX
	ApgfHwKd9/cICma91KevgF4nM/A3M6JqZxe/Uv25d0ZpVc1YuN0mvQ4jKd+0Hsmw3GUlr1/VpV/TJ
	BHgtXyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCDc-00000002NXn-1QC4;
	Wed, 26 Aug 2026 11:55:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCDZ-00000002NXA-3HRF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 11:54:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGc4J630830
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 11:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=; b=LxtAFUjT3OLnYJSo
	iTXTYynpeMBZks3L4NGPbINgsPIJu/3jPEXJrSKSfDkvAvKsbOgS8/xA2pH/39Rj
	yy2dHdNl65obDPrQPNthxMCMAMWgHh884PzNFcJq4nm9LvoKh4XsgA66eT1Smh1r
	AXIulxLmeOEBewWZYQvqjjTXLgC+yyjIosqmLJImuEwzwtk4RStmdaAJiANAkP0V
	1xjbgX7vtwHu0a0qX5p9DOuVIYsgr9KNd+A9Et/Oto7ZZmbAvd4euQCNwqFA4O2p
	eDfabYu69tKt10PyiZ60B4SJyK0M4vABOiJW6TOx8CkqbOwx8hGEUuuTRvWtum8T
	o5/1SQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1y16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 11:54:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e01a62d99so766439b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787745296; x=1788350096; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=;
        b=MSycptXXf4paehHGkNL/jU78MoidSY4ercoAlII68u2iDJIeuCs3nubnP5kC35ADBJ
         EbDBG6z7okj1VkREQYXuREj0TPFbeeIuGDYg2y3roB98k6FxJjAabAw41Hq6CkkUSzll
         eD8mebAsYzPB4UFKdhyMI6n1PUFZ3v8exfdMs/NDoXntkjwlBePeO4qg5sATO4iar4Yx
         gdyW6B/XJcIas2NFLEzH+gXO1qxUeuzaKBrjGxLwrUu6BBHs5DekggOREVQfVL2CZLB5
         8WW658/YqCJRRtH0ACewxUQ0Qnqmx6QkBQszQQBuFZQ2qBkeWkyPhtv1uLzo/VX63re3
         hQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745296; x=1788350096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJXhURYbF22u5h3SNtJoh5SZFJhDJmU53UX6OeRXsy8=;
        b=mWPyTjhQK1OxNFrINRTeXdsZOdUOd7X7nfn+cQuySqGNZa9XRLamBtu7AshENsxIAY
         MtL6vzUohvGX8mArg/FnxkXlj4u93VePxwkcgiaPjqEMn6cbMIhWSnJGOCmtmZRnHbrS
         r1hC21iOabTrpOtBeK+03nVue18BAwTALnWS6q6gkiN2/1PDBBCTzK0QcoFCmqkqnVwY
         8un/2vfnqd7yEQK4bx99tiH1Goj80VVlZZ3xGQba/co2H5hVDMtY05c0jGvV3+FLjRhx
         grQ+w0p7G24Zblh7Dr4GadiMG7Geugp5l3z1AqULOortY+tzy6OXpwejoopoSNps3n/x
         gjCg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8cCHmmMOe+UCkN/EUSW16EKhJpox9Fb6ZEyf3eqNPNTshUhrfudpwx2y8/dF9Yavrs/nCBmRPcacSgu/G5TTz@lists.infradead.org
X-Gm-Message-State: AFuF++kM4RC98C0tekr3b/KtZGumJZp93nFHwKlBtu/qlIKSPz5UaPt6
	+TDeZ//f69Kk5tEYTbx6wEXLtiN5DyUZ1YXrdhtDp50LSlOHq0JK6MjLlfMH7/kBOgGgBCt5ZZr
	v5zv87Qnw31ObHmB313AASqow5v7ZkDUefg3ez+RhTgR7P+YbMWHKu3Z7WXY8HLeebFRzL3xV+H
	Z1bQ==
X-Gm-Gg: AR+sD12RdbCXlOpWp1k7Drw39Uja4mh9bMxKi3GgzZvSm1Cx8VSJMzHRRGrlXrRdIzZ
	1MT8U8ATm08/KMY6cbh7cA6Aw4sAKCBGuC0uwqbdRiRwfUKaDCwpR/5w5QLB/2S/I+9NNscqT63
	FCBF7FWgPPj6t091M7tzO0AsJg/8PqGVQz3u5yg5f0oFc5UFOWZqn4zVTzUqLV9XJaUs/yOIrzm
	cdWypo7CSNNaSS1GJx3eXCQzC3HKDGGjQnveLW6UHPTj2kcByen1n+UOu3dfsXK8xA+JbGFmJm1
	NFaUVczn0i1kJA+r+DIKo7WsN6noYEjEVyAeIFV4g+5a2cEQ7eM0dCK+Lp4SS/iuVNiqnQlnhJt
	F+ZBxR8arLW9sozCQkhXuHQAqlTq6dPAK018=
X-Received: by 2002:a05:6a00:6ca7:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-8536ec13a78mr13481217b3a.0.1787745296208;
        Wed, 26 Aug 2026 04:54:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca7:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-8536ec13a78mr13481100b3a.0.1787745295712;
        Wed, 26 Aug 2026 04:54:55 -0700 (PDT)
Received: from [10.217.219.186] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cf3e982sm793514b3a.54.2026.08.26.04.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:54:55 -0700 (PDT)
Message-ID: <4efcdf15-286c-4bd6-a75f-77fbca07e7a4@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 17:24:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
 <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
 <e000c3da-32f5-49ba-9aff-b2b17db23927@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <e000c3da-32f5-49ba-9aff-b2b17db23927@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ed410 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=4Fh5LKrImxLeDWyZwEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5OSBTYWx0ZWRfXzCouicMg03LO
 cHwj9ulx4UI6azWhN4s6dBJdFbYSdHQ3zmYdTo0T3LU2cKelVbKjP5VtHHIydOW/dS6GU6BQPEg
 vVRYB3+8CNORyxhsdlD0WX61KnroHnc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5OSBTYWx0ZWRfX6M/75fS5GC6A
 Wr/ADiZopC3f9fPR/XnRllqDLx8R6g3fl4uVkawZFX0aGgKlq425bNmMYjC27WTllPu0XdPcEn8
 i7Yjmu2SPcL82CRRL7qvAtgxUtVlE9C4HCekwEgnB3aUQlUU/fpb6ip9xeX6/b06gxapKMpFGV3
 JNpt9MxpspGydSE2alr/qu73FqiwNZIDLDHIUQa4tR2cfgTWobtw6pA8sn254/a6iqhkCb7LyKz
 SIC0hPmrJ3torItRIOMcrB5YOoX3YeIWIYSPLxegEncPwIZP+A5wnBj/XZ+6RfCpVvyD1mn9Rga
 Cm7K2FaMmB5JDbZw4XaHHmoJxpwBvcM1kW5D3fiFTJYL9TzUGgOh3quSUsXEdlb+e/2Tx4JeCvX
 uSKuWSzqaxopDrnmogzq24Z4Kzesai0TVUP6niLUYCM0MXcYtoBMLB43ldAhpepJrT6VRelgpyB
 vQsGmPk9d6vbVfqPvEg==
X-Proofpoint-ORIG-GUID: DsMKimB5nt9M6OjRNbSH5pH_K2JPFqZ0
X-Proofpoint-GUID: DsMKimB5nt9M6OjRNbSH5pH_K2JPFqZ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_045457_839319_F11F085E 
X-CRM114-Status: GOOD (  19.63  )
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



On 8/25/2026 12:38 PM, Praveen Talari wrote:
[...]

>>> index a23554d101fd..4561e2d235d5 100644
>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>> @@ -213,11 +213,11 @@ static int geni_i2c_clk_map_idx(struct 
>>> geni_i2c_dev *gi2c)
>>>       return -EINVAL;
>>>   }
>>>   -static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>>> +static int qcom_geni_i2c_conf(struct geni_se *se)
>>>   {
>>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>>>       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>>> -    u32 val;
>>> +    u32 val, ret;
>>>         writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>>>   @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se 
>>> *se, unsigned long freq)
>>>                    itr->clk_div, itr->t_high_cnt,
>>>                    itr->t_low_cnt, itr->t_cycle_cnt);
>>>   +    ret = geni_se_set_rate(&gi2c->se, 19200000);
>>
>> hard code ?
> 
> Good point. The 19.2 MHz value is not intended to be a permanent 
> limitation.
> 
> This matches the frequency currently used by the I2C driver and 
> therefore preserves
> 
> the existing behavior. If support for higher source clock frequencies 
> (e.g. 32 MHz or others)
> 

This is already added in driver for 32 MHz and also AFAIK, support is 
added for 3.4 MHZ which considers 100Mhz. so make it something which is 
generic. Hard code is not recommended here.

Can we store source freq selection and continue with that ?

> is added in the future, the requested OPP/performance state will need to 
> be updated accordingly.
> 
> 
>> May work currently, but if higher frequency support added, source may 
>> change.
>>
>> Also you have added in commit message, but add a comment also here.
>>
[...]

