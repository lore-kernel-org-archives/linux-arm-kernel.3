Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB58FFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IfYo/CntwwiLEZ3vhK+hpUb6DgwSIZulel/sENVZRI=; b=YWfN0oHcuZy5z9W7GSQkMe/2UY
	72Sn12E/HR5AmrFj3uPGvUKxgFGOj+3Tmi2tlMGy2j1W4mIgWOf3EUcSIhmVKzNJZ2gz0q5g+g44c
	qloEt8Lft8VfcF1a6rMHxDvefUN3bzM5YcshJjXfOTSsKGVWhMpUW+1cl3kK1AvieaqENA3370dZd
	T9BrcMXBwyw+jEpLAuBqZqXfORcoqrov3Ox9D/xiBKivdV0qru0TCTXb8tbf1eQehz6n16ysoyAws
	EfDfK8ymXeZajYvjKTk7XalG+C8RQ3eFFZK5SciIgFJhRwEHrTR8/ETvsDOLkglLrytICetFcnHRA
	1PgspW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgdO-00000001LbP-1rNa;
	Tue, 28 Apr 2026 11:29:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgdL-00000001LaA-422O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:29:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vkIK1744800
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0IfYo/CntwwiLEZ3vhK+hpUb
	6DgwSIZulel/sENVZRI=; b=OyQN3EWb+KQcCalY6BHyE1R5E2hPeDwMxmJ8AU/F
	8V7UZjBsXJyZRN42PoF2eS8B9zjOGIxZgeEwhEWPh6maf+EK5AJla/LDYRIWcdWe
	V501DxGVW9TmWB9kGWchcKo/mU5priNX9Sq0hD1+XqWqQa2SUQdeaN9733diGFG8
	bl2Vo4sglcyyYOotpnsdzuorcCxmHsS61h1CqopysbFvCHG5PBcPwTfPLBIObTfi
	k/tRzyGTpLV2YMh/Q98GrI2obqf0M6GBiSM/PDn+b6CepvqhkfDp4rdJtmF0Y+6L
	UpdyDGZadi31engSWxL/MEeH7Voied+sKh9mVtEVi2DqmQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8t94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:29:43 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6ef62af1so17780868e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375782; x=1777980582; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IfYo/CntwwiLEZ3vhK+hpUb6DgwSIZulel/sENVZRI=;
        b=ImRgGOohoYcSVg/5WgjKUXptx0PYtig4CaZaAs+0shPawhSoKwvoc4t0A2bUnlF9Pg
         hr7LAdFrVU5Hm77uLCZewFJrG59XFaLXQt9dGC+WaDNVz+HFwfOR1rzxojt+RX2qs9Yr
         WRpoyk8uIsEtH84JRFdZFbAGkrPD5I9cfzxLOWC0yWR0k4TxOFfWchDb/kMQiRR3XfdG
         0aZtVM5maLIgwcUJwA1J1PeASP+sJvxNX+IKZqyGH5dcqaH7UtlPxF/FaM+k+G33V+Fl
         Ddbj16HiKK9+jZ3CLOzGv82k/HW0yt8jjQGQYFR+B5IULBSGXX3wPkw2HtLV3niPq52V
         pBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375782; x=1777980582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IfYo/CntwwiLEZ3vhK+hpUb6DgwSIZulel/sENVZRI=;
        b=nagRM72M7ZYoUuZJceS5Q4icaOMTR5ev0Nw2dEldUlZCvQ6Z5XeLpkoQSaPB4dtYN4
         ydn0f3HJJErnb/7qY+2Z8iS9P74TruijsC927mP4SVDEjEiKjfxWACAOxtm8K1WumGP0
         6fRjf9VnrhpKVIh4JdoGF7TXWZ3+GTHi2srDDw/vUFdG4L89ztTsTryiZiAlf58Td+QP
         aQ8x2iqBJV0g4XLuWCGUYCTSqZJRvra0yuDXX9y0H7qN8SwSr4g6Nw3EFMAaWbORSIyO
         ipTa7yqw0wXX0DJgDBoyARjQwVFy32aPl2cN+r4WGzKQk5KUQW3d5C3pLsR9TUr9soQd
         sp6A==
X-Forwarded-Encrypted: i=1; AFNElJ+cJnNWruqBLmBLgyVFdPDcmcIvDoDBz6gK6KMeD8TnlVNe3UFwkaTwGChcEY1/z/7k0qqWfaSUIpuwFHtltmVS@lists.infradead.org
X-Gm-Message-State: AOJu0YxLNf6kykERDW1U0fOXGC+KVWCR7xuDsjKtWnOo0fFYyIEJTxZL
	lkwV2H8eMCuYjyC5gfYbZaNgC+jfjERVLuCOOzl1FHbkz0tLWuv9TE9k6uVlfRXMgIVKJ6JgNxe
	I6N2+OeT5Nx6ofVdW2czvuH2c6jqtQ2nPiHvRGsXV8xMKj2S7Cs5robAkDgXywKKyzIIOZWMyuT
	sCyw==
X-Gm-Gg: AeBDiet3AzRN/jJ0O8PS4Q8QSESheGvcz0YsuPJvddXdfnhTJb7tZYileBMqFOQcAp3
	aBcWPSoI32VRMavofTA/MUpKQHWI4Z5o8M9Tm8a8ECPDb1cKRrV0PEXEGpsrHYzQJG1YrXlSLbw
	GM9Xd1dKLQtW0VNSu6YmdveSesuiECHdOm9hHw9t7lpI6K0juoMCtbd1cvE6ybvGowCptNzKYEf
	DSAuuGPoIOh8oTcz+sNhjywuNZTyRXqkrbQYSYE4at/CopD9b1llHGvWy7t5nePasAMmQyy5+wl
	lcLIf0hgszjWA1jya3Dtm/hb4Xtu1zNNUpj/0+JClgCVOwsfaNIJi32tNi/CH4rretJinEBnPrY
	pd6XSmJKsn6B7gR9+YLt2LWbQ37lteF+mF7A5sA32sInVo4ADDxvH018sSVmST5gFf328Q9amZ4
	YLgHUpDbB9QpWtONTUSbkKNyUDmvf3P+1jvn9qkFZZUNp4UQ==
X-Received: by 2002:a05:6122:f90:b0:56d:b4d1:3c1e with SMTP id 71dfb90a1353d-573a56746aemr1116964e0c.10.1777375782318;
        Tue, 28 Apr 2026 04:29:42 -0700 (PDT)
X-Received: by 2002:a05:6122:f90:b0:56d:b4d1:3c1e with SMTP id 71dfb90a1353d-573a56746aemr1116935e0c.10.1777375781729;
        Tue, 28 Apr 2026 04:29:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e0f5bsm6739471fa.1.2026.04.28.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:29:40 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:29:39 +0300
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
Subject: Re: [PATCH v2 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
Message-ID: <vf4ddg5retquxjbzqueligpbfhweuwgmqnm4y2hmla4air4lx2@ubi25fqbxuar>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-1-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-1-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: L1iCeG3VmbeP_6Wk09OkkVfIkjBB5-Ux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwMyBTYWx0ZWRfXzocGlUBQgBwT
 zmG6MFKFKVdQUNJmPrt3fGj2ZQnQEPbBqSG/Fmj5vDCfRC4Kyd+WmWkIYrqT3tia06ZgfpSg8kL
 1o7BIq/m8/FsMqXBSBHiEOkaQV3VEpcwLVOhLMAis+bt5q6K2q2+tcBcsU3TsksKtiFP/y6AQ2Y
 Ql9b6BghKx2j5ipVME5kgyBoVGgRpmf3eUIxVnzjjfHzGtnPzLmMF+enUUV+kN/rz6WPH5X7pFt
 zsN8XcWOkuYEAgTWqq+zQHoVIgnp4G6CqiGaGG/LD6WCoqk0HQJHbAJSZDVQx4Sd8w9x/kOFqXH
 xeb+Mw9XGr3F6Jr2ZgOFtRdrk+8//gI8t8lb+GQnPSlZ7c/EtLSFK1GY/rFvOgiCHRiBw9GWzMC
 +siclalnFmqvjBXuV5Pha/SUl7ruKC7yxqoQUOW5ctV2JyjBlgx4UBab3KBRCTUQURSkb0A9m5r
 wJ6R6ATfk2Ef/Y2r+tg==
X-Proofpoint-ORIG-GUID: L1iCeG3VmbeP_6Wk09OkkVfIkjBB5-Ux
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f09a27 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=lmVp1xxxIbapqg5Hp4gA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_042944_006885_0463D0A0 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Apr 28, 2026 at 11:15:47AM +0200, Luca Ceresoli wrote:
> Most functions returning a struct drm_bridge pointer currently return a
> valid pointer or NULL, but this restricts their ability to return an error
> code describing the error kind.
> 
> In preparation to have new APIs that can return a struct drm_bridge pointer
> holding an ERR_PTR (and for those which already do) make drm_bridge_get()
> and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
> pointers.
> 
> This will avoid annoying error checking in many places and the risk of
> missing error checks.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260318152533.GA633439@killaraus.ideasonboard.com/
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

