Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CC2FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy9dkggDlG/oyWyAEZqLIpFqSrbxrGP9rj3trvdXwlE=; b=cGm0aSvZ+vvvGNL5Bm0IL2rTvo
	c1AZQYcT1z6PPA7bxXL71EWOGyJDxRcpQ7t8SB39Tj04KaiIxh+A1dJhgESuRHW7+b7HPrHq4FcJP
	L4e0x842PyuHlsi3s9EyvtnxzdTzF2FazQScqQ/eFpP2nQgpwwjMibCJLHGtJKtH7/l0gn4oNkCiA
	IOcUyj+3o9u1JEZXEuGZQcJ0CLUpwr6HT0ocgsaWarvAe4kTtWZF8WjZGqB1PQoipQYp6INcJehdt
	FQPQrD1J3FeZJtCjUkczfStTclMtJ/OFshM45kARyatuAIu78ujkMeFziy0QcxezdItyj/Au3xxdZ
	wS/LHtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTmo-00000000CCW-21tD;
	Mon, 27 Apr 2026 21:46:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTmm-00000000CBf-1aF5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:46:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLhuL3760914
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 21:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qy9dkggDlG/oyWyAEZqLIpFq
	SrbxrGP9rj3trvdXwlE=; b=XuSY9Nfdj0TTkjZbxEx8vqiWo5cvm6+o9hv/2tXa
	tyBuHcn/g3m3I96iuXILrhhTHT0I+DHin6OIlEt2l1SU8Bk1WDWclSqLFrwimA3Q
	GBEYbGWrJ+xCGZ/p5lXAAQcCloVpbDay13+HIHV4tgk/qj2QiwGcyeCwOu1AOnYe
	TI9ol1ETGWYB8gotbUoCGrhpFx8EWunoUkOlUvgyAOigocMYrXp8rqDfbd+kdLh0
	CUwr+3eVXqieZIH7Unworskb4qnaEjcuCy5p9OWG8jIv9fzKabzDgipDeFzdtEkG
	lwCNyHSDwiMZtpYpJOaqeWj3PPt+s1Zrl8qRhIcnPq8KmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdsbhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 21:46:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f817c3240so107211341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326394; x=1777931194; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy9dkggDlG/oyWyAEZqLIpFqSrbxrGP9rj3trvdXwlE=;
        b=JedIBxUI47JMGxnqtPB3+XkLeNvoHm1wVTvEVof2SphsrZBKwAITd8FZNmU0x04YsX
         Xg/8VTyTmMaaeBqUhVFGM41lFF5QWRgO+A8IxVJoHiPLm0GVP/KypNBGYZgxTOcpkyaI
         Aq8YfGEJIghJrO7zqLgei7B2pHJteWQUMwKDSTiIOVTkDLUwXJqDFF/6RWdynfm6sFbq
         6sJ1Ct3YdJRdOPlNy11JR80ZV1bvham/RFdjq5rYC4fIiTe34jDYrJKe3U2nG7zlNdwd
         WHq5rgtemtfiPfjyecWaQ5JRZNwovgpU0OspQ281Y0C+MS/FIuS3Nym2VxTYmc7t+lmX
         isIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326394; x=1777931194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy9dkggDlG/oyWyAEZqLIpFqSrbxrGP9rj3trvdXwlE=;
        b=eo56k0PnlFG6tnRtYPyk12b1WDVUTEuAZaaICXH1zKZvTrbbuDOz7EIbPXSaPWXyfR
         a1p3fr6PrF/jjPbMt0yz07YKj/UtCvVZqgodGc0ktiOH7yVwHE0D5CRJUTiMPzsHmTgU
         8d4hlsX2t8sCuxZShjFd7ZiyPTR15jkX+aNwRuud0J+dMa6BJ9NLYN+kRQQ0/Xw6gX3/
         TAZs+/DG1osRff2iZbjr3FuNUNwGsY0Miu6jcpCinz4y3PC6P5QIuaRtSmdImv9Jv5kw
         CLC98OkkGLBwEowhLbrHNRHbrKGL7siywwn9R+/USaKJVl/e/ubwXIIuZqDHkM7IJjVQ
         QOLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hWKl6jadzMdqM5QADQyj3Q3egwyZplfoi5LFrJP8DRZOQojdu5v4poROdgI3FB9sVzovKTJhlaI20y1ujzFZE@lists.infradead.org
