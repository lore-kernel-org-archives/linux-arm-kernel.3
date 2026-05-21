Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2257CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=; b=bTwNSdlcBDBKga6G5vB04Ymmmo
	EkwooP205x2aV7Lp7cXmSvytTa7FEvsj5P8qoOQqtxjo3jPgz2BOyMdhYix6w296GNMCwoPPBLejp
	3AsnQpJ0Cxym28VfRCIpo1uzFiuHtxe9Rcq7z0wxDVZFuaMSDBLrMSooiZ5nhxiz9LfaULYSrEQpY
	GQ+ab0nTELD5Z9etEGbw8RlUuIOVYjBQhF3AIEjdta5Ny50d5oGvqzzv83w2XLpmYlxJsrey08olr
	3eWa7ps0M6LuN+N2g0tEK17IEJtk87KZR5NgdPPv+vmaSL9pdAE7w0uMIutZD2kASVEAEtljsFBDC
	ALOHYmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Mh-00000008Jex-1PRU;
	Thu, 21 May 2026 15:31:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5Mf-00000008JeH-1Ifs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:31:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LFKamb3451575
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=; b=lL3MIstSs8L++Vwt
	48TyqcsjylOatfqmJ1fmwliC3NqTzF1YvqzWvhbTrjEo4xKnkxnMLfKGTHlm+ljc
	0Qwuk5QTKPyF+j7Ko2K/NnopTSVsn/MMvfxZAHramz6Jm3H5uxsBLvN4hnMTuM4v
	QWVDWr7zq601Zh4RbPJgInJDk8bK84FSjLV5SbrpeGVMx2hlFZX0d46NbhZ36AiA
	mslLcE9K1CG9++bZec/p6jDkRo/JhXE9/cPZjmBug7Ub2sisAvEssGg/ZPJI2GFH
	1iHR2p7Yc4yDVyDEtiMCAltzuwL0MDFPlG9yO/llAOxjZjl1K+YLNFdzgF0jJcrn
	kibGKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h9kmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 15:31:11 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-482ea31543cso12154759b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779377471; x=1779982271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=;
        b=ZGKLq6Ow5bdnZAAUUzD8c522KKU5tg3zZ2+vVt/MJs4cUN4eKDHQwVQfoM2s7l/+7i
         QFI4piBxYFDivw6FvoYQiV+5IK0xp0SPphLFe+0tWf6y/6yagQkX11m80FwJ6hNKOy+M
         HloLYtpHF7Swr7UjReVvepvzKeN5IMRQtNT+22l3cVgdVqynKlyLxiCLsqzzCb742IlR
         +L5+JGnN5TsT+GR+ywNF/XciVnHBqRVRY+zu4dBju27EHmMokVR545lifDi3Dcff4WMU
         nxcT4ZmBn4DOi04Vzs7OU+BI6d9goCRUPsiBwlftmWJxNf6T4BkdU2HVKO1BAu5Tmzg8
         HB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377471; x=1779982271;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo2Vb5ykupcYisnD7XCsxRkshRZVeBimw4l3DMckC+A=;
        b=hOQmD+l02AIyLQxtmAVFDucihfRRK+lXCL0zt4+NL0Ws0/c5/0Cgm5Cmkw3UBgyqUA
         rwvnJGr3Hk9Hy5/AetN1UvQxOMykc8zkE9HPrSvi7dTSHTckMqU1Cz1pLfN5fhy5rfh0
         +QgtuUNvS9aL6e6SSCfHNo/e0w4RmA8PJSLhqCLAhMxwFFaghV/OH5Jh3niLrzgEXUnP
         cPedaQOwoWPzFSr6qYXFJjxQFS+MKzINcCumceduGss95s7tdvCTdnnMENSvQXAo9Wj2
         8wvYaWxz/GQwYK6HYX20l7O1GpQVCg50Pb2yNUhUvEn1pn1cg0WNqTcfCatwYIzCHhCO
         By5g==
X-Forwarded-Encrypted: i=1; AFNElJ+CwmNdRnC8MCQTpY0TaQD0z+WYJ/uDoNIqv0684l5zf7qzdZQ+OEmFO+7D5J5WCox/Wk0sK96hqVPzcLni9vjS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Bx4zYsWt9r1dE3wrnXZ1az/v6ph1Us53AZXYD4FhorEF7j78
	i9cjzEkgHZnr3Jk+nS184oYasPhmogqknvHzGYGL/jr/TQ6TED8Adg6Fi/mRmBk/p9fCLT0dr38
	1IZ566fIsUl+VwljtPPKSFEjG9K37Ctta10uy0poViaOVRenqPhMGqwpYeFitvn5ANYWDHIdAGY
	dOGg==
