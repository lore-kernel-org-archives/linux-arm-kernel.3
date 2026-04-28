Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A682DFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=; b=c6oa6Z4QzCj6eNEQyWiBEdTDfk
	hau+F2OMflZ5UTlCP6b/xaZosD4I8Qh1wbUHiQXqEM7/XUeE7sHntrs2gAq1g/qWRG9gmWTODY07E
	Kk+pacbsB+JcUn6z0E8vQYGiRZVzZd0R7RyiF9gwecOWHxxtlGd7IQb7WHB1bjsHOnZATblbvNtdI
	wo6CJ8TsYZMHwEK78BNkqMaGAO2Y5z++lbcDNKo3EkmA2l461arScHU5Gc2HhyzsBUmQBxttcCigZ
	ZGw01ZSVH5+iSlqd8fjmcdcV2cT4AHEccvGx4U/CxGB4XrfIWZ6dc9NFY4DqMjVBylUd02YCFPBT4
	PHr8I7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhDN-00000001Oij-0PCn;
	Tue, 28 Apr 2026 12:06:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhDL-00000001OiE-1GHY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:06:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SBgklv1625116
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=; b=T/x+cIQr+Qv+875b
	4tN02qN3qjL1MlIosGj1vGiCxLn1OPlk9EIcofEYFFDCMh4wEOxyKSNf70x9uUTX
	rpKyEtPAT5okFIPOOsBhj36GIQCln9sBelvDgp631LB5j1Noz1bxLRO81UPGiauf
	cRuq6OOGbi9772xF41C4IphzUeRzNNrd+bpHXJl8aSNKDFelo37mqTSgZtwWuxDB
	I8NLT9UvRi/INY5U8d0PIYiHYjyDWQiMnqEGbmAsyhncNneAJYtB/45V/UsuG/tn
	nwy53YvTPKpZb/Lxu5y4PCRFptOLpy/JblQUUUEjC76gu0HYakYaVapwt0N/q+mT
	cB4JUw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsaufc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:06:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56eeaefec9bso11017641e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378013; x=1777982813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=;
        b=jBstMuvDQQo1ZVmVViEnxlcmJ1V58hbkMGeH/8nilzIXJwFDdBHytgTjMoQVXVKYLk
         9sn/JJlJYWqf9ajqoJtle6Gaa9q8X+Qxd6IGA45hFsB3DTRodZ9Xpx0DsoCXhyXv2YRn
         kUy2MBS6e3e+Ht0NJraf+VDJnGg5TgV4b4k9h6smL0DNmcHpx1h4htEbqCaZyYk6vR3U
         S+bcOqXZY0DUHuyPZR0aKmyQMG4H4eNhMYYTqMR6KYpUObtG7bGoQrRiZnHNJiJZ6bNu
         TyIkGeyno0kMHhALj5ykiDRQ202R4lKBMtd6bsHJuSxGB1tv/K+vwiKeq23X8g7Vfca2
         H7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378013; x=1777982813;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9y8EV99iyvX3G3DF8b7F3f6YYH0PTQ5YFB++5dodr4=;
        b=GpmQc1DAbG5Z7Qel5O8YWU8HF4R52mDB6MKaH3RAWF63yLsHixL4LSCrK2ClC+AZ8a
         EjingSD4fs9b/Arp6bdk8R/XBjwP4NWNerAer0/Dlf5qnVzKlRyQLC7GpELH4l5wf2Re
         nqris6LZdU19bOfpA7KSP1zdzlz0AbhVidH8HvPiqdJmFQCfleDF0eZGxoDMjUQFxMHt
         lM39z0VgbuEqyD3ZXZpaTZNbdjv5uq3AoocD5OaMTuy5MEf42mpJQwXpv7LXrXNOf2u2
         sfW8BXq/ASciVNO4/+YrPhzss5qH52jBoY/+oMJIncHcjp3mJbi8RuZuHeD55vzJttnZ
         uwMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AXqvapi7JYItp3olF1aFlZOKSZg+eaoMfPioGIroIWykdpNm/nE+09rtEqBaE/x1MF+ixoPW7afx4U7bCbXmt@lists.infradead.org
