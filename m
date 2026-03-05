Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5F7F3D31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJfVH6ArqBR8VxIevRdjDVBkwzQbm4lnsd8aP92U7Tg=; b=3WcIGAMUcjS2UO9ybrW0M5cmCW
	JRnP9imC04HqHJ76YGA8jdL3Xd3CW+dkwOXb9aejtsx0qBvnm5TJltxzXMD/3VzzfmP14mgEgOIPA
	f8PTl6dpt72J0OPgDnZinrxvANPrg4qhK1nHBp7rE8XOBmqVWatsnNQf9Mx+qdmn1cpqQ7TGGxwMf
	Cxp801AqvLBi6iOL6S5JHioKSgrlBSqC/UJ3hjZMqPeEm5nJV+lckM7pO0dJyAcRYCChuX/JIwX+s
	fE7ZvId/qnSwDQ8eGBC0py8FJf5Xn3HYd2lUZyiOvPHBDVgdbGx8sw+uFBKMPkH6MU0US48RjRF+F
	dRAkdNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyB6e-00000002AY6-42QL;
	Thu, 05 Mar 2026 15:59:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyB6b-00000002AXR-3GXP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:59:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFaCe2922161
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 15:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJfVH6ArqBR8VxIevRdjDVBkwzQbm4lnsd8aP92U7Tg=; b=k726zjVGqsDbltY6
	l3mDbNIktlyZSUcmAHUEUQ9uj9BxbnOjPARzrXKAuCz2a5Z3/sK1HRm8X/2ZGHwP
	f9qFwRA8hR0SLE7YPYEvDXd4vvaAM75wEB6SkgEhe8zvBjiUw/Y9MMJ0VmTf3fGK
	SPRQs4Bcyr6LD0EcG48CUlW1dYweV+9uOvcYLAq3bK24abFvULob5ylriq+tdbqT
	JrEoHHjZVU455RWI58rLBltSuH2/CAeM7Eo6VnKih1baStv01C/tk6XvYcCwcmXy
	3zDCnF6kEOzm92tDwusjV06gjC520oc9YM6apvuvKdhnpT2KOusd/vFNv2PVDsgr
	pt2NkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q827q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 15:59:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c711251ac5so4688549885a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772726356; x=1773331156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gJfVH6ArqBR8VxIevRdjDVBkwzQbm4lnsd8aP92U7Tg=;
        b=U3ioiP6iW+7l7c/XB87I08C5iprcMRdzT7fzi9uh/VIqa5ZtbS1XYGhyDY/ACY2PVO
         VXGes6SsxRNR+Z0ml8tw6J+Zdb0XrnkuP4nZJIVVHUTDuVTfVOrqZSfklM8J7d5s2v1v
         y0BHoCeH69W9Lz3R2eZpXV71QN8QHRbJbbTSj+VW6gqQDd9BbIGijY4f530b1TExo9of
         2p4PQH0nmcf6X8V50sRAa13AIe9WG/eDx9VZiY+4Q+reBOmVNGIJ38s5gT6dh0lLkymF
         1oICfBLg0a5ZAk0huuyH903lU8/0IYi4d4hxckJAdw+APabRRFsmKL8yda6D6uf3ulL2
         zJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772726356; x=1773331156;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJfVH6ArqBR8VxIevRdjDVBkwzQbm4lnsd8aP92U7Tg=;
        b=DijMMcpUkgrPqCqp5ne4pC3Gbq83/BSpZVyqpO1xCgJ0TcvmEzT5GvoegdJefCndTK
         dCjuUZAFVopDajARgzbLRAdjFZHtqqvZ9IUuIFp+4PO0NOh6WGphulib3lYVUyyyUjBd
         zbn3xkW7cQo6RyVGON1lDUuz94AccewBhsuDU66P0pSr0dvRRScR4+8EUn+QGODtVUQG
         Xewq3SRyuwPYNe3hJohEgMY9nyimOg9X/d43d/N7oPrE+U2mhLXIY4h7xl1YatGZEXPg
         vSPvatV7roKZiCU4rfIfu6jnC6gQ7SRCW3w3R4HfJu0vzulxNI4lVzcfd73PJ1L6xio/
         R1og==
X-Forwarded-Encrypted: i=1; AJvYcCV6vaDuizQt3m0M/hmG/3e4h0jmD7FD4H08t7v2uBrQ1tmgQaN2SKvxt1x+qvXFAs5k1MQYAMSgIyDOCUKB+bwz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4G9mf3Qnb72Hk7g5rMT2mRudqXX8UoqhFkIbG6XL0VN+k38Sc
	DE/X8kDhInoipEJN+hZu3KFxBqS6Eul3oP+OSs3R/LUXIWwu9GbmzlddulYbY13mClHSk5Mvy6f
	oIDUS/aBFwVU4YN7tQKyyyOmYJTXer4kHjs4iUqrcQR9IgbYBUD+/fN0/ma78LNqYiSovIAp8bz
	jmRg==
