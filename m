Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E270D2D8F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gauOSQaFbZ/xl2uCG2D3fPteHoO9nEEmlRg1TK4bxtk=; b=eYpfpBs6u4he23P/a0gvRrZygK
	CT+IRdiGMGncVQ0EM8/PhaiUnh8U+7I7V+o7yfUdtfNzcgLBAoron7/ShebVQuXLHrEuN9hqdhZDv
	X2QbBP4qb0k354+0x62B+D/LhBOJW/Q+PVBcOISOHKg7NDsSnDlvsBNEARbEIeNx2WmOKKQy1Hncs
	4vR4lfgAxTNeX4sNg1Aemxfowb0Jkk1tbNis1zzSba2SylL6gfdz5Lmla+f/uIvmaFYWNDVhe1XSl
	6oZdd0bAbIwuhe4EBT5xf1hWQ1YNCB0f8odNFT/Lww5sTK/RDIfy5x6c/4YjyKCfIPSRLulmJjUdB
	wSSwB1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgQ6-0000000E4Bb-1X9M;
	Tue, 27 Jan 2026 10:35:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgQ3-0000000E4BE-1Wef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:35:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86uVq621131
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gauOSQaFbZ/xl2uCG2D3fPteHoO9nEEmlRg1TK4bxtk=; b=c7EJIUzmN2FBrqP4
	3X2rGMLftsXBrprvw9fFG8fNSHeazykmxu0qURen3rlPDfmB/gm5Za2m2RT5oBSm
	Djpd8CJplXHtk6CwrYozUflVZgBfodPH9frgiy7+DkqEJiAEfflQgCgcyVlF/hln
	L1vidnQM6hXEYw2ZfjE61qpq9L/y4d/VprkevPsvMt75TxrSsqWY1eEOdAfVQ0jl
	40AgC35tuoXDiD4K47cvHFIctpW8pEwazMZRjsI+ebE8I1c5YPXab1v0FrOYVBlK
	0aCw1K+i9vUOtaos44K5YilUcLJTuiKO2k5idPyEyvacJbsgHiCuSShIB1w/lo/y
	jMowhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegg9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:35:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c536c9d2f7so182092785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510132; x=1770114932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gauOSQaFbZ/xl2uCG2D3fPteHoO9nEEmlRg1TK4bxtk=;
        b=DOr1xiTkOBx5PUd/tw/KEbUPrN4sd39JDPLBUVzWzrAq6Zn5bUXxNhuKtKrWywCUgL
         TunJLbDaxWMf1YVnz1CvSabWoJce6xqiCaZe+XyOgtUeKqEBSCgP1YT5oZ4h27vEFtb9
         8J1dqI1Zq1WipJ+4DYrEmAfbHg/wClpZAfSqWmN7ld6lspZwdw3YQ+wCayZxMdNEDNqu
         CdgSzWJKP9Q9juaK2CJ1eofXddaQo6m/kpFPDV+xjRWKvCxy4cIF8LEsvH0HBzy7cCkc
         vErUTOTfcVa3SPR53qiLM/1sVIQhctGNKTkxy1JlReg4tl5ClNzAVXgCmlUMKUftOgF+
         x4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510132; x=1770114932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gauOSQaFbZ/xl2uCG2D3fPteHoO9nEEmlRg1TK4bxtk=;
        b=TSDOm5aDz3hkDL1NlOvS1bNzo9boSOFywuevaVVjlHHjsw91vaR11rzhI9NHlRk6sv
         RarD1f9KUzCoEW8/1ey2DGR0+WIV1feNtUgnN5wnG0Cv37Ua22V+WGIPb95kP1idA9uM
         kAImiebzWwm0ClZpxq7RRwRGNFkzQzTE5nOyHeMKKUHzUwUnr5MXRl1EZkzqcHhoi8eF
         v3BMRrYcRcTEMLU40fjRmDPl0XrlAzwGHNSdYrvboXlCCfuuvlRNeCyMOfVVs2sxC59L
         SnRVfxy8eYpzsZFUASWeWuBjR+yPTxvJyHkNFY7xDHByQEMjwuF4qqI/uMPKyU2o5MFr
         Tc3g==
X-Forwarded-Encrypted: i=1; AJvYcCWg+MREu69EIjOvneRJcFb1Yoc2sn27iTWNCsL5fc0pWMbyFS+iIMTHT04MzjOzWKV6ESWrnuKoF7/xZ2CDJM8Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyO4KPNo1b8Hqb2d3cIdIafMWRzjb5NRXmrXlFJWvIDxempjLlv
	apZr1tolf+OWnaystbtL4xrU0aNDLHSeMAWJXlPPyhoCZnXxioIuSZ+/I2hyev25D0Rvh8A3JTV
	EYDUFrqZ2cfWNSZ1n9dDGRUQYpvHn2paAS1QE8S20M2/05bIdkXyvgFPQcrPnY+42QXrtH2wcpu
	6sWg==
