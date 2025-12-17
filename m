Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7BDD65559
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=; b=ozh2kdlOfBXxI19bZ7Qrt4i8wc
	9nx2x4T2WvUos1pOuvWbKZX9ibacu7m5g6jr/HSpstVMbPRx9Pbx+4zVwB9VFOnqm7+PN3Kqgg7ON
	xxIzgECbgRh6DUM9lz1e/ehve3lGKWgFB/1XXY3mun8gC48Q7UOwCGZCceNuoKqqu8djw+eU43uBh
	KZTehee3jmSgrNNf77qjeL2mSNR+5yNg25RxD28Ukt1sfMtc0hkj6aWJmDFfjxEXEGgLeDjUSwF7E
	WUqaDB4n/a456VDkTufkuMV1LDztG8nSmBA/ApjFbPMZteX1+UKPKNl/jbRTXlgINXaNNatUh7u5p
	EHbwybiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrSr-00000006qS4-0gVo;
	Wed, 17 Dec 2025 13:21:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrSn-00000006qRa-3bBQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:21:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKxuY2042760
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=; b=hCIYQNOESCXFCU6p
	YKEuFyRLxurXofKMTnPM6vkrbSDP2L3maLCCXacWh8c1Fp+lv6QLnho7LJI4kLtA
	TCRYYz6KahCduqLm91Q6aREt2D6HZPsl6L48A0exhuX/zheING3fQuxrFaCsdu2f
	2IKc7PE3sNcDETH0g4EwJ/jRMStJGKPfiKWYK5MTq+s2ECFmlVXG6w7fKPWd29X1
	3bnbrL+N0Yy9qxZKZTkNM1Y9OrxhU5KpOtawmTJZHSZ4P2YiahJnWHgpnOMK/xKR
	BD6KYtzZhmAdLiAaywOEIS37pOxhmM6b4fp8fPRYikTo6Mlji7K8m+dES/le2eDh
	51rEbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1tgt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 13:21:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f34b9ab702so3066001cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765977668; x=1766582468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
        b=Wu5JLz9KdjhOvIoD/chJrclcxnlEQ5MAO9kw21cmW7yWvt9Slo9AMlpFxkmV5e5XYp
         l2QA4FDD8R9ZSxHpwEq/v5XTxUTzZbGEDGN2XJ4oS41tQHqYgi8vJogxXv3kE07HAYD2
         3qw5VKqEM+F6BZ1J/hzktdmvswd1XZywB//3gpaxx+5VxOeaCzQMGqeQQAijKOpMluRP
         MIjiudUlko8WPQUHV60jSVcBxh+VSCvngpDwG5IU0+G9uNgq4o8CydoyhMpInlrDmMsM
         rIKr9Mci94HdYU357wJHFk9i57Znj3NKfqhm5IWp1dDy10BRDakMrJVKKlTCoAsa4VWf
         Nkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977668; x=1766582468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCgdcjNrFq+Gv500NOkHLy1Wj5bbep0Yb+KxC2CLZCI=;
        b=vTsg1ssbV1UKcKvHq7LGzolJ1B7ymhqwpnMhRb7Jm5SeWS+NJXfb9mWLoqYCqLBRVs
         TNRXlxMn17tK0I9PiSE5N9Id67Uv65VM8xhbwXwhcYQq925FqIyGB6I4xOiyditO4wCE
         QdwhcxdlxbWXCUGbkJA069K7xQ6B7iQGLk1yemkTFknsppQmp5zKtxjQKj+AAqykDt6f
         5DJDBSdg8cYveRtnOCuh/hhK5V9LuF5FSAqN54sIvWV7e2ZLzoKpPUJxX8RB5qERfSs4
         488ywAQNZ6zIVEztrwRCeaB0+QajZDgEj/c9hSkshxq3VGAsMNM9O0MfHKWJLDykZRVp
         AoHg==
