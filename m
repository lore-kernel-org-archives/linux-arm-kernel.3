Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF02CC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/erqd8k66TTCAw8PMmbwYLxInnN4rdx5bNv3CpPzY8=; b=G7cIUAoLfhYQld0+/8e3jZYQJ0
	B95eCPHt04HdOCUK9C6KfC61vMhU+1zdSKqwOxNfNZkyC48qCUT6fTunJCn1gAUhfSC0Ms690rXsd
	Sp+bHQ4da3L15QuHalxKkdJhnv7HBOPo0hkD6KLJ7WAQindTqntAJJ5hTqw0PsPws+KzWn1rH4yKD
	Ua8UoAoogALuKbDdNj0gahKV+F6IxtMRKcqPsw3Br7RigxcI7mqXNbmtHa1MC5C/sgsbd6IE4kjJw
	gGAvvswo/ajhBp/3vSIybu8nJP6sjdrPXxRAniUHjaDsNIzPurqN+ZePs1Xk63hLRDbZwQ8yDqoZ2
	1ipyVxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGI-000000001rc-1o3P;
	Mon, 03 Aug 2026 16:11:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGG-000000001pB-0VaD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso10619515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773490; x=1786378290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/erqd8k66TTCAw8PMmbwYLxInnN4rdx5bNv3CpPzY8=;
        b=KA99/VM6KJCNikjCcbPt8oNSHCEkH2qSLN4RUZtwnBh6J7oD2aQC3dVIx8J8Xih/u1
         qerLe2iPjqdie6pKO8lyffN39ungREuGNVx/fDExyMxOYn59Mw6NcjHE8ssBeXGo4Hho
         sBEL1vOH5nJh54L+RM8qazIju9hxH0kp/Qv1fglB9tdtjLzGrjQtViacSD8Dzjiy1Knu
         7dR1hF5/55yYWCtKFDXzZWMAmx0QCqu/tNor4Vyz6hSZihSSKrEvQzBuX9lLBp+ynmBc
         e6dG/0tvbILx1EmuDBbGMz7PMqHjgp/F9GBAbcuLaIrg+xqzT6j22/rzmFD/BC3DoHxj
         BqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773490; x=1786378290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/erqd8k66TTCAw8PMmbwYLxInnN4rdx5bNv3CpPzY8=;
        b=CzLz2zICymwbJiLAYmMqisOcHds4ETl9BgGHlWDueGdIQl23yi4sxylDXTiPfE8Xci
         HM5bK6T20O+L8a6gLfHg+zrVl0iQw74G0tPq/JY27uW4DrT691VDZZ79LTBfpJpArtLc
         GDfrbfILuqNzGq5WTtVwSUoCkeEvYfk4g30GnRsgxRWk2zsWlD89e/gKfX4GrsjNYs6V
         pMBwdbVR+ydlJnz1IYNQAFAtYSTfBj85MnamDNb/DajQB9svVFQ/bSpHztjE1toBLREN
         TrSMxS/dZkQAGbEchVhNG5MnL10IqEj1fWmc6EIM69ne+hfqkA+iQHfPdIXkyLsGXN1s
         V1wA==
X-Forwarded-Encrypted: i=1; AHgh+Rot13BqBUgUdKg43Izlu8lZgtH+hsUx3E8f7q0QAHh0wjD48iJ6sMRe1jtwdn8O0vkRIPhAAJyHmYzzorGK+Zjs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6yRho40cYKThts8kEIcGeuom2JVoHqaskuhsZFutr9Iz+iFc5
	MQ5bZ30lcT3NLBVL4GsplRlOTdgdMKltlFFjuzYsIipLYm7E8jJ66TVu
X-Gm-Gg: AR+sD11N1+COpNObUH+cPr5hq12EFG9z+frDOzi7pXSDDC2URXvcu1VTx00mfyZE58x
	rYqBJunmyQm4GQvWCx6UD++yX+1U4X5aD3nkl0qXFmoopiKi9AGp0KcxEUIWk2mPOjDI3bwMuv2
	wFXr0ti9yYIqtR5ZMdY0RKm7wux7jsSJ5Cap9+xWEUOrE3w0OazfTMgnrZeHyGi2iInATbUgoeX
	bN7Mu0vWVkVShkiESKLq67crwysmQKuH0YSVjpxG/fmHNwHcYEFooFFzp/e7i2y0bKno9n7mvJV
	4NcKb45Dm3vr1MSMkLI0Y3Nxz8ugRRj/dPPHjodC9DKo4ZT/ojAW+atpPVvEjisPfRr72A9qdFh
	YvQTwAPTUvzJP20VBYJPb/uu65T0vUzAeriHGMwc/U+o3q8aiF1O1eG/3G9caN5AVeQGTnjjXXl
	Y0TdjyS6pV2k3443sxhxwEvovb3QxYZVq4j7cWgMUcU2I8caaYbp5hc98ITPil6GONI6+c2dc8F
	NptSmhUWYSan6hO8oFGRzlkuvYolpd06YtJnYFzi5CEFF4evU2RpIy/DGjhWu4lfGUkcxdWCsHG
	dTLaTShMDcvo2yYt1x4oflAEoRCQd9RFF0d0x4Qr5/iRKjHpVrM7/x3OjWN/zw19y0XtolH/KxX
	tUVmxTg8GrIDik0qgFgPEmppKfG35Eq16o4OesehCu5pEVfsCI7weG0mCk61aPeaCB/E6XV1/pL
	k0ug==
X-Received: by 2002:a05:600c:3f0d:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-4980c66b530mr267029485e9.5.1785773490118;
        Mon, 03 Aug 2026 09:11:30 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 07/13] drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
Date: Mon,  3 Aug 2026 18:10:45 +0200
Message-ID: <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091132_177323_6A1D6F3C 
X-CRM114-Status: GOOD (  13.09  )
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

sun4i_hdmi_enable() keeps using the same variable after it programmed
the video timing polarity register with it. The leftover TX_CLK, HSYNC
and VSYNC bits are then ORed into the packet control register, where
each nibble selects the packet type sent in one slot.

As a result, slot 0 selects packet type 3 instead of the AVI infoframe
whenever the mode has positive HSYNC polarity, and the TX_CLK bits set
nibbles which the driver never programs.

Assign the packet types instead of ORing them into the stale value.

Fixes: 9ca6bc246035 ("drm/sun4i: hdmi: Move mode_set into enable")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 74c7c3720ba8..a27d394d0570 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -161,7 +161,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder,
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
-	val |= SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
+	val = SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
 	val |= SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
 	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
 
-- 
2.43.0


