Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B88CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=; b=oY/CJRHJgFuCjGYLEJNveKXa9y
	JqOQI+XNjU01C1QClJc4UqG+n4kNihm8LIivTBM1q06qXATbvroNJSy8i/lAd9/UumMz5v49aucWm
	CKk3XnVAjdLjstjnqusxsDCm8m5rn6BAauQ9wE1U01oIHTM9Etprf6R5dDX4ip3OJo45cft2XrhuV
	59RYi9OF49oR9IqdoVv4fwDAxOj0v9ikWHoUq14Zb5geluREg4KmmlP7imQ7H1vPA5tcftd3GzY3D
	vkPmXNhRb6wTg0TLUCEhVu3arN25x44YCWcQnlhxN7jKO1p5uU+Ti25XYO5RlirHpm28rW0hYZSkA
	0VmzDWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq7V-00000001oxs-3Av8;
	Tue, 26 May 2026 11:38:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq7S-00000001owZ-3Wei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:38:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8BZGM3603990
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=; b=ottv7G/kaQYn5ADV
	+FQYimnhRSKOYIkxzJOVcCAzUycn1xlCnMgNvLj5KiZDfi+KqDyBCne6aNMf1HIx
	LYxoIpoWhsKWMoWvmh2J5Varb+0x2Uj5ncLlEaHn3vs3xXM/Uiib4uUdDgDWERwe
	qIM4WwqlxuGuTA1g+8HYE401aYWpb08/ivr2VXPwTEcgfKJoDO/mS8ffpTTcP81G
	8Nn5zl1p5tJuLwJ1dUYhLxeJ11CIh/LvoAa34tvuCUZyxhW1M9FYCZwsCAwb57QY
	aSDenf09drCCITyvSMlAJFN/1BiU03PFuy/5U772//2e6XkfpIzRai/q5j/55sCN
	IVbxhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqkv91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:38:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba6fe41283so112853725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779795526; x=1780400326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
        b=jTVt43pT0oghCjZ2tt2SKYezTQRXSYmb9/mzMBqAESXpX7IgdBJWQA53tpioxro5P+
         iOTfmXWEMGatwYM9FyOvhrf1Drhc5Bo+ploTfcHPr4DOtZSHeBAI1KPE90iS4TA5LA0T
         xb5vxjuLhzWE43XryjgTSBLgc2EcywSMbAwSIAtCTwQaCT+EIfdeoEin40s5BoSWUg/x
         I0Ee9IgFW5RFPpkSO4IPBjmQkElszMgOWTtM4M04Z/QCGkJOKh6BBJsuOb5oZNtGZ4pe
         1E5F9H4J5xueMtVKnv3GYfk6Bpeawdxrq434RIBYVywwGX9c5MQeqAETGg0+1uKpz/S2
         f0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795526; x=1780400326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TCr0Fc2ZSclrogE5U5UpT35PvH58phtaOZheUxp7cg=;
        b=e/48efkS6gFklmcorc9ectQEk3SZcQJv1vLkIE8yRYDR53SGPC8nsx9kYGe84q27ap
         SLmK6FzZgYhViXgl6hp6iPef8YFdP89nv7ymIlUdCLEL5EDZjVaL3xZaU5s/x5KQMdV/
         eU1L0XLmsYjCzHDANVn0fn7StEee4XEMvDuGZpQO45RrbxvIsHH453l49ELeHgl27GR0
         FFKlD1tj6jyeWysW0Z8rAcDxJsQwwbvMX2hy8CaoTv3Ggr6qBNkf/prWumyZbndhK00i
         oBkZ4FULwQ9pr21cEfaWjnTGfoA/AceMXLu8GrFWr8pdbQofi1Ydk+ucvDqHLoW6YD2J
         B7hg==
X-Forwarded-Encrypted: i=1; AFNElJ/ndLtcosfZF/mjFIbn+OzTjG+rNRZwv0YMC+xbPsCS9rn6t0EFnz3LJ5800ZkRET46GUi+ycO7S6FuyWc42wDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YypIeYZVoZ0EqTuRBGkzHVn1YaTAZ8rfgS8CQbPwhDtEHnDoGDI
	9VG+zDLHEOw1iw5cyMtnlst7LX9DBA3Mg4zfvGo8Ou/xF5rTk8rBu5YsZMqGFxx3ZaPMTRiKhLo
	a8IyZrMCnLtvFwOeIm/KIyEZptASwP8r7Afvk+ArtdQJ/BxiCtOsOiuxUlQpJUCR2HKc5wHrhB3
	UxEw==