X-Gm-Message-State: AOJu0YzPCdTZE/FJL70YY09JqLxmX2Gf2+WeYS7m4q5OoJ/7ePoEj2Bl
	MVwHTlkcwlWeyGPrmMjy+BiRjHyMZbSW017tt1SMlQdvq1XCg9iIZjVLveyjvIeomxyqM+g39Gq
	aSVwsBxrnR3l+yVefPHBLjvduYmT3jaMUiVQOewc8rNYFgrf6mCeuNrc4VQEvPSWqebi8gSzmuM
	ryPECMoIzBpA==
X-Gm-Gg: AeBDiesqWBukpKoGlrwfSfHEKudGzfzBynLQmhwUiaMjBHreUH5P84L/MItRChoeCEm
	AX8QyXqPURvaZDIN88uPCFeV2nMS87xVjlqvv3cT+z9kzL5l8rqmzqBQ9BMUUVvv/faLF8B4kAy
	d+/VXUvl6Xg9uUfOXA2/6D80ca3aGCgz07fMF3ccs6ZCcT8/3kUQ6lZbgRomEufb32qroTORFtq
	eRu9ZEEw6kk8Mi9AtCgHpPbaQ01SQ59IjXe8SUGRqxNABdfhm/dGosr0YBLfNhNil42GUzmyvrq
	TUZuDG+1p6aCq49PjXRjITKEXEap1e7Fqp1TsgKbS3AFyw+7c8kHJ80Sism3AoHJ13b4/7uFsfR
	Xp0m3dzddkZNsHPRD1V3X4kjt0QxD1PdvBmzKEpypzaSRKoDJp7Jhr4bJUWutdiYgo0LXIfCHtJ
	pBBEGgseasJ7zwRs75bYggzLfPTMo0RyVKwguXb0lpkMRb9Q==
X-Received: by 2002:a05:622a:1c0a:b0:50d:9931:7054 with SMTP id d75a77b69052e-5100e121b23mr4483381cf.15.1777326393780;
        Mon, 27 Apr 2026 14:46:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0a:b0:50d:9931:7054 with SMTP id d75a77b69052e-5100e121b23mr4482921cf.15.1777326393213;
        Mon, 27 Apr 2026 14:46:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463fcf6asm96326e87.61.2026.04.27.14.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:46:32 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:46:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 01/10] drm/bridge: Remove redundant error check in
 drm_bridge_helper_reset_crtc()
Message-ID: <bovprpd2qb65rggguc3etwxbhzfve2krvmrg2gkfmt7rohvk4t@a2olw6ph4bzs>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-1-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-1-d778e70c317b@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMSBTYWx0ZWRfXzg98uRdokNIn
 kI86JDVBqu4+FbU4oDDWU1vTGBSgSf+epDXp2CXugdHGt6Ltot3RB/VbL3ta/xSXFQwIZ822wN4
 zhDF4ngZOi0X52zMEq9adyDFy4a1G9R2mzKOJjm1DgD2Rf3SMZexl0ZqVHWOjUiqSbuR850LyVb
 SQ+VgcUMXg83lc3DqDOpCCMimCgomvbJvgivOO3MZ8rVJoXKZgpnR8RDVzXnvwyND1Oax7PfHq+
 Q1fQIKUvkGoVLfp0TU5xw+w+KW/qMgLEA8Tk+K459ji+mvXytNYR2cmgg04MIXVbx2cKqCFSyRg
 g13UDo4GfCxnG1gI3/xQc6BJVcMHKBaNgLKqGx13v/afTG3gUbcrPip5TrnGTSN4pZTeQaGonqy
 NW6/0qpI0jqh19n1tPP1eHbD7gydz2ISWsFBQt2sEji00QrPokv+iaYdexq+LmsxvvDGNT2LzmC
 0pCHygKGdWMURAlUZdw==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69efd93b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=-_LoNN0qLOdyQgNrNWwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: nu2YADuzgIDYlAPCSp-VzF234T_MWGA_
X-Proofpoint-ORIG-GUID: nu2YADuzgIDYlAPCSp-VzF234T_MWGA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_144636_415284_CEC0A045 
X-CRM114-Status: GOOD (  16.40  )
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

On Sun, Apr 26, 2026 at 03:20:13AM +0300, Cristian Ciocaltea wrote:
> Remove the no-op error check after drm_atomic_helper_reset_crtc() since
> the goto target is the immediately following label and the return value
> is already propagated correctly without it.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge_helper.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

