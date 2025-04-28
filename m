Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4510C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Pxtv8aSr8lPsn9szEAcL96+tyHoCynhCC+imycmD8E=; b=CgR9CIs13cASp2MrgzOfPt3DpZ
	e/asfA3C96ltJyegr1Ykfgj7Bvn6peXBT5kcW4GIyNJgh2y8g9rqE7psoumhIyjd3NCA+xQuPa6pb
	4cqANZlMBck2VIYGkm9/E/tnLGmiKal6LkzmnuQSG6y/WwQSOQSo3wpCChTZbsU6243bX+RJcegHo
	Xus/JY4PSd7J9Lyskn7P2TQbwJD7MXoMTGb+BYHeL//W2z1s1mq9At7ZNgpwDPmGJhFXp7rE3QxzQ
	WOYdEsitOT1+A9Yx8Gsp+7r9Tr3UX4KWlMiERnxgNjeczYqZqEhweqvAJnG74K6PNLuvZkrUrrXHI
	pDLwPSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9La9-00000005mCf-3cT0;
	Mon, 28 Apr 2025 10:19:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LYC-00000005m65-2Q0r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:17:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACU0o023768
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Pxtv8aSr8lPsn9szEAcL96+
	tyHoCynhCC+imycmD8E=; b=RpjNWBCQghFnkVznLenbzGQ7FGNRi4epvrMeyjVF
	nEr/tyfianNYxVaNMuotOAp/T8tX6J3Y94/rNtdLETf3cR4mU+2P3H4ZQG6x1KVc
	eQS/tEFyEnZyj8NHPvptz274q7rNSLw6hkz+1reFFHCXEH+pFbf4/MCySR7kdaud
	M8I+GUhLM7IJrSDyYT4gAykLYuYJZUV8gAjyNqku27Bv+YNQrFEdmCowpKE1YXQA
	B3AtMGkLgPb4pdh02QvKM/sdDqStEkVr+4uwIFMum+E1b1+dDYXNBe6sI2l6GRVK
	XLiFcNcOgnLd1D8RZ4ymS9nMS1Qdp+qdC9rF3h19Dainhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmgstb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:17:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-309c6e43a9aso7017745a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 03:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835441; x=1746440241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pxtv8aSr8lPsn9szEAcL96+tyHoCynhCC+imycmD8E=;
        b=UmOB5REtz+thw3xFsck5q24U9r0fYeCdeDXeymCMp3cLLwjsEowcMwI2A666ACskx/
         oNvyDKpPLD5CU7aOUvrkmD+fAFJ+U6tSFAtEb+692FPtfRBNmcbOFi8niB/rTSwizZlj
         Xl6KSFZiAbbI8cE1752ZqHyhoDBakFW8jO0atnFJSSpVE5JM5IVKyqr2W64t78NKYBIL
         vwP7lvcDgCJ76zdwEqj7WxoVdAYkYN3UkdsQm9S+5CePM2Fkdk6aECx7sjxvTp211tzh
         lwCMyf/SxRGTqDmfbFfKafJztJ4jGSnvZNG+WoQVbFxXWbrseuCJrVCb4TY4GswynUJO
         gE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVydoNpoMEq41DrWJYRdhDSLGuB2loMgTen2Ku9lUm2mo13sJjJfTmJ64rteICkIgXUo0jqsTZhoRB9WDLeYGYO@lists.infradead.org
X-Gm-Message-State: AOJu0YzVouiZzkoIcPYYniXTzpUejmVWEhpgvkImQT2m4xg3al0C3VYg
	/kaSMxrxYMMvKASlck+5YM175MBAyyHoXnLL1jOrGrLoRheCH36+OmvEE4PlOKMo2D4RM+UOEB7
	dQv5zyH8OgNU9Lxv4vE5dDcCZlYIgMC8NrtDpc2e1u/yTmR+58MAGGRlQiA5EJUsbw4EQorNDSF
	ksjy0817KFcdAub/xQETRjzdjrxzfeDJhaN2blViwDXvpfLa3Q
