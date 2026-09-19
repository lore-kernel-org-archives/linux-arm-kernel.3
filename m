Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094BC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=; b=Jx7lTyXx2K58J+bEZQ9cw/XPRk
	jX/INra7/+ofJk6CVFiWKzOBll7s8LBLqOs57POS2G7k5IvOcxs2aX8JRy/yhZdllC15avG2lUqkw
	Cz4AXEXAPk+rTjC3UvNLHKo+EpBbvwj6rNu7Oe5cJ2GKKF+7nlHBroknCuGD1I7PzI++iZLxNldtu
	CsCOFvsd0DdVmOxiAp9yWS5AqqQzOVnrzzOGXjXWc1/yQ9XSzeaI1uYN1TiFxILsgQ63sJldyUzM3
	D83p/o54V30luktZyjPkMp9Nk38PS4Cossk/JNQRyuRS4zpwcHgvG64gJbc8kHwSwcLtyRRd8WRJ0
	mHc2i1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wZz-0000000GQ3V-0aSS;
	Sat, 19 Sep 2026 15:02:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wZu-0000000GQ2H-0ibb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 15:02:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDJVUK2462115
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 15:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=; b=f7ZY0YhUSOf0HpjX
	ctTCgwiYIP7vPW0r+GlufaGoFYZ+HV/3MvVfAGAdURU77H52IW909HGdolkoRK3q
	K1uXFKJA89mO6aghfcXYO4FkgWwjGTn8ISPsBIOZqrzdgASwLHKECgr/Uh7w1iCv
	d0sUMJWZGpwXPlwaiSoSn6sHKcoKovL8Vr2UeXApyJfryd70gFW4E2tohizGuNd1
	wtAOmPl7tRCSJVvrOBSGy5BlOJ7RXsXPk8tcqbqifVts6/p+tNhjeswj+3U3JYAr
	MTB55XZE0FNwyjj4Iw2e1UqZQH1/Nmun2WUm44HYuQIdcCThNZ3y6DGWcWEYnbDY
	CijVJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk0yv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 15:02:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so3193466a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789830129; x=1790434929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=;
        b=YwFk8FIT/L6+/QHao4oH/QdQt4V59unk3K00tr++IoMOaRsKYr1XnJmsG2cL2P3RoA
         csOE2wROQG/BoP9DiGsYVSj6M1tfzgHRdStEZBsUwJBJHZW/ARJRvgshp499Grj8OhwB
         oAW9/eCbcQDQTss84tbnZeSAGlB8kArJBDqIpB/kFL09iyxWg+bY0/cMnp+2AXmFirR3
         K+ZrS+72wOWU7K6W81lrzmyOG+gnEgDdsaPgvfa00ooMGKY9LL4r+nNKmXjlS2g8mD+u
         tpeOi0yUhbfwQPyOyyUZ0kznS+pPRFy/oYtfJcnQFKZh+Nb+3rcAWgWD/VkzCEzN+JkT
         jJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789830129; x=1790434929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=;
        b=fsbrwSiu0WRNZS8kNOe1K5/nOsdamxIysUmw8k3RCej1jXjym9JU6MKrYruvXh8MP4
         klYlBjBmuNPu5jFyyN1zwgxQLlrh6GsoeSJsPOZYkmL8w6NdLrTlUKR24+/KKpeFcFjZ
         /jE57xDHrk5vfBXJ6kkx5ghajwxHzmY5TL1sBi0E88BhsM1U1D5ExktYyNdkAv2U0rIa
         Atov6qCSSa8uQPLAsLrCuZCu5dCwl/r/xc00yLp6ewxcL6oGPfvmaSFrgpFAzIqtqYyE
         RvYF4lZwyzlkPDTNt4MuBcMXuNKUtI/7Xgbos4m8sts/eIfqA0UkF9g3lEiFFu4lmzB+
         9wpw==
X-Forwarded-Encrypted: i=1; AKwUvBwFEyihKgiprcO9HtSVlYWnOiaSX6wMoGFJ/pOH2yRmUqOQ2AK20MFKG9LDLmRnbKPlJ3yG9U6NW58nndskV4IA@lists.infradead.org
X-Gm-Message-State: AFuF++nW3//K5BhknrvNuOdWP/dNDT8csAvpqas3nUYgEDJJEpIxurZC
	x8YAt2SaVUqGhB1bwyx29fquKUvcoV+bbRozXkdJV4Gnsdas3QWLFHRiTOp+QuyMPCZ7cSwzle8
	VKVTdyyZnVbMolWIwCZa+Zu80CUsu5CQ2GH7UoxCOxvMVI4UUXtR954/e8gyI3UF9M8/YLaM/Q0
	2oew==