X-Gm-Gg: AZuq6aLRyOdycFlV/rzA7ZPWHl8Xxe3F9XPTM4M7WNdMTil+TyNiMXytik6y2Fy891D
	YLzSIVb42K9jKWLqsEGLjx6HaMFN2oT+91ZCoWIJE7yDEXxO0fDN1lZBh5dNw/nDMnOMf54aqd3
	FrPq27HK2y8vu3z422rVnX1DXlm8OjfpMQESVTlG/vwG+RYC5OCMBqobesnPWRBBFktLa94ItfI
	2XG4+X5Jal1dJnGZWvdttoQQ12a30Q2GZz3JL9WyM76XGoUSJIN1Z/sTZN6UoTe2N7OtpzitcHE
	rr4YJBo7bnWNiiNpTHUWkvrKmCjPO8tpAo6geO1jDBxmz/71X+t3b2/IKgV1E/Kl+QAv5ALmEgQ
	3KmNTw+vkH7eNHYZMHmSwm6LWF78IdC7SNHfsqwQI75jncoyJY6DCN9chwuGW11aHlPM=
X-Received: by 2002:a05:620a:2a11:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c70b99cc3amr86856685a.8.1769510132290;
        Tue, 27 Jan 2026 02:35:32 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c70b99cc3amr86855085a.8.1769510131783;
        Tue, 27 Jan 2026 02:35:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm798364766b.7.2026.01.27.02.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:35:31 -0800 (PST)
Message-ID: <64e7cad1-cb7a-45f4-913e-bdceeaa42fc9@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] qcom-tgu: Add TGU driver
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
 <c5569d62-1dd5-4dec-8cb9-dd1c6e3938c6@oss.qualcomm.com>
 <54e3a23e-6426-445b-b5e4-43d727b88709@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <54e3a23e-6426-445b-b5e4-43d727b88709@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NiBTYWx0ZWRfX0HIOoy/PjxQ5
 HzDkwxo4S6YW74lOgzg926uMuls9iFkMa2AtAYSM/5FhjTQt1+3UYWO3iMA3J8VAXF2uG7oTo/S
 dMPxU/gokmW+m4us3YaNj422N+7dvzb4Jjx+8BnWrlL4uhrikr5gIz0mTBf2Pf2aKvOZVKL6Iql
 XNLSUIRtYZqqS4MvZXv8HlCbE+QIhTMzeVb4U7nqkagv1pVPsoXB6jpdfJ/Qb/oyr11gLCc8d39
 yZht4CMylUiWCeIU+IeOyoCq84li7O+qYjyxXH2g70oeUGyK3zsFHyQ10on9oLGNGHPghqKXmQr
 YWdxhUya+oJW/mpgiFXN5F83FvEm2lZva6tVZtZNJvpxm+OyjjwlnzyIycy5+bjDHsX8Pl6P8cj
 0FRGQKjxb1W6zrKjkcfon00zVC6uSealljitfGPaBzEfEcVS1ZojnwIjkxEH/ozyfDfBlBwYcus
 ZpSSrelfUzF3C65iHSA==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=697894f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PdAv3VS2nydJPQNW2zsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Wh9p_9OE0weN_qrqWhOuwT29shCQVoXn
X-Proofpoint-GUID: Wh9p_9OE0weN_qrqWhOuwT29shCQVoXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023535_524013_7EBBEA2D 
X-CRM114-Status: GOOD (  27.00  )
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

On 1/27/26 3:13 AM, Songwei Chai wrote:
> Hi Konrad,
> 
> Sorry for the late reply.
> 
> On 1/13/2026 6:33 PM, Konrad Dybcio wrote:
>> On 1/9/26 3:11 AM, Songwei Chai wrote:
>>> Add driver to support device TGU (Trigger Generation Unit).
>>> TGU is a Data Engine which can be utilized to sense a plurality of
>>> signals and create a trigger into the CTI or generate interrupts to
>>> processors. Add probe/enable/disable functions for tgu.
>>>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---

[...]

>>> +static inline void TGU_LOCK(void __iomem *addr)
>>> +{
>>> +    do {
>>> +        /* Wait for things to settle */
>>> +        mb();
>>
>> What are we waiting for here?
>>
>>> +        writel_relaxed(0x0, addr + TGU_LAR);
>>
>> If you do a prompt TGU_LOCK()-TGU_UNLOCK() the writes may arrive in
>> the order opposite to what you want, I'd say this shouldn't be _relaxed()
>> and we should probably have a readback here to make sure the effect has
>> taken place immediately
>>
>>> +    } while (0);
>>> +}
>>> +
>>> +static inline void TGU_UNLOCK(void __iomem *addr)
>>> +{
>>> +    do {
>>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>>> +        /* Make sure everyone has seen this */
>>> +        mb();
>>
>> I believe this should be a readback instead
>>
>>> +    } while (0);
>>> +}
> This lock/unlock sequence is intentionally modelled after the existing CoreSight CS_LOCK/CS_UNLOCK helpers, which have been in mainline for a
> long time and are widely used on ARM systems.
> 
> The barriers here are meant to provide CPU-side ordering guarantees
> around the LAR access rather than to wait for the hardware lock/unlock
> to complete. In particular, the intent is to prevent configuration
> accesses from being reordered across the lock/unlock boundary, matching
> the CoreSight programming model.
> 
> I agree that the comments may be misleading in that regard, and I can
> update them to clarify the ordering intent.
> 
> If you still prefer a stricter write + readback sequence here, I’m also
> happy to switch to that for additional conservatism.

If the hardware doesn't mind potentially receiving commands in the
locked state (i.e. they're not dropped), then this seems fine

Otherwise, I think this may end up to random misconfigurations

Konrad

