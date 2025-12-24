Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0D1E784A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=; b=JdiVhL8MV7P1EhuAVxd76SMfYX
	WnAXYH9gKMMA63tQfXRXh53kQJHMy0jGboUNzrvUz25XSe9sQYdDGta/dNES9clqgTa+WcpECcCz9
	/bFc8ppiGITHVKA15EGKiEULacfUDJaMFEpn3TTaKwVspr8dtUL+n7JtHa4FrkT56HiGhvp/kjXA8
	B4OR/wRaR4d1SfzFPiEAjPl6OpcayOSs7hGPnsG0Jy7HlDuBacjfARAmQLpLXTRiyX1QDuP9aMrEl
	KrhSOMUA3ytsHozFq2n2/zJ6OnDVJYiz2IjcGnbgrA4JaI/15aYhFx9E+EU401+gnl7ZZQZd1n8VK
	EuGCiyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXPH-0000000HSYi-3JE3;
	Wed, 24 Dec 2025 22:32:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXPG-0000000HSXQ-05u6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 22:32:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOLLvqA053513
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=; b=nHdIk1d96Qc6MtkX
	xuvXp/Zbi6UWSasbYHp5vrUsvuW6ONDvVuD4YhdeIkQeli60rQRn0B+IapRcPmtu
	bA+yn/4P/jRcga0RPZqlbubnY8u/SYKA1rb2tct2YleWM5jAJRdXuzAB7u6oVzRp
	6fJdt2KfdwCxQUxSo5ejZac6gkbEFft1VO9cZ1e1MGc3bcOFCpMIPKql526f9NJF
	W783TpjL3LzjyO7lAv9BZgdd3yxY5rn6MTLB+gquC+uOG+7Eh6UbYs0Mbq56WXQ0
	zfnqQ0TBm06NuVdpu76zM8JgzZR2g59EDvRf7T72H1Aq7cnS5vRh+mVe4rv+fYOV
	6+PoGA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kburhra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:32:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1dea13d34so142741621cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 14:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766615552; x=1767220352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
        b=WUDlETlfkTy2Hx/gWAHLs7YNp4QuWdaur1VFEDUmPenRjkp5o3p8wXwOV1f2V7pbEq
         /txJoq71lMyGwkIQBJpC4uoesvYmZLpx8Tbis021gU7oFVNcuUU3NWBfn30eJ66VMwMN
         LcQFgQVk+3+PcUz3JND4KronlIzqCCqREOVOxz3+KsRgDaANrQpt4Nu/bhpNIA3u0sPI
         BDDc9Pq01iL83kWKnRQTamno3Z1DWwOvcDkGqNze4rbA/91nZL5XWFOritElKaqlWPi1
         xAd9ng11Lwg1nQJv4e4Xxti7y4QGP/LBCksDK5+yrQhoMbONU2e4sGyeoT6gEKuE0mdn
         DWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615552; x=1767220352;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
        b=Z/6PS1q0R2XPI94nr+T6ZuAy+BrgYNdCbSdLUZANHv8NXNNTfsWuGIdvV4n3u9mlYC
         ZTDV+VIvZaOveMDlbJs39CubqXRuJ6zq6YDZlgKfqK1nGzOF/twS7Xx8beQ9a/BPMaBI
         6zqm7EhW9HXoP5xb/6IeLcmic6RNm8H/MCUIqH3uwjR4zws5SdYyMfb5pioZzbiw1jJU
         XyTOHvPgeJ2MzHi+F3l17+vzvLs7Anu2MK5U8ElevRLq5BtGJPDHIXXhkFATH2xfcySf
         TInwCqVVSiI9MIO721Xuu9WrVhp4tzZeeBeSkAUecVQ6qKl0Rqtb99IEmDg/dcTheulP
         Ra5g==
