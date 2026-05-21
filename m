Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B88CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=; b=HOekGwFcEPUkgFqcUbrd+UZPXv
	1zsn+/CLKfUIJC+axeCKZTSEM+4kKp9aVLl+/peZwpMiasBHdpBhfYgu7C0/tKkZ/FPkCsSxHFwNT
	iCw//SPFLxA9EOXYSb8QHQ6dDbCzRpu6l2Fz7+cw/UUGOxrgpwTCVdquBJ4G7csQIaRq7xPdqei65
	Oq5Fno/4uJ9AmxrdhKV3Tlo5mb9b1wFQLqOoU1u2dvG+KqUc5n9TGONVtmP04DlVrBaG03qeve4DZ
	FF2yiQs/MgBmld5uqI6FFkQxUuWmlXRPinww3wRRzubzhxqDPfYGY7g3XlRecWhYyTR1nFr0jSlQr
	bTjg0uLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvh-00000007LQG-2fku;
	Thu, 21 May 2026 09:43:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvb-00000007LMv-0lQY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:42:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kZI3343474
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=; b=CgV7CS5ISRGlcJc5
	EPIcW6ld8HANe0+HZvnNfMgu8mjJ8Ux3P/RP2abyU7W/17z8t+KhUjwmi4vr3fFO
	M6nKuFr54Y5n/a8/7WEtdb+rtckZnI2tTxRAiH2yoV0ysiLHwcjFpt2D+0v8MXdw
	Hm7Sr2jorymP541/aKH4NiiCUQHKGrHOoezZWbOvdAfpn5smEaLxNaoYkiUTSWk+
	bpRlOFYBCaLpTJNXpmx2zGdQ3+FPgMqfiqq93lovZ0XS2SxeM3H3VpPNbYYsq055
	bOYR97uru5SVTK2d0ckmy3mQyBI+bbrWHeLUrXFIPg3wLnZyv36ra7tszlDE/gQX
	69KIXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrnmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:42:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914ae48993dso48285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356573; x=1779961373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=;
        b=aZH5S8LkOF/VQJplyUPduEDShJA5i7uSrgNvvRWpep3W9JSqHveFVYxcObh9UUajGp
         6X2Mmc/wTzEyBe3l3COPhjiJWiAc5DFh/Ku4ZwHLxr3nK7nBJQ/d8+hwwlL/XJaDBadQ
         0rEhBbHLH/dN48Zvg1DvXMU0Z+LoZqFV5dukBMgUZNMIOPMXyGF8OGHq/SINZIm+vzie
         QZXjR/RcV8PO4pSsFZQZNjEkZQ7kABf96hwezVTwyP679eVPp8eNXUOjgNrkbQGFT1fs
         gHLjV/u3jOQtK0oCSSvjT9KKUaMtWMA8VrpnhdXyJHkS4/B6Q5p3EIjWycuWfmKg5lhQ
         NIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356573; x=1779961373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBwUd4KHsO7tlBa9Aw/UBAV2IQBpN1th6rKIVuFZ6rM=;
        b=kMrNveb8HmKD6c1TuQOQkOgA2PJqMbMoQTleCXlrAvkqs3uqhnGLZRZwJjr7d421dZ
         KNKhIG8mJu46Yl8liFrMFZ91uTmrjQ7E7LV00aFsf4SV/9M6mpkQMiDt3OW9imaJ/fku
         exPUMQ68oiBlzFXl39PNOz/ZOgoPdfouLDnTNmTooV6IvOjHhYzVG+bEqY/yoH2Ac/1Q
         Di2yJfpxukQhQKPA5KHdVcKLblehNZedLR5Jyo3MYy5SaxE3xqkLFAnSMcb6lQcZPf/G
         1zVKidIc96p2fA4YdG8BL6XAloIZ+dnOMa3R7iORdfgBR+dF+ue854HLDs5lZg/dn7m/
         f06Q==
