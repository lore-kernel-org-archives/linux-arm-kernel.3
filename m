Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED0AF47CC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+xZbg2UcQYU0NAtEL3ooNVs0zEnn8ejUS3RGwHRvhs=; b=GGOoSzsNoTxvDpgq4LzDNM/4AB
	LxmWU4/35aBFYD0U0Gp9lNzafFYl2vZqXvc5k0erqhJ1kHA9if1AYwtnUMGPvdvBGMM/o+t2fDEpX
	laPjus84LojEfJvP5PpIiNpdHYw1yznjO91uNJO2BZyCTV2B6WQbcVlk9798rR4nuEjW93k+x+c3j
	RIY01+gZOk4TcSqOVKU+fncbtTilU3sMdgWmZaKzmpVryt4cbbjHCsNdjcMFNif/bWjHLNF1SX24/
	oj+R/0jnSSYSEFrNRfHGor7HeoRj5aM+snjcZorwZR5/l3c5SEeTdXbzKKulF31d2XtlmJuFVgIgz
	jeLdRZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEhY-00000002Tje-0EAQ;
	Thu, 05 Mar 2026 19:49:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEhV-00000002TiW-1kS6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:49:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625IMHFa1914858
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 19:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+xZbg2UcQYU0NAtEL3ooNVs0zEnn8ejUS3RGwHRvhs=; b=VmF13nShpwR94pDQ
	zOtKvBgKFN0Du38CIX6ki/pV5RFPmMPQJzeJKpr8uaKevY3CTw6BEIe3HZpknY01
	jspR/kdToEP4lAk6CH7IjAcI5XoQ2d85YFUCOnhpJniFBGWqMMjTKmMTd8RcNLB8
	mGyK8USv/otuq/fKJjHn70n/FUhJXYBPT7PVmek1nSvzmjLLK+DShG0g+eYbRLCU
	DG5krug1C1Vy1P0VhjJzV8CiqKxVclA7IGHGjkn5+46H79pKd8plfbQls8YpGYCH
	Up0PlqdBnShiCvlqwyjYlllsWL424k3C7xeJmbQ83iAoOy6pUr/kw++qGm+F6kEd
	AgUz/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25r8yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 19:49:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso1017692685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772740176; x=1773344976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W+xZbg2UcQYU0NAtEL3ooNVs0zEnn8ejUS3RGwHRvhs=;
        b=kPW1oiBB0U88tmJgWDYirDrJ75FwWWbCHONgnhtJ22a7h60YuqAmn5+Fq15db59Sat
         Tgskr+oSLamH7q0AWW1wiHMGU23bWRr70Pdl1VN4a1+mUj7mRXD4XYLGnAVWQPiNzNeu
         PE782JzX6AlZbo3p/VRn/Q6A6p/jmMrO45vXbNV+Q63yFad6p/wJoSSukSWsH+dEoCOT
         IuVcsE6wuNvae7KG6QPuwYdRgLvhvBfxiAjbsHDDq21bihgcJzIi1b6AL5OWTPOYaeiO
         HVXIGe3FqvjpbU4e54oghFElVNO8GRwiqxujn6mXNCSBADuwZIjbkEZwWpng6l67eLG3
         B21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740176; x=1773344976;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+xZbg2UcQYU0NAtEL3ooNVs0zEnn8ejUS3RGwHRvhs=;
        b=HXVX2UafDW0KPL0JF3DsdIIj2LjbKkGH7jDzuYM4X3N5tKqiCDWe8HgmjsGBw8TdDE
         rBUB4m06BaVan6aMbmN1XrmOI5ApzOlCUf4Mk2SZsWkZLE/ug0dSrj/Q+cX6xjzjlmNx
         V9dxAQiHj3GMHltISHinUpbxnhy3Ir4Z/R9/Ep82Vbv/+IqQecaAZUCDWaeAqjFCfvRY
         Y8dQ0bqXF1KjY8/lGg43qYgfMxkH83E5sLGrmC9l+C/GOQ7CyejqsDbApDMSbZ5Wmry+
         V9du8CI7BtCEWOMM1TUrKybT+Dpk+M6+LsyzSJPhOEUEZgnKPw8AC56AaSC8mk+HJa0D
         Whzw==
