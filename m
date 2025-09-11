Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8299CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=; b=zCCUoypO9+b/5M4XzRebi6/Zxc
	uVaekvR0WiH38hQQ2eJWFRUMCP/D2IqJzWFT4WqjEpVCtRKfv57wgjMx8W7xWbF0JdK6j1j8BmHQO
	+QeW5msBX7wu1I8CQflEdjQtIOENSpch5C9SX2c4AqjzFKZ2HRdG6IegPDmLSJGaIw8FJE3RNvzrD
	PxGt0WryDIcF5IUaYRM5GJAj9CQExfWDv8ke1wt2adm8K5NEAJNK6Z80EFYv1swBSb0t/GtVB+NyT
	5xtqvQUyPRglF9vuDfOrF0v8jCm9h8w9bMN1BkQ59rn7ZuymtVouHWXDGUKi4UzjzREsgefLPjqyq
	zeQX23kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd3f-00000001wBt-3XVR;
	Thu, 11 Sep 2025 08:53:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwd3d-00000001wBC-022k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:53:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IWoi015064
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=; b=OrIY/QGAjyiGsCvf
	Dmxj++57E6yEaDivTVuW7agmMUOYVnC/DM5C3oLOgZuxx0OCoj8r3Lf58/yLCjNx
	x2zKTAvM6/VIyfu4Ob/p2P+uMLolymGRxGIjExVMyPEy0Wz8bz1SH1/CEMDJKN17
	AJFUJ39O3bXtCI0zB99HZs2ouvKC/RrC1QH/CN0frAAic/bLsJGwXY96olQSdPdD
	aLJgznelxD2iQAATm+WkFealh2YMeYNtuscpRVSqXQcUhIn+ONuHSDzRP5FwU+xv
	0Sx0y+JpQh/Vq3qzD6Wer6WeilyLnVDkDGpEM1EDHM2arVchyWdLKp4UOurR27dI
	nAYTaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m6ujn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:53:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b604c02383so2510141cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580811; x=1758185611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynWl2+LN0okkZhiNEn8Jl42YKjFcoHHouZf21AAoHq0=;
        b=IP2TXjjDBiJXYWfx8hd9RlQo0sJ2vt6T8muqO4He9KNwM6Ze1qEo3+TqSxfhcnJrSL
         ATxrxj238HphnqauBsfs+WbLWfDqQktiRXfAoQD1hkju9lp6u0Sg06XAqHZv/RINB2uf
         w3utt/dpUkPHbDBKeNgGs2Tx1h3y1AvFqefBbL2wqKztnSkOUFFkkVdCU2suSYROUXpU
         vackk+chgEyL/tSr6u4DXDL7/4yUOfh1U3716h04t5PFdTdauMghpJGJV8UDSoTV9sEt
         E5l0z7rCqhu3afXyoaULtNs5lSFHqN3SEWA/ltDOlBzbKMyIDVnu7BTHNZYv8eKXAZgp
         cAnw==
X-Forwarded-Encrypted: i=1; AJvYcCXPzC8ufJQZVduAAQGAIfgQ/50jtwyiUCR26xROMUuC2Q8vYcKVsS0O8gWJSfbaQq9ukkZOJujO9TraMOPZwHn2@lists.infradead.org
X-Gm-Message-State: AOJu0YxNIDaIrjeHz7CQmzjaI2OHDC0b7YHm7csqwR5HtItuF8PnyNUt
	wm9N0VCUgTu1i799vYkcA5+YvN9M5lQF9z2dHIYPZiha2RgxDGTfsQ962Detw22cv0nPk3l5G4w
	U3Df6ATcEKAP/g00Siv0DuPcZUj0z/z+fjShyRyV8Tx3sTQMPePdFg2s8k1pmrKYkXVkpQ905gS
	DLjQ==
X-Gm-Gg: ASbGnctVo2OyFKM3+gnge223LfEp9PNq24u/NE5M8rYoug0wjVgJ/6WrV+ysWXZu40H
	kleF8j6qCLNoDzo5PC/4RDrPiZk6DAQL/VnsPGt3EPTdZnL9+iC2s717qoSmVa2tzSI0wlnVoWW
	Fm4hkKEBvq8Uw0+ZMLi56eE4t/M2byiaI79V7DdzbpMf4zfPk86UjqbfknDD0si47kyLfV1tynJ
	dzjVv8qxtSrL/sAEq19U5nIIG5JUWxMh7J+3ppntzG6QOKpjgFnHdeF6H9UU32uK707le5olKi7
	8mDg0m3uGwtTnQWsThXQfpJzld27wW+ia2qnRjfRvHLGwVuZbSjKIhtRJUkbwoX7I4ncHk+jTYI
	5Vtz2tJdlA0Up/1hlXpzWBg==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b5f83aa98fmr140394431cf.5.1757580811159;
        Thu, 11 Sep 2025 01:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwrCXlNX3e4J1CCi9Qj59YkjWyURxTP0akIJvONe/E360yXgamsqbmCNGDwjWVWtWm2ONHng==
X-Received: by 2002:ac8:5e09:0:b0:4b5:f68b:86a0 with SMTP id d75a77b69052e-4b5f83aa98fmr140394291cf.5.1757580810734;
        Thu, 11 Sep 2025 01:53:30 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f20ffsm86223766b.79.2025.09.11.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:53:30 -0700 (PDT)
Message-ID: <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 10:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
        Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Jakub Kicinski
 <kuba@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
 <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX/yAe5VmXzAJH
 +2U7jGCC7XdLsAaivxrdSyM7AJou72zW+SWf1nYnPmg63T1btdUCRUNN+H0qi6irgIL7RJD71be
 1MMhpk3uMBmEsH4BMj9CoijMavD8LI9t03kEh5LsLXP6pQX+Mv2cqk/NbuoIP+hAcZYXBysLBMF
 oOuvWrk/fqPjhpNmXaPNuPy7PwkjLGRTG40IB1Mi1M2HKsgbNhIUxa1Tkxa+cqv7jKEwvnLKnoz
 +1zJ7ySuRKh0cv1dXRJAi8kC1sbpgfqA67sRv0oyeEcGRqIAtNHiDDFbGkrFm3clGBOkGnxXysl
 4gPL0EDovBFO8i9aVeJNZZ0Bul/cPlWei4bdGJn8wEJ+pjkJPseVumW64a3FcdEIs0MNkaESIHB
 QAi79Tm2
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c28e0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=E8Hth7WlfHmEou41Ml8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oNmNkS-uL-WSme3en38dCZIbfUN5cue7
X-Proofpoint-ORIG-GUID: oNmNkS-uL-WSme3en38dCZIbfUN5cue7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_015333_049395_0B30D6DC 
X-CRM114-Status: GOOD (  13.89  )
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

On 9/10/25 4:42 PM, Bartosz Golaszewski wrote:
> On Wed, Sep 10, 2025 at 4:36 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
>>> On Wed, Sep 10, 2025 at 3:38 PM Rob Herring (Arm) <robh@kernel.org> wrote:
>>>>
>>>>
>>>> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
>>>>> properties here differ a lot from the HLOS-managed variant, lets put it
>>>>> in a separate file.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---

[...]

>>> These seem to be a false-positives triggered by modifying the
>>> high-level snps.dwmac.yaml file?
>>
>> No. You just made 3 power-domains required for everyone.
>>
> 
> With a maxItems: 3?

In the common definition:

minItems: n
maxItems: 3

In your new file that includes the main one:

properties:
	power-domains:
		minItems: 3

Konrad

