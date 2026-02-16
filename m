Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A14E7BD88
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=; b=JmFLncAWpgolVxDgB9UHJFrco3
	oIWoY0Wa736/N53eJiBLdgVXPDm1FN3P80vxD2R5fNIsIZXBB5Mz7DebvloqsdEOC5SuzHiyghCNg
	PmqYR9jq8JxLOkKTsqklcCXJeCL6dJYcp9vkjuH9XBofOWgLBzAj/AGqUW9eKeZ5GZT2uFxWqtmVg
	HLZiXTkMJG6TkvxgCvWJV3tlifI8gkHMeOHJJmvqBQtAmOOQd0uuaZvJGinqPGQ7VZvxkED+tos/E
	rft4TVuh24FkCSaPtsLpaebMpr/Mfj/IdXiTuIDccyxG7HExp5e+/w5boX7XjHdVZSU/JF4rPipni
	q02mSFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvvK-00000006M5D-2AkE;
	Mon, 16 Feb 2026 10:33:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvvH-00000006M4e-3Xi7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:33:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNBvmi2952076
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=; b=aNWm/E1UUw6LaAbp
	VaUBJ05xZeaBUDYlnGsWyioTIxpCTGrBq6BRS+F9v0blGCpVSKwkXkZ5dz7aG6r6
	jFn/FlYyeXbaLSeX/Az+KvppEifw/QNCr16JvsEUzFJisqhudSAwvJHTYD+DF9hk
	Nk+Fj2gnY9q8E9wXTsGTSWFcV/8nbAxlueW5EakVk0cl/aJnqICuEtY150uPs2HC
	YKYsOPpR+Iziuob8JSpHrLwp0RGBK/S9uGSLoEoMlKgE4UyOh3tMa5QURgiUG7EN
	kwD/ZnCwZ6nr/pZ89gApkdaSZW1JqunIkX3T8qkkC4HbK6jWfrp9uAOOiMKE2Tvx
	8P1aXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcm3nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:33:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso2300562385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 02:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771238026; x=1771842826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=;
        b=XI0RNnHIGcEeyS4mokazsqKKaFKWJrkO5VsXnfV9towWeWLsqLuH8f+hFy1A4bs95x
         DC6HwtdxI7hGcnzda5JbL+hrd3jkKEs2ahkBtoEM18rMuKQlLxvFpz4qCkF/8kh0msH+
         47z//IekbflBbvilTtKMMziykspS6YS/oTENM+yzzumuWFaBBzGaWwZ46ZL+kYYRZGdk
         cHJt4nwigvWWXgYcWB9rJGwah+gklKR6EKVgxiI4Y2rrqM/vAZo71jYtrCXs9c1bICIG
         Azlgo1W88BZGqOVhtrqTHOJWO/fnfBhhPZPhoJpogJnCbwPafA4WC0uNFuS8m+tZ89XQ
         oOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771238026; x=1771842826;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qT3PYfzNPVNMJsGBk/5dM82E1f/rJKDYQvjgXohlQc=;
        b=krkNcpgjLfZrFTsThGKvZlbOd+BVKuX0cCEsjC8zRWRM4T5kETUFYjWeM1Q7ac5VeV
         ZlWkApywJasg5baGJ6MziWnHulnBaCQvB5MyZZe7eRMunntk9kNtdt69+OoOijtLkt3N
         6roFf3dLLsREETgeRx0d5NyB5tpQoO6ptU8TymaEL2C/UlikAgLDk2Vqyv+0ZuX3idQ0
         IOVvCjZ3KsAaonDuJim+VNviYbTam4fIXyPMG/KOn25+exsA5WVo2Af5s38Ul2gGX75m
         TJsiHNMDu/3mQiRmOWW4oGOMPG2lJqK7ifRT8fGnKoRYIIPtn+QlV1dUo/f/pYCd6KqI
         1R6w==
X-Forwarded-Encrypted: i=1; AJvYcCWAG4V1qosnHoIIKT5gWRgBo+pTn/mAiz5Meo/O7IrbBaToOPYa6FMrrF7JBB1WYfDF+mNEEkTLRwknNkR2nWHk@lists.infradead.org
X-Gm-Message-State: AOJu0YwfgQTPrcMHFO2AcgiQexxAqaaIjJiAP0Ytbwhaz3NSLPtKuNex
	bL4nUcxCdXHR3hP7PH4SSCHQwk+Iolf5aINmOodTfymS2yHEvxec9ZTRsAEOsAWb4H7eyuQSEzZ
	aoQT0joSf21r+piPwwUvXLlkaKad8Uwc9fRccEJC+JeBWq2IgnF5bYkSGG+oKHEMatJVBMj0k3l
	7MxQ==
X-Gm-Gg: AZuq6aIUXtBPWnWfmBdtBOLPhrvKRjIMczkMk1EJSxBxcMdrKa69ruPF09FRjUmmaLR
	dV9tMEPZ0aODG5vifa8bMftOTWRW/nNf2hpQf3KKajVvtXmc3rNQH5yC0xdM9JqG28j1cojJ8wF
	rIEvLacAa0Hl5Plere+kLSIjWdSI4g2/DLdubL4grkrQ9iyXM6DYMSw/dHO68ecQVHn1m9ev3Ja
	IQ7cVLiObaNlLiyKgw+9oXc0ZZXa8S51oD7jGkIbY3E8ayZSvghZnNclTc/eVZ9luE44gIRE4Ya
	pix+MJkq8296WEc5xkfuHGZpXlEs7r81UKJp552+U9pdNZSV119JXiHa74OXaHwnD9MPuXSH+Lf
	dXf/ediIivPAcEwqqoKigcwB4pWhYsSKmBe3YIYaC4bReXTVjnw==
X-Received: by 2002:a05:620a:254b:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cb42281159mr1182792685a.20.1771238026068;
        Mon, 16 Feb 2026 02:33:46 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:8c7:f62:21c7 with SMTP id af79cd13be357-8cb42281159mr1182790585a.20.1771238025643;
        Mon, 16 Feb 2026 02:33:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm454093795e9.3.2026.02.16.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:33:45 -0800 (PST)
Message-ID: <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 11:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: stmm: Constify struct efivar_operations
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4OSBTYWx0ZWRfX2nahT0NNuQDC
 ZnjQUHvb8+yIewWlq6PJ649EHA5gx6tqmTUXYL5Uu2vaM4DzzMEbSpWwXqVpEw9j/a5qDGOu9zt
 u3J81dvXz7lPNaHedgp4Bq1Gr3NTJ4IZlZyqWEVRbk/G+RHC+dhgSqj83VuiEg7sXuam8l9Ys6B
 eStlw4xpkVkqmcyjU+pIgU0MiArFZnUvExX7ddpN+ouBlbZrOGW1naTsU00dC/3Y2mQ0CmsAkJz
 JI2xziG8u45bLx2jZXsBGafGv5Xtt/qT3WXZNhvBw/1h3+EC51zdItgq9bj50BKIGqjaupifjhC
 IqxDp1liA//zNTzqJEaRLIYh8/HHK6Fg9Y+0V850AcZGVOP33INR+Seyg3oolvu/WZvCb4kfHLB
 qcgaEWs6SRD76nLS7Z+EvcktohZ9LUN4vjK5BMgULbDGCxZnQBCL2Lyuas87Wx0kE0RtNXyvTpo
 P0BD3UXfebAJd9WComQ==
X-Proofpoint-ORIG-GUID: V86hEiYGtulPOi4JZzYyTINdiWwFKcBW
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6992f28b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4HEYRM_J1xu74ZP5z-0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: V86hEiYGtulPOi4JZzYyTINdiWwFKcBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_023347_903082_AA9FCD60 
X-CRM114-Status: GOOD (  12.82  )
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

On 16/02/2026 10:49, Ilias Apalodimas wrote:
> Hi Krzysztof,
> 
> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> The 'struct efivar_operations' is not modified by the driver after
>> initialization, so it should follow typical practice of being static
>> const for increased code safety and readability.
> 
> get_maintainers doesn't include me in the cc list?

I use only get_maintainers and as you can see no. You might want to add
yourself as maintainer of this driver if that's your part. Or have
korgalore/lei filters.

Best regards,
Krzysztof

