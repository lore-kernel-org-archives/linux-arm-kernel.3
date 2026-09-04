Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C57C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z5/Xia7rxdpyQybCgSGxs4a0QCDbKXZF9niLTTnJnSM=; b=wYiTOV7b8bHmmUwcxuyojT9gAX
	X1CIPy4wTAxlb079zhynMHQ3IxQcB66PyslMW45Az2u2r/CzEBUkBbgPsqVj5sMuQ172dIetKbVRy
	4qROefFIvVnXDoHB3NLLj5AaTBtZmKzzzEbpTXIya4Q/Zsq77+ZNwd8qQOkpqMMBrTGHA2npDUPLG
	EyaU4VvODd++xvyYnV6kHbhgO6Pjvh8NfnVvoa5YI/N80utMkwlP8+qFaSI06ZckqDPOvRBosPFFo
	95k17wwxBNXuffMnv16/0ag51mesK5Dck4lLMoFJP06TGaybTyw5LJ291knDftCs3p+fAw6pqx3GL
	ydNpAlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXV-00000003KYi-0eJH;
	Fri, 04 Sep 2026 21:33:37 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXS-00000003KY6-20OB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:33:35 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51bfe810293so14920091cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557612; x=1789162412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5/Xia7rxdpyQybCgSGxs4a0QCDbKXZF9niLTTnJnSM=;
        b=bQ/H7QVtpBkDUoxzGHIDPE27vwLgP4xuyc7P8gL98YwvqccACnJ/jJbAMic/d/CivE
         fN/NBDyUBKsI6EU9ASzUHRYtfrk85YpZ0m7GBtQ6p4DBqJeAMGRKVoldalvYFWvYHZt/
         3hW5KYsJLRI6Z7jXpjLnNoh7PFpvD0/fkc2++ceBh6oVbHXJ+Fm/kEEZY0QJ+iSzdmic
         /F4GRbY5TWl6EiDqdSBMbJCRMsOHIfl6E/ltGs/BoMUfXVRJipoow3CXyOytbI51tFfh
         b+hlNho50rgC2v4OHjg0wKrMqnXD0tn1A0RjEYWlXHn53a0YKEKBhwn1S0lgxB3GoUdP
         WgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557612; x=1789162412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5/Xia7rxdpyQybCgSGxs4a0QCDbKXZF9niLTTnJnSM=;
        b=EkfQGZywRIyHXp4nVLq4Pi+g6NqSW70ytYTf3H50f7UeuzhEyL9esmffSevK6zgw5K
         X0SgPHO4z6sCXfrm708QbTP2R0AMyPJ80Ct+Y5cn2lIJToiuwmDJa/zLD+1qUkIxB8qf
         9y+hsuQsxL3Tzcs4JBia3APfFWb6704iIc+JQepNRPF5bDNW0RmeFycT0BQKDBA7IfIw
         xR2RxuUVkxa0usgInfe+y7IwRTCUCpV/1DJMUyXnbF+LvZjG5yheOE30d8oTQHsLs3il
         UmsBW7KD9lnzxVnKY6MdjJWaTbMbW/QsyXnsnhiEVdlvaja9KVCawRrewNCbSSFDRDyf
         qoBg==
X-Forwarded-Encrypted: i=1; AKwUvBwoQE7RxvtFChV/pMcV6KGVVaR4PgfvNphIRSb3hfpAALo+wZLxvBa/M46KFmn6rE9deFE10NpXFsX7cnBN2Nob@lists.infradead.org
X-Gm-Message-State: AFuF++l0L6nvAID58Eo9htiVcdAVZdfXq+Dl2tOlMkLa9F61Gdty1eFM
	9fwVczvb+5eeXur/k2MYZS0NjzR/rzG1Bh7UHFsa7EpmWaLJL50U1CQ=
X-Gm-Gg: AYBFou1BnpcIxk9nUg9lM5wmv5x4kCfjy0zLxn3yPj65dyG4GGeEcFU5SjREsYkahCq
	+rrlskQi754jVHdyQBlQlE6BpnOwtAUrckMkWPHpOpNarhCzDaaFTP8sgf51yTTebX3BKzhGslE
	4DwPFLSRzMxb1gEOfRFD4lB9mjadrDQaRJm63/aeInoEHfKWuDUUpGEBVRB8J2glbOhKZQJ6BiF
	qtbDZXvoJlAuCckSUvof0jUTczhZH6BSmiQirDHFmxGvEtnfTyiLhs5FgUo/Y31f4NdIdc4HjYb
	hoDfn1ocxpxW5tkWmu9vXHx1VG7C5k9x862E8XIWH0QkK11apoBjI7LmuMOOWj+4L3tZdbz85s3
	Nb2mW0YKEnMfHvzt9+xWQEgCcNwlRfdRm4AqlC3FJRTYq55OkdNjmAcHQ4BONp3lcJNilmlZg8E
	8bZlhSXrZME64j2MEkze7ylREm73XygCiqsFj5tvK3homp9kOileiW4FWf62FaCmkK+B9FpQ9Xy
	Y5fcr8StBB9eR8=
