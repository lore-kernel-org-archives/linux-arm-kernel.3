Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEFBC53209
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=; b=DvvSE2nFxoLjlCZOrCcqnkbXMC
	ibe+bfc/h4b53ggOI2g1ive+bnBHv4KTN54Y5Gn2hhES4NzBImgPhfAhUVD6Ptsl5jGKtUMkSwOaw
	tJJl4PHB+FudiPqVGEIKiOFDz5HNwaDFyX6+p3tydoQ7kKK3i1dt0tZTdgd6h9DPwJOWsfppepr8u
	oxp0e5EVayTJtkV9EA27eALb2N5rb3lRkwTxcKHMucIje3SrCi0F35+mxVYTq/MXxup8+mXJ50A/h
	SwLCIPL9/x//+vevurd/6xBEs2fZnIkSNLd1gpaelZKbOsyfM+gkhZW/39PQDYJLawDEotrgP/g2R
	hU5gtX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4lG-00000001X1O-1gtU;
	Sun, 26 Jul 2026 19:43:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4lD-00000001X0b-3nDf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:43:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7Elc2353217
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=; b=NPm9kHgZsDf1LGlX
	jzlVHtMg0YUIG18rO33jutaRk1yFpZdsfUZVRWXI0ghtaU1/yaZpgmvF1zkkIkMO
	Fx/GEM6lleoZ2OcTLU3bCQDNV8OfTPfNjRq65BaBvGXKNXhIMzq0ln7rci/Qk6fr
	bhHa4Hm6Jd1qdtFzl/Ez17lREMOW1lrfDBpw5evnVY9Xoy1I6kuZkcMe/VXEJ+KX
	Pn0yKJyoOgri+0JqUjlVmDNy54VMgGwyHkj89PveR+TywEoAf/HLoQ7s4fPsnpUE
	ysQBHzdtZRRTpsO7e5MMXpwCaF2Eic1vfLqRYDOcebT3rm1E7+C2mEIsQneM6hEz
	vMj/ZQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufuska-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:43:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso3292682a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095023; x=1785699823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=;
        b=jxYi7pH4TtNv0Cq9oHrW3lTc01MvZ2aVGRtNccE7Vcrpe3aQv9lHm5gN7Fe0imlGp9
         Eo0/HGOqbfJg7deDIqGn/uQil2qJcPj0R7lLnC0mJgr0TtAL+0TIL83pgzk+r6DItqPv
         9lsNTlNAzV5IMiKgdSAI0cQy473kTR/SpeWqw5mrbtjNqWkEaUPNwQ8+6ptbhJclQiwA
         B6ckWI/+MmBeyBDPZ7h43oKIow1FlHdPkwKNjC7dnudwGSdn3/afDs+C+OPaqkOm66I3
         ys2NmN1Pqr0ElnLr7zTVnUKX64gFxZQYW/46oyp6Ztoj+vREg0186TjizP1j5CCCmBu6
         SszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095023; x=1785699823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=;
        b=hTgOsjbquMTegaCGoWNj0VODyhHaSiOEysPn1J8kLiLFLReb8VCR8AjSnF2YwMKxVP
         99FUS/zFzXWViE2O+3S31WkWgpTpk6xKPeNm+5nUoAGutGZ0x3XTWQPs9SVFt/2+JbuQ
         JUHvXBObmGqAm5mYmSizc3J9T6ZnVLYViTo7YeC/8e6n7ojxqwD/Vq7oCpJdseyKfjaQ
         fQh1H37ySSgmGBwkljKO6HKgHLJ/4RxBsKUUCeWDFJOVcq/QDjYEbeGgC0zQ+5bKlj/n
         /9PWEx5HtguXq/PfWgMRdd8shdYMQcL9PiGxbGA5EToWhDxhErjavk8LcsutHRkTQyoZ
         QTsw==
