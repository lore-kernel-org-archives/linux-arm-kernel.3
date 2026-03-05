Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F040F33A7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmnvSi+Mlmxa1/2IVU2T+BS0zKlOzWLnk6SgpB6s5WE=; b=ul6RHswSVtEKZ8Qo+N7QEgc0ov
	J/lcfCz7bDTGBqNqIKk7oD2Se7Me4WsHvKMe13eLcLjrADjqJfn8xpZAiTrDBpjKaX5LdSld+dvF+
	pZi7OufBJ+DCUH2BsyJQBTW1TX2hlugiSnrjDuaA9ZIYfWpCr0SI+Txzi9hPMmvnxVxMAeonNdGv4
	V8ejar9V3Z3hdQYurdqs1mlCtuWbM6+czbi3LQFXJIKvCwMD9PQbcC94lr29KDDiNpCAP9iF1MLTB
	KjKkoZfdcI+tS7afIOFcZnqkOSjvb6/c2tQqINK6Ae2aNrCHiRTmvaJB/h86WRjhbjecp4NHEfoJ3
	uetp7BmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAAy-000000024w3-2Y64;
	Thu, 05 Mar 2026 14:59:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAAw-000000024vh-0zZh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:59:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AUJlY169338
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 14:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmnvSi+Mlmxa1/2IVU2T+BS0zKlOzWLnk6SgpB6s5WE=; b=MYuEArvINTLoJXn/
	5uRsYxESNS3mU0eg5ex/bV0qSOVNpejqqM+0NSrTM/9PrAj9giRpE7tLxs3ZWYFs
	Tq3t/E7uDBXw+RRfcFtOHukGf2rQoSJ0wX5wMt9P7GwUXf5iAmgUFtvEmDTV1BQu
	T5mEEsAmQVQCFyPhtu9SrB7+ZnKtA7ADmvyZ9w/jnKeHvy9Hux2cpOADjV66BFvW
	vcI1hXvcFRn6cxqcN9Mjzg4m4uzaMpZhqSBvDUfaC1H6OMfuupc+O1cExTSCyfZt
	m62vsrmeyyC5q1jB5p8mir57ZVUAu5m08vubsVGG0AhAgfFnu3PTXj+XNVi59vDN
	+xrkBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84w8s2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 14:59:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5981176285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772722780; x=1773327580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SmnvSi+Mlmxa1/2IVU2T+BS0zKlOzWLnk6SgpB6s5WE=;
        b=bIU9e/QxMDIJYjdzZ5ePt/tDByHt4fslTx+tvoeqCSooy21lT9QcWtEYcwTEydf8I5
         ewqiz75j+nhFiCEMT9/7kzGGrTUY24HUyHpyDiXKza/SuIVY5KWQSvRceXBjI21rvDuK
         dWB8BLARXbqCmdOApF/ojQ6lI96iDCC6ONeFG/kVawP52Sx8J+egf/1v2cKVq2nftlUK
         Q1TARy5VCiO0chn9YYhlTKvx6Z+L0zOCX7gQz7rH5LKX/FKANun8Emc0bAE8yPnOXrlK
         UvvCO5aF+fMT0Y7kJEK+kTZcWfWwQ5Z8hdXU0IQMOSRu3GeH7nVMtaTT2xYcPm7ci7he
         4hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722780; x=1773327580;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmnvSi+Mlmxa1/2IVU2T+BS0zKlOzWLnk6SgpB6s5WE=;
        b=Y+nMxZkF/oY4WnBZaYkshamQQHuZiqQmv8Hlh/tYzUKW6qCcbbpUgKYf0WsWZAYEiW
         kvKqV0qU7AbTk6n/5ff+gQPZD7RrSri1pyeR1H5Wt/oUkUKnWmCxUmQ80ZkiKtOmhRoE
         UCHSfqvqA/cCQHncCKxjB4mEdcBS26oHMkmuZbiauLHIisw/QMPqKuz9fk0dZeIZyTwX
         owdu+8CQxha0A2VwrIFjuXYBXPTd4XKP7ZJdm3RLMF7u4P41QrIzbU0JSN0yU9M28dbn
         n73g4jsNL1qvvtM8jRjFbvikzcr1SdX6NGHroV7sTJgKvQ8Jo3bQ/OiPvUfIazm6gKpZ
         uJtw==
X-Forwarded-Encrypted: i=1; AJvYcCUVtRoAlnPshaH5bBi2OffaKtyX9RZpxvZ4wtT5DGkxH5qusaw+7JyNkTKlPFmJhKsyihudSUmsVYkVxxpIfEBC@lists.infradead.org
X-Gm-Message-State: AOJu0YwWXFdg3/yRTKy0izvINzzvbDQ8S/Wy7OndfI1sdzlMjY7sPVTu
	GVc76rZwi1mFGq+llenSWQESR8LziNWTw7ekTnqj/CKUy31Ggn26g6bb9cg7SyV4i0UhZEcVbwe
	Z62nKopBpbcffNp0BrWj0k7hBJAMSV1Ruvidm4Df7pdRhtbO8LKIOh5ldY4GBUJrPFzgtJmJKO5
	AUlA==
