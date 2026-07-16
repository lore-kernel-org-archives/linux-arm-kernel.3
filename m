Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD49C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=; b=1YORQnBIY6NLvO
	sk97Zwj7aZI+BFg53Am3b8I12XfAPvRGU4wHmJS5X16jcNpK97g+d5ihUP27gq8MJFK3ELSw8XWeD
	B15SZWKR17ZFb3ZJeE1705XHo83UXeXWt/x5STtOZQ/R4D7eIP6fqf4UZ460fd+PBFH2mHpmK7KO3
	4qr17eyF0x6ggEvkPmbNCk+wetEbBCs3KHY1KGcTSbTx7SOVMrPQPhS+m1rP1lf7upLdZbx/o0jp0
	cPkgOpth5LmNU0o6mUP9MelZqXSwxDnxpaZ+hrSJPrj2T+8hJ1G671FZIv2jljaID2wZfUPiOERmu
	IwjWr5PCqcm8Az0WqiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzZ-0000000GnmU-0QM0;
	Thu, 16 Jul 2026 09:02:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHzW-0000000Gnlz-2TyQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:02:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DUaQ1892191
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ublGuK2L8LkFww+I8N33BP
	NROB2FHlpEAQq3id5WGFg=; b=V+6oa4N+LgdZwM5OLLMLzcpu+E7cXBM2MjtCEL
	paYclXuXv45UgosyH+b9jNiKowTXide2Ruhznp2OXf7vih/6t8cP9bhAYTrzPSt/
	jwyj/Kl71gtpnD4kZrMhdE08ty+lQDmLltP4kJyeqX/U1d3yIHP+be9yi19Bjbyj
	SH5VGFy1EQnvdryRsoFC4scN7YkeMd7XyOzadCndh4iPReYTiK/1SpI9rejhWLFs
	J889JR4PrWpy90cTbVS6USh7agUADPwTnK6TH/bG9yig6w22YsSkxL9A7Z4ZAD3m
	qqv71vdY/Wi3BhnG0Ug0fBLjBQLCOvcd6SUZuiNjnMDruDiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnybhuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:02:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so56392195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192568; x=1784797368; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=;
        b=Ksm6bODZhLlXyCm93tR9H+yvEwjarSJ8ZRKBjURWVSO0zuh7broCgvMPGNi4EjYv02
         rj5jhR0r9Hy2ohe4W0po9iMryoZTD7cXEKcXAxSLRbC4S9SNbmKKVpeD5VX0GrukgRre
         dG4y+jFpgSVRBqbfyfLFdsKgaRuRJvUgqF2DP91jGsR3I3lUUJnCsYDhr//poihD3i5j
         yht/PvwAt4peZaaDM73Qr2nSzUSkrS7qatdqqTB/KNQiJAAODJL8QymrM6yglirA51t4
         J7RCI/B4PMYMq0JS9XMsvVDuZBPTt+g+Di4y7N+4xiKo9G3hu98vl7H15bHNsU0eVEMp
         u1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192568; x=1784797368;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=;
        b=kfE2BFsl4YUi2QFYgyr6CXKl4oPgzyIgb9NuLKSdltBvhCo0+h3DK1/wyBZZFBHoOv
         ebmkEGOnKL+cSYpBh1ffz8QOouzvnMl8LPRFTbLZZUU9N2Qan1Rt0DXHmYxBWHNrHg2s
         ywFhmIaae6+LUYQkw1mNYba0QqHGnn2j5eu9pC9bq9JBoyOIvG6twd9cqecPB8UyQjWV
         lElSovYo38jYAJNFfsuBsrLBegyqdSDmBdsR9dqyNAw3YBoJTqvARyMUox8V8rSkfSDP
         RkbNjSYBt4vtJWvNHq1mXjuIP9VuvgxkAW4d+Dv2Mh91kh4yog6dYd0XOCmEwvz+IOPs
         aigQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBOqkIbk4ZLN6E0XlycBA4LxIb8DuiR9I/1RqiQU1mvkj5kqqjfG0GFCV5RsTK93vUbZXrjl1lRkChdkbYBfD0@lists.infradead.org
X-Gm-Message-State: AOJu0YwrqOMhWRMoAZ6LXl9tv5u1i7Aaaed/wWekZcp+Mdx4/xSQB0pm
	C3H1aDbJUfEQH293ofLWjEGXd2i//GC/oWc4J8I9Y4VUaVKlYqKslEIJODO1wLafFNL1malmJi8
	SKiTNahIQrU5ZfLto8wYiGIBGein3bydaqXQlrElS7svGJSkWEBGGGNQe4eh2/7w0BoCoAlyRjE
	xa/Q==