X-Gm-Gg: ATEYQzwihLHQBdce7VPtzgfJWgHCc5pWSlE/XA8piQZeYUsszPZIbL91SVEVbi1V/zJ
	yrZxgRdIfCBCjoDLwJGj+tcBTBLut60sK/syKN6TpRo9uzMrycpTSTjaCZ1/JnMzLRIsJX+bxp/
	lG76ZUl85h1NnCVy2AY96qfWNVxrOU3CLuytYwmu6t4cAqoTbo/qaGGVq7rNrh2uN4QbNTpXBij
	9qV8WMqQ+fFTj5VmMhmHvM1rFRATJ57N151wyVWdzMtbsPdG5fO3xmFFB40EflXHOoAeTjWE+Sj
	3hOzFIEVcmWJKNaZSl8+oK6EjOMYSIc8KDZfHlxvgc/d5Gl3OnSKYYJ838pMIEwADoxf/olvcSV
	ztV6lzZi7ulCfIwbllxHiy6jX9OsEr6nZV1u/zzkdpz+zTfJM
X-Received: by 2002:a05:620a:4096:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cd5afa5ad6mr741186985a.68.1772726355980;
        Thu, 05 Mar 2026 07:59:15 -0800 (PST)
X-Received: by 2002:a05:620a:4096:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cd5afa5ad6mr741182085a.68.1772726355454;
        Thu, 05 Mar 2026 07:59:15 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae00absm46179485e9.4.2026.03.05.07.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 07:59:14 -0800 (PST)
Message-ID: <c768706e-f063-44bd-92cd-f3984ad3bfbc@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 16:59:12 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2d852f07-0bd9-4076-b0dd-93425ed237f4@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: psESBhveJipR21cn1cWfi_PM79hwBZaY
X-Proofpoint-ORIG-GUID: psESBhveJipR21cn1cWfi_PM79hwBZaY
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a9a855 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bHzazS_3SF2oTeVDu9QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyOCBTYWx0ZWRfX5R5UH+ZXXFPI
 2dWmC31LENjLtT2e6tD4yBwIReECoqL83YDtCcZjBjhS1oMJdJjrIyHyqhDEuioUqwKM2vb1eeS
 L6De+Dxk9h9gIe0D4JNsHOc3RAoUNz96INaXkAHingsWuUFSsSMyDPcagveCOzlrYuUoKb38Psn
 EXFVgQJXSWnDbrUmQvcTu5wprE+5ysNoCawsXo0cMRbqjTq+Y9ItiAlOQkR/QEVTOepPHJXQXsV
 4ZX8wfdKEleW3nZCStb8CP8BCgGs4g47VKTtWZhk6qYtAhJJ6vhc1sD9xoN2xL9SBMb2fsyuQui
 oCwiAywkQ8yrTI8WpR1ofu+qsTpcZ4dNpGkuMgVejqCDrJ3Pw1WTVwtW041QDeG9O7P+1P3E9oB
 l4zOUdkZ3kraBZGn3JuEzgTRPyF+tab9zD6mcHSo6KbriCA6JTB1JTtQnVyA6+mOE5b9uxXV2lU
 b89ZzWg/FFmmB2QwedA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_075917_834628_CDEF32A5 
X-CRM114-Status: GOOD (  31.06  )
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

On 05/03/2026 16:52, Andrew Davis wrote:
>>>> The code is not correct logically, either, because functions like
>>>> ti_sci_get_handle() and ti_sci_put_handle() are meant to modify the
>>>> handle reference counting, thus they must modify the handle.
>>>
>>> The reference counting is handled outside of the ti_sci_handle struct,
>>> the contents of the handle are never modified after it is created.
>>>
>>> The const is only added by functions return a handle to consumers.
>>> We cannot return non-const to consumer drivers or then they would
>>> be able to modify the content without a compiler warning, which would
>>> be a real problem.
>>
>> This is the same argument as making pointer to const the pointer freed
>> via kfree() (or free() in userspace). kfree() does not modify the
>> contents of the pointer, right? The same as getting putting handle does
>> not modify the handle...
>>
> 
> In that argument, if we wanted the consumer of the pointer to not free()
> it we would return a const pointer, free()'ing that would result in the
> warning we want (discards const qualifier).
> 
> If you could somehow malloc() from a const area in memory then free()
> doesn't modify the pointed to values, only the non-const record keeping
> which would be stored outside of the const memory. So even in this analogy
> there isn't a problem.

I am not saying about malloc. I am saying about free() which does not
modify the freed memory.

> 
>> The point is that storing the reference counter outside of handle does
>> not make the argument correct. Logically when you get a reference, you
>> increase the counter, so it is not a pointer to const. And the code
>> agrees, because you must drop the const.
>>
> 
> The record keeping memory is not const and can be modified.
> 
> And where do we drop the const? The outer "struct ti_sci_info" was never
> const to begin with, so no dropped const.

We discuss about different points. I did not say the outer memory is
const. I said that you drop the const - EXPLICITLY - from the pointer to
handle.

And that API which gets a handle (increases reference count) via pointer
to const is completely illogical, because increasing refcnt is already
modifying it. Just because you store the refcnt outside, does not change
the fact that API is simply confusing.

> 
> If the issue is that the handle is not const inside that outer struct
> we could fix that,
> 
> struct ti_sci_info {
> ...
> -	struct ti_sci_handle handle;
> +	const struct ti_sci_handle handle;
> ...
> };
> 
> And with that change even your original commit message example issue
> goes away,
> 
> struct ti_sci_info *info = handle_to_ti_sci_info(handle);
> info->handle.version.abi_major = 0;
> 
> would now fail to work to compile.

But you cannot do that for other reasons in your code because you DO
modify the handle in all the APIs which you call "pointer to const".


Best regards,
Krzysztof

