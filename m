Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F287C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=; b=UmHRtAOgf3cQOGe5dsB1darX+3
	UaeAdJz20NQiImh+SUzDTwVe0RNjHVz6e4XrCtH99hqtjr3yxqQJ8AXOXfW2lErofZmxH2T9cMKwe
	uTISj4NVqFE1WY97pVNemrJUPM+0vfpRW89+8esj6LEZ+BiESt1TR8u4GiKkN/vV5FPx24apS2Q0z
	MbnK/w1wZ+RrQvImvdtRETKv6Gj4I7uTeBGahy5wWptSSBBa3PUhBqE2ij3Lx3HJLYT6RNPJQ8Dbk
	J2obpqVxTG7d4t89B+gzW2c0QrI9C1Z5m6PiIOtJvtwKmQ01KlMvYS2i17VBJMaKBgKINwcaQAFev
	EtH0hCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeGj-0000000BlxD-0mxI;
	Mon, 06 Jul 2026 08:01:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeGg-0000000BlwW-0s3e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:01:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667C4513845014
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 08:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=; b=PNJc616WMWAi/P5h
	KzviJ2QOcmxmWXrNJrOBf186e8ISZSGtk198bVxyTL1x8Ul2sznEyosF6vSU+S4o
	1Iidcvx0nJoQ0rt1im8IZc8p2GU6PoaLmX0Cu6oBI1wjZIHDlvbj9GeTL4QEWcSo
	UdL8TInLCrszGVqnQRAA7vKM0/0QKz0fAIrUjxHcJ5Vk5gRH8FU38XhDAEwh8pUb
	efJLf0/aAi3C8d3e2nd/6vvEk3QoG02CApQOj/ngfc8Oqpwg31zqE+SnHkk2kpCj
	/A7aZ80v+JQV3/90uYV2iFw9EGC9LN2hFw6xV1ivi5vuW5RVfoYOs9owJxpaojO6
	lDdtAA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxr68q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:01:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso93881137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783324887; x=1783929687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=;
        b=C/s3CAMUSOW/SaoJngx2JuCoU1eGeDRF9p60ummasfrncAWmdFA6zfWDAoDvv3y3tv
         fjZ5VGfiM/W9QPX5GO7qeQIgTDifU3ixsPHcpM9s8yXA3e2fxIBV2MIxiNSqd5OHTBxk
         TEpxyjFQk/cs6VSCTlHYFJxr1nJ5Vg12J8d0y1OJjlfB7Apeco5wgpBx3tuSrWkSmnbD
         SkLmDDqlRHUEINK6+2oAO63KDbDRHBBvq6oz3xMhu9uWuE1psRKvHmyYHyPgzShPMfbI
         lUdwK8jF5I+B0+8v8V3NXrWtRteIg4f1fjDvFU/g3qIXtSsmhIlpAJwbPaEGNjTntiCf
         CvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324887; x=1783929687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=;
        b=e/4oyBuneoI83qk2MjAsLDki+A0kNluLr6EGBzcSFTQVvGulGjobjLETIK8iUlP5OV
         XrXHp42qMZWvKHXV9HokxQouSLOS8XFg5aEqUTLLKifIgM6rFT85QqJdELtXuBT22EG7
         67dzvyH5aNlwvH1rSDWuPD8j2khmd51+GtsiTNEt+dIf2/ZxyuX6rJrkAVjfi/ghJnW8
         VHL8DGOkMZMP4eZIMw9Bwn2ZtXVgH7sWcW6rZS2ALbSA/Bsb4CvTvK5gFUOaaD3vlwvn
         DkzO/BOF6zzIN0ArNrRWmB/GKh8SzD9Ir4jp2ct94bc/NymfWvhGOaCPFxjlBp8iKFpR
         HHLA==
