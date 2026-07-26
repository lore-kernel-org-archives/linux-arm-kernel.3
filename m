Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ADEC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=; b=KxI+QjTwokR0Tj
	76MpjfVqgOV3N0UV4XnHtCKoQ8aqgLs0XIMrLnbthay7TefRnkt8s7oPzd8AkYgETqJIp+X5H44SU
	drjJMg3RtO49hkiBkd5EFZmF2CqQO8N8bblMoSGqA5XOIxWsY5Eq0EyFU2DU1H17jc9VFoioqcqnD
	onrbIVjwBoc7EADdqOEB+DhImKPwRSw0SxyJ3rjk15qyuqHIwKh9fxAoDE/B5oFJNDpguNTFZf/Ms
	1X/j0szFjHgPsP/81iq1zUNXxBgxCoRQD3WIEOcRvRcZ+04Ucu+ImDDBJGR+2p7P9hlUB9ct6Beaj
	e9jT/pv9NApg8Y4l/xPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4l9-00000001Wzu-0qRn;
	Sun, 26 Jul 2026 19:43:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4l6-00000001WzS-3E8V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:43:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH79mq2353114
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FDQIeXpPD+dwLpKCV5Porv
	y3ne6CU+pJakDyD+AScDY=; b=pAZEOG1UWrwTp6+Udv9XpGfugtOEAbIEc8xh32
	izDKpGGoq0uH1WZWcQJmbJh+NgBE/f+Uy+hkdw7i28QDjdp4ViKCyfkO6VwS31Rf
	mPq41EFbFh3JI6QUTWEmXHsgHUGiynrS2EXPL8ZkcGbth9TSJM0wOlwvSBZpQM8B
	S9RjIOpjJQY3oPTTWsdlHzfSuVc90CxICcka85UZSEoOl5LywkG8t9kdG5gFsMwx
	lewic+xOYkv8Oo6dLPBQixW7/Z3DgUgfa8U0YswMXMz76jIhiG6QgcCMmaHZOpAh
	3/lvfjR7c+MmmS1k1XWZ+opI3fWzDVLKNYC2G95V8q3IShMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufusjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:43:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae455cf6dso33072975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095014; x=1785699814; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=;
        b=R+fg7DmBbQkWAzHwmsDlSVCE+P6YNNko8VqU0R2pI5NzqqcRLGTKyEiM0t/soPuCVC
         f8jOmHAVLfwghEfHwFe6nFIywZ2pSjIfKXgkxWYKibWnLlXHe0XhZMvTHP+pz/fDH5/B
         PgQGLyEdUEaM8VEwsvxd6PjDmkiNd4CY5ToOGMq8UgTE38Ue/cW3EHzuK6ZgJ/wGNDm+
         V32ktdPer7X/fU8RsUo8ADucO2u7gTDjL8/UbQjYg4eTHK8OC7ziZsmU7CFj7y/rj7OU
         x4CdUqVhG7FuhEYH7q0yUzq4XkHufkr5ub0kEoa42du8BzFaaM7kVmResqcHbA1JSMRz
         n36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095014; x=1785699814;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=;
        b=fnXKTrgZlQkfn774fXmnNYawcMg5PsHVJEI5ypuU2Y0/1J4+HJKu5wBmgYNAMNQaHB
         +FnqXhsnTblR4vGdLqX+l1sHh/GH4GFXkkxi2/qNBHTdZQ14D8iL2lcN41wgPN5HsXKd
         ItWJgOmJZPLo78mXisJRvTTWePwrr+CoLjvPIqY7ZAR6ASypvCuRhV2HZuCf2Qkng2lk
         OuP6nJeVTkwCMNXlRfJ+u1KwD4C1YjWHPaNYzfN7zzVjfdHNa9F/VwURwVtSXvSCqhbM
         mUH6ZkrbSeJsW7PmN4Gt/kA/FM1BHk9Lcw66qFfv+0/bd1PUBTtrQDGCN5dMYRrYssSO
         M8cA==
X-Forwarded-Encrypted: i=1; AHgh+RoS33iGRN5219jCGYnBMNLsrN2wQdRLCpVG7DoSyLe4NUbzVNioJGYQYFjuQQuvXphYn7R3Vn9nS9YDAs3jaV8L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7IayEqxv0lpaK6vlZusgzaDy5efKsVkhZXDDf/qUXR0kdkRnC
	8ZCNC5pFZAgy0pDBEOq2nnw/1kkXBAeAokdFJZylFUnUSDeUjcnFzel+k5hDYYUo9WzfCB8vKfQ
	mii+iLODFudwvWyaH0GLliCl9iofq8nPMkffndoOWz9vX27vzonvQp8AHa1owAPwpVe7/BSFFW6
	iJKQ==
