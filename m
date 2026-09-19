Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0900FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/JPecf7NdB7Oi+h+e8DqtgFkYD6pxOWeXw7A/ixHGwY=; b=Z0PuUlI2qGUWMG
	yy862h5o9YfyNzd2escDN+wz7TmjOtgcr1xiU+XHvnXcv/ZrzYZ1N5dB1gJ+OmI9D0AN4nv3DgPcv
	71xsI2Q6vxukFwQ1M+51rG/oKDGlJYDDH7421dlIFb/HEEZPHvQ1jMbmoA8j0DGYRfR5zPjoKod/i
	RFCK/XRJjzf5y+mHkLqTRI93lDA+Bn1vHZiCTu7aT78C4iIZcx6mRZ4kidTa2R5q6pAouAkO2A1xx
	oCTJSTuEQ9H8RjWwdmXiNNE4ZCVBXOFZL4L+kv9Wt6OikiO23Qbh/QZ0vztrAsPSWcf8wQ+eHjYcK
	CWkR877mzle1xKBpk0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wZs-0000000GQ1i-4252;
	Sat, 19 Sep 2026 15:02:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wZp-0000000GQ1B-3YB6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 15:02:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDK3dl049286
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 15:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/JPecf7NdB7Oi+h+e8Dqtg
	FkYD6pxOWeXw7A/ixHGwY=; b=J0aFroRqEzc2UShDfGRB0yl9dUn6bPGokZ3Wq8
	J4mHn/OcfHlnmeTUKYYzJsbI0mX2ewbe8xAu4tLe0DAEy49VCTjKFaHxeyt/saVk
	zrEwd1xn0vjTvp1mowyjjH3SeVKLs+ZN6seYsYyyGUbaySTNexu6HRTxQrxGTL2h
	Z0DUMZeFbnyo62nByFulKrG/mwLTYe80gR5zH/0N8A0SdK+REXWPGj9tfbTwSgQh
	QZy6J1eQcZPoPjQjtGiJJjDGsCoVHC4Tn8gyCLfMPL6lDTW2rTTvyVqN9iyhURIa
	FI8wzHMHJWsBCBM4f5CQsxOBbuPYJLPqasSHz/c7tadJw2sg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd618ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 15:02:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so2613472a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789830124; x=1790434924; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/JPecf7NdB7Oi+h+e8DqtgFkYD6pxOWeXw7A/ixHGwY=;
        b=QFN0CnrvS4pCgntTG9O/RHTFo4fXBd4hNmpkkP8ndR1YsYL4YGKHmQrXDBBnckZYtw
         W5+zSrkIuSCXfXy6AhgzQ/+nIJvoooT/p3mG3wz5Cb964Pj3xV2eQZ0OCfOqJ3fwfWP8
         8eRHVAdPtkIwJyj39c2YqzUqKfwhjUj1Gh8MTsxzWdZsOCE7+bOutlBOpo6gi5de0Hxo
         SuUoKD4CSQDm9qxJK4GT5LjvXQASZhgGZ6WIPVGnx0dZRl4CHwXLyVK3u92KD80mefpN
         W9aBKkHW1/+oKorTuBrToC04L0jnvrdiLjIK9JX8GrSi43cFz+Qmiw0C/QXu6lVugDVr
         tpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789830124; x=1790434924;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/JPecf7NdB7Oi+h+e8DqtgFkYD6pxOWeXw7A/ixHGwY=;
        b=qN9mtvDitHo7zvk4vfaHVQVRRRw4XOqzxG4gbMkFXwdM2Sua1otRGKUz8EUm1S29cI
         mOz9PFLTaEx1AwteKV4z3RG4jAYxDW69LCXh2TbDpiHM7X+vM55F84P9gSaiTcA1+6y4
         XNniseo65HSIdo0XG7ThPl6Prm+vjgl+ZBUw9oT8ixgqAznl+WRZSWG7ozzWUtanWMWW
         Q9304OJigbUk9doeufF6KFYZIcJu+XjHlxz8H2MbqbFTF73mPqjM6X5sf6WB2OGZfZtz
         KCYqpxRd4UJ7PvViKsBjO3PM6jAu1oj/6ZiHCaUU+Z/UNeyPV+/NpkAEAQHRo7Hj4aZs
         F2cQ==
X-Forwarded-Encrypted: i=1; AKwUvByNB9POyKZG4BbZ5ZfIV1o2az9qg/iyNPWcMWJPjCyRv0VQsfDLeUUIPPbRqm7BlRnYlqC9PD0lydZou1IM+A0a@lists.infradead.org
X-Gm-Message-State: AFuF++nmHOYu6Uqs+WXsxfgwz8dohNnfOLk9ymjkC1Zc5lcH0/gO9CsH
	qesZ6UgTMSLa2zvn4CZmcZ/84yeT8ReJ6IXjkfanfP620hLamnLsPC2+xsI2BT+Lgm819A3mCJW
	B8TCv02oipCCJoHGd3gMQfTUCMtEO1xRX3Xst1kQJ3ES45nRGwkDHyKS+oGlnEOTHe7UMplbVpb
	a71bwnYli70BeyGIA=
