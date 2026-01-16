Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AD5D47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=; b=hkSfxq8QZxV4lds0MJgi4B2jjI
	Z60IG8gHfRynW/07h/2Dy98RxFwT/EFj69O9V+3L/7biwU8FzEljjboddzb3aiYkG6kyzZEc6IKK/
	lvlKjhVSoJQeFYOtbPQkxSohTlOyvkD8b5WDyAhuJcbCl2S9B1bsy/eP9KpMA194XLS2bkUkouWV0
	dABZlKsEe8dsqWIQnPGlfIbxilY2/VaYpKyNl/+Q95+PVhU5LyKuV4JRHrYcclRVCGDETsYdzlrqe
	yxzMAupN48TZAr82rkGEyvi+wvOoplSCCz6rgtKHZEQJMKm/E7yOBvWLasbiDeTBxzSBKsc97Ijz9
	ahWd/BIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghYe-0000000E0FI-0qu5;
	Fri, 16 Jan 2026 11:00:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghYc-0000000E0Eh-0ZVB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:59:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8M6Da4100795
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 10:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=; b=GzcbB5Ud3p+q+RYr
	8G9E3u4YpMb2z9On800o+85X5W5g4CuhgZ1c1PEWHZWLS+eu1bW0Yu4drjWY4Hai
	oCsJIzXRMPk8pYD5oyyFNZC6QndmUtiGX/QZh32psjqlmZnExXYwQlHkLae0MlqL
	7pzRLa83c/+wgl6IsHuT3nABhshR2hMUYGtJvBUkJtM3p1P8KOErIK/m+bRc5HP1
	GD8XOt/+9N7k8R7A778FVdinVLEWDfF6dvIewz/+2cX4ToEOE97nl50gpHeFC4oG
	I5UDoz8wJsOTr6FujHgGupLf8V0KGhWpkAfb5+5ImLxuY1bmV71IaFZnStCU/gUH
	Sa4+YA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9751utc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 10:59:56 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6610632db4dso5231466eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768561196; x=1769165996; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=;
        b=kT5HpwR32fCje0wErCtGs7kZ0PpR/IZl9goIR7re4KznGn1FWHh/D0LsuPf5vlHUn+
         JEyRAXCRyXmaNL0kw9LQ5AfsTG/l5D+DssrJFoh4MYEusjdEyy2cNrWRtla+DciW8tGZ
         UBfLXORz/f6UXogo2lpyLTgGU+jdId/J0UwXcHUAkANb22YQ1TVsox2mTX9fqUrAgV22
         f0Wan44vNSMUz78crMrsEE4yaUzNNTWnQMidf8P5JCDETssDchPjxREVrXv1U2CS8H/D
         1qin5cYsl7WzPis85IOnQ2a/IWxd54IRA3NV1bL3EcTd8vJQDH1dWyqVzLIulwVZnv5o
         JzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768561196; x=1769165996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXYF/SU0x0cq4kg0To9gqp3URoD3jz2g2zAKZXrW05Y=;
        b=QvX+At/6pmbzKHmoryWLh0toPq7tNW1oaAjbd/ypgVcOzM9MRfjhtfqs2HKLKIXIb9
         YTvOOCraYJMqCArlNyE1dfN6Va985S9+CmiIuj72A7VJNKtH4F5vLUSlnrfI3xApKN2F
         sVhUTUKwuWrLPrUkw/HROjad015iS31BCRnkfHiS9nPlWiGoOwpg2Zfvt9X603yPKsiz
         Qih+zaWCoyLxjLxtjgi1+9wCBZ1Y+tCQJTLJjYhwQdC9dwMUJOKzdlf7W6GgjELW6gqa
         UmYD0SENFzWdusSrN7ySnxHoFQk3SuWoP5AGh5qIgsUbqwtu2XhvfR/KzIdbJLNkNk94
         Jndw==
X-Forwarded-Encrypted: i=1; AJvYcCVfDBsPygE7YGj5NJOr/s+do/OBBwJb1QPPXxG1rrnMiDnKfKx7aOBtNS8ikX/LmO+WZJbOyTk15qnKd5WfNPC6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzks+Tyh9sePnqFYJFbBX7TYqIuZyhbUYGR9hJV0byZGTGLxZL2
	0K1XUB4SBGsa4D6zRCbKnBdc4vBxmsW19IbX4f92w6f4FLkauehP6P0UzcZIEY4glNRDSDJNygr
	82Mg2NNv3uNWH9C2YzPd5VWYruevKLLeIMqE26xnWAMwmpXTzI2qi2dF4tL5IiTs8bGoB5AujMe
	WOZd4q98PPH7HmZGSRQtq4GGYcOZW8HTRCBOmYUKlpMMuaQ4U2QEN/
X-Gm-Gg: AY/fxX7abKPEIcuaBcq1Ap95gcCWhTELbUwCw7mSiB9F1DjT8PxELcIpWkaOWkAKqJP
	ZWUVHsmqMBoLqodSVJS3Pu2JlR9uOo632c5oZpfsaMHNyDFr9cEF8PcT1cPnsTxfZaj2c8ICKEz
	4vfFKHc9BtKa4PzsXcsYuBCVwITld8vIE0tPaYE8CFCyQH18SZqEV+A6GFfrK3xY297UIQwYtVU
	21vOmd8AF0NsiUhNZNaGS5j84vYuKUf/6JPL/Wlub9mOlWSQE5gU8yK
