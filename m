Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB182FD5307
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=; b=4TF6M9UdExHIq8drzAJTK3N8h5
	3VD6SPx0NZE0jWI9mwHOUsSeI5FubXj6mL3DaKXUvee8XviZy2V9GgoiuAe+2U1oQMQtlCZCVGHhV
	bYdPQIDtTTc7gEuoyXDHxOzeVRLdFDJxScWeqx9ilZG3Kkdau/GYxDkck2q6CEqYqOXPT0tJNAqwq
	pxup2qFg2JBcK6wSKNG8jR6P4xNi4ahQlLnUo4mpzz1vvsmqZyxv+o1my+beAMGn5U85xEBjobhak
	Z4Jh6bnhZHk6VyhbrpVMRtozDmTTdJrTTYqe0241Lba0EXpNuCj7JeBuN27vlyurWRYA+ATxRDxAU
	iXXvXa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvt0W-00000007wy5-0ape;
	Fri, 27 Feb 2026 08:15:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvt0S-00000007wxY-2kVN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:15:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KN9j1601270
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=; b=mYB2L8grqptsSvhW
	z+T5yd7Jx3GFFwAEFIVTlbdPpyxkuUNhMsJGywvF/N2zrpYUbFIVCGDTou55qwqk
	hWD0xvhQY4/n+YDBC7c1lex6C+hL8KlnfNrOiH6IWCOXBvlGlxR4/6WWAkkpXyeh
	oS6bleU03MwAiHOequ4rtSAjYOfHPC9O3kvOqcctqA2m1/AQtpfvKMDFZM6Kwe9t
	kLXEodG0CRORKP0DD+PwKkCmfVaaiz2cZUN48x/U2aTZf4DdakXYn6vOzbNBvN3Z
	uEqQrLnzn5bafACF91y3x/7sEON4PxBTocLAGhwRdWLjFMx0Cnmi44lAX+5PXOL3
	JjpTyA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99trpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:15:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c7a38429so1887391a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772180125; x=1772784925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=;
        b=DloubzBjiY/9oKNODawwrm7yXEkGS2zrm5BDZLlzui5cpsQdR0btuebfL3WzAlOcKB
         10xOzdBJ7K7pAVG/+xvUU+uakviVB6OQENxy994O35gzuHMfKbcd9yMeFrNJfiJlSEyk
         1p3Vo7MX8SbVe2vJzsoLtQjHL8P3190HMuN+fQm7XCWJch/O3F/PG0zQ6c+Trq3PTPM9
         NnEXFleVZNQgTwWXR1+FC06g4xjsdnVZYY/p6Ow4kwl9lvQmdgzOsqP2fU5Iw6pC99W+
         x0sXTwoh+/7ER3x4a5n3XtK6REHa4z4kg99HtAYLoCb7KZwO2fzbJaQqQF7CI3M6mONq
         3Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180125; x=1772784925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCOE+6k08NVIvU2/lrwmqv5U6ckXVUZLE4JKU3fnbhs=;
        b=B4Eq0+yT6NkqHlXzwZM2UXDqzSY9C+R54jOAYOW2NYjz5gUOAhgYzmRBr/USU+Nv9r
         1zZKy2yxOHKvwgOe5MhgGjXU1V3YdIbHExQkzyeWzqTi74mS9t7BlgumlJd6pFfXppWw
         THFRkWM2Eec5n8IArt/ly4yGQmb4U1w7ebTHdQzUi/e6iWGL5xtWJHUfKv7+Zaor7Y4y
         NTERH/x1M+m/q3PuPHPNljeOFrTCdDeQcTg82UVkBFMXfwugLitQQsLm4HX/wJ5zBg3p
         RkhuDU1x3DmTX9GHpaRJZ0uFFkSpdjVfnZTgNvDgYlKB6G9PIiIBk1NyfFY/Cuj3KzYb
         j05w==
X-Forwarded-Encrypted: i=1; AJvYcCV1iXlzzjGo4WQjcDYiBJXhfHJI5/xVenGj2RKWhkOttY1LWM3HtW+BazaLWKGHJh2B2og7JXQe3ttJIGLt6f6o@lists.infradead.org
X-Gm-Message-State: AOJu0YygZJelW6LKfO7QDgLbuxAecnRstKt/bsUyYa01sDAjZb/kClXG
	3z3nElfz7JS3NkQ5MzG9ow3wHDI2fI26iGy5QFLOlvgkwMPvzUsm3gSZ+pmKHBYxuVZOGKHfb3Y
	pqmx8m0FsZzzAEkuT76fEotdO6r+6BtH7bSRYQ5vQ11IGJck9aE/68FyAXraclYFUcenh8aLrqx
	Qtsg==
