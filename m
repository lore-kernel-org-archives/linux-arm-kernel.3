Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC24C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=; b=azkQAI+IyqFG1y
	8MAnZN7HLGvnHjVwjjKMhHdpVb7CZPRTqayfCGkt7fbOrENDOyDZd6xOKMzF10u3VjzhWACx3L9vO
	SPUGiSiEgJ+uQ5wg7hNMbdmwrgZL9vP7W9qqjki0P3mn0FRhXrpjrFxAzNHy8aHthI4md1S3R++Fp
	c9FUMwzAJubQ+GJ6MjxgdEjHzF8f4FZ3RU0dh6EYmlp8n7kvSfBHmMSvVQ3TVhU51J+p9/irD+jQM
	zhnJDQvBPpbtlXnDySBzyItENkSXs/8X4Cbr9Mr95pJdL9UCJv3jdGXPLFjA3yIOyB63lzYbvhxYh
	CtXctJx21Y+WRdAU5RUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5AN-00000008ewe-2Lh0;
	Sat, 04 Jul 2026 18:32:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5AL-00000008ewH-12A0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 18:32:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8S7e3415008
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Jul 2026 18:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MltfzpfpaLuZDnkNZx+Lb6
	VWJ4GPL8eKrD3GSx0ATGM=; b=CSEUNTWN1DlO1mccs9tBOSMPvsm87QKPUuehKQ
	4K6kTjt1FKnv2ec0M8Ysv/X+5cdqXiRHqij/ORCYEDmUr+Lvfqi2Bb10tvUqlWYK
	6bUxEtHDeSVXR1YlKacaMujOYA044wSdNr9b9B9nlb84ycDuDYWoCL+A2qahMRDh
	QaXY3ntdMFBxDIr+RrCRCbj6/BLG0BZQLRU8QJzw6wEZsRPcqLF+9/q4Kr6AjCvh
	6HdIKJwHHUAO8X324yL3sIeCAbzFf/FbdmaEFj/XSnPAux4wnR7Iw7HkLjguUK31
	c2tOSjRDtb3pqINNlxcgrFkpU1+GI/Hxp75MpAT7pOVePlMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uhbnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 18:32:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847a2509456so2655968b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189954; x=1783794754; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=;
        b=PDqKWVB5CG9dYbnZAu2ccVtpt/RsjUg1tCs03G9SPlyqYml/Ep+4G8qzKes/Di48cR
         jVmlth9cf0hs5+LClc+/emh92tP3o/bfT7Kh1TBN/noM4PKMwYY+5znbcBcb3nrQEk+4
         QlXCKBM8ysJ0SxA4XE0rKajp6kb78DaygUapjD6pwVUcw0+3hDUm1hLiB1Y11aKM/AbO
         9bRxl4uEl0K4cluYDFLD1r18gria1pQhuTA61o/AXR7Cza3fqX/+KKvsbAYI2R/+RXsf
         ZEY8wzPcoc0D5OoiZpcxnZOdmekjlcZdU09E5ofoSHxnKDHrugg19A5nQTKsQO+Phs+n
         KQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189954; x=1783794754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MltfzpfpaLuZDnkNZx+Lb6VWJ4GPL8eKrD3GSx0ATGM=;
        b=GlGexdzmlaEd5No/6iKdJjoWbTZOBZ02xlSeyainlMcystbqHUiQ383/LTA2Hr7C+k
         eP6NaHEoUvnjKHG+EBIXBbV+lFv0EFsMXKgcbDWzRZXJ4zQ7/YxDPpoOszJAhleecscf
         yoBwwIKHBI1++dFhN52EBrnDmAkQGpb9M6EF44r+BS67VuEtYVdbcia5o1sJVM2fpF9s
         njHlNV8Fz4/NCvkyENHva0TDAGp6JMt4CKNh6dGMCM06sSn3Big0FjJ0yFuevMLuLvwx
         rcYt0uGsDE9EcVFK9zyEkYCT6xmyuo9x5kgCBhB1/Qd9qLgMmgrebZ7Num9aH7xxX6em
         j/bg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZtTuP3nLlj7+tpBIGRRbAXTJT3SqwGuQkWbkQQHw/cIylfwYeGmcCKy33soIasEqpuVXly3omPKWJ0uWXMX/z@lists.infradead.org
X-Gm-Message-State: AOJu0Ywza9lK/XDV05CbTWOGGyddwIGSCLbcMBSkWlXx3WC4ksUmFHsz
	WvJ4kAT4cmtOchuPkUcSOaebJ/4eEfwBP4lXByIGdk0bhqowxhk2XjM6jMF0L0uYNmm+YGxet21
	7Dr/kNL0pndLgIF9I0B4YGDI2pkQ8FMIG/rrrIdVZ3E0pf2AE8jlAXWSB3lLOSu41lK1FrHhLl/
	jtNQ==
