Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B79C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=; b=yvtDW0Nog3rJbkC0IODZKK2ceO
	GekL48MZfXiyQbLUo8gtT+E9tggReGCJECZyRh9hD0+SxuZyIIDLnQ6WVNGccqz8l77ahc8258fLs
	UlXYE7QfXzovXy+i38QwQXC809EvMqEQBigBL2Cr7AD7fajfvwosnkFrSTrbA+vGDvjN7nCTUAvDP
	A7Tm3v+wd6XVdwE64e+uNB2k8j7a0OFKtyYXJh4uAZyCb72n9mE9J5AbPLcU4gc5L0kGaPvo36GMT
	HLijCCjdkmNiGXmkrNPbzqTL53cPM1zQI8ZB6f8Ua0OLnmUtcPUKAeKEnzPANbaFKPto55vqet65m
	7n0tMohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viV8n-00000005F56-2pMl;
	Wed, 21 Jan 2026 10:08:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viV8l-00000005F4e-2OpP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:08:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4Xa383229214
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=; b=bo97j8qoV8Eu4WJp
	LZfvBa2BNjPKS+Pi6Q6EzAAQs4uwvkIGPiaoKgyHQS6DRl2i/twapzEl0GULjGmr
	rmJaBFzgO/39uR502NWyiuN2kbuhxwQzdDqxKe1pKD9aNrtTjESXse9rgTuJkjV9
	qJZvEin5jY7rjKEVBi7H3FGe+cqyO3M6Ig5O7h9WpTxs/1BNNDm7Bm5Ss9r27JFB
	8RPUlqHPwCkPnuDJ5b5V4P7HyOPF3kldAvCrB4H6+iC1k3lTEEba93os2152WqPV
	OgiDenfeZznRRfeUFqrNazdn3160OPez5NggiSEG6EO8Y8IUN8quUW1RasM/uTcQ
	il9OWw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvp990x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 10:08:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890587d4e87so185042596d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768990122; x=1769594922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=;
        b=iXQFdtwlr9LUbgtU0Akvw7JM7jP9PB0denBX30S6k6ESLhk3S7rACU77hTE31Ppaot
         stJdYqkfZEYKZ3p7KmNSeo+0nX0DRUEt7DySrPfDIZ65DocnhZe7ZvapT1g3+d2NGOK1
         x3Xe7IJ0DuhTE2mWI6bSswoauFTIEzJRXkSaHeGO45GM/PB8sg4as4b8MbZXC7qNEc1J
         A0vsajasg11wEssM6e64zvz1HTwZJH9FMRwLKku9g92ClSitKfp3MNgCRvBC6Gw/02ns
         wbJoMI4ipi0cab2TbvGjxwNxDqhN0jbOLPZO5IPz6+uEC/iMz/CXx3c6VN8gCXLg9AO9
         nAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768990122; x=1769594922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63zeNS1A4Z+sO68oWo8FrXbiTVs7VdMbMNjJB9iN1E=;
        b=YYdDLS+zOa/Sk83ZfjqN+JtIuF/CckHLbDi883D2PnSRziGgBTQ/WNUqeFRDXXhlGD
         sV4GUmDtiXilsH1j8SbGH/SNlVGSbXb+hJLuzRIAHCaA4ll8GNsF/jgWWfrS1vJ5w12x
         rVqU++zGytiDlaLGep+0gR5KqmZtNo01jvIE2jzFrQcgGAWxnoqmLiNRfFlnpK4t6Ic6
         6UqPxyqcOmE5cNmszUGxnRw8IqOtBI7JRRqOp/hddanC2YDhsxDElqyQdYMs54LHLWBN
         ttVeSwspTVe5U1nKa4L+Ix2NHrkFeycWY/u5aULkqFuPykzfVU47DIJGfP412J1QKjhe
         GHQg==
X-Forwarded-Encrypted: i=1; AJvYcCUh7I1wldbQVBOwxaRsVzvyICM/YA9/W5wi2TIbGcMDlbw4kQijSf5dbdN/eviOtvcuWs3XH/JnnAlXZ4hrG1Ne@lists.infradead.org
X-Gm-Message-State: AOJu0YyXX/fwjlEp52mQFwKhmlZDxwjgjC3fQuBRdWtCoRmMyKccmxnp
	o5xeLKcLBLgGtyMG2DkiGZveKod4HWk/xXv6qQI+l+39T78DhOePC5leRWE/zHLOvdm1JtL1u3K
	hLnbkDuh4foWbOdJ5kIqSVMv5cQZK2Fs4oPhJDxjN3z/qRP811Aet04DraLWe6e5LqJVAuvSP+E
	TY8w==
