Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27467CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=; b=EYCFJtvhALAY+xKB/85N9wbZH+
	ULPa+hGTkOFUA6gduJFhZjIlJqooInf5862KHUzK6/5pzGS9gCIBcvk0GiNUaoYV3m2SD0cCcAP5a
	sesroOID0aZSYTzDdZ386GPhvy9jIImbjTRDknTTEoc3bKzCW35nIS4iVCcPEfPuOreFdHYlWZpXz
	DbiIpQHd/GRE8WDm8kt5CWRjLKNpGmpxM9JJhPnTOwH2fWcaNTPTLKzsp3gnaqtk2451D/jxNtNiw
	HgbwyYUOjq0/eEvH4urr9tIPvLjM6yLGjgO0Y10x8fMI8ubi0E63AXSWokHt/F6y5YL10WL94g82J
	w7C8hfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qlP-00000006EnW-0Pyl;
	Thu, 09 Oct 2025 13:32:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qlM-00000006Ema-2w7z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 13:32:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EZOt028652
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Oct 2025 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
	iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
	E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
	MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
	WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
	Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
	94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ktxk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54a798b3508so1902160e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016774; x=1760621574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
        b=gILpwktNtCGzGpbUBGJMRsusI68YKxhLtnvMPd9Rnf/nqyykfuDxnpiLDLyR5WFtjX
         6f3E88zyAyW+KFuN/6aMftYAdVzN3d3wb4EcL+e8vlJBJGCPvKPngCiJUM6YfuFTP1PM
         C+XE/S8cd0Y6mDF5FfjEp7JNjLprSELoNg7IEGclXkAuVe+b4SqXLlpYYdd+IXAmoaaH
         WkNDk/VfxiV8RPwHlixWf6gN4s7A60eK8XMxlzEyboFoFj5AabhT9u/GCi2KLfX8KqO7
         kbQtXHxhaAmzVkv55WvukzBDUCrYQEaByxjug80hZHy64jIecqj4sQJJg2E4gmuc3fiP
         +khw==
X-Forwarded-Encrypted: i=1; AJvYcCUhhdVqqMgb2o3r/UzPzuPrzPl7g5JbTkcff7M5DpacyKuqPITvXgdAdoahSSMut3gpkjKlztVYbOSj6f4EGK4d@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzp0AbB2sI4QQauSmVPkopLhSUwQSKuHhio/i6CXG0ejMVaWRm
	JadV3lGnv0cf9afZ5Bn/NHgfL94gMU1PrJz6+DC5hA9jU8n/eY0gh4qwjx0DuKX05ClhyE1SvMM
	/BA1wJnkghus8psI25UL69KptOlBcDLQrAEtgiIoJ6tIjUMY72MFuU/OXEvyvpqHGnSdbyb3rBg
	xaNA==
X-Gm-Gg: ASbGnct4P8Dy1v5T4P/zd7X6mdgYRgg6FZKdYsjv5lStvj8dqwe01363cUJ/VTqImh3
	NE95IvdNg9YP8yMmaP1XtejzcDXH45DydaLBpQ0zUFB/UWDP9EY2t3KyV2GRjNlImopqwGJjGDr
	Pz5CoUQPrtVy9xhm7ahbjvWFXJBKT9/p0GnEmjo3LAriW28uth9Rhjqz1tk5FuAyst3vULKvrHw
	hHUNWKcLonFOtpe6ewtDvkL4WOB9t1JV5KYlivPdErplLHfxlh+fK4wU/fk6Ny3OcqodVre64m9
	aSNggyQeCEEebXpMDkOV+/UUGTWBtNQxCflDVU1bvqUO0V09JzjqVWeBqIxPdhHQ3pm7YeLybM+
	CQcxtjmIRqKxhiGBnL759wq3oT6mxPHn0lkVr55UebkfpHGlSSc7SKsfGqg==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464553e0c.15.1760016774167;
        Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679;
        Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9UI9RqkbV3UJ
 YDKPDnoV6Wks588b+UO5NG0ouX3oEV/TSTYExWKqSSHuhqiViLvFwqowwWzeMAbuF00fn3PCSXL
 1ZbBFO+E6VzKQt7kRsb9zdoYWnSbbt2muOS6vqnDYVcX/LoDcWwapSuhUU6Fw248CM5GHmUa7hZ
 u6cGi7xwAQ7eETUuyn3YknE1yZJJeAzLUJUJb9vi2nMtuSOwQTH0Bd10RAc/4r6teGB5nWl0F1w
 O6h0LFPwUuhDZRd/uszK3bIMsZK4da8yEgcZJYEmQIWlOV8u7819+jtUZIJM2q5RCQvxRBzoVTU
 MUc9Xhg6XDN7KOFtYQnQ9ZkrSHSxc+9YIPYc5iB2Td9nefTAPutm+h037Puna4r/TGoJELTJbK9
 hw9jV+U3YXNy4YOJgGS/ldpPNL+Xyw==
X-Proofpoint-GUID: _baEsGouiBoYtm5QnL502K3_j3ZvQUGu
X-Proofpoint-ORIG-GUID: _baEsGouiBoYtm5QnL502K3_j3ZvQUGu
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_063256_742871_F0A0F81E 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry

