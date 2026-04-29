Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70949FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=; b=3kYUskLHBwOzunw3/hCc5No3dm
	pM9NsHrEhl7sa0t3532VUMuhBBtFJA71cA8/srDxVtDksMdVsLGGN6o5gq0Eo8GvyfMnP3d0g4dfx
	VVnW7Xv4rnBsxRP9zETWLrkD+NzxsDeR21jVL0y2UlUJlMKCSG+li4/RgtnlqNhLM4I58J+VVqHTW
	/3KxaAArKHpiHftYIMiEs2PO4mYC55MpXdagsUMM7P8rb6x5CSNxOLgl5ar9M4QBH+TBmLuijSTaO
	VSZ5aX1Dg+1gynB5CiJa0Dc1iril+O2+uy2at6Sy1sc2MvWVTI6BH9qeEAW/PCrr5JHa+6NKxGpr/
	ilsQ+3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyDh-000000030BS-2hGj;
	Wed, 29 Apr 2026 06:16:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyDe-000000030B4-1oCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:16:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6CPsN3385709
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=; b=CNrT2uc7JYCfvGWj
	bBbezwbE0MDKJS23IxJwAZ155Lp2Krht/WgK5bDQEupnCtzAyXXjogsBHjNX/kgP
	CSInl2/H4oGqSlih46xmKTIhgjLXM0NaH5kUJ5riaMarHsZwMdvBK+4CnIGHkM/m
	Jy+jImxZOIfxc8bFNw1pFU2OuesjhXAZAvXMFVuKZZFiwMS9r3VKeu/JdNNHqIK6
	zaSR9aOHR4NEsbxfpTE86iEScaVJzICG64QXYcLXpQrR2gzJ+lQ+puf5luYFU1U0
	8kUAHfL+A+UJt2p7eS/97z9PHrjxDAVJVjOs6AQJGxNL/BLPuXih6CEAUPfz7SKf
	SjKEww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1g0fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:16:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso258749211cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777443380; x=1778048180; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=;
        b=e2UKBHq1leI82tl+tDuROhm8rUI2BTML4+RFCE4tBRn3NiJQ4s02kEMqDEjdNjaMJz
         +XfJcewL+1Il9Ag/9BBXpMcCopVebv25Nu5XiRvEO+upPXgtT3ofSaLeUGWIkoEBqY5L
         5HavcHR4Iha8VQQXSwjDFjJIvNjqirhkP1jC6S4L+PRjkNjY8656Tb8gtcXMe7C9lHzJ
         5kMXquC02g4Np7B7WkvHN/psSJ/trXDwWnoxst1bAG8mtW+853OElDLbqU2OMpBqI1w4
         GLdxrReY1OHgM77MK4hMa0Bfue0nHUvrvBSPqRRlSDJ0WDu92vwuUUfuDu2+cuV1Dh/A
         fCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777443380; x=1778048180;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icT9YAJFov2exmFPJXiPcjch8zwqjp/K5YLC8aHa8n4=;
        b=V1m8d8Yk6xnrZ0ub2sIfJ8DfHSpDJbcWN07K1RVxW4iMMBJj3sdrG0AOtffQKCK9J1
         A8M0gn1u14HWGgwX7L7OmCvC0o42bAvFnbV+o7WsT/cIZeKxdQWLNsU2vtRtTIN+nqRM
         t2jcEO3eTimw2hHPkYEEjHpV/7l43DkXHBtS1zSOsf/VZSR+3bxIMGb5raME9S6ZTjBp
         k//SYxaM9z6gVmnCSAb4VOv1+9x0wp6g6Bh82vDP3uGydbPKMGzAtWSfDx3bjjzniYfL
         kUo8rH0qrK7usHkEX6P3ES0cQMcmWBZWcoXM/xUamqfPeUhfxgbw0KjVekXPkQE/stiv
         jUlA==
X-Forwarded-Encrypted: i=1; AFNElJ8FBTaR0UmUU3jVDDwNrztQA109KpQYg2naEHBd3Z+lHdapkor6uFN7FCXtpTrlpIiX5rUvF2wFzd1TfFgiGkct@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1YfsiNWBlzTkZ9cKvvFRfGn52HsiPxJgDO05EgqV639G6nXht
	0QQMm+1GDvjO2JNVjku0CFyzwCqdnP/tWw8CvdxEPIE3t0IdqKMB3ik815QzEvGCHNb8qi14Abf
	AUh35PgEFCTAn2rc56yXYLTMejvoJ4A7/XU2Ig7oM7ghp80PReucp1O/k3WXN6R4oNEg+u22uFj
	uF+g==
