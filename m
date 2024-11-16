Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F80FD68BDC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S600OQ5nFPGkJIjgZj3AtisZep3gO6DhgEu5beaHtE=; b=Sr6Dg9zC+7rLEXkzx4R/aiSce1
	diHp9piFXfZXeP52aGCchoBzHZSpPEFUI1aZc7FH/MjGI9qx767tyZ19LmvIEpAW5ZJhfp5JT3TtX
	DhcEpJSE9ayKvtYc1RgnXnD9fJI5COm883bm/ai5eodwC9mOkxKHHfShUqVDdsb1pjwhEVKog4Gx5
	QX5pRk7WrxobLC6J4/CkwLzjCTt9O3bgQglVSBivx1b1J6+GL1QyqwJ17WvcH+E1v2bKyFhE0szdn
	yOZzz0MStsTaAvH2dYKuJBg05CtHA984lccazUL3bh5MvTTM01uvKxsIVe8G6GeAxDalWTTFjMTAq
	xJTgTbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCIe6-00000005dKX-2kda;
	Sat, 16 Nov 2024 13:15:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCIcH-00000005cpk-2sAs;
	Sat, 16 Nov 2024 13:13:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43163667f0eso4767585e9.0;
        Sat, 16 Nov 2024 05:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731762812; x=1732367612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S600OQ5nFPGkJIjgZj3AtisZep3gO6DhgEu5beaHtE=;
        b=RPJNqpAvvk9xIZjPRfhUuXXiTIWJCQ+u3tNuwCeEhhm5fPx3bm9qEzLs0xj+W/E7OM
         TxIr8McMpEAamkXCQI9VeezFCIKP0QTFtlmcrc4lxqIhaDUsPIQNj8dvJyMBCOv/D8qY
         FNr/sdCN/m7VU8XrvMjKj3WnKiKL6mLgxDdUH9rMZCQEMd9wjMSgFkUB4miiPuFSMYWj
         asO7r19BePDi5NZN1XPmUUui3NA8KG3qe5oQcbgJQQ5SLNnOf6kI65+U+jKItKLwu2T/
         q+INRxUMYgO3tgj0yUOzBPaaMoZjwaxl8tNg+rQaoTo11bO7K2Va2msNFVtpW0jPaFfq
         xBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731762812; x=1732367612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S600OQ5nFPGkJIjgZj3AtisZep3gO6DhgEu5beaHtE=;
        b=nUSbQFXPLQwo7QVIA1lvW5A1s0vStCbInCCJamvCMGBF18MthXWQ/1Z1i5TDhQnFAm
         /ylyGFYwzYUhgfpzlxXQbFamk00ec4S4inatphuT8z8cWMxETW/DA0TP+E+o2FMLhGga
         k4EkWH81vhIUcx1oK0SlG0FXWNZEyw/v1wo/Hm4kuqxVys43pk3s+RijLZsDO0c6QpXH
         T+/tBOSpEFUW5opYrgGpVXSVyNZSVsWHnU4NL6uj1xqARVyvHTERVRBFjRqvp1W1Ql6E
         wOkg9lJBx6H2btmdmOU/9zsNhrNNfVzUSn6Sv3qG6RncRyJDux5X1YRHHWGAQYEdRZ1+
         Vbkg==
X-Forwarded-Encrypted: i=1; AJvYcCUtTgg9/Rl4d2qZ/m3Av23/4v5tgbLagY6FF4MVQmXDmSxp4lCxu8f69XuhnayITBDMc+AQonIPtJkDvc/B20o=@lists.infradead.org, AJvYcCVlzxG7lhHTGdbfb1PZJe+xshP4FZ+dK2Ptu9fnQt6Ka6oHPWbKQsBFv73C0gQ1ssK6T3bTMc9kGohjcFxjIJMz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0xa8b06omnpfVqRDP2r2K6eO851VsjdurPREUjf+Bqna7ujas
	KTrOJ9xhlFN01eorhOmRVgOyuZ327pkEJDUYyzgOQdc85KTGJ97q
X-Google-Smtp-Source: AGHT+IEPsaR+6e5r/v93HgKGecv+hspAsvfCMy3BdQXtK9fCxOVvt+14+FJzR41Vt6epI2YQyINaJw==
X-Received: by 2002:a05:600c:5021:b0:42c:bf94:f9a6 with SMTP id 5b1f17b1804b1-432df77a991mr46347325e9.26.1731762811932;
        Sat, 16 Nov 2024 05:13:31 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432dab7206csm87459595e9.7.2024.11.16.05.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 05:13:31 -0800 (PST)
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
Subject: [net-next PATCH v6 1/4] net: dsa: add devm_dsa_register_switch()
Date: Sat, 16 Nov 2024 14:12:46 +0100
Message-ID: <20241116131257.51249-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241116131257.51249-1-ansuelsmth@gmail.com>
References: <20241116131257.51249-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_051333_725961_9A939AAD 
X-CRM114-Status: GOOD (  12.48  )
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
index 5a7c0e565a89..5cf1bac367ca 100644
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
+EXPORT_SYMBOL_GPL(dsa_register_switch);
+
 static void dsa_switch_remove(struct dsa_switch *ds)
 {
 	struct dsa_switch_tree *dst = ds->dst;
-- 
2.45.2


