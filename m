Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08808E74915
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=; b=LYUlWAVtefYnBbYsG2CtNJPopa
	EyHfV5MM9Q8QuS6t/4n4DNp6ijxCulqizR4/ucARrQz9H82eldzdv5v1AyAj5pN3O8oGaAucElQFn
	PWLnuDlFNBShRbaDY5pPGCnvXYmuFg7yEgJDakiAjGedVFBlrmF4hxz5jyDJgs2NdKrZ/FTEZbc4o
	Dqf0D9F59/DX900Zw177FOVY0RoQD1ZRdw/GYYj9nCAP0AAgsIaDrer81fEMhXGi91o+DM7dCek6i
	c7NN/Svxn8WSpjWSmPv1kusogsb8ZrBhfxmgu/0Tn46UQlyEJqCB626eLxY8Mpa691JLEl/m48K6/
	12AWNnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNHt-0000000Gl72-1QXe;
	Wed, 24 Dec 2025 11:44:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNHr-0000000Gl6e-0EMs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:44:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8p5GS1206442
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=; b=ENyXk82q2DRHAObx
	E9a/i02N1zLq2UP56VZ4ZcYuJrIDkECfJxmm3yHPLJ4FNaRrTRNQBVZJA0kIEDT4
	uurRQ26iShhgPM20AC9Yclu0nPkpntl15cBSAoH+ysqF0f9WGXbX5ujG622Tt2Yp
	tQAoJH6unFNtVTWoO4hPNt0LmVq3p4QLEMn9B30wtODqBkh2W1sgggvNmAH9BLoT
	EJMdZtuwueydgmPBSYA86Qi73COR30JcYNHIgJeU2cBQgD42hNOJxz/q8r1Z922K
	Pc9pg9I36LHfqsTzBKxaZvO2f1A8PPOdly8HABCHxV4MDj1iuAb3rvHyMrQGH/HY
	pbkeCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r20df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:44:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso153601111cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576653; x=1767181453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=;
        b=Z5muQcgqboTkE3B/i92I/NRvpgK/p/rZD9+3YJkQa72aNcA6bXtCtvmDXD7l9UQYdw
         bEULHwzrs6gK2Yy6WHg/D85YG+fJSpASXbOushb5eLyfZQx3jU5mB4yae+H79Q3eE1y4
         7bOmhFGya4OSkb+kVsG4Rs6MaY3ARRRPpDb1rD9ncgziCdws9slTz/rAOqf8MmQ5sB2q
         WOgIEfuPAYBrbXgWiPnhq6XNb08G3F55dm0Ax+4wT7yjrUF9Q6Fv8da4mBKkxN/P4e12
         C+3rmQlLqXnXt3+zIbo6Un/oFQ2NgYnFglj3Ehbd7PJTqyXpHytXVlo4D16DmEPpDi2Q
         kIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576653; x=1767181453;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=;
        b=QytJSrfHmoBlKX9MkHSxsD9F6pcON2qQTQiNdpEpjGJcLdCwR9/FjZCzOTPVwDRzoU
         QqJQ7n3ETakNvcpqJ5gRNKwvfP3/yKkDnTvjGmHxjBwzH7XJs0QCfgN0rW/oUCtDq66N
         mVQrKlFzgIacNhhxNfpUXZCHV60vQkUg+GD5w+aGQ8SAMV9zcxbFi2MHQ623h8OW7Hf7
         l9VD+PFK5G9RTEz+VZ+soWgXCyi2YM1fRXXw0Wzoldbzt3UfZbjNFtm528UxZkTIZh1V
         AaEL2ilNT1YFcjPpsu2y+qXFEvsfhOyLtyQB9nJhIgo0l/QFjTPK5cqdduMcImUD5Bm9
         LQNA==
