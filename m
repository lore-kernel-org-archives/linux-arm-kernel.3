Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DF9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/W0x52D15NfB+BOP8T/m/ZC7owLNeVqs+BHfnihvT0=; b=ceippAhBqL8sxWQWZVRWxCSlaJ
	KetV0evOo0Mt0V3LYD8NVi71CD6F9i3D7toXTqTlc+YbfAzitzu74f7RvWYA/G4OpSRjSRnFZ1vok
	xjkVLHh2uEJGlwFOXK/WAb6F/yBrHsQdD7sHi0ldf5Dx+CpWAfmdmdAtYD7DJyYDMri3TzuwNEo0v
	dJR4NWAFZ0TX82gHwrqUnMKW9ZX7mCp09RlmlaPHbWvv4I4BVBbWZkClkO4McPEQHrZPV2oTZv0BM
	KmHI8/W7nRs7LKdqBYr/dLZqL3FeE/ytuUAiWbgRQJmqIFNZ3kneymQW/uMawgg4JYdjN0h3ThPXq
	cUlwoH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u266R-00000003deI-2oLx;
	Tue, 08 Apr 2025 10:22:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25dF-00000003WEb-3nlx;
	Tue, 08 Apr 2025 09:52:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so46538505e9.1;
        Tue, 08 Apr 2025 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105956; x=1744710756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/W0x52D15NfB+BOP8T/m/ZC7owLNeVqs+BHfnihvT0=;
        b=gfoVPyIDAArtJJUJIxAP/8QjjDSRgZb/0JRtdp5fDi8MnwvSWkXvNBw0rO8ZGMhjqh
         DPfgypmT6iu081coibbGKiUWQJu4sUSKpMYIJpHeMPlxPJkpsOBXzVk/1ju+qHbuzzuj
         8POapGopbV/uR0EjdcSTbEz/CGnIq04ariydRWLkTb5U4fXds1GIdC84cVdJrzf6ZxTl
         m5Bo5F5QqQz9OVXcW2J0dIOaoJowtG4DH/wBqtRMVSd8SoPxHXrDlQKdoN/2sULDBbMo
         L2j7Bl00Swx3vrZZ5syBrarZjxhXFvVAhw2pZRhliU2NyonIjUYrST+VIeHWE69r/Bi6
         jWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105956; x=1744710756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/W0x52D15NfB+BOP8T/m/ZC7owLNeVqs+BHfnihvT0=;
        b=XAorfzXUCt3d/Cav+K7/PxI/c6DTe99vvDGu6robjPvNkMWoWsf1OR1ZONRVtC3KsJ
         iUg5kQkAcSP+3IvgH63R9N4De0osxEzL18oY2I0o1RovrTAuKnvjOS6kavEVJ05gUryM
         eG2Em/Hzh+ylfl049oxxfgVT7kBMTv5stu7IinQjYA9AS5yAb5rUlfaTqoNJ5afL2NQh
         9jUhkIwWfCqh8mzXqKbvs3pELSNYQ36H0cVT23Pm6Nh2oQEG1UySQaj96r+ej9xM6Em4
         bQPazv6MB1AthVhvHjMrKb8SJMs63UmPDeiRDTFN0Hyr90dDlTYjRbWRRskbHQTvXbxl
         1grg==
X-Forwarded-Encrypted: i=1; AJvYcCXT3q/rNo+I4tE5OJkRZo86hd7btWXcudkyyw2YShwdpzuwsp6vTMwEZI1SnUD/pCa1vhQhj3feQ9EEicHBW+VL@lists.infradead.org, AJvYcCXktO6WQ95czAeQO+xZYRIhafAuDurbxUkyCIFYW7qBllFoTIN1cyWsj8C3M/BfAqr9LkjI2UHbQP4da01ZCnw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3a37p5Aa4wwyg9vNFkRAx2hQKMiDRy8SKCpmN6Cx7RdqMCOJR
	aB4i61GyFTQJvf/9Rqh0OvN1673/DsXo5nM9YtLocVtRgMyaudkJ
X-Gm-Gg: ASbGnctdKV0f2JO3wgX+sitef48vk6PR7YuUStFYwPgr9wJuzw0qEf5YrzOHFldnVyV
	ogME9VEKdN2pb7lAz/ljLlkpAKjYSwuHlrBpTwRYTkiABao5bHMni9vYwGckG1/jRSJA5sgVd2O
	x8oLFKUWmkpYHL0kCFOFnWG6+aqIiKcoFyWEpb40XpoWE1Zbz95sECI7gGfOvtDaC70J0AYMTkR
	PxZ6OKr77r57RomxbSBdGYdKFKdtZANTZN7Eg6/o/xMxoI5xSGoLyfxTFAxUWllHwON/3C07/zT
	Ids6pSk5/enkrpQzyj3sVNeDUKHbnvNUwipMgCx1APQWDa8S/iYK9gMQwrDt5JFpmglFegXl+4C
	9eZmZ4YBwyrTzTw==
X-Google-Smtp-Source: AGHT+IHnIRihboK4mhsVHOwL3IqceZiuQzPsMe0EptmYYIze/kCrhf/3JVkvsqSSB53X5rHEN/sF5A==
X-Received: by 2002:a05:600c:1c17:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43ee063fbc7mr115902005e9.8.1744105956238;
        Tue, 08 Apr 2025 02:52:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 16/16] net: dsa: tag_mtk: add comments about Airoha usage of this TAG
Date: Tue,  8 Apr 2025 11:51:23 +0200
Message-ID: <20250408095139.51659-17-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025237_958591_3F794DDA 
X-CRM114-Status: GOOD (  12.92  )
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

Add comments about difference between Airoha AN8855 and Mediatek tag
bitmap.

Airoha AN88555 doesn't support controlling SA learning and Leaky VLAN
from tag. Although these bits are not used (and even not defined for
Leaky VLAN), it's worth to add comments for these difference to prevent
any kind of regression in the future if ever these bits will be used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 net/dsa/tag_mtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index b670e3c53e91..ac3f956abe39 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -18,6 +18,9 @@
 #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
+/* AN8855 doesn't support SA_DIS and Leaky VLAN
+ * control in tag as these bits doesn't exist.
+ */
 #define MTK_HDR_XMIT_SA_DIS		BIT(6)
 
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
-- 
2.48.1


