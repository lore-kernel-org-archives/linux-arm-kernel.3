Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC124F588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=Ul/hKsu0LP1gwgSaT/qQbIhcDV
	IynoJV8p9e3oAVCZm0DctPHD3NtngfxrdE4SUZgqjWEXkCsfnW9RVFLXc6aU5Ne4OTOj6uFyn9WM1
	S+LwcIqgEis3llLvur4grk8YoI+UcE9D4lhLA/cKo3Y6w0myaVSHdXM6QEuYcTssSIo7t7bW9ApZf
	/IeOUYKp17JEqrVu8cukpjRpJmf6K/J3tw+YJJQIyNWI+NNJ7h/uymMwKhBKyAbUCn4CFKodx6pGk
	0dPGQ+4EPYFv15+uvxEOiVHRZfJ5qiFxe+t/N8YbXtNrFuL5NxhjImnszgajwg97O1LmkKY5lN6Az
	6lUJ/ZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbM-00000007IAB-0HJN;
	Mon, 20 Apr 2026 15:31:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqbI-00000007I5g-1Bqv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:31:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K977Kn2755626
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=dc56aiY0njf5+Kcz
	oFQPOQ91h2MpZ8CmCMDVtHY8m9nILsnRIaA/Vx977nx91Wmc8Sdbby+vw1yXj+ZQ
	wHQWbax935GdSPuPHBXrU7rOGk5pDGViPAHaLifUl8/AjILEK4gEhxvQJmOE4LIX
	QClHAFk3ltJ169TzNbTg/NDqkcItxlv0F8BcrghValOaZ7evTLLUVERglK60GuEI
	zCiFsyLirNRvOpbp/ho78zveMutmMh0tUrft3roSURDYxz0vLR7pi8YwA1qDJmG+
	h1Nxyq08VVabWRbbumHVDd2G//ZFhDUBpkbFqfsZLNZx9PBNyqVqE5TfE8GMnPvk
	a9aecA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xhcnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 15:31:51 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-40f09403c56so7513472fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699111; x=1777303911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=UMvE7zGakia88AiKR/6QKv+ZHW8qsMWbBWfpaUbu5Bq9bnFGtmbJ3gjv6cfacM9awo
         jvVFpkU/dO1907a3CUY/2o0EzWBjMVX/hGgmHN9UBcgIV+Ar3dDjhNrw2lI3GiNmGpZF
         1iMHCad0rPafIBE3n206n2Zp50I7ODqHoiB7QNautP7NXzh0PhCHOiwskUECOwM5gotb
         35fnVo05Q/QgJiRCPvFHmNkarD7WFYWzjBl91KV56AVNX2w5ZU5POInEZWryvgFDTieQ
         t5TahDWjL5PsWNJJ36tUWhgWx353I3TU862irbicC5qnNyau94aa+vc3N8KrTTJDBYDf
         1MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699111; x=1777303911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=O2Qu8Nmq2a+xWAOJ2lqPoVR4pOaUw//ytEBK4bpt4L2SnqJX+A+1shMPyCAq5HyASy
         lcdQRYPCPYO/fzArpBE8Ev4+KzvsyiuBAr7RO28JFSdsenVm1fwpCAdFJWtgWMUsYyu4
         HJ6RQl5TeCeTKw7HBbsFFuFreDIoMpGWXXfH8se8Vf+5Mim1Bz3sF8YTIXo9736Dr5gN
         4zNF49mlzgurjasA08ckzt8OFf5M8OzBXXO0kI+j1C7dTUnRI7azi1jvNzWcF77xMKKl
         oq/NwWu6xbkeKvEalhBmxK00SvHKk4RbRwG34Ql8OjrcP0s5BYGATtwqg9f5PUgpNzew
         iQ3w==
X-Forwarded-Encrypted: i=1; AFNElJ8b0b3Rvvs44Vyj1EayNMMAsvnxThznJ+wfmFuotrV6MBjFfclvBO0nbCpxURPJwo+wc7DzmEB6Gh1G51DMe7BC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Rt6WpwZisrJgtdMTepj+xj4+roQ3SajBQ5JneTxhl+LtsQeC
	w9NQsC0nUYJ+DQeXs90vENy5DOtH3YqorOtPipa/3fHB0DMAubaPnHDLjDiKa0H9YoTM6O39qFZ
	jIURM7/4UbQvcUhdwbl64OWDNw1rYTrV/gHA62VwbwfRpU5IVjVy6cExHySzTPCzhBxsjviDJtK
	O+Nw==
