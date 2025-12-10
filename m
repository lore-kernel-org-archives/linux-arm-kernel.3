Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB0ED3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=; b=WYnQgi999VxYoczpznF3PsjwlT
	jrXuJmTGxNvLiWOxdwXuSOfmpViSBp1GcFyl8KWVO+8Jv9M+1rKVMshol5eEc/J+QZGKOKB7ukCJj
	jR30O21mhKT7mXDbetRmqNblE1ez36Mqa7hamvWexjwaKJ0CoOynd4Hxwr+Hy32r27LX4RSzPsd9a
	l/9i84Jsng0S1b0H0T/CPH2p+P69VNyG8ZRub+egJ+aqjWc1/lLdaOk2IIoRq/QRYkBEj4I5qImb6
	o6HE+e5tUCPq+pdaWcwPcOh6dzLo/TRBKVNnx0giuk8KGcCwxmQ1PU0S/skVibRvFJvNlekwkDRCJ
	FBHFjk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFZP-0000000FFEq-1cwE;
	Wed, 10 Dec 2025 08:29:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFZM-0000000FFES-2ccZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 08:29:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Dhm62175161
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LQ6U8pxK0994QNAVNbIVYwcO
	SDd35n5YdbkWgIRVSjo=; b=jMKxYa0bus/38+fd9gLXBkmvpqqWPH0+JTEgNDLC
	jwS4uaREm9WzGYpfvDGToH2dPj+g8/UI9Ifx3Y0MPGhKRlO7g1QYsqutQcRafoO3
	Npsr03imjQqOUpit7zLTVgM6CIBh04wgQ2Tz1IE1gtEzD5G5z0oIPlh38C8WiokS
	uZGE2mK1kvH99ya07vc5QTge0CHf55mWHNs1gy9jrH1kx54LztMDmDIiM42ulbdJ
	iL8dRfcu79rzthOh1o6dwTLQJG2zIJnWBzvohqQV/Y8pKv6ntSe32qo8u2EePh/w
	jwchKbFB1MZlSfSAOPkKEDKJm1Pi0vB6r0j6xGZZItAZ3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xwrmhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:29:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so12154681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765355347; x=1765960147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=;
        b=g2zZj7m13GEeDX06iVOPdRafmmEAnVGbIzgON2aURy/AKI1Gql4ZdmqYySu4AnMsJO
         Ey1YR924VZ6I/g9ZW1GEMhxVAUfDRHgSuWQ4dk/PASA6PIDBZ88SPVa7IdHEB0kEGBmQ
         Kb3gGrv6XetAXjXhZOGWKVJZegXTH8HAnPzC8NuxIa0C9ztuZbf7Si9/t6f4gqrvrqA6
         2rfza1AW0VzTioTo6UtE/eRKLeLXFjatIW3n1SXaNPV4zaCnDk/D+dVMXXDoG54Uyd2J
         t7T7mUiS7QSzXozBYM52L6NLALAl0kmXlPQXXaa0zkHIkGlpsg0jsy5di2X/800xQ+7q
         yVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355347; x=1765960147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=;
        b=L1NXAw5Ei5L9awhzKobx3v0/evhDUrZ9u37CjSlb6LrULdH+G0SSlUg9brL/OOYnIr
         SrNrasFB1rcbAd0La34Fr3df04YvHQDP2Z+nqNtPtLtWfbWnw6aFwy4SfPrSXG3nAh9j
         qMRZlnckoYds78yV+czs/IGV3M++TA4na0YRlXZMRgdqPbuwvE3GJk6h3SNCkVtcCvfY
         1ipHl6HzensIG/WYkboFWkwjOug6WOl7xKGEiKrz41E1rqL9lUGK3jLtRIH6uRZMtnln
         hIUfqeAV1+sFUbITbeDkiSYhRFPbHMCBt0wERLXiknpQg4QFCuXh3RCdZnjTAvz34i7z
         JPzg==
