Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BCF9EDE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZI6un5BavEyqM1TDZRUrcytw/TcpFzRRDb/rENA3Y38=; b=hlF9APTq1tSC5duMouwvdnPaG8
	jr8LiqKOyOmPaKyucRLhc4Viiwgrf8BCi92GHreJZTlfvQxYJJrEisKJ1ITaoVCsMRksuU/0QCyrQ
	Sg2rWlsJwjsjVBGqVp2SWjVpe1mBmiA4NdDBfxI6FOz3XmUBlqZHEChnpeR0ST1Q7H04rw6sJwy2E
	7q6PpEoyepguG+QqOjwmQJ7C2mViRyduCL0mq8WV8It+gEzovEmjw8l1Gn+gf3jHCQCHLcm8+FOGM
	jHE7Rru5C3ViP9ita0fQvy6LVhhKNel3h4/5cszP1vdsAiykMyj0FXNAp9TRz6ETjAlgFGGTbZf4h
	AoyQbcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYXy-0000000AMs0-37dd;
	Wed, 22 Apr 2026 14:27:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYXv-0000000AMrU-3IgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 14:27:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAT82D3083122
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZI6un5BavEyqM1TDZRUrcytw
	/TcpFzRRDb/rENA3Y38=; b=YB5i6dT2eGcXvox8T92EPViCm0RU+bJEYkR1HOtJ
	6TwEV5POcOa5q1EftoUHoKeSD6OVF4yHZV4+mERGTVKP7XYiuTshKDei3ea69Fx9
	4zG6F4ehO+SS2MdYx70+gObpVGaYwex6vWr63VdId9bd/FDvyxdJgJM9ptf/3BGE
	Cq+Nvo+qnRbOB7a8CMX1wjqhpwEQLIEH7wGpqae3wZn1nQXdPJ0npZVk5GH6Fn9s
	NlBzOZth+MhCTqfeZ0s9nEDFUYoeTYjRNLs/JOHTowf8P+dDO7DpDAwqpw2b8V8+
	JoLrzi15Y/EkvC/IRKfukcXLeX/jRjgSgrs41fVuyt133g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmkw7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:27:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b454cac322so53365225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776868038; x=1777472838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI6un5BavEyqM1TDZRUrcytw/TcpFzRRDb/rENA3Y38=;
        b=YJr+infMCCx039zqZfZH7pyBgnqB5JVWWvtEhOogo3yKY/QBKKB3tO7X7N8Z9LdCnh
         gqqtPKYjK/k3d5Ul/lgAbPVp9HTO+MyNPoAgArLe2md3+vaFSBaCh6xgJRxi0/ZRlJOr
         A7cjD8DMwlYdfeqW3EkRPpTURBRh2Mtk5+x/tmMWB4nTjy8OCVFhZgxRXkLEzi49yra0
         Jpf2bcK9WjO0qt3qIDwMaw8Fns0RxvtVVbjdzpkv1mzl5SdkLWK6Ah8DhXoPQeIJlErp
         a5HZvc3eVvs2H1N6nLq1IzRzw58xoyy7NnGfKDKGJQWun9kkMOtbL9tpLTRdWrVWmhbX
         z0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776868038; x=1777472838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI6un5BavEyqM1TDZRUrcytw/TcpFzRRDb/rENA3Y38=;
        b=TNDVPdkfbUo6xWfCD3Cp67ZwEO5B+INM4J/lA62n+6FdZXQyq04SBTu1/cLeVdrLuN
         4s5J3AORoB5rnpkTKhVcf6zPnTpKvOgxWepQibZFG2x2kdzWWM+9CSbZX/I5s3Yf3UOv
         jkn4tyeJpmD4ed0LR1IGr3OYB7tSPNN2lGiLxipBfkrwgiie8Yy2J1P2Tkhh93ddTqq1
         dyjEWQ+xDMybCer4dduWsxNzVze0IaJausG/5GtvAX7KDVG3hjxwI3pzve24FnTQSsPQ
         hE1gansUuF2uVKfsrwGajRxLXHyINwc3eAxORbvUfFl13yKKZWVNdpW3ahPZo7fsO8E1
         oPfw==
X-Forwarded-Encrypted: i=1; AFNElJ+LDwXiXvEyBD9QJC3dNV2eIk5tiMXReh0o6dXtHyQeEXDJ90lguKbv2+d5euf5+6QjF20Q2oPZqDbCs4aZEYfB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx915SsyWSYAooGLvUMe2RXTGZnFXLZ88TNFEfVbrKYztfmN24p
	ZTrpi1H7265FDAKUBpITd7eL9Iz2rE5BfaT1LLeh0QTt+Dwq9AuqE3fcRxwlEsuzceSPiLXJlTo
	nzKwOEl1d+TZ16B+wnZEPCm2xbHstLo/e6ltRer9sHnso8X5gx7aBztViJRLzOlPJ2ZPymQu/ZV
	xqAg==