X-Gm-Gg: ATEYQzz2lwzYXd39rvvdmcxNGRQ6ilM0+KQk0pAYMawrY8HSjPSNN4uEMokS3qp0/zI
	5tqFUQtSOP56FiTVStLOMdLkV5W7OONLqT/st4xCCt7qbFMix1P0kgB3sh3C6QneQ/TUCGT4uwE
	Z9pJKcBdBdUwskjDXCGB+Re1NO9YfVAfkIyLSOaLBJWtq6bPe4k09sOHhh+AfLvL2Ltg/O4IIec
	LTzR5d2rVvr4P4YTDPW9KYcH9OhPR0QSFEW/ipgg8K9kk94x29GvU0/RSEM5K8PR3yH8o/AJfoC
	vvjCrtuif7Pkd69O5YF2OxEVJxiG9BsL/zVYnOihPTWcZFjTzB+p+DTSpMIQzzt9xAEQLDee0eR
	J3GaAflV8Er1L8XwcbagjvJLng66XAW3MaaEtbXIjHgZCWXJE
X-Received: by 2002:a05:620a:4481:b0:8c6:adfc:48f0 with SMTP id af79cd13be357-8cd5aefa21fmr710569885a.28.1772722780144;
        Thu, 05 Mar 2026 06:59:40 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8c6:adfc:48f0 with SMTP id af79cd13be357-8cd5aefa21fmr710564485a.28.1772722779676;
        Thu, 05 Mar 2026 06:59:39 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8d20f7sm36871635e9.8.2026.03.05.06.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:59:38 -0800 (PST)
Message-ID: <5b6a4284-4766-424c-9171-feaa08c52ad1@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 15:59:36 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <195cc8dc-8642-481c-8bdd-f5409ab8f5b5@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U_2ZIMKmveJV5VXTmCWuvl_TvqYD_4PW
X-Proofpoint-GUID: U_2ZIMKmveJV5VXTmCWuvl_TvqYD_4PW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExOSBTYWx0ZWRfX8WVixAQIDwi/
 PUctUXgumjPP0FgWID9wQ0/h4+21APkgcPzVyEv1anZVLio7L00kUOVHSawxnKiEJGYfF24qDh2
 Rok8vii7wHoQjCdMZqwunNfNqdqJsdEndVUeCMJjNIaCwFKtld3N5W8LRqfFLfr3qEO/gvb/IVa
 K8olKh1MG3rhmuqzAD3Lv4aeV7sJSxCcGYZNLoh+9W0eA40KoADBpyHdIb/QFNyV39n/WffxuIO
 KuycxA2wYaMMk66TGjGkZtuwPNc9UTjZMeuZcYZBegF0ShS4Q9yEih4/aqRB7fi9gVkZqFXzUDv
 hEFzov5ItHGdBnjojMuzQ/w5bA6kLp6VhGPu0iszvUsTF/B30/JQ7F5HZ410eyZTVmsRs3i7kM/
 gcCz14qF+kg6d2jy6Jfq4KMYc9/4OZUQbBapMhsYgL5f0UfigqDO7z0g7Cek+Gle4IDYzbafeKE
 u/MitBA5nSqisp97oTQ==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a99a5c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dua3lmL7_bghm9Z8UcoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_065942_401138_1238DE35 
X-CRM114-Status: GOOD (  23.89  )
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

On 02/03/2026 20:12, Andrew Davis wrote:
> On 2/23/26 2:24 PM, Krzysztof Kozlowski wrote:
>> All the functions operating on the 'handle' pointer are claiming it is a
>> pointer to const thus they should not modify the handle.  In fact that's
>> a false statement, because first thing these functions do is drop the
>> cast to const with container_of:
>>
>>    struct ti_sci_info *info = handle_to_ti_sci_info(handle);
>>
>> And with such cast the handle is easily writable with simple:
>>
>>    info->handle.version.abi_major = 0;
>>
> 
> The const is for all the consumers drivers of the handle. Those
> consumers cannot do the above becouse both handle_to_ti_sci_info()
> and struct ti_sci_info itself are only defined inside ti_sci.c.
> 
>> The code is not correct logically, either, because functions like
>> ti_sci_get_handle() and ti_sci_put_handle() are meant to modify the
>> handle reference counting, thus they must modify the handle.
> 
> The reference counting is handled outside of the ti_sci_handle struct,
> the contents of the handle are never modified after it is created.
> 
> The const is only added by functions return a handle to consumers.
> We cannot return non-const to consumer drivers or then they would
> be able to modify the content without a compiler warning, which would
> be a real problem.

This is the same argument as making pointer to const the pointer freed
via kfree() (or free() in userspace). kfree() does not modify the
contents of the pointer, right? The same as getting putting handle does
not modify the handle...

The point is that storing the reference counter outside of handle does
not make the argument correct. Logically when you get a reference, you
increase the counter, so it is not a pointer to const. And the code
agrees, because you must drop the const.


> 
> Andrew
> 
>> Modification here happens anyway, even if the reference counting is
>> stored in the container which the handle is part of.
>>
>> The code does not have actual visible bug, but incorrect 'const'
>> annotations could lead to incorrect compiler decisions.
>>


Please kindly trim the replies from unnecessary context. It makes it
much easier to find new content.


Best regards,
Krzysztof

