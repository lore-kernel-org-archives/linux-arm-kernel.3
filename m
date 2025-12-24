Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE36E7849A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvQVq6F9bvfy0ys8kp6NNiH3ITMTAjtxgfbrAUNz8cc=; b=VDxi44uEO8I9ejp+VzGvPYbL2p
	Dl5h5qX2QoJKazALctLUTMRi5gnLJ6VSPsF3WLjjkc6unjP1Zc74H5iOJ94p/MFi8dY9gbzcxhx8B
	/hf1F7uLqeQZ7uQwsUjtLDKnIj/JdxEW6QN5Sy+8E32bYKXMtYvIkxySS/cX7ZN8GACL0+9Ej/8zf
	LwA8pFUwZ1tCHipgK0ptg4PiXebgfzrpBDOxBRIv/TJcP766/L8iS9aWOUlNan6TKdsdiqEG6nxKH
	nLRbt9l2IHtQ+nZ7adWmLnw8x5XtmiL55/F3BnVAvexjsdnKeEvK9twaTE9tr4D3B+hN5e+sVkjtH
	SaE1tlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXM1-0000000HSAO-3FEu;
	Wed, 24 Dec 2025 22:29:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYXLy-0000000HS87-0CcD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 22:29:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOK9kTO4107228
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wvQVq6F9bvfy0ys8kp6NNiH3
	ITMTAjtxgfbrAUNz8cc=; b=aTbnioAZLkQRINCOhi4sq4N3TVWLG+eFdLcEDJW7
	6rOOQ0y/YFPW2n7mQrxHNvy6Vc6OXHt8cvfEn0Nxs1tkrHi+aqHCqbGq7qVT7TkL
	K4KdqH0+HxwO3MRI2oMDnXx9aeb4Go3JODpsWwe71RZNwbFXNc6rg5AqDKsJD2JJ
	TtJGeBtiAd+upAwtHaUvIY7jF8OlEV4cGJpfmpBgLM9CzKsmrUSxMO2p+fbkCYpK
	7znEvaMapoNNUT5ZeWNaVDdfNS+XKoj5qsvk3HPiOPe5E55cEqjhkJFCfvkZ3hnJ
	yI7T+ZQNsKs/jattVxcCLPcVIhXq/voS+uRzrG7ZJJqXVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kburhmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:29:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88888397482so188172256d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766615348; x=1767220148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvQVq6F9bvfy0ys8kp6NNiH3ITMTAjtxgfbrAUNz8cc=;
        b=iljxHkqFNN2Ck/UoMhyRB7EgqkOstUWwsiHYIOc/ZFu0zFeEifcwqjKjfz7qQeLEaI
         2fGgl84WxWn1swv7ITsJ3f0oAA98Pd0xskp8O44NhaV7LudMNvT8U2J+SB7RUV96M/mj
         UeLKNns4Ws6XkGp/Gs9G7dLCBAcrpgcam6wOu0/vtlNFEJ4UDU3seswnzDhfoK7aIsd+
         gP4eLRMiHc0mLlvVrGvNSHnXSO/rBGxF4RXnwy2jtEo5pv4fdEV6z/xXf8DOCP3lobjQ
         AQBE/dGtg90fUUm24hFQ1eYtMyF1yoj3NGqKudnMSDncU61p7U89ip3Tuc/Mpsgiu0fk
         vgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615348; x=1767220148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvQVq6F9bvfy0ys8kp6NNiH3ITMTAjtxgfbrAUNz8cc=;
        b=TnayrZbTlpvIVlFwIhqPwU8ZtfWOaHQId1+kK81YoLnfiomNG4lAck1RDmh0r0BO/0
         RK5MW4u/Ow8z2ybPl1ccdEGhFFBD7eULzW6RYxqtgvpv2aljvG6yRgPHZATh2VhKiGvY
         plb3DMEjKZQR+tNjgFEwQn1m2fQIoEPsOjQ/4pPqYczvHqIVnykDiO0PecTHeh4vt6AE
         /z3zAos/xYPe6hNYjmOEFqO+E5RapEqldz0+BHuksMJLWSFuHv4b8Uebw+uTdyfUA5/c
         +orNZj+7TWPwRwh+AWsz4V22Tu6d0S03vliLhGoIprC7qpARN+LQBvDIMyavhv2Grysq
         WZ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVRsY93HokF/IxaLZv1d29nVrRW6T1Yagjnuv74Z3jw1RlPYkn7ZNkDoEXN+YlUlNz1XujwZZvzk9IK5sy4dC9J@lists.infradead.org
