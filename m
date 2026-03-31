Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275EDFF60FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=; b=oqHBnU5eFNisb+ssmUKOCxQ5h4
	TGo9UK+bF7Ntfy0bC+U1eO05lKiI1AeVG3RiRzd3SuXD3kpU8voZbW9U252eM1JOk0ecm1RvDlgl+
	asghj1JEP9SHMDreei4pffJ/o5vG0gxqGiYh41Aml6iZqMpCbJBukJxqNekr60P95lh1boYsckaGh
	gfd2Fwknhxb5nfR0d7eapL+3GwLf/XNOtak0qvFPbXMOZYdmyMY0n/mTl+kyURj+aqaWu/OxUsS9j
	TiDHgz2A55UzRdVrUuTFnc+bgeqQG0rnjDkG9orEixCLpkdXdt2avaCdaAD2HvWqDVEdvkpgSnfHw
	yWj7/UJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WDY-0000000Clxs-0CNZ;
	Tue, 31 Mar 2026 10:21:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WDU-0000000ClxC-3P4e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:21:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9UP4S843933
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=; b=hHjyb4C1YI4pAYlc
	VA09wSsVJxi5ArZGeCM9LuzkO22pZKWz34F76O+KHECZSRvOMyO2o9o6lE5uQouW
	kPPR4YEoV5hxPC1bhRTuxyTIlhppgZd/NG9ttzimu7mlFOiLPqX4O8FhXFQgFvrc
	9PGpFxX//rUeDx/9BTjmS9fJ4DZprEgAIde7uZV42cF0p2HiC8mq0TpQsihWjJVU
	DjwAg8t+bLR0OgJErIC7lKyQJ4lXvfVpZRBGnYImdQ0D7G19y19zEPjO7XYar6yk
	P0w4SKmpge8g1mQvgoXGk/Q+x9gvtHhO2GNT++LoyM8xizwc6rUzHSmrMp83TBsY
	CFmt1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt9hf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:21:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso32923601cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952459; x=1775557259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
        b=P188Wg28omVfAr36v9tCo5DbV7us6rneUJCaW2bcVSusytlxQtgV1+27wz+g+LVuDq
         AkbMgfTREmIJNCMo2sVWwoSK+raqa3TOArnAt/wrKL4+yXM33X0vUd8fLRd4I16poOdb
         09mNEnQU+NyYL6a7hzmTUeg158PeD5I6WhqcQh6eOhY1fX51+R1WnYRpiIHUGTepFhWO
         7vYzyqwCNF5EPXfRsLnF5ijAr0EAVuz2LfuJxOfh9k/M9AfB8O4yGGe/oxknBr+A9nmP
         nNgY9Lzb6AYSobw7PdWx/ghiecaGFnkPUB8Bg7fXMf7RrxOzcAvmId3ZeLQcokIsVFSC
         TqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952459; x=1775557259;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UT82/3lWMmlDNbovHHsALTmbvxSNZnI/J3PZAlHEo/c=;
        b=EZVZ4mKH+bB2MvKl8oxgvlQmh/pRW13A6/VekK1QnzhnvWZr03sBVyHQQLXFxE+jCf
         hvZeN8oGnI7udBgZb8q06ktIf5NY/0r3LwZAzCjm81a85h2oryQ9gUrq7qg2r8WwMr7S
         nWZ4sdLlub3Z5O/tuctcjyzw68QTxecPXhkP2WoW/31pTr4GHKk2t4A37go/ID/kWSf5
         P6KvYAJ+cg6upBt2eH4CKu24Mdju7QM8D0nVahISeW1mbeNVFJkkDEKbhe4kdc0yxfvE
         dx4LI/semZyShcyWqDyJjhmXZkbn4wwaNqUPCBa7aZlzi5UHqbpQ9Xtp0xuczxHqRhtC
         kabA==