X-Gm-Gg: Acq92OEHOIavwI0WTHEKU5/sIivYHWA6smlo0RTToavuTJwSXIkyD3xBthzD2gzirST
	BP96KLvaCgg3D5aFwA+gKEno+LhPE3H4eRxAPTNbAX+lXdDinfl12Gdqm9sQ+67ACp9LWNtcxFC
	Y9mrOv/cgBgNRr/ywrN3nRn+T1Up3+P+4fBlSQbQmTlDnvw8tPyFyXJg7QqfeouaMqA5q95l3xI
	OhEUzxPKOrpsaJgl3mR1D2IX9QxANjzeFkbpaAbeidOODoLfxRwwcjzraSZ8I9kvhM9EtrdrW1i
	um9ryjh0Qd3awDaMX1trzeVhr5Fd09Mi07nHV1146BamofJpZ2DMm0yrcmY8j9cjDt8i0kUcOyF
	xygPLXI5G4RbtUnJr6JRCQ1wkIgGzTQPg+0sEZ8hSdB3FfXnkhZ0uNNmkiAc=
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b328cb6faamr18622513637.17.1779795525616;
        Tue, 26 May 2026 04:38:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3b328cb6faamr18622473637.17.1779795525054;
        Tue, 26 May 2026 04:38:45 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164af10b5sm11685360b3a.15.2026.05.26.04.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:38:44 -0700 (PDT)
Message-ID: <bbc27f64-cf24-48f6-a577-5c1cf46d8117@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:08:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
 <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260526-muscular-skylark-of-wholeness-6ef2a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a158646 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9AdMxfjQAAAA:20 a=JnjiVvBC-mdIheWOmMIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: lQzRgVuqV2fgwHEtGQ0WX5JIjdSCN-9a
X-Proofpoint-ORIG-GUID: lQzRgVuqV2fgwHEtGQ0WX5JIjdSCN-9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEwMSBTYWx0ZWRfX7kCGNn5GXPJ0
 2vAmiN/mg5i++hHs2mGZvmXOvIToLARyh1K7YwKCdVZ7/zsVA5xD0zM3JxbGJ7kJnkrZaDj4C28
 L+UdaUquRnbZzILY8SpZiMYNSebFHk5TdQ6M3HwuFbMISILpaN3rvk9pFHxDoRIeBOhm3LdzF9/
 n0hBYHezcr+OuLEG4XqTnjWzo30UOLZvloHWfkm9p4dH++KrqS0M4kDuM4s8XhEiFuYrT/aAS7b
 KN+UL2J0ssrS8pOKEAfE8yVC6o0CfhOuBdVtYuEkIWCE8eIHQ2uKLg88RJ+yBgkVCzhkD6DLo9Y
 Q0qz/yS6AtTuM83eOf8RUe7DMtJc4laPMPcMjdcoenQ0ErEzNKyJY9U2KYhD/vEZ6iwde6sQHMD
 G4iHHuDSYGxDwYJiMrzYv+Uq57cy0+eWlGwL3RL5Pw6m12fptQ4DDoQeVAA0Gle4web0V+X6XK8
 arfQACsUKuxOsj/7Nkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_043846_898430_D3EB3FAA 
X-CRM114-Status: GOOD (  14.82  )
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



On 5/26/2026 3:07 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:16:03PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> The video clock controller exposes power domains, so '#power-domain-cells'
>> must be present in the device node. Add it to the required properties list
>> to enforce this in binding validation.
> 
> That's ABI change, so you need to explain impact on existing devices -
> Milos.

Currently there is no ABI breakage and no impact to the existing
devices, since the nodes [1], [2] using this bindings are already
specifying the '#power-domain-cells' property.

[1] videocc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1849
[2] camcc -
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/milos.dtsi#L1918

-- 
Thanks,
Taniya Das


