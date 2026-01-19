Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD80CCF2E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=; b=Zb7H5Ske9KJXOGetj/HsHMIKmR
	QJ0doqBCI20iWAnCJZXmgfoNNlSyWyS1Qm3y7nRAvk9OvKLkleloscUFJXrBTUNaXZMJNTb3Tj3dO
	8fN0K07aMDtN/Ut5Z5WRKI8MvpAcEuCTjxgN+b7VqMgERhVwSh6jZajGFpefgh+CI0Varq7TRu0/A
	Za+juU/E+rkHu/lP2jZmIPZk4RvfmEsrfM6k5WoyAGuyZV3sZSAZVO+eLYHDo4C5PvYVczFtPngY1
	MLa0g9TqXAnuNUfEheLsQ9lhVBMaVV8RZJ46FBPVFMTNtnZtFQI7a+nDMdPbyF5or23OooR+xuqZk
	ItAkpZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnNH-00000001t7n-42B9;
	Mon, 19 Jan 2026 11:24:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnN5-00000001t3f-2SzV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:24:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9n1xU2965082
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=; b=lP4RYpxktNZWtH0q
	cczG7KgpgT8mhMgot0FCfT/iPmEgjUJ8hI2Na734lgGTU16RJ42ob1StxS2t5JwI
	z5GjAZDFI31SC+APbxWAjKVWJ++/4tsROZ1Rdz+mJfTn2OBg3D/tOmBKNFAe5cqe
	GylGiQw3AYCDStqghOIBxXD/j3kxoDl3tbDQhl8b9nbKYbc8rJjKqtOiDHo/XwXA
	b0TGaefzFeBiUew/1zuFeSW4Q14XZsvIgqprTePPqTL+wWPnhOq9D7cKqpCLRzvS
	L6bD6KLXH7pDQRZYJ1s7FduXAHlQ/cKZTu+oS3N4VDKep4jMvpqbeberhWnoWCIc
	o1GfZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa89vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:24:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c67f65cso185640785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821870; x=1769426670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
        b=Hnl3s6VOOrNPQ5itlZFV9KnkasyoSfDM6MF3OIjUCbMxaRsK4Ve0WOAtLyNjftx3Dt
         P4bw+n8ZAwcFDRP9WFIKmGRMzZRMJZSf7FHAHY231yrQ4q70D9JGdRq6evpIJKTiHnFn
         jMw60Kk+esvfJyraXJfZ7mHFOEPxSiul4mC3UHmhcFlSXXuKbJljOm+7Xxkbgo3833iw
         VWY6xytLkjGm39UlOhs5xaAVc9o27/zbv4+l6lDCS8rSrAAgTY54aK1+0LKsTlXHOm+y
         KZtDIvFxDgOj0SzvRxCwk0QVz5/54YIhx3Apj9lpDPwo4+RpnhzmoaaTZgoDrKvprY0x
         KGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821870; x=1769426670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
        b=LWOChC/xJ+zQHqgeSQ0ikKXml7IGn+QYJ/B5MWYDctqufqp6xFi/R7Na64YWYnBk4L
         U4pCHqqJe8nSc44W3tDpScdpL+Ukke++Grd2gchs8HDGBluvrYOZymupZy5P8fDzg8Dt
         MjqNmkw3hXVz5wbMyQfIP6t5ufGvyT56r4AD40alV/e4JMwilkoKHO48Xir6ZxuN91bP
         aGRoSQvEcxEq6MIdtH7FN2Ec3kTCmDBttFCA8v/KR7TEhae/VbbX3EjutsN/xqlhj8o3
         w95+9LIthRaLEj3NrDojxkgdFLOK9jfGkrjC+DwoX9SpKgiEbBoLHfq626zgoJEonljt
         O/fg==
X-Forwarded-Encrypted: i=1; AJvYcCWz1AGvx3JAa8WuDJ2SWfdl4phZchHNYCpqLXbwF/2i/B1eF80U6z54CByRb7H9uXWSQ8cjFDg2zU5UkQ5SzuBW@lists.infradead.org
X-Gm-Message-State: AOJu0YxCUi1kjYj+r/1kKIOYADilNnOTeJ1Gkt1WHbV/KDQ9HwG4vM8O
	acRLd1HUlkQ7SWQrRUhDrVjC/vk6Afoe2CKo6lEGfeEn0UiClLmUodLQxlw/7anjIcLyi3dPo9I
	KhByu4QqRlvj8fQ2HYgvz2wkHKLJ9XAKBuj7qOW8kUbLsKTECwDoK6ZG4Vas0D9ByBT/T45ZLG+
	GzdQ==
