Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE1E6F082
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=; b=OsombbFSFBQlXkpyVwIf6Y4Wa2
	0ENt+batIIbqQuFeIX96Iwh/WNcCCNxdmIAe/hR2TBnht7Vqlz6A6rt3mTFVCaqwakdkvVhKvlGCV
	bHO09ZjilEHWlFLAk0GSV7mLjmWlUfj080k+bGLAqvNVVTAsm2hXL8Jsf+SrXz4P6+dEntn8Bl9ZV
	aSuljg83uHRvRuA67N3EsZ1iOraFlWZRNi2vRqjJm1AEWSso7WOg2tsjef2NwwSHnjoBuwwB4DHo9
	W81IFS0jZlBtquzwtxM+G0GXFEtMDPYjA8WyITJTomw98I0SWsrLMTjApTOhJdRoi6ecL9y+UuRwK
	M/JAHT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzxO-0000000EuOw-0hd2;
	Tue, 23 Dec 2025 10:49:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzxL-0000000EuOO-3iTl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:49:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAnAFJ1528815
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=; b=nKpwwWsYXt9o+EmG
	IA7MJ8Gd3B6ajW3VYsftGPmO+nYO+QEtc5iiIBa/65Yyfo51sUgG8viJCfcAKYo1
	GR2hFoJDaiw6+fYKs8qQJdoL/O6cmZE4k5pe4+kEsTLzEqQtgfQj+Ssylr6lyiaJ
	fW59z1Ivfe36POumGEA1kBg4vyeijX7JkFD67/I3C1f/HIUflCVF8SdHpusWVmki
	stQy9gIJ502yrmD24K4NoLh+zUQ1u0c4w6VyjO7BURtGu/gr1SudaL4TtUyQ7C9r
	Si9gn58U1vlPwaPNCRuzlbN3fbG0FJDOBXQX0e9NX8i58Jt0Yj/ylDwqKuDLOoPW
	Rbp7lw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3mkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:49:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso4758101b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766486969; x=1767091769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
        b=YpsqHkoFNqjLmsfCG7+KmugMRPKsDAMSQJd9OX2pW/o9WAMLW8hPRIDWT5PbyF6+YA
         rDVoGNQgFmF6cpBJU+cIHwLJWsBCVfmX88GD2Ue0dXE1B5fR8I8TMtZF1CgCHkLTuy/g
         tNjWT5ne0WQ39/zcM8uDmsH/rNk5HBpgdBPj4AkJwOVPZ40qrLyEPFZnur0TE3NkguHO
         8o3uQDGsFWh743on/OUr0uxJDRNGZxAR6K7uXucsa6OE7noAaGO1fUlMFZoAsOICL9x2
         v+Yy1wE0UtvGy/paLDFqpCskjMjLKequitwSNl155dqwzmtFXokuFo8nGxBO/X6zD13A
         M+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486969; x=1767091769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKBwHCYSbYIWW3G7Sc1xuSQXA6rM0/QQy4Vu6KzBCFU=;
        b=pIXAEWjf0hX1R6HsD2tMfcVIeaNR3hjyfbb2U22h+e6VGxmP+SIN1Ia1j7JKWBrbuO
         aKyW66vpI3Bes/7v9jV2aqAzbtZ5SNuarCKw2rnOb7xDf+nC8WrNVQx9YRQJUtHyB0r9
         XPr7W8tBHxZxOWmuqiLhj7VpABU1cFIA6s/Dwvk1pbD0+NTYJ9TJ1vA5OdhLLFgfs9kr
         2qfLnf7F8+ZKbA1M50fGzRpzcH2EfuozSOAYDzHGOFkIjvy97bSNgncBFf7fjICW2PrQ
         nSTa0XpPHCKp9O//NGAtKoHYmIBcAyO7OHjRUcO2UcJvvwr7ARS0yj86KKqELRYA77VX
         Q3aw==
X-Forwarded-Encrypted: i=1; AJvYcCWEgy89FRWJzsHdAb2lJq2nw7NX2pZJkZy5PhqXtvgYP0zQKtbAsBM86Ehl9y5s0BhtJFv71GpFuozQgnuppzEF@lists.infradead.org
X-Gm-Message-State: AOJu0YwN8YFMe5Jx+2li/UXZ1RpTgsdpcGkVMf3KJfir9OU5rluC7N0M
	21YrUOFwjqQ2zKNARh+fj+IyESjDrAWS1USn7rJuqMnxqmze9Rd1NYUh/Wf2IjAwoMzjZ4tjMtV
	RKTO+AQcl0lE1r1xIyY/QGPOhJrerT0GXA/tBWudto6o+VK5Jdde9WlyC2LFWg2KnLsQr7xUpl2
	ygnw==
