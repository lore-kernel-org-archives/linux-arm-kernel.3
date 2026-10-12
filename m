Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA2CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=; b=XPcmJKjZwysji2jXIYWuLshw4l
	H+NUDx1Gv8yVBhays6Dnz3hNx3gVGcA2wKCloGWk1saaFavMVq7QvSIlLqjK0t5IK8Lz5npi5O6c/
	fJBDFDaw/knr3IMxwx/zDUY7zbl1dAK4Bf1sliZGUwCa8obEE/viTspRIhHBgwlSUb/2pqY7TFRqr
	kvIbZX4fSn+UHsDZm4fatWaIdjkAJmI7B4wt46n01W6WCpV41mTqND24jBDSgbDkQEL1ozGqs72T8
	3EHJ3GbBX2Xiu9paltDDPirbvnykPzl32Jy18h9eyGcUZ9pLa/4CzS9vERBThWy/INVqq+lMweJif
	JPfNkFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH8u-0000000AhZR-17Nl;
	Mon, 12 Oct 2026 14:36:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH8r-0000000AhYQ-14k4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:36:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0b872679930
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9HMb+rbLJfcyQVlt0skqJmt
	qpokfqdjdof9s+dJvi8=; b=INGTTlaKgMcesmWieZ5+nkXVfzKBctT08I2hS1+2
	lrAfjshdJKeBapa44nzbbOQK+iIA7HCBxWG7HeVGPhMG+S+CtJ8BpiJOkiw7J/xR
	Cnbnnk0ynBhXsCo5nHSZO5sICr/dOsKCaQPOorI1LmIlykwa1bu/tDI86QxYUMee
	oTjT3N3DvWCHn5LGjoIzrAplCoX9cbFVQrCJzaxvlTF0pj7fLcEGEejbA1fIw0YU
	TrRYsefKmZ/aIhja8bFTxb4EfWGarC7VB4kSdBASJDKCMOP0uACKfeDTRgv0fSvU
	cS+uBNPtjRUiBW2aF8vjernE9mvzGV6Sut95H4MkvAu6VQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tdr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:36:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc40759b2so456994885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815800; x=1792420600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=TvBn1HvNjbBszoIg6QZbYoU9lBHmhKOV7iFxtvOh03+VInWPaXrZWdd7xOGiGMu3MS
         /8+7MTdnvZlAFe5uo1bFZmkGrGozk2gNiC2dbObyfxbnjEzVHW83bo3TEgNAZoJcd3XM
         kiZy2V6XdIUmCjSIuvi4m8LglYo2VK3mfzXI0wn7weo3F/t7+0ETvrGEUBe/gSkpUXaF
         JwC0Xd4tzylJmQtLQfK+Pidr0MnTUy5AwBkJ31pex4Cjk6l8qzoOZZsT98KkAeiU/RaV
         YBsMlBGqnINumfZZR2QYmAph0iZsxPV9U5JVEylc99Vz7sUhCwm/2iT+R8v62BAFCl6M
         3Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815800; x=1792420600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=xFQ32Yw+6s1PoH4eg0+HEHzPcT1+Ky454SsYxz5XT46TqtMKS1kqWr8rspZ2wwDfqv
         TAr+UvHCyExZva7i9Zcl6GTknlM2+6Bw1TwrvLbaeHHRaqC6TQGAbneGRCEFQHgKsAEi
         9D5KEoz9USSmfhouFSdIhb/feB46WKcKUBS9DO3QFQ9kP8gXhx7F27D7aHWBY5KfQl4l
         fb0cn7M5FXMMiP5oPXg3kMYmAAWys7TlvVrj5uUnNrv+axyvDvRJ/tILxTON6h2ucugt
         9sXbGi3PUvBaJOx3MGM4peTH0sx6tPzZPoBFcn+LE46D4rm7KmD4S/Yg0CEiNPAHkPJj
         5ytQ==
X-Forwarded-Encrypted: i=1; AKwUvByFKJSYWo+FbVBqJHM7igHQL8MJRU9i+jK08V7rGyR6sE1uvFt9My+FAqIlYAmA8XPrbAVOOgrio33DGXPQpwuF@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+h2LSCwh2WLMGpSloThCf80zBMX7tlMk18O7I8YABTpTur9YZ
	uK4yFXRiRQjytD8V30M3t1R5m8dIq2Wdp0i9aLP7zbWLAHwGFio03yRviqjNI9spW+GLTRrnmyy
	Phz5djCncd6vIk8b9fmUO2bHIiFOqzIgM+6TM7cmibtnVcjgdFDkJotAbM9f0fyaGE2+hDCYtvu
	OB4Q==
