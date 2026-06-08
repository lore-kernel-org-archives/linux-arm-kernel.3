Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484AFCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=; b=oDxXZxrikEpTvSclea2Hm0djSt
	729cCXMlKBulbCn4IBiEyWYw9tj9OcRfirFTrHVYQlIyD9Jh1IuesFYYMPOJP+qsP39KXTwmOLxI4
	KW/4yP+O1t6a3QvH/aqb7VQNig0so5qg1a7VIPLgxzIKevfv+gfBbbtFskd47Voo+FU5KcKoZbnqN
	jv7lrKn9p/waIOxdUPZvCwDp3EsyJS7/yFglSzlg70ylKX01HjiDeWzjVCP74ivKOVUY1YTw9mptT
	CCLTiBW7yxuz/qxMAyP5q54kLz9aIEfhz7/NhzOZcdoDCSOsG3um42fw8FMYMpZyPe4Ps86xlVK++
	rM/g7Ang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaMg-00000003efq-2W2D;
	Mon, 08 Jun 2026 13:50:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaMd-00000003efO-47DK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:50:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR40b3336021
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 13:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rn4SKsuOStAQRXD00Glk2pD8
	NtpGz2H7OLN0fQ2CGPs=; b=YvJgFHCfHUmbSTsXt1NQmdmu34caGzgLNedm+MEE
	HFinemN9/tnZHwDZISbr9U5CNtl2eeg9ZFMrM1bkohpALSY9KQrNYrRgm3uWgB+x
	w+kapoBckdwGqVRyOXQOWCgKd+70I7wiuDD2dsj067Hq+W3xtuKDuiGmzTgxjWMP
	/m5/vUMFHiV1dTdkf4SDjI6N5wUGxDTREJEoqrDjqpt+qCq2TwuRnAnjvNMcwlOf
	PDTBhtZ2dv2aa53hg9GHP8mFKU8uOARhwjIwaekJyPUiRWczpKZszy/KZuB2YKsC
	JlL4u+0o7RitaX2dLASjBG6hqTZYnX046HkDZUkRuxLbSQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40xxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:50:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so1750515137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926602; x=1781531402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=;
        b=VQQo7Zp+qMpGL7DYBQvZSM3U5rQrzBwIG/PwG8P06Oq5hisaBFwp6jd6/uvHzRWcnZ
         qxI8DFqTb4QdjiRt/0FKxxAmuWwM2z5CDj8G1sfNu2GqE67abrXzzXe1AgSZK8B5+6vr
         5KLGXuh+/UOTLfi+YwJvY/KBp6AA/8TnMXNN2x8z5t5sYm3UpJkpojbOWC41tkn8/tHY
         zvQt1S+CxjfU1aoJKBpqN6Uv3m6zQiAaXN2pd5Vy88Sf06YT+7nJSz+mOh3IleAbYrSL
         lnrU25NeBq0u+tyfkn4uDmzyPmp0WC3nZvqxbTls2XEfBhzBumkdxgamKHu5a3KBNn9M
         /zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926602; x=1781531402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn4SKsuOStAQRXD00Glk2pD8NtpGz2H7OLN0fQ2CGPs=;
        b=j5gR35sDgfgx7tZUcER2WxnSNmCqAJZAe+QX+VX+97TjPRYa1yT3k5LtFXyaEecloZ
         rzvqs16qh1bKwcfBscdssqcX8S4KZ6q94r5ek7kLRwHQVApufz1tchBfdF/aRa+LRDkZ
         0th0QFTIRz100w8kIh/8s014LksPiCw5FEj7fFvoBJwop/FodvDXGAEdwa3scnLAkuCC
         F/1M1fhYyQM/NkYFfGmgdIZCI4WS+cxOnmBLsBOoLUeukALqs2ZnB5gZmctXLPufu0aZ
         mv0H6seRpsPFqOYemd3G3Dg+y2xUw6QjzHeENsMjSwf0Z8wh3zNh9RV9SIALYe4QlNMU
         FWzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ScEASThoXVxN5+5jF7tJv0fwnzalvtDzGEbscYn5ILoekb8O6ejbhVglluNmArrAFkTNb5iJgjzT8RlEZD5fJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxNZn9Z6Pa9y9afoufqDignbHGrA2nsClOu1Eb6kprmIBxqRy
	UUFuD24qr3utoBz/5aMEVRrXzY+iZzKybQ27Ta7h8BU3c0OXdHK0XjH/yxX60KmccST1Zlg6Pbk
	CNYaAuetNKUErNXu/vPC2uR/5qx3gbHM8F+MSKdCTy1GvgGCuodlyJthoVYArZopkDnXLj2qUgh
	nwkg==
