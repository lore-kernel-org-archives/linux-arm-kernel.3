Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD82CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJrNgA5TV91ITBEH7GvjPKMngymqgCXqueR7HZoiXy4=; b=cLoPaZHOTpf07J
	gCwNz3jDU/9SRW1x2VYfMw0MpqQu1Q+L+rydvLYp/vd7gInH3YHyT79vYZ5mccfOgD40G2zVnXH5G
	ZDS66oY4vgaUK5Wc3W9MYBU8bzOEkXMuz44F85+f1FyRW9hjWE9q5F3+SGIeLEuQrqpsiUF+pdE/o
	aGc3uXJJM/oOCvYu782qEn8MAdmkBV+V1FNtKFbEavC/ZG3ai8lmyEbZjQblV2Q1MfQ1MnajKCJ6L
	8G0JeZf1OC7rram+13kNRQI0AN7Ddy14/m15U9BD2KPXzBpAPPB6BRZK2dJMAoFsRisun1HHSwl+0
	g+U1U/oAONLfgbWG7qUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJnz-0000000H6yH-24vt;
	Fri, 07 Nov 2025 10:34:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJnx-0000000H6xJ-0GGC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=iJrNgA5TV91ITBEH7GvjPKMngymqgCXqueR7HZoiXy4=; b=jIajsTLlNWy9hU9+iMHFRrcrkE
	2EN+p4PthRtXlCrsdaNwql+rPvb0/GGscmeZlSBAy3fbItwAxzIwqz/ys6m/2bbUy0EHl2XlTZOTj
	82CeCdf7XfYxl8XmOqmVQQ7HD5EtLN/DkklyP6MlY0+b+vKnAmU61RS0MyjNIxEzPY5J7SH8tGGSg
	spBFZebpdzi1bPpdeftk4al3nFNQDWQCdaqdqCtcUc+Un0EAjO3UzohNR9Kdn4cs6mwtI+mGTnTWo
	hxlTSnQd5K7F0z3//kZTfAQY/bRcdXRhgs3YireUu1T8OA9K9wjnpYb+9n70spDRMDfcZu9+ILmaZ
	k6/e1n2w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwB-00000006C6k-1qt0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:21 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vHJno-0007dI-Uo; Fri, 07 Nov 2025 11:34:44 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Date: Fri, 07 Nov 2025 11:34:32 +0100
Message-Id: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjLDWkC/3WNwQ6DIBBEf8XsudsA0VB76n8YDwir7kEwYImN8
 d9Lvff4ZvJmDkgUmRI8qwMiZU4cfAF1q8DOxk+E7AqDEqqRUjS4kGODvOw48k4JjaVRa6sHIxU
 Ua410FUXq+sIzpy3Ez3WQ5S/9v5UlCmxbqh9DPTZ2sK+V/PTeYvC83x1Bf57nFzDIF6CzAAAA
X-Change-ID: 20251105-media-imx-fixes-acef77c7ba12
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 Michael Tretter <michael.tretter@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_093919_855234_30ED2AF8 
X-CRM114-Status: GOOD (  13.02  )
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

If the IMX media pipeline is configured to receive multiple video
inputs, the second input stream may be broken on start. This happens if
the IMX CSI hardware has to be reconfigured for the second stream, while
the first stream is already running.

The IMX CSI driver configures the IMX CSI in the link_validate callback.
The media pipeline is only validated on the first start. Thus, any later
start of the media pipeline skips the validation and directly starts
streaming. This may leave the hardware in an inconsistent state compared
to the driver configuration. Moving the hardware configuration to the
stream start to make sure that the hardware is configured correctly.

Patch 1 removes the caching of the upstream mbus_config in
csi_link_validate and explicitly request the mbus_config in csi_start,
to get rid of this implicit dependency.

Patch 2 actually moves the hardware register setting from
csi_link_validate to csi_start to fix the skipped hardware
reconfiguration.

Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
---
Changes in v2:
- Document changed locking in commit message
- Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de

---
Michael Tretter (2):
      media: staging: imx: request mbus_config in csi_start
      media: staging: imx: configure src_mux in csi_start

 drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 36 deletions(-)
---
base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
change-id: 20251105-media-imx-fixes-acef77c7ba12

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