X-Forwarded-Encrypted: i=1; AFNElJ/hqlOTRBNGOC37x6dvKqAreaZx/v38AjhTg/3ogghZPFf7c8Gma8FnzBdIVGVZsGnX1qLFz8PWRfxXvjeDJV7/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Levg6GehWsfXOxXpgwEAddtrTIRIVNUHqME8Z/6DnrQpB7uf
	bPAHkfPT/chxE7k/t4wCSoJO6z5wVYuQGLxJMkoI4C9oKBzjIsqY/yYvDm0DzbHMyqfeIADYNrJ
	P5Yo5rGFojg+kGmIvly+8q9lx9QpQUanIJNcww0T4388u9bb9AGYpLYKo7eFdl0wfVYXu9un8Vl
	TJRg==
X-Gm-Gg: Acq92OE0MWiGymIB8G8pz44Rjt01ufbako7bU6jdqF/d71lEU/jalHHR+DQEPTfBlJg
	GGzLTZAxn7dJEh+HokX+0be7RWUcpcmk3BorLWMNwkBww6ncCDj+YZauaBO+1WavnK/02YQUCOE
	jqWwbnqTJzpTc1ndJCxUei3804gdTdXSt1U+aiCnLQDbP5Y8TTU8owO3LR5CjtXIwEDB4SugbF/
	3HiU1DOhGcUDG+K2G6rC6QKvuD9PX2w9YrSP0YY4G56u6NQ/8kXfRV4D0jgZYx9oGYwJqJIt6hs
	JsdpOHg4BM0/ffuO1BPXW9J0UGS3EcSuQ9WLmZybwTEr/uiBveVGJfIdzGWE+eGIMupFDmjAMOx
	y8HPhavb0ywZ2wSGAaa3YV6CwBEdLFQNNVqucQ3DgGj+UfLs6zNdL3fXonuuUmGxwOmAgIC/xhD
	cvFSDZmmSmHEP5Pw==
X-Received: by 2002:a05:620a:3193:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-914a2e3e411mr167448985a.8.1779356572733;
        Thu, 21 May 2026 02:42:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-914a2e3e411mr167446985a.8.1779356572203;
        Thu, 21 May 2026 02:42:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aef37b1sm22701966b.55.2026.05.21.02.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:42:51 -0700 (PDT)
Message-ID: <907fd71a-7053-49eb-9547-592ef63333e1@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] interconnect: qcom: Fix indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260515-interconnect-qcom-clean-arm64-v2-1-adeebc73596d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-1-adeebc73596d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfX4gSjw/ym7ubx
 ASsHi8TG9o3QS+GcxxDGYhDeQPTLSzdqnQAcGFvsQL2mJuJAA1Zn4G4pDSCfwjqkZuNw6Tp64FO
 thUkF1gEsKXDUpPzddGwLAfAMxSKy4DMRe2464fle8Y6QSJunSJpyu0+XvbZ/l0bY5frySo63e7
 CiLth2kTXSXS42UBpTFK/F1QXHoIHmE2dJ34daOUT+v7W19roBRBICy0xjKLZPrKaMLVj4thRCR
 o7eovehyy2wRPIlyH9rya9rsKyEEmqWWtLxZ5M5HY67Tt5bVqEvL1knyIgbjgesweEk4Z+b5WIJ
 PFVPn44aeZm3IniLXPiB1pCKXeY5hDqoatETxgJ8tahhskp47nghCWTRGZsM+fgIM7cIfvpDERq
 AzK4QeLIP9JCm0AiR6n1urif+KjhGExgh3A/NqHq147j18h045N7Pm73t1vCt7cEq38S1nISZgD
 n/C9aenNZgvE+T4Psmw==
X-Proofpoint-ORIG-GUID: 7vrYBl10vZQg0CTAoPSrsZF16dmixhng
X-Proofpoint-GUID: 7vrYBl10vZQg0CTAoPSrsZF16dmixhng
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ed39d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ewqw0S68lcnLxXb8CmkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024255_361816_49727C5D 
X-CRM114-Status: GOOD (  10.13  )
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

On 5/15/26 2:11 PM, Krzysztof Kozlowski wrote:
> KConfig entries should be indented starting with one tab, so replace
> spaces with it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

