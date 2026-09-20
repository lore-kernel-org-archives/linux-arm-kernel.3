Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC7C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=; b=o48XMz9irigbcu5XeQF05WXc7T
	TnPKNJUWDTJuzv1eO26lLmGdobbmlX7Vub0ZrnD25n0XDjAe/ePv/33JtdQSBxj7gkEAiuR4qbTLO
	BAslaNqtrCmQ87CbbqPWsAOyviD0Q5LrnfbjFAdlDxgGwik4RP3/qYeuETAI3XlZxUi0zWMzEJTor
	ePPL8/wgXeyTBi8+nbqg44byX39NxXHBizvxjIM0W3BpfUXYQ4mcTEEUKvBH0jcpGxGXQYCLKKM/J
	e6aMiMyl8mvbprIReRjkD4yOqVF53F5tuVfWRtSM9YyudLEpv4XsW6nmDtzEpnTmbGmi8hmQJvq/Y
	mBh6s1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KxC-00000000A4V-47OB;
	Sun, 20 Sep 2026 17:03:51 +0000
Received: from mail-pz2-x09.google.com ([2607:f8b0:4864:3b::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Kx3-000000009tG-03WT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 17:03:44 +0000
Received: by mail-pz2-x09.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso1282831a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923820; x=1790528620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=XwKBcZLnXeDwcopeIYa/t0m9CS3MtAoIDuwJP+JCz55l0DSG1kmP5IfptskuyS5JYW
         p0C0aPV1McrJO6iQ51DucroDyVaTclxRqX6mvFG5rlm6h6P2LUi5osZFHVi/rtcRBvQa
         ESCZ0ax2KCsyyXfBb0OP3ArO0VPemh+KXOxrg7539s26fOfc62yXyIE4TdRCXcdmk50Y
         R4+MU+pD7DUndPA/3YgIvk9mrWr46S913voVQqzQqG2zxSIH+rSIWc9TWDGRQjmA2kUB
         WNwxJgNNesoYjPpDO5D/o+Yvbrd0XymbHJaKyy44X2TULP6xIMSD/brRcLdxPsxZJRsR
         q0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923820; x=1790528620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=jr6MbI7NsdT/VWV2YsLVcNAhQhReSNPEyy7lp9PW/2oMRduXB1TKPiwusbQv4nafg/
         tSOrdF0aO6QQnrhEQEPRQQ5oeSc2+LN5uXpTtCnn1SiJH2sF3Yfpf1P7+KcXPOwG5e5F
         Hsw/FyiH+YeyrcBu/NkTIZa1qQGQP0ib1lobTuFqqtblkTchYBjWQ14R7TyfBqJsHT5H
         fc70Pb94ipxZVuO1VspzBTvhm/xvD7ohc8PdpSIsOcghMLI4eSNIDJePFHTHz8pks/k1
         8s8zxKUY8IKDAp/79+AVEfUHnkdG/M4TxbtP99SmSIV7nylDltF5WRFWesH1J3mF5h6L
         PzkQ==
X-Forwarded-Encrypted: i=1; AKwUvBynuB9Qn/pUEZRVzuEdf2ME9oqIiOvwCv7qYsOP4Guj4qrPboE5PNL9D7a9GdQZIAzva48dhfdmrYfADwW8QiGM@lists.infradead.org
X-Gm-Message-State: AFuF++kPNxLwkLC9X7/IspQVd3oFP9hLmTn3XD1LcOv5XN+OPCVHVL41
	ESqXlmFKb45QVUl+SsQJmhn0zoQb3/wl63+0MnUV5FJe6NWabygGCcHP
X-Gm-Gg: AYBFou2l1BFm2YQZqmd/hmjTnEsz4hjULwn5pvgyHmyEHQQuILO9mWczdKQRjdgs3We
	dMfVCSTV0wcFBOcW7+mq9GylM1Uijhul2+rLS6zrpJEFmCoY1Wt3JNxSMEDbj8QBIuTs7U5lX1U
	Ozl8O5sQlaHLtlD0lqfx1F+ALuZuczhP3E9h1DtktMsRM7Ma5G1U8gdBQDc3EuQbMFWr048jTHE
	umTbiZnt+ENooJTxp8PwR6nuHDEjVkeIA9rGPwg1wvqXCyixm435UvH9/pPGUGnSw4yWJAcu2SP
	nK9zIqsinxsmRejlYy4MCwv2BQBqpVU497DpSk06in8VDltsnvBOCSvLv9Epi7d1xo3rXd3b7UF
	dU+RqyUpZbGS5NLp9Ab4g5M1KCoP6uX2zyTYZRPvf3dKPvD0PHtkfw/UBOifurhfm0keHlTKxAu
	avN6w6Y0vG620GVW8vByHJ6rAS2P9P0fGfn49kReSgVhJv1wJ8et1QONTqj4Pz0SynIWj7aQ==
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr4633099b3a.46.1789923820049;
        Sun, 20 Sep 2026 10:03:40 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:03:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v9 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Mon, 21 Sep 2026 01:01:15 +0800
Message-ID: <20260920170116.3624104-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_100342_128847_AD6ADF63 
X-CRM114-Status: GOOD (  11.76  )
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
index cc3cae2e378b3..085589b8ba65e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23740,6 +23740,15 @@ S:	Maintained
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