X-Forwarded-Encrypted: i=1; AJvYcCXx2BQhh02Eth/3VikyVi/KsBDiUqvP7U6i1HB6hSbRmZEAXS1nxmHYodItGbu2h5BG5Y0XV6jaTmDvIfotdcpF@lists.infradead.org
X-Gm-Message-State: AOJu0YyBu47aPngPTPr31t6eP1r4cdSCGt/+O6agLsDue6CyNYWLlHWi
	E3Cfyf81mBgOyCeXluvWc5uNuU5cmYUy6fygR8Y5aRRewfm+bwvaYQPh07VjrMiaOCQ7HBTABO8
	0v8i3XmsuSqxG/BXrod98qK0Rp7D3n0N6kdwnjIHFiDaxbUT9KiLtgdI+sdG11tEXmGJbSSRgJc
	vqag==
X-Gm-Gg: AY/fxX4zd5MjHzZWLAgEPS2ZkZj78j+/7ENHuXMT3YnV/EH5ZDKwlXjQDkz46Cu/nDV
	eU9xlhX38hHrT/CULmclTngUt1UCNaGENkAJfB+BPuzdI4Jz3WjCbafFl3UgVS+v1OY2i+QugM6
	tJ3lSeYATeXNSakCb011P5amNqih5wKmQH4Z1lnZEY/uyD3E2ptlDvRbm0w+QzMhPR8O9xIseKW
	Vbw1ojxvwFHfeMlYExib4IwhzuHb0hOvBKYCdziYXiNetS7CkLGYcj6bh8UikI37eU2kTlGNva7
	+m86zugxDDa3AEUeRBKnOTguKFo0PeQ9gci0iAE0OjugxGZWMx8soZYFqeVR0LRDlpOMpUiPkrF
	Ok0WSQ+bOalCCyQt0qG2H5pblza1PnvnsSj0yAxTlMFOmY/iNeTY4djAedm8maOppQdnEtb+JkC
	kmFLOYab75FzmPxTo+d2+wla0=
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr319277511cf.37.1766615552558;
        Wed, 24 Dec 2025 14:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn3E7ooVJGy2fcsFLgGKtHFkRwVCp/umZC4k5RBMwllPtRmK2vC1IGq6txC+42jL9b+1gxOg==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr319277151cf.37.1766615552154;
        Wed, 24 Dec 2025 14:32:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122693ad3sm42746951fa.49.2025.12.24.14.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:32:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-Id: <176661554772.2411515.14289224108428205133.b4-ty@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:32:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMyBTYWx0ZWRfX3z21h/RT9F5d
 8FZs02745sFBxBpvz+/nzWifgq2bHTilccGZ/pGL16dDe4IapE9IJIzwirAyGzKDRSWhUKeptoR
 WTo1jl4IuI6pkJCtLs4aKryJRoDMUqPbLDvkIpLrdrt2zEPIYDWyJcfNMBuWIeh8IWiVohdGwFW
 kz2pPo06VymeCvaYQf3Nx2Dqt5YZiD8hHjYsjcj2nf/vGgeAkslxEvUX8ZTdxwMUr8xdb+oEOZC
 dJCfTceL7h/J3z2yEjoFDSISLXZfhn6R3dTArwd85i/tEc2GgtjeM+EeOyY6bJI0vv4EsuHA62+
 +LriH+j8gW6gavTrKTpYLSzakPv200/3s2l00pB1CqBtPBoImuvLl03EviyDUaPwjZhBzidv7zx
 ba5W/0W7khkJ8VFg/rjWpJK+hMz5WAl3Aojr1NkyynDvMOJ2QTgR96Asw4+etZxTBtEtI9pfRh1
 7TA5LwA5pMuYctJDkcg==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694c6a01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jdnYiPbrDYKY_qMFIeYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: viXT5FR9moZRcCrjSNUZc5RWURSs1z70
X-Proofpoint-GUID: viXT5FR9moZRcCrjSNUZc5RWURSs1z70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_143234_096141_9CA59807 
X-CRM114-Status: GOOD (  10.92  )
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

On Sun, 03 Aug 2025 14:53:50 +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: add connector argument to .hpd_notify callback
      commit: 8a717c16ddf261118e9128d7f146d68a2567f087
[2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
      commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d

Best regards,
-- 
With best wishes
Dmitry



