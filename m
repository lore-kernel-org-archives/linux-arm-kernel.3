Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3CFCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=; b=L2oVvwXTU7FAy8aD22eHqo8eED
	pDJOU9L1pyPumPymuP/3sPFcBBu+F3hp1L8sAIK+veKzF2ooYcC+0R6L5vyfMeq/6zK9QyonhNoz5
	Kd+DdKJiWjmQZ9fMZavEw7GdYxi7kJqBNFNnO1C9/7fIruKDR716JsDcy5elE4EkTvoinLcA3lOYI
	4fBFeSu2T51Q63GrpISFqf6yvyOJSp/Ba9vDRfTe1POWjyFgEuQZnY/8y23OKEk2qUMSgw9Vc/RFh
	Mw2eRDCp3VckhA+cGOZsOr17fdERPG5/1P96RHXH+Anti2MMvffyzSg8PYryjbBHHrEoJhuy45UWi
	A9B5nC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTk-0000000BNvM-1cCP;
	Fri, 22 May 2026 16:12:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTU-0000000BNjE-2Noa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so102804845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466306; x=1780071106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=dkT113UTOMvJR3e8jwHI0LakSUAB2SmiCzIKyZwWVTCAWIEBvRsBhaGhE7SqTUiCiY
         IBkMHQse6cSrDBG+FQPpFCGSygvXpOFS5/3rJR1PGvA0/HQ1CFsjYhf3VkTrbAuTTK4Q
         hZxosDwTPEinqKA06Zvw2bHeLdJ/RDjVoyQkCrCFZg2kNE7niSA99JnAyak0rsMBnjLX
         SPUxzVt+EI04iy1Ni7Xj9uVgS511n6wtMi/OS0qGSroBFv10FSxqyQBW3CUFeN1oMZOf
         icm+hNiX8dq1PLwjaYxzW/z9ua86vpGRF6NDwsQk5w8lRSuHnbKJoVh4znRwP2YDNv17
         xytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466307; x=1780071107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=mWNr9CZb+b4v3MaFXd8w2zgegAegs0280EtPwzVfdtrIqzM3tgOtjAa0MFmYZfefqX
         H8FktXUK7+ihkzjx80z1PvALEYNVPwAMYD7VTWdEJk6cifdeRhc4YigZy+9NceMC/GLA
         UsozmmJ0u84AUmTQeacOH3wTY5t0BXAU/3a2bENNyIY+wW8f0feRnlSpUX1624A+jw8U
         ks6d6jASGTNEIRGCt9s6OS808lPCXfcgiRS4ybNh5UahWwqrQyuv0l4OOOCBKsH8k2Ye
         1upIRW5A0qEkIcH8W6H0q1kbpbBbXGhnvqdMG01xDCGv6Lia19JLDoBzpgYGiqnPOx3Z
         m8Dg==
X-Forwarded-Encrypted: i=1; AFNElJ8RDnNtkKK3WbujdBLmrBTJIcM5aMcpUTpDdUaTvdj3gk6ud3YQjDRAN2jwy0PEVR7uEAChiOWF1tKqHHOdyl63@lists.infradead.org
X-Gm-Message-State: AOJu0YyT+ABMn7F8KgfYHT7U2ONZJ7ryCUE3Yvl+okM0/VQVLeUyttgZ
	Xx43792MscABGKIH4Ysy9R2bIoQQjLdWd6JW9Ge4X8cMvWBc8aJQCdqJ
X-Gm-Gg: Acq92OHeCnSMRA8aoAKdQIdcgQuz6iXAeHtw5f/INn0VCeUqxXCdNJ3Qhm23kYrwOS9
	46hUDNjJGLHgW3E4/BsmeOx+U6ghudyu17RfbxHMmrpDnuooyo6+TtgDw+lL3psNH8be+o1G+nC
	TGd8W/Q8hCAsxfU1DZtUPM9BAsMI7C3bIIH8Cul1wuAVDTQySmi7WNn2l8Tnu3ruDnIbr85+ZEv
	rx50CTUQ8mR5UvMqTP/KA1COdA+sVGyCl2ANEb0KdU6NO1dMK9SudxYJyVOpQMwzoOP46wz3EUk
	lQHbuNdGbTPs/EgRD1br6oHhn6tNdHaho1tCArZtpM1aKtjNCAGIb5YDLa6xzenxmRpBYhiL3X3
	s0mIZubiJO4SBkJagCC3Mz0AUpAeVuRM7c3PMyF5LGxZ6HAyRhNdoTkHA+JblvaSMx+j7JZlJS0
	XTMDBQ18IEjfclc1ho5cwRzPB0opVAJ9mm7cwioaWTQA==
X-Received: by 2002:a05:600c:c83:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-49042488b81mr59056955e9.1.1779466306479;
        Fri, 22 May 2026 09:11:46 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:46 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
Date: Fri, 22 May 2026 17:11:08 +0100
Message-ID: <20260522161105.277519-17-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091149_832824_1DD1F957 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

From: Vitor Soares <vitor.soares@toradex.com>

The Riverdi RVT70HSLNWCA0 is a 7.0" WSVGA (1024x600) IPS TFT LCD LVDS
panel used in the Riverdi RVT70HSDNWCA0 display module.

The Riverdi RVT101HVLNWC00 is a 10.1" WXGA (1280x800) IPS TFT LCD LVDS
panel used in the Riverdi RVT101HVDNWC00 display module.

Link: https://download.riverdi.com/RVT70HSLNWCA0/DS_RVT70HSLNWCA0_Rev.1.4.pdf
Link: https://download.riverdi.com/RVT101HVLNWC00/DS_RVT101HVLNWC00_Rev.1.4.pdf
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b31c67babaa8..b89f86bc0683 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,10 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - riverdi,rvt101hvlnwc00
+          # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - riverdi,rvt70hslnwca0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
-- 
2.54.0


