Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D206C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 19:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=; b=ONuSyvgkTOfk4X
	SBcCNCRBNd/cH9zXPD5+M1iWjQwj5RwKp+qkIvbllOsgyYPdgTK7VYpvWH4+1d/0m+T9pL5mjHoSX
	BqNgW6dtxv6nw6SYyyEqBZH8227Yw2cjt4VlmNJjdnBaCswt6FM63vL4psqNC4sEc8vInXNB/dCQV
	9SYvUZqY7XNKapyXGBFhlMAoKz+yDlI/CYCQgaGexfU6nkTZU6UfD2eNsn+vDkeLTx3Rw+SX3DhdR
	JiybTqi3Y1cF0Zy0TEwkC8ubxSTQ7zsa6L/QcPE6lyk0e7zo85/fucIBZJZIihEhPancs7E/5Cj1j
	97jaMN7yBVzuWIkfIl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4n9-00000001XNt-3W3r;
	Sun, 26 Jul 2026 19:45:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo4n6-00000001XNL-0kHT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 19:45:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH721G1191423
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0ajHIxefN4bg3/NHnVq4I6
	V3IZtJtWB7vSvRVCv6OFg=; b=gqepHiM+WpEKBlSCQThncb9R3/gVRYZO040V+o
	sE3PF0NuXELd2wESCl8B3OfxzuLlatHm14QkBSXAjzyjKMiOXNkpAMJrm+bT0ZJK
	f19mpJyfWxA27aIdH6Q3eI0R6rP6O/3Ij8qKzxPEE3CzJEaqxhG9CkllwsgGqHGI
	HMVq3Va4viF79Ype5Dc9cWRgl/4Q1TaCZRlK0yPy68tHcuvIZF0cTmZLKd4iooFE
	DeT1j8UAGNjfrTlK7ajewKz7zqXnlHow3cRH7X+IOD1r4SdOWXCBdflbFRF+j+4W
	6UkzeFwJeyein3cGOkQYR6BehZkelUfQSo0hVIKYY7DkmxuA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn3yn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:45:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so2368025a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095138; x=1785699938; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=;
        b=TJscfLeSBXReVqufj0nWsXckf7jOEvPERlKPWOSQAFbCJwk7eka/aJosJdy83USvcx
         YVuMBpnwAVBdGO+JZwqlFEo9V4o4QtcD5R7gNUliMLFwYxmCF68iXzup9qjHVDJayC/G
         Xqs5TTEUrmDcUhpjtoGzHJn3xmkmXN6w3cLviyLX48dngd9SjQaGpB4hdKhJuNCDEpRq
         Ad3Zac9EWQNPvGV+xYF/7LKWJtPJXCX2mpqyxNmBAnyYUnlLSzmG69MWhf/oc7tJ8NNu
         sTZHgooWT/xHmPoJMJorMaT6jcCP+JcivKr8TYKMyRWe43y+ASPbVVBc3hUmt1aQS1z5
         /XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095138; x=1785699938;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ajHIxefN4bg3/NHnVq4I6V3IZtJtWB7vSvRVCv6OFg=;
        b=eUpZsGnOk1FN04sz5pb6Z6RQOyOefT/GD0Y1hOIYVg8Ycgu4DmKM4YHJlg3qX0BGuN
         zJ1GnoFkVICsJHHuYzPOG2gxYsdGJAp5lCDI8Go9dB2Qg0ajlBi5BlthLpNUJBw/TEeb
         Cu4eao+Ike87LqF+TWTvByKF5gLAWXfOaMzUjG5vdhfptOzaYAH3ewa1EkWuOl3BORnr
         JrOMFn/RfXJvnzC80rG84DbuAjQBaEkFxwFzaQqYLUbRK4Rjkr9rWr4sAEHuIMLLb0Mk
         /vSEqJesFhehR9XWYqBgYpKcJXTYn3wPr5bGMtVFdrmD/5dMvJD0j8JatqfWmaE0sN+W
         QlUg==
X-Forwarded-Encrypted: i=1; AHgh+RrqCHQbtjkbWmty2tNHxkvtqQWZ+NIy7IIftoIcnokG3Op0iAGRWw/6RyA09Yt/w9ZLv5yTI4CXUQfbfnMh74R+@lists.infradead.org
X-Gm-Message-State: AOJu0YzQurxDlipYIVuNPzL9kPtJlMGuXTo7PKIQ6Tv9UZMmzIi4bmTz
	46K6P8OfMmnUukBL7b+c7pDKyUhCnerqwCE7W+Hj1MdxjBJw/d8K0UMwIqo7Glva9Mf6lyZBNi9
	CBvzCiY6RZ05xmBVBpO4R4j0HiacIA58IY8Ydqn5vaLfpcU6uJ5eqCeeA+mkysygqPbQQQ28nrm
	Y6tA==
X-Gm-Gg: AR+sD13CyXK9BEGvnYsmDvVn2gJeY8G3DIrwML1KyoeXRBMHVhvhPt/gmFbP9gFji4G
	VXEuUEKVQeLuXDWZby3Aq/yF1PluAcEAzkgmf+N93ZI53F5sNCX9E6Fifmf9A4SeEUtC1XExgc2
	PACoC5Ixj66uJEQkINcGMGzw2hl618Y2V6meROwposhJPmkEbd/zURHdKYJgop3reTKrOUzeNNm
	RjExXDu4rpy8BOBpx4e+QwkXXdzDqrHyhmfsRugBD2JiIdXDo41Srb1ck4uriKQo2preW/Z2Osn
	NoNsLeWfL+EcJ4lJkXLJDkgFZ7v4VhIZGaxpCVr9NjfaSqRCOc+qLS6XndPSrelZw1qJRqcuouM
	yZAosY+JpaXRR4RIDrwNY