X-Gm-Gg: AR+sD12kR+TlRGyhzaEv/yQVTdhkXHkUpZaeW+Yc4MnlcPobJkZ5Ua1j84wpZdvBSaM
	uP0kPl6GLxjzL72bcy/z/GnZSw9xKACNIXIZVNxMjrIu+IgM3DcDRsbAjdpvVIyvuM4j3DYVmpL
	JVes+ZM8cbkE8Dn+pOmEFXDYaQHfa74JfG+21Q1vub51gcpfh5wxUfnsMlt2a0pFGpiVx1QddNs
	3xYW3SFq2dTG3YMuq/CywqmkpBufClsbzVI8wpjeDxhV3cgU57joWqTfc6Ph2kFu5fVo0xIf1Zo
	FeRz6zUCH7P4KMDXEp2TMChlxA+c8E1fpB+XFfpIdWYGbwvkgNwH9Et9uLmpNBokFkc2mPg90qu
	TTyKxg7GOAR6dbtJTkCoq
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr5548158637.16.1785095014242;
        Sun, 26 Jul 2026 12:43:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr5548148637.16.1785095013838;
        Sun, 26 Jul 2026 12:43:33 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:43:32 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] drm: replace simple display pipe users with atomic
 helpers
Date: Mon, 27 Jul 2026 03:42:31 +0800
Message-Id: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChjZmoC/3WOwQ6CMBBEf4Xs2SVtEYye/A/jodRVq5RitxCN4
 d9t0auXSSaZmTdvYAqWGHbFGwJNlq3vk6lWBZir7i+E9pQ8KKEasRFrPAWHbN3QEd4dYyDnJ92
 hkFpU0jRaqi2k8hDobJ/L8OH49Ty2NzIxr/0SgR5jIsZvDFrNhMY7Z+OuyJyenhEzGUWDagN56
 Go5+vBaDk9y6f2+1f++TRIFtmuSRou6alS198zlY9RdhpVJ4DjP8wccL41iDAEAAA==
X-Change-ID: 20260704-drm-simple-kms-removal-01a031c6a129
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=2679;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=SzrRHowXSa10BAHCyJ1LhewVqZLaXZNB44vA3ptkLd8=;
 b=ygG0jOkfjjtOnpnb/85WRy8PlT/tiW1jcovVo98E9rFl6SsoVZpL7kFNMISeo+OC86QqJ04Aw
 LK0RRwuDsgNBhR/dSZRqnbW+r+gFyurTl3vHzvkgzWB3HgUd6B0UHHR
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: 8B5fCETiUsZg6wxDKljIyrQ3OxtVs7Bh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX+gakYwsUsMyT
 DBpGo+t+RWHUTmADAOAbbS8C/bjxWQWw1oxve0yeQO3Qf75UgAIEAa7Z6Xo2WEA5kLVkbonumo/
 2iPuuLK8svMA9eMd+EfUidIk4l5wpLY=
X-Proofpoint-GUID: 8B5fCETiUsZg6wxDKljIyrQ3OxtVs7Bh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX23NXI/ETZhtc
 VAqwkCCZ7cSkBTD5PJ35SE7J7Loj2G+hej+C/mJXpTjrtDCyXpN8zAoLNKQYnMYK2f6b5ExjdNq
 lgvTZwkHSowc9zi/ryyV3xE2kstMJOAuSp9tDqegmzT+QpqH/+sM+mThF42p1gedihnQ58RDqO9
 RN2EFRIbjgr+gbtRm3rl9JKRB1Y86ayy53SQlUK81gDr+rHXXaByIkBOWSSm/lHD687KUM/LWkx
 AOWi8z3C80dnvOHyinFzX0YKLO1uY5QsGD1nFv1Bt8nWUJCwtu3c7VgEBlKi4esnSR95fI1um3P
 sGcipZzmqQeEh5OMMGxmWSznne2wv0h2zdYJK09ivQ/W7GaVGOMwYzwGOvVjMqZPwAU7tLtzSaL
 fHFATtPKzYVB7OVcNIT02kiK0bUJl+gEfqN7nm/mfWTiZXBzhCnMxMs4ypav1I5QI5IC5foJi4P
 WV/627jAZbRCOPIe+Rg==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a666366 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Aa0Oat_sKGPK8WdvVJkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124336_833029_612BD80E 
X-CRM114-Status: GOOD (  14.60  )
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

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

Each patch replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversions preserve helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in these drivers.

Changes are build-tested only. No hardware testing has been performed.

This patch is based on drm-next-2026-06-27.

AI usage disclosure:
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v3:
- Add a new preparatory patch to avoid duplicate clk_per enables in
  imx-lcdc pipe update after CRTC enable.
- Use commit-local atomic state in enable/update/check paths.
- Link to v2: https://patch.msgid.link/20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com/

Changes in v2:
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths
- decide clock disable by old crtc state
- add calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() in crtc
  atomic_enable() and atomic_disbale()
- test crtc_state->enable before mode size check
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

---
Ze Huang (2):
      drm/imx/lcdc: avoid duplicate clk_per enable
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 263 ++++++++++++++++++++++++++----------
 1 file changed, 190 insertions(+), 73 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


