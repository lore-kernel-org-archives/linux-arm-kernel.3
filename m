Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB27C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLRCuCe47x5UYRcZUJUbMd2a1rwUyvqY0uLF/SHitw4=; b=wDAX9MQCpiK5knofpEe8POfB7m
	8MS5PStRc9FVH6GHVcdgPL2ADOhBh18eZ+zi8j7dnCFSNe4iY0uovKBHlRYU13nfdYG35L+H27ozU
	Sm2kgsOu/EjYOqJxzcK9v5vu7Ythn7s4edFLde0BiQIiUNSakVmjC54VvTPeuiLXTYN3WjVDYo06m
	tvh+Ct4Pz/oEZsclnSEAJPw/i/QyIevuTOjtE71t9bKXyJQbLi82cPo7ea5o0VSg3AuD6Qmc2o3t6
	J5z/YWz/9qBPzcyqVuzljUZUdt/joLBBOviuEQotI8+S0wl5AzLiFQSZaPtb5xnD+IKDPJ+AGiGvx
	EsDTOJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP3t-000000042UA-1g6a;
	Tue, 04 Mar 2025 09:59:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNzv-00000003iEK-2ake
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:51:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX5RK027370
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Mar 2025 08:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OLRCuCe47x5UYRcZUJUbMd2a
	1rwUyvqY0uLF/SHitw4=; b=nBtLru4uRPcGx2Mn7PiW90o4PRddVASupV+VlQHZ
	2q/uivYxEZorUj/9Af5dMUC84W9Oa8vKUAxmSK81jCJv6aAlTIYA5mS07gwXo/72
	zvCyaflpNRd/uFplcFDvg7czBmg/pjStpzXUJtiAQINUKqPGIRtb9cm4X8EnbO79
	v/HMVjPvkKz84WjZUnejDYjXKnlCufz2ehnLAkYVxOHncNgR2d7bfBmycOekpuoG
	5GIbK0q9vuZyOynSdfnWT+dXg2JyNEy2RLwy+9jcxnOmVQYcZU7/E17/d1t5hvrk
	2QLGr5azciPC3CY0u21MiAHikq+siipA/8UsA8Vx5iXFMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6uh83g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:51:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8cf10d1c2so40973936d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 00:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078289; x=1741683089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLRCuCe47x5UYRcZUJUbMd2a1rwUyvqY0uLF/SHitw4=;
        b=IP2ii9Fo8PTz7/KXJ9pn3j4Lc24PtfD4mTxZdJL4rY74gvjpHxCphiLEq/d+hsMN8c
         ZXOy01b9puQX9d3DmbeEW/ChDolZWdmzR3f7ChLeoOhToSwTtFF8GXulZdHmNlGVhTLR
         M10Y8tF41oVY6D5sTLOOITHODccyycvGB51qVIfde2IA1uNyLjkjECFhobkLzd8iQTqK
         EcJduisValAHRMRO6M3SBG7P4Tfqid1uVSGkhXhiO1z7kngONLbtN44s91HmrKMur+CQ
         6sH6/yeBjtDfLW+hffdbhcIoo9Q2mg9dOD/d6tv157uxQEreqeuLvPG0CIWdeC0XUmnL
         2Z+A==
X-Forwarded-Encrypted: i=1; AJvYcCW4xPOSOGAz1TAopEAGXOBtlj0/7xkh0XGtCFZIyTW9QbpckedW+sYe7yiVBtbDDlY2b3EQWKHs5dZgzuxcCK+2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrxk0Fj3XKUKbPPtZbbKA0XmMOcG3R2K0d9iG76IKkpWKn0/0A
	uScjNinGexkA9r+rD5lwivbJjlQUKdvB1aA3mbRsBnp2l9ncm1+qWiZtUU7WAysHF5VGJkwGPD1
	BkUrcvHdu1/aBZURS9Vkfc1FlO+61/zuSgjoD8lkn7+DrIU27HOUcWytNIesylJcQlpbkZDvb4Q
	==
