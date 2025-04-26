Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 02:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgng+bZEhvkzdq+Q9IsrPjDzpcDeuRKzrGsRNiJeN6A=; b=HctmU/7i/DOxb7yL1u1uWlSV6R
	PGcLprM3jqYzjBRrpTE4nqHDC63WouxKjzUp1eNSjQe344dKsXjhVglsZ3rJAXPq+moroHpLR+lTg
	Gk9Yr83/GjmRc2h9PEVAnxYher8J2nvDFUKzdTZL6dCJaF0moEHbptQiv1gogVd7XfBmKm5hueJKA
	DewjX70ebEvCSUn/TXgCzi9N4KhOWAJIbBUD3GtQG0Iv4O6CWc4kAZDSsV9T4kmF+KxZHukCbTx+k
	THQzqodw4Jo+SkooqUF101ki9wlor8WNg/3KSsgRxtnKWd6G1bEFK6DycCxZ4kJybS9D30vr5vPVT
	+JrH9Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8V6H-00000001IxV-2pBL;
	Sat, 26 Apr 2025 02:17:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8V3j-00000001Ikj-02xb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 02:14:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0K8Bg012462
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 02:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgng+bZEhvkzdq+Q9IsrPjDz
	pcDeuRKzrGsRNiJeN6A=; b=DuZq90QnvyeAXJrBQLeh4pnppAyjgmZvsHKFYDzc
	LB1EaTQ2tS9Q3oPhoNHbb/p7053FXK6yqaXwHtl0au9wZY43eZsBxu8mPI67hIYp
	xm6L7IApmaGrdl+7MNrFPxBmO+LGKwd527Zozas5I9c2ycVI8FrWPk/Sh1HAVZd9
	as/B0Ti+/cpux49GKXRDFik91n2+bhSkk6znNjxMkKno4eJQ+KAfHFwR7hf5ioRL
	cbOAhoKpMfXLu0m+NYEMB6L4twQPnGJwuDN1bgSz2Yup0HJZRMXyQWhNeKTZMo/Z
	aDM8E9YKw/P1N6FToQP7vut+8ODypQtHUWXPqpv31+cWjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqg51v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 02:14:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso468850085a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745633665; x=1746238465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgng+bZEhvkzdq+Q9IsrPjDzpcDeuRKzrGsRNiJeN6A=;
        b=IW9Weju4Ss5iQnRLufyZA4ARDOwowiTpUc/VPhoDRva2G7K4tPfU0S1GCMOzhyrUP5
         hbZyYFjhKDG+UDZviuP5zvDpm3UCuGtdpIZ45AQxSsiibZ0YHCgKJmPORdewottOafqS
         JTwHIbXHjqNG7pgMfaTaSBkXa24+kxnhXz4rbPXWPMIqQaakFra6ftHrRdG2dl76yA15
         lDg8TbhBfJUUpes9lc2ddwCrfoYT1pj9tMwgMCnEsIh+hD+DK8p8ECbtAKR/1czgfew/
         NGvToFMS5bjR/bOYamyEu5ZiHq4NFIK04Sg1MQCEO327XwNjvIwpiRz+Wq4EhveTUZ0W
         bvHA==
X-Forwarded-Encrypted: i=1; AJvYcCVnEyWgbf3hMkD3BkIrT2SG4RUUIQ46F6IO/K/vLVtc79xzDk8+fLSUnup0LcoWd5LQ5w583E1ijHmy9kW2nhvs@lists.infradead.org
X-Gm-Message-State: AOJu0YxsJdzGgCHyzB3ue/XjmLHDHETXJuYAxPGbyXeWVKInZMW81QTJ
	SdXRwP9AMU3cfPo9qCR+YOhaprdz/eJ2HfIB4EBRZcybbHwFDxFmut2LPM1OhzE7Lk7n9TVv0mm
	g4HkpRygoBjtFeFmIU2BeL2KluaqqpiVaseXlMuzZYByYf5gvCTwbdR4/+Nuuyh8lwxVahQki9A
	==
X-Gm-Gg: ASbGnctXhKnwW5x/CfJjTqvXCWOOd5ahXzP+7it8pKkbDeUCRfsaHwQ+BU+rKDxUET0
	5s7Hnz6CK5u/fWGVj7PMqZ73yHt/ZDhY9XVIP119vVtPnAvgk+Rk1howYoxknPG9TE2ZmLWLfDd
	3dT6y0ecstXTYi2wTFW36sI7OgTQISHa62fLM8FM2yRM1b22YyVfeyc0WZCUC3wtPUCXNH5cXCz
	iHGudZvpMLboYLT43LGyqlWrVnAHAaHbkKUJdB4DE2gLL0heDyLRdELRS1n3x1D8JM83MnGoDd+
	TG9CVVsjOaGQS8YvTX6HkPWfky1UStLrM5Z8cpEv/XraoS4XDsPXUMV+Qc0apWAkxI12seYR1RI
	=
X-Received: by 2002:a05:620a:2847:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c961991dc4mr708917885a.18.1745633664963;
        Fri, 25 Apr 2025 19:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJRrQvRJIjrfWkHem5vyugdvDgcLbJ6kIDx3TUrqL4s9VNbnAJXPTQD63gl7jCjJp60lHIg==
X-Received: by 2002:a05:620a:2847:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c961991dc4mr708914785a.18.1745633664644;
        Fri, 25 Apr 2025 19:14:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659d3csm9778971fa.18.2025.04.25.19.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:14:23 -0700 (PDT)
Date: Sat, 26 Apr 2025 05:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
        Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <3u4lkr75kbcgx3qngg5m66hxqyd52uz3uqxetizqy45bmcs7iv@rsgkph3oxea4>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAxNCBTYWx0ZWRfX4UnXSvzWkD+Y T2wPC2xWu1tLxupop/rqMh4PLzOFXT/qtpu3uwaS5GMuRD9bz1D+gg4EzHhHMSZqdKMgP3LwY5w HbB29UHzncYyuN42VPU9Z3BWKFluQuQya2GW3++H1k/3E8b/c5V0sDlj9sBJEf0IQnuzeulLWlf
 LMfQFfU/cVXJ6M+E/zKFulmqVr4odpogLjajKDByAg9ICHMZH+6W6NzMpygKI4Vdgk757PnYkRj oPi8zaD3FscP5doCJ/+c5HZDpYbSqhQrThWz52Rm2f6EBRppES3beADUxr3oWn0OwiFMPKxMLy1 ivFAoFhZaO/vzr+Wc7MCts8XTgKW/pS7mcU19G63qjD0POuFD26kRTjsFSzsSbbaDHQyV+3i0zN
 fDB1wp0XcEsMXobFZCpQEZwxVwCw/pdmbayhaJ1pAK/cL8kiO851OVoSKiQFAWMsGrl0a1kl
X-Proofpoint-GUID: g7pFdHVZVBxxgCMynoQdzCDRUwBOBTfk
X-Proofpoint-ORIG-GUID: g7pFdHVZVBxxgCMynoQdzCDRUwBOBTfk
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680c4181 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=9PZjv1JVX9cdHcjgR4AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=768
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_191427_171876_43ACFC54 
X-CRM114-Status: GOOD (  12.14  )
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

On Fri, Apr 25, 2025 at 02:01:25PM +0300, Tomi Valkeinen wrote:
> Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

