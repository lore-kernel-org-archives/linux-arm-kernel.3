Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417A6D2D8E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37tcbhoPYX1kRiSMkZWCZCo/kuU+XTXOWQTT0gGxrLo=; b=w6q3Sp/WesPvzdwejpJNLd5rAV
	Py+kip4vv54GaR+0ZgY5zCE4omTdoYef08qz0gZIDqK5JjkAFx//VFD1sjIRgrYlkXGcMo6tS1mXl
	eeCue8JkqmQnqZ6I8sv4q0+xgQ+MBAmfILXF8Qd7dUz25n4CviQs1l/TlQjK2JhwNpq3INbeIWBW6
	b67E2o2oY2P3kN3JCg5tASXO6SI3HnSDBK4uRwrdCQST0DHNWTWhU3BrPGbNzkk3uWezMu6oXtAcU
	3d3+kGd8SsFEqmSBTjJtfK8bTt/re8AWcD0uuRQHD0geK/qR3c/CEuZDigewSjETjRaqzLCCc1TVG
	55Tt9PHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgMX-0000000E3h8-2wz6;
	Tue, 27 Jan 2026 10:31:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgMV-0000000E3gQ-0lMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:31:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAOoSk171359
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37tcbhoPYX1kRiSMkZWCZCo/kuU+XTXOWQTT0gGxrLo=; b=VpbgMBTterYa7iOJ
	oxFdYYaxp3SrlWVXnmI2qwyqoUYZA4x7bkqjdxL/8lBVc6/cgYYgXtEtKAteh3Fo
	lJ7Bj+Lf2eX7GK4dUMYfZShUlXQVAf4D4WlWPI/bQu70orCj84ovJkfftPIs2f0b
	wYDIFsNphcl6NZkpDK7cARi6Nyn2PKoS55zHaGkTe2u3Z+8Fws1GyF9GzHAHzk3Z
	7DECCJ0G3hwobGrxP/C6vcFJdJioakubSnqnxiqeBQxuvAaK+zXwjRiGOthRJl34
	2394p2WaT9J3zCNBf6iy+Sg01UPxQFfWdQMc8kl968JMMKjN6R7OeJU98Up0bkbo
	YRBu8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a2eep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:31:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so10669085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509912; x=1770114712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37tcbhoPYX1kRiSMkZWCZCo/kuU+XTXOWQTT0gGxrLo=;
        b=ayBcS+At18DYCzO0tiOa6UK5g8CxXQCk2BsMCLsipuAiLJtleHJqJcgFNyYgRB8jbh
         HAICmFwchr5KUuCdPe6w2JwL5Ah7vqXhgR4MPDBUNJZrI5BweUHj/VADITlFVZN2mk4n
         RNyaN/8JL16qMeQJjQjc0moPEex6SzSYQZUr6foZO6LCEhKP1O0N3UCue0lvuZG7wIR+
         31J97x6wd0U1QIlixjiB927ZSNPBDRc/qUgmgGJqL3tBN0hETE9oCw7diBKnv0O0NENy
         5DiqEgnSAtag29usc2YdE3CcWBQ13XYhhCTy7an5YJLzYBRI7WMYg54tZnyMQbp7r5MN
         UaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509912; x=1770114712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37tcbhoPYX1kRiSMkZWCZCo/kuU+XTXOWQTT0gGxrLo=;
        b=sE+THT9ynYEO0kadvilO85tCTCErMoADWDjTgAxUq5nGWQs2CnpvphE5LtW7s2c0Uo
         a4lxc9c6C8hBDg6WvrFFMJLLEqFLeT8sPs+mMT+nH4NCgQRJjf7rt2t+lxN9dKPSrAdI
         Y8p/hj8kKmb7RVP2z4C/dN7rzux2jxoGsWYaaxqOTVd/hAXIwYDnH9DP/uNnIX0D9V9D
         sSIjwe7sQQAgZHDJYLBrIVsvMjmC6xNcy4OXftMhr3cAMX6Gu7OhgruSHcI1DJJPXepN
         jTVSzFNaPaghAeDykNLvqe2ffmsduUXNxJrZOrK/MbFb7w8/MPxLalmFWpB6T5srHwxw
         vjEw==
X-Forwarded-Encrypted: i=1; AJvYcCXPYLRUWOPrUztZuwFIljtbMEIbx9wpKAhByRTM2IBpRtsC+yIptokK1U/89/n9H8rM+NWuZei9eN13SHbuOcYe@lists.infradead.org
X-Gm-Message-State: AOJu0YzMnbUuoX8z3eeaKOBzcUaDWsRZ7Clxz834ykOXQRfNHnu8ceVA
	/mGuFMgTbm+TQV62Qsl0IMgfgmb3nhVueHndvInsWMPmuOnkyOKEp8SmOZMyQfD1H1WvO+aRYgz
	p1lXNDhzcoEi4EwdrdkZVrlnf4EpEhcSUJbOujshFR+tnumE8Lpjs5/kmUQaP14HIeddmBxz2Wh
	x82g==