X-Forwarded-Encrypted: i=1; AJvYcCWLgmh+ywzmJQyaIe18MJsaym/3vcP6Fbveiqkwz4mmqy0ZafHxxPIf1UQWVTSbQDw5Q+E5Mo0/wJS4FKPeMvFp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz69xmZYba8SdDBgNkeid+RQxUDoRlVgdyHtMw+xh4ViuBW3HkJ
	6uirv3z7QB12n3f1PBHQpOOaaDS/bjCvN6XlRJa3QufFle1smnULjBo5CYgnBalSKFEnWPfw7m/
	83DpeCTbtRmuLYatJefJ9zOBQ1raZeNabh4liOlgwBSXKmudZulbrvETViQ6e8w0FSQb0hp5/le
	RXKw==
X-Gm-Gg: ASbGncueulhVFohYcLosixxIykyy8x4FOpqJhMfbmv9ueFnTCe5wB3Y2yNwSH0OTj3B
	LMxDTJeCvaS7hXUM9LglMcO5x44lEgpOtCQKdkfEYoJVbbV4+ZhvxIhV8BdfIfiqzIMLf0MpKRt
	rhf0ZdBrryQdIkKRmfX+9ESAoGGJYmZPz0DhYd6GR4sYh6Wr+k4G+k/BxJxrur5RVv5TOhCTHW4
	9d5b5riSGMKOFAOtS+02OpbcjunSguJbJYOauFA2YsdZwauIVBoh8BBrum+Xh/gMG7rxVn/Q5dz
	3pqSrnTOHuWPhpYb8wXBb/L94XS0y3paLzRvmHsoiPXNL4Ivez0X1WD2ePWbMe0OIy40Ys4hXQ5
	7LjDvGgcVdeZsUlIewsuuY1gPpx0x4sb7b4bOeZiulJRlE4GrR3gFOHS98SAfpX0NVjF6QHgCz2
	20fFkJLkYs3e2kPMdnLnuz/Sc=
X-Received: by 2002:a05:622a:146:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f1a9b5345emr61274271cf.31.1765355346851;
        Wed, 10 Dec 2025 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5yN2+4yMhNVOKdG3urL+Lh/0KSj3dcRe9MDeVCagD75jX9QBzox9VjYfSqdlDnHahOyqOGA==
X-Received: by 2002:a05:622a:146:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f1a9b5345emr61273781cf.31.1765355346374;
        Wed, 10 Dec 2025 00:29:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e32esm6151019e87.53.2025.12.10.00.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:29:05 -0800 (PST)
Date: Wed, 10 Dec 2025 10:29:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 1/3] drm/msm/dp: Update msm_dp_controller IDs for
 sa8775p
Message-ID: <sfnfn3vctmhuks3wjco2f4y5vcfon3fn3pprcwgz7umpx6jt3t@dlps76vcmybc>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MiBTYWx0ZWRfX5pBRX0fdAFvL
 TG3+DsFrYXe7iXhfbvvg+rJm2KCUHn1s0bEvgYodseNiQB9RlYpjlZHMxY4t25TnqQb8vVgGSDL
 978akfSuVlMZKyO0d/+ldTRUzXAUgwPgP6TAqryEQEHXroL32+o2yM5Tge1NNGPzqnY0uHC34ZW
 3ieyPKgL6CTEjn8R+2LABPrO2ufpNR8rFYZHEl+6prJgcJ0Z7Myl9V0c0c5ytNyZb/zdA5SLP4N
 d8LOm51gTTw5QsaCwYhevxNdViUWGUU7NZELq329WFZyn8AQmKVjGuEFj1JdLXwcDndkpd1HFye
 o8r4N9VpUGZ32xYC3jGOW0Myfv0KwAzrHPMdyySrDY8w3D51nwyGZVHA+OdANKdgkPotoR+oKwf
 QleQa0He/L8tAIUUoPOR085KD+ZAng==
X-Proofpoint-ORIG-GUID: XeupDxK564Usnjc-WiGW9A0oKfvx41Zc
X-Proofpoint-GUID: XeupDxK564Usnjc-WiGW9A0oKfvx41Zc
X-Authority-Analysis: v=2.4 cv=F/lat6hN c=1 sm=1 tr=0 ts=69392f53 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m0UsThpCaeJMxhqdgYYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_002908_784826_5B036B60 
X-CRM114-Status: GOOD (  15.41  )
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

On Tue, Nov 25, 2025 at 04:26:20PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Fixes: dcb380d19e58 ("drm/msm/dp: Add DisplayPort controller for SA8775P")
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

