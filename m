Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1D2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fn6o9sruIXfwvCI8WMCUouk1Y9QTIiAVEqwCsNznX/A=; b=igzDo0zWG9CEPzukg0VcA/Rsbw
	WURPHQ+zrQEJUCkHPnJKt8vlPNZlF799S9SozeaX5RGzIwee0wGkX8GubB3XUBeYyOLJ3RY4jZ4sA
	2+Da7Yqlqf1eNt/G8rqKYuRHcsNpfRAdxOffhTLFK78QMttEaNlIiSh8WmSBjJC4PIuYtUobu+iNn
	AAkggRSwa5XZTT+SjP21a9KJVrUAPOU/ZRhYtBjXupfbJLj/koqN7MKBlxJuHyDyNwDH9Yt+1xqDf
	AlJ0glqsLlcCNzx1qa48xc8hweQs8TPGBO1kMg1nWcvCCMPpaSlU0kPxJ0lAwceE4btsP8xEEezwk
	FWDEsWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW5G-00000005t3G-1xiO;
	Tue, 18 Mar 2025 12:30:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW20-00000005seB-0740
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:26:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAWsXP010361
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fn6o9sruIXfwvCI8WMCUouk1
	Y9QTIiAVEqwCsNznX/A=; b=KUyifBEdxAy+bNjktmMLxn1q0cz885B8NnY82uZV
	BXPTBeBzaz+rjyOpCifm8s04bgwGhH6WFTRw031xNMOkFSKCqeivFf/hXTnAECC8
	JCYrzC0pzigFX2h1ZhI3NaZP+ALy0/o+xN7zXMwPzFkpJXpn24todpgOz9XTsHA7
	b5ILmsHdrOVkqjh8ZTf/XfqiytLlM+tvqLqJTGsZHSxIMmeh5xIhHEqykGtP+k9v
	sqCfqI+xO46ERt9zeG2tN9FxJ0/XBrAQp/dcQaKr5WBQYZP2x1UUHmTBAdI3ObQj
	BE6RB5aO7zh4oJtZQGCAjPgpq0d2inE5ox0J7bPeYJ9bqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx31rn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:26:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4765f7bbe1bso96400781cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300810; x=1742905610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn6o9sruIXfwvCI8WMCUouk1Y9QTIiAVEqwCsNznX/A=;
        b=nHq20UCCWOP+gC/BFzM1GOnLdgL7Qq3jynCY9+qrnArGiPeVyHzR/byPbtTC6x23ox
         0UVsHk7tpMNbnRNivDcw2pe2uKyK+1b7qtuXtwvS/e5ISMVBCB1zk6DALmJo3aE3NxTs
         ElaNX1lBE3N1qD22ayeFQKL+YxokaDMvlYFzxKz+57ko+LMXIp1LEtej/A64BB1gpj4j
         PAq8NNWxhB8ijRjlTK7Yj3nWYzjyQWB0S6eoytbc6YoK2i7bR78jAdW0ibJUOmSJjIzv
         c48XVrzVEJdkaMySUWOIKzIbdM8eo7geY9GCbN9a3CFBoZ4xV7xJyzkSW4PHmZ2A5QRX
         yY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVr1Nmghn4YlCoMreT1d1jjuFvcZ0AFIBLMCm6lYQnP8Wf2OreVt0oQlhO00Ojk+mgzIQVeQauutGQJRdO9QPwW@lists.infradead.org
X-Gm-Message-State: AOJu0YydAOkYT4IiggVJ1ctj8ROLCG1CElQHrQNR6rhQFo2ztxKFghDY
	9imAy9xbKgcBeKPKk5ndXGj3SyKQ65glugqNu1vXGLUPmocC+7JHVe80GhMwVjTpXY/N2kvJygc
	51JfJtozhDUwO6l3Yo3MyGdCVYrt2/BDNIaGDQbTmx9C4WuOR3ZqhicHlcOv4Tl2K+T3eOKzkIA
	==
X-Gm-Gg: ASbGncsI7saIHu+nwOi6kV3Hwymlqs4L1rOSCA5CthasocphjCD8+BD25Z5MSiOxHbG
	WincFXmhdeQogcPSwfYwyx4lgt5iVy8o9Tm8EqCb0UaCLZeXUvd4Yg/+MOrCxWHX4IMCctx+pHD
	mP7gS0IeieZ5LRS1Hs4ty8llktCoV5OETJWrmcVx1K7TutBZ/NlariSnRVjIfEQi/CxJ3XFqvey
	q6s0rzbE28dWQF0YAK52FYM+DCBgZxhlXpcMSJGY58ffzU9VBQjeF3lqKpr+sEMF19kbGBN/yF/
	A0gRWkDW8B+XkVuYsBgob5w2t28Dj0rGVsgp1cx+1Q7xY2/ScOeMp6g2MUk77K963UTQgSQ7Mho
	6TSo=
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id d75a77b69052e-476c814a05emr237383281cf.16.1742300810265;
        Tue, 18 Mar 2025 05:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcR9xUHBK9TFXZWSwLWT2FsKGFofnO2SkdyZ7fM94gEY42uE07dGuuS4gCqZY8gVYIkurgsg==
X-Received: by 2002:ac8:574d:0:b0:476:7327:382b with SMTP id d75a77b69052e-476c814a05emr237382801cf.16.1742300809924;
        Tue, 18 Mar 2025 05:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bee7fsm1638070e87.54.2025.03.18.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:26:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:26:46 +0200
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
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
Message-ID: <p4hda4puovabvqnf3unge2rifzu37hgim2k4fnvdpbekhojzq5@cx7j4hrspzdy>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
 <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d9668b cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=q9XyVQKgEbIbea8yYzIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Q_W-qqDKoMNoofrIpuyEtT3UoNKWASrU
X-Proofpoint-GUID: Q_W-qqDKoMNoofrIpuyEtT3UoNKWASrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=501 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_052652_075904_97F4F28D 
X-CRM114-Status: GOOD (  24.03  )
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

On Tue, Mar 18, 2025 at 01:13:23PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Use new SoC-specific compatible to the SPS SIC in addition to the
> > "syscon" compatible and rename the node to follow the purpose of it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -402,8 +402,8 @@ saw3_vreg: regulator {
> >  			};
> >  		};
> >  
> > -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> > -			compatible = "syscon";
> > +		sps_sic_non_secure: interrupt-controller@12100000 {
> 
> The register that the consumer of this points to doesn't seem to exist..

It does, although it is marked as reserved. And this matches msm-3.4:

                .smsm_int.out_bit_pos =  1,
                .smsm_int.out_base = (void __iomem *)MSM_SIC_NON_SECURE_BASE,
                .smsm_int.out_offset = 0x4094,

#define MSM_SIC_NON_SECURE_BASE IOMEM(0xFA600000)
#define MSM_SIC_NON_SECURE_PHYS 0x12100000
#define MSM_SIC_NON_SECURE_SIZE SZ_64K

I don't think anybody tried bringing up dsps on APQ8064 though.

-- 
With best wishes
Dmitry