X-Gm-Gg: AfdE7clinxiELNoZl4PtXzx+MpltTpXclZUaKRrfN0Cc3RdfjCRzg0r7etInTDabezy
	JBe+mNUO8rZXnMtgXVQkPGlZ8VowGkgRGE+SjkZq8tgRyZ8Uhv0hiOFaaXrz2UwZ9Fx9n4TbwUX
	sVPzCexBzSS6zJOTTNuPBlz65hdseoJmvrQAAZgtcpcmXmWb2UtVUYtc4bdRC9vWPMJkz/UcYBR
	zo0AmoQDyg4C4dB8L67caeP/1nOl2X8UvmqFwG49CL3XtZli4utakFjY78v00nujmzE00lR3twt
	QFH3m49zoAiG5AdIRwVYUNZnxLwjH0x30HoBeZWA3cGWAeov1FpKEyhV9iLCLEbb/15sPfVqwl7
	iZbXlaslcItQutvEGPxYOHwM=
X-Received: by 2002:a05:6a00:1881:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847f6dd3dd7mr3575648b3a.23.1783189953626;
        Sat, 04 Jul 2026 11:32:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:1881:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-847f6dd3dd7mr3575622b3a.23.1783189953074;
        Sat, 04 Jul 2026 11:32:33 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:32:31 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
Date: Sun, 05 Jul 2026 02:31:09 +0800
Message-Id: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SRtNRC5imFRyqijFLBTCAnh7
 rbi8iX/v7eBUGASqIsNAi0sPA4J9KkA97TDg5C7xGCUKVWlLtgFj8J+6gnfXjCQHxfbo9JWnbU
 rrTZXSOcp0J3Xn/jWHCxz+yIXs+2/CPSZUzEeM2itELrRe451kTsDrRFzGVWJpoJm37+GdJ5Cs
 QAAAA==
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=3497;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=a3oJlDmIy4JLxHP8+Zy827sxSxkG1qtSrEiIUv8u7fM=;
 b=oTFO2p3qM2CB2fGh5FbCqHWfsLjAUpA01rJUrP5DdH2raMv7Em7rY0rPoVQz7ExoGxuGHOYTD
 NpzXPoGsHqtBE5XHc7JyEmeSHN8I2421kM7XwjgHHvZaekp39t8rsAh
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-ORIG-GUID: 8VESbiOMzYeeglGzcAA9JrB9Mxf3Y9H2
X-Proofpoint-GUID: 8VESbiOMzYeeglGzcAA9JrB9Mxf3Y9H2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXxvGiaQAngCW+
 uy2k5j5d2qStkbDVzq6MpxG/NbLm+sVh033I4Ds6X/sC87tvahcOmsMykD5EqMRKZC7XMCA7OKR
 OydHXsI1xnpk4Mg4cBMrI5/SR6eUp20=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4951c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mcgfQexBA9BlAWrkqKUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX9IdcQ06eWIeR
 jmTRM6heT9ZWxsWMUkQ1PcQ8enQo9ejseHxD276Ak4cYFQzpGDMgbpHNhlNukLt2zNjdQB/IG3z
 pfoewzdGfOoNP5H94nSiH92TqFYWnEpLzIjsS6KRj4L1ha878Mdzhq2N8QVzUxbX/zMOG0DiA2v
 Ol9u43H3RkC73oe/0Z856IOGH4GP0vQVom1qay9uwzrix2DATXmSms5hcDF7xfkWVHsEKkSc1Gt
 ZjCBlgu0xgkVOYJicZUx3k1EO4OJt+9giGHF8aVnMJEF7oiWFTxGhp9C63xtGBR0C61G9S/fNxt
 Mc5eBlainDqSS4dReIHqlrPcq9dPzSXvdIyq5cSrh6OJG/733ns0ORghx/I+elqhIE9PQr00tnF
 OSZzJzRh7imUjqQSFoUG2yh/tlAsWxvGvqOMJQ/EdiSTvn3WVfYXxguqq+rSrBeksfPLweNyARu
 64v08ienmhfPMKwjHqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_113237_418302_9F5E0790 
X-CRM114-Status: GOOD (  11.22  )
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
  - imx lcdc
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

These changes are build-tested only. No hardware testing has been
performed on the affected devices.

This series is based on drm-next-2026-06-27.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Ze Huang (9):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |   5 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 156 ++++++++++++++++------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c      | 178 ++++++++++++++++++-------
 drivers/gpu/drm/mcde/mcde_display.c      | 162 ++++++++++++++++------
 drivers/gpu/drm/mcde/mcde_drm.h          |   6 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 174 ++++++++++++++++++------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 165 ++++++++++++++++++-----
 drivers/gpu/drm/tiny/gm12u320.c          | 128 ++++++++++++++----
 drivers/gpu/drm/tiny/repaper.c           | 130 ++++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 221 +++++++++++++++++++++----------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  17 ++-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 177 +++++++++++++++++++------
 18 files changed, 1164 insertions(+), 381 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
--  
Ze Huang <ze.huang@oss.qualcomm.com>