X-Gm-Gg: ASbGncvkZQtmofzZ9AksaLdm+ZcioHZUZD2ubxjIPpkyH1n85Rp4aVp+GjQd/BipKs7
	I/XXZhZ5H/RQ+tSvw6cfgPXGKQzWoJWJVyiIv1fjaR3MwTrIXlo/QXLo/sNIdCD1Ssb43IG1sZ4
	QR+ZhPhZ1G7VxDsYSe47j44Fb1
X-Received: by 2002:a17:90b:2247:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30a013b0fe9mr10022786a91.23.1745835441409;
        Mon, 28 Apr 2025 03:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIaELZcY1AshO25NA0l+ttmZJfXNfsi/nEo/9o06JBJB434i2TbdXrkARPRYRTyvmK6A6cuZ9Wjsgk5Ys7NMc=
X-Received: by 2002:a17:90b:2247:b0:2fe:baa3:b8bc with SMTP id
 98e67ed59e1d1-30a013b0fe9mr10022761a91.23.1745835441054; Mon, 28 Apr 2025
 03:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com> <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
In-Reply-To: <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:17:09 +0300
X-Gm-Features: ATxdqUEUcpx2-hktcO21OhqmqQqXyNUMMYDgeGivjswWKla-vpUY9os7A0P_Tug
Message-ID: <CAO9ioeXhFOn=YPt0+zA_C1WRcXQJheLo-nkVDUk0+87+0YM=NA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: arm: arm,coresight-static-replicator:
 add optional clocks
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: EUyvm3dzlLV-yATrREnc7kHcGb_gwy8-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4NCBTYWx0ZWRfX/ewduDyv5/tF 7xR8b0Y7NPU9BrsIpbbWZNMa6tcmcz1cetPSu8sN+snD8fq4nhF0obT+O6beml5rFY6kmYa4J3c YuWlLnxBG7Wh5btEp7gyHErmo/S4OhlpHKsYI4CcIhKm1l+vFaC+OfH/PkNbQOeZNjpZIy1j8Zn
 v+SiCUCf8u1UD0832INUd59ukqeIjIf0o7WfxgsOgoq5GxYYLVFo/FrfF0Etn48y3zTHmhgmhBQ ycTemuFZ5e28zYVhiYadQxBpBLPGf8fsqWRoU2op0Q8dzJfRApA0VX1dUsR423q7dvPIGvIOnn0 LxsRPWkumIBwhvssGnGC/0XLNh+CgHkoLJ+BdVPME63EkQCETMblVJQShJhEdKynb8jYeDjVXiD
 Q7+Oueooa3svN7f2ajDiS2cs9kd7PHH9xTaYwXualBw89ruX2tGk2jNR4i/b7EuMSIovJCuU
X-Proofpoint-GUID: EUyvm3dzlLV-yATrREnc7kHcGb_gwy8-
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=680f55b2 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m05Zng2Y9WU2dLnq8PUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_031724_755703_FF15279D 
X-CRM114-Status: GOOD (  21.67  )
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

On Mon, 28 Apr 2025 at 12:06, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Dmitry
>
> On 25/04/2025 18:47, Dmitry Baryshkov wrote:
> > As most other CoreSight devices the replicator can use either of the
> > optional clocks. Document those optional clocks in the schema.
> > Additionally document the one-off case of Zynq-7000 platforms which uses
> > apb_pclk and two additional debug clocks.
>
> What is the plan for merging this series ? I am happy to pick this patch
> via coresight tree.

Please pick up coresight-related patch. Each of the maintainers is
expected to pick relevant parts.

>
> >
> > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Otherwise,
>
>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Suzuki
>
>
>
> > ---
> >   .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > @@ -30,6 +30,19 @@ properties:
> >     power-domains:
> >       maxItems: 1
> >
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - enum: [apb_pclk, atclk]
> > +      - items: # Zynq-700
> > +          - const: apb_pclk
> > +          - const: dbg_trc
> > +          - const: dbg_apb
> > +
> >     in-ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >       additionalProperties: false
> >
>


-- 
With best wishes
Dmitry

