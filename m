Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48313606B787
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QoPJfLMb;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DNRMNkyk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6LCAQEBPZJx8JZSEy214RQoDXw+6FRsYGwEN0a3YsIc=; b=QoPJfLMbH3BIen
	A3GUilCXv05dRQoVrZpf8O9EwsHMdVsDMFi6KV9yyEBeNWC+rYQKTyNkr3JiYpd/GN3BTtJhBjyU1
	VUF/WE6wvIgI2lv+sJ4e3qgmefMyd26lzdGG/BX+bYNjNJouVkbkjkSvoTyPO6jDvNSBGVWVt4zLi
	F1i0KDhH25XZOQG2/tXF+J7Iye8OmURmH758ge22cOHcIXZcMH+hVRFWIkj01Dtibs3sWU4LsxxRZ
	zLvFUd3tkLok8jqTfTB9IfYjVSzYUy37djzarfi9xKMxqjvJAXdJipQ8MEfbQcrFbSzT9zHsERzut
	XASthNj0WjDuOJnlt65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNEC-00000008wnz-2x11;
	Thu, 29 Oct 2026 10:19:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNE2-00000008wg3-3gMe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:19:16 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC243C22;
	Thu, 29 Oct 2026 11:16:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269019;
	bh=KBtlOAOFYJM1PRfZCgbJiAuSbTP1DfY5ZemL9rRN+5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DNRMNkykF6fjjsLioGOMEwAdBA3gHRimDByzK+7TB6t4Ndd7ORUkNrMSV0Jh6V4AP
	 KiYUj08X2fb0up55sxL49AKY/40loj9ZohhluLHDTadYnUysCDGTwzbzpxbmFz++FW
	 v88AM7W6XNvcYN8OOUDVje7+woUWoVg6p2jQlofs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:50 +0200
Subject: [PATCH v4 04/14] drm/tidss: Drop the tied off video port check
 from mode validation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-beagley-ai-display-v4-4-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KBtlOAOFYJM1PRfZCgbJiAuSbTP1DfY5ZemL9rRN+5M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2WJ3f5PtYgPGQjINcFNhfcLRDv9Y9wkNfDk
 raEBSXv3oiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdlgAKCRD6PaqMvJYe
 9XBkD/9HAxVjBiLH8Gn7K5nseLyKL+qMTPW5zFvL0i+XUNwXCm2GiHrrx0Qg1IVlGVZwVbN+Tx8
 E9t73PbHlp2DZP2XRgR0/q7cSjqBFuGFF//1SoaGENwUKnJbm0pt7YUvmnOYwnPRupxAa6lnxGd
 o7s/nXR28apu4HRhWHFy22KwJCAIcpz2QoWuOSvBobfl5RKpG+frRNhNEiH6oDxJHArLEGlatgI
 KhZdUFj1TZtphmTQorPXsdH3mXwimABLeg24pP/P8zjkdBlHHdY4pm6xovfIFs6jHqtGD909kfb
 gsBDsnp+sS64g2oy3E38/+7VvCeATJwYiZYG8cO+3k9VeOI+gT4MYEf75A8PoSCsYF8GvaedR34
 mBBJosZccbb1SIVZd8OESVmOuRBOyfUKVDaxLRTq1H9aBMYxUm8q5mfMd6yQpQND1dRcX1Fh54p
 gbBc4eAzFuxif8W8PxyV9pAz9BRA18itb3x+SOVLBThEhHF2cFyI3G2QlZ7n0Ey4vV04yrAR68r
 X5EWdku/7xj/qvZaYdbz9k7KXAy+p+7nn076I5K6b11h/IvG1S6cL65S7Y3oCLXVxO0u+LTuXWE
 CNLxru/rPwgpZ4RmuOZmU7EeZ0dNaGvkCE3Trz+HFrvWNLefi0ibHuFwN6LLkiFtWAPtJje32+f
 rK9ACKQ3yM6PFKg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_031915_073162_F41FCA58 
X-CRM114-Status: GOOD (  11.14  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dispc_vp_mode_valid() WARNs and rejects every mode on a video port that
is marked as DISPC_VP_TIED_OFF in the 'vp_bus_type' feat.

The check is redundant, as nothing in the DT will be connected to the
tied off VP, and thus the driver can never do a mode_valid call for it.

Remove the check, and rely on the DT to be correct.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index efdabf046d64..8c537280faf5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1342,12 +1342,6 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
-	enum dispc_vp_bus_type bus_type;
-
-	bus_type = dispc->feat->vp_bus_type[hw_videoport];
-
-	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
-		return MODE_BAD;
 
 	if (mode->hdisplay > 4096)
 		return MODE_BAD;

-- 
2.43.0