X-Gm-Gg: AYBFou3HmGD5KIYRjTOMjsUvwHG8S9K8PSMcTNF0R7y3LlUv7Ko7nbTrrP6oVc86CEt
	0Ure6XG1PxXb+BHGW/Jk2U0seeuxw5XWLPemGnWFfnW4SNjLAOaYnlIZ9ZBzBEGlpLEJAjL+4cf
	ABdZ6ihoEmdc2Cc36aR7Ja75XMpblAdEh+LPwr79xNl3f70t4OnIGi4o8up/3QLhDkBF5a8blL9
	aLSJukKQ0cNkGvPISmgjwY/judGUMBf/aO0WEnNU92VeIavhE5dzhOIm1QmW6DZ0Y0MS8/MaHcW
	HSkCPT2WGVni1DJXPonHSpyblkFmikB58faeBsJvPsx9xJg8GEieltYy8V7H1d89rMAwxAYJu86
	1WwIQfUjcd+Q6K1BYyeOmI6nnfeDg8ulZ9sK8bvtdm46TtdaLDm/lj6JKmDiOHQWQmdqIclKCQc
	0sKJhWBUJCl5sT
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634167685a.23.1791815799496;
        Mon, 12 Oct 2026 07:36:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634164385a.23.1791815798995;
        Mon, 12 Oct 2026 07:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2933145e87.3.2026.10.12.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:36:37 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:36:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
Message-ID: <oxdplbus736krf5p6ilqattox57iv5htwlof2otcgk62xgkxrh@wg2yt2iogwjr>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
X-Proofpoint-ORIG-GUID: Qvnaieso9D4C5AoafDjsy_RiTIqTvDke
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX4Gg+JjQRwwbP
 aZeCAGs6dqAPLy0ay57+0cd8JCsrhr54bbILCUwPrmxQihmUyZH6gDcoyX05bejtW+PlNSIGGd4
 TICj01bNBJ9RLF15U98OR9eb0Ay51EU=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accf078 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ksxQWNrZAAAA:8
 a=q6X74nQK2RvUw6JQmdMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: Qvnaieso9D4C5AoafDjsy_RiTIqTvDke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXycuFPKoXa4wx
 t8lND8+GP9u8xLNh722jHV5WeSkg07EIUWyxlJ/r3yiymVprt9sn6lYBH9OBiWeUs2ziReOK8Vi
 RgBzNbAxbHSRaMGx2ACh6KEUo03qy64lqE4vKGfUO3dsb+n83m+6Uh01bzGRrurJ++7e+xnUlZp
 mQ8nBxFe2PCL9JzDw6VF6N7M1A4Wj+4vse4YpizFjbeg1A6hjLRDpZMoqcFJbx1Bh3BvFbzMpGo
 sPVgKb3tSx2QuD6hrW1EV3KsEFUFp1jYBTeRzQ37/Q9/QuCcmZz6dtH+pOKZMR0wGxNaxNNFCR/
 6eo2hiDENB4VtlhyGYGqEDjZmFplJEXFCptRAMOe9InlJWvwv276yOz8s34a/75zkUNyT3YRTQ/
 kadfIsBnXiuT0mvrmYvQJEV9MYFYP9b8KmlptecjKTbBjMLuL9TAmYqZbw0V9OnEqs6fhP24yLr
 ywBThEsjqr4p8Ezrz5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_073641_409331_1DDB2203 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, Oct 09, 2026 at 11:16:08AM +0800, Xilin Wu wrote:
> YUV420 uses colorimetry VSC packets, which cannot share the automatic
> PSR packet generator. Do not advertise self-refresh eligibility for
> these streams while disabling PSR in the controller and sink.

I'd need to check if it's possible to handle both. Otherwise it looks
good.

> 
> Compute eligibility after the common atomic check and reject an
> incompatible self-refresh entry. Clear the automatic VSC generation bit
> for YUV420 and restore PSR configuration when returning to RGB.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 16 ++++++++++++----
>  4 files changed, 27 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry

