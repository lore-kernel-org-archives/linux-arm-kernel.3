Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63CFC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=; b=BM0oMhY/uwPwRR6TsLMHEflat4
	SMRI9wlLN/A9ynJ2Snx4H8mDxI7d6g/kev4i7y60vJnTI+poLymJrjMt3dwrxTGgbrLJbYyQe+nic
	HhPTz73Wyi0+noXacusb/i6Mx6kqyRIDk2IPuRWuM3zEL5Af4UfNRvWtrvKupQYZ/5mLp6ELDJOD9
	PwGSviTXK4WnHx/6YC2jPbH6hcTRIpJdgVWYPpXl9c6u74RwqoD2Fn+p1bEbQmzqM0SHyn8EPVac3
	WqZIvMMLzHTMt2XjLuBxwwaq7HMdFs7bATt0O6e+IfdJiXvHUYvV3xRPHx+J1y0EbPGZPUKh/02pu
	F0WshA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdPv-00000004Pgl-44O9;
	Thu, 27 Aug 2026 16:57:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdPt-00000004PgI-1kQG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:57:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbsmI163961
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=; b=arQpIbpcwtLvFFTN
	viG3nysBDMW7KpAs8xxPsTGsyxFADHyXX3EraVSEpdGbOr2M/oGljNT5of0mGiFl
	moPdZmBWMTs2LjM3dswcLvfLq4zfCaFxgK2MGfGTjCaKq44c/q/+WqihTzp/tB+w
	da7VwsfsMVx7YDgF5rTNwMpp5OczfG3dMb8gFdzKAMcPIIWdq+gk2Bs7/xZIsOwv
	8po/GXW4E7zb3KL4WWeDbSEauqVxaG/mD40dj8LNDtUCtyee+ieDxaEx1AiT3bMo
	prxt1dKsCjkjyd/ZBJ8Pzw3ZE4GnXX0rhCGDnL2IBjdsf7AcCwa5wEDXD6CgKtFI
	bxmM4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjft9xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:57:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6823efcso739105ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849847; x=1788454647; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=;
        b=PpAGoJkYmioFhuL3s+tlNEEIkqxaQnEmNiJ3mmJBHfjRnN1vr12cOIYvot/ATEMKZd
         I9pnT0F4/eWBzt1znckaqXC4XANUvfNdguw5fyBev0MFAJgszByHwX/i2bOnhwXwvzxG
         LGIyUKI2ky85dbmyEMoCJusR1ILXGkFtvAc9EojcgZwjO1FeSeVDLxNz84oeS7lFuMaW
         bgZudh66G6y6xiPnPsIIcX7/Ihdy7PUi3FFwPxWV/N0z0xKGZ+L1bxVnIpHlwTxZCMpO
         FlwktpXeGa/sgkIwsPXl95CV9XYLhdPcFKJkw6DJZ0JaOB4CY9hDEaTK0Ti8OKxiZKhN
         Wpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849847; x=1788454647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=;
        b=BeIbqTMJD3+3LDBot5iZXnOtmrT0b1/ucH4E/s/cCnnZWFBJAETdG8q1hXOwyrhB61
         iZDldtGjxgGNK+PBysLXRR3JcrfSU57587EY/w+PpZVKRRUisT1c1tzABR38uqzHhsKf
         Njgs5zveXmhyzyiXQGvAfsL4OvRMwwlWYcGhHyuRfZwxQ6x8m5Nnq5qbrK06aPSuGw/c
         ieTvqzSwjELFCQysVKGw3+SmY6N3gSXrKPPo25ouZ6E/N8tI63/fD+hEwteg0wDAgpej
         bO7I7ATM53vbrTdLa1/ia4v6cwLXlTyH6+Syu+h4vNOJBlEX4GlzrmYieI6VotJ/RjxS
         tsyg==
X-Forwarded-Encrypted: i=1; AHgh+Ro02dTMJ17G50UpMaBbxaQqB7jfzE6JRcUQvW2hxgNsC2j9SWNfZvRpA1imPmFmnpPq7znAYZPViQ99siulpOIE@lists.infradead.org
X-Gm-Message-State: AFuF++kd+mPss5+ctbxWwRztU/YJmcIiVlo6khCzZolU4N9+ZriIV+yo
	7lZ84NqSbOcQ/XJRkH0GT0OflpuNEg0gDj8NVRpeYKxN2AN57hzIz+yW6cGj7B5LaTcryOz4/fb
	wO2KXp4Znt9EG+g2yaGyox3fuhjWFtgijdRA0WAJhLa1aOg+sBfzJnmhJ4YcV/Ri8GY3ocPH5qb
	X1YQ==
