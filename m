Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC97FEE4E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ic2FPeEcX2exXS4T1gdXou5B/+3WMKVsZkqfg6b72T0=; b=kfUR1iLr2r3D9suQ8HSb+7lRnf
	GEju5Pi7mIhtFb7SVzmUTxZXq0TqKY5/FiEUzV6a3NHEm+C3qffWbu4wmymVJxNvwR6tEHpvH4Rbj
	BlR7baNDK725G62fSOpeJF0HW75JudW0sUSdIdn4nk7YA3Q3w+bXi/wZHfMdXjkqmjSA24oTTZ/Jp
	8wqMxG8DeGzmniHAqhrzVytWsDU5J+HJ1rCagtQtjaJz3/Bv1e2sIKtQXgUDNTAbG1Y25J/RIvMbX
	V7boNqQHxJ8M4e39lC+R7IY3Ix/hGCYcnH/eCHIZqRAG5QtHYIIH6FC+lGKscPsQvryaPMANjq8Mp
	VXgTTb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwGy7-00000009hbw-15pu;
	Sat, 28 Feb 2026 09:50:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwGy4-00000009hbD-07zE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 09:50:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S95hgQ2493853
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 09:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ic2FPeEcX2exXS4T1gdXou5B/+3WMKVsZkqfg6b72T0=; b=exzBv7rlF5yhptcp
	JS9VNa67PovVS2lu1CVuquQKi7g8pbZMNR33nmImPdm+Lccx19uCZ64l53Aq5U36
	4M4qHxG8I04OSXJkCZLTm5hSGN+kAxKhXSbJqYgsZIN3a7p2Onw3mTrqAvM4bnvu
	WJkB08VB7iSNX5frK85NLveay6y6fK2iGI1ikUHlf675hwxzrbTOIpzaaEZFwXLt
	c1eACow9Wbr2a2b6Vcktwg4STuVeU8ttZx9yL4g3+7AIgQ3k1TDJOl1ISTAah0RN
	ScVECwhyZd9VkG+3zu9Y5LmbsS5CHmHGffHZVmIGgbt9xTgUqA7TvA0nX2xKl+dR
	JYwECw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfggm96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 09:50:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so2750278385a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 01:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772272234; x=1772877034; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ic2FPeEcX2exXS4T1gdXou5B/+3WMKVsZkqfg6b72T0=;
        b=X+PjY3FHPFK25H8/y3rZrqB6p+1/yEbi83A3qPVRK2kip8nJBkgmbVAPVOcKOA7GsR
         tvxb6vHzlKeocjz7px8ZHiK8gPIWkHH2fxQRrjuv2lJyYNiIwv2UrqzoOuyD/+3zbh+h
         F47YtBF7E2UaV+drkIjdUsp34CthRZQt+C6j4zOVsxTqjYgr0UgCU/jO92dQzszHDd5s
         RB0bk3HdQkl85O0DDAYu+CLcwexlE/N9bXYRUymKVNkw8T/1RbmclpKLjaWZAx73csdw
         ER2GbCUg4gqk7ugjMqQ13ZYjIAPGLqtJreDfnQoHk4NqwqU774QpyCJezLp/ak0M6Git
         XA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772272234; x=1772877034;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ic2FPeEcX2exXS4T1gdXou5B/+3WMKVsZkqfg6b72T0=;
        b=CU3625QFIOxvPN1tcj/CeC3YLc0bNY6AX/IzDQ9ChQsYQbJIGDBsFnqLLSXHJYDGP8
         uDRoWFi/jzSTH8L5ehnVI6m5O5afbBBBJ3V7a8DjMHkkZ5edHr+D8O2WdgoPC897GROi
         l5htMu51O1Nk+ZBzaj9xHWWAuE7EJaR6S6qgI2T1d65iQ8YyXJ0xjt5QrSA+IlZRLgqa
         8JjUoIXkIK/wa6xqsDOmrWB1+QFx77ZKzmVsdPFMnlF3nxo96XowGg6abXDKDChEd1a+
         ekAhwU3RwX3YePaXm7X6Gn9BXsfghoeJzZ0R2BG5fkOL0klXPrTaulVfIByLaFjYkCoN
         EZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA25dOagfW31LbL+3fxA2tRSrbrrtS51DV0JgYz1bbcGQS7OBMAaWXs2JHOLP4svK7o5yXvVOFpVJ8PPYwfzik@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv8TW3YVOMGEsfJr24O+xEgM+Lua0/soLXY1pRVNVyjyb2XenW
	Uv5AuLtRB0xSI+BdwlnlFkdIqNPGlSZG7tUUc8pEUekX26EFmrqXtuSWnojxO/tylK/HS4zYO1o
	5+FEYfm585exxsDfDSqLgjMGis9ady5EuJpPh0IR2nxEpGg4RkD4JFyEWg+hb01NNhYil87QbHZ
	bHPg==
