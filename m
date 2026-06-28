Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AC5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=; b=XxBtCZ7ttLAlb9T4Mpxq1PkGla
	j5YxsEzLROHlLrEkPwv9K+v8Y/zWei60z+x5+8IWJkIRnCbEfzoTmVNUc+w9hrxgnM5NVdK+c+vXF
	x4zxgcbFavEYZ489jLYFA/1Ia0M4eNe/K8kO1GOOJ8XGSrn9N0Aclyqq6hWv+q41m9IawvLKSM0PY
	NWID6jXhdfPRQ3/vzdWuyS2BdvfCR9/88rtrneOHnRcOM1l/SQsRjXX0+BerMErZ9Mz3bcxWEuVj4
	sYO9DCbGc+QbDmo5bsveo84bcMtMJR6kN37LNmgd1waIvC0E5R1J7PMo54L611CXfqoory7KkaeFH
	dnYo/rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyKl-0000000DSem-1Fm5;
	Sun, 28 Jun 2026 22:50:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyKi-0000000DSeL-3bO9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 22:50:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9jFZ983086
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j+vRFFpc+G0V53boa1pioH5l
	DzLNJAkcW+8BSOZcbSo=; b=AfyvBxRyo223qh0kt1HewpkBVIixQE6iJJrQUJza
	vsmwNGZOG5cYLbBgLndEco7RgaWs0/yUywvC5ebhj6yxuVqK/vIze/f0WziDgmyj
	Uexv0Ml2PkT35spCildFcWgRVwnp8m2PlwPMeJ3X7E7SnVPDduJMqvGJPX4lmy5Y
	8nexKvYyJXWUK22nvWwwt+NJcmHxL0CsdZ2SlWlj/NPro+lH3ogUSH01IWDj9B4i
	PDjSjeFltWdBN8jG2+xCIiNusLf1frOEgM5tLGKsXZoZCb+mMs1byPLLZr3fpyEJ
	fuPmbfafA0PyipaSZ4vDSOfjFoiEI3H6JoGnMP3sQ1FD7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083q7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:50:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b380149c4so192089385a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687035; x=1783291835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=;
        b=NxaySSnbDwQ62l97H3VYJB/CipfK8LP9f2MrkM04V5Z/TQFb7MmT4RZYYsM4pzWqA/
         rnYAut0Z4WgNd8basswAVD/pcxkh30xvU86fA586k3D2BMbQEZYKxQLtZMxE/l2W1z3U
         J646JeAQErk5L1O7L+T/rNpxGK1LRnIKn8xPVYn9Iopb1nNAAgY2lSZT+xCpmOS2IAat
         1TtCybJJzsvju+UfYiTG4Lb+ceu6snqnrj7e4Fs18WogQt6BxnnbB+BC+YQFD5uKra2Z
         h8R9thSvv50iIxDXnQqOCMEXWi4bAOPKd+Wxl415vzneodaXnJQAS1zCZGVI6c+f3zID
         jVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687035; x=1783291835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=;
        b=cbJUqyebpmY7r562hDLozcs1zjwXHWXvlFvmVOghS04Oqx/MQdNyWdOJGwsP92pk0f
         cpXkI83az18Z4fVq5qgoL55isg3xW7NUeNH1QDdGHlS6fzcbHwMWV6O7/GioVC4+SrIq
         Ix5aeIEKzDhHV/GEbkTi5LnVfLlomMgA2dfQ2dv2iSKhTn0jkdIsENiyfDbHqHSS5F6J
         52LQ4aI92O/7ais/kKqQzBthzcIqow3mXHvwb9nekAjMeDItRUX+T2qsc2g1Zm6rEegM
         vjU0L2vW7BGMRmE9x5OuPgRewMtCRpntBOH+cUQTfcp2Du5AMhXc5mTgn0Rl16GhVE5S
         w2+Q==
