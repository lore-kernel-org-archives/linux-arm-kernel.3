Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E687C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/W0x52D15NfB+BOP8T/m/ZC7owLNeVqs+BHfnihvT0=; b=0XKSs+ZkYlMuzzmDEaxvnD+WVw
	m+yAdvFjJAtVXylNoKOFkLMsfO7ACv5f1o9b/mmUhnqLMIj6MMLrrzM+4Y90U2IgNqeb3j1GFkvsn
	ofUmbyU3H3AvIB5CyRlJaIkSydRC1JVR16zyJtfAeECU2cc6ahGOe6Hs8g++lCBsmEf75Fcc3GTWp
	Pch8cb4km0+z6Iqv+Ww6MTzngzk2zeK1X+m1xAcTlMXataqY80jJfdEgh/jdRfxLEv3eEQvnwyfOw
	ruWdxkXagzdUEsY9IL4FHKBdax23AfK44pE/7gQfpj03Jgk5IbEUr+RYX2/Z8aUkmh0a3S+p/ni8N
	u3iYspdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwCw-0000000D4xD-2dpe;
	Thu, 26 Jun 2025 23:40:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4q-0000000CpDR-2xjl;
	Thu, 26 Jun 2025 21:24:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so9057405e9.3;
        Thu, 26 Jun 2025 14:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750973051; x=1751577851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/W0x52D15NfB+BOP8T/m/ZC7owLNeVqs+BHfnihvT0=;
        b=bOSMkwzP4C68lLAs306QYY4C2oRSYz5tU85X9pL9TncQdb6qB/p+hgxHQsgJUpd1KM
         YGFiLJD2qgjzakvKhy1PTGZ7pICOFz4kISD06UKNT+uxq7Q9I4ymQ2NMA9gFaf9NriBO
         p4Rjp8tv48oVSWMDe6YMGKo48t/opu+iOjWpRLJXIRFTVyn+ZYrBDvBRFkp+bqIWjncK
         /ivyqngczMvJvENzlSYxXxNTFRYz5X+gC7h+1RSMFnwgt7jrIggE4C/uLqk3xELAXP6W
         zBJ9kvjMrucbb60GppUJIHGR22fRoo1ObOZ5DMxju5fV/I7Yu1QiOmKSInvVM26Z14oR
         7xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750973051; x=1751577851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/W0x52D15NfB+BOP8T/m/ZC7owLNeVqs+BHfnihvT0=;
        b=dCNPk2ptm/ACsYTxdhRyRuLrdiLSI0ucNvJOaM4eULnwFhJQlV/QTlrZV3yTxKOFrY
         UwtwJqUG8k5tBugEPjGg0WWyr+Vb6LxnRro7BmgtMWtE7EjFToTTKcoXP8blXpcddG+e
         nAMTgQujOhtwVhY6hEzM6pH0oLgFcOB6N0Jgs0u41xXRSRR/GPUnXaImR+XaExsRWEmP
         QyVuJNhDrIMCMVMhyQakmcdVUXz/3rbY0lF3AojCT5knlYCP4A4jRIDhfy9QZ6eOZOeU
         dsPDVgoZrsUBEthv5LkW1tOmmLyXeVu86W7Epvgtnt5pXHagkCuTTwvLo3MLz6345rTW
         uJfg==
X-Forwarded-Encrypted: i=1; AJvYcCV1J7o829UIKq/h7AvPZyZ9wXAi6z0AD1/s8u2/g25j31Pk0iNKrV5gOiwQ72MBkqw3WyArUnKzGgGobpbkDI8=@lists.infradead.org, AJvYcCX68MqQXldtqo/+WDzOyh95W7qbGcYQK6HayMs5d1gaovgi2rAKgJY8MJpzKl/w8LzU+udGXGe85AsnF+h4NCzz@lists.infradead.org
X-Gm-Message-State: AOJu0YzwjnsVhayIwI6qkxsUmrNrtVTEBzBLlzMvw68Z5QjSwsjirBYi
	dEW49dggm2GNyOG7z16ia+buh4U4bifWOe/NzFCynpwdmnKd/443852J
X-Gm-Gg: ASbGncsvDI4+1exODbWBB49Oa6YhVQmqxyTph3E5kBnQuotV8P4+oQ1VwG1uvKD5JQS
	F5AdsY3cGBG1BnCTsvOwCIsi+fd6O1DquGUvJrseSd3SCQvSNNnVAlO2BKfq97HYfqVqohXSR3j
	MoIV8CrWOiSEUybJxqHWQ4ErrxC5hqsLip5ygB6rnqSpX+1mFZVKs99pejNnge1ibOqHG1TPUXl
	uzG79E/NIsCmLtmeGPi1HiUfQyxcpcBgbbc7BadRNU3IcAkXBOvQby8tjuplbrXvHzz0pfF2uv5
	HYwPLlTz4++vYPRhef992JyjL0HzidHazDWAmK83BEdgU/Pw7oRJwgStnqFXi3QG9+bpfTMAvX3
	uZRBqYSb8pkQY+0DGxkcbu34KWFvMSuU=
X-Google-Smtp-Source: AGHT+IHVLPfvW6O1oNCC2LT9oj+Qg1mkz0+DDsJBKHwZ+LBvaK0h+vlqLp0ai9AzKkbhD2TEc+EdQA==
X-Received: by 2002:a05:600c:4750:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4538ee30effmr9653155e9.3.1750973051054;
        Thu, 26 Jun 2025 14:24:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm57186475e9.10.2025.06.26.14.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 14:24:10 -0700 (PDT)
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
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v15 12/12] net: dsa: tag_mtk: add comments about Airoha usage of this TAG
Date: Thu, 26 Jun 2025 23:23:11 +0200
Message-ID: <20250626212321.28114-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250626212321.28114-1-ansuelsmth@gmail.com>
References: <20250626212321.28114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_142412_744453_805D7106 
X-CRM114-Status: GOOD (  12.36  )
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


