Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E90C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=; b=wtrz0n+0gMwuR0mkfmZL5qYoYT
	I5h9BBzN1UNJR5SWpHL5OaTKsy5OuZPWBMbyTKnThGMchqRKPokoyGM0LS4jGStNNOIRRJvMHPtKN
	VaFpJc0f1X4JVrP5XJMnfRhDxTzvluseLVYatqZIvaqcZEoMgorOHkmNaEYBtTM1TjQwXMcQDyYF7
	/hvgITWGgIJgVy8Xy5teyr5TBnC0baQl2J/nKjTEFm5K++9MP3wQHsNpVyGdLLBzbBYd5td68kEua
	PmdQPW9m0OaQqdCSpFMtKXxoHBZvGsojRmUmPkLWNOaIAcZY9D/dGeH/89qtwvw3T7fNMFkHzAdVZ
	nSJoERsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrdU-0000000C0NI-2wjb;
	Thu, 10 Jul 2025 13:48:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqLu-0000000BlKm-0kDB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:26:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9dOs3002967
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 12:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=; b=NXEEgYd+NswWueGn
	kf2mUE+Mon8YCT33JJSf3IUKY+Olh1LlhK/jbirwF37334gq2xwKoISTazBhDzbc
	2jf0GtiCng+vWYoa+5lP+i+2sNVux0VqjycX6naffBY11yn/U/GiGy80suvXD+Kp
	kUm3VQKes3tTfVGzPTfOozQo0wWqPESkeiof9+y7g7RgSegZ15SJaqUNtBcsCL36
	Jqr6N6nVO1FHS+dxW/12MeWC89YXJ5BlZI5Pcp5OrJZ3HlqEYJRvNnviBAMlHdXa
	HNsmoI/u3yfzKsl5BbUf2XJ3BZ2L2k0zw7zpMEA/ZRmYI0QlGKYLgiQgjIn0lLOc
	1fm1ig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bg6ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 12:26:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a43924a1bcso2227371cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 05:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150371; x=1752755171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbtxCizFqVmxij5XWo+R6iw22/lNiJfKJkPmSZ113lM=;
        b=SjU1b2qjwIefHCdKk+iDDqHRGlK2E0ia0eZfiMUtkkeI/D77xEARe+liKa/37F24/u
         6ptnwScVd/c69/CblbbiDG4qHgI1UNxAiujF+0Fte9tOPbWnq4fpJjhVz3IWcURIOhue
         tlh1L7L8tffZU1VFI1UipJ85/Mejz0Aa651C1fAl+u9yKiQeNA0yOO1usTIBGoC4riBd
         zj3SK1hsB61h5JC+YS4iWsb0hjdQsOB8reG2sLVrhnRNvqbtXR4YCF4eHTKoRZjFjnA/
         mZ5OTfCj/glvs+6YGnq5hHE0c0+3YH4JQdkOGjBSgRyp30qOFdunWfTBKkXJwcVXTZpH
         p4HA==
X-Forwarded-Encrypted: i=1; AJvYcCXgOTCRGE/V4wjv1pGozCATMTB3D8oRMwSjRQRL4YxFQmIPfDx9poICCcr5o/NQXaIR0IliZwbtEwrVtgQleP9k@lists.infradead.org
X-Gm-Message-State: AOJu0YxRHJcjkdB0EVAdaw9j2x/ey2G1bIE18z1tXcRfxdhen4DugCGn
	Pq52wyBrhlhM2sTXFe6hL9fb9n7sqmAH7S6os6pW75F6G2K6gS4NJSny212aHbABZaNYsZPPDRg
	liWm3y0zDDNmi8H5DBtqtPPP+TT90gcKj8G6q/oYOoUOi6m5epbs9g/R0y5liw3JQAU4DO8ijX2
	sAvw==
X-Gm-Gg: ASbGncvgAHTjb/1CD0bkKvmma76xXnvPMrV/qKKqbFwVM1R0w1rWPs1pVT02CcxwBpw
	U66CjupW4cKq2l+ehSHOPmQWqM/KIM0YLlQkHI7j1jY9Anpdnr8MevE+4YS3Zvt0DViuy3NUjGb
	NIk7+7XmPx05r1+FL0kPO1F6V6fZBzda0EXTFjc9ZUO6iiIqaALltILaeYMvE1tHZGetXqaKG6A
	bZfvU8bbd5b03ZxEZmK8WCbb4Gf2R8bdOmkUyOjKCogp9GGofu1sC/YkhtIbuiwa1jxq4ZGh6wt
	Vnj7lx7vJ4D8XSWWSiBc27kP3ic420ATVXfF7DzleEJxuLaiwsRXXCd94AlHmiDEuDAp0JfwHdP
	AbS8=
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076951cf.10.1752150371444;
        Thu, 10 Jul 2025 05:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6rD3KBw+n4YbMxLbNBGM2hSLhxtVZ+IZYWVEKjer3BHqjIzVfrtLkflN1y+COvTFzgl5lDA==
X-Received: by 2002:a05:622a:148a:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a9decf6af5mr34076541cf.10.1752150370531;
        Thu, 10 Jul 2025 05:26:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95242e4sm821075a12.26.2025.07.10.05.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:26:09 -0700 (PDT)
Message-ID: <1f0debc7-bde0-404b-a395-dc72ca4c82c2@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX3+niwL7qNwGn
 gIuOlIwuarJHSzimnrVrX2Ut3QbGJcsHElSmgB+yJ8TVxlaPBHTYJ3mvCwetMl043sHblUFhsDF
 EN+zjvZfDgf4mI0Ti91HUIBy5ApZ8C5ferMltFipeIrIManKkIIlM3ABM1p35k9DjNEUSekHCpx
 CG4Z2vdan/JQly2m4m56UiVr4S/qhzAlDZh5TbcX1ZtBj9P8pl1opN/L73UR8pDn2Gy1q2JEq5c
 gGRvU4az0UslYqn9G3nfb2dManYhhI8f4Hk5zK3vik5nTGzYvtYVTJKK17o4wyFggtqU6+AAEtw
 S5WnPDQ+SfBzBaS1gjaBjDdDW8/DP4S262qdIRIi7O/irLOT6APGR8PMdS8vLxPGBPO4itfUkHU
 /nhjnJ9GkVe76a15Y0tNliYp/BQgp/tH2LRJcGrBRRpXKk3iGh2nDKOCFcl21rHOj9CPyi0Y
X-Proofpoint-ORIG-GUID: PuBEkWoWaiomt5qiJ5XH9Xa7OG5AtNMN
X-Proofpoint-GUID: PuBEkWoWaiomt5qiJ5XH9Xa7OG5AtNMN
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686fb164 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sOBEMjS50dyNa0exkEgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=901 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052614_328841_BB06C96C 
X-CRM114-Status: GOOD (  12.71  )
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

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

