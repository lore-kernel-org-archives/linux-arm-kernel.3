Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7945CF327D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=; b=gxTb3PObQkIKthl90yRhCZHOrK
	KHH7nwqr+Xjuz/avLmrTxW2TMPIRaD4OgvdalcW7dW4M8o+uDjHp79SSM2RfEEmnjw7n1Hyzx9Zix
	9FykrY5HebDmN0CmYQycO0MYx3YMH7EdmrY8ABtl7YWXcQc/k4Hi/W+np9eC13r1wODuEEXy/OHmr
	RyeHGvylfujoiJlIepe/Y5w779fjyiKOw0WCQWjsLad7fDkVlS5PMoFl/2RZJbB4/9Vix4ffce5D+
	1Q0PgCt9brPCclpb2SUZkWKKrjwmvC0hFc+3S7zRXsk2S7pkM31oQ0NkHkOG4hXfYLC9kwxVYvFuN
	56srMBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7lF-00000008N3G-1gZY;
	Tue, 21 Apr 2026 09:51:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7lC-00000008N1v-1jXD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:51:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6eOtx3574120
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 09:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=; b=df7tAtBNSOEWW4QV
	PYh+L9tHKd2hG80sD0WCzKbTf+PwkzNyMtQM+WUZnIb0bFLacmUhKm6B2Feg/owB
	zYAsr9IYG/aIzInS5zplrETdOCy4LmVtvnF8d9eho42WfPY0yoWjdY/S5eT9FZ9d
	PgwH4os3tew/ZaDiDZPe0hnMPXAXfKpNrG21DbT/lqS49asRON35kJKr1yLcVKqt
	BUcdXmgVeqNsc3g6lQn0vzl1boWOn3kG1CawRExKwexBL3XO8DniH0pMLIbYJNk4
	NQlY1Kg4KGs6NlJmdrH1KE28Tom4U/l3EZWmME3jkIkiaYw9kDeELJMnwiFpwRSA
	aBWquQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gqjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 09:51:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eec753a7bdso8608085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776765073; x=1777369873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=;
        b=Zqj+kPXDoXBo42jAirzc6VStnFtOUSTam+TDtKW0bEvi9hHWekms8JXU+hkvwktJUk
         m190wzC+o4yd4BZeyel5H+Ya5FqJd0v4qM6ersqUlRJG9nt9TFcaFgHPpFwJfx8ly+vD
         wBpAXx58vHMDMOy0Ds2/vm6elpBzHhin2s/box9EKVH/83OvNDcLD9dJfBwUuMYQIXDy
         cyX066rP+S7HIAs4yTBUchk5KOKbH3g3j6MEI/Dz3B3iv6cjFkVoetMzemudqWtUA3cP
         UIM1XMjz7TfVjdfbHJfsz+fhhYaaek1ZJdgeU1cv6feOPnGp8vvkDjYUU0ONRRGO0Jts
         lWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765073; x=1777369873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNz2hyaIKunso93P6B5FzOeK7zMcpTMCwZPp1Ux4pv8=;
        b=NB5VXbfmFkuQ5aOIVl0OECJEUZB0J8nKgG8mO3Xhb0EHi7K/lv/9wCfIfOCjobjKPK
         NMXBhVAfniMD9WNpwqrIb/BreQlZgHgd1rg4B0B2W8HfXtl9KP5YTXRxga6cL0tE8sYU
         UDBg2TCh5KE+f6WG8fuoWL371vjhfkAzWMxl8x46VNN+qW0Xz8SU2HGG2iku4pWZIxii
         Ht9EovocH8s7H5JMioyQJBQoBz2TBUG4kPX6eWrKYjuIBZaQfQdk8Km8tHo1G1ggmRqV
         49ebufuJeWEftO0Ir/4Fb6teP0OBNaQPuz0qV5wUGHHJCk2gD2q43ycvoZg0DHC3BD0y
         5jDQ==