X-Gm-Gg: AZuq6aJlKUh9Pw7R4vV29HYU3Jz0x4X9mw6AVN5QfYclmRo5Y/1Tysqrim/Sjf8Uebe
	EnVLvKLMZn1vXOj2h/6V7NHb0/a7GIEf0uriHOsQPObcIdX37mU8vuGTGzjGn4iRFXxOX8zwVNI
	SefaE3r76zWH7C2d/yc33GRg4EzJdveGsB4/j2cdEStCcej0W1pVqPgA52fkufYSlC2kgYO94ZX
	7IijrN8SlaUmQa2JXLqqhsnNp5oZeK3VlmYU6UcYayM9bOkr3pqmpSUt/dvvjTdor4yjiSWeABs
	mhCcAdJSGvC0uV5sM5Rr1Hllmz0DOteCifajx0Oqp/FQoqLxm8VoRA/aaAvCIo/6cVcOKBzPM17
	fKG1xk+mhg8fSsmYbrjn4HYAMGr4OT1gg7DegfUW1nT+nHVNcdNFBQodhKgXG0xTa21ZGRI6o
X-Received: by 2002:a05:6214:230d:b0:87c:1d9a:d0c8 with SMTP id 6a1803df08f44-8946388844bmr62930126d6.27.1768990121778;
        Wed, 21 Jan 2026 02:08:41 -0800 (PST)
X-Received: by 2002:a05:6214:230d:b0:87c:1d9a:d0c8 with SMTP id 6a1803df08f44-8946388844bmr62929796d6.27.1768990121368;
        Wed, 21 Jan 2026 02:08:41 -0800 (PST)
Received: from [10.111.169.82] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm103910141cf.14.2026.01.21.02.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:08:40 -0800 (PST)
Message-ID: <d15ec6f6-7978-4e6c-a752-ffa8a44a9e13@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:08:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3TC8L0VNSindxMPaRAAglNIPDowK88LX
X-Proofpoint-ORIG-GUID: 3TC8L0VNSindxMPaRAAglNIPDowK88LX
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=6970a5aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_YHlsWu5nELmUMumn10A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NCBTYWx0ZWRfX7t8RVUjIDi4U
 wC9lcDJ/zJ3ozOhgzX3twv8HkNfxwpFcYBr6LCyK0Z47eWXTQhhj+aIWgUBsV+PqD6XsY1ZxZ9Z
 YJO53+btLy6cJVmvZNZYZoNj5Cx/5+0vB3/iSyTxgrjDwZJoTJ/ZXqImJ8n5BC19xGO0lO8ws9U
 hAOM0ywsHwyVT401gGod0my7hRYEzyi/cLH32csxGDsKI6rwwnNaW1ogiajCdBW80bszUyHfMTu
 TP98hURvRH31q8CCflb5zNnG9UjfYZ3igfqQkxYyNyZ8c3mILvb/RXJjcVhl4xX/tbPjpvGk1Tj
 Rv0CH6DhKSV2rNwZ08YbIE2mDjs6fJWU/lfToaCSco7jwkpv9/f189K2uzHPIZj98NOU8uMobUg
 U5xAEOny9W9VcJAM3l3iaiSPuyQxZi1YzJDjSZjhcjLH6PFCDt6009Yhrq+KtLpAffxiwh7p0AG
 SILqyHzu09nhb9OwIkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_020843_733883_D7B9A103 
X-CRM114-Status: GOOD (  11.35  )
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

Hi Andi,

On 1/21/2026 5:54 PM, Andi Shyti wrote:
> Hi Wenmeng,
> 
>> Wenmeng Liu (5):
>>        arm64: dts: qcom: talos: Add camss node
>>        dt-bindings: i2c: qcom-cci: Document sm6150 compatible
> 
> I assume you are still going to address Krzysztof's concerns here
> before merging the whole thing, right?

yes,I will push next version to solve this problem.

Thanks.
Wenmeng

