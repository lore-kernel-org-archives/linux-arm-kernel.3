Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BB6D767FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=; b=iwogSppANHpHBg8m+AabqF69re
	sHSUoHd1YAqv+zBj8IrZ8FGhNiNqJ4WkLgY95hmCNTHAZMt9Zlda6O4cyBqnP8jUrl6+OKrKCmjgc
	UdHD+hLesrx6k8emRF7TD+3hW1LmUNIdGMLw6dLAfUVWxrNX0CGNIMPgpykoOeNMqmrPDNK/+Gfie
	bmmYP5PiBoPk34cel8RR6f4NvnQbeuKZiDwYcjmtooqyqcYsPT1HyPYsKsK0/q3rZ8ncc4c3LusIf
	QhDSHr89l7A2ODxIuCp9e+RjKTG/zeUYj/jJG2gSxMhuxw3TgOzE7j0DLOxQgYikTi0G/e+TQNiCF
	aSzZ3dPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa7Y-0000000AKL4-0zPO;
	Fri, 19 Dec 2025 13:02:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWa7V-0000000AKKa-3Hac
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:02:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJC0UoH091969
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=; b=FIvZ7eah4EyNSe0M
	k0GSK5z2lLWta2ZF42Yp+1A42yc6PC2oSiM/4Z2q6NCOwcT2DjwPmht2wszW6NLd
	7QxVx25gTSBOFkZnTmJf0yiOKFXqV8cpHe2pJbx5ACWoBkkHItdpqwSG6E51h4qg
	O0cBE7VnIgDSMCMmuULcrqvBwtBHpqpxLfCscj3yI/6XGa26iIBIssgG+p6wbgTD
	mfoe1fTAjLusa1cZXFa9ZwwiW/Y2E3xbeMol6QTlaa/foqlypubAZKvS1Rq6OR5n
	Iv1mlMC1QfVWH+0e8JCDfR+CeTiO0Lhd9wHh490/MAFYOObSAg6U4P+0eF54s9Ok
	eZQ8Ig==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eaq86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:02:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9414fc8eb29so204637241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 05:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149328; x=1766754128; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=;
        b=Cm11lKpn0OdfB8iuxT1kv6kdDPASUnAJOMk2Jg5P/g9wuhu1b7Abxf4+c/c4IlCqCg
         eKPqoiDeWvuPclXwU7vCrygidGP21COSiqUCCKI7jbHneHOYaohuaew/AhpHY+Wen8zs
         1CDfDEkj+UWYcnvPoV9zH/1s2RhEeDatNxRvsxpgtHHQqBcNOHITQCfmAig+3nEEG+fz
         mGtbYDSix0pUuQfS5Eb//4IUA2oaW/ZdALCtd4zkD9+A++8ZZlbXxZ+Vn+kV0qWWW9kv
         tEIXPTw5UOdN3dDEziHnh2+OrE4So5XTQqlejmvFMRuysis1r/FU95Xc6XvXugf5+eLV
         xcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149328; x=1766754128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZXL63hhjyW+1jMgBiewMjiLdhPV4CzHI9+MzSuzuiY=;
        b=WgTH+Dp3qOvj63KPghKFkYRfBqIsw1NwnyHbpKyVy7Q3N/qXRNQpZed3DhFxgbqgi2
         +rTuJq8W1vN/SlqIq8MivUfyRAXAYJbdRqvulGguPk6X7B7IQX6/RjX80Fqs5AUp2ghn
         M8U6qZ4FBXxgJUiJe5AfrC55IIoyHz8TwGnUa5ZXThlWsaN8xE2upaD4p4LltDY/mPHa
         +tAtMo4vnR6m7rqSRTSX3eKgNDfCHWwHprLz4XEJVJU4rWeiPOPvfts2MduDsufA2WA5
         w/FtAvGTJqbm3P0pT2vMvcrNZYHCbPSyq6iX8g0VBfkVgX80HOEEZF5eePGF7biPfjhN
         WF5g==
X-Forwarded-Encrypted: i=1; AJvYcCWFEYVD/9oIfkhduAxgGsczs8E75PTlyrZDkK/NxNJNWiJXMVs8PslShPZHfjlB6B3DYHYEC9YTpg3KpI95GzLr@lists.infradead.org
X-Gm-Message-State: AOJu0YwsUWFmqrma7Ed0KqlbA3k0Qkyo2jAMuHYSvBa/OQq5Ko1w2O1v
	iA+Jo/GiwwjF3fDzrwblewGYJI12PEwo6nONBj167RL1MWLpaHjbvwdyT95LB+WtaxGX6CazXZU
	T2KrST8aroX3y3GV09hIPnd2KuEF8wnPFxVMg4HZ9t8X40JRYLPx7rnYnLPfsgfncr6fjbbXttv
	q66A==
