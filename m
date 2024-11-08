Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD5DD5D695
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 01:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6SlCiON3cqc4vz5XEx0DbdrM/vWAePnU2JUI4leZ6jI=; b=jstYqVTDu2e+uklkk32ktP4PHL
	tTirY+aVB//onOjP6a5A2lJ5dpxp6z56Mvin1n3jVhEimu6uteImCoQZUg+Rfzq2/CMoUYWbRtTN/
	EzlVBKFI0Am9Gtrbpw3R6dCLeEwmvF+L6c2ma3aFhljHdCwBIyHjtiJtVi/o7aNAWuz/u3BTGd5zQ
	SfckPHvNC1ir4xIysvfVlnus2A/WaTlTnV1zE74KpZPo2+GOniiwCSXl5kkK/At4PbzLEkWoMIreL
	LVJkBCmfZzjSSNW6uimTQTwpJtGuSjqaObGlZXNR0wpuvfPLUUwwERWA6pNVi3Qo3mslcWr9pZALl
	S6jjeB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9E15-00000008xQJ-1aiC;
	Fri, 08 Nov 2024 01:42:27 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DzI-00000008x9X-0khK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 01:40:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1731030030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6SlCiON3cqc4vz5XEx0DbdrM/vWAePnU2JUI4leZ6jI=;
	b=WF2/syJtOv9gwYRzQQK1Tz+p1n4sJrrJLYf6JPhr4NQx2c6Iw6zAHtykD4VMfVDb87vyzB
	jXzcA56PrPqGfGZ87I59f3am4g3k10zRtmQqXN3hUgd4Q52hIIMFbGz1L12DtKfmwY78e7
	7ukelI1ZN691Mg04CRZI98dcskVRYjhvC9xfP/SWZjLDkIaKrA6eUJ71B5zunAgIH7P396
	fWnvUh3BTtz4c80J92JDReVBSxL996qjPLUEgpZ6LdvPIQ5MXGMLkfFRIb+izCLtXnaKNx
	s++5GHIB5NvWO/kVfJlTf8Mfr5DQj9qDRg42hBNZJ3CP2nSLfg92T8xntc2MvQ==
From: John Watts <contact@jookia.org>
Date: Fri, 08 Nov 2024 12:40:16 +1100
Subject: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
X-B4-Tracking: v=1; b=H4sIAP9rLWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3ZLk/Lz4tMwK3TQDUwvTxGTLpMRUAyWg8oKiVKAw2Kjo2NpaAJr
 NfK5aAAAA
X-Change-ID: 20241108-tcon_fix-f0585ac9bae0
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 John Watts <contact@jookia.org>
X-Developer-Signature: v=1; a=openssh-sha256; t=1731030018; l=1221;
 i=contact@jookia.org; h=from:subject:message-id;
 bh=/vB0A4Fo73KYupux7oAj+r9VcPiEW2iYRAxwvj/9zQg=;
 b=U1NIU0lHAAAAAQAAAEoAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAAAgPs7MDd2XR
 g2uRE9caV1lPPPeu0VzIG9fPrrVmYyAhLcAAAAEc3NoOgAAAAZwYXRhdHQAAAAAAAAABnNoYTUx
 MgAAAGcAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAABAsAsDWjawAwJm303ak1F4jDs
 LCMxEG6FoKq9hlQS6kcxUgFAAZdOULuhjgKrLrSACLm5/JiQDk2aK42XP22RlBQUAARju
X-Developer-Key: i=contact@jookia.org; a=openssh;
 fpr=SHA256:/gEvgms/9HpbgpcH+K7O4GYXmqkP7siJx9zHeEWRZTg
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_174036_391589_195297CD 
X-CRM114-Status: GOOD (  11.67  )
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

On the D1 and T113 the TCON TOP cannot handle setting both DEs to a
single output, even if the outputs are disabled. As a workaround assign
DE1 to TVE0 by default.

A full fix for this would include logic that makes sure both DEs never
share the same output.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index a1ca3916f42bcc63b9ac7643e788d962ef360ca8..543311ffb1509face3fbfd069ded10933f254b9d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -179,7 +179,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	 * At least on H6, some registers have some bits set by default
 	 * which may cause issues. Clear them here.
 	 */
-	writel(0, regs + TCON_TOP_PORT_SEL_REG);
+	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
 	/*

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241108-tcon_fix-f0585ac9bae0

Best regards,
-- 
John Watts <contact@jookia.org>


