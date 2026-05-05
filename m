Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2FFCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=; b=N70wAO4wmh2azydJBRYVfFryA/
	IzlJ2eaBNzzuKO9p1rvPxs1duuQX6zZvZrU7Zq437Q2D/aTG9AtGf2999oPRDua2ZgTw6vqOSsK2n
	7tZkd64l1hG3BPO5G5yzlbvE9OjxYW1iokxzSpgilmi+quz+Rkra8Vz6/QBCgaAD8R0P6DN7/vrYz
	DVPSZBW+FJE/Gr99GjNEYKYxf7bgYYHxpA8Vd7i2mrET6jpaqLGYF0v0U4Kjm+MFcUK7FP2UF+EGH
	kzbuVglODXf/iNgV1wkWR7KK5X/Rh2Y9ycyt0j36hkegPkhkPBQUmBirV/uiRsC6n0XO+8djd/wFl
	v7br4IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUi-0000000HAYc-1U1x;
	Tue, 05 May 2026 18:27:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUf-0000000HARu-0jQS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so54314985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005659; x=1778610459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=J+zFMvgm233ffTbqlhDSmJmTu0CY5XSU0niMCqBmo7Ihy9COlyrGZboNUY1nZVcwjy
         3IXoZoIttqP06BkJn0JE+v3cbGrY4bipWMae6/9eSRPLggX/08OUwo/PpMp+GepcQTVQ
         NCbGtTEOKWtK3+oFhmyOozSZUKduE8zA8Nx27RHWdf5bV1ZBtG55WHcHNbE+tZxMXGC8
         0P4hXyq5AJG64NiSSJmR8rXai3XfmaDm4Ym+6QO9cPJYiHnxIgpPjS2FY0Ze78y6qgof
         KG8wqEf++4Id5jNTSklOqbd03aFxp6ykIsbJXGpuQs6rZ4u0X8R3t4M8liZPZhutYQQu
         yoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005659; x=1778610459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=N0xu3KN+TeLkWGpWkph0XmGqROvoHr2EFYBMyECapiJTUmTvmOjZqqUpMq6tYTonQr
         a2NtRcBTTuz4tkTy14Z15FfqYgVb0zmMd2nff03aVkBIGd8xH0O3iN+2Dn7CTEoIDxOC
         Gt6bd33NvJMLF0Zr730r/Mktd/TrRg9oIAC5WVjc8e3IkTi6orAz9TzNIDxT1w2x9c0u
         SYAwJPVo+zlSjt65kU4/mZC/SW4hRI9LvjET2fFbtYk3W4OiKDitziLWtDIO50zJjNus
         ONdW2Utx9FPJgDPSBZkX/KLclsYLekYk8lvPPUgbWhSI+OUoSHldo+iybO1LaQ72LdYk
         ColA==
X-Forwarded-Encrypted: i=1; AFNElJ9HyQfiT71qo3Z/+ApFXE2sFIWeRrRLCTBpOZ0HgG/tRDz5yc5GUYv2wMz4p9OC/WBQwMR+T4oxh2Z96fWdSsAP@lists.infradead.org
X-Gm-Message-State: AOJu0YyiE+HRCemR//qacvqlSb6G7uP9MB1YL5h+k9MZoXMnxiqWczD+
	AcoNjwBxQ1iSnrcxzjaUKlRvwFonEEqJOAXByaXSGxPy/G2CkWQAqT8g
X-Gm-Gg: AeBDieuKr4kmaF8jxVooeHdRL6T+uYyP5e3Q/Irsowq6dI8vZErjUGNC4KjrVUUEFIJ
	9zTt/zn05Fc1HQlaWX7ClYP2oCsbQ7A0KyiQfoNW6uWQ+ZSDs5VeUxT7i4O6asu7G1k1Gp9C/xl
	z9CEkDA5X/TaXDw67vTqnc1Mi6nGWxS/WIDAQtPPLrQWpsAxWdg8G/x7NIaFJ7uwR4Yf0mvsiVO
	OocCPnsE4k/otsW4y4WcZFK6AzeVf2E1jH1YLJG2wk9c5a9goX87+Eiw5446zAmCgslxtDpD8aj
	SU/jtsbMEwmx5qEdz7JH1SjfNHXNKdM50EqTpMtue1eOaadkk16GEvJDMqln+u+na+qonxrpfNI
	WcVGOyn1r96GumJ0H3MjTGvn8ZHPfdpM1+lQYE/h/gvEKdOE6imcorwQIi0SF/b2xMmAFKJ34oZ
	jphrUa+PsrdzRFHkV0OdU9UdkFpvhD+Lw1Jumi5/6l0OaTDnh+j1iWW8NnGRTKQHh8T0jzbMu7w
	mnn9to=
X-Received: by 2002:a05:600c:4f53:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48e51f42798mr6028415e9.14.1778005659102;
        Tue, 05 May 2026 11:27:39 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 07/10] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  5 May 2026 20:27:08 +0200
Message-ID: <20260505182713.27644-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112741_232636_398CBC82 
X-CRM114-Status: GOOD (  14.79  )
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

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4ef31bb4eb05..ef2306840c5b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index aef4a4fcf6e5..aefdca01b77b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -523,6 +523,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -550,6 +551,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.53.0


