Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE9FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLXO0lfyU+XcYQwDhmvBELIfQT2ztbA8E5R4omjgiCQ=; b=es8ILEMvaVBuaX0T6la/X+CTET
	QQgUhX9epT3MgXU5qfdjJaxFIKdW0bzIKSWWgQxVC8frMGv9Df6XtB2yurlc8ma8nWG2vMyUFdEZp
	vuUa3qUm6EC5vVWW/VplRHdpmJKOl7LyuqsFmCT7dgs5whAlXNDtv1NcnOGaTGxzsgF+hVfYKSq2U
	n2iNAkHnJY/z0hflr2OCOzrretl5TZmsXd2QG5MkDnmGY9Khz4dN/sx+9J+IwMrr8i+du93SRCHlS
	xjlV/XMjwBETT5BL4WHsxxWb5IHuOEhWbbwxmQ7TMzjrjwS7GqBPtxaCjrya1ezNyuIjOuYT6L6vI
	Vh/yTQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgeO-00000001LiR-3P4L;
	Tue, 28 Apr 2026 11:30:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgeM-00000001Lhz-2waH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:30:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAEflU1329549
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kLXO0lfyU+XcYQwDhmvBELIf
	QT2ztbA8E5R4omjgiCQ=; b=Zzdt1xeZzWtTlz491A/UL2+x38bbtZYoavONT5xa
	Ywrxd4JDyGvzPXJTjKL8+Xsg3hvRObybKlx9+DElkHUBrn0C82dNfOr1vmCMxYww
	P2dEItfHO6m4owRRo9L3XadgneWcHyzk+LWR3QVwyu1F2La+15RtC4gRm+E0PVO9
	q09VnWcBROAPQbD3Idv99WNTQi1alkVaGcvSfqxK2Sr2EYISlqspNDVqhMAKns1X
	XTpuoIR68xVlap6s3wD4GY9Rd6iKIpZWApA4QpiCq3TAkrE3A37g2VFIj5CLW9vJ
	Bz9wUU+qZNXM+V3JUWvhaOxk9X6KrK9klaHNbTDg0kXmYA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahkw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:30:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-61a4d6de2d7so2820837137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375844; x=1777980644; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLXO0lfyU+XcYQwDhmvBELIfQT2ztbA8E5R4omjgiCQ=;
        b=Rid6W296zkhaEnHi7wCKr3jcnGvtDIpqyD24Q1NZiWycWkL2xOssFjfjREjBbCb3CJ
         0UUouUBvjHzEEW+ky3jI+hSHIMyi+55+N7jg11qlMTCssxDCkDndVGgRAfCT7J3yhU7Q
         fOtGcxAVitiTi9MPes0CB26HsIZNmgXXiUyeic3tfTGaTxLcWOC0e4SWNSg7LaaBh+iD
         HYHn6d8uWNOQ8Ojf4lJa4CiKDTFzxcl3rFmXApeRqrJhSAiFhXV0trJXSVb+rbDEChe0
         ipo70KNVz1GvQFQvC9vC2eL1wovtwSNjeJuBaEkAGVs8JU9Hd0POW+/XXvC7A9dPD9NG
         KJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375844; x=1777980644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLXO0lfyU+XcYQwDhmvBELIfQT2ztbA8E5R4omjgiCQ=;
        b=BjTJ+E/J5yygRAGO495zPT/onQQE3ufF7dYxeD0IURO0rwnmEba67Alnj1+LhWx8ww
         yVTeao8eBMhQjlRPTbhxPDUnlsTLl7HAQ3bBdtS5MF9eXES35/orZho4LR/VOKTxaKuP
         nzPi2Trl8yXShoUM6B6k7X3yeeXa9VZpJsix93VYcf14SJX0eUFSa7OS7//AZHbjYdm/
         7NQHf7/wPrWG69ZnxcpCoNhKHXSbpI35GEXGhPqWgTmEAn6siMFOuZE8ACmGDQnnjK0B
         6dEOAb7pSCMCj0nU6iYn4zp0gFtJw423uy0L5IuHsfcuqEuRrnHyfJ46jxconErqCOdv
         xP2g==
X-Forwarded-Encrypted: i=1; AFNElJ+Rv5rfGjUtu28qNdLG+Ir80xQaAOVVLH96eZHgtgP4OpEmWmZ77FC7D4DaUeUPxb5pPuJGVada8gCWzEYR3hNV@lists.infradead.org
X-Gm-Message-State: AOJu0YyeY6vxs5tG/qMHIRHGMdBYjbpA+ne/YpwO5yMWdK335gbjpJUR
	aXyS88wdOjMe2YTxql6WidcqFYUUwCrrEGjQq3xf5egagFBLFUXdh1fDZxY02AgOzs031ehykrs
	ujwT/6iOsjCikPw2UeDcoiJ1wD4cpHJSsGCxB65ydMLJ9k8rwnKTSqf/7lNJUvUDP15o3wPBbxj
	QqAUVXLshT5A==