X-Received: by 2002:a05:622a:1493:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-530549f8c81mr96143391cf.39.1788557612371;
        Fri, 04 Sep 2026 14:33:32 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:31 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: allwinner: h616: add HDMI device tree nodes
Date: Fri,  4 Sep 2026 17:33:27 -0400
Message-ID: <20260904213329.3910099-1-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_143334_531326_7A6CE29E 
X-CRM114-Status: GOOD (  18.56  )
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

Hi all,

These two patches add the device tree nodes needed for HDMI output on the
Allwinner H616 family.  Tested on an Orange Pi Zero 3 (H618, 4GB), which
drives a 1920x1080@60Hz desktop with these applied.

Mainline already has DE33 mixer support in the sun4i driver, but there are
no display nodes at all in sun50i-h616.dtsi, so nothing probes.  Ryan
Walklin's "arm64: dts: allwinner: h616: add LCD timing controller and
display engine support" series adds the display engine, bus, mixer and TCON
nodes, but states that HDMI output is not provided.  These patches are the
missing HDMI half.

Every register address, clock index and reset line was read out of the
vendor device tree shipped with the board and translated to the mainline
dt-bindings macros; the clock and reset numbering was verified identical
between the vendor and mainline CCU headers before substitution.

Two things I would appreciate guidance on:

1. Patch 1 currently also adds the display engine, bus, mixer and TCON
   nodes, because Ryan's series has not landed and the HDMI nodes need
   something to attach to.  If his series is merged first, I am happy to
   respin this as an HDMI-only delta on top of it.  That is probably the
   right shape; I did not want to post a series that applies to nothing in
   the meantime.

2. These nodes alone are not sufficient for a picture.  Two driver changes
   are also needed: an H616 variant in sun8i_hdmi_phy.c (only
   a83t/h3/r40/a64/h6 exist today), and setting the TCON pad select bit in
   sun4i_tcon.c.  Both exist in the Armbian sunxi-6.12 tree, authored by
   The-going.  I have deliberately not included them here, because I cannot
   provide a Signed-off-by on another developer's work.  If someone in a
   position to carry those forward would like to, I am happy to help test.
   Without them these nodes probe but produce no output.

checkpatch is clean apart from one 103-column warning on a remote-endpoint
line in patch 1; the identical construct at the same width already exists in
sun50i-h6.dtsi:183, so I left it matching the surrounding convention.

One implementation note worth recording, since it cost a boot cycle: the
DE33 mixer's three register regions must be named "layers", "top" and
"display".  The driver fetches the latter two by name, so a wrong name here
surfaces as "invalid resource (null)" and a -EINVAL bind failure several
layers away from the cause.

Result on the board, with the two driver patches also applied:

  sun4i-drm display-engine: bound 1100000.mixer (ops sun8i_mixer_ops)
  sun4i-drm display-engine: bound 6510000.tcon-top (ops sun8i_tcon_top_ops)
  sun4i-drm display-engine: bound 6515000.lcd-controller (ops sun4i_tcon_ops)
  sun8i-dw-hdmi 6000000.hdmi: Detected HDMI TX controller v2.12a with HDCP
  sun4i-drm display-engine: bound 6000000.hdmi (ops sun8i_dw_hdmi_ops)
  [drm] Initialized sun4i-drm 1.0.0 for display-engine on minor 0

with the connector reading "connected", EDID read correctly from the sink,
and 1920x1080 among the reported modes.

Full boot logs, the decompiled vendor device tree the nodes were derived
from, and a photo of the running desktop are at:

  https://github.com/BarzinL/h616-hdmi-mainline

Based on mainline a500db7819c5.

Barzin Lotfabadi (2):
  arm64: dts: allwinner: h616: add display engine and HDMI nodes
  arm64: dts: allwinner: orangepi-zero3: enable HDMI output

 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 191 +++++++++++++++++++++
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |  25 +++
 2 files changed, 216 insertions(+)

-- 
2.51.0