X-Gm-Gg: AY/fxX7JBNbjILsMAxsW+Ix063AUzyRVoofNMB/t5KMkikGqwmgdRWC+dTXkixLE3Gg
	fJ8wZiuOwyH+sEaehAntd87X7HMOBZtPKLR8ZHXUGFxNtUXlSGudTjwXTnOr/7IcmfMd4SgwHC+
	hymjTm8SgfCYm5PYbbrSlWfsfQdvbGXjgUwnr3Rmq9vdEunlzjP/UEqO+Qca2BrQsBIyYEulccK
	haJ1XxaF2KxHftSOFSUEZ5LQAL1mrqNNVcs6PVeHDgnNoqaGdhB8TzkvPX3C90sUINBN81RRwSO
	dSTrMRiS9yZj9/18qKLFqM3jd5xQnOgFFMSgTmxphSXzK7saXt6FduI9zadhBVwlVv/PdjBg9tO
	0iPa47cf34phMDcy5PPO7kVyK3jWYi+/qlYEmJda+PC3UAXWXghheKqOW+8IMbfgH5w==
X-Received: by 2002:a05:6122:104c:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5615bc2dae2mr435801e0c.0.1766149327872;
        Fri, 19 Dec 2025 05:02:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXeDGSy1uF22rzogOY11+L7dou3cJ6USkw1y5Af2xvx2Z79MJW104nHs4Qxm7QUPKa2C4w3w==
X-Received: by 2002:a05:6122:104c:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-5615bc2dae2mr435755e0c.0.1766149327079;
        Fri, 19 Dec 2025 05:02:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm2136497a12.28.2025.12.19.05.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:02:05 -0800 (PST)
Message-ID: <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX9OD4FyU3ugGg
 Up1ERAWhKvIBm1ClwGXtuTf96njw+R/kKYP3JkB6BmS8YlCGGibXyaPx4coMLdE4/IUFNsx7xQ2
 GkIrjoWVOPud7Cq6qLmcJ9EQeXyUZYqlbD6DRtfNCnW2sogDgTM/H5BiL3xyAQASNj3q+AYt/hD
 c4xMgob9azChLwgeSZAiR3EAiQlu1JzmpnVFsyH86xZXMiKK1IxdpxbCAQf7L5bCMmrP7PDFbq/
 eSPaSevWEgoQFjT153RMH19guRP5cOFf4YGQsqpzadeWKW/Yfl8zUKdrV1RWWZU80PLeDxYbbr+
 P0oOWOPPc65MdYrzXthAxUjyD8mhuuKuiTmyVttlpMCg+Wd/6PCYLz7mS5smHAwD5UBTXR9w+YT
 tfi0yBft8URIW5bDuDADCGN7hqhwvMJE2tNiFVN3/ln3hNChNjsU7LaHCQLwgfCeiV3Bgwh2UlV
 bpXKwhqB00hx4en0Q9A==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69454cd0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bZysObWQuULb7_ZgAGEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 7T3l4IM-yZ_iQqC9oOiKlZ0vcx5lvPaN
X-Proofpoint-GUID: 7T3l4IM-yZ_iQqC9oOiKlZ0vcx5lvPaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_050209_946120_3F722864 
X-CRM114-Status: GOOD (  15.65  )
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

On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:21, Konrad Dybcio wrote:
>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>
>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>
>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>> matter for choices made in bindings.
>>>>>
>>>>
>>>> As it is still a clock controller from hardware design and in SW I will
>>>> be map the entire hardware region and this way this clock controller
>>>> will also be aligned to the existing clock controllers and keep the
>>>> #power-domain-cells = <1> as other CCs.
>>>
>>> I don't see how this resolves my comment.
>>
>> Spanning the entire 0x6000-long block will remove your worry about this
>> description only being 2-register-wide
> 
> But that was not the comment here. Taniya replied under comment about
> cells. We are not discussing here some other things...

Right, you omitted the part where I answered your comment from the
context, so I'll re-add it:

"""
This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?
"""

TLDR: cells=1 makes sense as per usual

Konrad