X-Gm-Gg: AfdE7cmxjirwhnUj8tzIq3ZDzQXu6HQ6CIessuUuKukkKVq1LjC3vq9BdemHiKyjcvv
	NbqzsHPN20VbbzfG1xFCu63YXMxsOwnAYKPCVzKvbE5DlGErnCUPna9GJWWAmuBUF212eh+5065
	W1OZyMhuhoSJN0qzo+C99GStH3we3kOktX7yR9JVNNJSug2B9g1AqnhnQNJ5XRJ/OIjmjn038Ix
	X/dSJgYV5q7ARpLocFrb8D9h5WiHphYWH309ja7m88BixeC4WZtQ0In8YMFF1YaHuuYJBfjCLj0
	5YcIVmmmGhaIHG2DDdwOM4ByNXWY6gw9yxJoM0L24daWdr4dm7J1/aetrz2jJ235Uy9jb7YmqqH
	y7h9WTsoWg/y1kFfZvqUR
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr58054605ad.4.1784192568023;
        Thu, 16 Jul 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr58054215ad.4.1784192567515;
        Thu, 16 Jul 2026 02:02:47 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:02:47 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm: replace simple display pipe users with atomic
 helpers
Date: Thu, 16 Jul 2026 17:01:52 +0800
Message-Id: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKeWGoC/3WOwQ6CMBBEf4Xs2TVtUYye/A/jodRVq5RitxAM4
 d9t0auXSSaZmTcTMAVLDIdigkCDZevbZNSqAHPX7Y3QXpIHJVQldmKDl+CQresawqdjDOT8oBs
 UUotSmkpLtYdU7gJd7bgMn85fz339IBPz2i8R6NUnYvzGoNZMaLxzNh6KzGlpjJjJKCpUO8hDd
 8vRh/dyeJBL7/dt++/bIFFgvSFptNiWlSqPnnn96nWTYeskcJ7n+QMga11FDAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192559; l=4273;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=LslnXr/GYqt7lILfSX6H30ANs5TVBAPc61jkQsfXePo=;
 b=Qn3SgZ3Jcpq2dbsoxobIntKn1Fa949LtJINyO/lyXEjkZuMSQIFchq6+tnE8WqT7IXdz+1rFS
 ByTjQjwu366A0YatYIUCp3ydGB4Kf09fwhed1OK9kDkxik/D9RYfMki
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX4928+CtBIZaE
 TDfz9+Pf+p9Rc270igQqzw6Xpbfq8aR1jO3KQisSVvIVTGYpdRbr3DsGXQy/dZeUqPmXT/+bZtM
 6x/A8R6l40wz4FfsdU11OMbroWIwx0Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX02diovrlEKJj
 ILZnlcjfN2nKG9KTagQMOQ2WReM205RkClaL1313amILIizDlXf5CuKDs22Lx6srhqqLtuBeLU1
 liABRB6Jxl5ptcPJ2+inEQozEHtX6VtdXE+JC8WpZqu8ife2f0Sev6tqk8SYrB2z449D3QPnYrP
 GGKDygqDSGmcYhXeSS7xVvbLZpk4hf80tpw7GtuziMxWsnU+LydL5uxWfjJVTLhOe+7ewKxynDZ
 dPYqnKmWqVI37B/res2ZBpi0rJp3yOBWJVkOOub9L3SCSmCt2UztTtTUkj7U6gfz5Kz2uktms6s
 WUgLtgigrF6mIE0emeamHq46AehsyExo16Gmm7LaK/6k59vmEOz3Ii8GlQxsCyjmInGMONmf5G2
 TzQZvPvnPj+nANihQ9AnpDHL1WF1ivMbkhfh9xQ95ssmjXlFx7OKewhQkPIIA3h1LUMkPnbnYHs
 8+F0B7YyZzdDJuvhKSg==
X-Proofpoint-ORIG-GUID: CuLIOmtov1WBPzNICQvS3J3QT_T89NwH
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a589e39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fqn4YNmA52JUfYToRRoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CuLIOmtov1WBPzNICQvS3J3QT_T89NwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_020250_754032_B3542573 
X-CRM114-Status: GOOD (  14.32  )
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
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 187 ++++++++++++++++-------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c      | 251 ++++++++++++++++++++-----------
 drivers/gpu/drm/mcde/mcde_drm.h          |   8 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   8 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 202 ++++++++++++++++++-------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 179 ++++++++++++++++------
 drivers/gpu/drm/tiny/gm12u320.c          | 132 +++++++++++++---
 drivers/gpu/drm/tiny/repaper.c           | 132 ++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 217 +++++++++++++++++---------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 175 +++++++++++++++------
 17 files changed, 1107 insertions(+), 430 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>