X-Forwarded-Encrypted: i=1; AJvYcCULb3YeXfPn0REGHUXJq0K5aLOdfksefofu+qxtc+i4AqkCPy6i7sXyCyriwytR3nTsXlvd9svdbx7+ueuDiNy2@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAUhkRmmenHvRqlSv4RocH3+88PSAtA1th6OjzgbY0qpeVGcE
	hHwodtXb4ql+U3WqJTiUzxkhdAPOBRvES0y0lyh1R7oIhA2DkTfxKyBu362fEro30/HKPuDafnl
	/G60yVLs2tpTKQpTIncDetJfaOSb6whhij+g6JSMpf/rS1m/I8ls21kSn1z3o12Dd9z4SZW95Qj
	GrPQ==
X-Gm-Gg: AY/fxX5W8/x2KNvhMKJan4fknLM6inVZRpTWK6i6DVyFac/bOPF8rAmxLVssXsyGt2V
	Q1X96+frCeU4R5/5uov3Ukc2DaeOre2oUmw9eMA5t13vsfM8tRyh09q6wAxuZdaUBArG5nQtRc2
	RcSfbDQRJajLSJn3FsZRj7oFxctC03c8BSDEafXWLa4svePbJsKI9IjiEx4cY41u0AAwlfDaZd1
	kx9xbjxvukKspli2jpTDzFvsxU2Q7ad+QeDyoGHgyUQg2qv8iFf+lYu9BcHdWPpGMdtQr69q+Vr
	qCa7Nas00m3ILYC7kX6MCZqnCp6Ku3LG0pulGVeaw/I8wBB1mWc3F+5kaniWN4yppLOydsssnlN
	iSzRdUvLpMhjp5i4x1cUNcpaqHrGuMUqA7NrDXwIK/WSFG3EEBuxQd1/BCCczBJEdZA==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f1d04b1b70mr183152771cf.1.1765977667831;
        Wed, 17 Dec 2025 05:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsGyEI9MqyBXHu9MJGYHVWFgi9POwUHY6EBl4git78m54J9h05gobTJiMeDB2CkmGRH8oTkQ==
X-Received: by 2002:a05:622a:1191:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f1d04b1b70mr183152181cf.1.1765977667204;
        Wed, 17 Dec 2025 05:21:07 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b20sm1997438666b.64.2025.12.17.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:21:06 -0800 (PST)
Message-ID: <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:21:03 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfXz6oSiO9ulHTA
 MFrRLEXM/xPUdKXf5kCACDUl0fl9PTwmwroHqrxH65F7Yq4VN0LvPgm/hIQdHtNPrh3sYvNOyWK
 sFy5Pd2FeV4YXr57L9lbScoMSjBmcx8BYSX+/icKrkYwm7NXu9eIEqzsa9WsVb0HlhE3+Haccu/
 qvgMmP4uX+v9HQLT34utt8nymmSJrltGZmXSIDvu65408BTXqx1qpkH3K+d+r9VkVQXpI/XfhmP
 w3rq8+M1tQHLFh1TIgDFewtCP/isVfcVT/XxlsqJr7s777E1kqmh2kCrJiYp16LA2FvD950LWoB
 rj4kCw51mWM/ak5O2hWAfVMlHqcO3fdezlB+HavzWhKv370sH4QmAH7MM3h5JvtjMtGNUxytoFp
 9Dyhx84TUpolPIOA+pYUBkW9Yg6dvA==
X-Proofpoint-ORIG-GUID: vMoX9DUYRIYREwQKNhI6NWxK0jbxzPGe
X-Proofpoint-GUID: vMoX9DUYRIYREwQKNhI6NWxK0jbxzPGe
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942ae44 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=37dNUGJFtcrBIb5saPwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_052109_911968_E3C0A17D 
X-CRM114-Status: GOOD (  13.92  )
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

On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
> On 17/12/2025 10:32, Taniya Das wrote:
>>>>
>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>
>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>> matter for choices made in bindings.
>>>
>>
>> As it is still a clock controller from hardware design and in SW I will
>> be map the entire hardware region and this way this clock controller
>> will also be aligned to the existing clock controllers and keep the
>> #power-domain-cells = <1> as other CCs.
> 
> I don't see how this resolves my comment.

Spanning the entire 0x6000-long block will remove your worry about this
description only being 2-register-wide

This block provides more than one GDSC - although again, not all of them
need/should be accessed by Linux. I suppose just enumerating the "extra"
ones in bindings will be a good enough compromise?

Konrad