X-Gm-Gg: AYBFou03XXrUcFw1bLN1KbVXhgm4OPB0q8Bht469U2FZCAF0a3HpUyW5VUByTb41IWD
	FKixGQ01Phhfaq4Xi1qrxJEtbzJYY/mahDNINZkhSNYimrMdZJDbI/bSIqH81of6+xlyOPSpNBU
	z3XIEnEmuEnxqKnPdj0oGPtunOLAtLYYIUu4xAJ5B8IZS850+wBSHHSA8QzOyZBkUs5E0xXHZTh
	HDim18QWmnKPaTuSVOnn2q36zHOlPkas44+XNF4lu1XPiX2JmPKWlzFZGgNTPwUnKGtfsFzSnad
	4Pp0uWU2V0WcySrVRr83aiPPsGuwGrVJvxxWegbKnd1fKZxD8JVlUDsDrDMufPI1rtBfvzGzc/K
	GcFmAgan7d68A
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr12911313a91.16.1789830128703;
        Sat, 19 Sep 2026 08:02:08 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr12911270a91.16.1789830127971;
        Sat, 19 Sep 2026 08:02:07 -0700 (PDT)
Received: from [192.168.19.100] ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5045206a91.17.2026.09.19.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:02:07 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:59:35 +0800
Subject: [PATCH v4 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-b4-imx-simple-kms-v4-v4-1-53b1fdf4589e@oss.qualcomm.com>
References: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
In-Reply-To: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789830097; l=1626;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=Iq5wCYI4y0W4CO8EIKI1BJMBBMwBjbLDSVf3wHXjWNQ=;
 b=tmqa4fZQfIDCN/GOTkNIfTyEWA8UTbv055ypJ64BGtdU8/5Urz4AvTiLV2g1hJeags1QTwq3Q
 58mlELqcocmBR6MCKokP5AWbZEcfz6PmdURks+gKVIxWlxkwIohtakU
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaea3f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xnl2VaEmiNnR3tlLptkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfXxCT3H9yJVpMr
 u6N87btyBDAay9iTobT84EupjWpwA0IcZ35z5FbTHKrGGJt5QDvrBV2jq358LN7ryf59IVPZAP5
 6ePlw9SA9guJyXk7tm2/VYrMMeoly2re8umrv8cqgrrTd5ErmkCgs8nES9ihHbPkwreo1vAxnuU
 GYFLjvIW0c8RWIKLLD4O33wdGmqCHH20b22f5c+9qnv+/qQSznSDztkJHXjFVXO3gGv2qV6Zmte
 0AUVEERU8thprGCLaOhWRC3TYgZ1+lIBIIBIT/JDSBYy+ZTmBxbx6TgxfPktD76o8J23pHdMvZS
 x5ySM+KPxr3dO39SPWRrR5pWxhpU14ZgCaa+StnBLHPWh31bdmBbId6xibKpI8WnUWAv/++EYhZ
 1HJQYPgsCyrFJPwsoHaMo3c2e22nr2qQiW9XyN29iBO5snQ/pXDutMRNn5s6quM7VOmtBgWoUQZ
 et7fbvQPMROE6Y0UajA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfXxMRNzUZBzM/M
 RRZPQEfdT9cGigrukvUT35hCe0FjHqlU7MVMGLfCgUQGC7OUUJbwSc+D+4A8lkNsUvToKbs6Nui
 gB8LTwd8hwOZSLWI8T8t0mqaHwWBeiw=
X-Proofpoint-ORIG-GUID: ir4usVH5NWnKoWadsimieEQu30tXG29-
X-Proofpoint-GUID: ir4usVH5NWnKoWadsimieEQu30tXG29-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_080210_234641_E9895A00 
X-CRM114-Status: GOOD (  17.24  )
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

The simple-KMS helper calls the pipe update after enabling the CRTC.
On an enable commit, imx_lcdc_pipe_enable() already programs the
mode and enables clk_per. The following pipe update sees the plane move
from no CRTC to the active CRTC, treats it as a mode update, and calls
imx_lcdc_update_hw_registers() again.

That second call has no old CRTC state to disable clk_per first, but it
enables clk_per again at the end. The disable path only drops one
reference, leaving clk_per enabled after each on/off cycle.

Skip the register update from the pipe update path when the CRTC already
needs a modeset. The enable path has already programmed the hardware for
that commit; keep the event handling in pipe update unchanged.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index c67fe80b8115..e00e52c1c46e 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -310,7 +310,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
+		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
 
 	if (event) {
 		crtc->state->event = NULL;

-- 
2.55.0