X-Gm-Gg: AeBDiet4RYw8bY3B9Iu0fHQF3ILUEvMrYCA7nXvUCVAQl42J2wF4TSt4flR3yQr5zQQ
	coNWbKVvp/D5LWuDOVCj04byaf4ZtjMf/EXdBnz6dPpbqvdJ9so7gfsKxjnEpqqQwY7X9hHhPjX
	uEJEGZCSqrfBfPUQ6guIVQHDz+LZSacr8q9PYbmPZ8Unah8tQw77ky6e94b0s0sbyU3k6lS2H0/
	8+6etnoe6upBkAOT+HYxEUL8UyFbY/uXTDJWCRAnojsi5vFM168D0XcjNOINBBm1zlBjctXx0Lk
	hkhgnEuAXEfLKE4CycynjrUmhiMvCA1X0Z6CUkoEMkQZfLu0E3sqhtGZAnsRwXFMHSQa2CI5iW5
	Jn6zY7F2fyasQ7BGsDZ5tBksnZL+zcbKnLsvDXI7AHYmNMXm2p83zo/Ur4qXbK8TqxTimsZA8tx
	6aOY3h90F3adFHwIJx0v5ZKxrNTeN9wAX2mUskHwlHf7kPeQ==
X-Received: by 2002:a05:6102:2c1c:b0:602:7a74:fbbe with SMTP id ada2fe7eead31-6280957715cmr809848137.9.1777375844003;
        Tue, 28 Apr 2026 04:30:44 -0700 (PDT)
X-Received: by 2002:a05:6102:2c1c:b0:602:7a74:fbbe with SMTP id ada2fe7eead31-6280957715cmr809797137.9.1777375843385;
        Tue, 28 Apr 2026 04:30:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e3237sm6235331fa.3.2026.04.28.04.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:30:42 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:30:40 +0300
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
Subject: Re: [PATCH v2 02/11] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <3csl5orvlakqg7sfqhitlrnag4u6onrs4mvinkezxyxdw4whrx@ee2hrdhspfn7>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-2-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-2-4300744a1c47@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX0EMakZC+cxmK
 usw+fZ8uO9lz0CrYbFLJQvgv+pG1yXhvjbIbXuiAikGCc6VU66Cz0/H1ScmRo2j5TEJjlINYIi2
 qLiRCZSokyJllY3SVJEaeuigJOuZdwQXco09qq25wfM616as+cEeVSMhfQhbdBHbkTg2z65+sHY
 EOxwEmCfNJ7Z3EnZPmfEFu0d0eLGl8HzRkDmjyUyC3CqOtXg5Oz177dMvdXpcbgEj3hwrruvvuD
 ZiL4zoHcd+KuSXZakz5EQky7EZ3bsRARLimEWbcpWjYGv8HlyIuhWE0HrNBJHicBRYbOGBZH2t1
 yH/o6ffxte0vfLGXNFE9mu66EddAD6t/mWcVghug+nj0kN8ewmX2Itvi9Z7irQTVPtkHU5iG2rR
 Cdfer01esP5WTLCxqvaZp01jfY1O9F42+yK7BIQDg/yW2qfaj/l5T2l/Q6nb7S0H03PaeC/lg81
 +SqBDCSUfPikO/RXLDg==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f09a65 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=cIC2YJPMRTRrWvxiOScA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: brTfhVQOzzqG3noeO-ZWwqgYJbaORCSv
X-Proofpoint-ORIG-GUID: brTfhVQOzzqG3noeO-ZWwqgYJbaORCSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043046_860252_EAA59D64 
X-CRM114-Status: GOOD (  21.59  )
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

On Tue, Apr 28, 2026 at 11:15:48AM +0200, Luca Ceresoli wrote:
> drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
> into the @panel or the @bridge arguments, thus making a very partial usage
> of this rather complex function.
> 
> Besides, the bridge returned in @bridge is not refcounted, thus making this
> API unsafe when DRM bridge hotplug will be introduced.
> 
> Solve both issues for the cases of calls to drm_of_find_panel_or_bridge()
> with a NULL @panel pointer by adding a new function that only looks for
> bridges (and is thus much simpler) and increments the refcount of the
> returned bridge.
> 
> The new function is identical to drm_of_find_panel_or_bridge() except it:
> 
>  - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead of
>    of_drm_find_bridge() internally to return a refcounted bridge
>  - is simpler to use: just takes no @panel parameter, returns the pointer
>    in the return value instead of a double pointer argument
>  - has a simpler implementation: it is equal to
>    drm_of_find_panel_or_bridge() after removing the code that becomes dead
>    when @panel == NULL
> 
> Also add this function to drm_bridge.c and not drm_of.c because it returns
> bridges only.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

