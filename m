Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D4DFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kneWNrGg8df0C14GIVpb/xc3dEydoRSqCYt9jI5CzM=; b=HuDVvL51pM5f42LTR3aSTOEEyf
	ENshXNwR7/bf1Xd4wsnGboMSpQ45M9nzj0lCNzzysnHXSNrg74YyjEiiVL0KNX9VcLaocBu1JQCi7
	XCUzIyV8pKUIKzF5Z1j++VqpfCXiZzb2PMjW8Az+1UnGpYxuUofwANIK+SM7LrLZzQkw8qVd1MNSt
	vhb6p1qVFVxtoBwvL5fQwEjk1P1vmzZq+Tk8+hA+78+a6YjBLE1ob3Gbk47VxSADa4KnKhirsi1kL
	CxEH9yDdfAjwzXxWDxQtlJ5D59QY9DIrM666YPYQQoJGjSRu+wwcMtlbzuWmoYhmF9dSk2IUUgkdR
	nCaRl8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgfs-00000001M0v-19hI;
	Tue, 28 Apr 2026 11:32:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgfq-00000001M0T-1aBl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:32:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA2tL3984995
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kneWNrGg8df0C14GIVpb/xc
	3dEydoRSqCYt9jI5CzM=; b=GezK6A7zRdMiozihV2C5gPMjmyGsahgEaroITplR
	pRyXTwnF5bdY+3AwI6eT9eqOqV96WrxnYB34d6SevQ+poLQbcoz515FoViHLaaqC
	MndYdUBMb6P9iJtM5Juy1Ns2sQExkUgXORJ0oj5Cm9NK2D58sWTT6cpEsx1lI3Xp
	XybwrVA1jYbpw0VQurcZlHgayuYkt8eJINLL7NmZIR4zYc8aygI6QxqksswZ8YYm
	UEdLBRWv/cYMzhlI+xpoMEsQKZMDbSgGBjhzmHdHBeTfrEAnLzwc29svQpHdGq4m
	hfBJk1osI8aezaZMYn2Pd631MryRamopXIOLOgQ0rITyVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttt2ra16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:32:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6130270a5f1so15478775137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375937; x=1777980737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3kneWNrGg8df0C14GIVpb/xc3dEydoRSqCYt9jI5CzM=;
        b=ULIY1yGkSzVysTTpQ2dvq7vGugRMuDg+AgPRo7DPgHjgsuwiSjG2NQbE9dVwysZC0O
         CTYWkm09td5SkB57g+BMr6lK0vToqjS6dRKBjbhP3qZEr6hwrHNWgpP2I3iUCTRTtCQr
         e88VX04as1zV5awxiJIlKaFCsc6TGoci4iMKBTTg/2KKTi/zGkwnYGarauPaz2glsmly
         LE3rE8b3p/mmUSx9HuboGNBIID1wC2UNkL3/4k3VbA4Xo0ho4NxI4MqnMcVAsseMeRiB
         y25EdPXQYmhKHvr3Elsche9SRv5y3XEGB6Svy5qz1WfSkC7R/FUX0Hvy7mQKVCkkTqbv
         zTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375937; x=1777980737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kneWNrGg8df0C14GIVpb/xc3dEydoRSqCYt9jI5CzM=;
        b=rNPIKnsKu6WEXUlouMyi2iVGoZR9ahYRybnv4v0OaThj98QC/Vvl3/EWs7+OFVMMXs
         7oLBQpjPUThoCaDjY30iOJVmIeCYM77uSdeKT98TgFw8GVTJsfOzhmeMV+UEVuKvekzB
         34U7ORYaZsy3Y24p2a5LvCi7ResSEoglK4Xad4809ED5t3Ishet5F9dtWivKpM9EzVsv
         XjcfY0iHQaGppCvU2UGIkFMQLqpjmIg+9Yo7CHCqRLxGZDYyChMQuV9JJzaxgGekR5AS
         bGLgWexPRMikZpf+X8INIaTw6dUTg6CBjhq/fvOZw0ZuCCTJzEZ4ujYnhdxxJ3P1qplP
         A8eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E4izu2bTHPPiRofhYgTyAmLR85opRfYw7kxdTykXfh124s6KxSFtEBXd8A03hHAAfIzJxDEqRvxa2Sqd60sCC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1AtVETtbNL7Ut6q9xL6QL8PFsAOA41jnVxt2R1q8f7XIH9IQp
	96ySu3TIYBb88Hgb6bA4a3mb/OG0tWw6fQpJAm8vzpRXHgdOTz6CnbUqJWIDAnSbQ4SV3yEZD23
	0/P0Ij7VBAXnIrj8wxj4O0H9QIwO8pvlvJ1dy3/tdfmjZi2UEZvidAs5duZhfGy/AAEzjm0N4mf
	C9G0tj1BkTHQ==
