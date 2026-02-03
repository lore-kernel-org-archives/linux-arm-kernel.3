Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BF0E8305D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=; b=tcku7QL/Z23o3VB/0Gkk9U6GWg
	dQVhVNmCKgTm7dx+v7RtBg6fiAGWNTlJQt/F4owJ1PJUi+tCp7I7MWnu+I/8ZHkXI8ulQfZn8NryE
	j9PBhv/7rwI+x1S/uVn8np9HwzK+X1fWVqAdK5peY7jOAUDgNYYU+2Z+hTEpUmqDSqAcF556YufW8
	mqAI4LLIiJa4Y5pLZ4PPRNQhYzS9FthlThBMQzJj61/j9nyJnvwT1VtI3gWeivBR5FXM58JYDcV78
	ZFxafgp8rlmrmzJMuzP7Y5RqOtn9pOlxzGbfuY44KF91b106aEClzvqk9LZ8mkCdKYlIoJBU9j5CG
	YdZo9bQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCHE-00000006LRK-13Yb;
	Tue, 03 Feb 2026 09:00:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCHA-00000006LQb-3Rs9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:00:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6135sKsL3916180
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=; b=na2lf2hin1J5RDcm
	3eWG8e9BXLp71zRhDCNVU3ck+gB6Bmpj8KP8rkKlHTDXCIw8JHhQNCpWgiGYCMu3
	6IsRwF3PlfjUWSPDarbxESpyLOdiWPP/YgMCCdrRQMt9RtG2W8JiaFyejYa1cMsu
	K0JCN2BvlCWKe3BTQqNS2GNgXQInEUgtJkJKd43AMngXeQSkMDvgdYeZ9RSgtk+i
	mGwv6sq9G8X1GqhOh0Ha/Ram9YVK1DnQ/hz9H2WC6+lDR9bNMZrbOEPpXrGxLSot
	ZlCoNCJ/FPArFk86c2pQ/RTEntF6VJYcln7W3H1niTpiPfyJjZgMWJAJ2xYyp7yI
	RgqibQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmkpbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:00:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3824432a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109246; x=1770714046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=;
        b=TWuvpvlYRNJmVdnhYXRH1PUT8XcL72arKwYOoaL4ZcByg9cJFA8F+2IZfGgYMEwYTq
         WLqei2SnEnq/OO4UmqM3DK9HsaQ2mOVUx9tSugsc3DRL+JM8o9H2uPGMgAZLqhWrVZ8s
         J5mamfAMmU2sVcVnWllEBvf+1l8ioh86bi4lEz2SMWXmyiM9ZixKpCFJ3fBPnpasTZGw
         K1eRqb/7YlMYq5qTPSJwrHg1HXYN7L2Do1C29ZEsugz/MNwkK4U7FmTN8w2TIOJ8v1SI
         fPeeAiEtWX6c9hI53EXL0seXCQ3L8uk7jw8QJMYuTkrwvN7A5WJT024KgEsU+n8Sq9Ej
         4Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109246; x=1770714046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ns7zom+ESrn537YGaFBa13tzxdpCjz++1nYEzFY6vpc=;
        b=ocsfSICTd6UqOPyrP8TVb2jeyeD2RRwOW31VxiBC6qT5HZoIScobJSANNfeh3Andtq
         h6vdVtruxqfyYJ4rtDfaQ9UlpE+Yfy/iu37lbwnVVoXdwOroIP/BOiM3z/yATjFyz6am
         NkrF1GjyjQPqWlAA38/0xnFEZtROcb5m6eeXlNlSXdqVrSDHsFKtlh6yeqRe4aEy/7Tc
         PZMEjE7jXdxNc0N3qBaNpwQ1Vk0Rj9djL+2/7UCe3eJgKJOhpHtEKYupFkQ9Q0KGiMTB
         mnZV/QUgCWX2np1rqZvO7L2jDFdbRhkGZHtCPvFYzxm49gkmwXSEM7XONJjwEfENRm7q
         MBFg==
X-Forwarded-Encrypted: i=1; AJvYcCWZhFzF/M4h5+w47zf7mqewccqBKEUNoCr3ajHJHngfmFKwDTTyrKC0HjHFwAO8J/hYmLPnXwox3XuEBhDsJ6rM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw52RJ9deBZlUyYZaRvVMiwTW/Qyzz6C1K/F4vOpbQjAvy6/LCI
	93zDKQ+/pe+kH/SUWjK986Tq1DR+bL6DpgPQX9r6u2TgonOuQcOcOXC7uSWgtS4atwhO3ugopop
	9UlSHato/PfcaksNxlaEccJXvkTYOw3lKJ4t9GGgmqFFZcspp0wQGJ2SpUrOsu5vYm9kiEdBYoR
	i/Ag==
X-Gm-Gg: AZuq6aLFZDQY9pKPP0A8PSnPv182fYg72jessD3CqozzhCigAfAzUR8c3M8Y8jUx3WN
	1d77b6RZ/sBFD9A66Z5mkFzdFEcR6W4Ar2nPBXqysJRCosgWuj3AYrzoaTAvmXlDZFWq6bDE5gw
	yiIRYhk8sBH/ImKKRqtjSnhV3MY0rwUaEBkTL3pd07i+Z/YglJyxUxfrSMKvKoG0Q2S+9WwrbBz
	tLSquz49m2DaUnOwj23mJh3pQHI/pJ7neZ3ydAfzk7bYCf3ZD33SucHF9QXf0fKHNWx2//T0h0t
	wmtsicGsJ3W0y2QOSG0fISSmNU0V7yKaEUqs7vRBpati0q27l7USnw7aUTNXJGdwcEgd/ANnzKL
	c6aODw6MlIoDZy5QVyQNa+UT6xrds7Wpe9kORVl3ESnby4z13bl/MX64DKEnmvQc66NkDodlGvw
	==
X-Received: by 2002:a05:6a21:700b:b0:38d:f799:c4dd with SMTP id adf61e73a8af0-392e00652a6mr14659643637.35.1770109246405;
        Tue, 03 Feb 2026 01:00:46 -0800 (PST)
X-Received: by 2002:a05:6a21:700b:b0:38d:f799:c4dd with SMTP id adf61e73a8af0-392e00652a6mr14659592637.35.1770109245911;
        Tue, 03 Feb 2026 01:00:45 -0800 (PST)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356b4sm16583717a12.17.2026.02.03.01.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:00:45 -0800 (PST)
Message-ID: <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:00:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981b93f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4RL_iPhj091x_p4kUjYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: PI4qEPsR5h4A4vDgqViO8rMGyBnCykoy
X-Proofpoint-ORIG-GUID: PI4qEPsR5h4A4vDgqViO8rMGyBnCykoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfX29TQ31J44u4I
 8QsWEcliw7Z5Kofy+/buOLRKl0qXCdnoBxOrD2SO1PIa2wuBqQRCZgIanNbijmNLrlBJ4QYSIpi
 g/bAwaBhEWUte65PWBOjY2tjsp9WQFG7+d6QsZUO0NaRKD2clXXiCajsKIgfDy2SGuKe3BifVlk
 vNF2HZc9Gn/t6yX+7dkEEDRr4HRvCtpnCeWIGx7wVv33QwskW+d4+GBNrLqhCJ8MSTq1l8Dk0By
 yanx8DZadJJF417Mwy2okdD2b78JQ5rVWSQfafbvaxJQ/0IPb00F8FsgqXobNzxPE3AaxJLTz1K
 f7xrPYxvDdNTUG9+XT+HszXDoH4cE36O/P42xTXOmYTJ3f/LhbUXkmTOoXVKpjMx9HcdM2kQ91I
 /qu5Nq/FndWzWJFKzRBPd7k3jArd+b5QC948ZnwfIx2Nsvdkrw+BTZ4q/mAnTnY/J57y22uekxf
 aKHPToX1Shagsnx9wBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_010048_981278_95271366 
X-CRM114-Status: GOOD (  14.53  )
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



On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
> On 2/3/26 9:08 AM, Jie Gan wrote:
>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>> compatible for probing.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> index e002f87361ad..68853db52bef 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -29,6 +29,10 @@ properties:
>>       oneOf:
>>         - items:
>>             - enum:
>> +              - qcom,glymur-ctcu
>> +              - qcom,hamoa-ctcu
>> +              - qcom,kaanapali-ctcu
>> +              - qcom,pakala-ctcu
> 
> Platforms with existing numeric compatibles should continue to use them,
> so that the mess is somewhat containable

Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu

Thanks,
Jie

> 
> Konrad