X-Forwarded-Encrypted: i=1; AJvYcCWSGcVNBApCLBqJI/CFSUiEX+WNm86Sqkfla0C0JYUdugv2VAv+Vdyg5Yc4eoWNHH++N+onWoHEIJOtpRlxgrOh@lists.infradead.org
X-Gm-Message-State: AOJu0YygdW1BYnlCVDc10N/HhrX07O2l5dDlHTBtEKMvP8Jpu6wjq6Q8
	HR/5V5zRIX6Z+LWWcK6zwSRMmYUDph68cdxRQ2zcDblJ85O7NVh+Af54ZQFSqKQod/NA/MzvnM2
	vyBS4yooxDwrkrF4SHee6ElNeeL4qaf2+TVqOxr6OVTR9rHFTB/n6J6fo4h06HvNkwZBTnL5l83
	OyGFfUnEPX3g==
X-Gm-Gg: AY/fxX735xHw3Eg+Eo0/t6Gz1NLMGxpnvHBXURBJ3q7tIup8Z+HQ+EXe7vJC5Aj9nDG
	AVxuY6QJAg+/nlxWzNed4B+rjflkELdeYQ+FlGJgywkpYY2adjuuT1tUSqJLMr7KxQwfNbCpbH2
	VTxcxupppq4RBOXLMG7tQcxCunXe0KP/h2BYsLaIu9vZjCcrD9hbHqTKxxVZguLK2aZqyLNiwyq
	oZY+L1shN205WnzLYybiFiDXPOdl1i/aGs2AU+t5mK5bNmBEym9TflJcjbimIy1CQ/h8AW0Nqwx
	Ih+dd/hU5yeW1hWyl/AOt6+miUKrtap0ORlbn4/XLKH601rmj/0/mAEWLz9fFISYeOh+FaOATC7
	Kdx0P459VBgLBcbm2lUToFxMvKMvuuijwXBDvEWe7+I8Mk5zLlLqVZK304o5PJZOl5ACKMwAelz
	I=
X-Received: by 2002:a05:622a:590e:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4f4abcf4ecbmr262095831cf.30.1766576653248;
        Wed, 24 Dec 2025 03:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs9zHgQ54O9SmPoTNaLtpDIdihVeFh8WVHEkudFfOKjPlO6nErt/T9YHjyboivLFW+6kjQ0w==
X-Received: by 2002:a05:622a:590e:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4f4abcf4ecbmr262095661cf.30.1766576652811;
        Wed, 24 Dec 2025 03:44:12 -0800 (PST)
Received: from [192.168.1.27] (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm1601907366b.30.2025.12.24.03.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 03:44:12 -0800 (PST)
Message-ID: <9a99ad41-10b2-4032-9ad9-e49940e1d241@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: zynqmp: ipi-mailbox: Simplify with scoped for
 each OF child loop
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224114210.139817-6-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20251224114210.139817-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SQldYSVJPuhUG2DfpDK-C7BGEFdVnEHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX9x8oDLsymLlh
 OAGh7HFRUmICV/gpzYuXlcdU9i9ozfGw6mQtFEnJexnctSkzwz8BFd4fy2Fi8R5Pnl6nGaLk+r1
 cLW9UvmGqqUHy8nFcPQYthGg+0G0dpO1Pdwp/dF8TWKUTChfEiKwjduzOMEuZPjndkEuBYsByF1
 GWPmFKll8aRxTBbClK79jW/mmiiDtlqmrY3Ok2kBCWHvkG8VLk9W4PXuCuDsy+4QDsk/BmXJvui
 WA+QmnxxhpRfg/cXebRaV1pm9OvYLRJr7VrE0IRbThmbnngdY9s/GQW3vSrBYIOciYi+ynBC5Uh
 Na7hrCYK3GzIRZDTfoCcQa1bXKlFqjR3ZqEBKmKrxv2nhhO1N60mmTCloDKS7NqgNwRsZOH7FGj
 vUWtF5irWammnC8vNKkQhWEKM41N/QWO6FVlKH7xM9wzhPAuUiyrzBDBIBn+N6BYTr8fvMQeuWk
 scpp2EcG/f7PUb00ZoQ==
X-Proofpoint-GUID: SQldYSVJPuhUG2DfpDK-C7BGEFdVnEHF
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bd20e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034415_215644_89D1B944 
X-CRM114-Status: GOOD (  11.15  )
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

On 24/12/2025 12:42, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---

I am sorry, that's a mailbox patch and should be in different patchset.
Please review/pick only the first two.

Best regards,
Krzysztof