X-Gm-Gg: AeBDietfYd9HZIv6FNGAggydm4YN104YyNWtqbz7mgPTnEXJeXw2IYIJtEHyKgtkppw
	RA6RD8E3hpnEsHIWW5/5F4RrxNgjlciWltrBbWB8ecBsJ9keomfVGORrR+RSquEjUomEJ+KWtNo
	Z9UMTj926j7BSy7xjWGLHquGCZRHVldB2AtpRjuE7kLLkQArHec3WMgnJmE79eurrViM5ka3kBl
	PrIpwrxWeedRROWgsKbXkiHbe5rZ4AycVNz3G0IcvLcS7M/EGqQigkdG1/2sh/RxP7WV6uL0ErK
	URhxy7Q0SAxCoRrfl1La4rF4fjpyW5e/m5CMVmspqAq8FS0+zZtmyfwzi3Hh0HC9Kv6Z1pF5GRK
	X6ex44oMdZl3Twzv1TzSEnqa6X3k5ZZo7bxp6dmbcqDaaZfMuIbfxBE/lFwXu+wtStHxDdRTOYX
	6mrRmlWrhF5wA91DfxaNBmEGzP9rN39Osk8guqiLYx44FvIQ==
X-Received: by 2002:a05:6102:149d:b0:602:ba51:5235 with SMTP id ada2fe7eead31-6280bce3630mr918501137.29.1777375936582;
        Tue, 28 Apr 2026 04:32:16 -0700 (PDT)
X-Received: by 2002:a05:6102:149d:b0:602:ba51:5235 with SMTP id ada2fe7eead31-6280bce3630mr918465137.29.1777375936001;
        Tue, 28 Apr 2026 04:32:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a746408102sm542985e87.70.2026.04.28.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:32:15 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:32:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/11] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <bwapq6qstctwapmp27t3wo72bzi5fluojzhye55i3fetv3odm3@dzt7336l6wb5>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com>
X-Authority-Analysis: v=2.4 cv=HbIkiCE8 c=1 sm=1 tr=0 ts=69f09ac1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=QV8Ls2YxrGuH4NUGU1gA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: o4LW9juop_kxu-sj5w49WpEMtxLOJw5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX+4i3146gx89Q
 KmMvgWeBXWedIgJFT3yOIEkBwCwyrt3BaeijWOl8G1MVF2jqqhTRjXbVeEHiT0fxAONAA07DtNg
 TomvS8IPZdewEuXmYqDayFLuqBrDMHVQY0gIOY9VisHTIQYym8qdNC6SeH+i+Skj45+gJdAztIj
 UGES+cC/y13+3Yv5zqCxzk9r8Y/K0DSDGPeHoA0wWW0ey0niMAUhH7Ndc7IaAoAvC4mEYdFt7ya
 uDyXzzME0GaXhPNRvGDr6u9nHJ8+1y9XCe5uv6Gl7UYSfFZuRNxoDZQGuGIrxkPxda+CPbbGEvY
 x89P1y273K3D/Qgdjp2PNyvEFHgbgbwtSJUxrQGnuamfUVaEN3x323NgQ1KJg6iGXZrjz2/H0Zj
 MJumDMLOOAj2ZKUTdKpX3AWEhAnTd0jLzxS1b75b7BYYt1JOm0NZDa0daEVd73xHjBPt55Xm9Xe
 hDyWfzXU2rUjIkls2PA==
X-Proofpoint-GUID: o4LW9juop_kxu-sj5w49WpEMtxLOJw5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043218_426010_E268D741 
X-CRM114-Status: GOOD (  18.26  )
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

On Tue, Apr 28, 2026 at 11:15:53AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

