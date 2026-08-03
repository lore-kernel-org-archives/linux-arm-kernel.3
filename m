Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8410C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwcCW5bnIxEMSTfDGEDmQeCwaEieT0mPnUwcX4qTD6M=; b=L8CS+4FZyLZUHCZx7qOxvKRCXj
	efOeMKrW447Vvo6I+NB/aL1W5kUwqfR/fUM55jVVQPIq1bkZuS5oOcY7qsfNoN0vAl/GVv+KJsuu8
	WL/o936RQr088nOe95N83HBwMWiYVyibHur+WlaP8mDmNpy7Rj415hK615uPf9nxtFqiDD/1ttM0g
	Jsc31MFlC3HzQiBv7M7o9kNavsdA40QYEAOnM0Bsngh2ZivAKwT+XpBAhNKl0UtXak+me6u0zZxkk
	XxGaMNBqZ6F/ujgCgox6/MoOV25K2rPRsqH5H3P3UcrEcyuku6kfayQn0OP+jNJg9c3j0hBzJMhF3
	//hqfanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGT-0000000025L-26A6;
	Mon, 03 Aug 2026 16:11:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGR-000000001zK-0SgT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f6de72faso485045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773501; x=1786378301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwcCW5bnIxEMSTfDGEDmQeCwaEieT0mPnUwcX4qTD6M=;
        b=ccixxklrFTdzpIdDj/7vwWuZqZ8t3WskEe1r74BPH7tJbGAg9XGWSnmC/tjfxSVTQ7
         niZeiR9GD40MzVgY9jrwghCyJDWEUTekAfd4ZjqMNdHmn+TEzympc4GJBDEUDYlTl8Ss
         PCDnM4WBMuDKQj9rpquifIOiKxjtx3zXrVaB/rJltifJ6cf4CocwMjBBULOwMFO7l9oX
         nU5mtbiaWBp+HJFa5W384Q1OGOFv+G7HRnJWto1lFtUfZTgVl5OrC1r0GTMB9pJmVUR6
         Ypk44TLekXsfp6nuxsAtlnrtvOID9CogHKpaI2g4aKTI14YnFo8eChqWQQJ+kFxKjSCt
         KQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773501; x=1786378301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QwcCW5bnIxEMSTfDGEDmQeCwaEieT0mPnUwcX4qTD6M=;
        b=Aqy0yUMMSJx0T7se9leLyo6nHrP8fhACJAlD7lVVLIUF9jBu84bJsTa6b0Qop6NquB
         pmhx6I31YOJ/WMXznMzKHnUwPoLnx7/BSPM3Aqm4VMF/oJVYLPZUt+IsEBXtxgumepuj
         agQ9dx1dekdLwUsh8GOxMcnUx2g2NezK7nM7wdu+z7OcGazrDRue7HHHlbRZUamvFYX6
         p8ysggucACyCvinCuNnB1ZHLuHA8vRg6yutGIOECv8LQ3+lpX4jcW98NtJwH2EgT75nt
         z1Um37Dedm+rjceu27ZiUVaV3LKqn1Wh6hOsicdAoCYh8E4FHntvTDIFrp1GZoq6EayG
         aWLw==
X-Forwarded-Encrypted: i=1; AHgh+RpIdw19wVaxgy5Dbk3w6XiQKoD/NDX4EMmqM+b1cYbNBwfBVTVuuuHYVoWzY1SwKB0KsKP3q6iL7xb9mYllFYCf@lists.infradead.org
X-Gm-Message-State: AOJu0YzD1QKarMxKg8SiUdYi7tvQHKd0GfJmURXMyshwmVerG0+zE32J
	5lcWte259F1QA8M0Mv/Wz9gSp8/VwGXuBtPpefeJ0P/R8qQmnlzo0PNe
X-Gm-Gg: AR+sD126MPPL5/P6tcYak6fvDp5S4Ph85rhjg3QU+3viMZZtHJC1ZF+jvPfs0hlSKPO
	bj6qdp2fW9VgIGTMmk9hnlm4UGr5G0UXzt98dnWiX/MFzsa0B4nxAccGMXrjsSfLHrbcY7VXn4l
	KC0odIJ4hTx/Nody6q4HUkGkYtGbegRaRPkq/qfu8G1A2Dm12d9/lhGkG1e5TEJhsdpQg9ZdvAa
	aZFBXf13Gbs2i959PA7eXkFLqQY7FHhZw38wjKABWA79ti7p9Ta3xBcCRie4qohOzzRpdgiPObU
	FmHy638GEgYM723TKIhqvjgZ4skVwGt/r85GdxJmSRVmyRhDizv8p6iaNI7nhe8JLDaF0pAZ0BF
	xKxI9xvAuUs3xlQoGD1HI+K9f4AysQVxa7LjvGJUxLaNDEdJiN/0H/5E1bX4baN19B/jFG/5mk0
	QP8/YmnjIc3h4w7ErvTMYa5m+aY3WsONrWIPH2xXFtNmDPz3D2Eqo/LJ94IoNQrcQLrdgJSm51V
	H3G6m4w36NhpkDE+H1tltyeBmQkaUVJxY3QJ4nfwl6hj1We8IH8Ll2E8WF9owf6nH7BC2wZbDk5
	UuwA2QR6pAglIHLrGtyf+/iw0X3LOvplTcY0i4DaH3GpoXbqbqJWHmGh4FfBJlXZv4yCm1ZdQbd
	P9g3YZP+OUKq/OKHZwSLy34NBrkT2Gjjn4NzzVPPNcgYHMdKtnzpte5AG94wvPVSXhYjqpZRNep
	mr7w==
X-Received: by 2002:a05:600c:8010:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-4994a0f6838mr3426715e9.4.1785773501354;
        Mon, 03 Aug 2026 09:11:41 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:41 -0700 (PDT)
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
Subject: [PATCH 12/13] drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
Date: Mon,  3 Aug 2026 18:10:50 +0200
Message-ID: <aec9060209473b8176eb43bc7c63c20b21306adf.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091143_177789_3D1F9B9D 
X-CRM114-Status: GOOD (  13.93  )
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

The 8-bit entry of the last MPLL row (594 MHz) doesn't lock reliably on
H6. 4K@60 RGB/YUV444, which is the mode that reaches this entry, doesn't
come up.

Align the value with the vendor driver. Other entries are left alone,
they are used by lower pixel clocks which work fine.

Tested with 4K@60 on a LG TV.

Fixes: 0fb4b858b102 ("drm/sun4i: Add support for H6 HDMI PHY")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 4fa69c463dc4..489ea94693ff 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -91,7 +91,7 @@ static const struct dw_hdmi_mpll_config sun50i_h6_mpll_cfg[] = {
 		},
 	},  {
 		594000000, {
-			{ 0x1a40, 0x0003 },
+			{ 0x1a7c, 0x0003 },
 			{ 0x3b4c, 0x0003 },
 			{ 0x5a64, 0x0003 },
 		},
-- 
2.43.0


