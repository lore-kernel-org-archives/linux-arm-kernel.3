Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB9D78771
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=; b=g1gkbLfd7NQNsLCg2jGwXOnXPi
	QyNRsECFJ+MEdqifUzwHkBggpIOfwrjTyy7EgiZl4W/iHbmzAR9y4AK/o9dupS8am1WFldJgT9eMI
	U4GW5y9t/jCGJWUI/Lw36KVYr8kobsRpc731V5BVVIECShpZMZq6Q9LLJoNHAeIATfLaMXdvCyYfO
	S+DLb/fYuUCBQtTemS3BQEE7fINkA+8L6Y1C6WdFq5ty79todRC6huTWAx6Floq8mjSWkZGHbyEj0
	nzGJkp84ZLXgUmieVEBhVTwnD8vinuceuycPYfCJsX5jyKo6pUsv7EfkjSCCgA70XE6zUic4CtB3U
	XeePj0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaT0-0000000ALZG-3FiR;
	Fri, 19 Dec 2025 13:24:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWaSx-0000000ALYo-2VZs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 13:24:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBZOH63559261
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=; b=BRjh5YLKMdZQPrxM
	26ZE5uEgDcEq4OjT/Pwo7zXFvhjgkSqjA4eqs3eJRU/E/4nBgrrL+LVcifvKDyR0
	mKPNfisybKIdkUJ8K9QtJgLQNh9T+iRXjqIo0D7rolKnxfqXCiFTMr3XwtLzwyBj
	T5OS1IxUb/WilgQYGl1LuKqxHcec8x+7KKayuP2SLAv1oaG2QLArRC9ddjOx7nJ2
	0ac011bncACHEjLpcLrO4oZPN4SO89gZxgp9W/iDo+W2XmqNl3bGRcUcODUrDLcN
	AOAUzIriYa0HOpP2zmM1iwUyuiutg3l0eYr2sXDFCz5ScNlT37OtOabRlLE0+YAd
	qKl1PQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2caspa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 13:24:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so7700421cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766150658; x=1766755458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=;
        b=KwRikffZcfF3ohSOrUlVt0F9vjCNgX/NnkuKMqqoVORZSAXVcDTHEtmnbJUYYIIhZJ
         LAU+q1W38QzdAq8DMI7LqOSmHWHroRQkzDsMcw3Doe64KwKL7kAayAs69sMvPhdM+uHa
         3HtbBn8WmXXb5l/NEu6BIo7QdJ1qDKiVhbv1xudDyN4x51+H6OBfKvrxwjZodeL2fItX
         3zYqAk5kSujDIspFNyAkHd1T3rW3B7uB9P9Jw/nYhqM4+Tuc8JIr2386F2Xqt1msiZxF
         lzrNMUtn3Tnj0XNRQ+twulF0eL2FJkFu0+K8OYdU9U8hHCrwmxusTEV3CXwyEQFGxGpm
         +U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150658; x=1766755458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN0S9nUzmphwgXWKwQ35sb6kpRTq1MvBLzlcbxFESVw=;
        b=lf5asEks4x2ge1PTrkGqzNGFhglvPDuRiqWisq5vgUUvkhNVQszPumI8JSrBHtIXx/
         L+Mq0Cc2vGG1veUnZp01GkX7YGQlRC6QsodDwtAg6ct7nqfvEI2FaTOAfHRaTW56yBbf
         sy4wU0Dpj0GiU+FEf/nNY3T73z20lr/4WRxGyAPYxmI9DLUjeZywN0qRjjhGsIC7hwmQ
         IFkAAbGoyfjT7t8jQrobttchMlTgs4pjN3o7mwQeE+lqZOXT/6aecSyjEVe2r2Tp1HPV
         4/ETea2NMcDnBVEVDdC6vGkOBS6Ohhi3CNGLxbaSYmT07E7tCS3JH3B+IuOv5rTifrPP
         U4xA==
X-Forwarded-Encrypted: i=1; AJvYcCVMn//DNFuRyYrhgJjpD5IJ4oDyup2KQLUUg/C53VBDeZtnVcYol3CpRUgMTL6RHCz/HH16PptKdrwsPbfC85OI@lists.infradead.org
X-Gm-Message-State: AOJu0YwxWgQ30Y4W6Yv3Ls7vD5w0caLn0UN9f35Nj4KrJAaHDOnLbByp
	lQKoLGR/Imi0zkkhxUF5TzdcuPixl41H4LtU4JSaUGEEAIEMniMJ7V7FbovOT0XC3BMfQF8QNX5
	o14tgU/pcu3DUF+w1tQXqNfTpndggb/f6CicoLzjzN3AxWITFRz72o9TrFo1eYbCe8Apjck6ob+
	vuiQ==
X-Gm-Gg: AY/fxX7bljK+N2dEYMmbA1Yj1qOyzv95R0BRvXjqgzdDaLxQw8SLBDuu4QdlLe6CqHZ
	ldylXlCUdLlpbleHmlXSfnK15nqOM9qqt0w0GXj7JRF4hWdX3FjnRz7IukF0PzqUbnpUh5SWLQ/
	5WqIhdfUJNtGOCp0rM1CfpgyP+Kunnfu+7157lYaEn0UuvgMlK+FlasnUsIUvKs9afQmuj+F05q
	1qhJXQCGRK0LwYef069xY9QnTFdjkN9t47DMn+qdQjFPhc96mpUu8c1R16bhNM8tQPB2NeV8hD5
	nSTWwp9+PQdzKp4lNFIplJBDJOyh1RHWBBLi27l8WNbEtxssuNY2AFUIuKueFR4NrK9s3kCluP1
	un26/MGfUwB31z+8nRp1RZNd0JSTQwN+ulwa0QhgWvV5sClRCUqqk/oGGwtSVrS9oRQ==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr8304251cf.6.1766150657991;
        Fri, 19 Dec 2025 05:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAQTZER8k3jrnoeKYAUlmetrYif4/iAWP+Fg9AbI7ouvR5IbKvEBKFu7XRTnkrJk4vkJn3sQ==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr8303891cf.6.1766150657483;
        Fri, 19 Dec 2025 05:24:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm232466866b.48.2025.12.19.05.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:24:16 -0800 (PST)
Message-ID: <7038f5f7-e5c2-43c3-864c-e7ddd2e8c374@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 14:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc: Add support for display clock
 controller Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-8-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69455203 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6UiOb558mQ4H2NczljUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDExMSBTYWx0ZWRfX3UbuDXZD3hbs
 iYYtQ//jF9IRcA1UqEkNcC8T2UnRIiUu3jDnNRxrX60+R38u/Iu15xzx3dWdK6okPPU6sD+BkZc
 HQReE00I3ZqRDLI+j7whhe8/jDll0KHC9FmKwmO0nwQp3FMf5FbsoK2aZ0BPy3LbaPN2oYvzon1
 weGnfCuIfYMnLP2gkB668S/lzWl7KcDZnKlTicrgTZ5YZMCjIUuRiTBrBYfEI7WpFNsMTMzzwVg
 p/So4m+evCLPQ6TpC9AFM1WAYQzH3knTYIg0nE5xojr2RdU5WPh4yaWbxTG3suj74uMaDwcl2y1
 3fxld5tLoFGncgZwSqZHCLlfSkRT9N6LegTSfxSlyWXFhk3sfiEvn+lHRcb80P7enKl3aBHTQzQ
 kNWyDsDO2N06XjKhFAzLE5zpe710Zg3O74GkUPyba2SlXoVtuJ0Iqbo6Kg13QU8q0QMMCe3eZB+
 lTHGs3/pFGL4BAg5lEA==
X-Proofpoint-GUID: ocYkSQL_m-7Z5XxJ4vN3Ufs69dkylyZm
X-Proofpoint-ORIG-GUID: ocYkSQL_m-7Z5XxJ4vN3Ufs69dkylyZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_052419_647286_359E533A 
X-CRM114-Status: GOOD (  11.86  )
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

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