X-Gm-Gg: AeBDietYrNY33CdrVZfEPpTaoW9TVMZ0Bsk/5FFgT+pJ386SG5DTFGwP2laq3zQLtAl
	4vGt+I6DJR0lNRyEi4YaTBBxPeu//ii6kSPc8xs7Lk7TuAtdiyCfEdL+zl3rUAu52e+RRA1sUAX
	v/tUhveOJFYj9yOGFTa5nWrmyexPbpNEYDr9PzzVZT0S9Xg+kitkTd7nyAc3TQE4HUVTGji/r1l
	2Zo1vMGx5zgMnG71z0xoBz9EVHKAbTWqV5WWZlot0px5XUETjkxwiSeMo1DZKevImr5SQmckTAl
	ay70frTYHh8bZdpEQIW07u88nCkGiSJteuDZdYxhMlVaLnScOwzC16+gp4hZbU2Mfradsj+sHSy
	osOIdDqiwhzaK3XSgrHfh4PYyeYERRScNrsr2BdHyYOi/MTGe/fRbsjC7VnwPrGGQgWlat6cvcA
	NiEMcig45v+Sx/01h4avURwJwfnH8SocVS880XIZ1IGEP81g==
X-Received: by 2002:a05:6808:1a19:b0:475:be2f:c56b with SMTP id 5614622812f47-4799bc82da9mr6189625b6e.3.1776699110583;
        Mon, 20 Apr 2026 08:31:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1a19:b0:475:be2f:c56b with SMTP id 5614622812f47-4799bc82da9mr6189564b6e.3.1776699109639;
        Mon, 20 Apr 2026 08:31:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:42 +0300
Subject: [PATCH v2 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-4-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+Yztzu7z9UUln2K6NOXnBhWfvkJW3tKzoWyB3ecY64yK
 JZ9Obmtk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+aHLwdApKn4j4vk80fWZ
 Xe+zpj3i6mhbFtPpIdHZ5N7Y3qwa9r9B6Frgrrvy7z8e6hBpLvy1VO76FYfvd069TuoIK+W8Mi1
 C7imLUXYezym3QgPjmdMmCdrf2+1brvbBtF9aaosZ26HHZgkXriZoVZ3IFd4umhkVfU95gt3C/4
 X55x7+2t63sdfz2bQvyuvO1yRnOAV/W9bnzzAvxDgr+7Xuh7Jknnbh2lPb7tk8K83VDZrozMHGU
 vSmev/TY8u2ful4dbbeWppBOU63bDq3c/Lul4ndC6qLG1ammn3a/sPVYufDX/yWdl+/SvaV6R2b
 7tG0MJs3eMqbuEjW/yvDTjz41seRtS3t8yFdM+7VJosYAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfXwRDuu8/rvl0o
 3DuwWaNyKT5y6Aj5Rd+sOhPGL8Jlw8VLUr5UliyYmeXS5/G8ci4kw/d3LF/ZXWiUt+NP2q9kB2x
 htPaPeky4ZRCzhx1BG+SvNllwWSImUhWFMxlkaaBOfhwJJAbwXNBxhrWDwzpdnwh57R8mTb8lYp
 phSRX4c/JNLpPoB3szg5WrvhodCUpPTLThiDSbu6gNbBplbuFK9ZZLeqaM4HKKkBoJj4CjR+/Ui
 yCHB7tTdWna6XYkpEIoNKubt0NBrAwt/pmn7Nlt8/lx47rOgfyb1ecZHVLBmzBq91TKDj58T1eW
 EzuFhYxObJUvVJN3dcXdhvUL4bxZmgi2ur2uwakK0olWVxqcSXx8usCGQm/NDuI9khTWrVRsdHA
 WOthnUqhBn2ndKuBg4u18uKZ/lS3gn+4iKV3rPKUxKX2IQS4uYVPQRAfS3wApVrNUA39Zg8CwCk
 nJ5qPtZXarIqBPAMA9Q==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e646e7 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: cuE20j_CXX1cX3OGUk33e7WL4I1lx4dh
X-Proofpoint-GUID: cuE20j_CXX1cX3OGUk33e7WL4I1lx4dh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083152_356823_60A38597 
X-CRM114-Status: GOOD (  13.92  )
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

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