X-Gm-Gg: AeBDieuuTOaISuLMLpxF51JVjM9ozK7EeHuOYeATBT4X2wdNSJVX3n/YTU4QGxa91WG
	td6PZecOWsRE+FF16MEZ8JKO8Vcq/mxg0B++ABc3iaathgzXETMH+/wOqidaLT7GqaSYOWfe4cK
	OhtUJvVKXKET4h2ldsO3u5p6wlq8vpppGXpmQjGa0TmGxByLzq+7RhndEG4Sr4S8pttl6hKCONV
	tfEvmYpgbwpSt4wRPHZvbtwD/YCe7wTwSCoykrRfJDoiLRFIn2Vg3zxXBE/f/OtgMtNwiIhS5jI
	JsuugfoS2i5CdeguK4J3rb9GbnRknJ9/xgoWXUjBC8HtBgf0n6dwwh4Cy+mkixqdCRygPUCmcnC
	AQzKQQoK1k3M+cNBel7L6KhGYEC18pSDwPpNMn79EbrgjwbFSoeOZkaQ4DzI=
X-Received: by 2002:a17:902:d58a:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2b5f9ec5ea7mr239645395ad.12.1776868038365;
        Wed, 22 Apr 2026 07:27:18 -0700 (PDT)
X-Received: by 2002:a17:902:d58a:b0:2b0:ac1e:9737 with SMTP id d9443c01a7336-2b5f9ec5ea7mr239644405ad.12.1776868037484;
        Wed, 22 Apr 2026 07:27:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab40786sm180030785ad.79.2026.04.22.07.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:27:17 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:57:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom:: Fix Hawi compatible
 placement
Message-ID: <20260422142710.2f6f2oijbsjojbmi@hu-mojha-hyd.qualcomm.com>
References: <20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com>
 <d1d24380-06e8-4833-b893-631c063d77ff@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1d24380-06e8-4833-b893-631c063d77ff@oss.qualcomm.com>
X-Proofpoint-GUID: sTvxVempUWuAbS4utCdmH6fwM53OoGpD
X-Proofpoint-ORIG-GUID: sTvxVempUWuAbS4utCdmH6fwM53OoGpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE0MCBTYWx0ZWRfX541n+HddRP37
 T9Ge+2jZfkfRae64etQjytFU1B72meC1+cG0IKhJqOxAoxP5TL8t+uPm/CDVpoId47gtyPcEXph
 aS9Bc/1KRZP5VWYVvK1MYb0L12FFZSReyGAszuZq4tR+0tFC5P9VUFkvdoln3latYh3gzmesKgZ
 JL92f9OHjuhuCDWLYEpOZMlTi5FSHEvXkEkg7MJswAhDNUbc1N7ATl3EXFbqb0vda5yBF54H/0T
 wG9eEwAihN+9+T0T8HFjUPnktF17Z20K03yO4sE8SnBp0lMPGiwAdpad46Yem6QH9zdJ3A8toj9
 6CuhAAUskvY/FOaIG3G1z66Zd5kC1LcVFZSc7LaJPwoCjZ/mU5M72Mde5tKTMvqgK5w+FgQXzRM
 2ENIeyUxCHDYVzo4D/MARSpa86TWAvwEKIPld4xOQTGElpG7PstwwlCq4Yx1PfrvsuQhD6QMVJC
 MGS8cT9pwm1oYsXUwWA==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8dac7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IoJxErfbLMQlTqDHTqwA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_072719_846741_1B6F0C8E 
X-CRM114-Status: GOOD (  23.58  )
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

On Wed, Apr 22, 2026 at 11:04:09AM +0200, Krzysztof Kozlowski wrote:
> On 22/04/2026 10:33, Mukesh Ojha wrote:
> > qcom,hawi-smmu-500 was placed in the wrong enum block of GPU. Move it to
> > the correct location alongside other Qualcomm SMMU-500 compatibles for
> > CPU.
> 
> How could it pass dtbs_check?

It was bad on my part.

> > 
> > Fixes: 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 06fb5c8e7547..ba9ad1f5a8ff 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -37,6 +37,7 @@ properties:
> >            - enum:
> >                - qcom,eliza-smmu-500
> >                - qcom,glymur-smmu-500
> > +              - qcom,hawi-smmu-500
> >                - qcom,kaanapali-smmu-500
> >                - qcom,milos-smmu-500
> >                - qcom,qcm2290-smmu-500
> > @@ -93,7 +94,6 @@ properties:
> >          items:
> >            - enum:
> >                - qcom,glymur-smmu-500
> > -              - qcom,hawi-smmu-500
> 
> No, why? That's for GPU. Why are you moving GPU compatible to non-GPU place?

Earlier commit was meant for CPUs and not for GPUs, hence moving it Or,
Are you saying do not do the movement and add one for CPUs ?

> 
> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha

