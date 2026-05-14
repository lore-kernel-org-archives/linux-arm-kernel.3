Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E2CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=; b=op/1kgMqHJHSZg2gw/iBFSiOqL
	zmLMsoNPxbOAZ5bNXYiUdHXXATJ+L9+WmKxToUanbmQ9PG8TqRdR4qPRp295M2sDq6OlPxoWaCVG7
	U1GoNEJ43AT+kQfc+G90fP46IQkc3CZm4YzwZsQMdFXEsPoEiUA+fokUpRf2xxLG3HUSwaAz1SOTt
	Y018Zlpf96V3C37NvwHr6fWAC2dxaLrpclKSYdAppCL3C4YeEgoA29UnYITXGAeoZOM9Iim8ijcHO
	s88tzSba/gZoxtfwaxgTS7NSEtmguwKsVg6w6kl5oACi+oSKXZ4CaAZj5cz+/RHvMeGzm6AMCypxy
	AuHsWvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT43-000000059oJ-0sw6;
	Thu, 14 May 2026 10:13:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT40-000000059ko-3N39
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:13:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3293022a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753588; x=1779358388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=;
        b=cOSk93O95aVG2vCqYOd8oItBsoDsS4BrXcVGtjCpMCdhONDY0rRvb2e4Ik6NxNkvc+
         7F/5R3RuoU9Fn/GYCqgkpZEt2wWNl/BCBVBNavJe6F8YEz2RDZC8cXKmNiBsTySfVKU8
         WwKTw+TdtW2xaDQyZNelHpNRX1hgYoTrHzAj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753588; x=1779358388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=;
        b=SCJocm/ji7lptBOt9CjzMNZnz6vYXiVc4OFPEhPYQPvHeCY9vzeWWsDgT6kktYeB8x
         2kx9zaHUAUUwXz48BhbfgDNO6wlgolR53GYD+uTDnh0X6sFDhXrdn7Jfd0FMzUsDyYfA
         PbutEzFt0tdZTMKUQ3eP/8sPNvegmaRYANoRlnN6sO85dr1P9/l0Cl0pMzojkoYB+XSS
         6uguc0OtUdYTP7s27NVtohGGrAgBo+YEVuAxTNoTmWD+iiR2WWAbIQuJvoCyxVTO7gyT
         7qJAXdvMBGd9epmXvKKi6oqJL2BA+b5B4Mrmb4irTthJ4ubYioH8UiDHipzglHGi8XsO
         L2og==
X-Forwarded-Encrypted: i=1; AFNElJ/b//+Cq7eHnf4t0YG5Ac1LDGu9zss/T+1HAvbhaIzIE5O/l76v0QpXDsMK3I9Bym35i9N89P49wZVsvV/ZVgfD@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt7BHWiFDV5HXQXUMDalwY9QmlBLQUUu5UvWGLMf9e2EmQ4Fl/
	s/sgXYIPkM5DCUodApJ8nSsT3MKsOh3PXSm+8Mr9Re4h9rK6e9dLYKSkjjkrLx/zZQ==
X-Gm-Gg: Acq92OGbVBi9wxJo+dmnszPGp6AbB2UnLLwpWQyvr8SNycxnRig6i+slfwAVCEM1+DC
	A4gcvoUk5np+vLxpsFX9p8M3c5FBBwFWLdw+hat+AqFlVcuz29dJP2AsxriR/RWokC5rI6E56zP
	mKJCYNcKtPvwRgT0TiSXlUIHBdTjmNAISy8KwBI9MSpvtVnOPdEz9TfYCbwPAAJkgFeOKHWPaEZ
	eYfclnPOFD5E4MAtzxFtuYVhpyzJuouBJAHgzLJHDwstfDtJgIn9CCHiwGBZXSB2Cj6SV89r4Ob
	F1ehcqnokkLIU8XKg8wYMLWS8UbyPZWfFerl+YD3QlMTLgAUQibW1bgTiMmuTwd4QgM5U6eh0YI
	MO59lgAmo4G1llapbMAvCI0Rq2BbqpGyGhRCjaPqNzhLWWDclepsc3i6N4jkc6q4rrjsaI3VV2o
	VlFFpJZKB6F/SyM7i0Xh2wXQd8ySNTDDgGaZcH+foP+6Vtm63fkNz2haThS4lH5+dYoaqJS6V5L
	lGsCijo
X-Received: by 2002:a05:6a20:7f8f:b0:398:a659:eb0 with SMTP id adf61e73a8af0-3afb1112a37mr8021299637.34.1778753587701;
        Thu, 14 May 2026 03:13:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO line names
Date: Thu, 14 May 2026 18:12:50 +0800
Message-ID: <20260514101254.2749300-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031308_845044_D123A66E 
X-CRM114-Status: GOOD (  12.27  )
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

GPIO lines 59 and 61 are named BT_KILL_1V8_L and WIFI_KILL_1V8_L in the
hardware design. Add them to the gpio-line-names property to make the
names available to users and developers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 3c8b4c2f6f23..b7387075cb87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -727,9 +727,9 @@ &pio {
 			  "SD_DATA1",
 			  "",
 			  "",
+			  "BT_KILL_1V8_L",
 			  "",
-			  "",
-			  "",
+			  "WIFI_KILL_1V8_L",
 			  "",
 			  "PCIE_WAKE_ODL",
 			  "PCIE_RST_L",
-- 
2.54.0.563.g4f69b47b94-goog