X-Gm-Gg: Acq92OHfqbiZTSoVhG/qW32D2RdvkZKRZDzCc0/+3NFx1q6YWA4l6KwA8iRrL2zFF2w
	mqkeBp7OMPg5VmKiDT6ymBShrUyuQuLrHamiQBhsNRbGXS6mFlbPsqirrUL5eiHJn1ZnMEcEmLj
	cRYIoVdPwYuFuqecMdiwkOf0iB1GAjNDqKrCihdQHcVpqZzWDSpyHorhyZN7PLMeI1npeO/5k9E
	RcvLCa/WSoJv///SOQ2UbVNJBRM4i+iJfo1yCIkttWCIjmCix9JNhY8I+QJ+29oGwtp1H1BLXMC
	drfOoFxPOB/VxXSOpKbMpdKjTEsMAjLKEY4lJuaAHrwILiIdommJypXwFUB5GB0ZQsq7P9Ce0fQ
	A+u6nCGASm+79PZBXp2pd4Qu8+f5dWJdfqcGdC9k3Ao+Aq3ul5tniYJD3wetg2Qb6Mr0aGR9oca
	TuWhaiJ9/derb+WjOqSu7cymDODpd7qVN+PzrkBdwjj3JQag==
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr6807370137.0.1780926602404;
        Mon, 08 Jun 2026 06:50:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr6807345137.0.1780926601852;
        Mon, 08 Jun 2026 06:50:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm49107501fa.22.2026.06.08.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:50:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:49:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMSBTYWx0ZWRfXySC2xxoCO6BK
 2YY+eGLtg4o3BAKTniss2cQzVUKDOG/qKpi0Ydiqawo3gqkM+3MeVuKASw5hlg2TcT+RITAVvE0
 goY1DXdKeRREu0Z1kj4vgOExwALxZa6/pr1zFfbWvZDyetyihsDdxw5RArUt0siKygyWHYKpm36
 L/i2C18nb7cA+MS9IJA+6OAh4JqVdSwApoVaKc7hoagk69RliCr1Y+IjzFlmd7LU4EZh+BFtzxd
 kL7Ca0wzl+vu2L7cHhNDJ/l+SkNbNqHcjfwQO96hjPHYsRO8jAoVEgA8RmQOC1OTiYeIl/tVtNb
 tv07+j0bJisyNKN57RHc9B4RMWhOuT40bW9Qco6f/sKL6OMMz4hsB0MA9Ft8zdai+9FUh4HUDFq
 u44m/qxGQc9ILYL485fZvRarDUleMQ3WbT4PgoAC2QolF/wpCYl5t5zwoJ5u6NvWAAIsjGu9CUR
 PbWOhn4pyDC7emBnijw==
X-Proofpoint-ORIG-GUID: S7dzTkJiOPR2HcWoSDknwbv1j0Z8hl5R
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26c88b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8CyBazYyq9SD5gnPOlcA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: S7dzTkJiOPR2HcWoSDknwbv1j0Z8hl5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_065004_026205_5B69EF56 
X-CRM114-Status: GOOD (  29.91  )
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

On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> > On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> > > Some SoC implementations require a bandwidth vote on an interconnect
> > > path before the SMMU register space is accessible. Add the optional
> > > 'interconnects' property to the binding to allow platform DT nodes
> > > to describe this path.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -243,6 +243,13 @@ properties:
> > >       minItems: 1
> > >       maxItems: 3
> > > +  interconnects:
> > > +    maxItems: 1
> > > +    description:
> > > +      Interconnect path to the SMMU register space. Required on SoCs
> > > +      where the SMMU registers are only accessible after a bandwidth
> > > +      vote has been placed on the interconnect fabric.
> > > +
> > >     nvidia,memory-controller:
> > >       description: |
> > >         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> > > @@ -602,6 +609,26 @@ allOf:
> > >           clock-names: false
> > >           clocks: false
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          items:
> > > +            - enum:
> > > +                - qcom,qcs615-smmu-500
> > > +                - qcom,qcs8300-smmu-500
> > > +                - qcom,sa8775p-smmu-500
> > > +                - qcom,sc7280-smmu-500
> > 
> > This is a list of targets that happen to be supported by QLI.. but should
> > this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> > 
> > Perhaps
> > 
> > if: properties: compatible: contains: qcom,adreno-smmu
> > 
> > ?
> > 
> 
> As of now platforms where the issues [1] getting reported are added, the
> list will grow.
> <We still have to evaluate and test on other non-QLI platforms hosted in
> upstream [2]>

Do you really need to test, which platforms have an interconnect, or can
you predict it by checking the SoC documentation? I strongly belive, the
latter is the case.

> 
> [1]: https://github.com/qualcomm-linux/kernel/issues/297
> [2]: https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/
> 
> > Konrad
> 

-- 
With best wishes
Dmitry