X-Forwarded-Encrypted: i=1; AFNElJ81ZPooLzw91xJrZ+Imo+XGSaYiB5tHibbIkuH04XGZrOd1HTaAqIHWSuXcv0U45p4ZDaWlpwcxe7UOfu7iNCTO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1JKSzXeYYB0ScDWTGYok+ia1GHgC58WRul2qqQKnmgWP4l2Pq
	bf857OGwM8sAhCobaSAOAarAevB3zZe4W6tpDwMWePVUKOKsRk1gOCPqSzJtmQ+ronIw4PeexcV
	wGsZpwr1tZHVsiCUOSc/icoxFKfA3s9wDXiMium0L8mIzlDrzdQdF9HY8MiZE9DHSIu5SU1wwpO
	82oA==
X-Gm-Gg: AfdE7clOY7mvVA0mjN0t+5qhdRxYmU1bWObj+cJqw5XvG9BEzgyLmRtN+wAfVFEMyHe
	Iwgp8+e2XkOL/X5QYZbMsSKVTkeCEjQwDtLsBJx+tqwIhQtafX+Bn10EVdt2xJpb7MjB9VcRC+9
	eQAqS9H27+R4BLUb0rRtFTYjrhadWJtONDM1ODw+Qy28Ynk5HZHi40Z4CSC6KARtRT4AC+VqguK
	swLViBAlig6Vck8eUNf4hWwJNj4CGJHYDy9tc19DrA5Ko6c+TY360Bo3Z4A5ayQ/CiybAORzjrK
	nppf+jo6GY8BPwUg8C81op2UKDcYdEqWEZp2vX5/3uSfUGysT7hEobLdhb5Mi6HkykVmGHBfhuj
	yqe1mp7epnjD7Prmbnohx0lf2GQ8ernjWFqCLybkLHhXVa1zVxOjzZkIW8u/Bs5DxL07lGM+0f7
	5d5gl+XG5Xg8uhAoCiYbF7QjWl
X-Received: by 2002:a05:620a:4153:b0:90c:be8b:3676 with SMTP id af79cd13be357-92b3ee65133mr1273574085a.56.1782687035240;
        Sun, 28 Jun 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:90c:be8b:3676 with SMTP id af79cd13be357-92b3ee65133mr1273569285a.56.1782687034719;
        Sun, 28 Jun 2026 15:50:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a8b6sm5337343e87.39.2026.06.28.15.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:50:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
Message-ID: <n3ttyffbsve56cba4x4texugczjkogkv534rjvw643sbqjgcee@iktjvgiqzffy>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41a53c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX1nKK+nun+Q4O
 /rvlitO6E7cbEpveiUBDFFSOTCRI1zYOI0ZhX8iC9rol4kn2lnWYbCh7nSD0ffsprBkp+zIftr9
 6dkoKPWrVREhR/yfhjz1t751XA8FunEwbosTUj44jWFTO0QNGzhzHc1YJq4KzphgliN7NjgXaGM
 fpyIFyTccakBnAvYtt9/ystSYKwCsHmU9lR3PDvLK5TNZefbHUe0VJdSsR9M4lcKp9lsjTA14Ll
 2sSrcFZEs0CPvPyxKjO3ak8hwpqNWJWkVrL0BTzsQX2Xd35Gj3S2Ia5RcOQJYhW76ylvKAflrAY
 DFZnaRQn5Q2UoOHayXFxgb0VhHmnCe9/gLmgcdgIfF+c/OdnBWbGabHrrgOvXaRKNZ+ldXRGVD3
 idU92cgyohUwzSs4wGAfklR2ZvHLuh5jzfNH6/AZpIWUejXNILkNXyL2luN1z4lZVt0ITKBOGLj
 9J2YQP+8N00WLnbTCiw==
X-Proofpoint-ORIG-GUID: Icyn77XD-FpdtNbpEq55Don00V-5jMQl
X-Proofpoint-GUID: Icyn77XD-FpdtNbpEq55Don00V-5jMQl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfXw3FkZkkltwxJ
 ZDvmXvYHYTSgoc3rotV6+2zftq1yCrAuAL1+cSmo+f1I0qsm20WoqsEuVYskBtdgePlaEwWgquk
 gODRvQ2F6gkDX4UQhNz/t0H3rY3NvHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_155036_905421_6E905ACF 
X-CRM114-Status: GOOD (  14.26  )
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

On Sun, Jun 28, 2026 at 11:53:58PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
> interconnects, IOMMU, OPP table and the zap-shader region.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