X-Forwarded-Encrypted: i=1; AJvYcCXjVlsijwUAjE/viIMbI3LwbGES5vCV+eiZFif5+lyVZrl5utu/ap7G6t2CfjWrYbydDFDKqvs5zQrGBz/zI4To@lists.infradead.org
X-Gm-Message-State: AOJu0Yze5nwDnOrrPiN9znEK7I80XrQuBj23YCMGe2Gm/Qjxhf6vPp+U
	Z6g7zLJusz/73lt+a7S2IRcwRvyZwO9LkqQH1M60QhJLipaGtPSLwCj2OC2XID4dTAf20b78D0H
	VWR3rEkyz3QyXqaiAODXMhH7KYkmViqGUeGVnJsTu5a1CHxJ3UTOG0sSEt2TbYYUt0449Aezmuh
	yFGA==
X-Gm-Gg: ATEYQzzeVjGGTNPNMMVU5LSunpDTLwrKpxs27zra5+JibpTToAKwGtVEJHC76ZzO/yw
	/lKXlLaDzwkV3JK2iz/Y3B2vFDHD0DQXn/SyZEXALXIfgs9wbJ8lOUYIqOS5YmnUC4GYnxWlUQj
	4sjGVaqcy5TOfLlgDGvheDAEzzxzTL+ZqfxrIICwNqWwUHdO8Sr6GSo2/aH2LLycWoUJpGj3o8+
	d1bcerA7xcUhBoA8Txw5Dl7WsT2V8RKKxFgO5eqjd7T7VOCjuzkTQM9Bgg5CTIyXuQloMQ3SCWq
	tW9YTfKTtXMjvEuvpqZNND04QrtcHN7fMpbRwynKwz8Sponm4PkhJqWHIdERQes1IrEadQvqLOm
	rL3yiG6SArHBJayFFdH+gvXMLife2oM1xjBGq0hMeibw1mK2D
X-Received: by 2002:a05:620a:450f:b0:8cb:3bca:bb46 with SMTP id af79cd13be357-8cd5afa3a2cmr885522085a.64.1772740175853;
        Thu, 05 Mar 2026 11:49:35 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8cb:3bca:bb46 with SMTP id af79cd13be357-8cd5afa3a2cmr885516485a.64.1772740175244;
        Thu, 05 Mar 2026 11:49:35 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm37388533f8f.18.2026.03.05.11.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 11:49:34 -0800 (PST)
Message-ID: <7aa1e643-a557-439c-a337-20575adf1e35@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 20:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ti: sci: Drop fake 'const' on handle pointer
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dave Gerlach <d-gerlach@ti.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260223202426.566958-2-krzysztof.kozlowski@oss.qualcomm.com>
 <195cc8dc-8642-481c-8bdd-f5409ab8f5b5@ti.com>
 <5b6a4284-4766-424c-9171-feaa08c52ad1@oss.qualcomm.com>
 <2d852f07-0bd9-4076-b0dd-93425ed237f4@ti.com>
 <c768706e-f063-44bd-92cd-f3984ad3bfbc@oss.qualcomm.com>
 <aa2899ff-a8d9-4740-b256-266f7073f0a9@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aa2899ff-a8d9-4740-b256-266f7073f0a9@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jc0vbeQGsDwVbI5pAX4LzzEh5sz4-7Wd
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69a9de50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QannFOAQAd3pVwgO2DEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2NiBTYWx0ZWRfX0tIZoLoTSntx
 Jv6d3+JeO+Novh/8hGb7cQNSelishkEoIaz2laKu4QQxSxX65X24SJ/YOygpzK6iO1YxJS8C7WW
 4oOBBHSwo3P//5UAK6FHh7+EVY3bZtPtHCKBGHN6MBN5/tnbf4/Ye6R8oeZGRTLoewHyoSOpmaC
 mryuS9sDHE7OdAdRJkJkVdfEJi43hGiX2MZ3e6g0VnwoAho6TPb/SGjIb03IPda8AFKnr/y5E38
 e/yUBFM41BT5mo9qKmM9a6YoIJ+72USXkTJ9Z6A26t9wbE92tKBuJjy44GN9AoT7YH0lpizSMHq
 TRe2bcJTlsbGZzoaZb003DtO4Zaisqkjm0a7w4i58HnBYUOvx9SGziOJAI6qNil4Dv6ElNe3GkQ
 dHgL6axJzyVh67QA8OsOsW/m2tKYscyjsXuCbBPOy+EIr3qH09SAujMXbvYV25kfVGEh52HYOPB
 ShKW64CnjYOjmFeY4vA==