X-Gm-Gg: AY/fxX4u+Wpnq3SnpFrPVV+MopDuNKWGbxKI0TFeMwh/5kKS2HuaH1drKae8L3z6Evx
	f/dXLgKZMZgFvL6sKoFN6u4SM1XKDApYtk2wNBnCAfJQGJIonsZIb5VFb/jCSA0KNvRA56L5lV3
	VT1mt2mUMWyv9O1u/slzXgJChkLWX+vhXSHnPJhFyn4JUQuC9AV6jvCLdR77ty0Xw8d2Ft+nfNl
	Z3t2cwwjVHM4jUOeSvCQs0nzy6cxssD8ipkvUeJdUn7QkxtF61gbfUbahOcZo18v18A1IAVy4QC
	LAhm4MiCdvLNdJxwcLP7fuCBff4NuEPYOy6kKmPtg5/ildXgtPwVxthOH+f/bWWK3bgi+kGttMl
	XFoWT7kjnS7DrpiJL9uDf1Gv+V0abaqckSu08JYq1wZEP+5LilBavQAmpRCMgLd5LA0vzLMOk9s
	55BAHrl+cS085Itl5lWEJfwLk=
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c6a696323bmr1545280985a.90.1768821870216;
        Mon, 19 Jan 2026 03:24:30 -0800 (PST)
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c6a696323bmr1545277285a.90.1768821869747;
        Mon, 19 Jan 2026 03:24:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9ab8sm32747931fa.48.2026.01.19.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:24:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver capabilities, second approach
Date: Mon, 19 Jan 2026 13:24:27 +0200
Message-ID: <176882185857.86521.18172781461760523152.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX2jiN3lTEMd67
 HxS22L3IWCpDBcgOj0gbd6VgIH73RssTSkmmjXkhZvcxcco5VN3j2Tj7Kw8xQxz8RoINq71WLNp
 DyGV/sIvXWE7zkAcf0qsPVaY/YdDjTpqRASVa82KjfeikNmi4gPJO1f7q507dFnkhh6iUbonH8o
 c1sAt/3OHoTlrFaI+LyaQaNv4nJAFn3oCXJdbkHWqYgc8vUtbX5VzWmbWtgwt48XisT2iuwfaXN
 3ykgmhiuEfPXv9ke3qmulIShTlwcNXIq0UKO2xB2gC3y6e0NjPI1rM2Lag8dljR7TUsInPy7EeT
 wSwtWTa0uaGYn793vbFxwJ0DGIFmXO69Hp7pZItbNDknjVx3XE/aW2mtMIQEwQ5jMj9fimNj8jp
 4A4O6aKHAK03C/dOHpO6YXy120cpkJACpw0nqosG1x1i/JPIQWzPR6DcTVpvWMLLyclHhAVgdGV
 o/t15Ot3sCCZyED9PCg==
X-Proofpoint-ORIG-GUID: JMDawHlh6VoHuITGqWAEn5iMV41FPDSo
X-Proofpoint-GUID: JMDawHlh6VoHuITGqWAEn5iMV41FPDSo
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e1472 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dLs8YEEMlrLrhmPZdm0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_032436_584441_0ED4A4AF 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed, 07 Jan 2026 20:14:57 +0200, Dmitry Baryshkov wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. Currently it's mostly ignored by the framework: it
> calls write_infoframe() / clear_infoframe() callbacks for all frames and
> expects them to return success even if the InfoFrame is not supported.
> 
> Sort that out, making sure that all interfaces are consistent:
> - split function interfaces, having a pair of callbacks per each
>   InfoFrame type.
> - write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
>   for unsupported InfoFrames.
> - don't create and enable unsupported InfoFrames.
> - limit debugfs to provide supported InfoFrames only.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: check the infoframes behaviour
        commit: 7436a87db99d57196c49d10de35f41531993d5f1
[02/10] drm/vc4: hdmi: implement clear_infoframe
        commit: 3a4ceb89a9723088615ea1c960fc589f87caddb7
[03/10] drm/sun4i: hdmi_enc: implement clear_infoframe stub
        commit: 638409979c5f7d3155afcded67532003e07a7d0e
[04/10] drm/connector: make clear_infoframe callback mandatory for HDMI connectors
        commit: afc399f7a5ea7bf405b2ef85c7470529b1a9e47c
[05/10] drm/bridge: refactor HDMI InfoFrame callbacks
        commit: b626b1a1c9ccadd8861870a2a450f02e0c61ab88
[06/10] drm/display: hdmi_state_helper: split InfoFrame functions per type
        commit: e802c783be94bf71541a7e2ac8b1b5486aad10db
[07/10] drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
        commit: 1d8847f457648ed4932019dcd3081bc27bcea936
[08/10] drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
        commit: 4fc30c2c5c61db88e3d6644bd3dd2032ec4bee06
[09/10] drm/display: bridge_connector: dynamically generate HDMI callbacks
        commit: ae219fdc952c315182b471f5aa71b379584b70ca
[10/10] drm/debug: don't register files for unsupported HDMI InfoFrames
        commit: 5a4e4e30f6dc4d2a68eec08257128906572f3346

Best regards,
-- 
With best wishes
Dmitry