X-Received: by 2002:a05:6820:4410:b0:65f:69f7:d0e3 with SMTP id 006d021491bc7-661189e5644mr616422eaf.84.1768561195648;
        Fri, 16 Jan 2026 02:59:55 -0800 (PST)
X-Received: by 2002:a05:6820:4410:b0:65f:69f7:d0e3 with SMTP id
 006d021491bc7-661189e5644mr616407eaf.84.1768561195190; Fri, 16 Jan 2026
 02:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com> <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
 <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
In-Reply-To: <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:59:43 +0100
X-Gm-Features: AZwV_QiWfPjW_f8oYcCD8lMx6vbrDji93S-M42fv7xecvQpuV1cj3bM6NcGZ2oQ
Message-ID: <CAFEp6-0nVaq2qEoyBuAUpEQZ8Xm8ENJu2QAEFbC0h6XX5JmmoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MCBTYWx0ZWRfX6RG6gXwnFGbZ
 GpwX4U0wQje5CGCUAkyzP5TwiLbRAnJ6tNDK/OzwyJbzmZXy5AB8h31pn5iwQf31Wz53glO/mRt
 x114m1eSUfjlNRoZQRoVAfzpE629eEsh8yimOrxAQOZbYgoYKCtth2caYJEZ1ys0xr8wWKZypdF
 38yxLKizNK1lRW1XjzDRqim021FMC03LFO578oReopfaG+9+Ndek4BLHhSRSe7gkoHRLQSiv3IJ
 b/8fv0rY8Smqmd//e+qAH35RJAvhdpfIxUoJeMiBO/euuJXTjQifi8YuRN9fH5UTVKciKTB1vjI
 EgdZ5v2zLWIrn/zuvkoXzwxdOtKEkdbsoWRoStvct9usxx/u7o7raT26SEL2XsvG3aW12O03psc
 nMh2c9flWVeE7wpTeTGBo8zMZBq8BleolasyBG8hEv/iDy0h7KQu03aKRHEkxtkWCUuetVZOELV
 oxnIDxmLNe5h1eeMY+w==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696a1a2c cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Oz61Ga8zfdW3iksW4uwA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: q9sBW-5h-XkaIamybFBFD8cc6xqf6I1S
X-Proofpoint-ORIG-GUID: q9sBW-5h-XkaIamybFBFD8cc6xqf6I1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_025958_185587_3DA85060 
X-CRM114-Status: GOOD (  31.53  )
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

On Fri, Jan 16, 2026 at 9:34=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 1/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> > On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
> >> Add the sm6150 CCI device string compatible.
> >>
> >> SM6150 include three clock:
> >> bus: Bus clock responsible for data transfer.
> >> iface: Interface clock responsible for register read and write.
> >> cci: Clock for CCI core operations.
> >>
> >> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> >> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> >> ---
> >>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++=
++++++++++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b=
/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3af=
c68ff437c0435b69a7 100644
> >> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> >> @@ -33,6 +33,7 @@ properties:
> >>                 - qcom,sc8280xp-cci
> >>                 - qcom,sdm670-cci
> >>                 - qcom,sdm845-cci
> >> +              - qcom,sm6150-cci
> >>                 - qcom,sm6350-cci
> >>                 - qcom,sm8250-cci
> >>                 - qcom,sm8450-cci
> >> @@ -263,6 +264,23 @@ allOf:
> >>               - const: cpas_ahb
> >>               - const: cci
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sm6150-cci
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 3
> >> +          maxItems: 3
> >> +        clock-names:
> >> +          items:
> >> +            - const: bus
> >> +            - const: iface
> >> +            - const: cci
> >
> > So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
> > existing enum with qcom,sm8550-cci.
> >
> > I asked for this at v1.
> > https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel=
.org/
> >
> >
> > Best regards,
> > Krzysztof
> >
> I raised this question in the previous version.
> And got reply as:
>
>
> ---
> me:
>
> +                       clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_CLK>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "cpas_ahb",
> +                                     "cci";
>
>
>          clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
>          clock-names =3D "camnoc_axi";
>
> If this is acceptable, I will update it this way in the next version.
> ---
> Loic:
>
> No, the idea is to name the clock from the device=E2=80=99s perspective.
> For example, from the CCI perspective, you typically have:
> - A core clock, clocking the logic, which could be named 'core' (but
> 'cci' here is ok)
> - Clocks related to the bus interfaces (such as AHB or AXI), which
> could be named 'iface...' or 'bus...'.
>
> This approach clearly identifies the role of each clock and keeps
> naming consistent, without depending on where the clock originates or
> its source name.
>
>  From that standpoint, some of the existing bus clock names defined in
> qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
> like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.
> ---
>
>
>          clocks =3D <&camcc CAM_CC_SOC_AHB_CLK>,
>          clock-names =3D "camnoc_axi";
>
> so is this acceptable?

My answer was mostly meant to expand on Krzysztof=E2=80=99s point about clo=
ck
naming, but it probably ended up adding more confusion. Unfortunately,
we originally picked some poor clock names, such as camnoc_axi.

So, if you need to introduce new bindings, you should avoid repeating
this pattern. I initially thought you were introducing a new clock set,
but apparently your device can match an already existing one.

In that case, camnoc_axi should simply be treated as a generic bus
clock rather than taken literally, since it is clearly not AXI in this
context.

Regards,
Loic

