Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF459CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi4YzfqCRhtpYtMSpi4c2pxvl7JbhY/mvPEjH/nHU/A=; b=KUPEtqCQFBJOqACBj8BmONNkgr
	+iFKLYMPj3/ufvlVtebxb69HlQVz0dZwGJBhx4bXV5YKQoGRfVia4NMTOs6fqYS7izIUhbYzPQh5G
	ElTp8xsQVG3jR0NLtqytGVsuvaNZ/deMyS+UzO/UQQ5Xvrub8vVVUuxPjne0hfWwlRC3lt7kbiYHU
	v5uygZaSiLsU/zwbbMzjTyY2q5MJrActiwdgTbBUqIORcLTzr/JvFHmawzN3CLSRWEDHeoNbm3TUM
	g0uDJOUc++srl86ASB8mLmBkMRMDqN+kdxs9OfzN9iKjgF/7psVeMzJev9C/HuGZE3q75UN+Up4qx
	vhudiQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28tb-00000001jTq-1FCk;
	Fri, 26 Sep 2025 13:53:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28tY-00000001jRi-3HnA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:53:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vYlt020683
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yi4YzfqCRhtpYtMSpi4c2pxv
	l7JbhY/mvPEjH/nHU/A=; b=Q6lo/YR9Xww7cyAqG2tiisx9896ylw2lmlhsi1kw
	ohTR9fLm5V8++Jwg6DlKftwyxU8ebwyPmtw3soLo+vY4/F9ttxvcrhDtHQNxZ2zY
	nbsGvln+/gULtI4PVzp+1z1xvWszL4ArwaJhGIUSWfkhjZAvyEloNWQ0bXyvoF1F
	p1+byedn7jC34PreGn9bOlTEB7B6jNgKG1/D7nuBuhNbwUxKtz00Qp/5gplFufs5
	z8aApQK0vHd7+PtPeKCTAKwjEX4rXbLvb4Yl3sIlnJuMdLNJQPnTowtr5VoJxVEa
	bKXXNrTASPK+FmJZNFw9VXEY7nQ5LNP0umsD/SUtD6VNcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qu2kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:53:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d905ce4749so44058381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 06:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894835; x=1759499635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi4YzfqCRhtpYtMSpi4c2pxvl7JbhY/mvPEjH/nHU/A=;
        b=sO8bccMzdP/PP3EsXirU0VVFzWT1SaLlhtg6EUJVEx/uZvJAEqd7XurUe+bgI3fy84
         syFGeb4e/pwSES9WG+YaV3dHS5X6dtDg91jLzvWxY8qK4zZae02HTrnQcMAQhmDG9FPJ
         b/bg9xcUDshCTzoQspwoYaDEjIbSgi9xNfCmKNPtzABy8KvY/9hgkZDJu4RQYufCsM/0
         u8an+5EzdNaJF/hD9sqVdrdqWs1fwNka1LaXxVCEEG6+XgR+CdIuY0oDoq2mUnFH9nRd
         PaBXRPA3dPfRG1Vk3vBEEEaj44LR1hjIhcmtMgmZ1aLqOP/OYIJ7Sh5Znk6tm5290IVF
         OHfg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZwI3B/x7jzU0KA0zhR0MvZSAsJknRLsJUEmj0LuDzLBGHBFSkf8gF9rHivfnZ3+gCNLgbdKlVleHXEUpUCuA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5HOgkiXv1TyPAzxfZifkzWbK+CnJGguqBsLWIGQo6vyuD7X29
	EPx6JCVOhP9d8ULHVSq90JIP7sukdLgW5NRUG0yx6A2U5eXxa6exqjWBo8FG2hoZvqc3tIuvaCX
	ZEZVE5N6D0QI86IFxP7IyYcXS50ZjH3umAd6qBihlOV3xDE4iRfAsQC31RD1hHsSuu1ujaeg/JE
	xyeQ==
X-Gm-Gg: ASbGncvGOj+GxB1Y8e8w+Yy2R+ERIHxgqyusaQjMTdwuWvL+8rzRGYzXJr4dNAvIiaT
	MXAp1UsB2DpViCvx+XC4ngj47e/3bh3D3q/fuwZzpdXiQLNWRR+VxVi7uIMNjA1vv1pWM2wlKen
	sELiHd3eMzsWlfE2g1kTMBhDvx4VDez7bUa6LRWBN7dL8ziGV2uS03j+kp9YBEAVntY4TB4MIHK
	5EUE/dWkNc6ufBHqQHS/Q9PU2Vwz7l/C3K6AIpYE7db296anSYnixCdEzaRyBwsy2ioC08/NeCF
	CCiDDFiOeLUriHfWWCSPS4098c2dLWoqXf+xw24ZqBVZx6sdxTdUES/m3eDXuemCy544CqAVKBn
	cMC53bBqLap4N0Lwpaa5ruCCzfIsiyPGQTMEdJEgPNmCyV9o202h3
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id d75a77b69052e-4da4b1406e7mr95494481cf.47.1758894834813;
        Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOQIkyN74txiM9v6NI3108EID0DXdgO7j0P2wRzxlXTBsHtrmHH2UgL3y0BBRZ8yy0boNzTA==
X-Received: by 2002:a05:622a:4a8e:b0:4c8:79b4:93a0 with SMTP id d75a77b69052e-4da4b1406e7mr95493941cf.47.1758894834250;
        Fri, 26 Sep 2025 06:53:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583173d1c08sm1814560e87.147.2025.09.26.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:53:53 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:51 +0300
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
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
X-Proofpoint-GUID: _RSKFGcOTD0vmlLr0gTApvqdzAnLs4_e
X-Proofpoint-ORIG-GUID: _RSKFGcOTD0vmlLr0gTApvqdzAnLs4_e
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d69af4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=bQGRJ9mVl6_deHTFyO4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+J/PzJYwSDxu
 8HFLLWIV5/ekXHQAH/xFYdk9s+i6uUAZxSY6WFLvq+GtJ1Fb3u6R52wa1rJ0erPvwUVJmMjIQ7T
 +KiA18v0idHGAyHGpWtGiwrrdbxeYwoT9NHLvUbszXJgQi6rgOOvJ41Rb55K53FCwKeEGfFQCGP
 RKXJ24XF1XYg04ZP+VLxRv/5oMik80quZ0zxqMmICJejPxTXdx3/zahQnJ1+sB0Tlx+MxEG1Dh8
 XGW8PG6fP+4ZNAoLf/RrglPhVnQEb9XipQEYPg6dGaeSngYSrhiy5PQXn4w6FDnYSAgedMpy0u9
 1bsFk8o/j0NBMrT5lSbYrrlI2vCT1+hN3tcvSMuqWJi7iaAQ91oPt4szIT0LxuE3n+MYWgnT/8R
 eudDAFnVGcybeMIfKlW/no1Sb8n3JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_065356_824055_C5FAB96A 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> This change enables display1 clock controller.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> index c69aa2f41ce2..d4436bc473ba 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&dispcc1 {
> +	status = "okay";

I think this one should be enabled by default. Unless Konrad or Bjorn
disagrees, please fix lemans.dtsi.

> +};
> +
>  &i2c11 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

