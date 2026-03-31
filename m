Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3D91061B21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=; b=iN/G30UQZeWbqvd14Jlqok4xL0
	DS07MkcbkvXEa3aJKZDSrPpdDsBTnxpBfphpPyfMUtPpzpFuOeRGv3lhsuofWHam0ssLVIfZY/J3Y
	YxEZ8C6wy59C1zXIjohQUcEjk0Po/+znStnE7mTaviGCjySmwQcSrVeLXYR8b0qP6Nkh5SVYXPYvD
	xbFqJxqbOEVWDlrWyMxkLdi4V6f2N2mdCmQrP8B3ZXEsm0hC1SIL6x+hWdWrQ3hO0La0VaObVWBne
	ieqvK0k/+He6lMBaLY7+mPiKd6lsu15LWqVT3bkWQSOupUunh0cPTRvipVDMfZf5AGPzqAoHV68DB
	tcd8Avvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W68-0000000CkmV-3aak;
	Tue, 31 Mar 2026 10:13:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W5y-0000000Ckkd-1QD5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:13:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jrv82049358
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=; b=d5k+RIvtCbkMAd99
	ztZGN/zNYQrsTobAB1MdAWfas7w9n7w42QWCFCUtVvknWMNocNG5G0b05+n/f8m7
	6fEe6cNyrgDQjeLjZpGJB6dpHW/M+8mBfu/tOd8rSVaVsuyL7SaChveGF3QB0ZNN
	ziWFpkHUlb/GTHtajCl3Sw2N38TLLp/jyT5aeufl/bC3wtv/4d4gM5uJNtjKssTO
	BhZIfWuX+pXVQIrAFtKCF/ynSCGOJK/pQlbsanQfMK5vhQBjhyMG6diw5TBHXSdL
	63JAhKeV3DZMsGmQzSxHxeRNYceGirNiwd+6zpFIUCD1es6lajyXaoF2PtJRoIeH
	5x4BNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yrbvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:13:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso32760651cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951993; x=1775556793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=;
        b=MibEvHZZunCRgb/j7dlKT87HIHwUiilCFfvhKokhhFK8vBuEycKEuqye/LDHl3mBdh
         dGV6+HsUi2T/jWMqA0bnHRNKuXdD1lOH33yV/bsmzDBtgjkLs9Bm6bEuKZdlwBi/IzQl
         q8Svo5sUwI9EFlYxmYpThL0YU445iukNm45270QsjS2a8jtnsAKTPSGbVdRmmMIPJEWE
         uCCZ46CuI0ajvLwF3ywijVnPJaMCL4r93w2IJirKo8JKeGx4YpmFhRfb/VM0asqBwpiN
         dR0t+qU2FvmzRxkZyUTUVXRzrf9g0MCGWiGXl69Qo2v/9T/5oVACY0RdIuvR7sHwOolx
         TTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951993; x=1775556793;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=;
        b=LDIcRIbLmfrdvHhjXwXq+zjTXewZZVaf9MHeNCaD68s5pFA3K7jIUm0dR8J6qz5OnX
         0MUsEQbNZP1j0hC/3EkORU7Wct8zgwqbhzEIyR2veUjp+7myoGp8C8mNdrudWyqOoHGY
         yr9Zup7VUSwh0R+aeen08BjYP1bN5A1Cjvwz2SIaQrqayA64jDQDPaxSMK9cuquaEPql
         nwxy8ZQdmOtExKn17V768NV9bKdkhoXViSmmngmYo6PJZc4dLLTRzgN9H1tghpGmro6F
         PN4BfqCWnZcoMNdbwjs4NqtiCKWBcU2QTsiI5SJpZhI8kIwIE2qsuRQ1wfE+iuLk/i24
         61/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpVpE2+u53cXMNekgYdPaQC/vfSL+t7MilmmAEoYhGP7D7HUeGOSTQV7RGBE3lqvLGfHI2BymPpTmHenJPNTHG@lists.infradead.org
X-Gm-Message-State: AOJu0YzM14Wysjo8O4HcOIG3r0alFbMKs2e7hNbzDptI39ODCUeOOMW5
	p8m1RBYGzPpuESCIP9sZyYzXJlQ24xwuCRJHC+S+pJ8ar7NNafg+kek9KhiJzzZG8rvAuqsWaJV
	u0z9DYMwOoD0eha5+DjNZMiWZEv88C2wXR5nYwbwFKR7oEQ/29shoSFVy3dUTJXUBJrPjSunBAb
	laMA==
