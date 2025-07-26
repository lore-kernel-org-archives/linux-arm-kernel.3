Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3744BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1D6BmR83TK96SbIkz00tF236OzVTpRaO1A1uvpbe2kU=; b=KueSeC2g0q/61XqRkZYw0bwXw5
	faByx34YQ6yihXdhi8blH6F7ZPyW06Xq/H/9wbVTgBzKq7oXWnGtv+Xz74m8bZDzfMEEVFLrwNTRw
	5/6VXtRVIQoMoFZKZX5eALp0Gz6+BP67zK7E30rBQCFvVsSdXOizdbFaJaCz4BN4z1osZQvyhX7N3
	FmVbLeMbOd4OqFB1h2oCfjObJmEgLb67a5F31BHtRQdwf0ESELDQBxMSANDy8NrFyOQ9RiljWIvDe
	lIC+JMNZdN/Mu6GPXAflQBPt+ScbOn4MnG59dnashS95B26LGy7NWms3ucEghNWNTDhwtP/EmMTAu
	7E4I3fOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdfO-0000000BQcc-0tO5;
	Sat, 26 Jul 2025 12:06:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufdcw-0000000BQMe-0MvH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 12:03:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QBalsx024857
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1D6BmR83TK96SbIkz00tF236
	OzVTpRaO1A1uvpbe2kU=; b=o6+UkxTW9yXrNwNRUGXnacOqvHp4+4zOl/lOH+rD
	eIiLIB3ZeSD0ltmuqE029Glavkd3ATJLxAJxi/1fEBNsUvQl2H206QImn/vkyEUG
	CZ7wDU/bRB0ERd2Ko+g21RL7Nb/SODcCrErqZUl3/0ulLg4dZQyvn0zagOhI3Ccy
	Bgq/FImLNqQm3rEbe/9Xq5GSrDwK0biq5ZpImS92MFZPyc1fWAs8jF/vmb/Z7qd8
	37Ah6SKo8QYGFlQ0YMn2sdVW9EIvHl2BhmWnN6iseHjFwE5bZaqeo7K4suU9+F1Y
	E1iEb5F5idMvFr6HIybVTcBWUV+hYJFc6I4iffu+GU39Ug==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytrnn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 12:03:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-704817522b9so45008996d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 05:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753531423; x=1754136223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D6BmR83TK96SbIkz00tF236OzVTpRaO1A1uvpbe2kU=;
        b=XYhbqpYUQgNV8pD/9TEjJeYQGxxp0F5cRldjJbL9x+gIh2AO7Qz7kczYEnUx+R+VVy
         J5LuhSycuR8dS/idR8X6NblTN1r2CyJihwS65R8ElnmAOvKMPV7z4Emle58zHxhZ+fEC
         NlqZGxs308DjrckSbIodHLSwFhzeRMyOhWFwxn2N9Lrue/7xQoj5PSLqjV9TYdBkeAfn
         GDn0vtzwEUcch8SUphcm/PUM6zD/1jx6p1dFwFwaS8n+UzjB4+JYjkshhO3gHSy/Yl2B
         VveLHG6JeWjYRbBauWvGEAj6+tia3XhR+n+7zNL+GJFkhM2MasCWzc8Qrut0bggKvmIO
         vntA==
X-Forwarded-Encrypted: i=1; AJvYcCUUk+qXeBTfnTNslXKcmH8jDr86MH8rgUuWUaP+eSxlXsNVNNStVDyeNkQDnW/qcS78Ko7PVnNVpjrgw4HZow1N@lists.infradead.org
X-Gm-Message-State: AOJu0YwBuXH93QebJP5En1NyMDxVbvZfHLXVyt2+96M2+9BOrw0gtnOF
	kBRjUrJiva4TxKc7VKJYh5BSIAoBBXzTDsRVm2T7EvIgpLL4pEMR9JuYqv21V9jdE/vnfVrTXya
	iBhBWS4QUbwOdiDRQp185rJQJ1L6Qz9+/UOKoarZdmnqF3qHK4RL7fWuYH3+KQFaY/BhLj2a6Uh
	ur9Q==