X-Gm-Gg: ASbGnctchkYU4jScz4rISBuC5/PQbb5ljqGWUDSlZjGSAvjfGKWximsXx4Vx/PmMS8k
	oDuTNFoznxFk5qSV4ynB7jxp0iIVLkwsbHkKNb2UpEmqBQ7Khwk3qJ5brRB0qxhJQdl05wBx28x
	IPJBtC3oe7PhfDsEFEE/DzJYhDx8M4/3tUi9JgLsDxHuGlnQdwggKfbzUjRyCkWDtq6Ke8pSG+k
	NrBT2IPHKFKXTyeWB4CABESENUuZ4g8RQq34yCsajm0vuu+wQLGqIrH7I95+QHWiJ45betvJgtI
	15n60vi2CjQ3MWBDvhQ7pTRBw/BX7vpnAd9Rh6DZoKxkmBvj
X-Received: by 2002:a05:6214:500f:b0:6e8:9c3b:af08 with SMTP id 6a1803df08f44-6e8a0d6d748mr233513846d6.30.1741078289586;
        Tue, 04 Mar 2025 00:51:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXXONIdl74iWtM0enyp5EVNCNlqClOTgbZD6KGhlRFyfxAGkoiqep7Ikq28VZER+zvu5VL7Q==
X-Received: by 2002:a05:6214:500f:b0:6e8:9c3b:af08 with SMTP id 6a1803df08f44-6e8a0d6d748mr233513566d6.30.1741078289278;
        Tue, 04 Mar 2025 00:51:29 -0800 (PST)
Received: from trex (54.red-79-144-194.dynamicip.rima-tde.net. [79.144.194.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5393e5sm216342135e9.20.2025.03.04.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:51:28 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 4 Mar 2025 09:51:26 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <Z8a/Dk7zjZ7RQT2/@trex>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
 <Z8a7cMmxJuHIhgjo@trex>
 <baae2a56-5299-486f-acf1-14fe13fd2f81@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baae2a56-5299-486f-acf1-14fe13fd2f81@kernel.org>
X-Proofpoint-GUID: 6g8ufFUYWt_EHknlum0PHWsouXw_4GfJ
X-Authority-Analysis: v=2.4 cv=H40hw/Yi c=1 sm=1 tr=0 ts=67c6bf12 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=cl0az7d0LwC7qAhl51RXhA==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EIL0MzI05wtt13IUXDMA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 6g8ufFUYWt_EHknlum0PHWsouXw_4GfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005131_663539_EA8CEC36 
X-CRM114-Status: GOOD (  19.38  )
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

On 04/03/25 09:40:21, Krzysztof Kozlowski wrote:
> On 04/03/2025 09:36, Jorge Ramirez wrote:
> > On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
> >> On 08/02/2025 23:51, Vikram Sharma wrote:
> >>> The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
> >>> camera sensor. Enable IMX577 on the vision mezzanine.
> >>>
> >>> An example media-ctl pipeline for the imx577 is:
> >>>
> >>> media-ctl --reset
> >>> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> >>
> >> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
> >>
> >> Based on tests reported on IRC I think this might not have been tested
> >> correctly.
> > 
> > I acquired SRGGB10P (10 bit packed) frames from the camera despite the
> > pipeline being set to SRGGB10 (16 bit) samples.
> > 
> > so something does not add up.
> 
> Then the commands are actually correct, just the camss or media behave
> here a bit unexpected?
>

setting the pipeline (CSI) as SRGGB10 (16 bit samples) as per below

media-ctl --reset
media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

allows to capture SRGGB10P samples (frames-xxxx.bin files contain 10 bit samples for the size)

 ==> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0


shouldnt the CSI need to be set to SRGGB10P instead?


> Best regards,
> Krzysztof