X-Gm-Gg: Acq92OEOD/ZGvZKNhGVQHs5BQf3FBx7RI3QEUrcOL94vYqZh5pfX5xUKcCfAqd8oHyi
	OAmWPO/xrKOsXuYepEmlHuBjjFLAqD/6P5bHpG0Sdr1mUuV82e7oEn60VTplWELZVZOEMh9rHnr
	TRCjPBpJGEsZvtib0VU7LxYymOkA9J2BSeJF1gfZukjmYzzrZrp96LSxqj/HrlTm5hohNMLZGTl
	2k258N2ZoRuvUlNar8lqP8hdsFA44zhuez+3cYxAjtzeuwjqGXnmQ8vtB74zo0R57i720sX6H2+
	9XDM2MSKoZ3bPYw7cqXvLo/R3D/wCcH7wg0iM2QfxrHzrq7rNPBnV1KiP5GYseTwFmdIUoE/D61
	JNMnJUaFotOtKneYKcDnrVA5qP/PftUCBVTZa5z1u2bWVJnX+
X-Received: by 2002:a05:6808:c1e2:b0:485:4179:aae3 with SMTP id 5614622812f47-4854179c558mr855016b6e.43.1779377471001;
        Thu, 21 May 2026 08:31:11 -0700 (PDT)
X-Received: by 2002:a05:6808:c1e2:b0:485:4179:aae3 with SMTP id 5614622812f47-4854179c558mr854969b6e.43.1779377470497;
        Thu, 21 May 2026 08:31:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm78868505e9.13.2026.05.21.08.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:31:09 -0700 (PDT)
Message-ID: <0e6a21e3-5359-4ca4-8bdc-7409b528b9e0@oss.qualcomm.com>
Date: Thu, 21 May 2026 17:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Drop non-existing (yet) PCI_SKY1_HOST
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Peter Chen <peter.chen@cixtech.com>
References: <20260521152158.425895-2-krzysztof.kozlowski@oss.qualcomm.com>
 <b83ef885-3d29-4e46-917f-26bb8490fe35@oss.qualcomm.com>
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
In-Reply-To: <b83ef885-3d29-4e46-917f-26bb8490fe35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: epFHtq3Jil-hs5EPzwb4rPfPkjbPu2cE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE1NSBTYWx0ZWRfX4QddbcYxX2cY
 LrypK+izBKV2wyofeuzgMWuKMkZ0Aei0+y00j7G5OciFPchGJAxwLzktxp0HBT9sxgW/fplovFY
 +6FTBtzXDv36tkaXPKznZHN6q7xi6Cyp9M3bu4fKk/iwXOr3pJB0yhPxzeeyVi9bR6yzhwVHmiS
 j1nL2q8qBE1n7Hp7SbwlUbIriCnrpvW0Jm2k8/oRkIwYovlCFbVCMZWLLBLvVH4eW5OP0OB27PZ
 1xtIk3PyQFHR2MnkLBSzZOg33e0RCMjbeEj9eDNuxW6AR5fvj2DNRL6dox/0MsVklvy9E0iCn0G
 GRzXzpjIawfGAlP2hBU2RPs3bhTjwi0N4/b/BSWIBthMi/VkUC1+qeq08WcK4BVz5FdIrmBMRvp
 Hb5SZNyv+PVFQWZOWpYLNMUbPaczSLd0ApxvY2rdoYioDsMkoOUjj/aIsEiwHr5Y8cuKZ6YTlbw
 PRmVqWTdRHPCRrXtb1g==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0f253f cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=5ib9d8KPHpSnOhPDGK0A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: epFHtq3Jil-hs5EPzwb4rPfPkjbPu2cE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083113_475337_11F86671 
X-CRM114-Status: GOOD (  17.26  )
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

On 21/05/2026 17:25, Krzysztof Kozlowski wrote:
> On 21/05/2026 17:21, Krzysztof Kozlowski wrote:
>> The source patch for commit f54f7979ff88 ("arm64: defconfig: Move
>> entries to match savedefconfig") included reorganizing around
>> PCI_SKY1_HOST, which is only in next at that time and was not merged to
>> soc tree.  Applying that patch caused some conflicts which were not
>> really resolved correctly and PCI_SKY1_HOST was added.
>>
>> Cc: Peter Chen <peter.chen@cixtech.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> This should go to soc/defconfig branch.
>>
>> The PCI_SKY1_HOST will come later with:
>> https://lore.kernel.org/all/20260327114628.3800886-1-peter.chen@cixtech.com/
>> ---
>>  arch/arm64/configs/defconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 094bb9cd8764..4ed684efbbba 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -232,7 +232,6 @@ CONFIG_PCIE_XILINX=y
>>  CONFIG_PCIE_XILINX_DMA_PL=y
>>  CONFIG_PCIE_XILINX_NWL=y
>>  CONFIG_PCIE_XILINX_CPM=y
>> -CONFIG_PCI_SKY1_HOST=m
>>  CONFIG_PCI_J721E_HOST=m
>>  CONFIG_PCI_IMX6_HOST=y
> 
> Heh, I see the Cix patch was already merged, so this is wrong :/

I sent correct fix in:
https://lore.kernel.org/r/20260521153003.429610-2-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