X-Gm-Gg: ASbGncvaMQfncNA0nxus7nRlSjAoS3aADfAxW6pzgfATsLQApr2U6OYus+DjZ3m7p1W
	OPF2yTfQTVyuzr0LghPx3+zd7/7nEsQ+MJCLnc3ab0z5UQN/p1kEIr4Wc6aHbvxdQJv5I8JRr1A
	Evc74auU/wGZDwJEGidqNdcF/6Pg/xlmie7UfHgIt5DA7ba8aDifA5GtGYukZ2zGXqiecIUNTvx
	P2m7++rpZQYgLBIsxWpfW+ekP5BlFZ7lWAOTcKTDLuUAZblmKDoy7PjE5ffZ9HRPQ0lvp5XxD4N
	ON59XjIKT9vipMN3QuR2itRlV73UcY4L4/30pQUPszdH1mCp39Pw0d6goJlJhNR38uIi4VUiB8b
	AZlOLDUfTERcNVaaN4tZJNq599bf97vlhG2nCq3mJeNtqB8c10azx
X-Received: by 2002:a05:6214:4e06:b0:707:2230:b6af with SMTP id 6a1803df08f44-7072230be23mr48057966d6.44.1753531422891;
        Sat, 26 Jul 2025 05:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXvFtpJkzYIeiG9nyGHhRK7mR3gLP3VEEBXF+lBE97EG8zozjWb6VOoTWSf2I5TC70nhrV3g==
X-Received: by 2002:a05:6214:4e06:b0:707:2230:b6af with SMTP id 6a1803df08f44-7072230be23mr48057536d6.44.1753531422345;
        Sat, 26 Jul 2025 05:03:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f40b339bsm4061511fa.23.2025.07.26.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 05:03:41 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 09/14] drm/bridge: analogix_dp: Add support to find
 panel or bridge
Message-ID: <kulhumudepz3lqm6c36wbqtc4gv35pyqki7el63bovnvxcsjkk@nbxijrujm2vz>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-10-damon.ding@rock-chips.com>
X-Proofpoint-GUID: 3bV5Q0VOtW1pSGrMr6gW2TgIt9y1MO46
X-Proofpoint-ORIG-GUID: 3bV5Q0VOtW1pSGrMr6gW2TgIt9y1MO46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNCBTYWx0ZWRfX2WfH2jsCqHeR
 BXGEY1mUj3grjyVQSwmgrltXEtGd0F9zPHqasGxCtudWrE+l7Mf4G7ItoqZ43jlRPYVjkGkijPl
 xJv/l88d/hb8HnJFbxQCGZzZdHWCfzVTNmzU+ygo20ymf4cg8lZu7CC3jGuZ4lx/i++kMGYxz8N
 9YR7SomE5GQuQh/5KU5oW5maS5IPBf+AllnguZki/DxDFnw6s0Hg2KYSIjMUofxJEvNqy17Tb/z
 5xzCKf0M72+n8MBMwcQrBj5SdUlbJV45VpvYN0lEJt9tIs64i8Y9zgKfXdcKFye73GHoVL1VQJ9
 +1A5VFBJ2OKJcQFefxewEKkBlp9DZO2pj6xU/iK6lPHsiqf/1H9OZlVWIZC0NXiMfoM7ns+ionv
 aucYlsFbwjKvbxCr9XF0ND0GRD7x4+LQH6HsjofUCu8w2ZprelLlGWZOEiFOzzUh2la5EPgb
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6884c420 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=cGmNtDV8R6BPqPJYracA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507260104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_050346_138187_7DE48B47 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, Jul 24, 2025 at 04:02:59PM +0800, Damon Ding wrote:
> Since the panel/bridge should logically be positioned behind the
> Analogix bridge in the display pipeline, it makes sense to handle
> the panel/bridge parsing on the Analogix side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
>  include/drm/bridge/analogix_dp.h              |  2 +
>  2 files changed, 50 insertions(+)
> 
> +int analogix_dp_find_panel_or_bridge(struct analogix_dp_device *dp)

Nit: the API does more than just finding the panel or bridge. Also the
drivers use it in a more of 'analogix_dp_finish_probe()' manner.

> 

-- 
With best wishes
Dmitry