X-Gm-Gg: ATEYQzwZ77BHMLLDv5lhPoibdoQbRWkrsS5b3tIx2YBRfeA2+S6pKxfQUZFWolDfP5j
	/kqTTEQrabeKgsCd2n3MzRk2v/TpiNa5eG6K0ve5lWgoRB380YvlO+C2zzcgIgEVhPKFwHlIwpC
	u3fQoEgWlXDfBrbj7UzbWKR82zHN1zSK0Vo0XUk6VC2AGYslSyVpy7tkNAzK47ShQDH7wMsok2n
	y7j3ldqOHQs0ycszF1d/ice8IDYTFuneGYgaUbMn/oF2NrcmGvLQb+aMOg8gP+HLxoRWBku51MK
	fA7ZsdtFlxDxbizV7LSkxRQ1hBuQwxNoBqeY8pLYSEQXSat9JcevnyN/u7avD4dRYULztGYy43A
	2kHjyroeHVDbbx+GO6mE7MHygn84P+Aop9BgoZMIot15g2QQiUQ==
X-Received: by 2002:a05:620a:288b:b0:8ca:363a:cd73 with SMTP id af79cd13be357-8cbc8f366acmr694823285a.68.1772272233997;
        Sat, 28 Feb 2026 01:50:33 -0800 (PST)
X-Received: by 2002:a05:620a:288b:b0:8ca:363a:cd73 with SMTP id af79cd13be357-8cbc8f366acmr694821085a.68.1772272233585;
        Sat, 28 Feb 2026 01:50:33 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ad3daf89sm1169162f8f.20.2026.02.28.01.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 01:50:33 -0800 (PST)
Message-ID: <88ea9b0a-1eb1-4273-98d6-b0283e1af6eb@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com>
 <20260228-a9-baisc-dts-v2-2-47489d5cc1a8@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260228-a9-baisc-dts-v2-2-47489d5cc1a8@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AR-f2dnqhVpN_4sdBg1CQ5USZyoaS-yz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA5MCBTYWx0ZWRfX1W9AAUaQG+m7
 Pe5OqEjCjtSanNpQGwID6pj/vJpTedrCOdLDyNvUtq5SagfdsjSbjgtBfjiCdRzJDjzVOgJQrvB
 CpJM5BzKWAAKErgAYZpW6pihtC8/ZHgGb/9ys4a+VCrFE2wafq6kLQMDz7/mcgaiXmzkkDq6cf7
 Dld5D1fYNZUtfO3D2PBDDl7VSrhxkFQiy+dZZaDVAzbk42SBDcmlmNu7htqpIBeVrRE+5ozXjF4
 iR1BIzX7bfi92+DdOTYbjy/sncZl1pFA+4vm4EiEz5Ik6qltY+8WAlmk7nR1VZ7HCEYIsTSXiUe
 BibuJge9CbY49m1t+tXObjTPjML5IGvVO60/hPId/NbDV4toIsRqNp1bg24DSfdCCuzfToNBbS+
 MJyg1SuiPAr78DW9V8M9Y087ndMJEHnEaYsIfxcacSMS1EPAcTLzOMscUBGZjn4EXdGcgMhs8iK
 WlruZyRrgEYZhxr6qFw==
X-Proofpoint-GUID: AR-f2dnqhVpN_4sdBg1CQ5USZyoaS-yz
X-Authority-Analysis: v=2.4 cv=BIe+bVQG c=1 sm=1 tr=0 ts=69a2ba6a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=BY5PBP3jAAAA:8 a=mK_AVkanAAAA:8 a=EUspDBNiAAAA:8 a=3C8T0L5fw41Lg_G7TNoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=gQW0MTutLl7eKD3OLfcZ:22
 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_015036_676774_8151E5D2 
X-CRM114-Status: GOOD (  10.51  )
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

On 28/02/2026 08:56, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
> There is no need for an extra compatible line in the driver,
> but add A9 compatible line for documentation.
> 
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Really, so just just ignored my feedback?

Shall I NAK your patches so you will respond and implement it?

Best regards,
Krzysztof