X-Gm-Gg: ATEYQzwYVCEDAeMYdpcYo3/fv4aOD4bgzplF9ubabXVUucp01i8nkacm+t4ynoe6aqg
	RKXl19YsdJhI45eYsTHU2QikUk7sR6UFKrhVRBgyPEQnc2o5064S63U+FRZhKTgdef+W2RiFXPc
	8X3Khqj/sNqByTXDBDm834bcU1j2zfvCps1fm5nDUitmt+JvsJrzYtgibf3dCvDVLq5pVanvffv
	SSjoK+0TESn6Cv2AigObqYuVr7Cv95Rrt3UDBqeBRKQoO+YeNDETp/TotGmZDhxM+zqkm45M9VV
	wfoGzVnRBSrW/zZGhwMRF/goRi4nkVTavshd6JoB4QpH+CHhaDHE27vRwvH8Mg0a62j3+hEFHl5
	HMtDaSRNYx45Gp1bobKN8xYKtEjOcg3oHdfNoLxxOs6Bp7fDAnmfOidn98ftukT/J5U6dnPANhj
	62tHglgwW30g==
X-Received: by 2002:a05:6a21:1bc4:b0:38e:95f9:8cc1 with SMTP id adf61e73a8af0-395c4601a3bmr1915950637.12.1772180125077;
        Fri, 27 Feb 2026 00:15:25 -0800 (PST)
X-Received: by 2002:a05:6a21:1bc4:b0:38e:95f9:8cc1 with SMTP id adf61e73a8af0-395c4601a3bmr1915913637.12.1772180124526;
        Fri, 27 Feb 2026 00:15:24 -0800 (PST)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b940asm46244515ad.67.2026.02.27.00.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:15:24 -0800 (PST)
Message-ID: <38fc2905-aa89-4b9d-8ad0-c289642899f0@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:15:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-binding: document QCOM platforms for CTCU
 device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <20260204-enable-ctcu-and-etr-v3-1-0bb95c590ae1@oss.qualcomm.com>
 <20260205-hungry-kudu-of-maturity-aa0dbe@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260205-hungry-kudu-of-maturity-aa0dbe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1529d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tRX3X1fM6C1DGB9reTwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YLzclePiP4DlEuITZhc92jgxrncMnXC5
X-Proofpoint-ORIG-GUID: YLzclePiP4DlEuITZhc92jgxrncMnXC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2OSBTYWx0ZWRfX0X8OAniwgN9o
 DNLILFKsC5hnl/OTvzWiJxCD63hw9Zhlo6CXera0WvvEWyRtjlEGLLy8FJU//jm187XnndlNrAa
 fB+ARGZbpG3ldbfUMHzMZz4lH/RJO7jET6uZtoyCHDWjmuO4HZsIiAciRPiUAiulQcFDszNpaIb
 Rh42nhocfRAicZCr+Ka4t5jLT1F1anTEXuWhp780UrIUzkzr8sWFYIFVXsxOyYnpzNb+mK+iwPp
 EL9JXpndM3iziv6VksKAe4f9jT4/62jJmRuR0vYr8SPb79QsUMYVz3Gg8GHVDUp65Iiiw2O90FQ
 6buHksvQlEbcPW9njiRRghJCn8CZ7mgeVTaIqmJF5Kyy/HBQwOChJq/fNXfwxMjR1KHUdOG3bnY
 jo9lI7WD5xOXXmurE9PhD9p6Qc5SCJeDmskEezWMbwHdAx2d+Zh24bt/08OdZ7xdd40Lh5Jn1Lm
 0fdkX55TKMbFHDIfkhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_001529_021016_4D25BE72 
X-CRM114-Status: GOOD (  13.21  )
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



On 2/5/2026 7:50 PM, Krzysztof Kozlowski wrote:
> On Wed, Feb 04, 2026 at 10:22:01AM +0800, Jie Gan wrote:
>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>> compatible for probing.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Gentle reminder.

> Best regards,
> Krzysztof
> 




