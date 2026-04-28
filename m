Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF3FFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QafK/wXpaIXO2Yjg0RdqOd6ehqsozV2z1rnfWUzn6I=; b=oqjwkHPgBxlooR0bXJ82z3XP1j
	CLJtnekhO4bMfnekXkdsiUw+xB9v+HaEbtqM7RUNqSGICUdFvSx60jz+W6d3CBE1Kal8OGJHsZWVk
	x3U5b8wen+4giVRQOENTwZ7ErnmOXGIwFxZcWEvnX5gN3m/IAXlsEepUe5Sb1jScjio12jtjzFmjj
	xiFlLAmuiBtDZ6m6k+1ia3KMbdqKkmzBB4vzjWgKo0p9R2hU1P4zgKUuj5M4dJiMXwj95PK6/GDqO
	WrpsmugAljz/F0ymxV9ddg71kf+IjITwzYvA9/LTJrJnV0hCc+VIPyr3eT0cBPLrH05fMbnHPWTnL
	vIhre6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp7K-00000002Sf5-1BFv;
	Tue, 28 Apr 2026 20:33:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp7H-00000002SeW-3f2u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:33:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SIuLfs3347449
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 20:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QafK/wXpaIXO2Yjg0RdqOd6
	ehqsozV2z1rnfWUzn6I=; b=A3QSSofsWdYsNCtA3W+qfRON6F95gsriFK+EGDti
	riDeqKKNvqDtEKI1U2W3hfjGtf1Dv5Iz9olLl+BB3mDG/3RFh+WhO+/cNXiCy8DS
	cHuyeotfWIviQIFNBZ/AgFWHbdMGVouUefP7XBb8hEz1JI7SbAzqbJEYhsKhbd3I
	pLuyaX0QhcYpD5qSZNm6Efm4r3M60Prgi18uwJzEJh1VhlKH6LO0J8Lw/9oW4ctJ
	b66Szful8x+n3fRwKpbOBS1UIfyyTvm1Syw30WvCyZ8OXPC+vPYoFTyC0poQt8nc
	Wv/IyYHjpTpDNRxW+zCq6Q/14dr9ZThmYfGJrlsTndNWqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4r9ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 20:33:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e67a4f642so1299821cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777408390; x=1778013190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QafK/wXpaIXO2Yjg0RdqOd6ehqsozV2z1rnfWUzn6I=;
        b=B1o8G8n0QcLJGQmhkkP62iB6LzuImwbNOXBTUaNU2NUY19bSzzKRqwpdlutvAKcN4Q
         5WE5EhJgUi0d4dDQwMQvpjG40ezsHBjb2dIVwpZ6ug7rnecxg0hvlycXyI/pGGLfWh1d
         UjGUaTsPM6JQnFyZK3xZRl2ysKmJK8du9+zNb+RIW5WjzOv4sx2ESIWneTGTCvhRDOe7
         ELZzDCFhIwB00J2oRlDzramfg0J2DMyC98U5+6SsM822tyyTam0BYkzJxoFPIyFp3esk
         F1gcPxAwb/Euav3FBAY9f30Fi+6AxTUgrgRcDoq8K1dBUxIWcyGWB0laKiMV5TEMVHeK
         +ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408390; x=1778013190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QafK/wXpaIXO2Yjg0RdqOd6ehqsozV2z1rnfWUzn6I=;
        b=krv7JGYQvQ7NgM6IFio9jnr8D/aiRntoxeQgx+QLUV1QGWfxFyq28XgYRgSmE7+MhK
         l8GwoFYPIkpi0sonVOgp6UVlQcWDXX15dAurR16pHiWz9+RV4p4QSADlT/zm1qPDEXEW
         EgfOpt3hsJtZH6Rix8O5qwgmFPhyH9JqO6lMz26l6Kwi+LNh0y/IWgOmqsW9Te6G59Yh
         Yg+8yFrMTRl+Hvp4cHJVwUt3TCjpGAy86NTAF+xQ1vSkdQ1YtVl5BuY/8sAYgG2aqhT+
         brxbmCDJZhwNMn2uJmazz0dDwcYY5H8/NmAzDozwjxqVCK8ublYEL/+TMn00KoVhAB49
         VMKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aFX475fyPgaWqfnZlWx9CUBziJspPD4EI1/NdA/E1kd72Vy6jDYt2JarKQD53VxjzfzmNM3egXkJpjufIlq1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0EZbCJzdPxp8IHRMobnxDUExtk8N5w/sYSz8j99L4+iJDELsf
	8t7pNfk0HWMOF22m1UNvPbyoBYUWcroQvT5dkfHotVMorRE8l3Z6k+Sp8okYSHz2doKBeo5giUb
	BCPyHQHIlsFH7S+Gs8QCBMU0vvNJGIeiZ/k8KqHmZMXn1vT6FRfTb7Bi0sg1iRXivjoIRetURTs
	W0EQ==