X-Gm-Gg: AY/fxX7G0YTjuVQC4x34mJqwRwBkN3w56dflrUQ8oOVxT+TacbBBOPOd4ZKcHbEU6T7
	gR/Z/PWzbJs9glHo91zBDKxBpopPeyb/q9m59wL7pM+EGmOR82GMOYB9Q2Avgzb3TL4I8sfrdSJ
	l8IxdFCgbdUttoQ5duFGQILHPUIiekoNGW/hOOR75kLLe4SIHrtlyTBdK0teQrWnLrBfqT6KxOI
	TADsxDkRziUWdaLMXZJClbXKyiRK4SRcbM4vOinJBAE4DOJn7hVq2Oh504Cj8TVVr5NGg03urim
	kkNsgKdeDCEbGeTP4gIEYJyuMvY8FRP2qRszXvitTDCU8u3gS1tDVGSakO+8ZB99CELip229AV5
	0B4AURyAgLiw6JlbixS495MiCDxYWS61DR5CH2Q==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-7fe0c0fbefbmr11463440b3a.11.1766486969223;
        Tue, 23 Dec 2025 02:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1v/1HacvwG7DWXzwiLrvcU2Zusz8BK/bUppipGd3g3H//7IAWFp+IVDMaldG9feohRs6Z6A==
X-Received: by 2002:a05:6a00:6b93:20b0:7b8:acdd:23c3 with SMTP id d2e1a72fcca58-7fe0c0fbefbmr11463420b3a.11.1766486968718;
        Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm13327808b3a.64.2025.12.23.02.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:49:28 -0800 (PST)
Message-ID: <a63f2bc7-11af-46d1-a950-60a25ef79bb0@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:19:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <701a7b2f-848a-4cc0-8924-ec72155d93a7@oss.qualcomm.com>
 <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <65e5459b-7509-47db-9089-6efecead3f44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a73ba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PurT2Iiaq-uxMnD6zWEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: cmCuJaQLBIFCHSQPgh2_YxGMhZuZyclc
X-Proofpoint-GUID: cmCuJaQLBIFCHSQPgh2_YxGMhZuZyclc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfX+uqpn1/BH95F
 yyF/J+Vx8A7OOppvnPToiape9Ou/8unuvZ2xpaRwUe6m44p9ahleC73BNkrCAIh1xVRTZs1bqw2
 Iqt8gojNC2E2LzxJ9PQ0Zq7QvVais11RZfnkhENdmPLQy44p3+bzFhUCUbcTT29oJjFKsOoDfki
 EncRbHP2bKoyW1ZgAn/ELYXidXF2HjMhFCOw002iz4z/cJjDgVx9qFqrQTWNzQ2Mm44teAMNPa5
 sBNShRp3G9+y12lHl8deeBtJD62LnASDVe45YY3Zb7nIRjnQwYVhD2/XUAC83AD8aHN9bV99NnV
 jVetqeceMr/Vu/bUclXKQrupKNWgR0gnCbxwKjHxTf2rj40/YvD038Q7NTkuKVDlndfkevajT1b
 Bug2LEbXcb8Co1xCRQ2PhEdQqeutWhBtJ1mIiz/xb1GgEYP0XXQRB2b4C5yt2cqXrUgQ2V0k9zb
 p+bVLXW+luS/3bCdzhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_024931_939590_FFF6E6AB 
X-CRM114-Status: GOOD (  16.38  )
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



On 12/19/2025 8:15 PM, Krzysztof Kozlowski wrote:
> On 19/12/2025 14:02, Konrad Dybcio wrote:
>> On 12/17/25 2:54 PM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 14:21, Konrad Dybcio wrote:
>>>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>>>
>>>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>>>
>>>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>>>> matter for choices made in bindings.
>>>>>>>
>>>>>>
>>>>>> As it is still a clock controller from hardware design and in SW I will
>>>>>> be map the entire hardware region and this way this clock controller
>>>>>> will also be aligned to the existing clock controllers and keep the
>>>>>> #power-domain-cells = <1> as other CCs.
>>>>>
>>>>> I don't see how this resolves my comment.
>>>>
>>>> Spanning the entire 0x6000-long block will remove your worry about this
>>>> description only being 2-register-wide
>>>
>>> But that was not the comment here. Taniya replied under comment about
>>> cells. We are not discussing here some other things...
>>
>> Right, you omitted the part where I answered your comment from the
>> context, so I'll re-add it:
>>
>> """
>> This block provides more than one GDSC - although again, not all of them
>> need/should be accessed by Linux. I suppose just enumerating the "extra"
>> ones in bindings will be a good enough compromise?
>> """
>>
>> TLDR: cells=1 makes sense as per usual
> 
> Either list them in headers or at least explain that in the binding.

I will take care to list them and explain them as well.


-- 
Thanks,
Taniya Das


