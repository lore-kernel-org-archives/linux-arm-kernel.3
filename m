Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A35C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=C1KKpaiSxfQJx4REoKClECm+Gk
	KdpnbKEiMxWuGqIT2B6BdQxrnqfXiEZwFsvfQhs7vjxFaQqXZmJ7sHkEqz9PzFd3RTF1WBy6fz7t3
	LkmFMmYDaHxK9lsVQh2iyvmvEbptEPidKoZ8d6Qpbb1F6n6fYjn1o9/MTreUCrmhUcoD3IGcaUowO
	o9tYmbX+51r8uPIp12G2I6As8pnbL9Wm6CQyMuUioQSjD5kAnj863ACDKljke3GthnyQ7scnD3Ejr
	fGfGw9/wIqw5voh0yGfrY3WWEdJrT+VLSUHazBrgQR5JEvVgrt2PsjssTeZGquIw3OMUijEgFo20A
	4DlGNX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyGT-00000008vfb-23ri;
	Mon, 19 May 2025 11:02:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyCs-00000008uO1-38nK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:58:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6Oelf006138
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=nXT8/90UtPNYFOVl
	lO89wI7YQKOORwYNbXDwpUcHcHCYJEEnnNE/d2sZ5vcwuHD1lFP11G1pUGwuApvn
	crn7cvzPlakbrP9FtDv28Tme1qNFW5ZXiRzXro63fVro/1EzE9y+ORx6CdZU5kVi
	rEfcFJbXwaegQ5suYLTplGNyNMYqWGlfiH3DZS897k6cc/FtEa/We/gu8MTjqb9C
	ADDaqr8EiaX1n9jIdugSl6TqJSdZ0c1Ye0BZhms2r5FATXD1L/q5fPAZ8SoXha6p
	tBpVWX9dOeQB8usjOVYApGbmeeIfE4fEajD+zFGFF4Z0ZoRp0tLj8e/dMAwXwI6X
	kbx81w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgu8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:58:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b2f0ab27so47894656d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 03:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652329; x=1748257129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
        b=nvJGKcYdRig/XEHtU5awARhonqzllUe2jLq6AcJP0AVEONkPqo5BpsAQkfbx+y+dhH
         ZJ67o1gWoKj46RZUY3YaekrlgpQr+gUt6xD/SImuYvxuvIyPW7AcEeHDHHkq2CqOlJkQ
         vEv1xx88XoNBWlpGUrgugiwlDasOlqFn/gJPzcVUgH1wyoomvVOMaT2m2IJSJfa0RVbg
         NBUe5LuIYLdWuSkZAMAkvX7csrxeq+0Q/aegFp3ZHHbwdMKpvKDggIy0Ymg50KGAJn6O
         dgaecP9ks5IEJkHqOUUrpDQw53vjxkTg/NP6yoZ8jIGEInwi6FNKDa9fJZaNweoN+r7b
         RnBw==
X-Forwarded-Encrypted: i=1; AJvYcCVccpN8xgZb4JwHV2R6/9WhqVEY5IdXqslqCJjXE2tW43SpUp/pFXbhe/UsiCRsrN0EJzFHImMpwX1FtFBwTjtp@lists.infradead.org
X-Gm-Message-State: AOJu0YzQYcqZkIny1JWVz/TFT7gBDcT+X8Nuxw7LO7vuEyq2wIbYe4dd
	UB9MKXS8a02EvW+IjLjIdmJdlAgKdU3/NTcFmYC+wmsizwtgtqqG2GfA6Ifwe4w0tXJYWDlq/Sl
	apX4ddUbm3YOIP9HRVXujegOzpGJSKWgrewgUNAXyAJNUhv42L4zwx4H6wlzY9ORJ1xI4N6f0L4
	WGnw==
X-Gm-Gg: ASbGncvknZyt0Wgjd6GLf6HOQsdSQ3o+x9FJBVRTG8int6ANThc4kh69iopPSYoYlGR
	Uf7wsaMx2rIMkHPubcDyt6xCLcBwOcTUgtzIWDgU8JfOWO5aQlwaYYYQEoFqXsf0gnoej+0Zkuq
	3Fs029oAuuRZt1RrQb298QBRgmSPcz4w76w3QN/QmR6QTaWy21cI7Z95V0KeoP/PMwn6ZTvzmEf
	fUPV148ENMpsPeIx3jF3i7yr2UjkiywiXTWXLD/vvOTAOiISmI5AoxT2XAzHNVgnfMhDinH3zAz
	UGjlhmPgxZn/IzqZ9Voj1wTPe8y98qTCymEbnzM6w0xlC7V+rVdPcr6caodH3XDx3rTYMO0m6I5
	gyfHhmTIYPxdDf55a2d5nx4sL
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr198057916d6.33.1747652329518;
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8hMq2kgsgTEUTk7YggTkRUuA47iDtbotHwLHe0Dgywfs65yOnHSbIBuW35N62G91KOkcXw==
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr198057586d6.33.1747652329096;
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Mon, 19 May 2025 13:58:34 +0300
Message-ID: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1xMvPK-CEQOq0gmf-OEVLOoPvXHOZ0ns
X-Proofpoint-ORIG-GUID: 1xMvPK-CEQOq0gmf-OEVLOoPvXHOZ0ns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX96iv0gS+J1/z
 XTf0vRki4TyEdC4Ywx0akr5ENsuG5l2dzfpxJPW20LhWsi+f+lyX6w5Rsn852rr+bMtJt2qhRIy
 FlxXmmfr8Qy8lruEchoYAcExw0ZONfGuzxbAwRQ2J0ki5IY5l0GoE76UbV/kA/jQCIQMWskO/ce
 bCOWs1Mjy1u/w4zoKZHQ3rrBim/T2WyBGVtN5I0IKr4svum53iUJ0RLUfsBWnV2IbNGCCyb00pm
 aeLT/oJapJk2hj6KF2l3MzE4NhG26Tqh9sNAag2wzim+D42LFtOmEmAxVJm7L3JtWUC2HyRBqnD
 LEZfKF5qE30l7j1OQTcD/BzZ305ydq91rTXhSDGp57PvSCvNlYozgxImqiAaWZVIVzeQHuOVcyH
 ZGRI/eKz2oitUOUpTvfuGXa4NL+T7XMpLVFWdpjryPHpzu5Jh9RoT2Se2djp3CfzPu+2WO4Y
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0eec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=926 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_035854_793605_12215235 
X-CRM114-Status: GOOD (  14.01  )
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
Message-ID: <20250519105834.xjGxkXwkJmI-2_sh13CmR_TYHyb7aRBJYd3-rigd0-U@z>


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