X-Proofpoint-GUID: jc0vbeQGsDwVbI5pAX4LzzEh5sz4-7Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_114937_464858_D1073328 
X-CRM114-Status: GOOD (  29.16  )
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

On 05/03/2026 19:44, Andrew Davis wrote:
> On 3/5/26 9:59 AM, Krzysztof Kozlowski wrote:
>> On 05/03/2026 16:52, Andrew Davis wrote:
>>>>>> The code is not correct logically, either, because functions like
>>>>>> ti_sci_get_handle() and ti_sci_put_handle() are meant to modify the
>>>>>> handle reference counting, thus they must modify the handle.
>>>>>
>>>>> The reference counting is handled outside of the ti_sci_handle struct,
>>>>> the contents of the handle are never modified after it is created.
>>>>>
>>>>> The const is only added by functions return a handle to consumers.
>>>>> We cannot return non-const to consumer drivers or then they would
>>>>> be able to modify the content without a compiler warning, which would
>>>>> be a real problem.
>>>>
>>>> This is the same argument as making pointer to const the pointer freed
>>>> via kfree() (or free() in userspace). kfree() does not modify the
>>>> contents of the pointer, right? The same as getting putting handle does
>>>> not modify the handle...
>>>>
>>>
>>> In that argument, if we wanted the consumer of the pointer to not free()
>>> it we would return a const pointer, free()'ing that would result in the
>>> warning we want (discards const qualifier).
>>>
>>> If you could somehow malloc() from a const area in memory then free()
>>> doesn't modify the pointed to values, only the non-const record keeping
>>> which would be stored outside of the const memory. So even in this analogy
>>> there isn't a problem.
>>
>> I am not saying about malloc. I am saying about free() which does not
>> modify the freed memory.
>>
> 
> And if you look, kfree() in Linux takes a const pointer. We also do not

The slub, but that's the only implementation being I believe frowned
upon. The mistake made long time ago...

> modify the content of the pointer we are given either, so we should
> be okay using const by the same reasoning.

That's a mistake so you cannot use the same reasoning. It's bogus and
bugfree to take a pointer to const for any kfree(). Just poke MM folks...


> 
>>>
>>>> The point is that storing the reference counter outside of handle does
>>>> not make the argument correct. Logically when you get a reference, you
>>>> increase the counter, so it is not a pointer to const. And the code
>>>> agrees, because you must drop the const.
>>>>
>>>
>>> The record keeping memory is not const and can be modified.
>>>
>>> And where do we drop the const? The outer "struct ti_sci_info" was never
>>> const to begin with, so no dropped const.
>>
>> We discuss about different points. I did not say the outer memory is
>> const. I said that you drop the const - EXPLICITLY - from the pointer to
>> handle.
>>
> 
> Only because container_of() forces the const to be dropped, that is out
> of our control. But we never modify handle though the non-const parent
> struct.

That is not true. You could use container_of_const() if you wanted to
have const. You explicitly drop the const, code would not work without
dropping the const and this is the problem.

> 
>> And that API which gets a handle (increases reference count) via pointer
>> to const is completely illogical, because increasing refcnt is already
>> modifying it. Just because you store the refcnt outside, does not change
>> the fact that API is simply confusing.
>>
> 
> If the refcnt is not inside the const struct, then the contents are not
> changed, therefor const is still correct. Even if the content of handle
> were in fixed ROM, nothing would break here.

I am talking about API and again you go into memory correctness. So
again, very simple: any refcnt get taking const data is bogus.


Best regards,
Krzysztof