X-Gm-Gg: ATEYQzwI09i/437zHTbTky3fLTOBO4S6TKZGFGfx8tFkj2cWLIk2olbWe4QoNbtW39l
	P+Rz8zVt/6klF5KZRDjCC/fmPRNVPyExX2P1grJuhC0dUHNuWv7oYO2lviJjSXd/J4tAi4CR3gG
	C7Mx3aFDrb/YOy0cD4jy9fhLo2Pgwr0pJ1vbSV6n6j5n8p0ubKz4bVGN4AmuZIfUtB8EgjzV58j
	G4LhnXkxLB3ZMVs53Ki1FE529RtxfjmVS1hRFMRthNy8ykSw1/WdHAYz0BKhOtxigzvX6GTAWaq
	Md+kwr0GAUa2wewFjHvCsk9q2rOgg1nqT0Aqoqkq+x4YTxsJWWNtdvdjFUTqzQ80NVN7x96OdWp
	AEpS2sE12TuQjubXVVUuPtIH3l9mwo2fxuqnpU5X6ZlFUE8Dz
X-Received: by 2002:a05:622a:283:b0:509:1244:b83a with SMTP id d75a77b69052e-50ba37f623emr195160041cf.24.1774951992683;
        Tue, 31 Mar 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:509:1244:b83a with SMTP id d75a77b69052e-50ba37f623emr195159851cf.24.1774951992280;
        Tue, 31 Mar 2026 03:13:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm22769205e9.11.2026.03.31.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:13:11 -0700 (PDT)
Message-ID: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HgQYYWf6F3NGJodFSWiz2G7tV4VOa9AT
X-Proofpoint-ORIG-GUID: HgQYYWf6F3NGJodFSWiz2G7tV4VOa9AT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfX2hXqbswyh+10
 FOGS8nBRaUUuDWyQnL9KPQwcqsbKk0Bk81CZK6ime2KOeI6UviwDnhyCQrQbgm8ZwCqxGyLYX9o
 ECwWqCOZV2HD2cS78z0fsf6Tt7aj/LWfch2rfZKgHe1aqqWhBxU+iRUiMNinPrVllOP6/NNJrej
 RCYshMIHnjyk4cqspFyf+fgs+L4/FhwLRFXCYFcPxD1vqG8Dr6SHQejsPhIPB/tKfV3Ix76Wc1G
 0wDDOo7/6c8byHWTX4I/xmzKAWqJ/lD79Nuw7uz0Zit24JyfbUugIUP/q8IFvOg4puyEAWr6fS+
 kZAkkQC/VfQvx0PLR77lwl4xcwwamB31Gc4odhdI2bCW36rXG0Vg+PTsFISnI4LRNMujXbDptXl
 ltC09TvviaDoe718ynXlFbyrJeY3LSPdeNbxvoFK2eeV24vAlffpG9H15vi5KW3Dunw1ldCKr7x
 zni3FVPgOF44rFSPlzA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cb9e39 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=B9NW21ypFFtUVvRuEjQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031315_012777_A1502F11 
X-CRM114-Status: GOOD (  16.40  )
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

On 31/03/2026 12:10, Konrad Dybcio wrote:
> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>> and is not modified: neither by the driver defining it nor by common.c
>>>> code using it.
>>>>
>>>> Make it const for code safety and code readability.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> --- a/drivers/clk/qcom/common.h
>>>> +++ b/drivers/clk/qcom/common.h
>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>  	size_t num_icc_hws;
>>>>  	unsigned int icc_first_node_id;
>>>>  	bool use_rpm;
>>>> -	struct qcom_cc_driver_data *driver_data;
>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>
>>> This can be a const ptr to const data, even
>>
>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>> they also could. If doing this change, let's make it consistent - so
>> shall all of them be const?
> 
> I thought about it, but then it turns out that videocc-sm8550.c has:
> 
> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
> 
> So we'd have to duplicate the entire struct

No, that's not a problem. Pointer is not modified and we speak here
about const pointer.

Best regards,
Krzysztof

