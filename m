Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF2CD68BFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=; b=lLrG/sDYD+V7ssl4kAyzPn4Z/c
	IbH4fknJF8sFWqhv3mzOOwhWqpC9ZOF3vRJ414rgECcIE/h2JHDwAHOo9Y4dfbTbF4ptsb27RdrAp
	KbDLloTHWFZ//Io+QDQvpT0JazM50klgy3jWDdKnV9MTKZDv4AezERdoB2b6HR0LLdm543lvDA0sD
	l5vXForO5nfReS7fpIraTkvodiEdv4KXxaahFNQiL2zWdiW+FF0JVdDQ8simgVkqS2CGHvT5Fw+oo
	GgNhFVFgO4hgmyc4PqZKjjZnGDEWcsvL0vumGBxqSRyd5YKdPS66qxTz2SbhP7WlHa6yJ3/btz5Jc
	WxJ70v+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCfMN-00000007NWA-3QKt;
	Sun, 17 Nov 2024 13:30:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCfKY-00000007N4d-3IaP;
	Sun, 17 Nov 2024 13:28:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso18749335e9.1;
        Sun, 17 Nov 2024 05:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731850125; x=1732454925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=;
        b=g+O+UVm86bN6i0d04AYoMDjD18Q/iHdk4YemFJxUZTkqSGAyp8sP++9KftMfZ06SH4
         Hb4595OUtaRstFmI490RzmMrZOvulFzH/LV7hSTlwI60wwaL0UiuY4vzJcDxlQykwLaJ
         oakdQxzpgpTRiE85GxELKEfVkAL4BjzTK8IO3VfIBlwoEhhpBZjQ/cARmLY6WzqfgNAb
         6dsHZhferM88kka6oSSkaeSpEyYGYKT/brl39EI83IvwZc8KEGHb6Rzy8fg71El9K2yR
         vjUE55doHStcf8ACR2ufIYx0ubQTtCcyulQW0yyd8JaR9AxVzPDRFO2KpUo2HrMmsijQ
         9EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731850125; x=1732454925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=;
        b=aabW3e6hre9cykWBgXKDCTxxqMkJaCF/OzHEpwY4oNVS4Fbgx0azqwXJXmqid65yYq
         mL5o+kZKnrBvdCpYkgQqFJKhh9p/aW4r2p/dGaMe4LZcBllylaChMTJtnCykqIkhqvRI
         +wGN9hJVYKSJZ/1b+qHl2cAEpyQFWLR+WIiOEi/lYV1kA5f5beIZCzIWHyB4cU3fewl0
         SHdN5VvwgcozMzbkXs0NZ5xieudJAnch2fm/CM0CnV/tg/WJmPO53+KtnYJPfNT7+HA4
         uGIgjqhQuF46bcMbbkWy0CxfMgiZr266et2S+mVEYxTEVsAbQnmGTDph+E+BdYJHwS7k
         ut8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4TRObE0iirHRGzQIMra6N2B9lpi48khBturau+OUtLlwlwj6c5TGdpkYdNh/IoJLok6zpoxvlBFZN7lDPVKfU@lists.infradead.org, AJvYcCWJN6GrlP9eBH1l35tHk1oO5V/JtqneW15LZFjagFFFc3ThSxDwTQ/oqkKEhEe5TLRBJUlCbkq4Ptuoj4ZL12A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3PuonezEirPZ/gQ/v+JUI+2xc1/LlcmWxoL3FXsJzfdtXDFOS
	df76wDe2tix+2mhVKatI+pN5R/09TdkWzYArSS30+mAMlzGr00sI
X-Google-Smtp-Source: AGHT+IHrdjSGPtd1RYJL4WbSS/mMrLJi5dM8XNBGoaq4RzeqOcoaW8OPFKdOwSlonb6azsv9OyMLaQ==
X-Received: by 2002:a5d:598f:0:b0:382:3cb8:bd4c with SMTP id ffacd0b85a97d-3823cb8c05bmr3225712f8f.12.1731850124992;
        Sun, 17 Nov 2024 05:28:44 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38229b6e2fasm6282015f8f.40.2024.11.17.05.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 05:28:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v7 1/4] net: dsa: add devm_dsa_register_switch()
Date: Sun, 17 Nov 2024 14:27:56 +0100
Message-ID: <20241117132811.67804-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241117132811.67804-1-ansuelsmth@gmail.com>
References: <20241117132811.67804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_052846_821774_A5C88174 
X-CRM114-Status: GOOD (  11.96  )
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

Some DSA driver can be simplified if devres takes care of unregistering
the DSA switch. This permits to effectively drop the remove OP from
driver that just execute the dsa_unregister_switch() and nothing else.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/net/dsa.h |  1 +
 net/dsa/dsa.c     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 72ae65e7246a..c703d5dc3fb0 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -1355,6 +1355,7 @@ static inline void dsa_tag_generic_flow_dissect(const struct sk_buff *skb,
 
 void dsa_unregister_switch(struct dsa_switch *ds);
 int dsa_register_switch(struct dsa_switch *ds);
+int devm_dsa_register_switch(struct device *dev, struct dsa_switch *ds);
 void dsa_switch_shutdown(struct dsa_switch *ds);
 struct dsa_switch *dsa_switch_find(int tree_index, int sw_index);
 void dsa_flush_workqueue(void);
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 5a7c0e565a89..aca6aee68248 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -1544,6 +1544,25 @@ int dsa_register_switch(struct dsa_switch *ds)
 }
 EXPORT_SYMBOL_GPL(dsa_register_switch);
 
+static void devm_dsa_unregister_switch(void *data)
+{
+	struct dsa_switch *ds = data;
+
+	dsa_unregister_switch(ds);
+}
+
+int devm_dsa_register_switch(struct device *dev, struct dsa_switch *ds)
+{
+	int err;
+
+	err = dsa_register_switch(ds);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_dsa_unregister_switch, ds);
+}
+EXPORT_SYMBOL_GPL(devm_dsa_register_switch);
+
 static void dsa_switch_remove(struct dsa_switch *ds)
 {
 	struct dsa_switch_tree *dst = ds->dst;
-- 
2.45.2