X-Forwarded-Encrypted: i=1; AJvYcCX7A7iNny/FtkaflBfthOeLTB9bfWXNzCHYbU1nYckr1sbNGFhbJBeaI1fiZELyBCe+CHFV0EFVfjgQb5bS7VjM@lists.infradead.org
X-Gm-Message-State: AOJu0YwGRANtqY7DO+32cU8cwmGiL8yCtw4B2kRbO1bMCx8XhB0A0bD7
	aiVy05ZiZ5Uny5mXsTdgLB0Ds/fzAaWVBdoudhN2yLz9x5MVYMhz/FGd9tXyMG3h16cMCvLRJNN
	omUT8JaMR6VCGs2Bg1K0GEPpgqD5FEZ5rYPKTogWJiMzFUOVsz/d1tseCO1sx7pW7bslGKYpPXB
	Sqsg==
X-Gm-Gg: ATEYQzyOEZDbSReTxvIOfqgGgrXv62Jz9IAFbpitDyVBnxdJ85gfhYVrd360WvaQbUR
	MjDy66yWx/xiOQyyRj9qQQS2kF5fjAnUPBNm6qfYUMK0HscWVnIkFiApg0D2/qmuAwD3xVuXYoX
	BCswJ9aSyqjdbj3LvLIzBtfz2KVNx//N0lfFE128CfFScl0CnNMfuBMRqPt2O3dld44ZjzkK5lw
	mMp+fuMlf4nuQSD0iyxWHvnW5sB6EbUtlJG6NG/Ebej2aZoJB49AAAjHLK2u8dfPx61yUC0ohbg
	sq0Ugrs3TPuZTc5n7dgvrg8xrKQMIPH3fusXH7Ogc4KT49HqIhXhtEl4Xx4HXASOwWS7PjWKTMj
	5nbGSStKHxOqqc/OLvU4M062T/c9TOFJIXHbldu8CFQs+NIQt
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr36255581cf.0.1774952459086;
        Tue, 31 Mar 2026 03:20:59 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8b:b0:50d:2828:1a98 with SMTP id d75a77b69052e-50d28283268mr36255321cf.0.1774952458674;
        Tue, 31 Mar 2026 03:20:58 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a648f3dsm25400765e9.0.2026.03.31.03.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:20:57 -0700 (PDT)
Message-ID: <7fece0e7-31b0-4b92-855e-bd9e210cc651@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jvtmlpZNSx5VCoZmqcF2dqCi5-d1BBQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OSBTYWx0ZWRfX33BNIfn0OOrm
 l8udCONykXBRWSrpYSNFDlUiP+Gqgtkx2KC2Q+3vxwyDgO+4zorQCrFbn8O3gs+GlOxAyQ0qUfu
 fWmF02zKZC6A/y0d82tNxtT9EZaAMwc6y7FPZRK4gEt6/I7aAli2claLLg25QhgTdMN6taWB4o6
 4zYRYbHShUz/IUtM3rWmfVlTpA39nrFrJCzPsWZZ2FOxjmwOfTqOYyZh2uBrG0axHSxT2Fs+akB
 T5OEb9Q697w5Guq6QfOIDjt8y4JKPJMOLsozPSAca6xDbgSFfIGxF6LNdD3dOwwXSe0xBAcCvQB
 5wzcr7vhlcOw8z/rJzNT5+nH1/l6qk5u/6oIaySWGs7d12o9TGuqMUjIMupbOLkmLB7cNAlpmWW
 Tai80vWrTXwS323EWUz8v+5VAV0DxfVQRV6nAiKy0SsRXhKkoal942CxVY2nIe9kKPCbTOt2aAL
 UfcMK9Ixkh8nU9i3EPw==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cba00c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jvtmlpZNSx5VCoZmqcF2dqCi5-d1BBQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_032100_878639_70A7F184 
X-CRM114-Status: GOOD (  17.84  )
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

On 31/03/2026 12:13, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.
> 

So to clarify what the code is doing now: I constified the pointed data.
Not the pointer. If you ask me to constify the pointer itself, it's
fine, it will compile/work as well, but do you want it?

It allows only definition with initialization, no further changes later.
All existing drivers would be fine with it, so just confirm that's your
preferred expression.

Best regards,
Krzysztof