X-Forwarded-Encrypted: i=1; AHgh+Rpcfjb4NnYo9RpB2sF8caJ7LXrEYRoWaLERMTC7NmLzLbMXGdQdlWV3iIhp6O53b931tpaq2XWwafdgZQp4yS14@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6SswBXoOEPQiggenIKtWAPXr7t7nFzeIhyq8VnMweCS2PqSp7
	4ytLD+/bPZZUI1CvyJxYvHeNzQFdWUlTGwAzYzTPVxhpDEeSmhak+ub+iMFtKrjRP3jN+Kr/deM
	mZ3nphRQiVcCo4TNJitE9/wPDSWydC7JzKrh0/rKBDMVe21vjwPqpHma852aYQ5a8X4COP5j+k8
	u/Qg==
X-Gm-Gg: AR+sD12rui+tZQYk9tC1FQHJ/AMAymYPSE1RUsXVR26WgoNkbJDtAe1COrCVlMORRAe
	QDGOBGfULmp81Nz+bDRBEvk7cBsrlyFw6XRAuMbLNCh+N8dtdIJ1vS4eiNneVWp4kpmDzXQ3UIy
	rN3bu9L2JcwbpeUbaxzSnFoYF952s9uSnsTa2HlJbcUB1K8DpN5SMAbl3mZHPJrIIf6SXgEXv0G
	UbWeelCIfduCs2CB65WoeExmgf2u+zpN/bdPzZGxhp005b/No2Ej+11qD9YyoM3xOUNfDJpmwdQ
	4swihVyK3OH0xFomHaoYCBRK9Ocn32P/CFVfDSr7XQ3DUvgDVMwI2PTA06VG6Npev0ka/1/+OpC
	gvJr2/JfXqKN2qPgnjkN6
X-Received: by 2002:a05:6a21:918c:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c67e0e92fdmr5593412637.53.1785095022559;
        Sun, 26 Jul 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c67e0e92fdmr5593377637.53.1785095022117;
        Sun, 26 Jul 2026 12:43:42 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:43:41 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:42:32 +0800
Subject: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=1575;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=0iliuiHXJ6h0/St/QGB8FSTuTPg/hKE4ZxbThjkpOEk=;
 b=nuCUHzR6KH+1G4beZzHutnnOVPquBUhtAMv7nYpAmPcJwkzLDxQbdplnG0zdIkeIj2bMf6cbt
 akZOj/szyIRD7rXgAh5kCjmvJ221hnITo+m6kuUDxyG75FWxOXTdMnr
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: fShf82yhnqiRuxXY_88Eh26HQBGJcDRc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX//sghI/m00UV
 BuRSN7U0TAmbEkkrBcdSUKBdoXVhLmvM+KFZ91ByCDzCcDbyMMVi4/2YT7jQoN93YnfjHhB69Ve
 Lsx2quFiAFKkxla9KLarGYW5tREZEhI=
X-Proofpoint-GUID: fShf82yhnqiRuxXY_88Eh26HQBGJcDRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX53lEQCaBkbto
 h543zDVnMLN52eaBIS+Qocyyoy1LqbWP/zdhHxq0mr2wclfcQ5r+h3hNEa/1eEIoD4jl7a3KSzW
 eqGfNNkiXdecpcCpiJM8SLiwoljn9FXbdeB/7g1T6jkHWbZckIhe4A3YEsw4yZ+RJKc7PIxOXDh
 D0Pyk7sIjI7JGPp0OjTdiVBBJU4ByGjE1NiDFpK2VwYzqGlv9KeLkgW264JMfzbezF/fTcugGab
 OmtPZmzGQSY3x3NYd6TERsmuBO0QYMR9gAIPGXsKue5Cv9J3x2pkFKNqOgdWG4jZLuD4AqjG4S4
 56Cjs68d9g/RVxg6+uM4jLsUpScBEjWS0AsWBN/DXGr1+wkIzF7841o/IggZ/VEn/PKnvGDurcQ
 URw+QIZx0rSwixEOPHxlBGwvyl8W8Ltn2dR1ojqQ2IX46ndM3DAKyMyuFh7xOSxO7AzgYnYzS7s
 0pAomBW4UUBjntVg3WA==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a66636f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xnl2VaEmiNnR3tlLptkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124344_131034_B34D7A78 
X-CRM114-Status: GOOD (  16.32  )
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
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index f52832b43aca..81024f7d9e96 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
+		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
 
 	if (event) {
 		crtc->state->event = NULL;

-- 
2.43.0