X-Forwarded-Encrypted: i=1; AFNElJ94geXmLdew6XLv2mSIXhE6mp6zVUhiBr2S61BR4w8Fdqk52BTIgthPgvUPRMGr4KPhlrbnPYtU53XHxBaHH6KL@lists.infradead.org
X-Gm-Message-State: AOJu0YyEKoo5jjqsDcSXWdiBdwjF07kJrAY9H2sxJbX7c4UG3FvybfTT
	YybIx47SyQk2kooTFzNMW7qVNoCrBddFJ7fksjavoKggINfpRAUJiSUHH/LcPspNBCHeesNuEIv
	XgPcQtCuzKvytTyjT07URTyFg/wvModbvam1ToDbbKENNwQ/ZI+BxTsmPK531IQIhpBz3Orqp+/
	UBQw==
X-Gm-Gg: AeBDievV/MrQIfgDv1md7nKQLAgxz0ISUalqDZsQ5p1GvItROsByWAXniFQSqJPi2T4
	WB4UzjZfuIRYHeGPkIN2eWWSzpdG5F9k9oai9+OqzpXPNZCS1DVQLOqx7HjK14PwvplWWWjFcq0
	mZ79e/EmD2rtpAOh2ByD1+SV++4lye27O1Y1l6AtrlcS1JgHOTOm7LXfW4FMSNroMS3lO63PKEL
	Wn/TitoloMh1B60U1QVZGtkaTjllLyEBgG8QuXzQdNXP7cEcvpXorg7eJ4H3vUN2PDWoAOGsQCk
	qATMuz5+w/oq8TImUuxS86TB4Ka0NCyZzMERuyWPk8HlJhE875Afvib9bS+U4V2rsc1Fg4pnIAF
	QzaChacPBH5vdZ+hzDDcWlm6bSSUc0MZy0KX/OVuopnhr9DGRQIhn0u2uHNGY+wm5Qg9JwxI7GM
	o3lJ59nxNP88SGaw==
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr572408485a.2.1776765072668;
        Tue, 21 Apr 2026 02:51:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2ae8:b0:8ea:c7a8:5065 with SMTP id af79cd13be357-8eac7a856ecmr572407185a.2.1776765072156;
        Tue, 21 Apr 2026 02:51:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e22asm2692461a12.9.2026.04.21.02.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:51:10 -0700 (PDT)
Message-ID: <b340dec3-8c4b-49f6-89bd-61a8233bda2c@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
 <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-5-44d2bf40dfc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfX1IeuQ5+3so/y
 yUt4WdvEl4GM06tXVX4jtSqqqfSXdFeCkKnmJFEYrEL6Y9nRkcwb7v8p5LMxPYXOZwL4Un2U9xl
 4B6M5d6GPSN8csPKv6BKvFeLlPqxBSgAK3rXm7HaZru4MdVZQ5czoDLynkKwnVJYVY0dMvA79QN
 MO7M1zARuj2g+wVayBTZYNWcOF/MRAlvnfpyFIolMS/kXhg835WywTWeiCmqntlC0ZDFv3UY8YJ
 tr2iTdykXfzbqvMcZ62fCB09cW33iX8ePHxIcL8ySg7LBLu7dKe4SUfRrHtQmm0vJI1wEAIM+ev
 NSiMDcXAiZViSDaWN0uJjOApqZAf1LBX7qNpojnnonG9hfyN1r9GB0Ht780v1bvuI6xebLOTYCM
 IlRey+OwL0to31+AK9zj9yzIgOCB1ti3jfiZw1FTbGTPhx+T7IJ+sWzRpKV9/xOdEfe05mJPhL2
 zWC7MjBXI6wNqrOTFpQ==
X-Proofpoint-ORIG-GUID: walHt4uHW0NvLWCJ0zoNgzVoRnlzXtre
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e74891 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KAErmEmBofBSjU3YeWYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: walHt4uHW0NvLWCJ0zoNgzVoRnlzXtre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_025114_471324_004F4BD7 
X-CRM114-Status: GOOD (  11.96  )
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

On 4/21/26 1:33 AM, Dmitry Baryshkov wrote:
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

