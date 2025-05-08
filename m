Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB3EC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=; b=c+4e7BuWu47jyI94GV/AxH3T/+
	hSFQwPq2mi6mJRc4SUWLe/M1nJSBLnkBisePFeTqqgQJakFxEccAlyTZeurisXP2LaISIse5ZHDsE
	8K488CT1WFB7wQ0o/YJKPiUT03s2QxbcacRIRVzLGKzyXx+99uC7BNbIPjt2F9UcUlNztHXYTteUK
	V1RLIF74MrestN1DdZol1l2L1XTrtxPtpIf2N72KaZsthv4n9Bv45L76gVkCfZgMYpm/vTtBSZs5d
	WB/Lji3MOK5ALhbR6vRdVccpHPAkIegTVR2nUa3if6i7vJdG3+sFha83zwwh09sgHOFc4c3vvX8Pr
	9nm6fWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2q6-000000013KZ-2l3l;
	Thu, 08 May 2025 15:07:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2DP-00000000upk-1XCU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:27:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DDjod002235
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 May 2025 14:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=; b=YJ+vvhv5wxf0zoE+
	FRCfleAoKhwz/ZkxHGa7gIFdg+hImF8d+4z4jqa58MSCjADTch7h5e7j6kcO53CA
	+u1Z7UIt/pzYSvriICYPyOvGLh0SE2qPFXwMyBl5y2wmW8D8ht2IixG2yIXQBjNe
	7TSTZelW0DKwGJkTfF7NHntZZudKkmoQV6Ts8lsJrFXSw+IiLHLjHFtafjPAZ+7z
	U7qsVYO5xaDHf/pODUmle7MKIrCFNIzLYqufBDYav66HZwewUr5gWLMDphuS1LuP
	Qrij5s3zu5Z3thxgI9Tof8rRNJolzGcYyO0Qtw6mG0RMMEDkisgNLm8pd7slh8LD
	Hbnq0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59kbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:27:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so22049885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714428; x=1747319228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Mep7YcpH9mzwrz4fqg9kB+zrqpI2pfxnFBXIq+LfRk=;
        b=YrT2NqPmvYl6ErXwRwxCzIxlC7cEB8gMNbIBsdHgpiZRwLLj3yyL7MBJPbDb2vNR2O
         OD7hawgX7UEfF0fOaHAqRACyn8X8wsdHtDWzeub6+VxrNG0Yhvxzgdcl8a6knrOGd+rs
         eseHB1tBEhLPcgv7PVVYzaleanpv8UZJ2iPztDDSjAhY4PZq4tv5CxnJHlxY4Lo9+7Mb
         VJVoz9/h6ZXG07qi+vqoypm0LU8GfYputbi36UdU7lhgGkNhMUCyYKtMXhJiZel4Df6J
         cAcw/A2+TEULODYlMTAvA62rOpQ75bLOBHNSkE8L0a8HUjxwYoulOeXzaUJvRm0dK9EY
         tBEg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBeXc3CZOhFkBCopfYCg4lnxb38srPpvSxxDX64sXmc1GAdkvA9DebaPjLqJ2DEfWzXLkRaN+hG84Tn6qVYCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCZ2hW0w13IR7xq7gXZuM6LrP+Dq94uvLJOvIvJ+5JkxCkH08A
	Vx5kiB5qTuuM9IJj3FZkdLNVbTvW9NdBvtpuc3jcvJlHsigkFS1V8Tm4NIh0EmPPWa/lXMMTb4F
	vBan6SKnhByP/V6YKme9a1+l3JVu35GIJWr5bL3PLMJ37EyIkiJ8dUY9h53KXHeGz0Jbw0HKSbg
	==
X-Gm-Gg: ASbGnctroR2hiUbjYWykudoTsA4DgV3/vR1T2RRNXlS6H4Yjgx9ZlTMsD+Fs1JFeg2L
	OKiDeBEoXzPlaFxPHogX4v8LlR6QTPbiTCyW0ZZFAtlGK/W9sMFQmrwi8smBi7JTo/ycIgYjBg8
	pjxmNw/lyiOxliYLpiycSnYCSooonRSFa3fgOSxtjZBNJf7Vs1QaA1twhwwD2FLUCVbH2aXXMiH
	6FpCboQVl1fEVRm+rSQbaJeaI9mbV1y6mX/uf2yRONvdglbPdyiVPx9vOj5eVcNBr3FiY3iLJVm
	ZWe3WBri7/le4qN293WuJOLf5RujeaRxlDVCquUMKt3bOK5QdnXJo6UDtP8XxijaGUk=
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405296185a.8.1746714428668;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvba6HeUAx7OKuoCqvOUbDJe875HzP+f08GjIi6W0s7XmhXMvoMzNxaPmK3JIBmw9hSJ9S6w==
X-Received: by 2002:a05:620a:3711:b0:7c5:687f:d79d with SMTP id af79cd13be357-7caf73aaec5mr405294585a.8.1746714428345;
        Thu, 08 May 2025 07:27:08 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad20d048485sm55528066b.127.2025.05.08.07.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:27:07 -0700 (PDT)
Message-ID: <f22fe0a5-d39c-4a6e-9363-d02a6b17f01d@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: dts: qcom: msm8226-motorola-falcon: add I2C
 clock frequencies
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a8191e3758e0df78b4213102f25ceadc28cd427.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cbf3d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=TrkI-WLm7CqbamwRmuEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nBUk11Sk2lk4AKXmluATRuh_B6wxvM5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfXxo0c9oNScT90
 Ni3dz5IwA5jq+OjRueS1zS9J9QJuYGtodGiJAZwiiZyDL6oiKKdXZHzg0kfaVqoodpqNV1nX395
 tCEdSY9ujRq+/7YmL/gnAayOP8G7Ook7VJmi832uijty9Vyu4J0znAjdCdIqEJepSYWUYN296Tx
 wrpTWeJ8vowkv+yKA5656cpplVAr3ZhcgyxW1uh07Ai3Tz+pM3NrdeBSRtHw9odjid+wgFC6fQ1
 hOo0ah0ppHcPQo7HUmZaPdqOJxlsyNIQGJBSQl/GVPlPwMqKKJuumSgW3QBUQGf/xTUtXto1yXb
 EZKRXOtIl2vgo6adMWVBIWgNBG0B7TxPR3tYz1EYTUxk/lZ7eunijHVjwqI+GotpVExLM+c/mSy
 gXSelC64xY1VJ0lBH381cfpXov6RbuZuS8dVPvwEHTPDJhKt72imstpq9LZWaRLWwIXIgM6N
X-Proofpoint-ORIG-GUID: nBUk11Sk2lk4AKXmluATRuh_B6wxvM5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=803 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_072711_528439_02F7E2A5 
X-CRM114-Status: GOOD (  11.10  )
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

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> While the currently supported hardware works fine with the default clock
> frequencies of 100000 on both I2C2 and I2C3, downstream sources list the
> frequencies as 100000 for I2C2 and 400000 for I2C3. Update them as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

