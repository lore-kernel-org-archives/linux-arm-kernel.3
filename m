Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18836C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=; b=lfHMRGAhmGEyria6jzKLjG4Nkf
	5hujLxtVfpJkqmJqMTe/u9NLO9RXw5u62KHflfwduayhQCtmI2RHYYVkUuGPDaPZN+n7Pz59z63ZQ
	R1aoUPf9AWRsCv/2zvVmrOAELbWkhKluTCvUwhDsZWBUe0mKfJtCcN8ZI8lO7hweLxNKp6Ut1PaR6
	AawIIVixaMYYs4wStgF53hzwX/Er3T5Dyz9YB4WCpSciAas4rd7eUICnPvRclMRnykCUCoU8kMYVP
	GcBujzKRoJsTPhDS2slc9uXft5/rxzFEES2ZtMqt7+47cRGp539mI+8YOd6hrTLiiE4lv4CbCCQv2
	0arHwokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfQG-0000000ByvH-0dyb;
	Mon, 06 Jul 2026 09:15:29 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfQD-0000000BytT-2146
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:15:26 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so2869033b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329324; x=1783934124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=;
        b=DxiwvTU1xW0bZI9EXh+4X9oHnwiPJLvzjKpwfXis8k7acNh8c5wVnuth1MIO0VOl3o
         AUHH/3fU8N+AksgL7B+wUEIV3Rz75PW8xasVIf5nuNIlTuWjUF4sS8B5L9kMJgvVFyXa
         tHCUtw3uZJKrvsk1Vuf0xWoLGNVRraiwaR+pFtjpQp8dDFrJpGkKlW8kbHhxcW78CvrK
         xErN5khUxp9kXEU7L+IEjJYcsCUewXJh/VLKTNyy5BccXoQZKLIK/yr9HwVUcSCkcRWF
         0ggxMSese32GRxmX6t/rRqOditbwY3TPno6EkwaTRBzluQvt+PbUI4AyRdQaRLK9xtNi
         uQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329324; x=1783934124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO7sRlb4LngBB0NhQzK1DjshH0p/tRvHLng9mNY0Vj8=;
        b=jxXc8dsC7XE4JlWGNESBkuwdoDGjMCKzuMSYHL8jeB4pIqE3zd8JbZPdkJ9fwa7pHT
         ZbVTomwmIMaFSl+3nSaWeSYSmbSV1MyxFvaYwZxkAgfTlPYzNYBn36XvV/s10bQ3AwOW
         Eb08Eio1bp72hbbF7ZgmKpgII1YS2VcQq4JtM3/FMdPoxN5UONonwUwqp3o3hi7vZOlY
         jsacW1WXsbwkOFgJzmeWI6H9DODxSR6vOTDOUMF5vZGkCTbG+ICpUsAaJxX0VF5W8ViI
         9mU9XflborkRP1IOy9aZXOINeBANS5DkqD01FlehR9PYvg6lJEYuqpPuZnGs1GwO1L0g
         7VFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+bS/EJRHGsLTEF8G/Dpl+E/KkNKLqpI8cuoBVb6GhrebAjytNi4MgGif8pylIlWzwWA2gI8I7WFMnvlAxbB+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3KRkOUIUqSsnjj0SoFMtoLeuTCR5tzfGKhfSRg/St226ZyD01
	MsSjPDEMFXwAuNKrhD+2yw6C56kJdasvRry44ojw0d8+tDFxfnk1JbEeK3VJP8EJBOY=
X-Gm-Gg: AfdE7cmZcnzb/VJjHEZFJbjHZcI89YT11qaF/Ac9RfnKomsHxAGMqWvmzRHfO92TuaY
	LIcSyBwmSgG4XYKwRhJT0HPDM+TvNLhDHeMJQVvPrz3R28IBTk9Y6KQL+c1ES0mWMktz7md1GrV
	kMUy9hq8sgJZ7gw/cpQr7qS/ilTIoUnhl8zaQ533rOYwdkMEf+wP7LEF5MLwmeloo318+ec/8DE
	Cuah6lsuhQn1qbMXDMhCZCk7kYAqY5ZrjuCF3fM/Dgx+YPF3C8XC2TkKpUI2Fn1f3wmshIG6Cma
	RZqXEbqkO0venVU/hU5vvRtV+zol3c2XJX4oPoqEc9JwGJGpHHr1SYA1wzbf13X+Pq7XulsIswR
	ZxYotTbg++43aeUU0psncnofVvcRfowqbsttAfVhcbxCWokKUIvtEbKlVrW09RSrbnVNzqQJ965
	aFbhMempOPsmGXPYN9ZAWt1fmR
X-Received: by 2002:a05:6a00:bd0c:b0:847:77f0:72af with SMTP id d2e1a72fcca58-847f6ecb888mr7926803b3a.40.1783329320787;
        Mon, 06 Jul 2026 02:15:20 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:20 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:43 +0800
Subject: [PATCH v2 3/5] net: phy: motorcomm: Enable optional clock for
 YT8531
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-3-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329287; l=1439;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=SlNqGmETJ9Q8UAkQSzGcvlMdwkMGS8oYl0+UlW2dAag=;
 b=y6ylHRmWgT7jI86bC726VoaKX+LpK4637earqAkTGSrc4CX0YqwDp1WW/spDefa3DoiAUsZOh
 Vi4pQJYhQAiAYpVdofljX7KHjKSc3kOcTx5ju2ZdGCW3K/esm48DEaL
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021525_531121_35888D49 
X-CRM114-Status: GOOD (  14.11  )
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

Some boards feed the YT8531 PHY from an SoC-provided external
reference clock described by the common ethernet-phy "clocks" property.

Enable the optional PHY clock during probe so boards can model this
clock as a PHY input instead of keeping the clock alive from the MAC
driver.

This is needed on the Alientek DLRV1126, where the PHY reference clock
is provided by CLK_GMAC_ETHERNET_OUT.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 drivers/net/phy/motorcomm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 5071605a1a11..3396a38cfc0f 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -6,6 +6,7 @@
  * Author: Frank <Frank.Sae@motor-comm.com>
  */
 
+#include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -1180,9 +1181,15 @@ static int yt8521_probe(struct phy_device *phydev)
 static int yt8531_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
+	struct clk *clk;
 	u16 mask, val;
 	u32 freq;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get and enable PHY clock\n");
+
 	if (device_property_read_u32(dev, "motorcomm,clk-out-frequency-hz", &freq))
 		freq = YTPHY_DTS_OUTPUT_CLK_DIS;
 

-- 
2.54.0