X-Gm-Message-State: AOJu0YzIhiJUXU3Yakfpveen64U8L/Ev1M9AXPtGLwTSiBZYUQQfJJpk
	h75rc2WbTKHGlNZl3BdLwB9i7zVOy4JEpWz5fyOrfgptrhgC2+LrmS3wcGcDKiVNQIeAs/ywVLl
	DEmwsOOERni2qZtqqqIEL+xVa9anZXgyl8oLKnwcRKJLcrzFI1ZGGqpUAPhJEhRIxGwPTkAFA1d
	ijWA==
X-Gm-Gg: AeBDies0jigb6Yk9+P7M0m7lG3dWLaGexczGuLClz5IuJMWLT3LvEIrfzLV3lLN81DU
	7ZfOfq8haw692OpKKMIu/SU9g14tgFAkuDHlOAcCRTWQaulhs9a+mPSc+EHYCookH5JbsKpPhZ/
	GFRcwkr/CAzyC7/vt4ll2dfHfJI6YO7I0wW51dZsPVeMTLLgTM46ci88p9E1I8Nh7itYBQ4Prtx
	69UwVk2e1Vx+7wA0t/rxc3nXzMGrA+UIbc4/NLvRLIPNuq+ILQ0SpWHlhLlbVXsfUgs0oX6cyfW
	PdsxA1i1lSUeUfRxSZRK9RzFhD+EvwsMTTD5vsdvkcwNK4nU+ifjYcfFxsIG30UZS904qKEalxN
	wm1MRIS57PuF3+GpbK1+vWi0SF2F7+ZaCmNcpGuU1vPJDsdJ8PCYearOBkDo=
X-Received: by 2002:a05:6122:4f98:b0:56e:d2dc:9bc7 with SMTP id 71dfb90a1353d-573a5596190mr969534e0c.5.1777378012583;
        Tue, 28 Apr 2026 05:06:52 -0700 (PDT)
X-Received: by 2002:a05:6122:4f98:b0:56e:d2dc:9bc7 with SMTP id 71dfb90a1353d-573a5596190mr969499e0c.5.1777378012158;
        Tue, 28 Apr 2026 05:06:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a775f7807sm17428265e9.29.2026.04.28.05.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:06:51 -0700 (PDT)
Message-ID: <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RAvUZEpaPZ0uHmORTJip04M37I6VGPhp
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0a2dd cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=H6Ehi7c2N8zr8xo9JnwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMSBTYWx0ZWRfX8GBj5SWUJ/VT
 SfuQbYOMuvOGbGrgfwEVmIVGhHUz6sTrVpzBmyGJkJH0bhs9FpLpW2t86MkpVRHcmbBCSVxpSNY
 M2B+A3PtgDbJgk1eNM61rz7MIUj55A45wvlEjv+DHWj3CObDHvvEnlAFjAxXkMiVUVvekqqif7T
 Psu23XMbxtoTj4LEqQxduNAzvgOj3A8H4xQOc6tBhpjFK6hJvH5BaSAOk/wJcT2pIjVtBt5d2iB
 lYcDowqorZDuPEhZ/vILp8NGg6ql2Uc/tIiJgRzKGNnCQbzZK1gg0jpvYYncAcXmA2xLEfIIOtk
 u5pA25BCe9t04RH8Z3yFoscd/GRdUTi/zkmKKqqCEusheBtaOkk6o8OlI/gh9PMkqU5qpKPTwRi
 98qGe0gE3xqKF8HFvNmUgYNpz16b3/rgY9/8K222eq1jHf5nr/kse+jPNy5xjHjAgEgwc7GfOHz
 Aw3GOL5tvySXMze+HUA==
X-Proofpoint-ORIG-GUID: RAvUZEpaPZ0uHmORTJip04M37I6VGPhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_050655_350407_E6A6D420 
X-CRM114-Status: GOOD (  13.69  )
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

On 27/04/2026 22:18, Linus Walleij wrote:
>>
>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>    platforms, which are already enabled on qcom_defconfig.
>>
>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>    time and feels logical, because if one selects ARCH_QCOM then
>>    probably by default wants to build test it entirely.  Kernels with
>>    COMPILE_TEST are not supposed to be used for booting.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Way better like this.
> Reviewed-by: Linus Walleij <linusw@kernel.org>

I think this should rather go through your tree, because new drivers are
coming and some other changes from me might be touching similar lines.
Well, defconfig also might be changed in parallel, so obviously someone
will need to handle conflicts.

Best regards,
Krzysztof

