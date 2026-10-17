Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EE5CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=; b=e6LGYWiByB21yUPLzAjlWPq7fQ
	4qe2cAUb4hKww9WJhmVEu2LbCK5HD4ug+EoImF8k8VFQvi1mng7Wg0Q/sziJXxWSbjsNHhfryTfgl
	sH356XT/5JT0LkiEJDpbcEszpoAsTd/AW/XhVPrPG/CPBo+y2Ty2MTZedji9vi71GfXgD3MCg7V7x
	ZzrbjapmOW7e/6JvWbfgYtUMKYAeJZou1dM5FFD94/sqIyVpgAcOQI9HQFErrxolkrU3GpW+eCQvI
	iE/O+R9H6f+siYCJM8+PCBtRPjmubtkl0r4QsLAi/2pmAlpdTQCQ5oP8tSIpojQrwFbu/1Q6MKFdm
	4XLbo29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxEg-00000004Spv-2cj5;
	Sat, 17 Oct 2026 05:45:38 +0000
Received: from mail-pz2-x04.google.com ([2607:f8b0:4864:3b::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxEU-00000004SfR-2Ug6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:45:31 +0000
Received: by mail-pz2-x04.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so103605a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215926; x=1792820726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=TnRThJLock6haLdL3438mMNoYTrmJL19npbCLIELR62YGN8IX+pFa47ZcwMS5gISsN
         ovkS1vPpZ9ofOdqnODEGN1yvqy0supuLwIWC7T3iPzqFIf/aV8rH66RsUK+e9Q/foqB8
         JiU35bMNcf7pXZomd5puH2YKTsT/WXzfQTJGLJ7Fmq82UUM5dBP6JLrYgsW5nX9dbEk2
         srF0UvK+lad633bWi9M5o/0CPVDuItDPrgfe+qIdX84aWYwt6xaePrhutVSRf1upPXqc
         OhIzRnrtZJsFa/JEjFzRxh8TqJe9kJozZhL6t6KX4p/6E4RIVrSTlIGlr0fLMjAiDOK2
         PAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215926; x=1792820726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=p0v78DIbKl3/9tq+m0OFaZZb0Xfz8es+LxWCoIsEOSTrCmFphRU8AS11+kQY48q/Fj
         9wYawD+qpXAiK7C+QbtfSQHrtKr7o/Bg3bghoJw9XhAhd6xOFLc4m2lJMf6WQTtKv7AZ
         Swk2Mooo6iS5atWd61RGKMlrYSGYeK07Pjojiw4XoUP9U87lhhtB7Q080wnxyg1USsjq
         ShdeDkLbQ9AoMgy7ELKsvBj155vCzmWLb2+k89L7/gwGzEr5D6ycu5U+HeHQL5FfKlE/
         wu++oMlY/5ytVS4G/pp7/tm+s7NOSheo3IYhow2tNxKLdXpUP9cLyl+bt3u8yhfp1LXY
         Lp5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwP1bkuwILXEwe5SeuUTelZ2HTb1aq3WKs2d2ZhSA7Z0+oM+Nw75z5xiDekq/8BhmU2DvzpSm8jMQb+juzNRMeh@lists.infradead.org
X-Gm-Message-State: AFq9FYLEHmkRPXweoGaa//R+r7rj8b2MWCysmOGPG3YMWql+Z0uXYbI6
	2q90EMJyb3+/NFbqCJ4LwgxGY5lSBvmY94SUjFcOOEfho7qQPLpzGeqB
X-Gm-Gg: AYBFou15yT6pdg67yzeW9c4F8104yeA5+eHbeaZpUQl1A6XSR45+fuuM86crm1MCuDB
	Q1kfZpJjNZC39Sv+Zo8vU9spzIw/t91vbQnTjU865f6AeAbsU9idPbFlmnGgh1mA9kU2xtq3WHd
	eihtABSctuvBWh491KPDyi+D+Wt521z40jmF6MB5zV+Ctukl1lyMPqgberF/udKbRWFR8TK1WwS
	gY0A3LIz1g89X6fSGvko8mHsMnIaBwizClL4L4mZGvHQBYKce3oKPgRCzWX0Na6eXs7BqClkOhg
	jLHpXFAyhOe8xhqqvjvr8l7B/5IRA7rUfzbaJlwUAavAQVCOH13F5VEW7gHFoVhsgxpHHOUJ3pv
	YM4foe917OXj2g3OKJeBzIdPitUul6dS0ZPudNHI1bOocca04kqolMXz2YplcLeEqxd89nZFC0q
	3Mv4jM5r0E7gFr+OUa66gNSs/idswniti4yJu19a7to7yEcLhv3LXlirq8ybpETh9znNYC
X-Received: by 2002:a05:6a00:4146:b0:87d:430:1437 with SMTP id d2e1a72fcca58-8a04be6035cmr1481735b3a.38.1792215925893;
        Fri, 16 Oct 2026 22:45:25 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:25 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat, 17 Oct 2026 13:44:04 +0800
Message-ID: <20261017054406.1828061-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_224527_258303_17F42B2C 
X-CRM114-Status: GOOD (  10.96  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