X-Gm-Gg: AeBDiesBEP+mcn+VapbuHLqDQbE6GIj/1cpffXgm5SE9Fy3NjBOsvik8awzDj3JCPmE
	c78ZbmvBmEkRdq1PxdJNZEPwBlkdsZvpjwwpt7mgAEAGoPU8h4Q8jVM2ukUwjY69M1+0LxyKxIe
	vlWjs5Vae+dAuJZ49lYg9XDKJJ9SzQTwyo/k8EP60tGr86k4Xmn6fqKzend4xpbqu1F7aRNbV4o
	Bcy3+BQOD8zjDBciREByQU6DsfWQc9Kgxs34BHJT5KrRL+Q6deWEV9NLgEA08/CuO2ecDay0bZ4
	6FkmljxzSpBfSbjXqmJnsWRAwYN5UazbpSNQiaOjSTs8/peT0O5BFwsHZD3uV+RELfWJYo6aX33
	Nt5a1GQC4dtxaPZmwVpz0AIO7WdFAjLn3eI9bMyO1B9untQQGsj45jj1fE98=
X-Received: by 2002:a05:622a:356:b0:50f:ba60:2de7 with SMTP id d75a77b69052e-51018a3575emr35084781cf.38.1777443379924;
        Tue, 28 Apr 2026 23:16:19 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:50f:ba60:2de7 with SMTP id d75a77b69052e-51018a3575emr35084591cf.38.1777443379379;
        Tue, 28 Apr 2026 23:16:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d481fdsm3330604f8f.8.2026.04.28.23.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 23:16:18 -0700 (PDT)
Message-ID: <372e9718-bea1-4f20-ab86-af6f56299e75@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 08:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
 <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
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
In-Reply-To: <lccuj5tcir57c3pzlcvyjmle36alr64zv257si4taqis3novrs@exgphqb3k6tx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1a234 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=z-_RKpQUm9htusuhYdgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OCBTYWx0ZWRfXx1g9mNFRNgee
 5r/qO95lrZyA7vWAG0IeDgnpTLBRDW4VlFY2px676Nm6/7WyBH0CMYoO5XO2v4UldFnpokHPYq+
 tkklId841OH95oJX/mgR2Ec/EgpeC9rl7lbq9mp9dSSE0cd6AgWnzV6kZ2UO218NWNWmDN84IN2
 mUNI21CpOCr+n87lYFZHhO/VBFsqEz1f8aGKVHyhbCpc4y6irCYBl61e1YfnKq43aVWf1z6y2W/
 o+nQ3KesAzfIwchuysadmlPkPnqERyKkleYQa+LsK01vhmypEyPNQrLtMa67/vZZsVhKfGd5OJW
 T5Nb/PK4k2QKmtjSobnJUFec5IZozb0aFvDxuatSSIKP3IIEEn7ncCLg50LEQNWL68MAhgtHW1Q
 UuFlFI/mcZVfpnBaJZ0C8mGer7Vc1QTTLOgay3f46XXFKHxEiwMqKjDnaYSBS415xViVmBsbStJ
 n6nbM65RK5Kq73VvatA==
X-Proofpoint-GUID: AZty4PzcfJx2RcJytw7qvqNmAWfR23o7
X-Proofpoint-ORIG-GUID: AZty4PzcfJx2RcJytw7qvqNmAWfR23o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_231622_621019_DB73C16F 
X-CRM114-Status: GOOD (  21.92  )
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

On 28/04/2026 23:13, Dmitry Baryshkov wrote:
> On Tue, Apr 28, 2026 at 06:35:49PM +0200, Krzysztof Kozlowski wrote:
>> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
>> essential for booting up SoCs and are not really optional for a given
>> platform.  Kernel should not ask users choice of drivers when that
>> choice is obvious and known to the developers that answer should be
>> 'yes' or 'module'.
>>
>> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
>> ARCH_QCOM.  This has impact:
>>
>> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>>    PINCTRL_HAWI, which were not selected before but should be, because
>>    these platforms need them for proper boot.
>>
>> 2. arm qcom_defconfig: no changes.
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
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> I did similar change for clocks and I will be continuing with
>> interconnect and other missing pieces.
>>
>> Changes in v2:
>> 1. Rebase on Linus W. devel branch. This should go with pinctrl, I
>>    think.
>> 2. Add tags.
>> 3. Update also PINCTRL_IPQ9650.
>> ---
>>  arch/arm/configs/multi_v7_defconfig |  8 ----
>>  arch/arm/configs/qcom_defconfig     | 15 -------
>>  arch/arm64/configs/defconfig        | 46 ----------------------
>>  drivers/pinctrl/qcom/Kconfig        |  1 +
>>  drivers/pinctrl/qcom/Kconfig.msm    | 61 +++++++++++++++++++++++++++++
> 
> I think it would have been better split into 3 patches, but this way is
> also fine.

You mean defconfigs as separate patches? I could do that and I was
thinking about it, but many people do testing with defconfig and such
defconfig would be nonbisectable here.

Best regards,
Krzysztof

