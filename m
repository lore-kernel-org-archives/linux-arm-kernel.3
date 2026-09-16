Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A2FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=; b=pRw3OWcCZJCeVkreDBXyNFuDS5
	QLhgyNwerf80YfmoD14UFI+H2PpP9lzpaxX716URGE2Md4xXxRWjRalKU1F+Uml0BWcy0tdTZRrOb
	0LsRZz/SkxCUVmPdOrNyNZ2GPL5ah8o4jHUNxAl4wHm9o6wBEBcDoGoF2PKqxUGTjoSPuKtIu1hE9
	E3SSvxuQp6CEvQ5qZNlqsgtdsIqJpjj05Nc+FCeNLLpTtQSPVa1e3uFTnq68Wi2++kd8AYWCrAVMX
	iqYJSU/LvfRLbj3WvQfd+Ef/5e16D6vQN9ZGFhhAMrPB31JlGqmzJ4iRZX4RRjxuP9YLWKV3c+7Nl
	L71ERImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQs-0000000AGwf-3aJN;
	Wed, 16 Sep 2026 23:52:54 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQe-0000000AGfw-2V1G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:41 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so178333f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602759; x=1790207559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=NUy0qsArDt/yD6WDUBFTU8k6Ug+S6QlpsOhaN96MbQ98Sc788s8YlzBJmvdL+7BDen
         ls49KirA4Xm6W7ymHFIKS9hZudSx5m08EWeUyM1pUXGftRwe3SrUiFL/l6tBWzOoT2UM
         hAFiylISd6T8jR/QjuWFwk1NPkiY9y/ky4i2V5Ynm5GDx4irctMA32eq6vfiJjrtlHk2
         XqS1G8sw06xe2GTYze/V/rUont5uEK5bIkfuI01XSdyXOM3ghdWYETE1W3ojRLorkaga
         QYdW4C9X3yluloIWCslcZRdPOYlcJ93JHSlpRcH/F939HnlM6QEU52lNncjn1/dXQgB+
         TAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602759; x=1790207559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=0ScljVWUqQm6x15kX7uDBQrmBK6+KFhrt/6Xl0b97AxURxEqm4ayaW6uuAec39w1Zt
         SvKjGpfBX5dvqjejyAlg8+ZgnycWXIjNaVt9WY6BS14SHa1KdZZT6XnbdTcwhdMGlSrL
         gFuWAHpxPwoHdM4YOZWM9+vmHPJxViXdts8mT+u2BHEo0YVSY1FDfwb/wjlsjaz6Z1f/
         Qr/tbo0w5R2BrzDZ32IlStxuQJlJ55EGd7kak5RrSvdKAmBRUGMH/cMncjAjFOWXSbAF
         c5PYsA/THyKCTCsGOuUYAwQoditPO8wAg597/AfgFXCrWQ7vn70q8SfvCr1Oj8bC3yUR
         fFGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGP31szh0F9E4jSQhFJjIl4bDUEjn3p/vL0q7UuD0J2/gz/63JnkdCBs/Rx0d23t7R3kPOWHhJIM0MIz6xIVcz@lists.infradead.org
X-Gm-Message-State: AFuF++kOXCq8lah4u4wd68pUgVxuwZVL1FArFdsKn2xlmCDTS/UZpOJM
	JdnSFnWzVlSwHDbxKDVcMVfglm9Txatu+ILEzVwFmHuzykznJZktX3pr
X-Gm-Gg: AYBFou2qIcv6gdmWgrVzAK8K7yzMfu45uSa6H7tca0vQ84aB7UK3/woG+VroGC7YuPv
	/16GsPjTgq6Mp6UTqo9jqPft2U07Ozmj6PSYnba71sj7oE2jTeNaZ3ncNVdeVemNYrUomW2Ml2M
	kYp34rzJ4YusoWbu/FluxpcNfYS25TJ7U73a6O3IaFYVE5PoM54mq3T/Kb0ZY4U/ozS1lhEZXSy
	N4iCfyr3sX395UOsWziCcQsBZdki5431O2sCQBEeriQK4rYo7yvJOniumFj/SNbgTUYlwlOACCE
	a3wYCvZGLLuF0pF7fPFPNTm7MRqx4B3W6r1WUOLoFpwQrq8xSwhNaclJgX7e0sslTbs3ik0f89g
	vND0hflO756fQ7RzqWHw/u7jzxarbUAm3GvfQ9e4j6guaJq0h31S0VwAO5Lj4VF7ya/Exxebz40
	ZqUMvTzJgHfdN2gXYJ2tJnbYFrB23vfSEJa4mLof4Bp0OWtDZiWMkXSHNJ+3OmCBQC6SNPKhgyi
	VztbuLb7ntHiVfERNBW/yUvQo8uboZk3VsCuUFDg5lEpecJT8x/LQ6++DOwmtXD
X-Received: by 2002:a05:6000:186e:b0:487:1413:c644 with SMTP id ffacd0b85a97d-487152180efmr1035266f8f.30.1789602758928;
        Wed, 16 Sep 2026 16:52:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v16 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 17 Sep 2026 01:51:35 +0200
Message-ID: <20260916235200.20712-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165240_666555_DA9BB6C7 
X-CRM114-Status: GOOD (  15.55  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index fb3fb522769b..4edad9b3c169 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f06eb8b6f94a..f03c1dc0a4a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0