X-Gm-Gg: AeBDieuRad1kzAVd+ydo4l1LikDjv/Yz+GqWyvs0ofVgNAzlGa4sNL6zdhN8EG2q4ke
	7no3GCN8g05gDOm9baa0O32qXGhVg1UwiR2ogIz2Ky380tRb9UAFZa2Ju4ZWCimkupCLWKAfsqf
	u7y4xlDsSNlCr1xHbwDzXdVuDIW2RDYhV+U8DmWerz4VceFxHILSpUglPjsVIdpf5Hz3UFdIV6U
	js5y7rqslOU2p2M+r1+j+QwtW7e1PIVeitzMykDcqJKprkcOnYAwUreecUeY18D5N7W0tkJFc1z
	PSuSs3AzKCxfGv4DleaeINXCtO6BL4w82Og4Ch6Rq4Ke3ZdeiOAY+c7jus/c+eFNLpv/xwEtsdl
	faTRQzuLCLoXgF0QZ+UXHKQnaJm0jMbrLFA01QeypOURHRu1wBZXnK/gGPqkcVTfa4waC9cybDG
	zctRTQTQZ7zicaHJVg4Bw8lCcYqpUxhBTMpV4nMZvkloIzww==
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr62480501cf.46.1777408390159;
        Tue, 28 Apr 2026 13:33:10 -0700 (PDT)
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr62479741cf.46.1777408389609;
        Tue, 28 Apr 2026 13:33:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756c9fsm12644e87.50.2026.04.28.13.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:33:08 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:33:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <67pqw7jpoydsbql245afcblpc2jbfn7llmhc2qbhrkf2epflp2@27x7qttw4lxh>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-8-a537b5567add@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-8-a537b5567add@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5OSBTYWx0ZWRfX4f6wiUaCRX0J
 HEUCxO7szS5Q5k8IC4cbK9MZhvapuOH0XugZMmycK5SL0HpAOuM4gBERQ3DNDvx014vI5gOeQEe
 FWpyUpt2EJAinee+i1L1R39YeEdu+kNJ2p1WK7Mis2P04SCGDI2sbxFu0FI1JpStHDd1Nz/2pl9
 +5kykVYx/O9TTJkyyxs1f7t2TWSryjBVIJXnyZXFOna48MGkBW5WELwwMR0Pzn5XzgSRFSabtRb
 C9SRWqamVBeNJ0NMoZEHmfolC3j2WAXR15zcObOWPMdSIKYdPEkonn4sbISAGXsm4xjjm0rv0Pt
 09lZuy005CCM/ZeG0ExPqxDPp+BFoXYqjM4xoirfo/j4idOBJOP2yaNeb9v2DQC7Vw6grrOg6aJ
 thmifcxwu449ZBoZdEFnBV9RUWndMaLBJyFFwmLirUwp2myNuUB9kE/MK9a7ehlZhn0RxU0S4fW
 lmSQJRfYglRzOd4r/Uw==
X-Proofpoint-GUID: qYFDtElX3sys5zsfAiSfylluGIC0Pi-m
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f11986 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: qYFDtElX3sys5zsfAiSfylluGIC0Pi-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133312_033572_64357A74 
X-CRM114-Status: GOOD (  16.76  )
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

On Tue, Apr 28, 2026 at 05:30:57PM +0200, Luca Ceresoli wrote:
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
> 
> ---
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned

Biju, thanks for pointing this out!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