X-Gm-Gg: AR+sD12vraaKR98b3T7FClPsE5gU7oQiS7UvU/imbdF3WW5aOnng3RVptCxvyBF2Ud1
	1tvFkRoO4BfvB15C9v81PVGwkFVNQAvS1+neDMiAvlcZVRjYJfqts//7tgNDaVKH2/2MDJsZkVq
	YoAGQRFQVtLoUaMcCRD6HSXKVkWro/JQgAJQsKwUyYdnw7C0yPLdIkjy1WeHg3paEkXj5RPTvJH
	6OxxeeY362VBlp8Q8gv1ia+e4bSZJjY9jMEuIDekTkH2MT0Y4Fp/FQMeJD9of75p6l7WAoNPAxA
	EZrRhZjpsL7hOPLkSzkKUBBEGAI0lK9+dRBP4srWY+y6pNdC2cBKjJ463F5UeyfxzfkSXS444u/
	EDPi3qHZdp/MVC6gvSOmTsvotCMC8XcE=
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr3946535ad.13.1787849847129;
        Thu, 27 Aug 2026 09:57:27 -0700 (PDT)
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr3945595ad.13.1787849846596;
        Thu, 27 Aug 2026 09:57:26 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704986619sm20011025ad.24.2026.08.27.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:57:25 -0700 (PDT)
Message-ID: <15ba1e13-d4e8-4467-96a0-8a4250c8b74d@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:27:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
 <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NujUxrsbIBRacUploX7rsKcEr3sfBwFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfXyuLYezaJN7e9
 QWylcExJX0sCj02lv5IfFia73X1uwoSYKYb445UNhxRrPK+lV68qVlevZO3jkue5aPy+dlc4JNd
 fo00Fip2k+P5MwY+YLCKN+F74Kt7JEu5znU0Lsw2OVYfEFdPd1aHTOtEhiUQl4x/WeOxj50RxIk
 HKGnNaXWKDmShQB6bMFI2wilf3fGG9xTzGC8qBBt7J48t4sxQXCQV+i6RlaElu3WsWT+pCP9ePa
 YBM1jFmmWqeF8ujBNbPEd/TmaxwLPcnSb2m8IJ1qUZfgV7fqq/XwOqPyCf49ALTHPsBvvq+3NFl
 IlAapD2FRLeT1CHWtDDljDqyBnNLkHIoByGmSTH40wSZ+7NSUScV6ALudu2kbTxqEqreOFs0iFp
 MIQAotsVo0ckJd/iZS+IqMIuyIKGhaNPRkCca7wQFrmapLvHuwjpkTZv8dSl2y4lwkQDi8gQ4+k
 dwhIQMLBOWuCmvF8SfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX8n3Uow7xKbcq
 /l2YfQvOMXANQCz7yUTzBOLr/vrsB6l56dE+k8SmuQ9WFMmCxfKfGVSr0JXHg4IRF/Orfi93YU7
 GExarxE9F9OlQyV/o5ZXyTg6jxTH+ww=
X-Proofpoint-GUID: NujUxrsbIBRacUploX7rsKcEr3sfBwFu
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a906c78 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KvNN2iZ-vB3k0q2gmRwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_095729_607076_503776A7 
X-CRM114-Status: GOOD (  13.37  )
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


On 8/27/2026 5:52 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:39:03PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> Sashiko comment was not answered and looks reasonable, dropping from Patchwork.
>
> Best regards,
> Krzysztof

Apologies!! for missing the on-list reply. The Sashiko comment is reasonable
and is addressed in v4: the header now defines the GDSC IDs
(GCC_EMAC0_GDSC, GCC_PCIE_GDSC, GCC_USB20_GDSC) and the clock driver

registers the three GDSCs (gcc_emac0_gdsc, 
gcc_pcie_gdsc,gcc_usb20_gdsc), so #power-domain-cells has real backing 
providers.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes

Hardeep Sharma