X-Received: by 2002:a17:90b:2dc5:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38f2950e5b0mr5850202a91.15.1785095137777;
        Sun, 26 Jul 2026 12:45:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc5:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38f2950e5b0mr5850172a91.15.1785095137330;
        Sun, 26 Jul 2026 12:45:37 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:45:36 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm: replace simple display pipe users with atomic
 helpers
Date: Mon, 27 Jul 2026 03:45:13 +0800
Message-Id: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtjZmoC/3WOy27CMBBFfyXymkF+EAdY9T+qLhwzFEMcg8exq
 FD+vXZg0UXZjHSluefcByOMDontmweLmB25MJagVg2zJzN+I7hDyUxyqXnHN3CIHsj564Bw8QQ
 RfchmAC4MV8JqI+SOlfI14tHdF/Dn1zPT1J/Rpkp7fUS8TcWYnm+sN4Rgg/cu7ZvqGfGeoJqBa
 5Adq6CToxTizzI4i6X32ta+25YFcOg3KKzhrdJSfQSi9W0yQ5Wty1nIWf6hCf2WJgtNCKXM9mh
 Vt23/oc3z/AthEOIdWgEAAA==
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
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=5032;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=M/SBdA7VDjpMs5FPTVXoEwvZ9jXN7FwKp4wRYNhbi8s=;
 b=vdmSVBLYyiSgCzw5y+D627tBad3p1KzqzB30cNZzauX8H/pqI7pNd3FVlHJnpB9kKpf18kN88
 Jj8375htkKRDUvCLX1+Z4CLbQnTHMi4DVNy4Jk0ylOpVkfagdrVuj1K
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-GUID: 9ivV3HCwuEhLbwJgzx6_avGmbGU3cefY
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a6663e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=0c0Jg-khWEd_mnVUI7kA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX3bEGo6uwRov5
 jbuWFkf8q3plyNubKPCLvriQu4K7DRTn3IpyPkoQl4SZzXqoc0iTrnu/EpC60/R5Vl8nBAJUuMk
 lSX234AvmZNcjbl/B+Hm7zTaTahkBy4gB7Ld82df+nNbOtdJnHFSsnOcGmBRh5/Cqsl/iGZjQrv
 lPYuOUU2pSkzVqJfl2W3DkMW0NEDYIqi6CnUUMhaGLeWiyM669yQvS4tpIUXa6yT+/cBqj7nOCy
 vPWuWtsU6tLhQR1X8g2nNEfgs19j69ud4VjyW/DvlsEvg01ddTswcvVQWdmj5W6iTtp/EkTD0C+
 rP0K1X/3QrhDvXu+eX0TFbTMphdQGeONw0/yJ82gxkVhe2zLPH1OvnNCapbCHFTTST7lGm5S4Fp
 Yq1uB8QtPCVUmto9CdTPNB8P+VcJCBvcStqhYCk3seUPoHwimVR12Z4yJY1joGGljkrMEF4R86+
 kWPWHJ0SRHjka1Ra6aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX0+v1xAwJkHIz
 /yLbqrTctWBrSHj4Yp2/dMslNJIR3h3oHjVbzmgd0GbciV4bWPGbbrY9tYOaB0BYxotUsssUte8
 fmLclTvJbDpw3zWZ5E23hoYCtDAMBa4=
X-Proofpoint-ORIG-GUID: 9ivV3HCwuEhLbwJgzx6_avGmbGU3cefY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_124540_343027_67797F34 
X-CRM114-Status: GOOD (  15.99  )
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

This series converts the following drivers:

  - arcpgu
  - aspeed
  - mcde
  - pl111
  - gm12u320
  - repaper
  - tve200
  - xen frontend

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

Except for gm12u320, no hardware testing was performed.

This series is based on drm-next-2026-06-27.

AI usage disclosure:
- I wrote the first two commits myself. The remaining patches were completed
  with assistance from AI tools.
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v3:
- Use atomic state from the commit path consistently in converted helpers:
  fetch new CRTC/plane state from the commit in enable/update/flush paths, and
  use drm_atomic_get_crtc_state() with PTR_ERR() handling in plane atomic_check
  hooks before drm_atomic_helper_check_plane_state().
- Move MCDE one-shot flow start from plane atomic_update() to CRTC
  atomic_flush(), after pending vblank event handling.
- Fix repaper damage update path to skip updates unless CRTC is active.
- Fix arcpgu missing remote encoder node handling and lock CRTC state access in
  debugfs.
- Make container helpers static inline.
- Link to v2: https://lore.kernel.org/r/20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com

Changes in v2:
- common changes:
- create upcast helpers
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths for mcde,
  pl111 and tve200
- arcpgu:
    - remove reduntant mod_supported helper
    - change obsolete mode field to crtc->state->mode
- mcde:
    - drop attach of unused encoder
- tve200:
    - reorder connector/bridge attach
- xen:
    - change possible_crtcs mask to 0
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

---
Ze Huang (8):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 203 ++++++++++++++++++-------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c      | 248 ++++++++++++++++++++-----------
 drivers/gpu/drm/mcde/mcde_drm.h          |  12 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 199 ++++++++++++++++++-------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 201 +++++++++++++++++++------
 drivers/gpu/drm/tiny/gm12u320.c          | 138 +++++++++++++----
 drivers/gpu/drm/tiny/repaper.c           | 138 +++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 219 ++++++++++++++++++---------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 188 ++++++++++++++++-------
 17 files changed, 1155 insertions(+), 440 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