X-Gm-Gg: AYBFou2Q0HxN7JogykU3LW5GimpK64ImUYmCYo72x24JC7OBgMDNQjJVHwKd26z3V5z
	/LwR0wahlzns/YnxILTeuU3xW+Hf9z8gQrH8cz+QthseG89v080zFSO0VjxutR+lt37zXhtTvX/
	a8S+2DcjnpsUDwmyxfirk11WD4UlRTWShXIL14kD/rzpPJVWVddMAJ7f5g60Ti8zOtbs49iEjtf
	8pY0gL01r7KPo6anN5B7UyiLxL3S1ero8zmMjNJDsmZtyp3pVEw80eFn9fYz4TQmeBh0OiEseV/
	asudEjii+866D7gyd/IBwI5BS7omlPOroOP5Em0evtjm2rYkS5VWuEjT117eaA1wIOflZdSZAvA
	acLf2i+ct/23x
X-Received: by 2002:a17:90a:a82:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-39e6c66d00bmr2140352a91.21.1789830123711;
        Sat, 19 Sep 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a17:90a:a82:b0:39e:6c66:cbdd with SMTP id 98e67ed59e1d1-39e6c66d00bmr2140317a91.21.1789830123079;
        Sat, 19 Sep 2026 08:02:03 -0700 (PDT)
Received: from [192.168.19.100] ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5045206a91.17.2026.09.19.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:02:02 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v4 0/2] drm/imx: replace simple display pipe with atomic
 helpers
Date: Sat, 19 Sep 2026 22:59:34 +0800
Message-Id: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2jFQqghXMSxoGXTUAnaAkBDub
 hWXL3n//RWEApNAqVYINLNw30UwBwXuXnc3Qm4ig070OSnSAq1B9gsK++FF+PSCs8GszZtMU5q
 fzAXidAjU8vLLXqudZbIPcuO39TcCvaf4N+4a2FoIXe89j6Wa82OGwWmotu0DuCn45KQAAAA=
X-Change-ID: 20260919-b4-imx-simple-kms-v4-3f7d32e17548
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789830097; l=3680;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=FwgAkT7vXYpMEUDhLztQnsJ8fy9xLWh5iCZsQn17vBk=;
 b=ez3NB94NNPCCw9UcFT/TzMXQw7u69SqVzKn52XcrA93gdpD8t7O/9tyNAg+8L/AzlGwMYCKov
 Vh64qoEZhKIAEzD6EmmOWhjd6MlCzLdXEaeEgPumzGP8e9PFho612je
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfX/VDEiHAY2gLz
 rujmfK2lTT2hgTQRsGw1uxkbcLLyTuvCKcl74KSnXSprvKbKXwyPukMt9g7r4BdhG4QEkMxmUaX
 rn+OPj7ZHyeYC0uw+LB28Qk8m5ojnYEJYVb+SHJzenBLnk0wqtWZANt03LqHZtR8eIl9MQhDuP2
 8FDk6NGNGSFjt8NEbks7HIiua1pG7Hb0yJDBMRyYa79KcjTXejYX2uouxNacipL2jvGCV8t9z7n
 /OzvDtRYPl0WgTaiJPKM3mt9/rP6NFQOWnwn5hPOgqy2PbLyCKSF8gPpPEqYRA681VGaHmbtri5
 BlP7+bdtXqf5fxJBiXt2uStUWYxK3LjZR8FULXkBW1RmEoEezatDDR6SfXddrmgFUYn91rhm3db
 fnON8Z0Spn8+JABXMwTmEuuhLFIkK4RQfXQEeE/de8vbL8a8Sp8muSCfomHFC99Pa4N+FQZ24cV
 jlG+gyPLk5UxM/9MI+g==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaea3ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8
 a=xr7AMzENiZYFrh3GPJEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=ST-jHhOKWsTCqRlWije3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: Wz6ZFEM-YV45AQvcAbth4wBMWUEy8qct
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfX8ZCFp6Jo5awd
 +DwIlKqU8QkB3lICIccRL6veYb88HKzLSfSezdQ6UukEuUrAo4MB26bfEEutPkCjZ3AOxrZGj46
 CUxd1pAiNvZ6DDHCjqbmUwVZm3Yx354=
X-Proofpoint-GUID: Wz6ZFEM-YV45AQvcAbth4wBMWUEy8qct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_080206_007088_56A62D59 
X-CRM114-Status: GOOD (  18.01  )
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

The series replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversion preserves helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in this driver.

Changes are build-tested only. No hardware testing has been performed.

The patches are based on v7.3-rc2.

AI usage disclosure:
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v4:
- Use drm_crtc_vblank_atomic_flush() instead of the driver's own flush
  callback.
- Replace the reset callbacks with the atomic_create_state helpers and use
  drm_mode_config_create_initial_state() in probe.
- Link to v3: https://lore.kernel.org/all/20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com/

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

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
To: Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Ze Huang (2):
      drm/imx/lcdc: avoid duplicate clk_per enable
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 249 +++++++++++++++++++++++++-----------
 1 file changed, 175 insertions(+), 74 deletions(-)
---
base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
change-id: 20260919-b4-imx-simple-kms-v4-3f7d32e17548

Best regards,
--  
Ze Huang <ze.huang@oss.qualcomm.com>