X-Gm-Gg: AZuq6aKXDO8lsaYi8r/mTs5zLvlxMpFP7E7QyKQPlFgN+W8lwsaABYtcpMbyT4DtU+r
	eTca0obad/G4anp9Djy7i4LVAOyPwJT8NJWdPDopf6++Ereh1UO06BQTBRvF2IdNevUvlESDFI5
	iaBnpi1kCJNkDDU7Ikze7GyaT3kUZ4xnBEuYJIM98zwWuXuZPeGl4JRIzRJjULNF4MNrgijBjCC
	VXdAex6Z/8pzAK4oYWgLseVyIg83ICJ5DQJprv/VzKaM+8z5U90XSo26igkUKjdX16k8mhJhD6b
	+5NHc+kYPDTQbTxCNnplGujeDJ/c8A9FdK4Yn7LBk7MQrIEoPhq/7jsoGsbbIgJ4Q+TVVcfsmE/
	AzqQYw5+tnBqMtEq5uIDqV93KmqfyC+bKZJof5Km8VHbpj0ST+4OVvsTVqYRfL7WAPbQ=
X-Received: by 2002:a05:620a:72ae:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8c70f61f3f6mr10056785a.10.1769509912016;
        Tue, 27 Jan 2026 02:31:52 -0800 (PST)
X-Received: by 2002:a05:620a:72ae:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8c70f61f3f6mr10054485a.10.1769509911500;
        Tue, 27 Jan 2026 02:31:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b766733sm758314166b.55.2026.01.27.02.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:31:51 -0800 (PST)
Message-ID: <b3b481dc-498a-4247-88e5-f91b4205e401@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
 <beb63598-a7fc-4e77-a68e-8622fbd93972@oss.qualcomm.com>
 <66aae641-a340-4f0b-9d68-535ac296a335@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <66aae641-a340-4f0b-9d68-535ac296a335@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NSBTYWx0ZWRfXyEoblS7Kqar9
 H7a7ydU3DVUjqSl+RNmjX44FBfbKL0TxSZYszkS9a9Khv+tIy2JA0bRRX1tUgkHOFlgEBjsHvl1
 mVZUzLcj8qYd/uJBOj0iR+C/A70YxHhdJv/g8idneJ50WkmCmCxYouJ2Y+zeM0QLZ+XjLL7epV+
 GrHhFaYQ1y3sEGQxkwpMZqDSJK7ZCW2gPhnkykSr2CuSvdHf35ewlHypejGCD2ZeME1N533MFw1
 zKUtkHaRypxJ/oeAMfbQyCsUUhmC7WX7EP8FsprDJ5es9WmbxAaNE/LQiMjOMrgrCuXUHCNRTJX
 rNuNnD6fBt53DNimNiek0IlkYI8Wkxz7J53vFJzR6uQUg+u9EnQcluRvvGYHw3Vcrl++TM7rzsC
 WRPcpYN/JKXskGva6/llz2MCVzUdmh6v3HiamFnL2Aw2kcmChZZREltCZaCIXenL7LY4BmWcb6G
 hJdq0H+flnnWWWkwIag==
X-Proofpoint-ORIG-GUID: 2eG-K46fvXZXowJ0AaRzsm3pHk3nsXxn
X-Proofpoint-GUID: 2eG-K46fvXZXowJ0AaRzsm3pHk3nsXxn
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978941a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8EjekOa2TPCR8v-6VwQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_023155_228425_FA472F2F 
X-CRM114-Status: GOOD (  16.45  )
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

On 1/27/26 3:34 AM, Songwei Chai wrote:
> 
> 
> On 1/13/2026 7:13 PM, Konrad Dybcio wrote:
>> On 1/9/26 3:11 AM, Songwei Chai wrote:
>>> Decoding is when all the potential pieces for creating a trigger
>>> are brought together for a given step. Example - there may be a
>>> counter keeping track of some occurrences and a priority-group that
>>> is being used to detect a pattern on the sense inputs. These 2
>>> inputs to condition_decode must be programmed, for a given step,
>>> to establish the condition for the trigger, or movement to another
>>> steps.
>>>
>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>> ---

[...]

>>> +    switch (operation_index) {
>>> +    case TGU_PRIORITY0:
>>> +    case TGU_PRIORITY1:
>>> +    case TGU_PRIORITY2:
>>> +    case TGU_PRIORITY3:
>>> +        ret = operation_index * (drvdata->max_step) *
>>> +            (drvdata->max_reg) +
>>> +            step_index * (drvdata->max_reg) + reg_index;
>>> +        break;
>>> +    case TGU_CONDITION_DECODE:
>>> +        ret = step_index * (drvdata->max_condition_decode) +
>>> +            reg_index;
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +    return ret;
>>
>> The only thing your switch statement is assign a value to ret and break
>> out. Change that to a direct return, and drop 'ret' altogether
>>
> 
> I kept a single return intentionally so the function has a single exit
> point. This makes it easier to extend with common post-processing or
> debug logic later if needed.
> 
> That said, I’m fine switching to direct returns if you prefer the simpler style here.

It's up to you. Do you expect you'll need more debugging or extending
of this function in near future?

Konrad