X-Gm-Message-State: AOJu0YwiW6t2Kqjp8fbx1US8qJsUK+pL7B7eHXUXotQk2b5LPuU/7u0s
	NapjU0ECDpN2GAClXP5ycE6ra+uLPlxeLLsnLpTojtHOoALOBYPKKmEDcY9hUuPgKDPRdVtA72+
	JtcZc4SgUblpP/O4axFkGAe2xbaHDctZv3c1tAl4kghpRC4001aVB/26XtN4jG7NwZyvldI/HcT
	I0kg==
X-Gm-Gg: AY/fxX6za4zJBVE0uIJC/rLqL52Nyezyss3wSjtO74Z5J1YliuNJRVOvHrY/H78Y1X5
	x+OzlxJwVKaFqAdJ5C7JWwBEpP3b3CpK/qKSB2Qoc/xFINh499F8nl+hDH/nwTDab7jLKKjJMD0
	vHYXVESH0JMh+QP4NaMsrablTyR+ngkvmnmoh/G7gDxh8JkfrDxeN8TUVt1TWDiPfvyTig4IjvM
	ZdjT+7ar8YiuANFziabPPisxGFNhpx0siWR1BeWuIS0q8Nh4HFIg6LS1ygYulv3JwjFeSnamsoI
	K2iwNEFRZp30BgetL79KhkzqtWS1GIPFQFvcvAeaYxQzSMESHNN1GNqAS+Z7LpqFMCrZI3MdpCd
	UiyWhh+JhSAh+PcTk4sFfYOJFqdIxAHH8/odYJ4CeehMitQBq17DG5HsAKcQLoRx+bpggshW9H8
	7K9MweXQwy9ENEV3ciaKMkg+U=
X-Received: by 2002:ad4:5aaa:0:b0:880:57b3:cd04 with SMTP id 6a1803df08f44-88d81668f4fmr311316746d6.1.1766615348582;
        Wed, 24 Dec 2025 14:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ/U+oO/Wi5GUJsyhcFlaDH6iMTsM1T7URvZxN8P3ucroQ5KwYbZNXw/6bola6LCgTDOv+4A==
X-Received: by 2002:ad4:5aaa:0:b0:880:57b3:cd04 with SMTP id 6a1803df08f44-88d81668f4fmr311316426d6.1.1766615348127;
        Wed, 24 Dec 2025 14:29:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd90esm5381856e87.31.2025.12.24.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:29:07 -0800 (PST)
Date: Thu, 25 Dec 2025 00:29:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, mripard@kernel.org, neil.armstrong@linaro.org,
        andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
        Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
        knaerzche@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi
 bridge library
Message-ID: <qvyyiys4vxf7bosauha3lov7uttzwdzehf2kwsu32xxzwyn3cy@jhkdjc2cvwcn>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016083843.76675-3-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMiBTYWx0ZWRfX2be8siT6j21+
 86gaqIj20H4bWfkBWVVF6e3iWSnLSNPclbljrM1Z9+cdA8+tjkeGKvJsZmJhgIxbsa44pIKj7hv
 Vffd8zwWlcJmtBi8ku+6Yvh3A+n8B0ZSTWx0eWFDJJiXjeF4lcdyF6Xk+vGQwLLW/TR4IFPfKIB
 nWeOshm7QxRMLWc0NmIFRtbrjqpF97c9/V3vgX+bIQsjz/zEEtjVW6Umx+L2K6qSYM/Fa8dKqbb
 R+62Hz94wA1ZKuEVZb7T6hI61N+pFTbFzjleOTPsgAI57EULiIpfe+ZoROexvDr746HBnqVt3WN
 h3Dj8nA5Vzv7YqvPMqYUFuU5lllmsuuFLyxQcG7tE81rmboRfZvbEO05tmm1vRCGX6zi8WlgcXo
 5h1lqSMFmH3wR2Uz0GBQIbkueBL6EZiM8UWlLaGPdWniyLdlItN2BWd6yRpdIzRnl+DiihAMxWs
 qPslMeZDeMxPU7YHHXA==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694c6935 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=7XDKy0GsjqpdM7yUEs8A:9 a=CjuIK1q_8ugA:10
 a=0lgtpPvCYYIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: BytsZB7rX3Ws9ilOVDk0l8NhmFAdYZCc
X-Proofpoint-GUID: BytsZB7rX3Ws9ilOVDk0l8NhmFAdYZCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_142910_090621_65314C39 
X-CRM114-Status: GOOD (  14.95  )
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

On Thu, Oct 16, 2025 at 04:38:32PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add entry for Innosilicon hdmi bridge library
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

