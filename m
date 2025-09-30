Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76360CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VFb0crc/qOwGeBvP/JtK6grpmOtlDvuwQF4VkTnYOY=; b=Un/aOPAmQ8xWWUKcrnH76FvCR2
	BdE4IS/mLS3a5a3IFiIUOATj7oF2XPuigQ7G1JOAs1RnOSVyYOvmvxjcOLU6gps1YeF1gH5c4b0xq
	iPLC8vCM0AdTPDVjM3UUNbHWBPRh6fNObxh/+LeU5q4ovf31RpY2wmHrUGswUmY5EUDR4K/geF9CV
	yQc9hZDKXgI4YBKvlm5Jpxou5Q8wOSyYLaZ+J2Nobl1nJ2REIrnNHgxNtEqm968F5GD1DyzwkuxZT
	gyPa7t48gSstl9U5t2EkCA+EdOFf8k5+p6aOpD6B40cFcS196cNxy4Sg6VMQc9jo8jNEflIhluOHA
	sTOToE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gqV-00000006AcI-0IEM;
	Tue, 30 Sep 2025 20:21:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gqT-00000006AbZ-0b4g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:21:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCo3Zg017702
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VFb0crc/qOwGeBvP/JtK6gr
	pmOtlDvuwQF4VkTnYOY=; b=OKIFGfsAMS6m9Xdz77R/OpPAtDirEHauS58EhqBK
	TFdGF65sxJhhca0WWxoGIJzqTzensMRHi1C4MUxrjEccLsQPnreEXG/IYa96Epp5
	vp2O/DWSYZSHs/H1Tcw4yEavtsgQB+LCBGFbhwfq7vmCvhoch6shAXdozWriH1vd
	SGRy2WHwYItvrIRcm2jYNTe/BAZROnuMzfXh79HwM4h/oA7e5RSs1p7Hxtx0y+wD
	0MlAkDlzFu54pcauGfmFnSyJJB/MwnHpl+KEvIaoUsXbqsuwFSOQZWe3U0MkjR9q
	xp1n2t3tcxIZ6Pg9Z+nVVQS/wRiH2YNRsJxFZecGEJpOSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hj2r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:21:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d7f90350f3so5800311cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263667; x=1759868467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VFb0crc/qOwGeBvP/JtK6grpmOtlDvuwQF4VkTnYOY=;
        b=JADI1OB76mLNow8bXCcfyxziAxJq93v+msfqotoEIlYb+xAUIDQrIyRqc+kgV98tAH
         7pcKxbwXAbbqyLPdgJDZQBJOjyS1vXZ0BMOHq+DU7Mawtsp37fG+VQsZA5M7Fq9UbBA/
         ogGbRwcQ+uztZV96CGmF/YUs2LBcmz384k+prNjIVimrl+nWPYUz/Izp5mh/UPo+3N0g
         Tqy6yqIFOUq7qTp692+aIFcn7V3LsqHJQ4ZJ2HB5hULGMV1arHddyi9gz+/MAi1TYY5t
         d+w9sGIKrQQF56grrReFHfT/s7qYZKksqgaaxtlIhdKLsSlskN578raqPPq/rbNYV6ub
         omQA==
X-Forwarded-Encrypted: i=1; AJvYcCUTQRNC+lwgcQjYOn8PJrMndAK+x5yI4q9J36olk3K3JCZDii6mEUUaCslrv/RzwOULMDiN8VQGuUC+H0d4UOec@lists.infradead.org
X-Gm-Message-State: AOJu0YxlfhNvYNWuh9Qz0PZhEfe1i0F1NuYtfwzODcyUiwCvw2X4gVXv
	iDx9O/6nR35cY7pDZJzKphTYPNxJFsEp2Cm1pqX4b45cQ8TfFjvTnMrHUatLLOglD9mjC0G8TRb
	gxyDRQQwb/jZG01+scmM9nILoCDNu9/vMbhcyYjLqk19KUF4q8E+USni6r3g/yEt+1kRtQn7azE
	ZbyA==
X-Gm-Gg: ASbGnct6AlErjxspwTbC7Z/ScG/YzhUsJmUBFExxOd2s/9l9p3ZFnmlnXnCnqE1Pacr
	Q0N16/3yfg+cifyeXt8XyIN4DGOVge8Yy9+wgoYTJOv4vHu8l+NMuKUZvI6T9Bhu1C27PNmMATT
	MjYP139FeRA+0c8/cuZHGhAeluOouUWELlzUTas1nt7bZL53LdMfstL1K4it6rLZBleONF6e9SQ
	r4CP9DTMMNhrsD8QrnrPkUmO0eHN/8l8NoAe043nOR4g8j7QsObbJdhOaxZwbw9CfieTcctIcJW
	EJaSxd9kQHQTqrOgpQEMvpUFW5bT/Z2A56RNurmBnpl+hHsHZ0GK2pit+pBG64zj3MeLPWl/p4K
	PpAicdgP0f5YkTvKs3hLCCsqrMtTqVzcMyVU45RCeBKzNePuY1di6MQBd8g==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e27faf2456mr85876291cf.33.1759263667303;
        Tue, 30 Sep 2025 13:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs3xT3p2rzPd59HRBIpsMj0tVPI+tZJQCN5NZbJA76QgFcZCY2wPZXNF7YjDhP63JSlWg6Kw==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e27faf2456mr85875861cf.33.1759263666813;
        Tue, 30 Sep 2025 13:21:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a32113sm5289277e87.102.2025.09.30.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:21:05 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:21:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <4r25h5uaamfkprrmvrtdqfjlcgcnkfyca2o5q53hteta7rlrbq@xqlrjxhi7z2u>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXxE0qZ37yXiUf
 v13jtAq636OP6LIZcdeXLvALYDEuavgR7yz40MJ7bh+hrH3OxnzAanlkLoKxpa+JYzJW4kVpdN/
 SHlqJqSXOAN9QeVk+AnJgYnn9/NMs2JFWz6I8Wj3eu2jjqA2wXkzRlAX7/mrIPS8lHPWfVPvj+h
 vL3zXtrkddExjcv/dcV7J9T1Dx36nTBcTKsMs8gniShD2rZr0ajtbj08rIOxJHueE5KppNu3EyJ
 gqUrQGDPwtvjIyTDTON8L2Uy79AdfLpQY0zsEia0hPwMPFbzdgWxzpMEFs++SjPHKNW80xTKv5F
 NhedO8q34nK4+e/MyVV01Ui7RoImKlY240rJXz0vM58B0ymzLELqR/zhxEoDj3CSkp7fUG64Gr7
 awqSx0kQI/HxfUslqa+dDf/naRGYRQ==
X-Proofpoint-GUID: y5C8_F8Hw1qp6re1RHPO6aTNseOxGzPY
X-Proofpoint-ORIG-GUID: y5C8_F8Hw1qp6re1RHPO6aTNseOxGzPY
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dc3bb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=2L4VR2zxEnLzMnak7dgA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_132109_185171_DA7C4EB2 
X-CRM114-Status: GOOD (  20.38  )
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

On Tue, Sep 30, 2025 at 05:09:13PM +0800, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
> 
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
> 
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
> 
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/display/drm_bridge_connector.c    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

But I'd suggest pulling this to a top of the series to let others also
take a look at it.

-- 
With best wishes
Dmitry

