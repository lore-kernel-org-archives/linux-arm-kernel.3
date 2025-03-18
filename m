Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA09C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=; b=3NFNAGG1re8wuKMBbF43OQuQ/N
	Qq6CrBez91TH/mB0KmYWZK5dEIMKt1JUgr8y9nYKAAzLTQ8ePZE7lDedwky672PXBKRGqbfuvYioY
	lhSPlit2JhgH2APsw2DzG0BCwgluNlfMuz2HLfM/9VtgFTMp2Lxyp+nxTaqcch03aiXipaLX373jg
	7LZtrXQidX8BJDvj/qwnBwNlLaqmc0k4jCvVos2Q4TuQLp7MmdiltAUI3AhDuSDhAn+oNtPiZtvn5
	FGsvHLphiTwNMbEF1cRHLPxYrc9JGX9Ri0lxeWrm3CDceXL6bfQnoOjwsitC16SjcdkqNqtAm791R
	SjfjToJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUGY-00000005WVO-1WHe;
	Tue, 18 Mar 2025 10:33:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUBI-00000005VU3-3tUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:28:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9FEWD013188
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=; b=CrzOBCL9BxGuCYdy
	PpGccRQNdJtgOuoSTI/Hxt7LPk/WA9gBrjFthfC2CSnlkedNUFOAIQeylhFYkELM
	qSU4ZieuRaJ0KBbwkUh9UWU7fGBLzaMciBFljU47noP9N8wlo1/Y48/AZb+UEsxa
	KH+nk9N6ls9ub7jHZ6vfeGP4lbFMfQ+lVXB+dhZLdMMfVoV2+nLclgns145fmsqD
	Vr6o+a2+X5RVhDsAshIHwQH9OO8si0E3pFSLpD5/zf7D+UtJ3cj83WdoxlrEdWpA
	nx/ZAdBVvKxM6qky/sSXxpijIGy0HjvKr+9aJX4k4bZqSDPW8Y/G/0h4PyUGJnJh
	4gW9jw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxysvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 10:28:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso12345461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293697; x=1742898497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=;
        b=DjchAGxg6sVWqzdbpabOGLFqqCJPFh5HHyyxjZoemJWMqNYP/OtoXgpM03cwU7qBSK
         QLTLrvn78QgNPc/68Ja4WC9QxZESeCG8aO0R95tYe7PVp25JCffscCZAwyYj6tMacu7f
         bW063brko9CTjG5is0PIp56Ojx6FCkNDu+s7gGyEGfU9t4XlylmJiz0/04Z6dccx6jIM
         k1wAlxSGapF809vC9PBIbaRRfPaQt3nc880XlxojuZXErC06dM4TWIlNIFAqrL5hehA4
         Pj67sak22QcI0qWG7Iy1Br3Th1GYDzb6rLEIwdoEe+Pckzjr3EFVEJ7gUsiHyF+YGC7A
         I8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMmIIPdxRnTgeZYNg9VJduTG1f4xSEk4+1+uG66FnYh9/0KiKSPeI9gFksJULFIgfwQN42wdtnhGRnRyO9R5sj@lists.infradead.org
X-Gm-Message-State: AOJu0YyeIspBSpKPgb5HmVayahQEPTHfh/VpSWHvaddXzx/uZnp28VIR
	mAjQTftxX0iFH6FNtf4N5xfyIt2M1FOiF7tLVApi7gfr70Wv46ZIHIVR1CyL1pNxsMHf2M8z5lh
	7dzFoxEUz3xuDmVO9qxuHJMEK7HmaZV/QZIWFYH+bonewzsoiAUsJamaBEvqop/bAULyv9xd5DQ
	==
X-Gm-Gg: ASbGncvXjItD0i+VArjtUwpOezIXlOceAgVnMvctP+yKY5Dyt9IcnYxil7R3imzuRDn
	K7EY3Bx7qgcG+koiSJ8tpIVy0LXkloWtkXfOrMc7WsmS9h8FE1jCDOWWvXZj8dQBBVCp9ZEmHCl
	QAIxT+y52GanucPcnNcnk+yXBfI0X6MpSBDWXdrZyyWrNecLixor2MICRCvy5924jeqWa+V97YO
	buD36JavRiz91MkTNLnT0sxOND2TlKt4BZS6pNVEdldY3TQatk0n71HmpvQxUw7M4GWJ4QAAmaO
	kAhb0GFohfSOFCCXLrNVsF8g6TtlHjTdwqRK1gxunk969xDWG/46oqOSmtQbVASOnz5SYQ==
X-Received: by 2002:a05:6214:252a:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6eaeaa5893emr88167876d6.5.1742293697518;
        Tue, 18 Mar 2025 03:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbWrHKNAmWpMHc+BHfClrKrXHiIT6z2F6YxU0JPnsWruAuabzkJG8LsnO7K1C+4bw9HqrCrw==
X-Received: by 2002:a05:6214:252a:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6eaeaa5893emr88167666d6.5.1742293697087;
        Tue, 18 Mar 2025 03:28:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31485d046sm814425666b.83.2025.03.18.03.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:28:16 -0700 (PDT)
Message-ID: <f1848598-c8d7-4c17-8a40-3a6828c32dbe@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 11:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4UdkQWWfJbA9CEATwTE5A-IfPv5K_i96
X-Proofpoint-ORIG-GUID: 4UdkQWWfJbA9CEATwTE5A-IfPv5K_i96
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d94ac2 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=iEn_WmSgXS-yHfNkfEQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032821_091761_A029CE66 
X-CRM114-Status: GOOD (  18.80  )
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

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks (or both). Document those optional clocks in the schema.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -30,6 +30,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    enum:

I believe this should either be items: if 0/1/2 is allowed, or
minItems should be dropped if 0/1 is allowed, but the former seems
to be the intention

Konrad

> +      - apb_pclk
> +      - atclk
> +
>    in-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      additionalProperties: false
> 

