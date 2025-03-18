Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AA3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQvm5ggtbOCQSK3nymPppIX80f9DFkotxhkHRb0WarA=; b=ZVC0d7C2q/FoTbIWMK+p2VeO53
	g6WHJaQ8fuCAgDNxqAQfhITnklH5rR+z2gG1AXpOviAKEovz9JCnOpup1rb0+Tb+kOC0kIDGG+L9P
	6vq0eYWjdK1WAkR+2vGWJMz13j0/kBWEqGdxWY5syCtUkHsnqAu/7RQxwKboHMzHbhFumlzeYKOLp
	MY8Z9RG2lTILCNVlkQvT8i17wYBbCqLrJkJnY/hgFDFqEgdhqs55JnWrKTx+4eRLDPi1SbLwLep3U
	I3Ep/o/GmnapHOvyXFey9cIOcb/IbXpzGJeAI1si+bM4mSt8NIyt5PYLd65Fjs70xp0ufWeGCgx2Q
	8scxXnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW6v-00000005tBv-12QP;
	Tue, 18 Mar 2025 12:31:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW2Z-00000005ska-40mU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:27:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8hklZ025995
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KQvm5ggtbOCQSK3nymPppIX8
	0f9DFkotxhkHRb0WarA=; b=SeypgvoU+gdG6Ukfr5ZLaqvd25tu9MhRZNXFTSl4
	seQBRzEzA46hOlTpxNKZQxvO6mO2aXUQP1ahTXVzSee1Gz+hx/j7tYaClPsI6ZVi
	+UGaIDLoa8NpPDojLo5HxurMTRHe8elKNUv05mlGGJ2GKjYZZwnxcmy6r6tUqNpP
	HuQ3y5gllvp5OOSdEI6wUdYOdLBOY2Oy5PPyEyzgkrEu4/sH7NBQZBkfYm2RYPc8
	YeMFxZlEkGj7288wLpTyKCU6rkCR7xBDFcYjTt6MtNuCUd2tETe9/fGvnkelBagI
	TL+M4GdLDN43HyM6GEGCvCCvP19k5VBpV89aXEXRTq+9zg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4r6y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:27:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ec18a29aso70853586d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300846; x=1742905646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQvm5ggtbOCQSK3nymPppIX80f9DFkotxhkHRb0WarA=;
        b=OXSg1y8+A11zu8dXsCCeHRMWeSuWAslajloIzXCXfSbLLcv5ti2h1q23B/RpCYHsw6
         7JoQPF+hBFfX8QlU7uG/URgvFjU3ARONGVg/a98REb7rMvVULnXZ0/yPabtn2UXZZ/zQ
         brOTF/jPqgPhOyV7wzvbiZTyjQKu6m2d2VMoudkcfL2K6F1fUccOT+xbS7q9SmOIsf8m
         +d4N1fXFaROsANbuVQ6GHGqnbjMjal6EU1So7WRv6ZkIGBdFSjLaCcQa65C5MUhVNSfe
         fgfYibmq9Z4DYi4rccOB6ANUs/nirVUcvA3jQmLa8J6l/9L0VBN8+6tgee4eTj9EL/ai
         OUzA==
X-Forwarded-Encrypted: i=1; AJvYcCUgrg5jpKDoIsuvOCsduIIZDH07qfdLq5G+0KAFtrxNN870bIVh5pguU+nZdARxacnDmZKZc5YFLXpQSDzKooVF@lists.infradead.org
X-Gm-Message-State: AOJu0Yya1clTM3kU1f29U4CVrgURvd65iYKwG+fpXUwxFJHmr8N0yzMD
	Nt/l2j1/glBOwwXtU+LVSsuRekJ0kCJK3pNLNJ84guOnMETcdVgKrvwItGjD08YT1qcXjpxUbTG
	xkwarJHAttED/BzzUKMSqnYRWJIvyJ7vLCo+ZUv5iJ/f6EmbbySaX2tJBYeeiGSSuzr3YvCZrYQ
	==
X-Gm-Gg: ASbGnctxzowPXw0MZcrroTDqevwyPEY6IopeuUwZcq3xufzEvpHh8ECygLQ7TOth6sr
	1AL5AqELmXFODIP5sm1G4Qy/uhT6Ltiz0FOeAhVC4cSixcwG4ZscS4Vfaxcle7ARXZgJ2qRKqVh
	lM75JlhbeMjQ4JxwIXbUNXX+P0twVDcce16zc4jV/WDVcJgoPURG9ZeFs9ZedmE4YhuIKtyBFIA
	xjoN/HGvEdX1g+D0A3brrRb9BkIkS4CmbdGWYhYZnXQ5eg3wL9Q2cnOcE4Et7edm6GmOu5LtHLl
	z3AFheLoHLZ4XH3AtA8bd+3vbtud8xMeZPZWJ+mPaH9D5wSmsSys0UOCQjoKUr+c+VSsOszQNsp
	YAFk=
X-Received: by 2002:a05:6214:202e:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6eaeaaecabamr227559506d6.40.1742300846237;
        Tue, 18 Mar 2025 05:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwR7+iJ5oOeO+aBGprQHwdADJEmV6itZoPrskcrm0NWrJsFokzpnQutdgU3GCkevB+AxS3LQ==
X-Received: by 2002:a05:6214:202e:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6eaeaaecabamr227559086d6.40.1742300845903;
        Tue, 18 Mar 2025 05:27:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88332dsm1627986e87.181.2025.03.18.05.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:27:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:27:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] ARM: dts: qcom: apq8064: move replicator out of soc
 node
Message-ID: <nr5xdpt5sm6xwghcjwmwv4higr2saddewaifwdi7ysztyvh56i@26omyq26f4cy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-9-655c52e2ad97@oss.qualcomm.com>
 <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0c03e76-8b61-4cc6-8839-448fbb64d4e9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d966af cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=zvJQgSryfyOLS6Et4DYA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: YumvfEjpO25bKd_2LzUWv2Y7r3jeCDZA
X-Proofpoint-GUID: YumvfEjpO25bKd_2LzUWv2Y7r3jeCDZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=946 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_052728_119304_CACFC0A1 
X-CRM114-Status: GOOD (  23.41  )
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

On Tue, Mar 18, 2025 at 01:15:16PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > The CoreSight replicator device isn't a part of the system MMIO bus, as
> 
> the static kind, anyway - the dynamic ones are
> 
> > such it should not be a part of the soc node. Follow the example of
> > other platforms and move it out of the soc bus to the top-level.
> > 
> > Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 66 ++++++++++++++++----------------
> >  1 file changed, 33 insertions(+), 33 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index a106f9f984fcb51dea1fff1515e6f290b36ccf99..acd94f3ba0350c5dcdd8f80885ee643d8cbddac7 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -278,6 +278,39 @@ scm {
> >  		};
> >  	};
> >  
> > +	replicator {
> > +		compatible = "arm,coresight-static-replicator";
> > +
> > +		clocks = <&rpmcc RPM_QDSS_CLK>;
> > +		clock-names = "apb_pclk";
> > +
> > +		out-ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				replicator_out0: endpoint {
> 
> Please take the artistic liberty to add a newline before subnodes and re-sort
> the in/out-ports to make them alphabetical

Ack

-- 
With best wishes
Dmitry

