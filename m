Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08688ECD6D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=; b=PP2mgaLo83fyWJ88Fvn3mXQum5
	arrEQUL5ApKCH6hTXxWStVBYIALcWa6bAFIDtk9N2yNesIHQ6lFbd2pwWfvjCF72wtlRl+nfwnRla
	ahklAqEfm8M16e23VhjNmUc4wnodNkdABUUv5j+maLKPajoxNVcnMfEafV/1iADFObSlgJlSLf79G
	qtyiTB2aGIxcaPwaoo9DNPbGGsfM3pfJozd8F3lnkxNwP2Yb+YDDPjLQW8dPG2bSBUodcbZCSviHI
	MixRzkROsWadrAWvH+sPQ6RA9mI4C59KU6IIxHkFrUmYcN8S8HAfgCybejOsBSfZLt7Ot0/G9kPEj
	hvNrlkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFY4-00000000xme-2edo;
	Wed, 11 Feb 2026 19:06:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXn-00000000xYe-4BtJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4359108fd24so4652961f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836794; x=1771441594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=;
        b=ejTcR0YA2YOXItHtfGkwaz16vxGYQ4eSHUMneqALUR56uccRrzHOU90LcsmULim1aw
         uQk5K17CkTAZk2cfxHdlSVIgp1t4ENDgCheBPuZ4u2GGQ1Kl3PMFb4/Z6tuFdhWBX2Ec
         Hg1+hOdrGfkKc/pG69BRLQOWmZGfoXKEIRa9yBA9UOZ8ukyQWAbMSuop17+tYX16445q
         qUD5Jfmo9CIgxlzCb3fEr9D1jHG+/dRtAUU2F6c9LcvY3fOEaKP4R7T1moatX2JbeMsz
         aZ4gooFk0sJIQxIc8xG7BjjM46gxbBUNob/yEHYvd6fUrN12wZyR6qtuVFAdaHyo1mAt
         5W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836794; x=1771441594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=;
        b=VIj6FY/3t3Bz6AnlulbqtyGsk78X28u+LICOjA5urwzGpD93b5TxuN5PpZZ0J9oput
         yEPLvOUTA38kQU0E1Xft7p49cLIPfX4T4rki9/ceVZNwnmuCoM1tBv/+IXtFLxrpbzyX
         e/2vWJsS666uOjIprmY7LcSlGZtJHwqYbG6MKKlS2nKO1VVNbpIl45fbOjKM7YSxKYve
         3jM1VJyRUBVQUni6Bn/gQZcKnsJY5PlhOdijBJnEFpDxf1IjEG0p/R+JdKcCeHB6Ia0W
         8sD3rNn5j3WGs3OfGE2Y6fe8n2aUx1dbonuOCQ3PTqqr5R9j7JFN7nYlYWqruu2AQdXF
         GlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7LBlGlVc7dqSGpEXX6buswdWG4swsECwr2wFxRDjLqN2YXwsn94eSHhCEHIA56TbLycDnpa5G57V0ZSIow1rg@lists.infradead.org
X-Gm-Message-State: AOJu0YzsuG1DIHBwNg5BLU8agCXFmkxgAa7/W8YCRIEbat2Z27DwtZXT
	NG9p0Y0vzFeLcnH512nVXN281hhS/BrabRE8k7Phn5wOIDhezEsDMiLh
X-Gm-Gg: AZuq6aJhlesXmSlsWtrjLTocOlRl7wqIvPESqfg+Y85hx6CF049oySa+NSqzAa7YIX7
	xDuy25ANuI0COCV/Sls0r2Ctlg2H+1KPgTT0fksUMHtNhVG22an2AGYrSA7uKzYERSqs8Cz0kBv
	3yDjqn7aTHYdN9c8R+Rp1MwIZJa5lFlQtecRedXNP1gRnlyriX5wMUlUCq49vX6RoUntwRyPC1E
	Tr6VVeGMs1+tlLcoA9VSEXoq1tzgiSopyOJchnFgdOcHbpqV9Ww7IJlCbdH7+YxdyNRo2G3sBJX
	rz21T2pkTGUAer8LUeUBPr9s7NA98C8YjIGmuQRVGlTgU5o/+SZ9g+JpUcA1jmmceX+dTlJFnye
	6KQIWho0kkxuBbYacunPU/NNleC1Z/oUjq08EmrpPZrLYVHG6E2mz/SwpLXFuMVyBihlb3um43b
	U24jV+ZALLA1OTxJ/iJ9E=
X-Received: by 2002:a05:6000:1acb:b0:437:6fcc:f648 with SMTP id ffacd0b85a97d-4378ac891f6mr930249f8f.53.1770836794238;
        Wed, 11 Feb 2026 11:06:34 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:33 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
Date: Wed, 11 Feb 2026 19:03:27 +0000
Message-ID: <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110640_270126_926F1EA7 
X-CRM114-Status: GOOD (  12.10  )
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

DSI hardware reset is needed to prevent different settings between
the bootloader and the kernel.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index caf51f203dd3..ee2792d53b2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mt8167-resets.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -189,6 +190,7 @@ dsi: dsi@14012000 {
 				 <&mmsys CLK_MM_DSI_DIGITAL>,
 				 <&mipi_tx>;
 			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx>;
 			phy-names = "dphy";
 			status = "disabled";
@@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		smi_common: smi@14017000 {
-- 
2.43.0