X-Forwarded-Encrypted: i=1; AHgh+RooUJg3kKbegda1kq+dtWOmWTI1EB2VlYF/9+Nj3/3s92jRJ5gKO87Qz08qQ1/AEasmppD321KbODFy+i2UUHyh@lists.infradead.org
X-Gm-Message-State: AOJu0YxhXcqBhgNH4M0F6bXEEghvVikX0UpV8YNcegfvQpSylHUdq0vD
	b+eWcYWDN0FRTE0oZKQKu0b5kufMt4QF1TGedMIYxXciFBUFSCWGI1T5F9DOlDck2BKF/Y1VB2d
	e1zMRjESVbELM6F9GVVsavHNBhG5g2+JDgb9o9e/5KrjlfwPV+TFgxdWzwiPQcozTqaYxzoZOhh
	X+8w==
X-Gm-Gg: AfdE7ckg4A43vN6AtL4AQUvy7X43IlHhcAsTUnL8ctXDjtHkW1CfTkY1YDJgZRW/ujA
	HFcMP3b97OgUcgAO7WDG4J12HZxoCMWgIZ7fIwPfC9DVDm93YFHV5hNodNAVztulxGCuMuDPp0e
	rRT9kIzvpyMMk+5i3bALbO4j/3hq1oAfaEfrZnHd4qro3ZGHK1GL5tck4LBMYEHLnOIv2X1J4Zr
	0Q9KNNeeI0GTtYEZ33wo2bGwSC08hORWMONOzLFibQWeYmyAIICwexy7fpc54w8NUWAmWMEkYlU
	9PHUnMR/EuU6gVDFGU47SrT14r3k1FGT5JZ5auM1ck7HS612i7SxXqZJptcNYB+o7vfKbe4UfZR
	1DCWC9ArLjpX+TIYxzReAgWNLigkkYzY85do=
X-Received: by 2002:a05:6102:5f02:b0:633:3bf6:977c with SMTP id ada2fe7eead31-741f6b12922mr1165574137.1.1783324887383;
        Mon, 06 Jul 2026 01:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5f02:b0:633:3bf6:977c with SMTP id ada2fe7eead31-741f6b12922mr1165550137.1.1783324886847;
        Mon, 06 Jul 2026 01:01:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d786e7sm3638842a12.16.2026.07.06.01.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:01:25 -0700 (PDT)
Message-ID: <f55c20ab-681e-423f-8d51-9c1def0f13ea@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IWnEBGTk5WFmbqh1DuE_jkTWRboWHSk_
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b60d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dZuxl-eQfz5dsBr31XEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3OSBTYWx0ZWRfX7NgW8GTH0axN
 aH/X1NJIvHTN6f+SZHhGf7QKoSFNjAfw+LXYweLtzqxo2SuNOCVaf4xPUzqX4ev8z6frm0y+ZtM
 B6Z568c4Jr6IFrdjdw1d2zR1gUHsjso=
X-Proofpoint-GUID: IWnEBGTk5WFmbqh1DuE_jkTWRboWHSk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3OSBTYWx0ZWRfX/be1jcfpA17G
 Xm7QtuXtj0HY4F0FXMVaojocZ4VUjnz4tcXIY6uEqyUGglhzuTED3ikEd+Am3tFRiM6yVmdmHUL
 orfmw6KuPhGmJvjN/LqSehsbP9tdm5p71tLpNr+xuE+E6dsB/4kvHTadDdJ0FUcOBcExGOTNbwW
 7vRp4zFJ9du0YIQoKVG8+Xp4rdNx2BV9PKTj2xDg2nkxJND5eMtapc+BecyBud9zTO4fD5gdcvO
 qPaaTuEv25Qsky3OmAzM5LDqugpm8W3B2skQAyA1hDX58GABnv3b8lG6lT+U+aLkFjPIjKVZ2Pl
 OOyRPlZB/yYjtK9RNNAMjSM1PixT4Uk22KsKYruEjG7GjWx4TKcNYAPJoAo/4TpTZaMHadMfu/t
 c387nK1AhaxdheMDBeiPCCF4xJSK7vTPt64jSbf8MTEhwNXMZYzOQEqYUk5lAM6/JZY5sMQZiJE
 wTTsV26eS5gPr3WmJnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_010130_255369_9AF8DEAC 
X-CRM114-Status: GOOD (  16.63  )
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

On 7/3/26 10:34 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQM EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 269e11bd44f6..8206dddcfc75 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -50,6 +50,14 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/shikra/a704_zap.mbn";
> +};

Move this to evk.dtsi

Konrad

