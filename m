Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4FDC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=; b=HTo4lKCyNVjnoYpWv6HzHjmds8
	yt0G57bRqvGKsQc/8iGSJ/KARO1KM83Pt03lka7GKK9pgbEcNn6NxsPtfn/sk9Yw7B7yeAQHAJwtM
	gTmsmS+y8NpynKJQZKXXuFNHmv34H5HkzLUs+wWnP5sVBNwmsK8rCUXRo/7zDvF4SKUIwJvO1EJIJ
	3fSXLaOXu+KyzEuZTcps8A3cKcKbPIJZ5w6WKKvuOiF4T1TDbwduGwXC26Tn+dqhiayZsxtsB7MoX
	Ae1UXOGLhVqUt7UWGaOXaYYa6qL0P6SOkG5pRCDbKiH7ewAHSIxVKZZGlQUT/GMuGUvsDVKF1X93D
	uw6En6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinh-0000000DjgF-39wz;
	Tue, 11 Aug 2026 09:29:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinW-0000000DjPn-03sN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Aug 2026 09:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=; b=lPXEzTfpoMluy1GfInPEJAq6q/
	ZFmXK/Jip7ny7CHc7/6wnspcEP0WXMlEjQm6+Jtc/iZOuRSjmbZ/ue9UjiQY6033dbQiG4+jx0oAl
	SItdTxZ6qSq6yZaIBz5j3wxuYM/N5dB4TE8vfhT/U1r2CFZ9EjpJvBTeAGZjiGgHvsrCNNuii9ISJ
	gweDvaYOlJB/hw4ELToOg+WFZslN+X7KCNXz0ZXkxrlLJwzc+VYDRL4li9wPezJxxX9tI2E9+zpq4
	6vsYshmH0RFquxBOANDlG15fmaS+j2er12UmTLyfaVgElagceqW2hEl/0Ig5UTWKHltW2K4SwZi2i
	UrWXYi1A==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtinT-0000000ESy3-0tBE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:29:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so31423565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440562; x=1787045362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=ZM6sUjwj8CRWNftQH1fbBEnT7kRgvVkl9GEwHbVSX5OEE2pmoG8yAdsQDIE2H5+DF5
         Bt2RxU23qFqySSMQ+W4bvzwvATsLl+gjbbY6J47pXKdmZ5Zu5olBNcZEbnG5EIEcYG70
         r2jkJB6LqKXwGEp/9hVrjXHgIaPZ2Uo58PkfoJG7R9oj0LkEp2ePvIJOn4zrYTZCfqQO
         RTWyusZQELTUMzYlrg+XGtAf/WFSX8aV3p0n/CWD9IMs0D33OXU6TEFb8O2C23gK+V5s
         ylYId2hUw+OIyiaxkmYGXz7Q74bn5wPrZ3SX7UCCJ/+umSnjClBIY3rW+Edq+coYMUZf
         VceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440562; x=1787045362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=KACBu3fagveW6Z41RciS8EzpN3DRIkOY49e295SbtiSDEShDZKZZL93F8C/15h6wws
         NNbclOFlfj7jsosYKbX6yVf7Ee4UkHKlFW/EiBwHCrQRIG0i/JZLsZx6403aln5HpSUs
         mVHX9R5CSQ3QODgKFXpqX46wBYgOyEhRsWqm5nhjYCInkDK7nn7i2rnzfKBJa4ba0PIH
         m5L1RKXTBQZT8nWImk1+P/2iOK1oPpTVDFGu1YD6MuOixWsbZOJufaeXexl5SFsIEQzj
         cgCub4S5hJ5lujzjVlQQtFm6V353IZva2YyLtaJhE7hEs4o58Tf392nWjRQlElNCOw8z
         hsIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVBaUB3KZLVYXdmEE/IVLJ8qp1/JwObLny7uWnjL6oTDezl0Srr7VBDkEnd1eam8wDid4m6yGwoQrb3NcKyDVI@lists.infradead.org
X-Gm-Message-State: AOJu0YwXNY/fo+yYrsFLwgSlF3ml4zWXHk9eQ5iv/YQym+glQfJ/KFPr
	yWmTfcctUzI4hkPApzLxHALpa9KvQVBdqNsimrDejYnZ/TtL8BhrDmf0
X-Gm-Gg: AR+sD11FbhAlrr27eZSu3AmEPa7UgFdph77myLM4Tdng8Ts+xSktCR67ieXn0vWCSeL
	GFOw3AK7FZUuU4OiDwih2ZHdPCILAd0Ymgm61V326kpLdpcedA4kpfXqwFcd+DwaQo+bGjHQu+d
	G1VxmmXn+rhQytVJIsRRn2yDctYd8KhDz6SEd1bwy7ILqw0cx6m3IYgwAdu/oDUiChoZMv2eCUH
	Z41tI9pfdmxtESO6y2OTyC8xRJfzDZZUnQCsbaHDgKfTslHZPWbHC7jVhxbDhON/So2yEfTGZF5
	mAD7A3AycdA5gz5QD+yHjNYLtCO450tmkoh6dXaUhDQXOFubtn7XiJHaICzqhY/py5bmvuD2h9H
	Fi6ALqVKSSj9jmI9yW68OqkIYRm5ihiCTSHNH6Su8S3RjJ42HI7uWWuxVktfCUOxcpreeQYqRIh
	dfRaUlKr0WSqv/d/fTeHOgCXFaeoSVBad+A9IOBCKyki+oB7UtEVt1EyTjdoEhn2f7AZtuevat3
	YpLLH5YDF0zxGv7wPqcKajunY9d51+7mL0UtWIm5OZKyG4wHQaxEAsR4NDJ
X-Received: by 2002:a05:600c:4fcf:b0:499:7219:122f with SMTP id 5b1f17b1804b1-4997843073emr24510875e9.4.1786440561565;
        Tue, 11 Aug 2026 02:29:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
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
Subject: [PATCH net-next v13 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 11 Aug 2026 11:28:34 +0200
Message-ID: <20260811092843.673837-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_102923_418647_0EAA454A 
X-CRM114-Status: GOOD (  15.68  )
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
index 39d742c90db7..ef9ccec0cd81 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
index ca9dfc142388..ea554c0d41f8 100644
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
2.53.0


